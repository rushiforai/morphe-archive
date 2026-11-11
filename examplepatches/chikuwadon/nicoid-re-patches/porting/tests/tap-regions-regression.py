"""Execute current normal and popup toggle bridges with Android boundary doubles."""
import ast
from pathlib import Path
import subprocess
import tempfile

repo = Path(__file__).resolve().parents[2]
revision = repo / "porting/revisions/v1.11.0"
old = ast.parse((repo / "porting/tests/regression155.py").read_text())
fixtures = ast.literal_eval(next(n.value for n in old.body if isinstance(n, ast.Assign)
                                and n.targets[0].id == "fixtures"))
del fixtures["e/e/a/Bridge155Test.java"]
fixtures.update({
    "android/content/Context.java": """package android.content;
    public class Context {public Context getApplicationContext(){return this;}}""",
    "android/content/SharedPreferences.java": """package android.content;
    public class SharedPreferences {
        String value="all"; OnSharedPreferenceChangeListener listener;
        public interface OnSharedPreferenceChangeListener {
            void onSharedPreferenceChanged(SharedPreferences prefs,String key);
        }
        public boolean seek, opening;
        public boolean getBoolean(String key,boolean fallback){return key.equals("popup_double_tap_seek")?seek:opening;}
        public String getString(String key,String fallback){return value;}
        public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l){listener=l;}
        public Editor edit(){return new Editor();}
        public class Editor {
            String key,next;
            public Editor putString(String k,String v){key=k;next=v;return this;}
            public Editor putBoolean(String k,boolean v){opening=v;return this;}
            public void apply(){value=next;if(listener!=null)listener.onSharedPreferenceChanged(SharedPreferences.this,key);}
        }
    }""",
    "android/preference/PreferenceManager.java": """package android.preference;
    public class PreferenceManager {
      public static final android.content.SharedPreferences PREFS=new android.content.SharedPreferences();
      public static android.content.SharedPreferences getDefaultSharedPreferences(android.content.Context c){return PREFS;}
    }""",
    "android/os/Looper.java": """package android.os;
    public class Looper {public static Looper getMainLooper(){return new Looper();}}""",
    "android/os/SystemClock.java": """package android.os;
    public class SystemClock {public static long now;public static long uptimeMillis(){return now;}}""",
    "android/os/Handler.java": """package android.os;import java.util.*;
    public class Handler {
        static Map<Runnable,Long> tasks=new LinkedHashMap<>();
        public Handler(Looper l){}
        public boolean postAtTime(Runnable r,long t){tasks.put(r,t);return true;}
        public void removeCallbacks(Runnable r){tasks.remove(r);}
        public static void advance(long t){
            SystemClock.now=t;
            for(Runnable r:new ArrayList<>(tasks.keySet()))
                if(tasks.containsKey(r)&&tasks.get(r)<=t){tasks.remove(r);r.run();}
        }
    }""",
    "android/view/ViewParent.java": "package android.view; public interface ViewParent {}",
    "android/view/SurfaceView.java": "package android.view; public class SurfaceView extends View {}",
    "android/view/TextureView.java": "package android.view; public class TextureView extends View {}",
    "android/util/DisplayMetrics.java": "package android.util; public class DisplayMetrics {public float density=1;}",
    "android/content/res/Resources.java": """package android.content.res;
    public class Resources {public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}}""",
    "android/app/Activity.java": """package android.app; public class Activity extends android.content.Context {
      public boolean isFinishing(){return false;}
      public android.view.Window getWindow(){return new android.view.Window();}
    }""",
    "android/view/Window.java": """package android.view; public class Window {
      public View getDecorView(){return new View();}
    }""",
    "android/util/Log.java": """package android.util; public class Log {
      public static final int DEBUG=3;
      public static boolean isLoggable(String tag,int priority){return false;}
      public static int i(String tag,String msg){return 0;}
      public static int d(String tag,String msg){return 0;}
      public static int w(String tag,String msg){return 0;}
      public static int w(String tag,String msg,Throwable error){throw new AssertionError(msg,error);}
    }""",
    "e/e/a/Dev112.java": """package e.e.a;
    class Dev112 {static boolean always, directControl;
      static Object staticCall(String type,String method,Class<?>[] arguments,Object... values){
        return method.equals("control")?directControl:always;
      }
      static Object get(Object value,String field)throws Exception{return value.getClass().getField(field).get(value);}
    }""",
    "e/e/a/Tap141Test.java": """package e.e.a;
    import android.app.Service;
    import android.os.Handler;
    import android.view.*;
    import android.preference.PreferenceManager;
    public class Tap141Test {
        static int checks;
        static void check(boolean ok,String name){checks++;if(!ok)throw new AssertionError(name);}
        public static class Controls extends View {public void hide(){shown=false;}
            public void hide(boolean delayed){if(delayed)throw new AssertionError();hide();}
            public boolean isVisible(){return shown;}}
        public static class Player extends ViewGroup {
            public final Controls controls=new Controls();
            public Player(){controls.shown=false;}
            public Controls getVideoControls(){return controls;}
            public Controls getVideoControlsCore(){return controls;}
            public void showControls(){controls.shown=true;}
        }
        public static class Owner extends Service implements View.OnTouchListener {
            public Player e=new Player();
            public int forwards, chromeChanges;
            public boolean chromeShown;
            public boolean a(int command){
                if(command==3)return chromeShown;
                chromeShown=command==2;
                chromeChanges++;
                return chromeShown;
            }
            public boolean onTouch(View view,MotionEvent event){forwards++;return false;}
        }
        public static class Host extends android.app.Activity {
            public final Fragment v=new Fragment(this);
            public final LocalFragment w=new LocalFragment(this);
            boolean local;
        }
        public static class Fragment {
            public final Host A1;
            public Player a0=new Player();
            public boolean x0,Q1;
            Fragment(Host host){A1=host;}
            public void j(int command){Q1=command==2;a0.controls.shown=Q1;}
        }
        public static class LocalFragment {
            public final Host A1;
            public View Z=new SurfaceView();
            public boolean A0,T1;
            LocalFragment(Host host){A1=host;}
            public void i(int command){T1=command==2;}
        }
        static void dispatch(Host host,MotionEvent event,boolean consumed){
            TapControls141.activityInput(host,event);
            if(consumed)return;
            TapControls141.activityTouch(host,event);
            if(event.getActionMasked()==0&&!Dev112.directControl) {
                TapControls141.nativeDown(host.local?host.w:host.v,event);
            }
        }
        static MotionEvent event(int action,long down,long at,float x){
            MotionEvent e=new MotionEvent(action,at,x,100);
            e.down=down;return e;
        }
        static void stream(View root,Owner owner,long time,float x){
            PopupTouch125.dispatch(root,owner,event(0,time,time,x));
            PopupTouch125.dispatch(root,owner,event(1,time,time+40,x));
        }
        static void normal(Host host,long time,float x){
            dispatch(host,event(0,time,time,x),false);
            dispatch(host,event(1,time,time+40,x),false);
        }
        static void mode(String value){
            PreferenceManager.PREFS.edit().putString(TapControls141.KEY,value).apply();
        }
        public static void main(String[] args){
            check(TapRegions141.parse(null).contains(50,50,100,100,0),"missing default");
            check(TapRegions141.parse("all").contains(0,50,100,100,0),"entire video");
            TapRegions141 edges=TapRegions141.parse("edges");
            check(edges.contains(15,50,100,100,0)&&edges.contains(85,50,100,100,0)&&!edges.contains(50,50,100,100,0),"edge boundaries");
            TapRegions141 center=TapRegions141.parse("center");
            check(center.contains(30,50,100,100,0)&&center.contains(70,50,100,100,0)&&!center.contains(71,50,100,100,0),"center boundaries");
            TapRegions141 custom=TapRegions141.parse("custom:0-12,34-52,48-75");
            check(custom.contains(50,50,100,100,0)&&custom.contains(70,50,100,100,0)&&!custom.contains(20,50,100,100,0),"overlapping union");
            check(custom.encode().equals("rects:0-12-0-100,34-52-0-100,48-75-0-100"),"round trip preserves three areas");
            for(String bad:new String[]{"", "bad", "custom:0-101","custom:45-45","custom:40-10","custom:0-1,2-3,4-5,6-7"})
                check(TapRegions141.parse(bad).mode==TapRegions141.ALL,"safe fallback "+bad);
            TapRegions141 vertical=TapRegions141.parse("top-bottom");
            check(vertical.contains(50,15,100,100,0)&&vertical.contains(50,85,100,100,0)
                    &&!vertical.contains(50,50,100,100,0),"top and bottom bands");
            TapRegions141 rects=TapRegions141.parse("rects:8-20-10-30,65-94-70-95,15-32-24-45");
            check(rects.contains(18,29,100,100,0)&&rects.contains(26,40,100,100,0)
                    &&!rects.contains(26,18,100,100,0),"rectangular union leaves intervening spaces");
            check(rects.encode().equals("rects:8-20-10-30,65-94-70-95,15-32-24-45"),"four coordinates round trip");
            check(TapRegions141.parse("rects:10-20-80-30").mode==TapRegions141.ALL,"reversed vertical bounds fallback");
            check(TapRegions141.parse("rects:0-1-0-1").contains(8,8,40,40,24),"popup minimum applies to both axes");
            TapRegions141 tiny=TapRegions141.parse("custom:0-1,85-86");
            check(tiny.contains(8,50,40,100,24)&&!tiny.contains(20,50,40,100,24),"minimum popup hit width stays local");
            check(!tiny.contains(8,50,40,100,0),"normal playback keeps exact percentages");

            ViewGroup root=new ViewGroup();Owner owner=new Owner();
            mode("edges");
            stream(root,owner,1000,500); Handler.advance(1341);
            check(!owner.e.controls.shown && owner.chromeChanges==0,"popup center blocks both control layers");
            stream(root,owner,1500,100); Handler.advance(1800);
            check(!owner.e.controls.shown,"popup single waits after first up");
            Handler.advance(1841);
            check(owner.e.controls.shown && owner.chromeShown,"popup confirmed edge opens both control layers");
            stream(root,owner,2000,500);Handler.advance(2341);
            check(owner.e.controls.shown && owner.chromeShown,"popup visible controls stay open for invalid tap");
            stream(root,owner,2500,100);Handler.advance(2841);
            check(!owner.e.controls.shown && !owner.chromeShown,"popup confirmed edge closes both control layers");
            PreferenceManager.PREFS.seek=true;
            stream(root,owner,3000,500);stream(root,owner,3160,502);Handler.advance(3600);
            check(PopupGestures.calls==1&&!owner.e.controls.shown,"popup center double seek unaffected");
            stream(root,owner,3800,100);stream(root,owner,3960,102);Handler.advance(4400);
            check(PopupGestures.calls==2&&!owner.e.controls.shown,"popup edge double seek has no first toggle");
            stream(root,owner,4500,100);
            PopupTouch125.cancel(owner);Handler.advance(4900);
            check(!owner.e.controls.shown,"popup pinch/hold cancellation drops deferred tap");
            stream(root,owner,5000,100);
            owner.e=new Player();Handler.advance(5400);
            check(!owner.e.controls.shown,"popup replacement never gets stale tap");
            ButtonStub.hit(root,owner);

            Host host=new Host();Player view=host.v.a0;
            view.x=200;view.w=600;
            TextureView render=new TextureView();render.x=250;render.w=500;
            view.children.add(render);
            normal(host,6000,500);Handler.advance(6341);
            check(!view.controls.shown,"normal center blocked against rendered video bounds");
            normal(host,6500,270);
            check(!view.controls.shown,"normal waits for seek timeout");
            Handler.advance(6841);
            check(view.controls.shown,"normal confirmed edge opens native controls");
            normal(host,7000,500);Handler.advance(7341);
            check(view.controls.shown,"normal outside tap cannot close visible controls");
            normal(host,7500,270);
            dispatch(host,event(0,7680,7680,270),true);
            dispatch(host,event(1,7680,7730,270),true);Handler.advance(7900);
            check(view.controls.shown,"upstream double tap cancels the first toggle");
            normal(host,8000,270);Handler.advance(8341);
            check(!view.controls.shown,"normal confirmed edge closes native controls");
            mode("center");view.x=50;view.w=300;view.children.clear();
            normal(host,8500,200);Handler.advance(8841);
            check(view.controls.shown,"rotated/resized video uses current area and dimensions");
            Dev112.always=true;
            normal(host,9000,200);Handler.advance(9341);
            check(view.controls.shown,"always-visible controls are not toggled");
            Dev112.always=false;
            Dev112.directControl=true;
            normal(host,9500,200);Handler.advance(9841);
            check(view.controls.shown,"play/pause and seek controls retain their events");
            Dev112.directControl=false;
            dispatch(host,event(0,10000,10000,200),false);
            dispatch(host,event(2,10000,10020,240),true);
            dispatch(host,event(1,10000,10040,200),false);Handler.advance(10341);
            check(view.controls.shown,"upstream swipe cancels candidate even if finger returns");
            dispatch(host,event(0,10500,10500,200),false);
            dispatch(host,event(5,10500,10520,200),true);
            dispatch(host,event(1,10500,10540,200),false);Handler.advance(10841);
            check(view.controls.shown,"second pointer cancels candidate");
            dispatch(host,event(0,11000,11000,200),false);
            dispatch(host,event(1,11000,11510,200),false);Handler.advance(11841);
            check(view.controls.shown,"hold does not toggle controls");
            normal(host,12000,200);view.w=400;Handler.advance(12341);
            check(view.controls.shown,"rotation before confirmation discards old tap");
            view.w=300;
            mode("custom:0-5,45-55,90-100");
            check(TapControls141.allows(view,200,100,false,false),"saved custom region active");
            mode("rects:30-70-60-80");
            view.y=100;view.h=200;
            check(TapControls141.allows(view,200,240,false,false)
                    &&!TapControls141.allows(view,200,160,false,false),"normal uses video-relative Y");
            Owner shifted=new Owner();shifted.e.x=100;shifted.e.y=200;shifted.e.w=300;shifted.e.h=200;
            check(TapControls141.allows(shifted.e,250,340,true,false)
                    &&!TapControls141.allows(shifted.e,250,240,true,false),"popup uses shifted video-relative Y");
            TapControls141.save(view.getContext(),TapRegions141.preset(TapRegions141.EDGES),true);
            check(TapControls141.openOnly(view.getContext()),"opening-only setting persists");
            view.x=0;view.y=0;view.w=1000;
            normal(host,13000,500);Handler.advance(13341);
            check(!host.v.Q1,"foreground outside closes in opening-only mode");
            normal(host,13500,500);Handler.advance(13841);
            check(!host.v.Q1,"foreground outside cannot open in opening-only mode");
            normal(host,14000,100);Handler.advance(14341);
            check(host.v.Q1,"foreground inside opens in opening-only mode");
            Host local=new Host();local.local=true;
            normal(local,14500,100);Handler.advance(14841);
            check(local.w.T1,"alternate local overlay opens with its native command");
            normal(local,15000,500);Handler.advance(15341);
            check(!local.w.T1,"alternate local overlay closes outside");
            Owner openOnlyPopup=new Owner();
            stream(root,openOnlyPopup,15500,500);Handler.advance(15841);
            check(!openOnlyPopup.chromeShown&&!openOnlyPopup.e.controls.shown,"popup outside does not open");
            stream(root,openOnlyPopup,16000,100);Handler.advance(16341);
            check(openOnlyPopup.chromeShown&&openOnlyPopup.e.controls.shown,"popup inside opens");
            stream(root,openOnlyPopup,16500,500);Handler.advance(16841);
            check(!openOnlyPopup.chromeShown&&!openOnlyPopup.e.controls.shown,"popup outside closes");
            TapControls141.save(view.getContext(),TapRegions141.preset(TapRegions141.ALL),false);
            check(TapControls141.settings(view.getContext()).mode==TapRegions141.ALL,"restore default persists");
            System.out.println("Single-tap regions and production bridges: "+checks+" assertions passed");
        }
        private static class ButtonStub {
            static void hit(ViewGroup root,Owner owner) {
                android.widget.Button button=new android.widget.Button();button.x=450;button.w=100;
                root.children.add(button);
                int forwarded=owner.forwards;
                boolean routed=PopupTouch125.dispatch(root,owner,event(0,5550,5550,500));
                check(!routed&&owner.forwards==forwarded,"direct control remains delegated in disabled region");
                root.children.clear();
            }
        }
    }"""
})
fixtures["android/view/View.java"] = fixtures["android/view/View.java"].replace(
    "public class View{", "public class View implements ViewParent{public boolean isAttachedToWindow(){return true;}"
    "public boolean hasWindowFocus(){return true;}public ViewParent parent;public ViewParent getParent(){return parent;}"
    "public android.content.res.Resources getResources(){return new android.content.res.Resources();}"
    "public boolean isClickable(){return clickable;}")
fixtures["android/view/MotionEvent.java"] = fixtures["android/view/MotionEvent.java"].replace(
    "int a;long t;", "int a;long t;public long down;"
    "public long getDownTime(){return down;} public void recycle(){}"
    "public static MotionEvent obtain(MotionEvent original){return original;}")

with tempfile.TemporaryDirectory(prefix="tap-regions-") as tmp:
    dest = Path(tmp)
    for name, source in fixtures.items():
        path = dest / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source)
    helpers = revision / "java/e/e/a"
    actual = [helpers / (name + ".java") for name in
              ("TapRegions141", "TapControls141", "PopupTouch125", "PopupTouchPolicy125")]
    subprocess.run(["java", "com.sun.tools.javac.Main", "-d", tmp,
                    *map(str, dest.rglob("*.java")), *map(str, actual)], check=True)
    subprocess.run(["java", "-cp", tmp, "e.e.a.Tap141Test"], check=True)
