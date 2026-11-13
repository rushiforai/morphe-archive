package e.e.a;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.widget.ListView;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Non-blocking tab restoration. Show the ordinary list immediately and make
 * at most one final jump if the actual saved item arrives shortly afterwards.
 * Never scroll through incomplete pages just to trigger more fetches.
 */
public final class SmoothTabRestore204 {
 private static final Handler MAIN=new Handler(Looper.getMainLooper());
 private static final Map<ListView,Pending> PENDING=new WeakHashMap<>();
 private static final Map<ListView,Applied> APPLIED=new WeakHashMap<>();
 private static final class Applied {
  final int position,top;
  final long at;
  Applied(int p,int t){position=p;top=t;at=SystemClock.uptimeMillis();}
 }
 private static boolean justApplied(ListView list,int p,int t){
  Applied a=APPLIED.get(list);
  return a!=null&&a.position==p&&a.top==t
      &&SystemClock.uptimeMillis()-a.at<500L;
 }
 private static void apply(ListView list,int p,int t){
  APPLIED.put(list,new Applied(p,t));
  list.setSelectionFromTop(p,t);
 }
 private SmoothTabRestore204(){}

 private static Object field(Object owner,String name)throws Exception {
  for(Class<?> c=owner.getClass();c!=null;c=c.getSuperclass()) {
   try {Field f=c.getDeclaredField(name);f.setAccessible(true);return f.get(owner);}
   catch(NoSuchFieldException ignored){}
  }
  throw new NoSuchFieldException(name);
 }

 /** Preserve the original Host and tab identity when restoring. */
 public static void restore(Object host,Object fragment,Object tab){
  try {
   if(host==null||fragment==null||tab==null||field(host,"current")!=fragment)return;
   Object view=field(fragment,"b0");
   if(view instanceof ListView)restoreList((ListView)view,
       (Integer)field(tab,"position"),(Integer)field(tab,"top"));
  }catch(Exception error){
   android.util.Log.w("nicoid-tabs","Single-jump restore skipped",error);
  }
 }

 public static void restoreList(ListView list,int position,int top){
  if(list==null||position<0||(position==0&&top==0))return;
  if(Looper.myLooper()!=Looper.getMainLooper()){
   WeakReference<ListView> target=new WeakReference<>(list);
   MAIN.post(()->restoreList(target.get(),position,top));
   return;
  }
  Pending previous=PENDING.get(list);
  if(previous!=null&&previous.position==position&&previous.top==top)return;
  if(previous!=null){PENDING.remove(list);previous.cancel();}
  if(justApplied(list,position,top))return;
  int first=list.getFirstVisiblePosition();
  View row=list.getChildAt(0);
  if(!ScrollRestorePolicy204.needs(position,top,first,row==null?0:row.getTop(),row!=null))return;
  if(ScrollRestorePolicy205.ready(list.getCount(),position,list.getHeight(),
       list.isAttachedToWindow(),list.isShown())){
   apply(list,position,top);
   return;
  }
  Pending pending=new Pending(list,position,top,first,row);
  PENDING.put(list,pending);
  MAIN.post(pending);
 }

 /** Used by the native capture path to avoid replacing saved deep offsets. */
 public static boolean restoring(ListView list){
  return list!=null&&PENDING.containsKey(list);
 }

 private static final class Pending implements Runnable {
  private final WeakReference<ListView> target;
  private final int position,top;
  private final long deadline=SystemClock.uptimeMillis()+ScrollRestorePolicy205.MAX_WAIT_MS;
  private int initialIndex,initialTop;
  private boolean initialRow,everVisible;

  Pending(ListView list,int position,int top,int first,View firstRow){
   this.target=new WeakReference<>(list);this.position=position;this.top=top;
   this.initialIndex=first;this.initialRow=firstRow!=null;
   this.initialTop=firstRow==null?0:firstRow.getTop();
  }
  private void cancel(){
   MAIN.removeCallbacks(this);
   ListView list=target.get();
   if(list!=null&&PENDING.get(list)==this)PENDING.remove(list);
  }
  @Override public void run(){
   ListView list=target.get();
   if(list==null||PENDING.get(list)!=this)return;
   boolean visible=list.isAttachedToWindow()&&list.isShown();
   if(everVisible&&!visible){cancel();return;}
   everVisible|=visible;
   if(visible){
    int first=list.getFirstVisiblePosition();
    View row=list.getChildAt(0);
    if(!initialRow&&row!=null){
     initialIndex=first;initialTop=row.getTop();initialRow=true;
    }else if(initialRow&&ScrollRestorePolicy205.userMoved(
          first,row==null?0:row.getTop(),initialIndex,initialTop,row!=null)){
     // The user is already scrolling. Never steal touch or scroll position.
     cancel();return;
    }
    if(ScrollRestorePolicy205.ready(list.getCount(),position,list.getHeight(),
           true,true)){
     cancel();
     apply(list,position,top);  // At most once per restoration request.
     return;
    }
   }
   if(SystemClock.uptimeMillis()>=deadline){cancel();return;}
   MAIN.postDelayed(this,ScrollRestorePolicy205.RETRY_MS);
  }
 }
}
