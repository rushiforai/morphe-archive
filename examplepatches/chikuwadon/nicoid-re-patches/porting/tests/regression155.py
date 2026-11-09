"""Run the production popup bridge with deterministic Android boundary doubles."""
from pathlib import Path
import subprocess,tempfile,sys
repo=Path(__file__).resolve().parents[2]
revision=repo/'porting/revisions/v1.10.5-dev.5'
fixtures={
'android/content/Context.java':'package android.content;public class Context{}',
'android/app/Service.java':'package android.app;public class Service extends android.content.Context {public int stops;public void stopSelf(){stops++;}}',
'android/util/Log.java':'package android.util;public class Log{public static int i(String a,String b){return 0;}public static int w(String a,String b){return 0;}}',
'android/view/View.java':'''package android.view;public class View{public static final int VISIBLE=0;public boolean shown=true,clickable;public int x,y,w=1000,h=600;public boolean isShown(){return shown;}public int getWidth(){return w;}public int getHeight(){return h;}public void getLocationOnScreen(int[] a){a[0]=x;a[1]=y;}public boolean hasOnClickListeners(){return clickable;}public android.content.Context getContext(){return new android.content.Context();}public interface OnTouchListener{boolean onTouch(View v,MotionEvent e);}}''',
'android/view/ViewGroup.java':'package android.view;import java.util.*;public class ViewGroup extends View{public ArrayList<View> children=new ArrayList<>();public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}}',
'android/view/MotionEvent.java':'''package android.view;public class MotionEvent{public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,ACTION_POINTER_DOWN=5,ACTION_POINTER_UP=6;int a;long t;float x,y;public MotionEvent(int a,long t,float x,float y){this.a=a;this.t=t;this.x=x;this.y=y;}public int getActionMasked(){return a;}public long getEventTime(){return t;}public float getRawX(){return x;}public float getRawY(){return y;}}''',
'android/view/ViewConfiguration.java':'package android.view;public class ViewConfiguration{public static ViewConfiguration get(android.content.Context c){return new ViewConfiguration();}public int getScaledDoubleTapSlop(){return 96;}public int getScaledTouchSlop(){return 12;}public static int getDoubleTapTimeout(){return 300;}public static int getLongPressTimeout(){return 500;}}',
'android/widget/Button.java':'package android.widget;public class Button extends android.view.View{}',
'android/widget/SeekBar.java':'package android.widget;public class SeekBar extends android.view.View{}',
'android/preference/PreferenceManager.java':'package android.preference;public class PreferenceManager{public static boolean seek;public static PreferenceManager getDefaultSharedPreferences(android.content.Context c){return new PreferenceManager();}public boolean getBoolean(String k,boolean v){return seek;}}',
'e/e/a/PopupGestures.java':'package e.e.a;public class PopupGestures{public static int calls;public static void doubleTap(Object o,android.view.MotionEvent e){calls++;}}',
'e/e/a/Bridge155Test.java':'''package e.e.a;import android.view.*;import android.app.Service;public class Bridge155Test {
static int checks;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
public static class Controls extends View {public void hide(){shown=false;}}
public static class Player extends View{public Controls controls=new Controls();public Player(){controls.shown=false;}public Controls getVideoControls(){return controls;}public void showControls(){controls.shown=true;}}
public static class Owner extends Service implements View.OnTouchListener {public Player e=new Player();public int forwarded;public boolean onTouch(View v,MotionEvent event){forwarded++;return false;}}
static boolean send(View root,Owner o,int action,long time,float x,float y){return PopupTouch125.dispatch(root,o,new MotionEvent(action,time,x,y));}
static void tap(View r,Owner o,long t,float x){send(r,o,0,t,x,120);send(r,o,1,t+50,x,120);}
public static void main(String[] args){
ViewGroup r=new ViewGroup();Owner o=new Owner();
check(send(r,o,0,1000,120,120)&&!o.e.controls.shown,"no toggle before first release");send(r,o,1,1050,120,120);check(o.e.controls.shown,"single release shows controls");
send(r,o,0,1150,121,120);check(o.stops==0,"second down must not close");send(r,o,1,1200,121,120);check(o.stops==1,"second release closes without GestureDetector callback");
Owner far=new Owner();tap(r,far,2000,120);send(r,far,0,2150,121,120);send(r,far,1,2200,500,120);check(far.stops==0,"distant UP without MOVE cannot close");
Owner single=new Owner();send(r,single,0,3000,120,120);send(r,single,1,3050,500,120);check(!single.e.controls.shown,"distant UP without MOVE cannot toggle controls");
Owner cancel=new Owner();send(r,cancel,0,4000,120,120);send(r,cancel,3,4030,120,120);send(r,cancel,1,4050,120,120);check(cancel.stops==0&&!cancel.e.controls.shown,"cancelled stream cannot act");
Owner button=new Owner();button.e.controls.shown=true;android.widget.Button b=new android.widget.Button();b.x=50;b.y=50;b.w=40;b.h=40;r.children.add(b);check(!send(r,button,0,5000,60,60),"visible button keeps its touch stream");check(button.forwarded==0,"button touch not sent to window dragging");r.children.clear();
Owner seek=new Owner();android.preference.PreferenceManager.seek=true;tap(r,seek,6000,120);tap(r,seek,6150,120);check(seek.stops==0&&PopupGestures.calls==1,"seek mode never falls back to close");android.preference.PreferenceManager.seek=false;
Owner pinch=new Owner();tap(r,pinch,7000,120);send(r,pinch,5,7100,120,120);tap(r,pinch,7150,120);check(pinch.stops==0,"pointer change clears double tap candidate");
System.out.println("Popup bridge155: "+checks+" actual bridge assertions passed (Android doubles)");}}
'''}
with tempfile.TemporaryDirectory(prefix='bridge155-') as temp:
 p=Path(temp)
 for name,data in fixtures.items():
  f=p/name;f.parent.mkdir(parents=True,exist_ok=True);f.write_text(data)
 source=Path(sys.argv[1]) if len(sys.argv)>1 else revision/'java/e/e/a/PopupTouch125.java'
 subprocess.run(['java','com.sun.tools.javac.Main','--release','8','-d',str(p),*map(str,p.rglob('*.java')),str(source),str(revision/'java/e/e/a/PopupTouchPolicy125.java')],check=True)
 subprocess.run(['java','-cp',str(p),'e.e.a.Bridge155Test'],check=True)
