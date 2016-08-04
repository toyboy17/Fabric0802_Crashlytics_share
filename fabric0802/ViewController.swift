//
//  ViewController.swift
//  fabric0802
//
//  Created by toyboy17 on 2016/8/3.
//  Copyright © 2016年 @ demand;. All rights reserved.
//

import UIKit
import Crashlytics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //以下為Crashlytics模擬按鈕實作，建立一個模擬app程式crash的按鈕
        let button = UIButton(type: UIButtonType.RoundedRect)
        //宣告一個測試用的button RoundedRect代表按鈕的預設樣式
        
        button.frame = CGRectMake(135, 300, 100, 30)
        //button在螢幕frame的位置，我們設定一個CGRectMake區塊的(x座標,y座標,寬度值,高度值)
        
        button.setTitle("Crash", forState: UIControlState.Normal)
        //button 的title名稱設定 setTitle "Crash"
        //UIControlState類別Normal樣式按鈕
        
        button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        //點按鈕，觸發action，selector選擇crashButtonTapped方法
        //forControlEvents的事件參數是UIControlEvents.TouchUpInside
        //按下按鈕後，後台偵測數字即會改變，用來確認偵測是否成功
        
        view.addSubview(button)//??

    }//我是viewDidLoad結束大括號
    
    @IBAction func crashButtonTapped(sender: AnyObject) {
        Crashlytics.sharedInstance().crash()
    
        //模擬器按鈕報錯Thread 1:EXC_BAD_INSTRUCTION(code=EXC_i386_INVOP, subcode=0x0)
        //xcode上方功能列Pooduct>Scheme>Edit Scheme 的Debug executable 取消勾選
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//Fabric app 步驟操作結束後的注意事項：This is FxxKing Wrong!!!
//Not seeing a crash in the dashboard?
//Double-check in your Build Settings that your Debug Information Format is “DWARF
//dsym黃色驚嘆號報錯：
//http://stackoverflow.com/questions/29209582/make-sure-your-project-build-settings-are-generating-a-dsym-file-debug-informat

////模擬器按鈕報錯Thread 1:EXC_BAD_INSTRUCTION(code=EXC_i386_INVOP, subcode=0x0)
//https://twittercommunity.com/t/no-crash-reports-on-latest-builds-and-no-callback-osx/69685

