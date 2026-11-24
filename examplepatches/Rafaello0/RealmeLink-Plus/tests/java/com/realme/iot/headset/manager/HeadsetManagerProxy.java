package com.realme.iot.headset.manager;
import com.realme.iot.common.devices.Device;
import com.realme.iot.headset.contract.bean.SettingsInfo;
import com.realme.iot.headset.contract.callback.ISettingsCallback;
import java.util.HashMap;
import java.util.Map;
import android.os.Handler;
import android.os.Looper;
import java.lang.ref.WeakReference;
import java.util.Arrays;
public class HeadsetManagerProxy {
 public final Map<String,Integer> actual = new HashMap<>();
 public int writes,reads;
 public long replyDelay;
 public boolean dropReplies, conflictingReplies;
 public int rejectedReads;
 private final Handler handler = new Handler(Looper.getMainLooper());
 private String key(Device d,int t,int k){return d.getMac().replace(":", "").toUpperCase()+":"+t+":"+k;}
 public boolean isDeviceConnected(Device dev){return dev!=null;}
 public void J3(Device dev,SettingsInfo s,ISettingsCallback cb) {
  writes++;
  actual.put(key(dev,s.getSettingType(),s.getSettingKey()), s.getSettingValue());
 }
 public void x(Device dev,int type,int k,ISettingsCallback cb){
  reads++;
  if(dropReplies)return;
  int code=rejectedReads>0?1:0;
  if(rejectedReads>0)rejectedReads--;
  int value=actual.getOrDefault(key(dev,type,k),-1);
  WeakReference<ISettingsCallback> ref=new WeakReference<>(cb);
  boolean conflict=conflictingReplies;
  handler.postDelayed(()->{
   ISettingsCallback callback=ref.get();
   if(callback==null)return;
   if(conflict)callback.b(dev,code,Arrays.asList(new SettingsInfo(type,k,value),new SettingsInfo(type,k,value+1)));
   else callback.a(dev,code,new SettingsInfo(type,k,value));
  },replyDelay);
 }
}
