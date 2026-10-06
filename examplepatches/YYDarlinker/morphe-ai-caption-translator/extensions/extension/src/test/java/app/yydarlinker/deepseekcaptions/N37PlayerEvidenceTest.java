package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.media.session.*;
import android.os.*;
import android.view.*;
import java.lang.reflect.*;
import java.nio.file.*;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={RebuildLayoutTest.Geometry.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@LooperMode(LooperMode.Mode.PAUSED)
public class N37PlayerEvidenceTest {
  RebuildLayoutTest h;
  MediaSession media;
  MediaController controller;
  final List<String> ledger=new ArrayList<>();
  enum Type { WATCH_WHILE_MAXIMIZED,WATCH_WHILE_MINIMIZED,HIDDEN,
    WATCH_WHILE_PICTURE_IN_PICTURE,WATCH_WHILE_SLIDING_MINIMIZED_MAXIMIZED }
  public static class Player {
    static long position=28290;static float speed=1;static String state="PAUSED";
    public static String getVideoId(){return "fixture0001";}
    public static long getVideoTime(){return position;}
    public static float getPlaybackSpeed(){return speed;}
    public static String getCurrent(){return state;}
  }
  static void set(Class<?> c,String n,Object v)throws Exception{Field f=c.getDeclaredField(n);f.setAccessible(true);f.set(null,v);}
  static long invoke(String name,RebuildController.Session s)throws Exception{
    Method m=RebuildController.class.getDeclaredMethod(name,RebuildController.Session.class);m.setAccessible(true);
    return ((Number)m.invoke(null,s)).longValue();
  }
  @Before public void setup()throws Exception {
    CaptionPlayerTransitionGuard.resetForTests();CaptionPlayerAuthority.resetForTests();
    h=new RebuildLayoutTest();h.setup();
    CaptionPlayerTransitionGuard.setActivity(h.a);CaptionPlayerTransitionGuard.installAuthorityListener();
    DeepSeekCaptionHookV2.onPlayerType(Type.WATCH_WHILE_MAXIMIZED);
    Player.position=28290;Player.speed=1;Player.state="PAUSED";
    RebuildController.activity(h.a);set(RebuildController.class,"video","fixture0001");
    RebuildClock clock=(RebuildClock)RebuildIntegrationTest.field(null,RebuildController.class,"CLOCK");
    clock.reset(SystemClock.elapsedRealtime());
  }
  @After public void done()throws Exception{
    set(RebuildController.class,"active",null);OfficialPlayerClockAdapter.resetForTests();
    if(media!=null)media.release();h.done();CaptionPlayerTransitionGuard.resetForTests();CaptionPlayerAuthority.resetForTests();
    String out=System.getenv("N30_EVIDENCE_DIR");
    if(out!=null&&!ledger.isEmpty())Files.write(Paths.get(out,"n37-temporal-ledger-"+Integer.toHexString(ledger.hashCode())+".txt"),ledger);
  }
  void nativePlayer()throws Exception{
    set(OfficialPlayerClockAdapter.class,"resolved",true);
    for(String n:new String[]{"getVideoTime","getVideoId","getPlaybackSpeed","getCurrent"})
      set(OfficialPlayerClockAdapter.class,n,Player.class.getMethod(n));
  }
  void report(int state,long p){
    if(media==null){media=new MediaSession(h.a,"N37");controller=new MediaController(h.a,media.getSessionToken());
      Shadows.shadowOf(controller).setPackageName(h.a.getPackageName());h.a.setMediaController(controller);}
    Shadows.shadowOf(controller).setPlaybackState(new PlaybackState.Builder().setState(state,p,Player.speed,SystemClock.elapsedRealtime()).build());
  }
  RebuildController.Session session(String language)throws Exception{
    RebuildController.Session s=new RebuildController.Session(h.a,"","fixture0001","n37-"+language,language,
      new DeepSeekConfig.Snapshot(true,"http://127.0.0.1:9","fixture","fixture",2,50,"dummy"),false,true);
    set(RebuildController.class,"active",s);return s;
  }
  @Test public void actualOuterInnerCallbackRetractsAllPaintKindsWithoutWaitingForTick()throws Exception{
    String[][] captions={{"zh-Hans","当前字幕","这是一句用于验证小窗立即撤回的较长字幕。","翻译中…"},
      {"ja","現在の字幕","小さいウィンドウでは前の字幕が残ってはいけません。","翻訳中…"},
      {"ar","الترجمة الحالية","يجب إخفاء الترجمة فور الانتقال إلى النافذة الصغيرة.","جارٍ الترجمة…"}};
    int id=0;
    for(String[] c:captions)for(int kind=1;kind<c.length;kind++)for(Type type:new Type[]{Type.WATCH_WHILE_MINIMIZED,Type.HIDDEN,Type.WATCH_WHILE_PICTURE_IN_PICTURE,Type.WATCH_WHILE_SLIDING_MINIMIZED_MAXIMIZED}){
      CaptionPlayerAuthority.noteShortsSurface(); // establish a settled regular fixture, not a fake geometry restore
      CaptionOverlay.showEvent(c[kind],()->true,()->"","n37:"+(id++),1000,4000,1500,CaptionLanguageContext.explicit("en",c[0]).renderSpec);
      Shadows.shadowOf(Looper.getMainLooper()).idle();assertTrue(CaptionOverlay.anchorVisible());
      long scans=CaptionSurface.refreshSearchCount, plans=CaptionOverlay.planningCalls;
      DeepSeekCaptionHookV2.onPlayerType(type);DeepSeekCaptionHook.onPlayerType(type);
      assertFalse("same callback must retract an existing paint",CaptionOverlay.anchorVisible());
      assertEquals(View.INVISIBLE,h.anchor().getVisibility());
      assertEquals(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS,h.anchor().getImportantForAccessibility());
      assertFalse(h.anchor().hasFocus());
      assertEquals(scans,CaptionSurface.refreshSearchCount);assertEquals(plans,CaptionOverlay.planningCalls);
      Method drag=CaptionOverlay.class.getDeclaredMethod("drag",View.class,MotionEvent.class);drag.setAccessible(true);
      MotionEvent event=MotionEvent.obtain(0,0,MotionEvent.ACTION_MOVE,0,0,0);
      assertFalse((Boolean)drag.invoke(null,h.text(),event));event.recycle();
      DeepSeekCaptionHookV2.onPlayerType(type);assertFalse(CaptionOverlay.anchorVisible());
      assertEquals("accepted text is not cleared by permission denial",c[kind],RebuildLayoutTest.field("pendingText"));
    }
  }
  @Test public void oldEpochCleanupAndOffMainOuterResponsibilityCannotHideNewOwner()throws Exception{
    long old=CaptionPlayerAuthority.ownerEpoch();
    CaptionPlayerAuthority.setVideo("new-owner");CaptionPlayerAuthority.noteShortsSurface();
    CaptionOverlay.showCaption("new",()->true);assertTrue(CaptionOverlay.anchorVisible());
    CaptionOverlay.denyDisplay(old);assertTrue(CaptionOverlay.anchorVisible());
    Thread t=new Thread(()->{DeepSeekCaptionHookV2.onPlayerType(Type.WATCH_WHILE_MINIMIZED);DeepSeekCaptionHook.onPlayerType(Type.WATCH_WHILE_MINIMIZED);});
    t.start();t.join();Shadows.shadowOf(Looper.getMainLooper()).idle();
    assertFalse(CaptionOverlay.anchorVisible());assertTrue(CaptionPlayerAuthority.outerRestoreOwed());
    CaptionPlayerAuthority.close();assertFalse(CaptionOverlay.anchorVisible());
  }
  @Test public void nativePausedWinsOverEveryLosingMediaAndHookBoundary()throws Exception{
    nativePlayer();
    for(String language:new String[]{"zh-Hans","ja","ar"})for(float speed:new float[]{1,1.5f,2})
      for(long[] pair:new long[][]{{28290,27922},{32235,31861},{43120,43060}})
        for(long delta:new long[]{-400,-100,-20,20,100,400}){
          RebuildController.Session s=session(language);Player.position=pair[0]+delta;Player.speed=speed;Player.state="PAUSED";
          report(PlaybackState.STATE_PAUSED,pair[1]);
          assertEquals(Player.position,invoke("position",s));assertEquals(Player.position,invoke("displayPosition",s));
          int generation=s.generation;RebuildController.time(pair[1]);
          assertEquals(Player.position,s.pausedDisplayPosition);assertEquals(generation,s.generation);
          assertEquals(Player.position,s.position);assertEquals(PlaybackState.STATE_PAUSED,s.observation.state);
          ledger.add(language+"|speed="+speed+"|native="+Player.position+"|losing="+pair[1]+"|freeze="+s.pausedDisplayPosition+"|source="+s.observation.source);
        }
  }
  @Test public void selectedStateControlsPauseAndNativeRewindIsNotMadeMonotonic()throws Exception{
    nativePlayer();RebuildController.Session s=session("zh-Hans");
    report(PlaybackState.STATE_PAUSED,27922);Player.state="PLAYING";
    invoke("position",s);assertEquals(-1,s.pausedDisplayPosition);assertFalse(s.observation.paused());
    Player.state="PAUSED";report(PlaybackState.STATE_PLAYING,29000);
    assertEquals(28290,invoke("position",s));assertTrue(s.observation.paused());
    int g=s.generation;Player.position=28270;RebuildController.time(28270);
    assertEquals(28270,s.pausedDisplayPosition);assertEquals(g+1,s.generation);
    RebuildController.time(27922);assertEquals(28270,s.pausedDisplayPosition);assertEquals(g+1,s.generation);
    Player.position=28260;RebuildController.time(28260);assertEquals(28260,s.pausedDisplayPosition);
    Player.state="PLAYING";invoke("position",s);assertEquals(-1,s.pausedDisplayPosition);
  }
}
