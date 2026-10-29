package e.e.a;
import android.app.*;import android.graphics.Rect;import android.view.*;import android.widget.*;import java.util.*;
/** Horizontal paging is armed away from system edges and existing horizontal controls. */
public final class TabGestures228 {
 static final WeakHashMap<Activity,Gesture> STATES=new WeakHashMap<Activity,Gesture>();
 static final class Gesture {float x,y;long time;boolean candidate,claimed;}
 static boolean horizontal(View v,float x,float y){if(!v.isShown())return false;Rect b=new Rect();if(!v.getGlobalVisibleRect(b)||!b.contains((int)x,(int)y))return false;if(v instanceof HorizontalScrollView||v instanceof SeekBar||v.getClass().getName().contains("Ui110$Swipe")||v.getClass().getName().contains("ViewPager"))return true;if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int n=g.getChildCount()-1;n>=0;n--)if(horizontal(g.getChildAt(n),x,y))return true;}return false;}
 static boolean direction(float dx,float dy,float density){return Math.abs(dx)>=72*density&&Math.abs(dx)>Math.abs(dy)*1.8f;}
 public static boolean touch(Activity a,MotionEvent e){return TabPager233.touch(a,e);}
 static void destroy(Activity a){STATES.remove(a);TabPager233.destroy(a);}
}
