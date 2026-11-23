package com.realme.iot.headset.activity.device;
import fixture.FakeContext;
import app.hxreborn.extension.realmelink.ModeKeeper;
import com.realme.iot.common.devices.Device;
import com.realme.iot.headset.contract.bean.SettingsInfo;
public class HeadsetDeviceActivity extends FakeContext {
 public static class Item {
  final int id;
  public Item(int id){this.id=id;}
  public int getTitleRes(){return id;}
 }
 public void select(Device dev,int titleId,int type,int key,int value){
  ModeKeeper.markUiAction(this,new Item(titleId));
  ModeKeeper.observeWrite(dev,new SettingsInfo(type,key,value));
 }
}
