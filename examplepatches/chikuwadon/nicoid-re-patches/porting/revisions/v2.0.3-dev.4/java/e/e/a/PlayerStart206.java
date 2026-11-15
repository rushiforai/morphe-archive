package e.e.a;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.SystemClock;
import android.view.View;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Avoid drawing a play glyph atop the native loading spinner before duration is known. */
public final class PlayerStart206 {
 private static final WeakHashMap<View,Watcher> WATCHERS=new WeakHashMap<>();
 private PlayerStart206(){}
 public static void install(View root){
  if(root==null||WATCHERS.containsKey(root))return;
  int id=root.getResources().getIdentifier("viewbutton","id",root.getContext().getPackageName());
  View play=id==0?null:root.findViewById(id);
  if(play==null)return;
  Watcher watcher=new Watcher(root,play);
  WATCHERS.put(root,watcher);
  watcher.begin();
 }
 static Activity activity(Context context){
  for(int i=0;i<10&&context!=null;i++){
   if(context instanceof Activity)return (Activity)context;
   if(!(context instanceof ContextWrapper))break;
   context=((ContextWrapper)context).getBaseContext();
  }
  return null;
 }
 static final class Watcher implements Runnable,View.OnAttachStateChangeListener {
  final WeakReference<View> root,button;
  final long started=SystemClock.uptimeMillis();
  boolean hidden;
  Watcher(View a,View b){root=new WeakReference<>(a);button=new WeakReference<>(b);}
  void begin(){
   View r=root.get(),b=button.get();
   if(r==null||b==null)return;
   hidden=b.getVisibility()==View.VISIBLE;
   if(hidden)b.setVisibility(View.INVISIBLE);
   r.addOnAttachStateChangeListener(this);r.post(this);
  }
  @Override public void run(){
   View r=root.get(),b=button.get();if(r==null||b==null)return;
   boolean ready=false;
   try{
    Activity a=activity(r.getContext());
    Object fragment=a==null?null:Review181.field(a,"v");
    Object player=fragment==null?null:Review181.field(fragment,"a0");
    if(player!=null){
     Object value=player.getClass().getMethod("getDuration").invoke(player);
     ready=value instanceof Number&&((Number)value).longValue()>0;
    }
   }catch(Exception ignored){}
   if(ready||SystemClock.uptimeMillis()-started>3500){
    if(hidden&&b.getVisibility()==View.INVISIBLE)b.setVisibility(View.VISIBLE);
    r.removeOnAttachStateChangeListener(this);WATCHERS.remove(r);return;
   }
   if(hidden&&b.getVisibility()==View.VISIBLE)b.setVisibility(View.INVISIBLE);
   r.postDelayed(this,65);
  }
  @Override public void onViewAttachedToWindow(View v){v.removeCallbacks(this);v.post(this);}
  @Override public void onViewDetachedFromWindow(View v){v.removeCallbacks(this);}
 }
}
