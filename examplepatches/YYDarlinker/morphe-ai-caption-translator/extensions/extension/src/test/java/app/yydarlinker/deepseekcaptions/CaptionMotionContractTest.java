package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.graphics.Rect;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.LooperMode;

import java.time.Duration;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * The motion contract: a moving video rectangle is a transform, not a new page identity. The box
 * must keep its text and page plan while the surface animates, then re-project once when it settles.
 */
@RunWith(RobolectricTestRunner.class)
@Config(
        sdk = 28,
        qualifiers = "w1280dp-h1000dp-mdpi",
        shadows = {N39UiGeometryFixture.Geometry.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@LooperMode(LooperMode.Mode.PAUSED)
public class CaptionMotionContractTest {
    private N39UiGeometryFixture fixture;

    private final CaptionOverlay.RenderGuard guard =
            new CaptionOverlay.RenderGuard() {
                @Override
                public boolean isValid() {
                    return true;
                }

                @Override
                public long displayPosition(long supplied) {
                    return 2000;
                }
            };

    private final CaptionRenderSpec spec =
            CaptionLanguageContext.explicit("en", "zh-Hans").renderSpec;

    @Before
    public void setUp() {
        CaptionPlayerAuthority.resetForTests();
        fixture = new N39UiGeometryFixture();
        fixture.setup();
    }

    @After
    public void tearDown() {
        DeepSeekConfig.resetCaptionPositions(fixture.a);
        fixture.done();
        CaptionPlayerAuthority.resetForTests();
    }

    private void layout() {
        View content = fixture.a.findViewById(android.R.id.content);
        content.measure(
                View.MeasureSpec.makeMeasureSpec(1280, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(1000, View.MeasureSpec.EXACTLY));
        content.layout(0, 0, 1280, 1000);
        content.getViewTreeObserver().dispatchOnPreDraw();
    }

    private void idle(long ms) {
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(ms));
    }

    private Object field(String name) throws Exception {
        return N39UiGeometryFixture.field(name);
    }

    @SuppressWarnings("unchecked")
    private List<CaptionPageLayout.Page> pages() throws Exception {
        return (List<CaptionPageLayout.Page>) field("pendingPages");
    }

    private void show(String text) {
        CaptionOverlay.showEvent(text, guard, "motion", 1000, 61000, 2000, spec);
        layout();
        fixture.awaitPreparedCaption();
        layout();
    }

    /**
     * A moving video rectangle is a transform, not a content swap. The event identity survives the
     * whole motion; when the geometry finally settles, the narrower width may commit exactly one
     * new page plan, and that plan must then stay stable.
     */
    @Test
    public void movingGeometryKeepsItsContentWhileTheBoxTranslates() throws Exception {
        String text =
                "中国的整体军事现代化，比仅让四辆坦克驶过红场更令人印象深刻。"
                        + "没有标点也能显示完整意思，而且这句话足够长，需要分成好几页显示。"
                        + "每一页都应该是一个完整的分句，不会被从中间切开。";
        show(text);
        // Prime the motion window: the first change may legitimately commit one isolated layout.
        N39UiGeometryFixture.bounds = new Rect(0, 0, 590, 340);
        layout();
        idle(16);
        String event = (String) field("pendingIdentity");
        FrameLayout box = fixture.anchor();

        int[] widths = {580, 560, 540, 520, 500, 480, 460, 440};
        boolean moved = false;
        for (int width : widths) {
            N39UiGeometryFixture.bounds = new Rect(0, 0, width, 340);
            layout();
            idle(16);
            assertEquals("motion must never switch the event", event, field("pendingIdentity"));
            moved |= box.getTranslationX() != 0f || box.getTranslationY() != 0f;
        }
        assertTrue("the box followed the video by translation", moved);

        // The geometry is now held at 440 px: the settled width needs three equal pre-draw samples,
        // then the stable-width re-plan may commit once, and only once. Repeating the same held
        // frame must not start another generation.
        idle(300);
        layout();
        idle(16);
        layout();
        idle(16);
        layout();
        String settled = (String) field("desiredLayout");
        String settledText = fixture.text().getText().toString();
        assertTrue("the narrower settled video re-plans to its own width", !settled.isEmpty());
        assertTrue(
                "the settled plan is narrower than the full class width",
                ((CaptionPresentationBudget) field("planBudget")).width < 528);
        idle(300);
        layout();
        assertEquals("a settled geometry must not re-plan repeatedly", settled, field("desiredLayout"));
        assertEquals(
                "a settled re-plan must not blank or swap the event",
                settledText,
                fixture.text().getText().toString());
    }

    @Test
    public void draggingStillMovesTheCaption() throws Exception {
        show("上下拖动仍然要能改变字幕位置。");
        FrameLayout box = fixture.anchor();
        float before = box.getTranslationY();
        long down = android.os.SystemClock.uptimeMillis();
        android.view.MotionEvent press =
                android.view.MotionEvent.obtain(
                        down, down, android.view.MotionEvent.ACTION_DOWN, 100, 100, 0);
        java.lang.reflect.Method drag =
                CaptionOverlay.class.getDeclaredMethod(
                        "drag", View.class, android.view.MotionEvent.class);
        drag.setAccessible(true);
        drag.invoke(null, fixture.text(), press);
        org.robolectric.shadows.ShadowSystemClock.advanceBy(java.time.Duration.ofMillis(400));
        idle(1);
        long moveAt = down + 400;
        android.view.MotionEvent move =
                android.view.MotionEvent.obtain(
                        down, moveAt, android.view.MotionEvent.ACTION_MOVE, 100, 40, 0);
        drag.invoke(null, fixture.text(), move);
        assertNotEquals(before, box.getTranslationY());
    }

    /**
     * A resize that still fits the committed page is a transform, not a content change. This is the
     * comments-open / detail-to-fullscreen case: the box must not resize or re-paginate at all.
     */
    @Test
    public void aGeometryStepThatStillFitsKeepsTheCommittedPlanAndBox() throws Exception {
        N39UiGeometryFixture.bounds = new Rect(0, 0, 1000, 600);
        show("上下拖动仍然要能改变字幕位置。");
        String plan = (String) field("desiredLayout");
        int box = fixture.anchor().getWidth();
        assertFalse(plan.isEmpty());
        assertTrue(box > 0);

        int[] widths = {1020, 1040, 1060, 1080};
        for (int width : widths) {
            N39UiGeometryFixture.bounds = new Rect(0, 0, width, 600);
            layout();
            idle(150);
            assertEquals("a fitting resize must keep the page plan", plan, field("desiredLayout"));
            assertEquals("a fitting resize must keep the box width", box, fixture.anchor().getWidth());
        }
    }

    /**
     * The drag must use the rectangle the finger is over, not the last content commit. A stale
     * portrait content rect used to write the portrait preference while the placement read the
     * landscape one, so the box did not follow the finger in landscape.
     */
    @Test
    public void aLandscapeDragUsesTheLiveOrientationAndLiveRectangle() throws Exception {
        show("上下拖动仍然要能改变字幕位置。");
        N39UiGeometryFixture.bounds = new Rect(0, 0, 1000, 600);
        layout();
        idle(150);
        DeepSeekConfig.saveCaptionPosition(fixture.a, true, .5f);
        DeepSeekConfig.saveCaptionPosition(fixture.a, false, .5f);
        Rect previous = (Rect) field("previous");
        previous.set(0, 0, 600, 1000);

        long down = android.os.SystemClock.uptimeMillis();
        android.view.MotionEvent press =
                android.view.MotionEvent.obtain(
                        down, down, android.view.MotionEvent.ACTION_DOWN, 100, 100, 0);
        java.lang.reflect.Method drag =
                CaptionOverlay.class.getDeclaredMethod(
                        "drag", View.class, android.view.MotionEvent.class);
        drag.setAccessible(true);
        drag.invoke(null, fixture.text(), press);
        org.robolectric.shadows.ShadowSystemClock.advanceBy(java.time.Duration.ofMillis(400));
        idle(1);
        android.view.MotionEvent move =
                android.view.MotionEvent.obtain(
                        down, down + 400, android.view.MotionEvent.ACTION_MOVE, 100, 40, 0);
        drag.invoke(null, fixture.text(), move);

        assertNotEquals(
                "the landscape preference must move",
                .5f,
                DeepSeekConfig.captionPositionY(fixture.a, true),
                .001f);
        assertEquals(
                "the portrait preference must not be written",
                .5f,
                DeepSeekConfig.captionPositionY(fixture.a, false),
                .001f);
    }

    @Test
    public void aCaptionLayoutRequestNeverCancelsTheWindowDraw() throws Exception {
        show("字幕请求布局时，不能取消整窗这一帧的绘制。");
        fixture.text().requestLayout();
        java.lang.reflect.Field field = CaptionOverlay.class.getDeclaredField("WATCH");
        field.setAccessible(true);
        android.view.ViewTreeObserver.OnPreDrawListener watch =
                (android.view.ViewTreeObserver.OnPreDrawListener) field.get(null);
        assertTrue(
                "WATCH must always allow the frame",
                watch.onPreDraw());
    }

    @Test
    public void aTransientMissingSurfaceDoesNotFlashTheCaption() throws Exception {
        show("播放器重建时短暂没有 Surface，不应把已验证的字幕闪掉。");
        N39UiGeometryFixture.bounds = null;
        CaptionOverlay.refreshStyle(fixture.a);
        idle(30);
        assertTrue(CaptionOverlay.anchorVisible());
        assertTrue(fixture.text().getText().length() > 0);
    }
}
