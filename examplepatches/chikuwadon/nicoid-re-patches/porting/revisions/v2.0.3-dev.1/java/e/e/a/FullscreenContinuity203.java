package e.e.a;
import android.app.Activity;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.view.WindowManager;

/** Apply next-video fullscreen window state before the first layout/frame. */
public final class FullscreenContinuity203 {
 private FullscreenContinuity203(){}
 public static void beforeContent(Activity activity) {
  if(activity==null)return;
  Intent intent=activity.getIntent();
  if(intent==null)return;
  if(intent.getBooleanExtra("isFullScreen",false))
   activity.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                                 WindowManager.LayoutParams.FLAG_FULLSCREEN);
  if(intent.getBooleanExtra("isLandscape",false))
   activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE);
 }
}
