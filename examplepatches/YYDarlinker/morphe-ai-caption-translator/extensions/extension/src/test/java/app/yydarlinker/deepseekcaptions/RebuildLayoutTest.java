package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.graphics.Rect;
import android.view.*;
import android.widget.*;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Native Android text measurement with controlled player bounds; not a real YouTube screenshot. */
@RunWith(RobolectricTestRunner.class)
@Config(
    sdk = 28,
    shadows = {RebuildLayoutTest.Geometry.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@LooperMode(LooperMode.Mode.PAUSED)
public class RebuildLayoutTest {
  static Rect bounds;
  static boolean shorts;
  Activity a;

  @Implements(CaptionSurface.class)
  public static class Geometry {
    @Implementation
    public static boolean isShorts() {
      return shorts;
    }

    @Implementation
    public static View refresh() {
      return null;
    }

    @Implementation
    public static Rect videoBounds(View h) {
      return bounds == null ? null : new Rect(bounds);
    }
  }

  @Before
  public void setup() {
    shorts = false;
    bounds = new Rect(0, 0, 600, 340);
    a = Robolectric.buildActivity(Activity.class).setup().visible().get();
    DeepSeekConfig.saveCaptionTextSize(a, 18);
    CaptionOverlay.clear();
    CaptionOverlay.setActivity(a);
  }

  @After
  public void done() {
    CaptionOverlay.clear();
    CaptionOverlay.setActivity(null);
    a.finish();
  }

  static Object field(String name) throws Exception {
    Field f = CaptionOverlay.class.getDeclaredField(name);
    f.setAccessible(true);
    return f.get(null);
  }

  TextView text() throws Exception {
    return (TextView) ((WeakReference<?>) field("textRef")).get();
  }

  FrameLayout anchor() throws Exception {
    return (FrameLayout) ((WeakReference<?>) field("anchorRef")).get();
  }

  @Test
  public void shortEventIsOneReadableLine() throws Exception {
    CaptionOverlay.showCaption("这是完整的一句。", () -> true);
    assertEquals("这是完整的一句。", text().getText().toString());
    assertEquals(1, CaptionOverlay.lines(a, text().getText().toString(), 18, 550));
    assertEquals(2, text().getMaxLines());
  }

  @Test
  public void longEventFallsBackWithoutTailCropping() throws Exception {
    bounds = new Rect(0, 0, 240, 400);
    String longText = String.join("", java.util.Collections.nCopies(120, "字"));
    CaptionOverlay.showCaption(longText, () -> true, () -> "[Original] source");
    assertEquals("[Original] source", text().getText().toString());
    assertEquals(longText, field("pendingText"));
    assertTrue(text().getTextSize() >= 12 * a.getResources().getDisplayMetrics().scaledDensity);
  }

  @Test
  public void oversizedOriginalAlsoUsesExplicitStatus() throws Exception {
    bounds = new Rect(0, 0, 200, 400);
    String text = String.join("", java.util.Collections.nCopies(200, "字"));
    CaptionOverlay.showCaption(text, () -> true, () -> text);
    assertNotEquals(text, text().getText().toString());
    assertTrue(
        text().getText().toString().contains("Caption") || text().getText().toString().equals("…"));
  }

  @Test
  public void layoutDoesNotInsertHardLineBreaksIntoTranslation() throws Exception {
    String caption =
        "A complete thought remains intact while the renderer selects its visual wrapping.";
    CaptionOverlay.showCaption(caption, () -> true);
    assertEquals(caption, field("pendingText"));
    assertFalse(field("pendingText").toString().contains("\n"));
  }

  @Test
  public void viewRemainsInsideActualVideoBounds() throws Exception {
    bounds = new Rect(20, 30, 380, 250);
    CaptionOverlay.showCaption("字幕", () -> true);
    FrameLayout.LayoutParams p = (FrameLayout.LayoutParams) anchor().getLayoutParams();
    assertTrue(p.leftMargin >= 20);
    assertTrue(p.leftMargin + p.width <= 380);
    assertTrue(p.topMargin >= 30);
    assertTrue(p.topMargin + p.height <= 250);
  }

  @Test
  public void missingGeometryHidesRatherThanCoveringComments() throws Exception {
    CaptionOverlay.showCaption("字幕", () -> true);
    assertEquals(View.VISIBLE, anchor().getVisibility());
    bounds = null;
    CaptionOverlay.refreshStyle(a);
    assertEquals(View.GONE, anchor().getVisibility());
  }

  @Test
  public void expiredSessionGuardHidesEvenWithoutNewCaption() throws Exception {
    boolean[] valid = {true};
    CaptionOverlay.showCaption("旧视频", () -> valid[0]);
    valid[0] = false;
    CaptionOverlay.refreshStyle(a);
    assertEquals(View.GONE, anchor().getVisibility());
  }

  @Test
  public void shortsCanRecoverAfterHiddenMiniplayerWithoutAnotherPlayerCallback() throws Exception {
    CaptionOverlay.showCaption("Shorts 字幕", () -> true);
    CaptionOverlay.beginGuardedExpansion();
    assertEquals(View.GONE, anchor().getVisibility());
    shorts = true;
    Shadows.shadowOf(android.os.Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(600));
    CaptionOverlay.refreshSurface();
    assertEquals(View.VISIBLE, anchor().getVisibility());
  }

  @Test
  public void identicalOverflowDoesNotFloodDiagnosticsOnSurfaceRefresh() throws Exception {
    CaptionDiagnostics.clear(a);
    bounds = new Rect(0, 0, 240, 400);
    String caption = String.join("", java.util.Collections.nCopies(120, "字"));
    CaptionOverlay.showEvent(caption, () -> true, () -> "Original", "r2:1:9");
    for (int n = 0; n < 8; n++) {
      Shadows.shadowOf(android.os.Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(600));
      CaptionOverlay.refreshSurface();
    }
    String history =
        a.getSharedPreferences("deepseek_caption_diagnostics", 0).getString("history", "");
    assertEquals(1, history.split("REBUILD_LAYOUT_FALLBACK", -1).length - 1);
    assertTrue(history.contains("width="));
    assertTrue(history.contains("lines="));
    assertEquals(caption, field("pendingText"));
  }

  @Test
  public void actualPresentationDistinguishesFallbackFromSelectedTranslation() throws Exception {
    CaptionDiagnostics.clear(a);
    DeepSeekConfig.saveDisplayTextDebugEnabled(a, true);
    bounds = new Rect(0, 0, 240, 400);
    String caption = String.join("", java.util.Collections.nCopies(120, "字"));
    CaptionOverlay.showEvent(caption, () -> true, () -> "source retained", "r2:2:10");
    String history =
        a.getSharedPreferences("deepseek_caption_diagnostics", 0).getString("history", "");
    assertTrue(history.contains("REBUILD_PRESENTED"));
    assertTrue(history.contains("mode=original_fallback"));
    assertTrue(history.contains("source retained"));
    DeepSeekConfig.saveDisplayTextDebugEnabled(a, false);
  }

  @Test
  public void capturedLongResponseIsRejectedByRealGeometryBeforeReady() throws Exception {
    bounds = new Rect(0, 0, 300, 500);
    CaptionOverlay.showCaption("Preparing", () -> true);
    CaptionOverlay.LayoutBudget budget = CaptionOverlay.budget();
    assertNotNull(budget);
    RebuildSource source =
        RebuildContractTest.source(
            String.join(" ", java.util.Collections.nCopies(34, "word")), 340);
    String captured = "大量国产设计的武器装备，其中大部分解放军使用的装备，在冷战大部分时期要么是经授权、要么是未经授权仿制或衍生于苏联设计";
    RebuildProtocol.Plan plan =
        RebuildProtocol.parse(
            RebuildContractTest.reply(
                RebuildContractTest.block(source),
                new org.json.JSONArray().put(RebuildContractTest.event(0, 33, captured))),
            source,
            RebuildContractTest.block(source));
    try {
      RebuildProtocol.validateLayout(plan, budget::fits);
      fail("accepted layout overflow");
    } catch (RebuildProtocol.Invalid expected) {
      assertEquals("layout_overflow", expected.code);
    }
    assertEquals(captured, plan.events.get(0).text); // No text shortening in order to pass.
  }

  @Test
  public void shortTranslationPassesGeometryAndKeepsSourceTime() throws Exception {
    bounds = new Rect(0, 0, 300, 500);
    CaptionOverlay.showCaption("Preparing", () -> true);
    RebuildSource source = RebuildContractTest.source("Hello world.", 700);
    RebuildProtocol.Plan plan =
        RebuildProtocol.parse(
            RebuildContractTest.reply(
                RebuildContractTest.block(source),
                new org.json.JSONArray().put(RebuildContractTest.event(0, 1, "你好，世界。"))),
            source,
            RebuildContractTest.block(source));
    RebuildProtocol.validateLayout(plan, CaptionOverlay.budget()::fits);
    assertEquals(1400, plan.events.get(0).end);
  }

  @Test public void twoLinesUseCompactBackgroundRatherThanMaximumVideoWidth() throws Exception {
    bounds=new Rect(0,0,360,203);
    String caption="This is the first line\nAnd this is the second";
    CaptionOverlay.showCaption(caption,()->true);
    assertEquals(caption,text().getText().toString());
    assertTrue(text().getMeasuredWidth()<Math.round(bounds.width()*.92f)-20);
    assertEquals(2,text().getLayout().getLineCount());
  }
  @Test public void fullscreenScalesFontWithActualVideoWidthAndRestores() throws Exception {
    bounds=new Rect(0,0,360,203);CaptionOverlay.showCaption("Short caption",()->true);
    float inline=text().getTextSize();
    bounds=new Rect(0,0,640,360);CaptionOverlay.refreshStyle(a);
    assertEquals(inline*640f/360f,text().getTextSize(),.1f);
    bounds=new Rect(0,0,360,203);CaptionOverlay.refreshStyle(a);
    assertEquals(inline,text().getTextSize(),.1f);
  }
  @Test public void longWrappedTextKeepsAllCharactersAtCompactWidth() throws Exception {
    bounds=new Rect(0,0,360,203);
    String caption="The complete sentence should wrap naturally across two readable lines.";
    CaptionOverlay.showCaption(caption,()->true);
    assertEquals(caption,text().getText().toString());
    android.text.Layout layout=text().getLayout();
    assertTrue(layout.getLineCount()<=2);
    assertEquals(caption.length(),layout.getLineEnd(layout.getLineCount()-1));
  }
  @Test public void previewAndRendererShareProportionalSizing() {
    float density=3,scaledDensity=3.6f,actualWidth=1920,previewWidth=600;
    float actual=SubtitleStyleMetrics.scaledSp(18,actualWidth/density)*scaledDensity;
    float preview=SubtitleStyleMetrics.previewTextPx(18,1080,density,scaledDensity,previewWidth);
    assertEquals(actual*previewWidth/actualWidth,preview,.001f);
  }
}
