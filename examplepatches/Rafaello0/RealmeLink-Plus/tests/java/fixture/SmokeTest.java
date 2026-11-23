package fixture;
import app.hxreborn.extension.realmelink.ModeKeeper;
import com.realme.iot.common.devices.Device;
import com.realme.iot.headset.activity.device.HeadsetDeviceActivity;
import com.realme.iot.headset.manager.HeadsetManager;
import com.realme.iot.headset.manager.HeadsetManagerProxy;
public class SmokeTest {
 private static void check(boolean v,String text){if(!v)throw new IllegalStateException(text);}
 public static void main(String[] args){
  HeadsetDeviceActivity a=new HeadsetDeviceActivity();
  ModeKeeper.initialize(a);ModeKeeper.enableNoiseControl();ModeKeeper.enableGameMode();
  Device bud=new Device("00:11:22:33:44:55");
  HeadsetManagerProxy m=HeadsetManager.getInstance();
  // Simulated UI writes learn settings; real headphones must still be tested.
  a.select(bud,12,2,0,1);
  a.select(bud,11,6,0,1);
  check(m.writes==0,"capture should not itself send commands");
  ModeKeeper.onDeviceReady(bud);
  check(m.writes==2,"both saved modes must be restored exactly once");
  check(m.actual.get("001122334455:2:0")==1,"ANC mismatch");
  check(m.actual.get("001122334455:6:0")==1,"Game Mode mismatch");
  ModeKeeper.onDeviceReady(bud);
  check(m.writes==2,"repeated connect must not flood commands");
  Device different=new Device("AA:BB:CC:DD:EE:FF");
  a.select(different,999,4,0,1);ModeKeeper.onDeviceReady(different);
  check(m.writes==2,"unknown UI row must be ignored");
  System.out.println("SMOKE PASS: saved modes, read-before-write, verify, cooldown, unknown rows");
 }
}
