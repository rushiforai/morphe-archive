package e.e.a;
import android.app.Activity;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Hand off fullscreen before launching the next video, not after it. */
public final class FullscreenHandoff206 {
 private static final String EXTRA="nicoid_fullscreen_handoff206";
 private static final Handler MAIN=new Handler(Looper.getMainLooper());
 private static final WeakHashMap<Activity,Gate> GATES=new WeakHashMap<>();
 static final class Gate {final long started=SystemClock.uptimeMillis();boolean finished;}
 private FullscreenHandoff206(){}

 public static void mark(Object fragment,Intent intent){
  if(intent==null)return;
  try{
   Object owner=Playback214.get(fragment,"A1");
   if(!(owner instanceof Activity))return;
   Activity a=(Activity)owner;
   boolean full=intent.getBooleanExtra("isFullScreen",false);
   Window window=a.getWindow();
   full=full||(window.getAttributes().flags&WindowManager.LayoutParams.FLAG_FULLSCREEN)!=0;
   if(!full)return;
   intent.putExtra("isFullScreen",true).putExtra("isLandscape",true)
       .putExtra(EXTRA,true).addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION);
   android.util.Log.i("nicoid-fullscreen","Next-video fullscreen marked before launch");
  }catch(Exception e){android.util.Log.w("nicoid-fullscreen","Unable to mark next video",e);}
 }

 public static void beforeContent(Activity a){
  if(a==null||a.getIntent()==null||!a.getIntent().getBooleanExtra(EXTRA,false)
      ||a.getIntent().getBooleanExtra("nicoid_continue_mini203",false))return;
  Window w=a.getWindow();
  w.setBackgroundDrawable(new ColorDrawable(Color.BLACK));
  w.addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
  a.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE);
  WindowManager.LayoutParams attr=w.getAttributes();
  attr.alpha=0f;w.setAttributes(attr);
  Gate gate=new Gate();GATES.put(a,gate);
  WeakReference<Activity> ref=new WeakReference<>(a);
  MAIN.postDelayed(()->{
   Activity activity=ref.get();
   if(activity!=null&&GATES.get(activity)==gate)reveal(activity,gate,"timeout");
  },3800);
 }

 public static void prepared(Object fragment,boolean popup){
  if(popup||fragment==null)return;
  try{
   Object owner=Playback214.get(fragment,"A1");
   if(!(owner instanceof Activity))return;
   Activity a=(Activity)owner;Gate gate=GATES.get(a);
   if(gate!=null) a.getWindow().getDecorView().post(()->attempt(a,gate,0));
  }catch(Exception e){android.util.Log.w("nicoid-fullscreen","Prepare inspection failed",e);}
 }

 private static void attempt(Activity a,Gate gate,int count){
  if(GATES.get(a)!=gate||gate.finished)return;
  if(a.isFinishing()||a.isDestroyed()){GATES.remove(a);return;}
  View decor=a.getWindow().getDecorView();
  int id=a.getResources().getIdentifier("videoLayout","id",a.getPackageName());
  View video=id==0?null:decor.findViewById(id);
  boolean ready=a.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE
       &&decor.getHeight()>0&&video!=null&&video.getHeight()>=decor.getHeight()*.72f
       &&SystemClock.uptimeMillis()-gate.started>220;
  if(ready)reveal(a,gate,"fullscreen-layout");
  else if(count>=95)reveal(a,gate,"layout-timeout");
  else decor.postDelayed(()->attempt(a,gate,count+1),30);
 }

 private static void reveal(Activity a,Gate gate,String reason){
  if(GATES.get(a)!=gate||gate.finished)return;
  gate.finished=true;GATES.remove(a);
  WindowManager.LayoutParams p=a.getWindow().getAttributes();
  p.alpha=1f;a.getWindow().setAttributes(p);
  a.overridePendingTransition(0,0);
  android.util.Log.i("nicoid-fullscreen","Fullscreen first-frame reveal "+reason);
 }
}
