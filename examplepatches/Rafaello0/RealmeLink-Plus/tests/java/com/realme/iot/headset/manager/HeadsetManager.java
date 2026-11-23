package com.realme.iot.headset.manager;
public class HeadsetManager {
 private static final HeadsetManagerProxy INSTANCE = new HeadsetManagerProxy();
 public static HeadsetManagerProxy getInstance(){return INSTANCE;}
}
