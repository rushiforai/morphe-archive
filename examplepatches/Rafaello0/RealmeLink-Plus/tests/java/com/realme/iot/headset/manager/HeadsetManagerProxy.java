package com.realme.iot.headset.manager;
import com.realme.iot.common.devices.Device;
import com.realme.iot.headset.contract.bean.SettingsInfo;
import com.realme.iot.headset.contract.callback.ISettingsCallback;
import java.util.HashMap;
import java.util.Map;
public class HeadsetManagerProxy {
 public final Map<String,Integer> actual = new HashMap<>();
 public int writes,reads;
 private String key(Device d,int t,int k){return d.getMac().replace(":", "").toUpperCase()+":"+t+":"+k;}
 public boolean isDeviceConnected(Device dev){return dev!=null;}
 public void J3(Device dev,SettingsInfo s,ISettingsCallback cb) {
  writes++;
  actual.put(key(dev,s.getSettingType(),s.getSettingKey()), s.getSettingValue());
 }
 public void x(Device dev,int type,int k,ISettingsCallback cb){
  reads++;
  cb.a(dev,0,new SettingsInfo(type,k,actual.getOrDefault(key(dev,type,k),-1)));
 }
}
