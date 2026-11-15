package e.e.a;
import android.app.Activity;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.FrameLayout;
import android.widget.ImageButton;

/**
 * Movable in-app NicoLive mini window. Keeps the existing Media3 player,
 * incoming comment renderer and one video TextureView; never reconnects.
 */
final class NicoliveFloatingMini204 extends FrameLayout {
 final Activity host;
 final NicolivePlayerFrame picture;
 final int slop;
 final ImageButton pause, close;
 float downX,downY,startX,startY;
 boolean dragging;
 final Runnable open;
 final Runnable terminate;
 NicoliveFloatingMini204(Activity activity,NicolivePlayerFrame player,
                         Runnable openVideo,Runnable closeVideo) {
  super(activity);
  host=activity;picture=player;open=openVideo;terminate=closeVideo;
  slop=ViewConfiguration.get(activity).getScaledTouchSlop();
  setClickable(true);setClipChildren(true);setClipToPadding(false);
  GradientDrawable background=new GradientDrawable();
  background.setColor(Color.BLACK);
  background.setCornerRadius(NicoliveUi.dp(activity,10));
  background.setStroke(NicoliveUi.dp(activity,1),0x99686868);
  setBackground(background);
  setClipToOutline(true);
  addView(picture,new FrameLayout.LayoutParams(-1,-1));
  pause=NicoliveUi.icon(activity,"pause","一時停止");
  close=NicoliveUi.icon(activity,"close","再生を終了");
  int control=NicoliveUi.dp(activity,40);
  FrameLayout.LayoutParams left=new FrameLayout.LayoutParams(control,control,
       Gravity.LEFT|Gravity.TOP);
  FrameLayout.LayoutParams right=new FrameLayout.LayoutParams(control,control,
       Gravity.RIGHT|Gravity.TOP);
  addView(pause,left);addView(close,right);
  pause.setBackgroundColor(0x77000000);close.setBackgroundColor(0x77000000);
 }
 static NicoliveFloatingMini204 install(NicoliveActivity activity,
               NicolivePlayerFrame picture,Runnable open,Runnable close) {
  FrameLayout content=activity.findViewById(android.R.id.content);
  if(content==null)return null;
  NicoliveFloatingMini204 mini=new NicoliveFloatingMini204(activity,picture,open,close);
  int width=Math.min(NicoliveUi.dp(activity,196),
       activity.getResources().getDisplayMetrics().widthPixels-NicoliveUi.dp(activity,24));
  FrameLayout.LayoutParams p=new FrameLayout.LayoutParams(width,
       Math.round(width*9f/16f),Gravity.END|Gravity.BOTTOM);
  p.setMargins(NicoliveUi.dp(activity,12),0,NicoliveUi.dp(activity,12),
       NicoliveUi.dp(activity,73));
  content.addView(mini,p);
  mini.setElevation(NicoliveUi.dp(activity,6));
  return mini;
 }
 void sync(NicoliveService live) {
  if(live==null)return;
  boolean playing=live.playRequested();
  pause.setImageDrawable(new NicoliveUi.Glyph(playing?"pause":"play",Color.WHITE));
  pause.setContentDescription(playing?"一時停止":"再生");
  pause.setOnClickListener(v->{
   if(live.playRequested())live.pause();else live.resume();
   sync(live);
  });
  close.setOnClickListener(v->terminate.run());
  picture.comments.setVisibility(live.commentVisible&&!live.audioOnly?VISIBLE:GONE);
 }
 @Override public boolean onTouchEvent(MotionEvent e){
  switch(e.getActionMasked()){
   case MotionEvent.ACTION_DOWN:
    downX=e.getRawX();downY=e.getRawY();
    startX=getTranslationX();startY=getTranslationY();dragging=false;
    return true;
   case MotionEvent.ACTION_MOVE:
    float deltaX=e.getRawX()-downX,deltaY=e.getRawY()-downY;
    if(!dragging&&Math.hypot(deltaX,deltaY)>slop)dragging=true;
    if(dragging){
     FrameLayout content=(FrameLayout)getParent();
     int[] origin=new int[2],location=new int[2];
     content.getLocationOnScreen(origin);
     getLocationOnScreen(location);
     float x=Math.max(-location[0]+origin[0]+getTranslationX(),
         Math.min(content.getWidth()-getWidth()-location[0]+origin[0]+getTranslationX(),
                  startX+deltaX));
     float y=Math.max(-location[1]+origin[1]+getTranslationY(),
         Math.min(content.getHeight()-getHeight()-location[1]+origin[1]+getTranslationY(),
                  startY+deltaY));
     setTranslationX(x);setTranslationY(y);
    }
    return true;
   case MotionEvent.ACTION_UP:
    if(!dragging)open.run();
    return true;
   case MotionEvent.ACTION_CANCEL:return true;
   default:return super.onTouchEvent(e);
  }
 }
}
