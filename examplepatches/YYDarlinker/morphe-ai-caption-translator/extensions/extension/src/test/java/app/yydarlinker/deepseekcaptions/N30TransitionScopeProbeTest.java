package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.app.*;import android.os.*;import android.view.*;import android.widget.*;
import java.lang.reflect.*;import java.time.Duration;import java.util.concurrent.*;import java.util.concurrent.atomic.*;
import org.json.*;import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;
/** Runs actual host entrypoints, actual overlay render and bounded View discovery; no render shadow. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=28,shadows=N30TransitionScopeProbeTest.Flags.class)
@LooperMode(LooperMode.Mode.PAUSED) @GraphicsMode(GraphicsMode.Mode.NATIVE)
public class N30TransitionScopeProbeTest {
 @Implements(CaptionAddonSupport.class) public static class Flags {@Implementation public static boolean aiInstalled(){return true;}}
 enum PlayerType { WATCH_WHILE_FULLSCREEN, WATCH_WHILE_MAXIMIZED, WATCH_WHILE_MINIMIZED, WATCH_WHILE_PICTURE_IN_PICTURE }
 static class SubtitleWindowView extends FrameLayout{SubtitleWindowView(Activity a){super(a);}}
 Activity a;FrameLayout player;SubtitleWindowView nativeWindow;
 static Object field(Class<?> c,String n)throws Exception{Field f=c.getDeclaredField(n);f.setAccessible(true);return f.get(null);}
 static void set(Class<?> c,String n,Object value)throws Exception{Field f=c.getDeclaredField(n);f.setAccessible(true);f.set(null,value);}
 void frames(int n){Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(20L*n));}
  /**
   * N36: compact quarantine and display permission moved out of CaptionOverlay into the single player
   * authority. The pre-N36 assertions on the overlay's guardedExpansion/suppressed fields are now
   * expressed against that state instead of reintroducing the retired booleans.
   */
  static boolean quarantined(){return CaptionPlayerAuthority.state()==CaptionPlayerAuthority.COMPACT
          ||CaptionPlayerAuthority.state()==CaptionPlayerAuthority.TRANSITIONING_TO_REGULAR;}
 void geometry(){a.getWindow().getDecorView().measure(View.MeasureSpec.makeMeasureSpec(480,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(800,View.MeasureSpec.EXACTLY));a.getWindow().getDecorView().layout(0,0,480,800);}
 @Before public void setup()throws Exception{
  RebuildController.stop();CaptionPlayerTransitionGuard.setActivity(null);CaptionPlayerAuthority.resetForTests();CaptionPlayerTransitionGuard.resetForTests();
  a=Robolectric.buildActivity(Activity.class).setup().visible().get();player=new FrameLayout(a);
  player.setId(a.getResources().getIdentifier("watch_player","id",a.getPackageName()));assertNotEquals(0,player.getId());a.setContentView(player,new android.view.ViewGroup.LayoutParams(480,300));
  nativeWindow=new SubtitleWindowView(a);player.addView(nativeWindow,new FrameLayout.LayoutParams(480,300));geometry();
  DeepSeekCaptionHookV2.setMainActivity(a);DeepSeekConfig.saveEnabled(a,true);
  RebuildController.Session s=new RebuildController.Session(a,"","","n30-transition","fr",DeepSeekConfig.load(a),false,true,CaptionLanguageContext.explicit("en","fr"));set(RebuildController.class,"active",s);set(RebuildController.class,"video","");
  CaptionOverlay.showWaitingEvent("Translating…",()->RebuildController.current(s),"transition-test",0,8000,0);CaptionMusicSuppressor.forceNativeRendererScan();frames(2);
  // The measurement window starts after the initial paint; each round counts only what the
  // notification and its deferred render add.
  CaptionSurface.refreshSearchCount=0;CaptionSurface.renderedSearchCount=0;CaptionOverlay.deferredRenderCount=0;
 }
 @After public void cleanup(){RebuildController.stop();DeepSeekCaptionHookV2.setMainActivity(null);a.finish();frames(2);}
 void call(boolean outer,PlayerType type){if(outer)DeepSeekCaptionHookV2.onPlayerType(type);else DeepSeekCaptionHook.onPlayerType(type);}
 @Test public void fullInnerAndV2StacksReturnWithZeroGeometryScanAndThenReallyRender()throws Exception{
  JSONArray evidence=new JSONArray();
  for(boolean outer:new boolean[]{false,true})for(int i=0;i<10;i++){
   PlayerType type=i%2==0?PlayerType.WATCH_WHILE_FULLSCREEN:PlayerType.WATCH_WHILE_MAXIMIZED;
   long refresh=CaptionSurface.refreshSearchCount,rendered=CaptionSurface.renderedSearchCount,scan=CaptionMusicSuppressor.scanCount,renders=CaptionOverlay.deferredRenderCount;
   long start=System.nanoTime();call(outer,type);long elapsed=System.nanoTime()-start;
   assertEquals(refresh,CaptionSurface.refreshSearchCount);assertEquals(rendered,CaptionSurface.renderedSearchCount);assertEquals(scan,CaptionMusicSuppressor.scanCount);assertEquals(renders,CaptionOverlay.deferredRenderCount);
   AtomicBoolean next=new AtomicBoolean();new Handler(Looper.getMainLooper()).post(()->next.set(true));Shadows.shadowOf(Looper.getMainLooper()).idle();assertTrue(next.get());
   frames(4);assertTrue("render not dispatched: state="+CaptionPlayerAuthority.stateName()+" type="+CaptionPlayerAuthority.playerType(),CaptionOverlay.deferredRenderCount>renders);
   // N36: an unchanged surface is a cache hit, so the deferred frame adds at most one search. What must hold absolutely is that the callback itself never scanned.
   long searches=CaptionSurface.refreshSearchCount-refresh;assertTrue("deferred search must stay bounded to one, was "+searches,searches<=1);
   assertTrue(NativeCaptionBridge.suppressNativeDraw());assertEquals(0f,nativeWindow.getAlpha(),0f);
   assertEquals("Translating…",field(CaptionOverlay.class,"pendingText"));
   TextView caption=((java.lang.ref.WeakReference<TextView>)field(CaptionOverlay.class,"textRef")).get();assertNotNull(caption);assertEquals("Translating…",caption.getText().toString());
   evidence.put(new JSONObject().put("outer_v2",outer).put("type",type.name()).put("callback_ns",elapsed).put("callback_geometry_scans",0).put("callback_native_scans",0).put("deferred_geometry_searches",CaptionSurface.refreshSearchCount-refresh).put("deferred_renders",CaptionOverlay.deferredRenderCount-renders));
  }
  assertEquals(0,CaptionMusicSuppressor.treeSummaryCount);
  N28CGeometryTest.export("n30-transition-after.json",new JSONObject().put("rows",evidence).put("timing_scope","local_robolectric_not_device_fps"));
 }
 @Test public void fullscreenRotationAndDetailReturnEachTenRoundsHaveNoCallbackScans()throws Exception{
  org.json.JSONArray rows=new org.json.JSONArray();
  for(String path:new String[]{"fullscreen","rotation","detail_return"})for(int i=0;i<10;i++){
   if(path.equals("rotation")){a.getResources().getDisplayMetrics().widthPixels=i%2==0?480:800;a.getResources().getDisplayMetrics().heightPixels=i%2==0?800:480;CaptionSurface.invalidateGeometry();}
   long refresh=CaptionSurface.refreshSearchCount,nativeScan=CaptionMusicSuppressor.scanCount;
   call(true,i%2==0?PlayerType.WATCH_WHILE_FULLSCREEN:PlayerType.WATCH_WHILE_MAXIMIZED);
   assertEquals("callback must not scan: path="+path+" round="+i+", state="+CaptionPlayerAuthority.stateName(),refresh,CaptionSurface.refreshSearchCount);assertEquals("callback must not scan native: path="+path,nativeScan,CaptionMusicSuppressor.scanCount);frames(3);
   rows.put(new org.json.JSONObject().put("path",path).put("round",i).put("callback_geometry",0).put("callback_native_scan",0));
  }
  N28CGeometryTest.export("n30-transition-path-rounds.json",new org.json.JSONObject().put("rows",rows));
 }
 @Test public void rapidMixedNotificationsMergeAndCompactQuarantinesImmediately()throws Exception{
  long count=CaptionOverlay.deferredRenderCount;
  for(int i=0;i<100;i++){call(true,i%2==0?PlayerType.WATCH_WHILE_FULLSCREEN:PlayerType.WATCH_WHILE_MAXIMIZED);}
  frames(3);assertEquals(count+1,CaptionOverlay.deferredRenderCount);
  for(int i=0;i<10;i++){
   call(true,PlayerType.WATCH_WHILE_MINIMIZED);assertTrue("minimized must quarantine: state="+CaptionPlayerAuthority.stateName()+" type="+CaptionPlayerAuthority.playerType(),quarantined());
   long compactRenders=CaptionOverlay.deferredRenderCount;
   frames(3);
   // N36 quarantine: while compact no deferred render presents a caption, and the pre-N36 boolean
   // residue (a stale restore responsibility handed to a later owner) no longer exists.
   assertEquals("compact must not present a caption: renders="+CaptionOverlay.deferredRenderCount+" was="+compactRenders+" state="+CaptionPlayerAuthority.stateName(),compactRenders,CaptionOverlay.deferredRenderCount);
   assertTrue("compact must keep quarantining: state="+CaptionPlayerAuthority.stateName(),quarantined());
   long observed=CaptionPlayerTransitionGuard.observedFrameCount;
   call(true,PlayerType.WATCH_WHILE_MAXIMIZED);call(true,PlayerType.WATCH_WHILE_FULLSCREEN);call(true,PlayerType.WATCH_WHILE_FULLSCREEN);
   frames(6);assertFalse("after verify: state="+CaptionPlayerAuthority.stateName()+" frames="+CaptionPlayerTransitionGuard.observedFrameCount+" delta="+(CaptionPlayerTransitionGuard.observedFrameCount-observed),quarantined());assertTrue(CaptionPlayerTransitionGuard.observedFrameCount-observed<=12);
  }
 }
 @Test public void geometryMissingStaysBlankUntilRealLaterLayoutAndRestoresOnce()throws Exception{
  call(true,PlayerType.WATCH_WHILE_MINIMIZED);player.setVisibility(View.GONE);call(true,PlayerType.WATCH_WHILE_MAXIMIZED);frames(14);
  assertTrue("geometry missing must quarantine: state="+CaptionPlayerAuthority.stateName()+" type="+CaptionPlayerAuthority.playerType(),quarantined());long renders=CaptionOverlay.deferredRenderCount;
  player.setVisibility(View.VISIBLE);a.getWindow().getDecorView().layout(0,0,481,801);geometry();frames(8);
  assertFalse("after real layout: state="+CaptionPlayerAuthority.stateName()+" type="+CaptionPlayerAuthority.playerType(),quarantined());assertEquals(renders+1,CaptionOverlay.deferredRenderCount);
 }
 @Test public void capturedStaleTasksCannotRenderAttachOrClearNewText()throws Exception{
  for(String kind:new String[]{"clear","stop","video","target","activity","compact"}){
   RebuildController.Session active=new RebuildController.Session(a,"","","transition-old","fr",DeepSeekConfig.load(a),false,true,CaptionLanguageContext.explicit("en","fr"));set(RebuildController.class,"active",active);set(RebuildController.class,"video","");
   CaptionOverlay.showEvent("Old owner text",()->RebuildController.current(active),null,"old-owner",0,9000,0);
   call(true,PlayerType.WATCH_WHILE_FULLSCREEN);Runnable old=(Runnable)field(CaptionOverlay.class,"playerRenderTask");
   if(old==null){call(true,PlayerType.WATCH_WHILE_MAXIMIZED);old=(Runnable)field(CaptionOverlay.class,"playerRenderTask");}assertNotNull(old);
   long renders=CaptionOverlay.deferredRenderCount;
   if(kind.equals("clear"))CaptionOverlay.clear();else if(kind.equals("stop"))RebuildController.stop();else if(kind.equals("video"))RebuildController.video("next-video");
   else if(kind.equals("target"))CaptionOverlay.clear();else if(kind.equals("activity"))CaptionOverlay.setActivity(null);else call(true,PlayerType.WATCH_WHILE_MINIMIZED);
   // A valid new command must survive the old task even if the old Runnable is explicitly invoked.
   CaptionOverlay.showEvent("New owner text",()->true,null,"new-owner",0,9000,0);String current=(String)field(CaptionOverlay.class,"pendingText");old.run();
   assertEquals(kind,renders,CaptionOverlay.deferredRenderCount);assertEquals(kind,current,field(CaptionOverlay.class,"pendingText"));
   if(kind.equals("activity"))CaptionOverlay.setActivity(a);CaptionOverlay.clear();CaptionOverlay.restoreAfterGuardedExpansion("WATCH_WHILE_MAXIMIZED");frames(3);
  }
 }
 @Test public void queuedFrameReadsLatestTextAndGuardRatherThanAnObsoleteRenderRevision()throws Exception {
  AtomicBoolean oldValid=new AtomicBoolean(true);CaptionOverlay.showEvent("Old revision",oldValid::get,null,"old",0,9000,0);
  long renders=CaptionOverlay.deferredRenderCount;call(true,PlayerType.WATCH_WHILE_FULLSCREEN);oldValid.set(false);
  CaptionOverlay.showEvent("Latest valid revision",()->true,null,"latest",0,9000,0);frames(3);
  TextView text=((java.lang.ref.WeakReference<TextView>)field(CaptionOverlay.class,"textRef")).get();
  assertEquals("Latest valid revision",text.getText().toString());assertEquals(renders+1,CaptionOverlay.deferredRenderCount);
 }
 @Test public void invalidGuardAfterQueueAndDestroyedActivityHaveNoLateRender()throws Exception{
  AtomicBoolean valid=new AtomicBoolean(true);CaptionOverlay.showEvent("Old target",valid::get,null,"old",0,9000,0);call(true,PlayerType.WATCH_WHILE_FULLSCREEN);
  Runnable queued=(Runnable)field(CaptionOverlay.class,"playerRenderTask");long renders=CaptionOverlay.deferredRenderCount;valid.set(false);queued.run();assertEquals(renders,CaptionOverlay.deferredRenderCount);
  valid.set(true);call(true,PlayerType.WATCH_WHILE_MAXIMIZED);queued=(Runnable)field(CaptionOverlay.class,"playerRenderTask");a.finish();queued.run();assertEquals(renders,CaptionOverlay.deferredRenderCount);
 }
 @Test public void pendingOffMainNotificationCannotHideNewOwnerAfterStop()throws Exception{
  Thread worker=new Thread(()->call(true,PlayerType.WATCH_WHILE_MINIMIZED));worker.start();worker.join(2000);RebuildController.stop();
  CaptionOverlay.showEvent("New owner",()->true,null,"new",0,1000,0);Shadows.shadowOf(Looper.getMainLooper()).idle();
  assertFalse("a notification queued before stop must not reopen quarantine: state="+CaptionPlayerAuthority.stateName(),quarantined());assertEquals("New owner",field(CaptionOverlay.class,"pendingText"));
 }
 @Test public void nonUiThreadNotificationEntersMainWithoutInlineGeometry()throws Exception{
  long refresh=CaptionSurface.refreshSearchCount;
  Thread worker=new Thread(()->call(true,PlayerType.WATCH_WHILE_FULLSCREEN));worker.start();worker.join(2000);assertFalse(worker.isAlive());assertEquals(refresh,CaptionSurface.refreshSearchCount);
  long notified=CaptionPlayerAuthority.notificationSequence();Shadows.shadowOf(Looper.getMainLooper()).idle();frames(3);
  assertTrue("off-main notification must reach main: state="+CaptionPlayerAuthority.stateName()+" type="+CaptionPlayerAuthority.playerType(),CaptionPlayerAuthority.notificationSequence()>notified);
  assertTrue("an unchanged surface is a cache hit: searches="+(CaptionSurface.refreshSearchCount-refresh),CaptionSurface.refreshSearchCount-refresh<=1);
 }
}
