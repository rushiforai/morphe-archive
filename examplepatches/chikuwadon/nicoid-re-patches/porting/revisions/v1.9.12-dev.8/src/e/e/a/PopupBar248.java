package e.e.a;
import android.view.*;
import android.widget.*;
/** Move the existing playback controls, preserving the native buttons and clicks. */
public final class PopupBar248 {
 static void place(PopupControls193 b,boolean pinned){place(b.row,b.stage,b.center,pinned);}
 static void place(LinearLayout row,RelativeLayout stage,View center,boolean pinned){
  if(center==null)return;
  ViewGroup target=pinned?row:stage;
  if(center.getParent()==target)return;
  PopupControls193.detach(center);
  if(pinned)row.addView(center,0,new LinearLayout.LayoutParams(1,1));
  else stage.addView(center,new RelativeLayout.LayoutParams(-1,-2));
 }
 static int slots(PopupControls193 b){int count=0;for(String key:new String[]{"viewbutton","prevbutton","nextbutton"}){View child=PopupControls193.find(b.root,key);if(child!=null&&child.getVisibility()!=View.GONE)count++;}return Math.max(1,count);}
 static void fit(PopupControls193 b,int height){
  if(b.center==null||b.center.getParent()!=b.row)return;
  // The native row contains previous/play/next. Keep its own listeners and relative rules.
  int count=0;
  for(String key:new String[]{"viewbutton","prevbutton","nextbutton"}){View child=PopupControls193.find(b.root,key);if(child!=null&&child.getVisibility()!=View.GONE){PopupControls193.size(child,height,height);count++;}}
  PopupControls193.size(b.center,Math.max(1,count)*height,height);
 }
}
