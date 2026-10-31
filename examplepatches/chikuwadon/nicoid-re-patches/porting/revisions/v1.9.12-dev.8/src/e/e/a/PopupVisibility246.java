package e.e.a;
import android.view.*;
/** Keep pinned popup controls from drawing a stale hidden-layout frame. */
public final class PopupVisibility246 {
 public static boolean draw(View root,View[] controls,boolean hold){if(hold){for(int i=0;i<controls.length;i++){View v=controls[i];if(i==2||v==null)continue;if(v.getVisibility()!=View.VISIBLE||v.getAlpha()!=1f||v.getAnimation()!=null){v.clearAnimation();v.animate().cancel();v.setAlpha(1f);v.setVisibility(View.VISIBLE);}}}center(root);return true;}
 public static void center(View root){View controller=PopupCenter242.find(root,"controller"),center=PopupCenter242.find(root,"viewctrllay");if(controller!=null&&center!=null)PopupCenter242.inherit(controller,center);}
 public static void background(Object owner,View button){if(!MiniSession225.minimize(owner))PlaybackTransfer221.popup(owner,true);}
}
