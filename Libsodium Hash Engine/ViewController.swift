//
//  ViewController.swift
//  Libsodium Hash Engine
//
//  Created by Dat vu on 23/12/2022.
//

import UIKit
import Sodium

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cd 
        let filePath = "/Users/datvq/Desktop/Stuff/Libsodium Hash Engine/Libsodium Hash Engine/Two time pad attack.html"
        var bytes = [UInt8]()
        if let data = NSData(contentsOfFile: filePath) {
            var buffer: Array<UInt8> = Array(repeating: 0, count: data.length)
            data.getBytes(&buffer, length: data.length)
            bytes = buffer
        }
        
        let sodium = Sodium()
//        let message1 = "My Test".bytes
//        let message2 = "Message".bytes
        let key = "Secret key".bytes
        let stream = sodium.genericHash.initStream(key: key)!
        stream.update(input: bytes)
//        stream.update(input: message2)
        let h = stream.final()
        
        if let hashed = h {
            let data = Data(bytes: hashed, count: hashed.count)
            print(data.base64EncodedString())
        } else {
            print("not a valid UTF-8 sequence")
        }
    }


}

