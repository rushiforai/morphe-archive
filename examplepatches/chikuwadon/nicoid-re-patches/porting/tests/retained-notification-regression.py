"""Exercise the actual notification bridge against deterministic Android boundaries."""
from pathlib import Path
import subprocess
import tempfile

source = Path(__file__).resolve().parents[2] / "porting/revisions/v1.11.0/java/e/e/a/Dev140.java"
fixtures = {
    "android/content/Intent.java": """package android.content;
import java.util.*;
public class Intent {
 public static final int FLAG_ACTIVITY_NEW_TASK=0x10000000, FLAG_ACTIVITY_NO_ANIMATION=0x10000;
 private Map<String,Object> extras=new HashMap<>();
 private String data;
 public boolean hasExtra(String key){return extras.containsKey(key);}
 public void removeExtra(String key){extras.remove(key);}
 public String getStringExtra(String key){return (String)extras.get(key);}
 public Intent putExtra(String key,String value){extras.put(key,value);return this;}
 public Intent replaceExtras(Intent value){extras=new HashMap<>(value.extras);return this;}
 public Intent setFlags(int flags){return this;}
 public String getData(){return data;}
 public Intent setData(String data){this.data=data;return this;}
}""",
    "android/app/Activity.java": """package android.app;
import android.content.Intent;
public class Activity {
 public final Intent intent=new Intent(); private boolean finishing;
 public Intent getIntent(){return intent;}
 public void finish(){finishing=true;}
 public boolean isFinishing(){return finishing;}
}""",
    "android/app/Service.java": "package android.app; public class Service {}",
    "android/util/Log.java": """package android.util; public class Log {
 public static int w(String tag,String message,Throwable problem){return 0;}
 public static int d(String tag,String message){return 0;}
}""",
    "com/sauzask/nicoid/NicoidPopupViewService.java": """package com.sauzask.nicoid;
public class NicoidPopupViewService extends android.app.Service { public Object e=new Object(); }""",
    "e/e/a/BridgeTest.java": """package e.e.a;
import android.app.*;
import android.content.Intent;
import com.sauzask.nicoid.NicoidPopupViewService;
class MediaControls { static Object active; }
class Dev139 { static void remember(Object video){} }
class PopupReturn244 {
 static Activity target;
 static boolean matches(Activity activity){return target==activity;}
}
class Dev111 {
 static int opened;
 static void notificationReturnOpened(){opened++;}
 static boolean cancelPendingReturn(Activity activity){
  if(!PopupReturn244.matches(activity))return false;
  PopupReturn244.target=null;activity.finish();return true;
 }
}
class Dev115 {
 static boolean pending, unready; static int launches;
 static boolean seamlessReturn(Object service){
  if(unready)return false;
  if(pending)return true;
  Intent prepared=new Intent().putExtra("nicoid_popup_return_244","1").setData("watch");
  if(!Dev140.consumeLaunch((Service)service,prepared))launches++;
  pending=true;
  return true;
 }
}
public class BridgeTest {
 static final String TOKEN="nicoid_popup_return_244";
 static int checks;
 static class State { Object owner=new NicoidPopupViewService(); }
 static class Fragment { Activity A1; Fragment(Activity activity){A1=activity;} }
 static void check(boolean ok,String reason){checks++;if(!ok)throw new AssertionError(reason);}
 static Activity tap(State state){
  Activity activity=new Activity();
  Dev140.markNotification(state,activity.intent);
  return activity;
 }
 public static void main(String[] args){
  State state=new State();MediaControls.active=state;
  Activity target=tap(state);
  check(Dev140.prepare(target)&&target.intent.hasExtra(TOKEN),"existing screen takes prepared handoff");
  check("watch".equals(target.intent.getData())&&Dev115.launches==0&&Dev111.opened==1,"no second Activity");
  check(!Dev140.isNotificationDispatch(),"scoped destination cleared");
  Activity duplicate=tap(state);
  check(!Dev140.prepare(duplicate)&&duplicate.isFinishing()&&Dev111.opened==1,"duplicate target is closed");
  Activity stale=tap(state);MediaControls.active=new State();
  check(!Dev140.prepare(stale)&&stale.isFinishing(),"old notification cannot use new playback");
  MediaControls.active=state;Dev115.unready=true;
  Activity unready=tap(state);
  check(!Dev140.prepare(unready)&&unready.isFinishing(),"unready decoder does not open normal screen");
  Activity ordinary=new Activity();
  check(Dev140.prepare(ordinary)&&!Dev140.abortFailedReturn(new Fragment(ordinary)),"ordinary playback preserved");
  Activity expired=new Activity();expired.intent.putExtra(TOKEN,"expired");
  check(!Dev140.prepare(expired)&&expired.isFinishing(),"expired Activity token cannot start another load");
  PopupReturn244.target=target;
  check(Dev140.abortFailedReturn(new Fragment(target))&&target.isFinishing(),"failed adoption cancels the target");
  check(!Dev140.consumeLaunch((Service)state.owner,new Intent().putExtra(TOKEN,"2")),"mini-bar launch preserved");
  Activity completed=new Activity();completed.intent.putExtra(TOKEN,"complete");
  PopupReturn244.target=completed;
  Dev140.retireReturnToken(completed);
  check(completed.intent.hasExtra(TOKEN),"pending return token stays valid");
  PopupReturn244.target=null;Dev140.retireReturnToken(completed);
  check(!completed.intent.hasExtra(TOKEN)&&Dev140.prepare(completed),"completed Activity may be recreated");

  System.out.println("Retained notification bridge: "+checks+" assertions passed");
 }
}""",
}

with tempfile.TemporaryDirectory(prefix="retained-notification-") as directory:
    root = Path(directory)
    for name, contents in fixtures.items():
        destination = root / name
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_text(contents, encoding="utf-8")
    subprocess.run(["java", "com.sun.tools.javac.Main", "--release", "8", "-d", directory,
                    str(source), *map(str, sorted(root.rglob("*.java")))], check=True)
    subprocess.run(["java", "-cp", directory, "e.e.a.BridgeTest"], check=True)
