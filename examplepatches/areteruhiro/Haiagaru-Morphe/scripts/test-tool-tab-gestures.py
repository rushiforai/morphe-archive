"""Exercise production touch routing with queued native completion and Android API fakes.

No phone/network is used. The fake recognizer intentionally delivers completion
after UP, like the inspected ChMate 191 recognizer. Native recognition accuracy
and native pane APIs still require Android/APK verification.
"""
from pathlib import Path
import subprocess
import tempfile
import os

ROOT = Path(__file__).resolve().parents[1]
JAVA = Path(os.environ.get("JAVA_HOME", "C:/Users/narum/jdk-21.0.9+10")) / "bin"
STUBS = {
    "android/content/Context.java": """
package android.content;
public class Context {
 public final SharedPreferences defaults=new SharedPreferences(), options=new SharedPreferences();
 public ClassLoader getClassLoader(){return getClass().getClassLoader();}
 public android.content.res.Resources getResources(){return new android.content.res.Resources();}
}
""",
    "android/content/SharedPreferences.java": """
package android.content;
import java.util.*;
public class SharedPreferences {
 public Map<String,Object> values=new HashMap<>();
 public boolean getBoolean(String k,boolean d){return (Boolean)values.getOrDefault(k,d);}
 public int getInt(String k,int d){return (Integer)values.getOrDefault(k,d);}
 public Map<String,?> getAll(){return values;}
}
""",
    "android/content/res/Resources.java": """
package android.content.res;
public class Resources {public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}}
""",
    "android/util/DisplayMetrics.java": "package android.util; public class DisplayMetrics {public float density=1;}",
    "android/util/Log.java": "package android.util; public class Log {public static int w(String t,String m,Throwable e){return 0;}}",
    "android/app/Activity.java": """
package android.app;
public class Activity extends android.content.Context {
 public boolean finishing,destroyed;
 public boolean isFinishing(){return finishing;}public boolean isDestroyed(){return destroyed;}
}
""",
    "android/os/Looper.java": "package android.os; public class Looper {public static Looper getMainLooper(){return new Looper();}}",
    "android/os/Handler.java": """
package android.os;
import java.util.*;
public class Handler {
 public static final Queue<Runnable> QUEUE=new ArrayDeque<>();
 public Handler(Looper l){}public boolean post(Runnable r){QUEUE.add(r);return true;}
 public static void drain(){while(!QUEUE.isEmpty())QUEUE.remove().run();}
}
""",
    "android/preference/PreferenceManager.java": """
package android.preference;
public class PreferenceManager {public static android.content.SharedPreferences getDefaultSharedPreferences(android.content.Context c){return c.defaults;}}
""",
    "android/view/ViewParent.java": "package android.view; public interface ViewParent {ViewParent getParent();}",
    "android/view/View.java": """
package android.view;
public class View implements ViewParent {
 public boolean shown=true,attached=true,focus=true;public ViewParent parent;
 public int x=0,y=0,width=1000,height=1000;public final android.content.Context context;
 public View(android.content.Context c){context=c;}
 public boolean isShown(){return shown;}public boolean isAttachedToWindow(){return attached;}
 public boolean hasWindowFocus(){return focus;}public int getWidth(){return width;}public int getHeight(){return height;}
 public void getLocationOnScreen(int[] p){p[0]=x;p[1]=y;}
 public ViewParent getParent(){return parent;}public android.content.res.Resources getResources(){return context.getResources();}
 public boolean post(Runnable r){return new android.os.Handler(android.os.Looper.getMainLooper()).post(r);}
 public boolean dispatchTouchEvent(MotionEvent e){return true;}public boolean dispatchKeyEvent(KeyEvent e){return false;}
 public void onWindowFocusChanged(boolean f){focus=f;}protected void onDetachedFromWindow(){attached=false;}
}
""",
    "android/view/MotionEvent.java": """
package android.view;
public class MotionEvent {
 public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,ACTION_POINTER_DOWN=5;
 public int action,pointers=1;public float x,y;public long down,time;public boolean recycled;
 public static MotionEvent obtain(long d,long t,int a,float x,float y,int meta){MotionEvent e=new MotionEvent();e.down=d;e.time=t;e.action=a;e.x=x;e.y=y;return e;}
 public static MotionEvent obtain(MotionEvent s){MotionEvent e=obtain(s.down,s.time,s.action,s.x,s.y,0);e.pointers=s.pointers;return e;}
 public int getActionMasked(){return action;}public int getPointerCount(){return pointers;}
 public float getX(){return x;}public float getY(){return y;}public float getRawX(){return x;}public float getRawY(){return y;}
 public long getEventTime(){return time;}public long getDownTime(){return down;}
 public void setAction(int a){action=a;}public void recycle(){if(recycled)throw new AssertionError("double recycle");recycled=true;}
}
""",
    "android/view/KeyEvent.java": """
package android.view;
public class KeyEvent {public static final int KEYCODE_BACK=4,ACTION_UP=1;public int getKeyCode(){return 0;}public int getAction(){return 0;}public boolean isCanceled(){return false;}}
""",
    "android/view/ViewConfiguration.java": """
package android.view;
public class ViewConfiguration {public static ViewConfiguration get(android.content.Context c){return new ViewConfiguration();}public int getScaledTouchSlop(){return 8;}public static int getLongPressTimeout(){return 500;}}
""",
    "android/widget/LinearLayout.java": """
package android.widget;
import android.view.*;import java.util.*;
public class LinearLayout extends ViewGroup {
 public final List<Integer> received=new ArrayList<>();
 public LinearLayout(android.content.Context c){super(c);}
 public boolean dispatchTouchEvent(MotionEvent e){received.add(e.getActionMasked());return true;}
}
""",
    "android/view/ViewGroup.java": """
package android.view;
import java.util.*;
public class ViewGroup extends View {
 public final List<View> children=new ArrayList<>();
 public ViewGroup(android.content.Context c){super(c);}
 public void addView(View v){children.add(v);v.parent=this;}
 public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}
}
""",
    "android/webkit/WebView.java": """
package android.webkit;
public class WebView extends android.view.View {
 public boolean back,forward;public int backs,forwards;
 public WebView(android.content.Context c){super(c);}
 public boolean canGoBack(){return back;}public boolean canGoForward(){return forward;}
 public void goBack(){backs++;}public void goForward(){forwards++;}
}
""",
    "app/morphe/extension/chmate/SettingsProfiles.java": """
package app.morphe.extension.chmate;
class SettingsProfiles {static android.content.SharedPreferences prefs(android.content.Context c){return c.options;}}
""",
    "app/morphe/extension/chmate/HaiagaruSettingsGestures.java": """
package app.morphe.extension.chmate;
class HaiagaruSettingsGestures {static String recognizerClassName(){return FakeRecognizer.class.getName();}}
""",
    "app/morphe/extension/chmate/NativeToolTabs.java": """
package app.morphe.extension.chmate;
class NativeToolTabs {
 static int closes,moves,offset,backs,forwards,newTabs;static NativeToolTabSwipeLayout expected;
 static void restoreToolVisibility(android.view.View v){}
 static boolean isArchiveFragment(Object f){return false;}
 static boolean isSelectedThreadTool(android.app.Activity a,Object f){return true;}
 static boolean closeCurrentTab(android.app.Activity a,Object f){
  if(expected.received.get(expected.received.size()-1)!=3)throw new AssertionError("close before child CANCEL");closes++;return true;
 }
 static boolean moveThreadTool(android.app.Activity a,Object f,int d){throw new AssertionError("legacy route while enabled");}
 static boolean moveAdjacentTool(android.app.Activity a,Object f,int d){moves++;offset=d;return true;}
 static boolean navigateTool(android.app.Activity a,Object f,boolean forward){if(forward)forwards++;else backs++;return true;}
 static boolean newBlankTab(android.app.Activity a,Object f){if(expected.received.get(expected.received.size()-1)!=3)throw new AssertionError("new tab before child CANCEL");newTabs++;return true;}
}
""",
    "app/morphe/extension/chmate/FakeRecognizer.java": """
package app.morphe.extension.chmate;
import android.view.*;import android.os.*;
public class FakeRecognizer {
 public interface Listener {void complete(int code,Object start,Object end);void preview();}
 public static int code=4,distance;public static boolean fail,synchronous;
 private final Listener listener;
 public FakeRecognizer(android.content.Context c,Listener l){listener=l;}
 public void distance(int d){distance=d;}
 public boolean touch(MotionEvent e){
  if(fail)throw new IllegalStateException("native error");
  if(e.getActionMasked()==MotionEvent.ACTION_UP){
   int result=code;
   if(synchronous)listener.complete(result,null,null);
   else new Handler(Looper.getMainLooper()).post(()->listener.complete(result,null,null));return true;
  }
  return false;
 }
}
""",
    "app/morphe/extension/chmate/ToolTabGesturesTest.java": """
package app.morphe.extension.chmate;
import android.app.*;import android.view.*;import android.os.*;
public class ToolTabGesturesTest {
 static int checks;static Activity host;static NativeToolTabSwipeLayout view;
 static void check(boolean b,String m){if(!b)throw new AssertionError(m);checks++;System.out.println("PASS "+m);}
 static void setup(){Handler.drain();host=new Activity();view=new NativeToolTabSwipeLayout(host,new Object());
  view.addView(new View(host));host.options.values.put(NativeToolTabChMateGestures.KEY,true);
  host.defaults.values.put("gestureCloseTab",4);NativeToolTabs.closes=NativeToolTabs.moves=NativeToolTabs.backs=NativeToolTabs.forwards=NativeToolTabs.newTabs=0;NativeToolTabs.expected=view;
  FakeRecognizer.code=4;FakeRecognizer.fail=false;FakeRecognizer.synchronous=false;
 }
 static void send(int a,long time,float x){MotionEvent e=MotionEvent.obtain(1000,1000+time,a,x,100,0);view.dispatchTouchEvent(e);e.recycle();}
 static void stroke(){send(0,0,100);send(2,40,60);send(1,100,20);}
 public static void main(String[] args){
  setup();host.options.values.clear();check(!NativeToolTabChMateGestures.enabled(host),"default OFF");
  setup();stroke();check(NativeToolTabs.closes==0&&!view.received.contains(1),"UP waits for queued native completion");Handler.drain();
  check(NativeToolTabs.closes==1&&view.received.contains(3),"asynchronous close after child CANCEL");
  setup();FakeRecognizer.synchronous=true;stroke();check(NativeToolTabs.closes==0,"synchronous native notification still defers tab removal");Handler.drain();check(NativeToolTabs.closes==1,"synchronous native completion also works");
  setup();check(NativeToolTabSwipeLayout.ownsHistoryGesture(view.getChildAt(0)),"enabled owns history before first DOWN");
  host.defaults.values.put("gesture",false);stroke();Handler.drain();check(NativeToolTabs.closes==0&&view.received.contains(1),"native global OFF preserves child UP");
  setup();host.defaults.values.clear();stroke();Handler.drain();check(NativeToolTabs.closes==0&&view.received.contains(1),"unassigned gesture preserves child UP");
  setup();host.defaults.values.clear();host.defaults.values.put("gestureBack",4);stroke();Handler.drain();
  check(NativeToolTabs.moves==0&&NativeToolTabs.closes==0&&NativeToolTabs.backs==1&&view.received.contains(3),"Back uses tool history, never adjacent tab");
  setup();host.defaults.values.clear();host.defaults.values.put("gestureForward",4);stroke();Handler.drain();check(NativeToolTabs.forwards==1&&NativeToolTabs.moves==0,"Forward uses tool history");
  setup();host.defaults.values.clear();host.defaults.values.put("gestureNewTab",4);stroke();check(NativeToolTabs.newTabs==0,"New tab waits beyond touch dispatch");Handler.drain();check(NativeToolTabs.newTabs==1&&NativeToolTabs.closes==0,"New tab uses native blank-tab entry");
  setup();host.defaults.values.clear();host.defaults.values.put("gestureNewTab",4);stroke();host.options.values.put(NativeToolTabChMateGestures.KEY,false);Handler.drain();check(NativeToolTabs.newTabs==0,"New tab is cancelled by option OFF");
  setup();host.defaults.values.clear();host.defaults.values.put("gestureLeftTab",4);stroke();Handler.drain();check(NativeToolTabs.moves==1&&NativeToolTabs.offset==-1,"explicit left-tab assignment");
  setup();host.defaults.values.clear();host.defaults.values.put("gestureRightTab",4);stroke();Handler.drain();check(NativeToolTabs.moves==1&&NativeToolTabs.offset==1,"explicit right-tab assignment");
  setup();host.defaults.values.put("gestureBack",4);stroke();Handler.drain();check(NativeToolTabs.closes==0&&view.received.contains(1),"conflicting native assignment does not close");
  setup();stroke();host.options.values.put(NativeToolTabChMateGestures.KEY,false);Handler.drain();check(NativeToolTabs.closes==0&&view.received.contains(3),"OFF before completion cancels operation");
  setup();stroke();view.onDetachedFromWindow();Handler.drain();check(NativeToolTabs.closes==0&&view.received.contains(3),"detach cancels pending UP");
  setup();stroke();view.onWindowFocusChanged(false);Handler.drain();check(NativeToolTabs.closes==0,"focus loss ignores late completion");
  setup();stroke();send(0,150,100);Handler.drain();check(NativeToolTabs.closes==0,"old listener cannot act on next touch");send(2,180,60);send(1,200,20);Handler.drain();check(NativeToolTabs.closes==1,"new touch still completes once");
  setup();send(0,0,100);send(3,50,60);send(1,100,20);Handler.drain();check(NativeToolTabs.closes==0,"CANCEL ends recognition");
  setup();send(0,0,100);send(5,40,60);send(1,100,20);Handler.drain();check(NativeToolTabs.closes==0,"multiple pointers leave child in control");
  setup();send(0,0,100);send(2,600,60);send(1,650,20);Handler.drain();check(NativeToolTabs.closes==0,"stationary long press does not become a tab gesture");
  setup();send(0,0,100);send(2,40,60);send(1,750,20);Handler.drain();check(NativeToolTabs.closes==1,"slow gesture after initial movement remains valid");
  setup();FakeRecognizer.fail=true;stroke();Handler.drain();FakeRecognizer.fail=false;stroke();Handler.drain();check(NativeToolTabs.closes==1,"recognizer failure recovers on next DOWN");
  setup();host.defaults.values.put("gestureLength",40);stroke();Handler.drain();check(FakeRecognizer.distance==40,"uses ChMate gesture sensitivity");
  setup();view.getChildAt(0).y=200;stroke();Handler.drain();check(NativeToolTabs.closes==0,"header controls do not start recognition");
  setup();stroke();host.destroyed=true;Handler.drain();check(NativeToolTabs.closes==0,"destroyed activity ignores completion");
  setup();stroke();host.defaults.values.put("gesture",false);Handler.drain();check(NativeToolTabs.closes==0,"native global OFF before completion cancels operation");
  setup();android.webkit.WebView browser=new android.webkit.WebView(host);view.addView(browser);
  check(!NativeToolTabHistory.navigate(view,false)&&browser.backs==0,"empty history reports root without navigating");
  browser.back=true;check(NativeToolTabHistory.navigate(view,false)&&browser.backs==1,"visible browser Back");
  check(!NativeToolTabHistory.navigate(view,true)&&browser.forwards==0,"Forward boundary is a no-op");
  browser.forward=true;check(NativeToolTabHistory.navigate(view,true)&&browser.forwards==1,"visible browser Forward");
  browser.shown=false;check(!NativeToolTabHistory.navigate(view,false),"hidden browser is ignored");
  browser.shown=true;browser.attached=false;check(!NativeToolTabHistory.navigate(view,false),"detached browser is ignored");
  System.out.println("PASS "+checks+" production touch-routing checks (fake Android/recognizer)");
 }
}
""",
}

with tempfile.TemporaryDirectory(prefix="haiagaru-tool-gestures-") as temporary:
    base = Path(temporary)
    for name, source in STUBS.items():
        path = base / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding="utf-8")
    sources = list(base.rglob("*.java"))
    for name in ("NativeToolTabChMateGestures", "NativeToolTabSwipeLayout", "NativeToolTabHistory"):
        sources.append(ROOT / "extensions/chmate/src/main/java/app/morphe/extension/chmate" / f"{name}.java")
    classes = base / "classes"
    subprocess.run([str(JAVA / "javac"), "-encoding", "UTF-8", "-d", str(classes), *map(str, sources)], check=True)
    subprocess.run([str(JAVA / "java"), "-cp", str(classes), "app.morphe.extension.chmate.ToolTabGesturesTest"], check=True)
