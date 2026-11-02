package e.e.a;

import android.animation.*;
import android.app.*;
import android.content.*;
import android.graphics.*;
import android.os.*;
import android.preference.PreferenceManager;
import android.view.*;
import android.widget.*;
import java.lang.ref.WeakReference;

/** In-app presentation of the original ExoMedia View. No second decoder or media request. */
public final class MiniSession225 {
 private static final Handler MAIN=new Handler(Looper.getMainLooper());
 private static Application app;
 private static WeakReference<Activity> previous=new WeakReference<Activity>(null),foreground=new WeakReference<Activity>(null);
 private static Session active;
 private static final java.util.WeakHashMap<Activity,Boolean> EXPANDED=new java.util.WeakHashMap<Activity,Boolean>();
 public static boolean wasExpanded(Activity a){return EXPANDED.containsKey(a);}
 private MiniSession225(){}
 static Object get(Object o,String f)throws Exception{return Playback214.get(o,f);}
 static Object call(Object o,String name,Class<?>[] types,Object... args)throws Exception{return o.getClass().getMethod(name,types).invoke(o,args);}
 static boolean player(Activity a){return PlaybackBar221.player(a);}
 public static boolean textureBacking(Context context,boolean fallback){
  Context c=context;for(int n=0;n<8&&c!=null;n++){
   if(c.getClass().getName().equals("com.sauzask.nicoid.NicoidPopupViewService"))return true;if(c instanceof Activity)return player((Activity)c)||fallback;
   if(!(c instanceof ContextWrapper))break;Context next=((ContextWrapper)c).getBaseContext();if(next==c)break;c=next;
  }return fallback;
 }
 static boolean unavailable(String reason){ModernDebug.record("In-app mini-player unavailable: "+reason);return false;}
 public static boolean owns(Object owner){return active!=null&&active.owner==owner&&active.state.live();}
 public static boolean retaining(Activity a){return active!=null&&active.source==a&&active.state.live();}
 /** Native startActivity calls s(), which otherwise releases the decoder before onStop. */
 public static boolean retainNavigation(Activity a){return (retaining(a)||PlaybackTransfer221.retaining(a))&&!a.isFinishing()&&!a.isDestroyed();}
 static boolean settings(Activity a){return a instanceof android.preference.PreferenceActivity||a.getClass().getName().endsWith("NicoidSetting");}
 public static boolean showing(){return DirectBackground235.showing()||active!=null&&active.state.live();}public static void closeCurrent(){Session s=active;if(s!=null)s.close(true);}
 public static void videoLayout(View view,ViewGroup.LayoutParams params){Session s=active;if(s!=null&&s.state.live()&&s.video==view){s.originalParams=params;return;}view.setLayoutParams(params);}
 public static void track(Activity a){
  Application next=a.getApplication();if(next==null||app==next)return;
  if(app!=null)app.unregisterActivityLifecycleCallbacks(CALLBACKS);app=next;app.registerActivityLifecycleCallbacks(CALLBACKS);
 }
 private static final Application.ActivityLifecycleCallbacks CALLBACKS=new Application.ActivityLifecycleCallbacks(){
  public void onActivityCreated(Activity a,Bundle b){}
  public void onActivityStarted(Activity a){}
  public void onActivityResumed(Activity a){
   foreground=new WeakReference<Activity>(a);
   if(!player(a))previous=new WeakReference<Activity>(a);
   Session s=active;if(s==null)return;if(DirectBackground235.showing()){s.close(false);return;}MAIN.removeCallbacks(s.away);
   if(a==s.source){if(!s.openingDirect)s.finishRestore();return;}
   // A newly opened player owns its own session. Never mix the old video into it.
   if(player(a)){s.close(true);return;}
   try{s.attach(a);}catch(Exception e){log("Cannot attach retained player",e);s.close(true);}
  }
  public void onActivityPaused(Activity a){if(foreground.get()==a)foreground=new WeakReference<Activity>(null);Session s=active;if(s!=null){if(s.host==a)s.detach();MAIN.removeCallbacks(s.away);MAIN.postDelayed(s.away,650);}}
  public void onActivityStopped(Activity a){}
  public void onActivitySaveInstanceState(Activity a,Bundle b){}
  public void onActivityDestroyed(Activity a){Session s=active;if(s!=null){if(s.source==a)s.close(false);else if(s.host==a)s.detach();}if(previous.get()==a)previous=new WeakReference<Activity>(null);}
 };
 static void log(String message,Exception e){android.util.Log.w("nicoid-mini",message,e);}
 /** Only Back uses the in-app host. Home/app switching retains the native Service policy. */
 public static boolean back(Object activity,boolean back){
  if(!back||!(activity instanceof Activity))return false;
  Activity a=(Activity)activity;
  if(!"background".equals(PreferenceManager.getDefaultSharedPreferences(a).getString("back_playback","background")))return false;
  try{return minimize(get(a,"v"));}catch(Exception e){log("Cannot minimize player",e);return false;}
 }
 public static boolean minimizeDragged(Object owner,float distance){boolean ok=minimize(owner);if(ok&&owns(owner)){float travel=Math.max(1,active.source.getWindow().getDecorView().getHeight()-PanelUi.dp(active.source,64));active.initialExpansion=Math.max(0,Math.min(1,1-distance/travel));}return ok;}
 public static boolean minimize(Object owner){
  if(owns(owner))return true;
  Session created=null;
  try{
   Activity source=(Activity)get(owner,"A1"),destination=PlaybackNavigation114.destination(source);if(destination==null)destination=previous.get();
   if(source==null||source.isFinishing()||source.isDestroyed())return unavailable("source closed");
   if(destination==null)return unavailable("no previous app screen");
   if(destination.isFinishing()||destination.isDestroyed())return unavailable("previous screen closed");
   if(source==destination||player(destination))return unavailable("previous screen is a player");
   if(source.getTaskId()!=destination.getTaskId())return unavailable("different activity task");
   if(ModernShorts.active(source)||PlayerGestures219.flag(owner,"x0"))return unavailable("short or remote playback");
   View video=(View)get(owner,"a0");TextureView texture=texture(video);
   if(texture==null){String renderer="unknown";try{Object impl=get(video,"videoViewImpl");if(impl!=null)renderer=impl.getClass().getSimpleName();}catch(Exception ignored){}return unavailable("renderer "+renderer);}
   if(!texture.isAvailable()||texture.getSurfaceTexture()==null||video.getParent()==null)return unavailable("video surface not ready");
   if(((Number)call(video,"getDuration",new Class<?>[0])).longValue()<=0)return unavailable("video not prepared");
   if(active!=null)active.close(true);
   created=new Session(owner,source,video,texture);active=created;
   // NO_USER_ACTION prevents the explicit in-app transition from triggering Home policy.
   Intent intent=PlaybackNavigation114.browseIntent(source,destination);
   intent.setFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT|Intent.FLAG_ACTIVITY_SINGLE_TOP|Intent.FLAG_ACTIVITY_NO_ANIMATION|Intent.FLAG_ACTIVITY_NO_USER_ACTION);
   source.startActivity(intent);source.overridePendingTransition(0,0);
   final Session s=created;
   MAIN.postDelayed(s.launchTimeout,1800);
   ModernDebug.record("In-app player retained for background presentation");return true;
  }catch(Exception e){if(created!=null)created.close(false);log("Retained playback unavailable",e);return false;}
 }
 public static boolean beginMinimized(Object owner,Activity destination){
  Session created=null;try{Activity source=(Activity)get(owner,"A1");View video=(View)get(owner,"a0");TextureView texture=texture(video);if(source==null||source.isFinishing()||source.isDestroyed()||destination==source||texture==null||!(video.getParent() instanceof ViewGroup))return false;
   if(active!=null)active.close(true);created=new Session(owner,source,video,texture);created.openingDirect=true;created.directEntry=true;created.initialExpansion=0;created.directDestination=new WeakReference<Activity>(destination);active=created;MAIN.post(created.navigateDirect);return true;
  }catch(Exception e){if(created!=null)created.close(false);log("Cannot initialize retained mini presentation",e);return false;}
 }
 public static void prepared(Object owner){Session s=active;if(s==null||s.owner!=owner)return;s.directPrepared=true;s.update();if(!s.directEntry)return;try{boolean lost=false;try{lost=Boolean.TRUE.equals(get(get(s.video,"audioFocusHelper"),"pausedForLoss"));}catch(Exception ignored){}if(foreground.get()!=null&&!lost&&PlaybackSession.allowRetry(owner)&&!Boolean.TRUE.equals(call(s.video,"isPlaying",new Class<?>[0])))call(s.video,"start",new Class<?>[0]);}catch(Exception e){log("Cannot start prepared retained session",e);}}
 static TextureView texture(View root){
  if(root instanceof TextureView&&root.getClass().getName().equals("com.devbrackets.android.exomedia.core.video.exo.ExoTextureVideoView"))return (TextureView)root;
  if(root instanceof ViewGroup){ViewGroup g=(ViewGroup)root;for(int n=0;n<g.getChildCount();n++){TextureView v=texture(g.getChildAt(n));if(v!=null)return v;}}return null;
 }
 /** Keep the existing SurfaceTexture AND existing renderer Surface during View reparenting. */
 static final class SurfaceKeeper implements TextureView.SurfaceTextureListener {
  final TextureView view;final TextureView.SurfaceTextureListener delegate;SurfaceTexture saved;boolean closed;View targetVideo;Runnable restoreOutput,restoreTimeout;View.OnAttachStateChangeListener restoreAttach;
  SurfaceKeeper(TextureView t){view=t;delegate=t.getSurfaceTextureListener();saved=t.getSurfaceTexture();t.setSurfaceTextureListener(this);}
  public boolean onSurfaceTextureDestroyed(SurfaceTexture surface){if(closed)return delegate==null||delegate.onSurfaceTextureDestroyed(surface);saved=surface;return false;}
  public void onSurfaceTextureAvailable(SurfaceTexture surface,int w,int h){
   if(!closed&&saved!=null){if(surface!=saved)view.setSurfaceTexture(saved);if(targetVideo!=null)MAIN.post(()->VideoOutput227.bind(targetVideo,view));if(restoreOutput!=null)MAIN.post(restoreOutput);return;}
   if(delegate!=null)delegate.onSurfaceTextureAvailable(surface,w,h);if(targetVideo!=null)MAIN.post(()->VideoOutput227.bind(targetVideo,view));if(restoreOutput!=null)MAIN.post(restoreOutput);
  }
  public void onSurfaceTextureSizeChanged(SurfaceTexture s,int w,int h){if(delegate!=null)delegate.onSurfaceTextureSizeChanged(s,w,h);}
  public void onSurfaceTextureUpdated(SurfaceTexture s){if(delegate!=null)delegate.onSurfaceTextureUpdated(s);}
  void output(View video){targetVideo=video;if(view.isAttachedToWindow()&&view.isAvailable())MAIN.post(()->{if(!closed&&targetVideo==video)VideoOutput227.bind(video,view);});}
  void restore(final View video){restoreOutput=()->{if(!closed&&view.isAttachedToWindow()&&view.isAvailable()){close();VideoOutput227.bind(video,view);}};restoreAttach=new View.OnAttachStateChangeListener(){public void onViewAttachedToWindow(View v){if(restoreOutput!=null)MAIN.post(restoreOutput);}public void onViewDetachedFromWindow(View v){}};view.addOnAttachStateChangeListener(restoreAttach);restoreTimeout=()->{if(!closed){log("Retained output did not attach",new IllegalStateException("Output restore timeout"));close();}};MAIN.post(restoreOutput);MAIN.postDelayed(restoreTimeout,3000);}
  void close(){if(closed)return;closed=true;if(restoreOutput!=null){MAIN.removeCallbacks(restoreOutput);restoreOutput=null;}if(restoreTimeout!=null){MAIN.removeCallbacks(restoreTimeout);restoreTimeout=null;}if(restoreAttach!=null){view.removeOnAttachStateChangeListener(restoreAttach);restoreAttach=null;}view.setSurfaceTextureListener(delegate);SurfaceTexture retained=saved;saved=null;if(!view.isAttachedToWindow()&&retained!=null){boolean release=delegate==null||delegate.onSurfaceTextureDestroyed(retained);if(release)retained.release();}}

 }
 static final class Session {
  final Object owner;final Activity source;final View video;final TextureView texture;final ViewGroup original;ViewGroup.LayoutParams originalParams;final int originalIndex,normalHeight;
  final boolean releaseOnDetach;final boolean intendedPlaying;boolean firstResume=true;final SurfaceKeeper keeper;final MiniState225 state=new MiniState225();
  final Bitmap thumb;View nativeControls;int controlsVisibility;
  boolean openingDirect,directEntry,directPrepared;WeakReference<Activity> directDestination;MiniChrome236 chrome;Activity host;FrameLayout content,panel;LinearLayout row;View body,shade;Button play;int bodyPadding,miniHeight;ValueAnimator animation;boolean firstAttach=true;float initialExpansion=1;
  float downY,downX,startFraction;long downTime;boolean dragging,multi;VelocityTracker velocity;
  final Runnable navigateDirect=new Runnable(){public void run(){if(active!=Session.this||!openingDirect)return;Activity destination=directDestination==null?null:directDestination.get();if(destination==null||destination.isFinishing()||destination.isDestroyed()){close(true);return;}try{Intent i=PlaybackNavigation114.browseIntent(source,destination);i.setFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT|Intent.FLAG_ACTIVITY_SINGLE_TOP|Intent.FLAG_ACTIVITY_NO_ANIMATION|Intent.FLAG_ACTIVITY_NO_USER_ACTION);source.startActivity(i);source.overridePendingTransition(0,0);MAIN.postDelayed(launchTimeout,1800);}catch(Exception e){log("Cannot show direct mini host",e);close(true);}}};
  final Runnable tick=new Runnable(){public void run(){if(active!=Session.this||!state.live())return;update();MAIN.postDelayed(this,500);}};
  final Runnable launchTimeout=new Runnable(){public void run(){if(active==Session.this&&host==null&&foreground.get()==source){ModernDebug.record("Mini-player navigation did not resume a host; original player retained");finishRestore();}}};
  final Runnable initialShrink=new Runnable(){public void run(){if(active==Session.this&&panel!=null&&state.phase==MiniState225.MINI){apply(initialExpansion);settle(false);}}};
  final View.OnLayoutChangeListener resized=new View.OnLayoutChangeListener(){public void onLayoutChange(View v,int l,int t,int r,int b,int ol,int ot,int or,int ob){if(active==Session.this&&panel!=null&&(r-l!=or-ol||b-t!=ob-ot))apply(state.fraction);}};
  final Runnable away=new Runnable(){public void run(){
   if(active!=Session.this||foreground.get()!=null||!state.live())return;
   // Native foreground Service handles playback once the app is actually left.
   if(!PlaybackTransfer221.popup(owner,true))try{call(video,"pause",new Class<?>[0]);}catch(Exception e){log("Cannot pause hidden playback",e);}
  }};
  Session(Object o,Activity a,View v,TextureView t)throws Exception{
   owner=o;source=a;video=v;texture=t;intendedPlaying=Boolean.TRUE.equals(call(v,"isPlaying",new Class<?>[0]));original=(ViewGroup)v.getParent();originalIndex=original.indexOfChild(v);originalParams=v.getLayoutParams();normalHeight=Math.max(1,v.getHeight());
   releaseOnDetach=Boolean.TRUE.equals(get(v,"releaseOnDetachFromWindow"));
   Bitmap image=null;try{image=t.getBitmap(160,90);}catch(RuntimeException ignored){}thumb=image;
   call(v,"setReleaseOnDetachFromWindow",new Class<?>[]{boolean.class},false);keeper=new SurfaceKeeper(t);
   try{Object controls=get(v,"videoControls");if(controls instanceof View){nativeControls=(View)controls;controlsVisibility=nativeControls.getVisibility();nativeControls.setVisibility(View.GONE);}}catch(Exception ignored){}
  }
  Boolean shownPlaying;void update(){if(chrome!=null)try{Bundle info=FeedbackMedia.bundle(owner);if(info!=null)chrome.metadata(info);}catch(Exception ignored){}if(play!=null&&directEntry)play.setEnabled(directPrepared);if(play==null||host==null||settings(host))return;try{boolean running=Boolean.TRUE.equals(call(video,"isPlaying",new Class<?>[0]));if(shownPlaying!=null&&shownPlaying==running)return;shownPlaying=running;play.setText(running?"Ⅱ":"▶");play.setContentDescription(PanelUi.tr(host,running?"一時停止":"再生",running?"Pause":"Play",running?"暫停":"播放"));}catch(Exception e){close(true);}}
  void attach(Activity a)throws Exception{
   MAIN.removeCallbacks(launchTimeout);openingDirect=false;detach();if(!state.live())return;state.cancel();host=a;content=a.findViewById(android.R.id.content);if(content==null)throw new IllegalStateException("Missing content frame");
   miniHeight=PanelUi.dp(a,64);body=content.getChildCount()==0?null:content.getChildAt(0);bodyPadding=body==null?0:body.getPaddingBottom();
   panel=new FrameLayout(a);panel.setTag("nicoid-retained-mini-player");panel.setBackgroundColor(Color.BLACK);panel.setElevation(0);panel.setClipChildren(true);
   if(video.getParent() instanceof ViewGroup)((ViewGroup)video.getParent()).removeView(video);panel.addView(video,new FrameLayout.LayoutParams(-1,-1));
   shade=new View(a);shade.setBackgroundColor(0x99000000);panel.addView(shade,new FrameLayout.LayoutParams(-1,-1));
   String title=String.valueOf(get(owner,"b0")),author="";Bundle info=null;
   try{Object media=PlaybackBar221.media();if(media!=null&&get(media,"owner")==owner)title=String.valueOf(get(media,"title"));info=FeedbackMedia.bundle(owner);if(info!=null)author=info.getString("author",info.getString("uploaderName",""));}catch(Exception ignored){}
   View.OnTouchListener gestures=(v,e)->touch(e);
   chrome=new MiniChrome236(a,title,author,thumb,gestures,v->{try{boolean running=Boolean.TRUE.equals(call(video,"isPlaying",new Class<?>[0]));call(video,running?"pause":"start",new Class<?>[0]);update();}catch(Exception e){log("Cannot control retained player",e);}},v->close(true),v->settle(true));
   chrome.metadata(info);row=chrome.row;play=chrome.play;shade.setOnTouchListener(gestures);panel.addView(row,new FrameLayout.LayoutParams(-1,miniHeight,Gravity.BOTTOM));
   content.addView(panel,new FrameLayout.LayoutParams(-1,miniHeight,Gravity.BOTTOM));content.addOnLayoutChangeListener(resized);PlaybackPanels113.claim(a,panel,body,miniHeight,this);
   apply(0);if(settings(a)){panel.setAlpha(0);panel.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);row.setVisibility(View.GONE);shade.setVisibility(View.GONE);FrameLayout.LayoutParams hidden=(FrameLayout.LayoutParams)panel.getLayoutParams();hidden.height=1;panel.setLayoutParams(hidden);if(body!=null)body.setPadding(body.getPaddingLeft(),body.getPaddingTop(),body.getPaddingRight(),bodyPadding);}MAIN.removeCallbacks(tick);tick.run();
   final FrameLayout installed=panel;panel.post(new Runnable(){public void run(){if(active!=Session.this||panel!=installed||!state.live())return;VideoOutput227.bind(video,texture);if(firstResume){firstResume=false;try{Object focus=get(video,"audioFocusHelper");boolean lost=Boolean.TRUE.equals(get(focus,"pausedForLoss"));if(intendedPlaying&&!lost&&PlaybackSession.allowRetry(owner)&&!Boolean.TRUE.equals(call(video,"isPlaying",new Class<?>[0])))call(video,"start",new Class<?>[0]);}catch(Exception e){log("Cannot preserve navigation playback state",e);}}}});

   if(firstAttach){firstAttach=false;if(!settings(a))panel.post(initialShrink);}
  }
  float travel(){return content==null?1:Math.max(1,content.getHeight()-miniHeight);}
  void apply(float f){
   if(panel==null||content==null)return;state.fraction=Math.max(0,Math.min(1,f));
   if(settings(host)){FrameLayout.LayoutParams hidden=(FrameLayout.LayoutParams)panel.getLayoutParams();hidden.gravity=Gravity.BOTTOM;hidden.height=1;hidden.topMargin=0;panel.setLayoutParams(hidden);return;}
   int target=Math.min(Math.max(miniHeight,originalParams.height>0?originalParams.height:normalHeight),Math.max(miniHeight,content.getHeight()*2/3));
   FrameLayout.LayoutParams p=(FrameLayout.LayoutParams)panel.getLayoutParams();p.gravity=Gravity.TOP;p.height=(int)(miniHeight+(target-miniHeight)*state.fraction);int top=(int)((content.getHeight()-miniHeight)*(1-state.fraction));if(p.topMargin!=top||panel.getHeight()!=p.height){p.topMargin=top;panel.setLayoutParams(p);}
   row.setAlpha(1-state.fraction);shade.setAlpha(1-state.fraction);
  }
  boolean touch(MotionEvent e){
   if(!state.live()||state.phase==MiniState225.RESTORING)return true;int action=e.getActionMasked();
   if(action==MotionEvent.ACTION_DOWN){cancelAnimation();startFraction=state.fraction;state.cancel();state.fraction=startFraction;downY=e.getRawY();downX=e.getRawX();downTime=e.getEventTime();dragging=false;multi=false;velocity=VelocityTracker.obtain();velocity.addMovement(e);return true;}
   if(velocity!=null)velocity.addMovement(e);
   if(action==MotionEvent.ACTION_POINTER_DOWN||e.getPointerCount()>1){multi=true;settle(false);recycleVelocity();return true;}
   if(action==MotionEvent.ACTION_CANCEL){settle(false);recycleVelocity();return true;}
   if(multi)return true;
   float dy=downY-e.getRawY(),dx=e.getRawX()-downX;
   if(action==MotionEvent.ACTION_MOVE){if(!dragging&&Math.abs(dy)>ViewConfiguration.get(host).getScaledTouchSlop()&&Math.abs(dy)>Math.abs(dx)*1.3f&&(dy>0||startFraction>0))dragging=true;if(dragging){panel.getParent().requestDisallowInterceptTouchEvent(true);state.drag(dy+startFraction*travel(),travel());apply(state.fraction);}return true;}
   if(action==MotionEvent.ACTION_UP){float speed=0;if(velocity!=null){velocity.computeCurrentVelocity(1000);speed=velocity.getYVelocity();}boolean tap=!dragging&&Math.hypot(dx,dy)<ViewConfiguration.get(host).getScaledTouchSlop()&&e.getEventTime()-downTime<ViewConfiguration.getLongPressTimeout();settle(tap||dragging&&state.expand(speed/host.getResources().getDisplayMetrics().density));recycleVelocity();return true;}
   return true;
  }
  void recycleVelocity(){if(velocity!=null){velocity.recycle();velocity=null;}}
  void cancelAnimation(){if(animation!=null){animation.removeAllListeners();animation.cancel();animation=null;}}
  void settle(final boolean expand){
   if(!state.live()||panel==null)return;cancelAnimation();final int token=state.settle(expand);animation=ValueAnimator.ofFloat(state.fraction,expand?1:0);animation.setDuration(220);
   animation.addUpdateListener(new ValueAnimator.AnimatorUpdateListener(){public void onAnimationUpdate(ValueAnimator v){if(active==Session.this&&state.current(token))apply((Float)v.getAnimatedValue());}});
   animation.addListener(new AnimatorListenerAdapter(){public void onAnimationEnd(Animator animator){if(active!=Session.this||!state.current(token))return;animation=null;if(expand)restore();else state.cancel();}});animation.start();
  }
  void restore(){
   if(!state.live())return;
   try{DirectBootstrap238.reveal(source);Intent i=new Intent(source.getIntent()).setComponent(source.getComponentName());i.setFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT|Intent.FLAG_ACTIVITY_SINGLE_TOP|Intent.FLAG_ACTIVITY_NO_ANIMATION|Intent.FLAG_ACTIVITY_NO_USER_ACTION);PlaybackNavigation114.mark(i);host.startActivity(i);host.overridePendingTransition(0,0);
    MAIN.postDelayed(restoreTimeout,1800);
   }catch(Exception e){log("Cannot restore retained player",e);state.cancel();apply(0);}
  }
  final Runnable restoreTimeout=new Runnable(){public void run(){if(active==Session.this&&state.phase==MiniState225.RESTORING){state.cancel();Activity a=foreground.get();if(a!=null&&a!=source)try{attach(a);}catch(Exception e){close(true);}}}};
  void returnVideo(){
   if(video.getParent()!=original){if(video.getParent() instanceof ViewGroup)((ViewGroup)video.getParent()).removeView(video);original.addView(video,Math.min(originalIndex,original.getChildCount()),originalParams);}
  }
  void detach(){
   cancelAnimation();recycleVelocity();MAIN.removeCallbacks(tick);if(content!=null)content.removeOnLayoutChangeListener(resized);if(panel!=null){panel.removeCallbacks(initialShrink);if(video.getParent()==panel)panel.removeView(video);if(panel.getParent() instanceof ViewGroup)((ViewGroup)panel.getParent()).removeView(panel);}
   PlaybackPanels113.release(host,panel);
   panel=null;content=null;row=null;chrome=null;shade=null;play=null;body=null;host=null;shownPlaying=null;
  }
  void finishRestore(){
   if(active!=this)return;PlaybackNavigation114.mark(source.getIntent());if(directEntry)DirectBootstrap238.reveal(source);EXPANDED.put(source,true);state.close();active=null;cleanup();detach();returnVideo();keeper.restore(video);try{call(video,"setReleaseOnDetachFromWindow",new Class<?>[]{boolean.class},releaseOnDetach);}catch(Exception e){log("Cannot restore detach policy",e);}if(nativeControls!=null)nativeControls.setVisibility(controlsVisibility);
  }
  void cleanup(){MAIN.removeCallbacks(navigateDirect);MAIN.removeCallbacks(tick);MAIN.removeCallbacks(away);MAIN.removeCallbacks(launchTimeout);MAIN.removeCallbacks(restoreTimeout);}
  void close(boolean finish){
   if(active!=this)return;state.close();active=null;cleanup();detach();
   if(finish)try{call(video,"pause",new Class<?>[0]);}catch(Exception e){log("Cannot stop closed playback",e);}
   // Reattach before native terminal cleanup; one owner remains responsible for release.
   if(!source.isDestroyed())returnVideo();keeper.close();try{call(video,"setReleaseOnDetachFromWindow",new Class<?>[]{boolean.class},releaseOnDetach);}catch(Exception e){log("Cannot restore terminal detach policy",e);}if(nativeControls!=null)nativeControls.setVisibility(controlsVisibility);
   if(directEntry)DirectBootstrap238.reveal(source);if(finish&&!source.isFinishing()&&!source.isDestroyed())source.finish();
  }
 }
 public static void destroyed(Object owner){Session s=active;if(s!=null&&s.owner==owner)s.close(false);}
}
