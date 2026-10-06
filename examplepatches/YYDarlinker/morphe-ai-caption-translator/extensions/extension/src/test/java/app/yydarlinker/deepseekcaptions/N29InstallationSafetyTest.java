package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.content.Context;
import android.graphics.Canvas;
import android.view.View;
import android.widget.FrameLayout;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={RebuildIntegrationTest.Keys.class,N29InstallationSafetyTest.Permission.class,N29InstallationSafetyTest.Menu.class,N29InstallationSafetyTest.Tracks.class})
@LooperMode(LooperMode.Mode.PAUSED)
public class N29InstallationSafetyTest {
 static boolean installed,shorts;
 @Implements(CaptionAddonSupport.class) public static class Installed {
  @Implementation public static boolean aiInstalled(){return true;}
 }
 @Implements(CaptionAddonSupport.class) public static class Permission {
  @Implementation public static boolean aiInstalled(){return installed;}
 }
 @Implements(CaptionQuickToggle.class) public static class Menu {
  @Implementation public static boolean shortsOpen(){return shorts;}
 }
 @Implements(NativeCaptionBridge.class) public static class Tracks {
  @Implementation public static String language(Object t){return "ja";}
  @Implementation public static String url(Object t){return N29InstallationSafetyTest.url();}
  @Implementation public static String vss(Object t){return "tja.en";}
 }
 RebuildIntegrationTest h;
 static String url(){return "https://www.youtube.com/api/timedtext?v=rebuild0001&lang=en&tlang=ja";}
 @Before public void setup()throws Exception {
  installed=false;shorts=true;h=new RebuildIntegrationTest();h.setup();
  DeepSeekCaptionHook.setMainActivity(h.a);CaptionAddonSupport.initialize(h.a);
  DeepSeekConfig.saveEnabled(h.a,true);CaptionChoice.reset();
  set(CaptionQuickToggle.class,"shortsMenuAt",0L);set(CaptionQuickToggle.class,"shortsVideo","");
 }
 @After public void cleanup()throws Exception {h.cleanup();}
 static void set(Class<?> c,String n,Object v)throws Exception {Field f=c.getDeclaredField(n);f.setAccessible(true);f.set(null,v);}
 static Object get(Class<?> c,String n)throws Exception {return RebuildIntegrationTest.field(null,c,n);}
 @Test public void incompleteInstallationProductionUrlAndNativeEntryNeverStartAi()throws Exception {
  String original=url();assertEquals(original,DeepSeekCaptionHook.rewriteUrl(h.engine,original));
  NativeCaptionBridge.onSelection(new Object());NativeCaptionBridge.onOriginalTrackList(Arrays.asList(new Object()));
  assertNull(h.session());assertEquals(0,h.calls.get());assertTrue(DeepSeekConfig.enabled(h.a));
  assertEquals("local-fixture-key",DeepSeekConfig.load(h.a).apiKey);
  assertFalse(NativeCaptionBridge.suppressNativeDraw());
 }
 @Test public void charSequenceAndStringSignalAreTypeCorrectAndNullIsNoSignal()throws Exception {
  byte[] bytes="closed_captions".getBytes(StandardCharsets.ISO_8859_1);
  CaptionQuickToggle.observeMenuPath((CharSequence)null,bytes);assertEquals(0L,get(CaptionQuickToggle.class,"shortsMenuAt"));
  CaptionQuickToggle.observeMenuPath(new StringBuilder("overflow_menu_item.e"),bytes);
  assertTrue((Long)get(CaptionQuickToggle.class,"shortsMenuAt")>0);
  assertEquals(PageCaptionController.currentVideoIdSnapshot(),get(CaptionQuickToggle.class,"shortsVideo"));
  set(CaptionQuickToggle.class,"shortsMenuAt",0L);CaptionQuickToggle.observeMenuPath("overflow_menu_item.e",bytes);
  assertTrue((Long)get(CaptionQuickToggle.class,"shortsMenuAt")>0);
 }
 @Test public void shortsPrefixAndChildMenuExclusionsStayUnchanged()throws Exception {
  byte[] bytes="closed_caption".getBytes(StandardCharsets.ISO_8859_1);
  for(String path:new String[]{"other.e","overflow_menu_item.e.captions_sheet","overflow_menu_item.e.quality_sheet"}){
   CaptionQuickToggle.observeMenuPath(new StringBuilder(path),bytes);assertEquals(0L,get(CaptionQuickToggle.class,"shortsMenuAt"));
  }
  shorts=false;CaptionQuickToggle.observeMenuPath(new StringBuilder("overflow_menu_item.e"),bytes);assertEquals(0L,get(CaptionQuickToggle.class,"shortsMenuAt"));
 }
 RebuildController.Session held(boolean sourceOnly,boolean visible)throws Exception {
  installed=true;
  RebuildController.Session s=new RebuildController.Session(h.a,url(),"rebuild0001","n29-held","ja",h.config(),sourceOnly,visible);
  set(RebuildController.class,"active",s);return s;
 }
 @Test public void pendingAndSafeBlankAndRotationHoldDrawUntilOffOrDeparture()throws Exception {
  RebuildController.Session s=held(false,false);assertFalse(RebuildController.visible());assertTrue(RebuildController.ownsNativeTrack());
  // The old visible-only predicate was false here: held track leaked native frames.
  assertTrue(NativeCaptionBridge.suppressNativeDraw());
  s.visible=true;assertTrue(NativeCaptionBridge.suppressNativeDraw());
  s.visible=false;CaptionMusicSuppressor.beginNativeRendererTransition();assertTrue(NativeCaptionBridge.suppressNativeDraw());
  NativeCaptionBridge.applySelection(null,true);assertFalse(NativeCaptionBridge.suppressNativeDraw());
  held(false,false);RebuildController.video("departed-video");assertFalse(NativeCaptionBridge.suppressNativeDraw());
 }
 @Test public void sourceOnlyKeepsRecognizedVisibleBehaviorAndNativePathRestores()throws Exception {
  RebuildController.Session s=held(true,false);assertFalse(NativeCaptionBridge.suppressNativeDraw());
  s.visible=true;assertTrue(NativeCaptionBridge.suppressNativeDraw());
  DeepSeekConfig.saveEnabled(h.a,false);assertFalse(NativeCaptionBridge.suppressNativeDraw());
 }
 @Test public void detachedReattachedAlphaAndSameActivityBindingCannotBypassDraw()throws Exception {
  held(false,false);FrameLayout root=new FrameLayout(h.a);h.a.setContentView(root);
  com.google.android.libraries.youtube.player.subtitles.ui.SubtitleWindowView view=new com.google.android.libraries.youtube.player.subtitles.ui.SubtitleWindowView(h.a);
  root.addView(view);CaptionMusicSuppressor.setActivity(h.a);CaptionMusicSuppressor.forceNativeRendererScan();
  assertEquals(0f,view.getAlpha(),0f);view.draw(new Canvas());assertEquals(0,view.nativeDraws);
  root.removeView(view);view.setAlpha(1f);root.addView(view);view.draw(new Canvas());assertEquals(0,view.nativeDraws);
  CaptionMusicSuppressor.setActivity(h.a);assertEquals(1f,view.getAlpha(),0f);view.draw(new Canvas());assertEquals(0,view.nativeDraws);
  RebuildController.stop();view.draw(new Canvas());assertEquals(1,view.nativeDraws);
 }
}
