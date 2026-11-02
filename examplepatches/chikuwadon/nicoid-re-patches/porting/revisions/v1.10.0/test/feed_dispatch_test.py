#!/usr/bin/env python3
"""Execute production FeedRefresh209 against a minimal JVM widget/Looper double.
The double models the shipped widget's c/I flags and delayed animation callback.
It tests refresh routing, not Android drawing or touch recognition.
"""
from pathlib import Path
import subprocess,tempfile,sys
r=Path(__file__).resolve().parents[1]
sources={
'android/content/Context.java':'package android.content;public class Context{}',
'android/util/AttributeSet.java':'package android.util;public interface AttributeSet{}',
'android/util/Log.java':'package android.util;public class Log{public static int w(String a,String b,Throwable c){return 0;}}',
'android/view/View.java':'''package android.view;import android.content.Context;import java.util.*;public class View{public static final int VISIBLE=0;private Object tag;static java.util.ArrayList<Runnable> posted=new java.util.ArrayList<>();public View(Context c){}public Object getTag(){return tag;}public void setTag(Object x){tag=x;}public boolean post(Runnable r){posted.add(r);return true;}public static void drain(){while(!posted.isEmpty())posted.remove(0).run();}public int getVisibility(){return 0;}public boolean canScrollVertically(int n){return false;}}''',
'android/view/ViewGroup.java':'''package android.view;import android.content.Context;import java.util.*;public class ViewGroup extends View{private ArrayList<View> children=new ArrayList<>();public ViewGroup(Context c){super(c);}public void addView(View v,LayoutParams p){children.add(v);}public int getChildCount(){return children.size();}public View getChildAt(int n){return children.get(n);}public static class LayoutParams{public LayoutParams(int a,int b){}}}''',
'android/widget/FrameLayout.java':'''package android.widget;import android.content.Context;import android.view.*;public class FrameLayout extends ViewGroup{public FrameLayout(Context c){super(c);}public boolean onInterceptTouchEvent(MotionEvent e){return false;}public static class LayoutParams extends ViewGroup.LayoutParams{public LayoutParams(int a,int b){super(a,b);}}}''',
'android/view/ViewConfiguration.java':'''package android.view;import android.content.Context;public class ViewConfiguration{public static ViewConfiguration get(Context c){return new ViewConfiguration();}public int getScaledTouchSlop(){return 8;}}''',
'android/view/MotionEvent.java':'''package android.view;public class MotionEvent{public static final int ACTION_DOWN=0,ACTION_MOVE=2;public int getActionMasked(){return 0;}public float getX(){return 0;}public float getY(){return 0;}}''',
'androidx/swiperefreshlayout/widget/SwipeRefreshLayout.java':'''package androidx.swiperefreshlayout.widget;import android.content.Context;import android.util.AttributeSet;import android.view.*;public class SwipeRefreshLayout extends ViewGroup{public boolean c,I;public interface Listener{void refresh();}public Listener listener;public SwipeRefreshLayout(Context c,AttributeSet a){super(c);}public void setOnRefreshListener(Listener l){listener=l;}public void setRefreshing(boolean value){c=value;I=false;}public void setColorSchemeColors(int[] c){}public void setProgressBackgroundColorSchemeColor(int c){}public void setDistanceToTriggerSync(int x){}public void animationEnd(){if(c&&I)listener.refresh();}}''',
'e/e/a/UiDialogs.java':'package e.e.a;public class UiDialogs{public static int accent(android.content.Context c){return 0;}}',
'e/e/a/ThemeChoice.java':'package e.e.a;public class ThemeChoice{public static boolean isNight(android.content.Context c){return true;}}',
'e/e/a/PanelUi.java':'package e.e.a;public class PanelUi{public static int dp(android.content.Context c,int n){return n;}}',
'e/e/a/TabViewport110.java':'package e.e.a;public class TabViewport110 extends android.view.View{public TabViewport110(android.content.Context c){super(c);}public boolean switching(){return false;}}',
'e/e/a/Playback214.java':'package e.e.a;public class Playback214{public static Object get(Object o,String key)throws Exception{return o.getClass().getField(key).get(o);}}',
'e/e/a/MultiTabs227.java':'package e.e.a;public class MultiTabs227{public static void set(Object o,String key,Object v)throws Exception{o.getClass().getField(key).set(o,v);}}',
'e/e/a/FeedDispatchTest.java':'''package e.e.a;import android.content.*;import android.view.*;import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;public class FeedDispatchTest{static int checks;static void check(boolean b){checks++;if(!b)throw new AssertionError("Feed check "+checks);}public static void main(String[] a){Context c=new Context();int[] calls={0};FeedRefresh209 feed=new FeedRefresh209(c,new View(c),()->calls[0]++);SwipeRefreshLayout w=(SwipeRefreshLayout)feed.swipe;
// Hook runs before native state is updated. The posted callback must see new state.
FeedRefresh209.accept(w,true,true);w.c=w.I=true;View.drain();check(calls[0]==1);check(!w.I);w.animationEnd();check(calls[0]==1);
// Repeated hooks before the animation ends cannot duplicate the request.
FeedRefresh209.accept(w,true,true);FeedRefresh209.accept(w,true,true);w.c=w.I=true;View.drain();check(calls[0]==2);feed.setRefreshing(false);check(!w.c);
// Programmatic spinner changes and cancelled pulls never make a network request.
FeedRefresh209.accept(w,true,false);FeedRefresh209.accept(w,false,true);View.drain();check(calls[0]==2);FeedRefresh209.accept(w,true,true);w.c=false;w.I=true;View.drain();check(calls[0]==2);
// A failed refresh clears the spinner instead of leaving an unhandled animation.
FeedRefresh209 failing=new FeedRefresh209(c,new View(c),()->{throw new RuntimeException("failure");});SwipeRefreshLayout bad=(SwipeRefreshLayout)failing.swipe;FeedRefresh209.accept(bad,true,true);bad.c=bad.I=true;View.drain();check(!bad.c);
// Non-feed widgets retain their existing path.
FeedRefresh209.accept(new View(c),true,true);View.drain();check(calls[0]==2);System.out.println("FeedDispatchTest: "+checks+" checks passed");}}'''
}
with tempfile.TemporaryDirectory() as d:
 t=Path(d)
 for name,source in sources.items():
  p=t/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source)
 cmd=['java','-jar',str(Path(sys.argv[1]).resolve()),'-1.8','-warn:none','-d',str(t/'classes'),*map(str,t.rglob('*.java')),str(r/'src/e/e/a/FeedRefresh209.java')]
 subprocess.run(cmd,check=True);subprocess.run(['java','-cp',str(t/'classes'),'e.e.a.FeedDispatchTest'],check=True)
