package e.e.a;
import android.content.Intent;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;

/** Only the popup's actual fullscreen button requests landscape. */
public final class PopupFullscreen204 {
 private static long fullScreenTapAt;
 private PopupFullscreen204(){}
 public static void bind(View button){
  if(button==null||Boolean.TRUE.equals(button.getTag(0x7f0b1ffd)))return;
  button.setTag(0x7f0b1ffd,Boolean.TRUE);
  button.setOnTouchListener((v,event)->{
   if(event.getActionMasked()==MotionEvent.ACTION_UP)
    fullScreenTapAt=SystemClock.uptimeMillis();
   return false; // retain the original button click and any native callbacks
  });
 }
 public static void prepare(Intent intent){
  if(intent==null)return;
  boolean selected=SystemClock.uptimeMillis()-fullScreenTapAt<2000;
  fullScreenTapAt=0;
  if(!selected)return; // explicit portrait return is unchanged
  intent.putExtra("isFullScreen",true);
  intent.putExtra("isLandscape",true);
  intent.putExtra("nicoid_portrait_restore",false);
  intent.addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION);
  ModernDebug.record("Popup-to-fullscreen: landscape requested before Activity launch");
 }
}
