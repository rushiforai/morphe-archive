package com.realme.iot.headset.contract.callback;
import com.realme.iot.common.devices.Device;
import com.realme.iot.headset.contract.bean.SettingsInfo;
import java.util.List;
public interface ISettingsCallback {
 void a(Device dev,int code,SettingsInfo info);
 void b(Device dev,int code,List<SettingsInfo> data);
}
