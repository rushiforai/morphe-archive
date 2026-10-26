package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;

import android.app.Activity;
import android.graphics.Rect;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;

import java.lang.reflect.Field;
import java.time.Duration;
import java.util.Collections;
import java.util.List;

/**
 * The visible caption sits below YouTube's controls, so its own TextView cannot be the drag
 * target. A transparent proxy in the topmost player-overlay container consumes DOWN only inside the
 * visible box; this test dispatches real MotionEvents through the view hierarchy.
 */
@RunWith(RobolectricTestRunner.class)
@Config(
        sdk = 28,
        qualifiers = "w2736dp-h1264dp-mdpi",
        shadows = {CaptionTouchProxyTest.Surface.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class CaptionTouchProxyTest {
    @Implements(CaptionSurface.class)
    public static class Surface {
        static FrameLayout captionHost, touchHost;
        static Rect video = new Rect(0, 0, 2736, 1264);

        @Implementation
        public static FrameLayout stableCaptionHost() {
            return captionHost;
        }

        @Implementation
        public static FrameLayout touchHost() {
            return touchHost;
        }

        @Implementation
        public static boolean pinnedHost(FrameLayout host) {
            return host == captionHost;
        }

        @Implementation
        public static Rect currentVideoBounds(View host) {
            return new Rect(video);
        }

        @Implementation
        public static Rect refreshedVideoBounds(View host) {
            return new Rect(video);
        }

        @Implementation
        public static boolean isShorts() {
            return false;
        }
    }

    private Activity a;
    private FrameLayout content, captionHost, touchHost;
    private View controls;

    @Before
    public void setUp() {
        CaptionNativeProjection.ccState(CaptionIntentPolicy.ON);
        CaptionPlayerAuthority.resetForTests();
        a = Robolectric.buildActivity(Activity.class).setup().visible().get();
        content = new FrameLayout(a);
        a.setContentView(content);
        captionHost = new FrameLayout(a);
        content.addView(captionHost, new FrameLayout.LayoutParams(2736, 1264));
        controls = new View(a);
        controls.setOnTouchListener((v, e) -> false);
        content.addView(controls, new FrameLayout.LayoutParams(2736, 1264));
        touchHost = new FrameLayout(a);
        content.addView(touchHost, new FrameLayout.LayoutParams(2736, 1264));
        layout();
        Surface.captionHost = captionHost;
        Surface.touchHost = touchHost;
        DeepSeekConfig.saveCaptionSizeTier(a, 2);
        CaptionActions.install(
                new app.yydarlinker.caption.contracts.CaptionContracts.CaptionPort() {
                    public void command(app.yydarlinker.caption.contracts.CaptionContracts.Action action, String value) {}

                    public boolean active() {
                        return false;
                    }

                    public boolean ownsNativeTrack() {
                        return false;
                    }

                    public String restoreTarget(String u) {
                        return u;
                    }

                    public String videoId() {
                        return "fixture";
                    }

                    public void playback(long t) {}
                },
                new CaptionActions.SettingsServices() {
                    public String testApi() {
                        return "fixture";
                    }

                    public List<String> models(String endpoint) {
                        return Collections.emptyList();
                    }

                    public List<CaptionDisplayPage> displayPages(
                            String body,
                            long start,
                            long end,
                            CaptionPresentationBudget geometry,
                            CaptionRenderSpec spec) {
                        return TranslationPresentation.pages(body, start, end, geometry, spec);
                    }
                });
        CaptionOverlay.resetPresentationDedupForTests();
        CaptionOverlay.clear();
        CaptionOverlay.setActivity(a);
    }

    @After
    public void tearDown() {
        CaptionOverlay.clear();
        CaptionOverlay.setActivity(null);
        CaptionPlayerAuthority.resetForTests();
        Surface.captionHost = null;
        Surface.touchHost = null;
        a.finish();
    }

    private void layout() {
        content.measure(
                View.MeasureSpec.makeMeasureSpec(2736, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(1264, View.MeasureSpec.EXACTLY));
        content.layout(0, 0, 2736, 1264);
    }

    private void idle(long ms) {
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(ms));
    }

    private TextView text() throws Exception {
        Field f = CaptionOverlay.class.getDeclaredField("textRef");
        f.setAccessible(true);
        return (TextView) ((java.lang.ref.WeakReference<?>) f.get(null)).get();
    }

    private FrameLayout anchor() throws Exception {
        Field f = CaptionOverlay.class.getDeclaredField("anchorRef");
        f.setAccessible(true);
        return (FrameLayout) ((java.lang.ref.WeakReference<?>) f.get(null)).get();
    }

    private void awaitCaption() throws Exception {
        long deadline = System.nanoTime() + java.util.concurrent.TimeUnit.SECONDS.toNanos(5);
        while (System.nanoTime() < deadline) {
            idle(20);
            layout();
            TextView view = text();
            if (CaptionOverlay.anchorVisible() && view != null && view.getText().length() > 0)
                return;
            Thread.sleep(2);
        }
        throw new AssertionError("caption never became visible");
    }

    @Test
    public void aDownInsideTheCaptionIsConsumedByTheProxyAndMovesTheBox() throws Exception {
        CaptionOverlay.showEvent(
                "上下拖动仍然要能改变字幕位置。",
                () -> true,
                "touch",
                1000,
                61000,
                2000,
                CaptionLanguageContext.explicit("en", "zh-Hans").renderSpec);
        layout();
        awaitCaption();
        assertNotNull(text());
        assertSame(touchHost, CaptionSurface.touchHost());
        Field proxyField = CaptionOverlay.class.getDeclaredField("touchProxy");
        proxyField.setAccessible(true);
        View proxy = (View) proxyField.get(null);
        assertNotNull("the transparent touch proxy must be installed", proxy);
        assertSame("the proxy must live in the topmost player-overlay layer", touchHost, proxy.getParent());

        Rect hit = new Rect();
        if (!text().getGlobalVisibleRect(hit)) throw new AssertionError("caption not visible");
        float before = anchor().getTranslationY();
        long down = android.os.SystemClock.uptimeMillis();
        MotionEvent press =
                MotionEvent.obtain(
                        down, down, MotionEvent.ACTION_DOWN, hit.centerX(), hit.centerY(), 0);
        content.dispatchTouchEvent(press);
        org.robolectric.shadows.ShadowSystemClock.advanceBy(Duration.ofMillis(400));
        idle(1);
        MotionEvent move =
                MotionEvent.obtain(
                        down,
                        down + 400,
                        MotionEvent.ACTION_MOVE,
                        hit.centerX(),
                        hit.centerY() - 90,
                        0);
        content.dispatchTouchEvent(move);
        assertNotEquals("the drag must move the visual box", before, anchor().getTranslationY());
    }

    @Test
    public void aDownOutsideTheCaptionFallsThroughToTheControls() throws Exception {
        CaptionOverlay.showEvent(
                "上下拖动仍然要能改变字幕位置。",
                () -> true,
                "touch-outside",
                1000,
                61000,
                2000,
                CaptionLanguageContext.explicit("en", "zh-Hans").renderSpec);
        layout();
        awaitCaption();
        final boolean[] reachedControls = {false};
        controls.setOnTouchListener(
                (v, e) -> {
                    reachedControls[0] = true;
                    return true;
                });
        layout();

        long down = android.os.SystemClock.uptimeMillis();
        MotionEvent press =
                MotionEvent.obtain(down, down, MotionEvent.ACTION_DOWN, 30, 30, 0);
        content.dispatchTouchEvent(press);
        org.junit.Assert.assertTrue(
                "a touch outside the caption must reach YouTube's controls", reachedControls[0]);
    }
}
