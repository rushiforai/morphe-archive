package e.e.a;
import android.app.*;import android.view.*;import android.widget.*;
/** A presentation drag handle, independent of configurable video gestures. */
public final class PlayerCollapse227 {
 public static void attach(Object owner){try{
  Activity a=(Activity)Playback214.get(owner,"A1");View root=(View)Playback214.get(owner,"x1"),video=(View)Playback214.get(owner,"a0");
  if(!(video.getParent() instanceof ViewGroup)||root.findViewWithTag("nicoid-player-collapse")!=null)return;
  int id=a.getResources().getIdentifier("videoLayout","id",a.getPackageName());View surface=id==0?null:root.findViewById(id);if(!(surface instanceof ViewGroup))return;ViewGroup parent=(ViewGroup)surface;FrameLayout handle=new FrameLayout(a);handle.setTag("nicoid-player-collapse");handle.setContentDescription(PanelUi.tr(a,"下にドラッグしてバックグラウンド再生","Drag down to background playback","向下拖曳進入背景播放"));
  View line=new View(a);line.setBackground(PanelUi.round(a,0xffcccccc,2));handle.addView(line,new FrameLayout.LayoutParams(PanelUi.dp(a,40),PanelUi.dp(a,3),Gravity.CENTER));
  // A dedicated 24dp strip avoids volume/brightness, comment and seek hit targets.
  if(parent instanceof RelativeLayout){RelativeLayout.LayoutParams lp=new RelativeLayout.LayoutParams(PanelUi.dp(a,72),PanelUi.dp(a,24));lp.addRule(RelativeLayout.ALIGN_PARENT_TOP);lp.addRule(RelativeLayout.CENTER_HORIZONTAL);parent.addView(handle,lp);}else{parent.addView(handle,new FrameLayout.LayoutParams(PanelUi.dp(a,72),PanelUi.dp(a,24),Gravity.TOP|Gravity.CENTER_HORIZONTAL));}handle.bringToFront();
  handle.setOnTouchListener(new View.OnTouchListener(){float x,y;boolean drag;public boolean onTouch(View v,android.view.MotionEvent e){
   int action=e.getActionMasked();if(action==0){if(PlayerGestures219.interactive(a.getWindow().getDecorView(),e.getRawX(),e.getRawY()))return false;x=e.getRawX();y=e.getRawY();drag=false;return true;}
   if(e.getPointerCount()>1||action==3){video.setTranslationY(0);return true;}
   float dy=e.getRawY()-y,dx=e.getRawX()-x;if(action==2){if(dy>ViewConfiguration.get(a).getScaledTouchSlop()&&dy>Math.abs(dx)*1.5f)drag=true;if(drag)video.setTranslationY(Math.min(Math.max(0,dy),video.getHeight()));return true;}
   if(action==1){video.setTranslationY(0);if(drag&&dy>PanelUi.dp(a,64))MiniSession225.minimizeDragged(owner,dy);return true;}return true;
  }});
 }catch(Exception e){android.util.Log.w("nicoid-mini","Cannot attach collapse handle",e);}}
}
