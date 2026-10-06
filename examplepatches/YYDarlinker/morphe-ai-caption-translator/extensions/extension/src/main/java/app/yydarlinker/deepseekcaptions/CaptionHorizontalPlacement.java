package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.graphics.Rect;
import android.view.*;
import android.widget.*;
import java.lang.ref.WeakReference;
import java.util.function.BooleanSupplier;

/** Physical horizontal placement only. Does not measure, paginate, choose time, or scan a View tree. */
final class CaptionHorizontalPlacement {
  private final WeakReference<FrameLayout> host,outer;
  private final WeakReference<TextView> text;
  private WeakReference<Activity> owner=new WeakReference<>(null);
  private Rect video;
  private String playerType,session;
  private long ownerEpoch,renderEpoch;
  private BooleanSupplier valid;
  private ViewTreeObserver observer;
  private final ViewTreeObserver.OnPreDrawListener afterLayout=()->{record(true);return true;};

  CaptionHorizontalPlacement(FrameLayout h,FrameLayout o,TextView t) {
    host=new WeakReference<>(h);outer=new WeakReference<>(o);text=new WeakReference<>(t);
  }
  static int physicalLeft(Rect video,int measuredOuterWidth) {
    return video.left+Math.round((video.width()-measuredOuterWidth)/2f);
  }
  static void place(FrameLayout host,FrameLayout outer,Rect video,int width,int height,int top) {
    if(outer.getLayoutDirection()!=View.LAYOUT_DIRECTION_LTR)outer.setLayoutDirection(View.LAYOUT_DIRECTION_LTR);
    // Never compose a translation with the new scene's coordinates.
    if(outer.getTranslationX()!=0f)outer.setTranslationX(0f);
    int margin=physicalLeft(video,width)-host.getPaddingLeft()+host.getScrollX();
    FrameLayout.LayoutParams p=(FrameLayout.LayoutParams)outer.getLayoutParams();
    int gravity=Gravity.TOP|Gravity.LEFT;
    if(p.width!=width || p.height!=height || p.gravity!=gravity || p.leftMargin!=margin
        || p.topMargin!=top || p.rightMargin!=0 || p.isMarginRelative()) {
      p.width=width;p.height=height;p.gravity=gravity;p.leftMargin=margin;p.topMargin=top;p.rightMargin=0;
      p.setMarginStart(Integer.MIN_VALUE);p.setMarginEnd(Integer.MIN_VALUE);
      outer.setLayoutParams(p);
    }
  }
  void observe(Activity a,Rect bounds,String type,String id,long oe,long re,BooleanSupplier guard) {
    cancel();owner=new WeakReference<>(a);video=new Rect(bounds);playerType=type;session=id;
    ownerEpoch=oe;renderEpoch=re;valid=guard;
    FrameLayout o=outer.get();
    if(o!=null && !o.isLayoutRequested())record(false);
    if(valid!=null && o!=null) {
      observer=o.getViewTreeObserver();observer.addOnPreDrawListener(afterLayout);
    }
  }
  void cancel() {
    if(observer!=null && observer.isAlive())observer.removeOnPreDrawListener(afterLayout);
    observer=null;valid=null;owner.clear();
  }
  private void record(boolean laidOut) {
    Activity a=owner.get();FrameLayout h=host.get(),o=outer.get();TextView t=text.get();
    if(valid==null || !valid.getAsBoolean() || a==null || h==null || o==null || t==null
        || o.getVisibility()!=View.VISIBLE || !o.isAttachedToWindow()) {cancel();return;}
    if(!laidOut && o.isLayoutRequested())return; // Pre-draw follows a real layout even if text requests the next pass.
    float left=o.getLeft()+o.getTranslationX()-h.getScrollX();
    float top=o.getTop()+o.getTranslationY()-h.getScrollY();
    float center=left+o.getWidth()/2f,expected=video.exactCenterX();
    CaptionDiagnostics.mark(a,"CAPTION_HORIZONTAL_PLACEMENT",
        "player_type="+playerType+";app_layout_direction="+h.getLayoutDirection()
        +";player_layout_direction="+CaptionSurface.playerLayoutDirection()
        +";caption_text_direction="+t.getTextDirection()+";caption_text_layout_direction="+t.getLayoutDirection()
        +";caption_outer_layout_direction="+o.getLayoutDirection()
        +";video_rect="+video.flattenToString()+";caption_outer_rect="+left+","+top+","+(left+o.getWidth())+","+(top+o.getHeight())
        +";expected_center_x="+expected+";actual_center_x="+center+";center_error_px="+(center-expected)
        +";session="+session+";owner_epoch="+ownerEpoch+";render_epoch="+renderEpoch);
    cancel();
  }
}
