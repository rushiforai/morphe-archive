package e.e.a;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.Animation;
import android.widget.RelativeLayout;

/** Popup-only control containers: pin before native fade/hide can change layout. */
public final class PinnedPopup247 extends RelativeLayout {
 public PinnedPopup247(Context c){super(c);}
 public PinnedPopup247(Context c,AttributeSet a){super(c,a);}
 public PinnedPopup247(Context c,AttributeSet a,int style){super(c,a,style);}
 static boolean pinned(View view){
  if(view.getId()==View.NO_ID)return false;
  String name;
  try{name=view.getResources().getResourceEntryName(view.getId());}catch(android.content.res.Resources.NotFoundException e){return false;}
  return (name.equals("topmenulay")||name.equals("controller")||name.equals("bottommenulay"))&&PlayerVisibility192.enabled(view.getContext(),true);
 }
 @Override public void setVisibility(int visibility){super.setVisibility(pinned(this)?View.VISIBLE:visibility);}
 @Override public void setAlpha(float alpha){super.setAlpha(pinned(this)?1f:alpha);}
 @Override public void startAnimation(Animation animation){if(!pinned(this))super.startAnimation(animation);}
 @Override public void setAnimation(Animation animation){super.setAnimation(pinned(this)?null:animation);}
}
