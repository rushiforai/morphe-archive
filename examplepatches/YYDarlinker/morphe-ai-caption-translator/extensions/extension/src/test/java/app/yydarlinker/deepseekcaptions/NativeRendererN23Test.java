package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.app.Activity;
import android.os.Looper;
import android.widget.FrameLayout;
import java.lang.reflect.Field;
import java.time.Duration;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk=28) @LooperMode(LooperMode.Mode.PAUSED)
public class NativeRendererN23Test {
  Activity activity;
  FrameLayout player;
  static class SubtitleWindowView extends FrameLayout {
    SubtitleWindowView(Activity a) {super(a);}
  }
  private void field(String name,Object value) throws Exception {
    Field field=RebuildController.class.getDeclaredField(name);field.setAccessible(true);field.set(null,value);
  }
  @Before public void setup() throws Exception {
    RebuildController.stop();
    activity=Robolectric.buildActivity(Activity.class).setup().visible().get();
    player=new FrameLayout(activity);activity.setContentView(player);
    field("video","");
    RebuildController.Session s=new RebuildController.Session(activity,"","","n23","zh-Hans",DeepSeekConfig.load(activity),false,true,CaptionLanguageContext.LEGACY);
    field("active",s);
    CaptionMusicSuppressor.setActivity(activity);
  }
  @After public void cleanup() {
    RebuildController.stop();Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(80));activity.finish();
  }
  @Test public void blankAndWaitingStillHideAndReapplyAfterLayoutAndPlayerRebuild() {
    SubtitleWindowView nativeWindow=new SubtitleWindowView(activity);player.addView(nativeWindow);
    assertTrue(nativeWindow.isAttachedToWindow());
    CaptionOverlay.hide();CaptionMusicSuppressor.forceNativeRendererScan();
    assertEquals(0f,nativeWindow.getAlpha(),0f);
    CaptionOverlay.showWaitingEvent("翻译中…",null,"wait",0,8000,0);
    nativeWindow.setAlpha(1);nativeWindow.requestLayout();
    Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(80));
    assertEquals(0f,nativeWindow.getAlpha(),0f);
    player.removeView(nativeWindow);
    SubtitleWindowView replacement=new SubtitleWindowView(activity);player.addView(replacement);
    CaptionOverlay.hide();
    CaptionMusicSuppressor.beginNativeRendererTransition();
    Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(480));
    assertEquals("detached views must retain their native alpha for later reuse",1f,nativeWindow.getAlpha(),0f);
    assertEquals(0f,replacement.getAlpha(),0f);
    CaptionMusicSuppressor.endNativeRendererTransition();
    RebuildController.stop();Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(80));
    assertEquals(1f,replacement.getAlpha(),0f);
  }
  @Test public void lateRendererDiscoveryContinuesAfterMissAndLogsTree() {
    CaptionMusicSuppressor.forceNativeRendererScan();
    Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(2200));
    CaptionMusicSuppressor.sampleNativeRendererTree();
    String diagnostics=CaptionDiagnostics.fullText(activity);
    assertTrue(diagnostics.contains("NATIVE_RENDERER_VIEW_TREE"));
    assertTrue(diagnostics.contains("visibility="));assertTrue(diagnostics.contains("size="));
    SubtitleWindowView window=new SubtitleWindowView(activity);player.addView(window);
    CaptionMusicSuppressor.forceNativeRendererScan(); // Explicit host View-rebuild signal, not a 40 ms full-tree poll.
    Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(480));
    assertEquals(0f,window.getAlpha(),0f);
  }

  @Test public void invisibleOwnershipFallbackAlsoTriggersWindowHiding() throws Exception {
    String url="https://www.youtube.com/api/timedtext?v=n23-fallback&lang=en&tlang=zh-Hans";
    String key=SourceCaptionCache.key(CaptionEngine.sourceCaptionUrl(url));
    java.lang.reflect.Method put=SourceCaptionCache.class.getDeclaredMethod("putNow",android.content.Context.class,String.class,byte[].class,String.class);
    put.setAccessible(true);put.invoke(null,activity,key,"invalid-source-document".getBytes(java.nio.charset.StandardCharsets.UTF_8),"application/json");
    SubtitleWindowView window=new SubtitleWindowView(activity);player.addView(window);
    java.lang.reflect.Method ownership=LoopbackCaptionServer.class.getDeclaredMethod("ownershipTrackFor",String.class);
    ownership.setAccessible(true);assertNotNull(ownership.invoke(LoopbackCaptionServer.get(activity),url));
    assertEquals(0f,window.getAlpha(),0f);
    assertTrue(CaptionDiagnostics.fullText(activity).contains("NATIVE_RENDERER_MASK_FALLBACK"));
  }
}
