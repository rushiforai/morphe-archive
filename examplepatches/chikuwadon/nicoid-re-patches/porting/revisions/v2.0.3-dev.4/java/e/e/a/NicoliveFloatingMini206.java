package e.e.a;
import android.app.Activity;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.FrameLayout;
import android.widget.ImageButton;

/** Same four-corner resize geometry as the native Niconico popup. */
final class NicoliveFloatingMini206 extends FrameLayout {
 final Activity host;
 final NicolivePlayerFrame picture;
 final ImageButton pause,close;
 final Runnable reopen,terminate;
 final ScaleGestureDetector scale;
 final int slop;
 boolean controlsShown,dragged,scaled,edgeResize,resizeLeft,resizeTop,controlSequence;
 float downX,downY,initialX,initialY,initialWidth,initialHeight;
 final Runnable hide=new Runnable(){public void run(){showControls(false);}};
 NicoliveFloatingMini206(Activity a,NicolivePlayerFrame player,Runnable open,Runnable stop){
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
   button.setBackground(circle); // No white outline around the round control
   int pad=NicoliveUi.dp(a,6);
   button.setPadding(pad,pad,pad,pad);
   button.setVisibility(GONE);
  }
  pause.setOnClickListener(v->{NicoliveService live=picture.owner;if(live!=null){
   if(live.playRequested())live.pause();else live.resume();sync(live);showControls(true);
  }});
  close.setOnClickListener(v->{showControls(false);terminate.run();});
  scale=new ScaleGestureDetector(a,new ScaleGestureDetector.SimpleOnScaleGestureListener(){
   @Override public boolean onScale(ScaleGestureDetector detector){
    scaled=true;
    float oldW=getWidth(),oldH=getHeight();
    if(oldW<=0||oldH<=0)return true;
    int newW=Math.round(oldW*detector.getScaleFactor());
    float x=getLeft()+getTranslationX()+detector.getFocusX();
    float y=getTop()+getTranslationY()+detector.getFocusY();
    float nx=x-(detector.getFocusX()/oldW)*newW;
    float ny=y-(detector.getFocusY()/oldH)*(newW*9f/16f);
    layoutAt(newW,nx,ny);
    return true;
   }
  });
 }
 static NicoliveFloatingMini206 install(NicoliveActivity a,NicolivePlayerFrame player,Runnable open,Runnable close){
  FrameLayout host=a.findViewById(android.R.id.content);
  if(host==null)return null;
  NicoliveFloatingMini206 mini=new NicoliveFloatingMini206(a,player,open,close);
  int width=Math.max(NicoliveUi.dp(a,128),Math.min(NicoliveUi.dp(a,196),
      a.getResources().getDisplayMetrics().widthPixels-NicoliveUi.dp(a,24)));
  FrameLayout.LayoutParams params=new FrameLayout.LayoutParams(width,Math.round(width*9f/16f),
      Gravity.RIGHT|Gravity.BOTTOM);
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
 private boolean hit(View v,MotionEvent e){
  int[] p=new int[2];v.getLocationOnScreen(p);
  return e.getRawX()>=p[0]&&e.getRawX()<=p[0]+v.getWidth()
      &&e.getRawY()>=p[1]&&e.getRawY()<=p[1]+v.getHeight();
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
 private void layoutAt(int requestedWidth,float x,float y){
  if(!(getParent() instanceof FrameLayout))return;
  FrameLayout parent=(FrameLayout)getParent();
  int parentW=parent.getWidth(),parentH=parent.getHeight();
  if(parentW<=0||parentH<=0)return;
  int min=NicoliveUi.dp(host,128);
  int max=Math.max(min,parentW-NicoliveUi.dp(host,16));
  int width=Math.max(min,Math.min(max,requestedWidth));
  int height=Math.round(width*9f/16f);
  x=Math.max(0,Math.min(x,parentW-width));
  y=Math.max(0,Math.min(y,parentH-height));
  FrameLayout.LayoutParams params=new FrameLayout.LayoutParams(width,height,Gravity.TOP|Gravity.LEFT);
  params.leftMargin=Math.round(x);
  params.topMargin=Math.round(y);
  setTranslationX(0);setTranslationY(0);
  setLayoutParams(params);
 }
 @Override public boolean onTouchEvent(MotionEvent e){
  scale.onTouchEvent(e);
  switch(e.getActionMasked()){
   case MotionEvent.ACTION_DOWN:
    downX=e.getRawX();downY=e.getRawY();
    initialX=getLeft()+getTranslationX();initialY=getTop()+getTranslationY();
    initialWidth=getWidth();initialHeight=getHeight();
    dragged=false;scaled=false;
    float px=e.getX(),py=e.getY(),edge=NicoliveUi.dp(host,30);
    resizeLeft=px<edge;resizeTop=py<edge;
    edgeResize=(resizeLeft||px>getWidth()-edge)&&(resizeTop||py>getHeight()-edge);
    return true;
   case MotionEvent.ACTION_POINTER_DOWN:scaled=true;return true;
   case MotionEvent.ACTION_MOVE:
    if(e.getPointerCount()>1){scaled=true;return true;}
    float dx=e.getRawX()-downX,dy=e.getRawY()-downY;
    if(!dragged&&Math.hypot(dx,dy)>slop)dragged=true;
    if(dragged&&!scaled){
     if(edgeResize){
      // Same projected diagonal growth and opposing-corner anchor as
      // PopupResize236.corner used by ordinary Nicoid video popups.
      float ratio=16f/9f;
      float horizontal=resizeLeft?-dx:dx;
      float vertical=resizeTop?-dy:dy;
      float delta=(horizontal*ratio+vertical)/(ratio*ratio+1);
      int h=Math.max(1,Math.round(initialHeight+delta));
      int w=Math.round(h*ratio);
      float x=resizeLeft?initialX+initialWidth-w:initialX;
      float y=resizeTop?initialY+initialHeight-h:initialY;
      layoutAt(w,x,y);
     }else{
      layoutAt(Math.round(initialWidth),initialX+dx,initialY+dy);
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
