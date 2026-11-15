package e.e.a;
import android.app.Activity;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.FrameLayout;
import android.widget.ImageButton;

/** One movable, resizable in-app Media3 output and its live comments. */
final class NicoliveFloatingMini205 extends FrameLayout {
 final Activity host;
 final NicolivePlayerFrame picture;
 final ImageButton pause,close;
 final Runnable reopen,terminate;
 final ScaleGestureDetector scale;
 final int slop;
 boolean controlsShown,dragged,scaled,edgeResize,controlSequence;
 float downX,downY,initialX,initialY,initialWidth;
 final Runnable hide=new Runnable(){public void run(){showControls(false);}};
 NicoliveFloatingMini205(Activity a,NicolivePlayerFrame player,Runnable open,Runnable stop){
  super(a);host=a;picture=player;reopen=open;terminate=stop;
  slop=ViewConfiguration.get(a).getScaledTouchSlop();
  setClickable(true);setClipChildren(true);
  GradientDrawable bg=new GradientDrawable();bg.setColor(Color.BLACK);
  bg.setCornerRadius(NicoliveUi.dp(a,10));
  bg.setStroke(NicoliveUi.dp(a,1),0x99686868);
  setBackground(bg);setClipToOutline(true);
  addView(picture,new FrameLayout.LayoutParams(-1,-1));
  pause=NicoliveUi.icon(a,"pause","再生・一時停止");
  close=NicoliveUi.icon(a,"close","再生を終了");
  int control=NicoliveUi.dp(a,42);
  addView(pause,new FrameLayout.LayoutParams(control,control,Gravity.TOP|Gravity.LEFT));
  addView(close,new FrameLayout.LayoutParams(control,control,Gravity.TOP|Gravity.RIGHT));
  for(ImageButton button:new ImageButton[]{pause,close}){
   GradientDrawable circle=new GradientDrawable();
   circle.setShape(GradientDrawable.OVAL);circle.setColor(0xb5000000);
   circle.setStroke(NicoliveUi.dp(a,1),0x88ffffff);
   button.setBackground(circle);
   int pad=NicoliveUi.dp(a,6);
   button.setPadding(pad,pad,pad,pad);
   button.setVisibility(GONE);
  }
  pause.setOnClickListener(v->{NicoliveService live=picture.owner;if(live!=null){
     if(live.playRequested())live.pause();else live.resume();sync(live);
     showControls(true);
  }});
  close.setOnClickListener(v->{showControls(false);terminate.run();});
  scale=new ScaleGestureDetector(a,new ScaleGestureDetector.SimpleOnScaleGestureListener(){
   @Override public boolean onScale(ScaleGestureDetector d){
    scaled=true;resize(Math.round(getWidth()*d.getScaleFactor()));return true;
   }
  });
 }
 static NicoliveFloatingMini205 install(NicoliveActivity a,NicolivePlayerFrame player,Runnable open,Runnable close){
  FrameLayout host=a.findViewById(android.R.id.content);
  if(host==null)return null;
  NicoliveFloatingMini205 mini=new NicoliveFloatingMini205(a,player,open,close);
  int width=Math.max(NicoliveUi.dp(a,128),Math.min(NicoliveUi.dp(a,196),
      a.getResources().getDisplayMetrics().widthPixels-NicoliveUi.dp(a,24)));
  FrameLayout.LayoutParams params=new FrameLayout.LayoutParams(width,Math.round(width*9f/16f),Gravity.RIGHT|Gravity.BOTTOM);
  int gap=NicoliveUi.dp(a,12);
  params.setMargins(gap,0,gap,NicoliveUi.dp(a,73));
  host.addView(mini,params);mini.setElevation(NicoliveUi.dp(a,6));
  return mini;
 }
 void showControls(boolean show){
  controlsShown=show;pause.setVisibility(show?VISIBLE:GONE);close.setVisibility(show?VISIBLE:GONE);
  removeCallbacks(hide);
  if(show)postDelayed(hide,4000);
 }
 void sync(NicoliveService live){
  if(live==null)return;
  boolean playing=live.playRequested();
  pause.setImageDrawable(new NicoliveUi.Glyph(playing?"pause":"play",Color.WHITE));
  pause.setContentDescription(playing?"一時停止":"再生");
  picture.comments.setVisibility(live.commentVisible&&!live.audioOnly?VISIBLE:GONE);
 }
 private boolean hit(View control,MotionEvent e){
  int[] point=new int[2];control.getLocationOnScreen(point);
  return e.getRawX()>=point[0]&&e.getRawX()<=point[0]+control.getWidth()
      &&e.getRawY()>=point[1]&&e.getRawY()<=point[1]+control.getHeight();
 }
 @Override public boolean dispatchTouchEvent(MotionEvent e){
  int action=e.getActionMasked();
  if(action==MotionEvent.ACTION_DOWN)
   controlSequence=controlsShown&&(hit(pause,e)||hit(close,e));
  if(controlSequence){
   boolean handled=super.dispatchTouchEvent(e);
   if(action==MotionEvent.ACTION_UP||action==MotionEvent.ACTION_CANCEL)controlSequence=false;
   return handled;
  }
  return onTouchEvent(e);
 }
 private int minWidth(){return NicoliveUi.dp(host,128);}
 private void resize(int width){
  if(!(getParent() instanceof FrameLayout))return;
  FrameLayout parent=(FrameLayout)getParent();
  int max=Math.max(minWidth(),parent.getWidth()-NicoliveUi.dp(host,16));
  width=Math.max(minWidth(),Math.min(max,width));
  FrameLayout.LayoutParams params=(FrameLayout.LayoutParams)getLayoutParams();
  if(params.width==width)return;
  params.width=width;params.height=Math.round(width*9f/16f);
  setLayoutParams(params);
  post(this::clamp);
 }
 private void clamp(){
  if(!(getParent() instanceof FrameLayout))return;
  FrameLayout parent=(FrameLayout)getParent();
  float px=getLeft()+getTranslationX(),py=getTop()+getTranslationY();
  float x=Math.max(0,Math.min(px,Math.max(0,parent.getWidth()-getWidth())));
  float y=Math.max(0,Math.min(py,Math.max(0,parent.getHeight()-getHeight())));
  setTranslationX(x-getLeft());setTranslationY(y-getTop());
 }
 @Override public boolean onTouchEvent(MotionEvent e){
  scale.onTouchEvent(e);
  switch(e.getActionMasked()){
   case MotionEvent.ACTION_DOWN:
    downX=e.getRawX();downY=e.getRawY();
    initialX=getLeft()+getTranslationX();initialY=getTop()+getTranslationY();
    initialWidth=getWidth();dragged=false;scaled=false;
    int edge=NicoliveUi.dp(host,20);
    edgeResize=e.getX()<=edge||e.getY()<=edge
       ||e.getX()>=getWidth()-edge||e.getY()>=getHeight()-edge;
    return true;
   case MotionEvent.ACTION_POINTER_DOWN:scaled=true;return true;
   case MotionEvent.ACTION_MOVE:
    if(e.getPointerCount()>1){scaled=true;return true;}
    float dx=e.getRawX()-downX,dy=e.getRawY()-downY;
    if(!dragged&&Math.hypot(dx,dy)>slop)dragged=true;
    if(dragged&&!scaled){
     if(edgeResize){
      float change=Math.abs(dx)>Math.abs(dy)?dx:dy*16f/9f;
      resize(Math.round(initialWidth+change));
     }else if(getParent() instanceof FrameLayout){
      FrameLayout parent=(FrameLayout)getParent();
      float x=Math.max(0,Math.min(initialX+dx,parent.getWidth()-getWidth()));
      float y=Math.max(0,Math.min(initialY+dy,parent.getHeight()-getHeight()));
      setTranslationX(x-getLeft());setTranslationY(y-getTop());
     }
    }
    return true;
   case MotionEvent.ACTION_UP:
    if(!dragged&&!scaled){if(controlsShown)reopen.run();else showControls(true);}
    return true;
   case MotionEvent.ACTION_CANCEL:return true;
   default:return true;
  }
 }
}
