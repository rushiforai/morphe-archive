"""Strict source overlay for v2.0.2-dev.1 NicoLive app-bar placement."""
import importlib.util
from pathlib import Path

ROOT=Path(__file__).resolve().parent
PREVIOUS=ROOT.parent / "v2.0.1-dev.7/patch_207.py"
spec=importlib.util.spec_from_file_location("_nicoid_207_overlay", PREVIOUS)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES=frozenset(set(previous.OVERRIDES)|{"NicoliveActivity.java","NicolivePlayerFrame.java","NicoliveUi.java"})

def once(source,old,new,label):
    if source.count(old)!=1:
        raise ValueError(f"NicoLive {label}: expected one anchor, got {source.count(old)}")
    return source.replace(old,new)

def patch_activity(source):
    source=once(source,
        '  body.addView(hubNavigation());\n  updateNowPlaying();',
        '   body.addView(hubNavigation());\n'
        '   NicoliveAppBarPlacement.place(root,body,header,NicoliveAppBarPlacement.position(prefs()));\n'
        '   updateNowPlaying();',"hub navigation placement")
    source=once(source,
        '  Button tap=settingChoiceRow(options,refresh.getCompoundPaddingStart());',
        '  Button tap=settingChoiceRow(options,refresh.getCompoundPaddingStart());\n'
        '   Button appBar=settingChoiceRow(options,refresh.getCompoundPaddingStart());',
        "new app bar choice")
    source=once(source,
        '   ExitModeOptions.mode(this,ExitModeOptions.LIVE_KEY)};',
        '    ExitModeOptions.mode(this,ExitModeOptions.LIVE_KEY),\n'
        '    NicoliveAppBarPlacement.position(preferences)};',
        "app bar state")
    source=once(source,
        '  bindSettingChoice(tap,"タップ時の動作",new String[]{"通常再生","ポップアップ再生"},selections,2);',
        '  bindSettingChoice(tap,"タップ時の動作",new String[]{"通常再生","ポップアップ再生"},selections,2);\n'
        '   bindSettingChoice(appBar,"アプリバーの配置",NicoliveAppBarPlacement.LABELS,selections,4);',
        "new setting choice")
    source=once(source,
        '.putBoolean(START_TIME,selections[1]==1).putInt(TAP_BEHAVIOR,selections[2]).apply();\n    updateHubDisplayOptions();',
        '.putBoolean(START_TIME,selections[1]==1).putInt(TAP_BEHAVIOR,selections[2])\n'
        '      .putInt(NicoliveAppBarPlacement.KEY,selections[4]).apply();\n'
        '     if(!watching)NicoliveAppBarPlacement.place(root,body,header,selections[4]);\n'
        '     updateHubDisplayOptions();',
        "apply without network reload")
    # The NicoLive overflow is a compact action menu, not a settings page.
    # Keep its placement attached to the actual 3-dot button even when
    # the live app bar is moved around the bottom navigation.
    source=once(source,
        'AlertDialog menu=UiDialogs.builder(this).setTitle("ニコ生")',
        'AlertDialog menu=UiDialogs.builder(this)',
        "remove redundant NicoLive menu heading")
    source=once(source,
        '''  if(window!=null){
   window.setGravity(Gravity.TOP|Gravity.END);
   WindowManager.LayoutParams layout=window.getAttributes();
   layout.y=NicoliveUi.dp(this,48);
   window.setAttributes(layout);
   window.setLayout(Math.min(getResources().getDisplayMetrics().widthPixels,NicoliveUi.dp(this,288)),
    ViewGroup.LayoutParams.WRAP_CONTENT);
  }''',
        '''   if(window!=null){
    android.graphics.Rect visible=new android.graphics.Rect();
    getWindow().getDecorView().getWindowVisibleDisplayFrame(visible);
    int[] anchor=new int[2];
    header.getLocationOnScreen(anchor);
    int location=NicoliveAppBarPlacement.position(prefs());
    if(location==0){
     window.setGravity(Gravity.TOP|Gravity.END);
    }else{
     window.setGravity(Gravity.BOTTOM|Gravity.END);
    }
    WindowManager.LayoutParams layout=window.getAttributes();
    layout.x=NicoliveUi.dp(this,8);
    layout.y=location==0
     ? Math.max(0,anchor[1]+header.getHeight()-visible.top)
     : Math.max(0,visible.bottom-anchor[1]);
    window.setAttributes(layout);
    int available=Math.max(NicoliveUi.dp(this,200),
     getResources().getDisplayMetrics().widthPixels-NicoliveUi.dp(this,24));
    window.setLayout(Math.min(available,NicoliveUi.dp(this,244)),
     ViewGroup.LayoutParams.WRAP_CONTENT);
   }''',
        "overflow aligned with current app bar and sized to actions")
    return source

def patch_player(source):
    name="NicolivePlayerFrame.java"
    source=once(source,
        '''  if(pop){
   top.setGravity(Gravity.TOP|Gravity.CENTER_HORIZONTAL);top.setPadding(0,NicoliveUi.dp(c,5),0,0);
   View handle=new View(c);handle.setBackgroundColor(NicoliveUi.videoAccent(c));top.addView(handle,new LinearLayout.LayoutParams(NicoliveUi.dp(c,32),NicoliveUi.dp(c,2)));
   addView(top,new FrameLayout.LayoutParams(-1,NicoliveUi.dp(c,14),Gravity.TOP));
   setContentDescription("映像をドラッグして移動、ピンチでサイズ変更");
  }''',
        '''  if(pop){
   // The native video popup has no decorative drag bar. The picture itself
   // receives drag, pinch and edge-resize gestures.
   setContentDescription("映像をドラッグして移動、四隅またはピンチでサイズ変更");
  }''',
        "remove unnecessary centered drag handle")
    source=once(source,
        ''' Boolean lastPlaying;''',
        ''' Boolean lastPlaying;
 final PopupTouchPolicy125.State tapPolicy=new PopupTouchPolicy125.State();
 Runnable pendingTap;
 boolean cornerResize,cornerLeft,cornerTop;
 int cornerWidth,cornerX,cornerY;''',
        "reuse normal popup double-tap and accidental-touch policy")
    start=source.index(" @Override public boolean dispatchTouchEvent(MotionEvent event){")
    end=source.index(" @Override protected void onDetachedFromWindow()",start)
    old=source[start:end]
    new=''' @Override public boolean dispatchTouchEvent(MotionEvent event){
  if(!popup)return super.dispatchTouchEvent(event);
  int action=event.getActionMasked();
  if(action==MotionEvent.ACTION_DOWN){
   if(pendingTap!=null){removeCallbacks(pendingTap);pendingTap=null;}
   dragging=resizing=pinched=cornerResize=false;
   downX=event.getRawX();downY=event.getRawY();
   if(owner!=null&&owner.popupParams!=null){
    originX=owner.popupParams.x;originY=owner.popupParams.y;
   }
   pictureTouch=bottom.getVisibility()!=VISIBLE||event.getY()<bottom.getTop();
   if(owner!=null&&owner.popupParams!=null
       &&NicolivePopupCorner202.hit(event.getX(),event.getY(),
           getWidth(),getHeight(),getResources().getDisplayMetrics().density)){
    cornerResize=true;cornerLeft=event.getX()<getWidth()/2f;
    cornerTop=event.getY()<getHeight()/2f;
    cornerWidth=owner.popupParams.width;
    cornerX=owner.popupParams.x;cornerY=owner.popupParams.y;
    tapPolicy.cancel();
    return true;
   }
   if(!pictureTouch){
    // Buttons and other interactive controls remain immediate.
    tapPolicy.cancel();
    return super.dispatchTouchEvent(event);
   }
   tapPolicy.begin(event.getEventTime(),downX,downY,
       bottom.getVisibility()==VISIBLE,false,
       ViewConfiguration.get(getContext()).getScaledDoubleTapSlop(),
       ViewConfiguration.getDoubleTapTimeout());
   scale.onTouchEvent(event);
   return true;
  }
  if(cornerResize){
   if(action==MotionEvent.ACTION_POINTER_DOWN){
    cornerResize=false;pinched=resizing=true;tapPolicy.cancel();
    return true;
   }
   if(action==MotionEvent.ACTION_MOVE&&owner!=null&&owner.popupParams!=null){
    float dx=event.getRawX()-downX,dy=event.getRawY()-downY;
    if(Math.hypot(dx,dy)>touchSlop){
     dragging=true;
     owner.cornerResizePopup(cornerWidth,cornerX,cornerY,
         dx,dy,cornerLeft,cornerTop);
    }
   }
   if(action==MotionEvent.ACTION_UP||action==MotionEvent.ACTION_CANCEL)
    cornerResize=dragging=resizing=false;
   return true;
  }
  if(!pictureTouch)return super.dispatchTouchEvent(event);
  if(action==MotionEvent.ACTION_POINTER_DOWN){
   tapPolicy.cancel();pinched=resizing=true;
   scale.onTouchEvent(event);return true;
  }
  if(action==MotionEvent.ACTION_POINTER_UP){
   scale.onTouchEvent(event);tapPolicy.cancel();pinched=true;return true;
  }
  if(action==MotionEvent.ACTION_MOVE){
   scale.onTouchEvent(event);
   if(!pinched){
    tapPolicy.move(event.getRawX(),event.getRawY(),touchSlop);
    if(Math.hypot(event.getRawX()-downX,event.getRawY()-downY)>touchSlop)
     dragging=true;
    if(dragging&&owner!=null&&owner.popupParams!=null)
     owner.movePopup(originX+Math.round(event.getRawX()-downX),
         originY+Math.round(event.getRawY()-downY));
   }
   return true;
  }
  if(action==MotionEvent.ACTION_UP){
   scale.onTouchEvent(event);
   tapPolicy.move(event.getRawX(),event.getRawY(),touchSlop);
   int result=PopupTouchPolicy125.NONE;
   if(!dragging&&!pinched)
    result=tapPolicy.end(event.getEventTime(),
        ViewConfiguration.getLongPressTimeout());
   else tapPolicy.cancel();
   if(result==PopupTouchPolicy125.DOUBLE_TAP){
    // Match the normal nicoid popup: only the second finger release can
    // close playback. No accidental close during a drag, pinch or edge touch.
    if(owner!=null)owner.stopPlayback();
   }else if(result==PopupTouchPolicy125.SINGLE_TAP){
    final NicoliveService session=owner;
    Runnable tap=new Runnable(){
     @Override public void run(){
      if(pendingTap!=this)return;
      pendingTap=null;
      if(isAttachedToWindow()&&owner==session&&session!=null)performClick();
     }
    };
    pendingTap=tap;
    postDelayed(tap,ViewConfiguration.getDoubleTapTimeout()+1L);
   }
   dragging=resizing=pinched=false;
   return true;
  }
  if(action==MotionEvent.ACTION_CANCEL){
   tapPolicy.cancel();dragging=resizing=pinched=false;
   return true;
  }
  return true;
 }
 @Override public boolean onTouchEvent(MotionEvent event){
  return popup||super.onTouchEvent(event);
 }
 @Override public boolean performClick(){
  super.performClick();
  if(bottom.getVisibility()==VISIBLE&&owner!=null&&owner.playRequested())
   bottom.setVisibility(GONE);
  else revealControls();
  return true;
 }
'''
    source=once(source,old,new,"replace video popup touch arbitration")
    source=once(source,
        ' @Override protected void onDetachedFromWindow(){removeCallbacks(hideControls);comments.clear();super.onDetachedFromWindow();}',
        ''' @Override protected void onDetachedFromWindow(){
  removeCallbacks(hideControls);
  if(pendingTap!=null){removeCallbacks(pendingTap);pendingTap=null;}
  tapPolicy.reset();
  comments.clear();
  super.onDetachedFromWindow();
 }''',
        "cancel delayed popup taps on detach")
    return source

def patch_statistics(source):
    return once(source,
        'new android.text.style.ImageSpan(g,android.text.style.ImageSpan.ALIGN_BASELINE)',
        'new NicoliveStatSpan202(g)',
        "center viewer/comment icons on text")

def patch_service(source):
    return once(source,
        ' void movePopup(int x,int y){',
        ''' // Apply the same four-corner aspect-safe drag geometry as the
 // existing normal Nicoid popup. Keep the corner opposite the finger fixed.
 void cornerResizePopup(int initialWidth,int initialX,int initialY,
                        float dx,float dy,boolean left,boolean top){
  if(popupParams==null||!(aspect>0))return;
  android.util.DisplayMetrics dm=getResources().getDisplayMetrics();
  int[] result=NicolivePopupCorner202.bounds(initialWidth,initialX,initialY,
   dx,dy,left,top,aspect,dm.widthPixels,dm.heightPixels,NicoliveUi.dp(this,192));
  popupParams.x=result[2];popupParams.y=result[3];
  resizePopup(result[0]);
 }
 void movePopup(int x,int y){''',
        "share native nicoid corner-resize behavior")

def stage(base,destination):
    base=Path(base);destination=Path(destination)
    previous.stage(base,destination)
    target=destination/"NicoliveActivity.java"
    if not target.is_file():
        target.write_text((base/"NicoliveActivity.java").read_text(encoding="utf-8"),encoding="utf-8")
    target.write_text(patch_activity(target.read_text(encoding="utf-8")),encoding="utf-8")
    for filename,transform in (("NicoliveService.java",patch_service),
                               ("NicolivePlayerFrame.java",patch_player),
                               ("NicoliveUi.java",patch_statistics)):
        source=destination/filename
        if not source.is_file():
            source=base/filename
        if not source.is_file():
            raise FileNotFoundError(source)
        (destination/filename).write_text(
            transform(source.read_text(encoding="utf-8")),encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
