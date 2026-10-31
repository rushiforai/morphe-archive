package e.e.a;
import android.content.Context;
import android.util.AttributeSet;
import android.view.animation.Animation;
import android.widget.LinearLayout;
/** Retain the actual LinearLayout seek controller, including its native listeners. */
public final class PinnedPopupLinear248 extends LinearLayout {
 public PinnedPopupLinear248(Context c){super(c);}
 public PinnedPopupLinear248(Context c,AttributeSet a){super(c,a);}
 public PinnedPopupLinear248(Context c,AttributeSet a,int style){super(c,a,style);}
 @Override public void setVisibility(int value){super.setVisibility(PinnedPopup247.pinned(this)?VISIBLE:value);}
 @Override public void setAlpha(float value){super.setAlpha(PinnedPopup247.pinned(this)?1f:value);}
 @Override public void startAnimation(Animation value){if(!PinnedPopup247.pinned(this))super.startAnimation(value);}
 @Override public void setAnimation(Animation value){super.setAnimation(PinnedPopup247.pinned(this)?null:value);}
}
