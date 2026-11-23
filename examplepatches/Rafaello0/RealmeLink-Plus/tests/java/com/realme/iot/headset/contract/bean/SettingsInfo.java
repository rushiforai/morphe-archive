package com.realme.iot.headset.contract.bean;
public class SettingsInfo {
 private final int type,key,value;
 public SettingsInfo(int type,int key,int value){this.type=type;this.key=key;this.value=value;}
 public int getSettingType(){return type;}
 public int getSettingKey(){return key;}
 public int getSettingValue(){return value;}
}
