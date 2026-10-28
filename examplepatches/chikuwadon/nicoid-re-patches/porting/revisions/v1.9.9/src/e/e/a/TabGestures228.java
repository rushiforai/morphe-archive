package e.e.a;
import android.app.*;import android.graphics.Rect;import android.view.*;import android.widget.*;import java.util.*;
/** Horizontal paging is armed away from system edges and existing horizontal controls. */
public final class TabGestures228 {
 static final WeakHashMap<Activity,Gesture> STATES=new WeakHashMap<Activity,Gesture>();
 static final class Gesture {float x,y;long time;boolean candidate,claimed;}
 static boolean horizontal(View v,float x,float y){if(!v.isShown())return false;Rect b=new Rect();if(!v.getGlobalVisibleRect(b)||!b.contains((int)x,(int)y))return false;if(v instanceof HorizontalScrollView||v instanceof SeekBar||v.getClass().getName().contains("Ui110$Swipe")||v.getClass().getName().contains("ViewPager"))return true;if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int n=g.getChildCount()-1;n>=0;n--)if(horizontal(g.getChildAt(n),x,y))return true;}return false;}
 static boolean direction(float dx,float dy,float density){return Math.abs(dx)>=72*density&&Math.abs(dx)>Math.abs(dy)*1.8f;}
 public static boolean touch(Activity a,MotionEvent e){MultiTabs227.Host h=MultiTabs227.HOSTS.get(a);if(h==null||!MultiTabs227.enabled()||MultiTabs227.data().tabs.size()<2)return false;Gesture s=STATES.get(a);if(s==null){s=new Gesture();STATES.put(a,s);}int action=e.getActionMasked();float density=a.getResources().getDisplayMetrics().density;if(action==MotionEvent.ACTION_DOWN){s.claimed=false;s.x=e.getRawX();s.y=e.getRawY();s.time=e.getEventTime();View decor=a.getWindow().getDecorView();Rect r=new Rect();boolean body=h.body!=null&&h.body.getGlobalVisibleRect(r)&&r.contains((int)s.x,(int)s.y);s.candidate=body&&s.x>32*density&&s.x<decor.getWidth()-32*density&&s.y<decor.getHeight()-96*density&&!horizontal(decor,s.x,s.y);try{Object drawer=MultiTabs227.get(a,"u");if(Boolean.TRUE.equals(MultiTabs227.invoke(drawer,"e",new Class<?>[]{int.class},Gravity.START)))s.candidate=false;}catch(Exception ignored){}return false;}
  if(e.getPointerCount()>1||action==MotionEvent.ACTION_CANCEL){boolean was=s.claimed;s.candidate=false;s.claimed=false;return was;}
  float dx=e.getRawX()-s.x,dy=e.getRawY()-s.y;if(!s.claimed&&s.candidate&&action==MotionEvent.ACTION_MOVE){if(Math.abs(dy)>12*density&&Math.abs(dy)>=Math.abs(dx)){s.candidate=false;return false;}if(direction(dx,dy,density)){s.claimed=true;s.candidate=false;MotionEvent cancel=MotionEvent.obtain(e);cancel.setAction(MotionEvent.ACTION_CANCEL);a.getWindow().superDispatchTouchEvent(cancel);cancel.recycle();}}
  if(action==MotionEvent.ACTION_UP){boolean claim=s.claimed;s.claimed=false;s.candidate=false;if(claim&&direction(dx,dy,density)&&e.getEventTime()-s.time<1200){List<SavedTabs227.Tab> tabs=MultiTabs227.data().tabs;int at=tabs.indexOf(MultiTabs227.data().find(h.currentId)),next=at+(dx<0?1:-1);if(next>=0&&next<tabs.size())h.select(tabs.get(next).id);}return claim;}return s.claimed;
 }
 static void destroy(Activity a){STATES.remove(a);}
}
