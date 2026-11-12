package e.e.a;

import android.content.Context;
import android.graphics.*;
import android.view.*;
import android.widget.*;

/** One surface; buttons receive taps, while the popup's picture receives drag/pinch. */
final class NicolivePlayerFrame extends FrameLayout {
 final TextureView video;
 final NicoliveCommentsView comments;
 final LinearLayout bottom,top;
 final ImageButton play;ImageButton cc,reconnect,popout;Boolean lastComments;
 final TextView live;
 final boolean popup;
 final ScaleGestureDetector scale;
 final int touchSlop;
 NicoliveService owner;
 float ratio=16f/9,downX,downY;
 int originX,originY;
 boolean pictureTouch,dragging,resizing,pinched;
 Boolean lastPlaying;
 final Runnable hideControls=new Runnable(){public void run(){if(owner!=null&&owner.playRequested()&&!dragging&&!resizing)bottom.setVisibility(GONE);}};

 NicolivePlayerFrame(final Context c,boolean pop){
  super(c);popup=pop;touchSlop=ViewConfiguration.get(c).getScaledTouchSlop();setBackgroundColor(Color.BLACK);setClickable(true);
  video=new TextureView(c);addView(video,new FrameLayout.LayoutParams(-1,-1));
  comments=new NicoliveCommentsView(c);addView(comments,new FrameLayout.LayoutParams(-1,-1));
  top=NicoliveUi.row(c);bottom=NicoliveUi.row(c);bottom.setBackgroundColor(0xb0000000);
  addView(bottom,new FrameLayout.LayoutParams(-1,NicoliveUi.dp(c,36),Gravity.BOTTOM));
  play=NicoliveUi.icon(c,"pause","一時停止");play.setImageDrawable(new NicoliveUi.Glyph("pause",Color.WHITE));bottom.addView(play);
  play.setOnClickListener(v->{if(owner!=null){if(owner.playRequested())owner.pause();else owner.resume();revealControls();}});
  live=NicoliveUi.text(c,"LIVE",12);live.setGravity(Gravity.CENTER);live.setPadding(NicoliveUi.dp(c,4),0,NicoliveUi.dp(c,4),0);live.setContentDescription("最新の再生位置へ戻る");live.setTextColor(NicoliveUi.videoAccent(c));live.setTextSize(12);live.setSingleLine(true);live.setMinWidth(0);live.setMinimumWidth(0);
  bottom.addView(live,new LinearLayout.LayoutParams(0,-1,1));live.setOnClickListener(v->{if(owner!=null){owner.goLive();revealControls();}});
  if(!pop){
   cc=NicoliveUi.icon(c,"comments","コメント表示");cc.setImageDrawable(new NicoliveUi.Glyph("comments",Color.WHITE));bottom.addView(cc);
   cc.setOnClickListener(v->{if(owner!=null){owner.toggleComments();revealControls();}});
  }
  if(!pop){reconnect=NicoliveUi.icon(c,"refresh","再接続");reconnect.setImageDrawable(new NicoliveUi.Glyph("refresh",Color.WHITE));bottom.addView(reconnect);reconnect.setOnClickListener(v->{if(owner!=null)owner.reconnect();});popout=NicoliveUi.icon(c,"popup","ポップアップ");popout.setImageDrawable(new NicoliveUi.Glyph("popup",Color.WHITE));bottom.addView(popout);popout.setOnClickListener(v->{if(c instanceof NicoliveActivity)((NicoliveActivity)c).popup();});fullscreen(false);}
  ImageButton expand=NicoliveUi.icon(c,"expand",pop?"通常画面へ":"全画面");expand.setImageDrawable(new NicoliveUi.Glyph("expand",Color.WHITE));bottom.addView(expand);
  expand.setOnClickListener(v->{if(owner==null)return;if(popup)owner.returnToActivity();else if(c instanceof NicoliveActivity)((NicoliveActivity)c).toggleFullscreen();});
  ImageButton last=NicoliveUi.icon(c,pop?"close":"settings",pop?"再生を終了":"画質と表示設定");last.setImageDrawable(new NicoliveUi.Glyph(pop?"close":"settings",Color.WHITE));bottom.addView(last);
  last.setOnClickListener(v->{if(owner==null)return;if(popup)owner.stopPlayback();else if(c instanceof NicoliveActivity)((NicoliveActivity)c).playerSettings();});
  for(int i=0;i<bottom.getChildCount();i++){View child=bottom.getChildAt(i);if(child instanceof ImageButton){child.setLayoutParams(new LinearLayout.LayoutParams(NicoliveUi.dp(c,40),NicoliveUi.dp(c,36)));child.setPadding(NicoliveUi.dp(c,8),NicoliveUi.dp(c,6),NicoliveUi.dp(c,8),NicoliveUi.dp(c,6));}}
  if(pop){
   top.setGravity(Gravity.TOP|Gravity.CENTER_HORIZONTAL);top.setPadding(0,NicoliveUi.dp(c,5),0,0);
   View handle=new View(c);handle.setBackgroundColor(NicoliveUi.videoAccent(c));top.addView(handle,new LinearLayout.LayoutParams(NicoliveUi.dp(c,32),NicoliveUi.dp(c,2)));
   addView(top,new FrameLayout.LayoutParams(-1,NicoliveUi.dp(c,14),Gravity.TOP));
   setContentDescription("映像をドラッグして移動、ピンチでサイズ変更");
  }
  scale=new ScaleGestureDetector(c,new ScaleGestureDetector.SimpleOnScaleGestureListener(){
   public boolean onScaleBegin(ScaleGestureDetector d){resizing=true;pinched=true;return true;}
   public boolean onScale(ScaleGestureDetector d){if(owner!=null&&owner.popupParams!=null)owner.scalePopup(d.getScaleFactor(),d.getFocusX(),d.getFocusY());return true;}
  });
  scale.setQuickScaleEnabled(false);scale.setStylusScaleEnabled(false);
  video.addOnLayoutChangeListener((v,l,t,r,b,ol,ot,or,ob)->transform());
 }

 void fullscreen(boolean full){if(reconnect!=null)reconnect.setVisibility(full?VISIBLE:GONE);if(popout!=null)popout.setVisibility(full?VISIBLE:GONE);}
 void aspect(float value){ratio=value>0?value:16f/9;transform();}
 void transform(){int w=video.getWidth(),h=video.getHeight();if(w==0||h==0)return;float box=w/(float)h;Matrix m=new Matrix();if(box>ratio)m.setScale(ratio/box,1,w/2f,h/2f);else m.setScale(1,box/ratio,w/2f,h/2f);video.setTransform(m);}
 void revealControls(){bottom.setVisibility(VISIBLE);removeCallbacks(hideControls);if(owner!=null&&owner.playRequested())postDelayed(hideControls,3000);updateControls();}
 void updateControls(){
  if(owner==null)return;boolean playing=owner.playRequested();
  if(lastPlaying==null||lastPlaying!=playing){
   play.setContentDescription(playing?"一時停止":"再生");play.setImageDrawable(new NicoliveUi.Glyph(playing?"pause":"play",Color.WHITE));lastPlaying=playing;
   bottom.setVisibility(VISIBLE);removeCallbacks(hideControls);if(playing)postDelayed(hideControls,3000);
  }
  if(cc!=null&&(lastComments==null||lastComments!=owner.commentVisible)){lastComments=owner.commentVisible;cc.setSelected(owner.commentVisible);cc.setContentDescription(owner.commentVisible?"コメントを非表示":"コメントを表示");cc.setImageDrawable(new NicoliveUi.Glyph(owner.commentVisible?"comments":"comments-off",owner.commentVisible?NicoliveUi.videoAccent(getContext()):Color.WHITE));}
  if(bottom.getVisibility()!=VISIBLE)return;
  String label=owner.terminal?"放送終了":playing?"LIVE":"一時停止";
  if(playing&&owner.program!=null&&owner.program.begin>0&&(!popup||getWidth()>=NicoliveUi.dp(getContext(),260)))label+=" "+NicoliveUi.time(Math.max(0,System.currentTimeMillis()/1000-owner.program.begin));
  if(!label.contentEquals(live.getText()))live.setText(label);
 }

 @Override public boolean dispatchTouchEvent(MotionEvent event){
  if(popup){
   int action=event.getActionMasked();
   if(action==MotionEvent.ACTION_DOWN){
    dragging=resizing=pinched=false;pictureTouch=bottom.getVisibility()!=VISIBLE||event.getY()<bottom.getTop();
    downX=event.getRawX();downY=event.getRawY();if(owner!=null&&owner.popupParams!=null){originX=owner.popupParams.x;originY=owner.popupParams.y;}
   }
   // Feed the complete sequence, including DOWN, before Android starts interception.
   scale.onTouchEvent(event);
   if(action==MotionEvent.ACTION_POINTER_DOWN&&event.getPointerCount()>1){resizing=true;pinched=true;}
   if(action==MotionEvent.ACTION_MOVE&&pictureTouch&&!pinched&&Math.hypot(event.getRawX()-downX,event.getRawY()-downY)>touchSlop)dragging=true;
   boolean handled=super.dispatchTouchEvent(event);
   if(action==MotionEvent.ACTION_UP||action==MotionEvent.ACTION_CANCEL){dragging=resizing=false;}
   return handled;
  }
  return super.dispatchTouchEvent(event);
 }
 @Override public boolean onInterceptTouchEvent(MotionEvent event){return popup&&(dragging||resizing);}
 @Override public boolean onTouchEvent(MotionEvent event){
  if(popup){
   if(owner==null||owner.popupParams==null)return true;
   int action=event.getActionMasked();
   if(action==MotionEvent.ACTION_MOVE&&dragging&&!pinched)owner.movePopup(originX+Math.round(event.getRawX()-downX),originY+Math.round(event.getRawY()-downY));
   if(action==MotionEvent.ACTION_UP){if(!dragging&&!pinched)performClick();else revealControls();}
   return true;
  }
  return super.onTouchEvent(event);
 }
 @Override public boolean performClick(){super.performClick();if(bottom.getVisibility()==VISIBLE&&owner!=null&&owner.playRequested())bottom.setVisibility(GONE);else revealControls();return true;}
 @Override protected void onDetachedFromWindow(){removeCallbacks(hideControls);comments.clear();super.onDetachedFromWindow();}
}
