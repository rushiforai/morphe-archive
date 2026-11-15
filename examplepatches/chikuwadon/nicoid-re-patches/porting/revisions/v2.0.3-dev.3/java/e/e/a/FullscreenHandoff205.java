package e.e.a;
import android.app.Activity;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.os.Handler;
import android.os.Looper;
import android.view.WindowManager;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Do not flash portrait/normal UI between two landscape fullscreen videos. */
public final class FullscreenHandoff205 {
 private static final WeakHashMap<Activity,Boolean> pending=new WeakHashMap<>();
 private static final Handler main=new Handler(Looper.getMainLooper());
 private FullscreenHandoff205(){}
 public static void beforeContent(Activity activity){
  if(activity==null)return;
  Intent i=activity.getIntent();
  if(i==null||!i.getBooleanExtra("isFullScreen",false)
      ||i.getBooleanExtra("nicoid_continue_mini203",false))return;
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
  if(i.getBooleanExtra("isLandscape",false))
   activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE);
  activity.getWindow().getAttributes().alpha=0f;
  activity.setVisible(false);
  pending.put(activity,Boolean.TRUE);
  WeakReference<Activity> ref=new WeakReference<>(activity);
  main.postDelayed(()->{
   Activity a=ref.get();if(a!=null&&pending.containsKey(a))reveal(a);
  },4500);
 }
 public static void prepared(Object owner,boolean popup){
  if(popup||owner==null)return;
  try{
   Object c=Playback214.get(owner,"A1");
   if(!(c instanceof Activity))return;
   Activity a=(Activity)c;
   if(!pending.containsKey(a))return;
   attempt(a,0);
  }catch(Exception e){android.util.Log.w("nicoid-fullscreen","Handoff inspection failed",e);}
 }
 private static void attempt(Activity a,int tries){
  if(a.isFinishing()||a.isDestroyed()){pending.remove(a);return;}
  boolean landscape=a.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE;
  if(landscape||tries>=35){
   reveal(a);
  }else{
   a.getWindow().getDecorView().postDelayed(()->attempt(a,tries+1),40);
  }
 }
 private static void reveal(Activity a){
  if(!pending.containsKey(a))return;
  pending.remove(a);
  WindowManager.LayoutParams p=a.getWindow().getAttributes();p.alpha=1f;
  a.getWindow().setAttributes(p);
  a.setVisible(true);
  a.overridePendingTransition(0,0);
 }
}
