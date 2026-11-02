package e.e.a;

import android.content.Context;
import android.util.AttributeSet;
import android.view.*;
import android.widget.*;
import java.lang.reflect.*;

/** Use the application's existing refresh widget, including its native icon and animations. */
public final class FeedRefresh209 extends FrameLayout {
 final ViewGroup swipe;private final View content;private final Runnable refresh;private final Method refreshing;
 private final int slop;private float x,y;private boolean horizontal;
 public FeedRefresh209(Context c,View child,Runnable action){super(c);content=child;refresh=action;slop=ViewConfiguration.get(c).getScaledTouchSlop();
  try{
   Class<?> type=Class.forName("androidx.swiperefreshlayout.widget.SwipeRefreshLayout");
   swipe=(ViewGroup)type.getConstructor(Context.class,AttributeSet.class).newInstance(c,null);
   swipe.setTag(this);refreshing=type.getMethod("setRefreshing",boolean.class);
   Method listener=null;for(Method method:type.getMethods())if(method.getName().equals("setOnRefreshListener")&&method.getParameterTypes().length==1){listener=method;break;}
   if(listener==null)throw new NoSuchMethodException("setOnRefreshListener");Class<?> callback=listener.getParameterTypes()[0];
   Object proxy=Proxy.newProxyInstance(callback.getClassLoader(),new Class<?>[]{callback},(object,method,args)->{
    if(method.getDeclaringClass()==Object.class){if(method.getName().equals("hashCode"))return System.identityHashCode(object);if(method.getName().equals("equals"))return object==args[0];return "Feed refresh listener";}
    refresh.run();return null;
   });listener.invoke(swipe,proxy);
   type.getMethod("setColorSchemeColors",int[].class).invoke(swipe,(Object)new int[]{UiDialogs.accent(c)});
   type.getMethod("setProgressBackgroundColorSchemeColor",int.class).invoke(swipe,ThemeChoice.isNight(c)?0xff292b31:0xfffafafa);
   type.getMethod("setDistanceToTriggerSync",int.class).invoke(swipe,PanelUi.dp(c,64));
   // The bundled widget checks its direct child's scrollability. Keep that check
   // connected to the visible list, even though the horizontal pager wraps it.
   FrameLayout target=new FrameLayout(c){@Override public boolean canScrollVertically(int direction){return horizontal||(content instanceof TabViewport110&&((TabViewport110)content).switching())||scrolls(content,direction);}};
   target.addView(content,new FrameLayout.LayoutParams(-1,-1));swipe.addView(target,new ViewGroup.LayoutParams(-1,-1));addView(swipe,new FrameLayout.LayoutParams(-1,-1));
  }catch(Exception error){throw new IllegalStateException("Cannot initialize native feed refresh",error);}
 }
 private static boolean scrolls(View v,int direction){if(v.getVisibility()!=VISIBLE)return false;if(v.canScrollVertically(direction))return true;if(v instanceof ViewGroup){ViewGroup group=(ViewGroup)v;for(int i=0;i<group.getChildCount();i++)if(scrolls(group.getChildAt(i),direction))return true;}return false;}
 @Override public boolean onInterceptTouchEvent(MotionEvent e){int action=e.getActionMasked();if(action==MotionEvent.ACTION_DOWN){x=e.getX();y=e.getY();horizontal=false;}else if(action==MotionEvent.ACTION_MOVE&&Math.abs(e.getX()-x)>slop&&Math.abs(e.getX()-x)>Math.abs(e.getY()-y)*1.3f)horizontal=true;return false;}
 public static void accept(Object widget,boolean enabled,boolean notify){if(!enabled||!notify||!(widget instanceof View))return;Object tag=((View)widget).getTag();if(tag instanceof FeedRefresh209)((FeedRefresh209)tag).swipe.post(()->((FeedRefresh209)tag).dispatch());}
 private void dispatch(){try{if(!Boolean.TRUE.equals(Playback214.get(swipe,"c"))||!Boolean.TRUE.equals(Playback214.get(swipe,"I")))return;MultiTabs227.set(swipe,"I",false);refresh.run();}catch(Exception error){setRefreshing(false);android.util.Log.w("nicoid-feed","Cannot dispatch feed refresh",error);}}
 public void setRefreshing(boolean value){try{refreshing.invoke(swipe,value);}catch(Exception error){android.util.Log.w("nicoid-feed","Cannot update native refresh state",error);}}
}
