package e.e.a;
import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
import android.view.Window;
import android.view.WindowManager;

/**
 * Carry in-app mini playback to the next video without ever showing the
 * intermediate normal player Activity. The decoder remains native ExoMedia.
 */
public final class PlaybackContinuation204 {
 private static final String KEY="nicoid_continue_mini203";
 private PlaybackContinuation204(){}
 public static void mark(Object owner,Intent next){
  if(next!=null&&MiniSession225.showing()){
   next.putExtra(KEY,true).addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION |
                                   Intent.FLAG_ACTIVITY_NO_USER_ACTION);
  }
 }
 /** Called at the very start of NicoidVideoActivity.onCreate, before super. */
 public static void beforeContent(Activity activity){
  if(activity==null)return;
  Intent input=activity.getIntent();
  if(input==null||!input.getBooleanExtra(KEY,false))return;
  activity.setVisible(false);
  Window window=activity.getWindow();
  WindowManager.LayoutParams params=window.getAttributes();
  params.alpha=0f;
  params.dimAmount=0f;
  window.setAttributes(params);
  window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
  window.setWindowAnimations(0);
  ModernDebug.record("Next-video mini transition hidden before first layout");
 }
 /** The original video view is prepared, but its Activity is still invisible. */
 public static void prepared(Object owner,boolean popup){
  if(popup||owner==null)return;
  Activity activity=null;
  try{
   Object candidate=Playback214.get(owner,"A1");
   if(!(candidate instanceof Activity))return;
   activity=(Activity)candidate;
   Intent intent=activity.getIntent();
   if(intent==null||!intent.getBooleanExtra(KEY,false))return;
   intent.removeExtra(KEY);
   Activity destination=PlaybackNavigation114.destination(activity);
   if(destination!=null&&!destination.isFinishing()&&!destination.isDestroyed()
       &&MiniSession225.beginMinimized(owner,destination)){
    ModernDebug.record("Next-video decoder transitioned to mini before normal screen draw");
    return;
   }
   // Never strand a hidden Activity if the original mini cannot be reused.
   reveal(activity);
   if(!activity.isFinishing()&&!activity.isDestroyed()){
    final Activity current=activity;
    current.getWindow().getDecorView().post(()->{
     if(!current.isFinishing()&&!current.isDestroyed())MiniSession225.minimize(owner);
    });
   }
   ModernDebug.record("Mini continuation unavailable; original player restored");
  }catch(Exception exception){
   android.util.Log.w("nicoid-continuity","Cannot initialize hidden next-video mini",exception);
   if(activity!=null)reveal(activity);
  }
 }
 private static void reveal(Activity activity){
  if(activity==null)return;
  WindowManager.LayoutParams p=activity.getWindow().getAttributes();
  p.alpha=1f;
  activity.getWindow().setAttributes(p);
  activity.setVisible(true);
 }
}
