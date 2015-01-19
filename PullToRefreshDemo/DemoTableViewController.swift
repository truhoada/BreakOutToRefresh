//
//  DemoTableViewController.swift
//  PullToRefreshDemo
//
//  Created by dasdom on 17.01.15.
//  Copyright (c) 2015 Dominik Hauser. All rights reserved.
//

import UIKit

class DemoTableViewController: UITableViewController {
  
  var refreshView: PullToRefreshView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let refreshHeight = CGFloat(100)
    refreshView = PullToRefreshView(scrollView: tableView)
    refreshView.delegate = self
    
    tableView.addSubview(refreshView)
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 10
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("DemoCell", forIndexPath: indexPath) as UITableViewCell
    
    cell.textLabel?.text = "\(indexPath.row)"
    
    return cell
  }
  
  @IBAction func stopRefreshing(sender: UIBarButtonItem) {
    refreshView.endRefreshing()
  }
}

extension DemoTableViewController: UIScrollViewDelegate {
 
  override func scrollViewDidScroll(scrollView: UIScrollView) {
    refreshView.scrollViewDidScroll(scrollView)
  }
  
  override func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    refreshView.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
  }
  
  override func scrollViewWillBeginDragging(scrollView: UIScrollView) {
    refreshView.scrollViewWillBeginDragging(scrollView)
  }
}

extension DemoTableViewController: RefreshViewDelegate {
  
  func refreshViewDidRefresh(refreshView: PullToRefreshView) {
    
  }

}