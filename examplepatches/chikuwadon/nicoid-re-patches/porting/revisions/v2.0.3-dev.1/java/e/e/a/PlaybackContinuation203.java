package e.e.a;
import android.app.Activity;
import android.content.Intent;
import android.view.View;

/** Carry the in-app background presentation across legacy queue navigation. */
public final class PlaybackContinuation203 {
 public static final String KEY="nicoid_continue_mini203";
 private PlaybackContinuation203(){}
 public static void mark(Object owner,Intent next) {
  if(next!=null&&MiniSession225.showing())next.putExtra(KEY,true);
 }
 public static void prepared(Object owner,boolean popup) {
  if(popup||owner==null)return;
  try {
   final Activity activity=(Activity)owner.getClass().getField("A1").get(owner);
   if(activity==null||activity.isFinishing()||activity.isDestroyed())return;
   final Intent intent=activity.getIntent();
   if(intent==null||!intent.getBooleanExtra(KEY,false))return;
   intent.removeExtra(KEY); // one navigation, one attempt; no repeated minimize
   View root=activity.getWindow().getDecorView();
   root.post(()->{
    if(!activity.isFinishing()&&!activity.isDestroyed())
      MiniSession225.minimize(owner);
   });
  } catch(Exception e) {
   android.util.Log.w("nicoid-continuity","Unable to retain mini on next video",e);
  }
 }
}
