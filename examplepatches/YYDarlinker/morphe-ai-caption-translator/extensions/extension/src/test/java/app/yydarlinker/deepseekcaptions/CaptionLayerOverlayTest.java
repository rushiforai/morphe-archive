package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.graphics.Rect;
import android.os.Looper;
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
import java.lang.reflect.Method;
import java.time.Duration;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * The unified caption layer and size contract, on a watch page whose player and comment sheet are
 * separate branches:
 *
 * <ul>
 *   <li>the overlay is a child of the video plane, so the sheet (a later sibling of the player) is
 *       drawn above it by construction;
 *   <li>opening the sheet may change the video rectangle, but never the glyph size: size follows the
 *       player mode and display width only;
 *   <li>the narrower rectangle still re-projects the same text into whole-clause pages.
 * </ul>
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, qualifiers = "w2736dp-h1264dp-mdpi", shadows = {CaptionLayerOverlayTest.Layer.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class CaptionLayerOverlayTest {
    @Implements(CaptionSurface.class)
    public static class Layer {
        static FrameLayout host;
        static Rect video = new Rect(0, 0, 2247, 1264);
        static int globalWidth = 2247;
        static int globalHeight = 1264;
        static View surface;

        @Implementation
        public static FrameLayout captionHost() {
            return host;
        }

        @Implementation
        public static View currentSurfaceView() {
            if (surface != null) {
                // The sheet animation is a uniform scale on the player container; the local
                // surface keeps its measured size while its global short side shrinks.
                float scale = globalWidth / 2247f;
                surface.setScaleX(scale);
                surface.setScaleY(scale);
            }
            return surface;
        }

        @Implementation
        public static View refresh() {
            return null;
        }

        @Implementation
        public static boolean isShorts() {
            return false;
        }

        @Implementation
        public static boolean shortsSurfaceNow() {
            return false;
        }

        @Implementation
        public static Rect currentVideoBounds(View h) {
            return new Rect(video);
        }
    }

    private Activity a;
    private FrameLayout content, watchPage, player, plane, sheet;
    /** Makes page planning slow enough that the endpoint hold is observable, not a race. */
    private volatile boolean slowPages;

    @Before
    public void setUp() {
        CaptionNativeProjection.ccState(CaptionIntentPolicy.ON);
        CaptionPlayerAuthority.resetForTests();
        CaptionSurface.invalidateGeometry();
        a = Robolectric.buildActivity(Activity.class).setup().visible().get();
        a.getResources().getDisplayMetrics().widthPixels = 2736;
        a.getResources().getDisplayMetrics().heightPixels = 1264;
        DeepSeekConfig.saveCaptionSizeTier(a, 2);
        content = new FrameLayout(a);
        a.setContentView(content);
        watchPage = new FrameLayout(a);
        content.addView(watchPage, new FrameLayout.LayoutParams(2736, 1264));
        player = new FrameLayout(a);
        watchPage.addView(player, new FrameLayout.LayoutParams(2247, 1264));
        plane = new FrameLayout(a);
        player.addView(plane, new FrameLayout.LayoutParams(2247, 1264));
        // The comment sheet is drawn after the player branch: any child of the player is below it.
        sheet = new FrameLayout(a);
        watchPage.addView(sheet, new FrameLayout.LayoutParams(2736, 1264));
        layout();
        Layer.host = plane;
        Layer.video = new Rect(0, 0, 2247, 1264);
        Layer.globalWidth = 2247;
        Layer.globalHeight = 1264;
        Layer.surface = new View(a);
        Layer.surface.layout(0, 0, 2247, 1264);
        CaptionActions.install(
                new app.yydarlinker.caption.contracts.CaptionContracts.CaptionPort() {
                    public void command(app.yydarlinker.caption.contracts.CaptionContracts.Action action, String value) {}
                    public boolean active() { return false; }
                    public boolean ownsNativeTrack() { return false; }
                    public String restoreTarget(String u) { return u; }
                    public String videoId() { return "fixture"; }
                    public void playback(long t) {}
                },
                new CaptionActions.SettingsServices() {
                    public String testApi() { return "fixture"; }
                    public List<String> models(String endpoint) { return Collections.emptyList(); }
                    public List<CaptionDisplayPage> displayPages(
                            String body,
                            long start,
                            long end,
                            CaptionPresentationBudget geometry,
                            CaptionRenderSpec spec) {
                        if (slowPages) {
                            try {
                                Thread.sleep(180);
                            } catch (InterruptedException interrupted) {
                                Thread.currentThread().interrupt();
                            }
                        }
                        return TranslationPresentation.pages(body, start, end, geometry, spec);
                    }
                });
        CaptionOverlay.resetPresentationDedupForTests();
        CaptionOverlay.resetGlyphForTests();
        CaptionOverlay.clear();
        CaptionOverlay.setActivity(a);
    }

    @After
    public void tearDown() {
        CaptionOverlay.resetGlyphForTests();
        CaptionOverlay.clear();
        CaptionOverlay.setActivity(null);
        CaptionPlayerAuthority.resetForTests();
        CaptionSurface.invalidateGeometry();
        Layer.host = null;
        Layer.surface = null;
        a.finish();
    }

    private void layout() {
        content.measure(
                View.MeasureSpec.makeMeasureSpec(2736, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(1264, View.MeasureSpec.EXACTLY));
        content.layout(0, 0, 2736, 1264);
    }

    private void show(String text, String id) {
        CaptionOverlay.showEvent(
                text,
                () -> true,
                id,
                1000,
                61000,
                2000,
                CaptionLanguageContext.explicit("en", "zh-Hans").renderSpec);
        layout();
    }

    private TextView text() throws Exception {
        return (TextView) field("textRef", true);
    }

    private FrameLayout anchor() throws Exception {
        return (FrameLayout) field("anchorRef", true);
    }

    @SuppressWarnings("unchecked")
    private List<CaptionPageLayout.Page> pages() throws Exception {
        return (List<CaptionPageLayout.Page>) field("pendingPages", false);
    }

    private Object field(String name, boolean weak) throws Exception {
        boolean decisionField = name.equals("presentationClass") || name.equals("classBaseWidth")
                || name.equals("classFrameWidth") || name.equals("reducedVideoWidth")
                || name.equals("previousGeometryWidth") || name.equals("stableGeometrySamples");
        Object owner = null;
        Class<?> declaring = CaptionOverlay.class;
        if (decisionField) {
            Field decision = CaptionOverlay.class.getDeclaredField("presentationDecision");
            decision.setAccessible(true);
            owner = decision.get(null);
            declaring = CaptionPresentationDecision.class;
        }
        Field f = declaring.getDeclaredField(name);
        f.setAccessible(true);
        Object value = f.get(owner);
        return weak && value instanceof java.lang.ref.WeakReference
                ? ((java.lang.ref.WeakReference<?>) value).get()
                : value;
    }

    private void idle() {
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(20));
    }

    /** Robolectric does not always dispatch the host's pre-draw listener after a manual layout. */
    private void pump() throws Exception {
        Method geometry = CaptionOverlay.class.getDeclaredMethod("geometryFrame");
        geometry.setAccessible(true);
        geometry.invoke(null);
        Method render = CaptionOverlay.class.getDeclaredMethod("render");
        render.setAccessible(true);
        render.invoke(null);
    }

    private void awaitCaption() throws Exception {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
        while (System.nanoTime() < deadline) {
            idle();
            TextView view = text();
            if (CaptionOverlay.anchorVisible() && view != null && view.getText().length() > 0) return;
            Thread.sleep(2);
        }
        fail("caption never became visible");
    }

    @Test
    public void openingCaptionCommitsItsOwnBoundsWhileThePlayerDefersLayout() throws Exception {
        CaptionOverlay.showStatus("翻译中…", () -> true);
        layout();
        int waitingWidth = text().getWidth();
        plane.suppressLayout(true);
        try {
            CaptionOverlay.showEvent("开头这一页应当完整显示，边缘文字不能被旧的等待框裁剪。", () -> true,
                    "opening:deferred", 1000, 61000, 2000,
                    CaptionLanguageContext.explicit("en", "zh-Hans").renderSpec);
            long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
            while (!text().getText().toString().contains("开头") && System.nanoTime() < deadline) {
                idle();
                Thread.sleep(2);
            }
            assertTrue("new caption reached the real TextView", text().getText().toString().contains("开头"));
            assertTrue("the caption needs a wider box than the waiting label", text().getMeasuredWidth() > waitingWidth);
            assertEquals("a visible layout must not retain the previous page's clipping width",
                    text().getMeasuredWidth(), text().getWidth());
            assertEquals(text().getMeasuredHeight(), text().getHeight());
            assertEquals("the parent frame and the text commit together", anchor().getLayoutParams().width,
                    anchor().getWidth());
        } finally {
            plane.suppressLayout(false);
        }
    }

    private void awaitPlan(int innerWidth) throws Exception {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
        while (System.nanoTime() < deadline) {
            layout();
            idle();
            pump();
            CaptionPresentationBudget budget = CaptionOverlay.budget();
            if (budget != null && budget.width == innerWidth && !pages().isEmpty()) return;
            Thread.sleep(2);
        }
        fail(
                "plan for inner width "
                        + innerWidth
                        + " never became ready; budget="
                        + (CaptionOverlay.budget() == null ? -1 : CaptionOverlay.budget().width)
                        + ";box="
                        + (anchor() == null ? -1 : anchor().getWidth())
                        + ";plan="
                        + field("desiredLayout", false));
    }

    private int innerWidth(int videoWidth) throws Exception {
        TextView view = text();
        int padding = view.getPaddingLeft() + view.getPaddingRight();
        return Math.round(videoWidth * .92f) - padding;
    }

    @Test
    public void theCaptionIsInsideThePlayerBranchAndTheSheetIsDrawnAboveIt() throws Exception {
        show("剧透一下：下一期我会分享一份指南。", "layer");
        awaitCaption();

        FrameLayout anchor = anchor();
        assertSame(plane, anchor.getParent());
        assertNotSame(content, anchor.getParent());
        assertTrue(
                "the sheet must be drawn after the player branch",
                watchPage.indexOfChild(sheet) > watchPage.indexOfChild(player));
        View current = anchor;
        boolean insidePlayer = false;
        while (current != null) {
            if (current == player) insidePlayer = true;
            current = current.getParent() instanceof View ? (View) current.getParent() : null;
        }
        assertTrue("the caption must be a descendant of the player", insidePlayer);
    }

    @Test
    public void theReadingSizeFollowsTheSheetScaleBeforeTheClassCommits() throws Exception {
        show("剧透一下：下一期我会分享一份指南。", "scale:together");
        awaitCaption();
        assertEquals(55.5f, measuredGlyphHeight(text()), 0.6f);
        Layer.globalWidth = 1850; // half-way through the sheet's on-screen scale
        Layer.globalHeight = 1050;
        layout();
        pump();
        // The size step is a 180 ms frame-clock transition; sample it in the middle.
        CaptionOverlay.advanceDisplayedGlyph(0);
        CaptionOverlay.advanceDisplayedGlyph(120_000_000L);
        CaptionOverlay.applyCommentScale(a, text());
        assertEquals(
                "the binary class waits for the sheet endpoint",
                CaptionPresentationClass.Kind.FULL,
                field("presentationClass", false));
        float midScale = text().getScaleY();
        assertTrue("the reading size must already be shrinking: " + midScale, midScale < .96f);
        assertTrue("the scale must not jump to the full reduction: " + midScale, midScale > .8f);

        Layer.globalWidth = 1478;
        Layer.globalHeight = 831;
        Layer.video = new Rect(0, 0, 1478, 831);
        plane.setLayoutParams(new FrameLayout.LayoutParams(1478, 831));
        player.setLayoutParams(new FrameLayout.LayoutParams(1478, 831));
        layout();
        pump();
        awaitPlan(innerWidth(1478));
        settleGlyph();
        assertEquals(
                CaptionPresentationClass.Kind.REDUCED,
                field("presentationClass", false));
        assertEquals("the endpoint commits the real detail font", 44.5f, measuredGlyphHeight(text()), 0.6f);
        assertEquals(
                "the painted page follows the continuous size law",
                lawGlyphForGlobalWidth(1478),
                paintedGlyphHeight(),
                0.9f);
    }

    /**
     * The endpoint is a content change, not a size change: while the new page is being planned the
     * previous layout is still on screen, and the 180 ms size step must reach the detail endpoint
     * before the new page lands. A scale reset at the commit would paint it at the full size for
     * that whole latency.
     */
    @Test
    public void theEndpointStepReachesTheDetailSizeWhileTheOldPageIsStillHeld()
            throws Exception {
        slowPages = true;
        show("剧透一下：下一期我会分享一份指南。", "scale:hold");
        awaitCaption();
        assertEquals(55.5f, paintedGlyphHeight(), 0.8f);

        Layer.globalWidth = 1850;
        Layer.globalHeight = 1050;
        layout();
        pump();
        CaptionOverlay.advanceDisplayedGlyph(0);
        CaptionOverlay.advanceDisplayedGlyph(120_000_000L);
        CaptionOverlay.applyCommentScale(a, text());
        assertTrue("the sheet must already be shrinking the text", text().getScaleY() < .96f);

        Layer.globalWidth = 1478;
        Layer.globalHeight = 831;
        Layer.video = new Rect(0, 0, 1478, 831);
        plane.setLayoutParams(new FrameLayout.LayoutParams(1478, 831));
        player.setLayoutParams(new FrameLayout.LayoutParams(1478, 831));
        layout();
        float beforeEndpoint = paintedGlyphHeight();
        pump();
        assertEquals(
                "the viewport endpoint commits the reduced class",
                CaptionPresentationClass.Kind.REDUCED,
                field("presentationClass", false));
        assertTrue(
                "the new page cannot be there yet: the planner is slow on purpose",
                pages().isEmpty());
        // A step starts on the frame clock; the first frame still paints the old value.
        CaptionOverlay.advanceDisplayedGlyph(0);
        assertEquals(
                "the first frame of a step must not jump",
                beforeEndpoint,
                paintedGlyphHeight(),
                1.2f);
        CaptionOverlay.advanceDisplayedGlyph(180_000_000L);
        CaptionOverlay.applyCommentScale(a, text());
        assertEquals(
                "the old layout must reach the size law's endpoint while it is still held",
                lawGlyphForGlobalWidth(1478),
                paintedGlyphHeight(),
                0.9f);

        awaitPlan(innerWidth(1478));
        settleGlyph();
        assertEquals(44.5f, measuredGlyphHeight(text()), 0.6f);
        assertEquals(
                "the law's correction is still valid after the real detail layout is applied",
                lawGlyphForGlobalWidth(1478) / measuredGlyphHeight(text()),
                text().getScaleY(),
                .02f);
        slowPages = false;
    }

    /** A pre-draw class commit must be rendered by the next frame callback, not by pre-draw. */
    @Test
    public void aClassCommitFromPreDrawRendersInTheNextAnimationPhase() throws Exception {
        show("剧透一下：下一期我会分享一份指南。", "frame:callback");
        awaitCaption();
        Object before = field("desiredLayout", false);
        Layer.video = new Rect(0, 0, 1478, 831);
        Layer.globalWidth = 1478;
        Layer.globalHeight = 831;
        plane.setLayoutParams(new FrameLayout.LayoutParams(1478, 831));
        player.setLayoutParams(new FrameLayout.LayoutParams(1478, 831));
        layout();
        java.lang.reflect.Field watchField = CaptionOverlay.class.getDeclaredField("WATCH");
        watchField.setAccessible(true);
        android.view.ViewTreeObserver.OnPreDrawListener watch =
                (android.view.ViewTreeObserver.OnPreDrawListener) watchField.get(null);
        watch.onPreDraw();
        assertEquals(
                "the model/geometry commit is decided in pre-draw",
                CaptionPresentationClass.Kind.REDUCED,
                field("presentationClass", false));
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(20));
        assertNotEquals(
                "the content commit must have run in the frame callback",
                before,
                field("desiredLayout", false));
    }

    /** The speculative plan must be the plan the commit asks for, and must not be planned twice. */
    @Test
    public void aPrefetchedPlanIsReadyForTheRequestThatNeedsIt() throws Exception {
        CaptionPageExecutor executor = (CaptionPageExecutor) field("LAYOUTS", false);
        String key = "prefetch:test:" + System.nanoTime();
        java.util.concurrent.atomic.AtomicInteger plans = new java.util.concurrent.atomic.AtomicInteger();
        executor.prefetch(key, () -> {
            plans.incrementAndGet();
            return TranslationPresentation.pages(
                    "预制的分页计划。", 0, 4000, slowBudget(), renderSpec());
        });
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
        while (System.nanoTime() < deadline && executor.get(key) == null) Thread.sleep(2);
        assertNotNull("the speculative plan must land in the cache", executor.get(key));
        assertFalse("a prefetch must cache a real plan", executor.get(key).isEmpty());
        assertEquals("the planner runs once", 1, plans.get());

        executor.prefetch(key, () -> {
            plans.incrementAndGet();
            return Collections.emptyList();
        });
        Thread.sleep(30);
        assertEquals("a cached plan is not planned again", 1, plans.get());
    }

    @Test
    public void openingTheSheetSwitchesToDetailSizeAndRepaginatesOnce() throws Exception {
        show("剧透一下：下一期我会分享一份指南。", "size:wide");
        awaitCaption();
        float wideSize = text().getTextSize();
        int wideBudget = CaptionOverlay.budget().width;
        int wideBox = anchor().getWidth();
        Object widePlan = field("desiredLayout", false);
        assertEquals(55.5f, measuredGlyphHeight(text()), 0.6f);
        assertEquals(innerWidth(2247), wideBudget);

        Layer.video = new Rect(0, 0, 1478, 831);
        Layer.globalWidth = 1478;
        Layer.globalHeight = 831;
        plane.setLayoutParams(new FrameLayout.LayoutParams(1478, 831));
        player.setLayoutParams(new FrameLayout.LayoutParams(1478, 831));
        layout();
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(200));
        layout();
        awaitPlan(innerWidth(1478));
        // awaitPlan returns on the commit frame; the new box needs its own layout pass.
        layout();

        assertTrue(
                "a reduced landscape viewport must use the detail reading size",
                text().getTextSize() < wideSize);
        assertEquals(44.5f, measuredGlyphHeight(text()), 0.6f);
        assertEquals(
                "the class width must be the reduced viewport width",
                innerWidth(1478),
                CaptionOverlay.budget().width);
        assertNotEquals(
                "the class switch must commit exactly one new page plan",
                widePlan,
                field("desiredLayout", false));
        assertNotEquals(
                "the stable box must no longer be the fullscreen box",
                wideBox,
                anchor().getWidth());
        assertTrue(
                "the committed text must fit the reduced class width",
                (Integer) field("contentWidth", false) <= innerWidth(1478) + 12);
    }

    @Test
    public void aOneLinePageDoesNotInheritTheEventsTwoLineHeight() throws Exception {
        TextView view = new TextView(a);
        view.setLayoutParams(new FrameLayout.LayoutParams(1, 1));
        CaptionRenderSpec spec = CaptionLanguageContext.explicit("en", "zh-Hans").renderSpec;
        String text = "网上有很多视频声称，";
        Method apply =
                CaptionOverlay.class.getDeclaredMethod(
                        "applyVisibleText",
                        TextView.class,
                        String.class,
                        float.class,
                        int.class,
                        CaptionRenderSpec.class,
                        CaptionLinePlan.class,
                        int.class,
                        int.class);
        apply.setAccessible(true);
        CaptionLinePlan twoLines =
                new CaptionLinePlan(
                        text,
                        0,
                        text.length(),
                        text.length() / 2,
                        700f,
                        700f,
                        CaptionLinePlan.CutClass.MODEL_PHRASE);
        apply.invoke(null, view, text, 48.68f, 944, spec, twoLines, 764, 2);
        int twoLineHeight = view.getMinHeight();
        CaptionLinePlan oneLine =
                new CaptionLinePlan(
                        text,
                        0,
                        text.length(),
                        text.length(),
                        700f,
                        0f,
                        CaptionLinePlan.CutClass.MODEL_PHRASE);
        apply.invoke(null, view, text, 48.68f, 944, spec, oneLine, 764, 2);
        assertEquals(
                "one line of text plus padding",
                view.getLineHeight() + view.getPaddingTop() + view.getPaddingBottom(),
                view.getMinHeight());
        assertTrue(
                "the plan-wide two-line box must not survive into a one-line page",
                view.getMinHeight() < twoLineHeight);
    }

    @Test
    public void theNarrowerVideoReprojectsTheSameTextIntoWholeClausePages() throws Exception {
        String text =
                "中国的整体军事现代化，比仅让四辆坦克驶过红场更令人印象深刻。"
                        + "没有标点也能显示完整意思，而且这句话足够长，需要分成好几页显示。"
                        + "每一页都应该是一个完整的分句，不会被从中间切开。";
        show(text, "pages:wide");
        awaitCaption();
        awaitPlan(innerWidth(2247));
        int widePages = pages().size();
        assertTrue(widePages > 0);

        Layer.video = new Rect(0, 0, 700, 394);
        Layer.globalWidth = 700;
        Layer.globalHeight = 394;
        plane.setLayoutParams(new FrameLayout.LayoutParams(700, 394));
        layout();
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(200));
        layout();
        awaitPlan(innerWidth(700));

        int narrowPages = pages().size();
        assertTrue(
                "expected more pages at the narrower width: wide=" + widePages + " narrow=" + narrowPages,
                narrowPages > widePages);
        StringBuilder joined = new StringBuilder();
        for (CaptionPageLayout.Page page : pages()) joined.append(page.text.replace("\n", ""));
        assertEquals(text, joined.toString());
    }

    @Test
    public void aStableNarrowerVideoReplansTheBoxInsideTheVideo() throws Exception {
        show("剧透一下：下一期我会分享一份指南。", "stable:replan");
        awaitCaption();
        awaitPlan(innerWidth(2247));
        layout();
        assertEquals(2067, (int) (Integer) field("classFrameWidth", false));

        Layer.video = new Rect(0, 0, 1901, 1264);
        plane.setLayoutParams(new FrameLayout.LayoutParams(1901, 1264));
        player.setLayoutParams(new FrameLayout.LayoutParams(1901, 1264));
        layout();
        pump(); // records the new rectangle
        pump(); // the same rectangle again: the transition is over
        int padding = text().getPaddingLeft() + text().getPaddingRight();
        int expectedInner = ((Math.round(1901 * .92f) - padding) / 8) * 8;
        awaitPlan(expectedInner);
        layout();

        int box = (int) (Integer) field("boxWidth", false);
        assertTrue("the committed box must fit the narrower video: " + box, box <= 1901);
        assertTrue("the stable class width must have been replaced: " + box, box < 2067);
        assertEquals(
                "the plan uses 92% of the video, quantized to 8 px",
                expectedInner,
                CaptionOverlay.budget().width);
        float center = anchor().getTranslationX() + box / 2f;
        assertEquals("the box stays on the video center line", 1901 / 2f, center, 1f);
    }

    /**
     * The old "static" test compared one frame with the previous one, so a rectangle flickering
     * between two values settled once per pair of frames and re-planned the box back and forth.
     * Three consecutive identical widths are required now: a two-frame flicker never settles.
     */
    @Test
    public void anAlternatingVideoRectangleNeverReplansTheBox() throws Exception {
        show("剧透一下：下一期我会分享一份指南。", "stable:flicker");
        awaitCaption();
        awaitPlan(innerWidth(2247));
        layout();
        assertEquals(2067, (int) (Integer) field("classFrameWidth", false));
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_FULLSCREEN");
        CaptionDiagnostics.clear(a);

        int[] widths = {1478, 1478, 2247, 2247, 1478, 1478, 2247, 2247};
        for (int width : widths) {
            int height = width == 1478 ? 831 : 1264;
            Layer.video = new Rect(0, 0, width, height);
            plane.setLayoutParams(new FrameLayout.LayoutParams(width, height));
            player.setLayoutParams(new FrameLayout.LayoutParams(width, height));
            layout();
            pump();
        }

        assertEquals("a two-frame flicker is not a settled geometry", 0, stableReplans());
        assertEquals(2067, (int) (Integer) field("classFrameWidth", false));
    }

    /** A width that stays for three samples re-plans exactly once, on the third sample. */
    @Test
    public void aStableNarrowerVideoReplansOnlyOnTheThirdSample() throws Exception {
        show("剧透一下：下一期我会分享一份指南。", "stable:three");
        awaitCaption();
        awaitPlan(innerWidth(2247));
        layout();
        assertEquals(2067, (int) (Integer) field("classFrameWidth", false));
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_FULLSCREEN");
        CaptionDiagnostics.clear(a);

        Layer.video = new Rect(0, 0, 1901, 1264);
        plane.setLayoutParams(new FrameLayout.LayoutParams(1901, 1264));
        player.setLayoutParams(new FrameLayout.LayoutParams(1901, 1264));
        layout();

        pump();
        assertEquals("one sample is not stable", 0, stableReplans());
        pump();
        assertEquals("two equal samples are still not stable", 0, stableReplans());
        pump();
        assertEquals("the third equal sample re-plans exactly once", 1, stableReplans());

        int padding = text().getPaddingLeft() + text().getPaddingRight();
        int expectedInner = ((Math.round(1901 * .92f) - padding) / 8) * 8;
        awaitPlan(expectedInner);
        assertEquals("still one re-plan after the new plan lands", 1, stableReplans());
    }

    /** The number of stable-geometry re-plans recorded for this test's diagnostics. */
    private int stableReplans() {
        String history = CaptionDiagnostics.history(a);
        int count = 0, at = 0;
        while ((at = history.indexOf("CAPTION_STABLE_REPLAN", at)) >= 0) {
            count++;
            at += "CAPTION_STABLE_REPLAN".length();
        }
        return count;
    }

    @Test
    public void anUnplannedWideBoxIsFittedInsideTheVideoUntilTheReplanLands() throws Exception {
        show(
                "中国的整体军事现代化，比仅让四辆坦克驶过红场更令人印象深刻。"
                        + "没有标点也能显示完整意思，而且这句话足够长，需要分成好几页显示。"
                        + "每一页都应该是一个完整的分句，不会被从中间切开。",
                "fit:hold");
        awaitCaption();
        awaitPlan(innerWidth(2247));
        layout();
        float unplanned = text().getScaleX();
        int content = (int) (Integer) field("stableTextWidth", false);
        assertTrue("the long line must fill the class width: " + content, content > 1901);

        Layer.video = new Rect(0, 0, 1850, 1264);
        plane.setLayoutParams(new FrameLayout.LayoutParams(1850, 1264));
        player.setLayoutParams(new FrameLayout.LayoutParams(1850, 1264));
        layout();
        pump();

        assertEquals(
                "the box is still the class width while the plan is being prepared",
                2067,
                (int) (Integer) field("boxWidth", false));
        float fitted = text().getScaleX();
        assertEquals(
                "the draw-time fit is video width / content width",
                unplanned * 1850f / content,
                fitted,
                .01f);
        assertTrue("the fitted text is smaller, not clipped", fitted < unplanned);
    }

    @Test
    public void aRestoredWideVideoReturnsTheBoxToTheClassWidth() throws Exception {
        show("剧透一下：下一期我会分享一份指南。", "stable:restore");
        awaitCaption();
        awaitPlan(innerWidth(2247));
        layout();

        Layer.video = new Rect(0, 0, 1901, 1264);
        plane.setLayoutParams(new FrameLayout.LayoutParams(1901, 1264));
        player.setLayoutParams(new FrameLayout.LayoutParams(1901, 1264));
        layout();
        pump();
        pump();
        int padding = text().getPaddingLeft() + text().getPaddingRight();
        awaitPlan(((Math.round(1901 * .92f) - padding) / 8) * 8);
        layout();
        assertTrue((int) (Integer) field("boxWidth", false) < 2067);

        Layer.video = new Rect(0, 0, 2460, 1264);
        plane.setLayoutParams(new FrameLayout.LayoutParams(2460, 1264));
        player.setLayoutParams(new FrameLayout.LayoutParams(2460, 1264));
        layout();
        pump();
        pump();
        awaitPlan(innerWidth(2247));
        layout();

        assertEquals(
                "a wide video returns the established class width",
                2067,
                (int) (Integer) field("boxWidth", false));
        float center = anchor().getTranslationX() + anchor().getWidth() / 2f;
        assertEquals("the restored box is centered on the video", 2460 / 2f, center, 1f);
    }

    /** A 55.5 -> 44.5 step moves on frame times only: no first-frame jump, 180 ms monotone. */
    @Test
    public void aGlyphStepIsInterpolatedOnTheFrameClock() {
        CaptionOverlay.resetGlyphForTests();
        CaptionOverlay.noteGlyphTargetForTests(55.5f);
        assertEquals(55.5f, CaptionOverlay.displayedGlyphPx(), .001f);

        CaptionOverlay.noteGlyphTargetForTests(44.5f);
        long start = 1_000_000_000L;
        assertTrue(CaptionOverlay.advanceDisplayedGlyph(start));
        assertEquals(
                "the first frame of a step must not jump",
                55.5f,
                CaptionOverlay.displayedGlyphPx(),
                .001f);

        float previous = 55.5f;
        for (long t = start + 16_000_000L; t < start + 180_000_000L; t += 16_000_000L) {
            CaptionOverlay.advanceDisplayedGlyph(t);
            float now = CaptionOverlay.displayedGlyphPx();
            assertTrue("the painted size is monotone: " + previous + " -> " + now, now <= previous);
            assertTrue("the target is not overshot: " + now, now >= 44.5f);
            previous = now;
        }
        CaptionOverlay.advanceDisplayedGlyph(start + 180_000_000L);
        assertEquals(44.5f, CaptionOverlay.displayedGlyphPx(), .001f);
        assertFalse(
                "a completed step does not oscillate",
                CaptionOverlay.advanceDisplayedGlyph(start + 400_000_000L));
        assertEquals(44.5f, CaptionOverlay.displayedGlyphPx(), .001f);
    }

    /** The actual GLYPH_FRAME callback advances state and then updates the real view. */
    @Test
    public void glyphCallbackAdvancesAndAppliesThePaintedSizeM4a() throws Exception {
        show("剧透一下：下一期我会分享一份指南。", "glyph:callback:m4a");
        awaitCaption();
        settleGlyph();
        float initial = paintedGlyphHeight();
        Layer.globalWidth = 1850;
        Layer.globalHeight = 1050;
        float target = lawGlyphForGlobalWidth(1850);
        CaptionOverlay.applyCommentScale(a, text());
        Field field = CaptionOverlay.class.getDeclaredField("GLYPH_FRAME");
        field.setAccessible(true);
        android.view.Choreographer.FrameCallback callback =
                (android.view.Choreographer.FrameCallback) field.get(null);
        callback.doFrame(0);
        assertEquals("first callback paints the original value", initial, paintedGlyphHeight(), .01f);
        callback.doFrame(90_000_000L);
        assertEquals("callback applies the advanced value to the real TextView",
                (initial + target) / 2f, paintedGlyphHeight(), .01f);
        assertEquals(CaptionOverlay.displayedGlyphPx(), paintedGlyphHeight(), .01f);
    }

    /** Ends a pending 180 ms size step and applies its final scale to the view. */
    private void settleGlyph() throws Exception {
        CaptionOverlay.settleDisplayedGlyphForTests();
        CaptionOverlay.applyCommentScale(a, text());
    }

    private static float measuredGlyphHeight(TextView view) {
        return SubtitleStyleMetrics.measuredGlyphHeightPx(view.getPaint());
    }

    /** The size the user actually sees: the laid-out glyph height times the temporary scale. */
    private float paintedGlyphHeight() throws Exception {
        TextView view = text();
        return measuredGlyphHeight(view) * view.getScaleY();
    }

    /** The continuous law at the surface scale this test's shadow derives from globalWidth. */
    private static float lawGlyphForGlobalWidth(int globalWidth) {
        return CaptionOverlay.glyphHeightPxForVideo(
                2, 2736, 1264, 1264f * globalWidth / 2247f);
    }

    private static CaptionRenderSpec renderSpec() {
        return CaptionLanguageContext.explicit("en", "zh-Hans").renderSpec;
    }

    private static CaptionPresentationBudget slowBudget() {
        return new CaptionPresentationBudget(944, 40f, 48.68f, renderSpec());
    }

    // D5 contract probes use the actual Overlay methods and View fixture, not a duplicate model.
    private void d5Set(String name, Object value) throws Exception {
        boolean decisionField = name.equals("presentationClass") || name.equals("classBaseWidth")
                || name.equals("classFrameWidth") || name.equals("reducedVideoWidth")
                || name.equals("previousGeometryWidth") || name.equals("stableGeometrySamples");
        Object owner = null;
        Class<?> declaring = CaptionOverlay.class;
        if (decisionField) {
            Field decision = CaptionOverlay.class.getDeclaredField("presentationDecision");
            decision.setAccessible(true);
            owner = decision.get(null);
            declaring = CaptionPresentationDecision.class;
        }
        Field f = declaring.getDeclaredField(name);
        f.setAccessible(true);
        f.set(owner, value);
    }

    private Object d5Call(String name, Class<?>[] types, Object... values) throws Exception {
        Method m = CaptionOverlay.class.getDeclaredMethod(name, types);
        m.setAccessible(true);
        return m.invoke(null, values);
    }

    private boolean d5Classify(Rect video) throws Exception {
        return (Boolean) d5Call("updatePresentationClass", new Class<?>[] {Rect.class}, video);
    }

    private boolean d5Sample(int width, TextView view) throws Exception {
        return (Boolean) d5Call("replanForStableVideo",
                new Class<?>[] {Activity.class, TextView.class, Rect.class},
                a, view, new Rect(0, 0, width, 800));
    }

    private int d5PreviousSampleWidth() throws Exception {
        return (Integer) field("previousGeometryWidth", false);
    }

    @Test
    public void d5GeometryResetClassCommitAndSameOwnerReparentAreDistinct() throws Exception {
        show("边界测试字幕", "d5:reset:parent");
        awaitCaption();
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_MAXIMIZED");
        Rect reduced = new Rect(0, 0, 1478, 831);
        d5Classify(reduced);
        d5Classify(reduced);
        assertEquals(CaptionPresentationClass.Kind.REDUCED, field("presentationClass", false));
        assertEquals(1478, field("reducedVideoWidth", false));
        Object base = field("classBaseWidth", false), frame = field("classFrameWidth", false);
        d5Sample(1901, text());
        d5Sample(1901, text());
        assertEquals(2, field("stableGeometrySamples", false));
        d5Call("resetGeometry", new Class<?>[] {});
        assertEquals(0, d5PreviousSampleWidth());
        assertEquals(0, field("stableGeometrySamples", false));
        assertEquals(CaptionPresentationClass.Kind.REDUCED, field("presentationClass", false));
        assertEquals(base, field("classBaseWidth", false));
        assertEquals(frame, field("classFrameWidth", false));
        assertEquals(1478, field("reducedVideoWidth", false));
        assertEquals(0, field("boxWidth", false));

        d5Sample(1901, text());
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_FULLSCREEN");
        assertTrue(d5Classify(reduced));
        assertEquals(0, field("stableGeometrySamples", false));
        assertEquals(0, d5PreviousSampleWidth());
        assertEquals(0, field("reducedVideoWidth", false));
        assertEquals(2067, field("classFrameWidth", false));

        CaptionPlayerAuthority.onNotification("WATCH_WHILE_MAXIMIZED");
        d5Classify(reduced);
        d5Classify(reduced);
        assertEquals(1478, field("reducedVideoWidth", false));
        base = field("classBaseWidth", false);
        frame = field("classFrameWidth", false);
        d5Set("boxWidth", 1000);
        d5Sample(1901, text());
        d5Sample(1901, text());
        assertEquals(2, field("stableGeometrySamples", false));
        FrameLayout oldAnchor = anchor();
        assertTrue((Boolean) d5Call("attach", new Class<?>[] {Activity.class}, a));
        assertEquals("same host must not reset samples", 2, field("stableGeometrySamples", false));
        FrameLayout replacement = new FrameLayout(a);
        player.addView(replacement, new FrameLayout.LayoutParams(2247, 1264));
        Layer.host = replacement;
        layout();
        assertTrue((Boolean) d5Call("attach", new Class<?>[] {Activity.class}, a));
        assertSame(oldAnchor, anchor());
        assertSame(replacement, oldAnchor.getParent());
        assertEquals(0, d5PreviousSampleWidth());
        assertEquals(0, field("stableGeometrySamples", false));
        assertEquals(CaptionPresentationClass.Kind.REDUCED, field("presentationClass", false));
        assertEquals(base, field("classBaseWidth", false));
        assertEquals(frame, field("classFrameWidth", false));
        assertEquals(1478, field("reducedVideoWidth", false));
        assertEquals(1000, field("boxWidth", false));
        CaptionOverlay.setActivity(null);
        assertNull(field("presentationClass", false));
        assertEquals(0, field("classBaseWidth", false));
        assertEquals(0, field("classFrameWidth", false));
        assertEquals(0, field("reducedVideoWidth", false));
        assertEquals(0, field("stableGeometrySamples", false));
        System.out.println("D5_ORIGINAL_RESETS geometry=preserves_class_width_memory;commit=clears_samples_and_full_memory;same_parent=preserves_samples;reparent=only_samples;detach=all");
    }

    @Test
    public void d5StableGateAndShortsKeepTheirOriginalRoundingOrder() throws Exception {
        show("严格宽度门与短视频", "d5:stable:gate");
        awaitCaption();
        TextView view = text();
        d5Call("resetGeometry", new Class<?>[] {});
        d5Set("boxWidth", 1000);
        assertFalse(d5Sample(980, view));
        assertFalse(d5Sample(980, view));
        assertFalse("exactly two percent does not replan", d5Sample(980, view));
        assertFalse(d5Sample(979, view));
        assertFalse(d5Sample(979, view));
        assertTrue("strictly beyond two percent replans on sample three", d5Sample(979, view));
        int padding = view.getPaddingLeft() + view.getPaddingRight();
        int expected = Math.max(8, ((Math.round(979 * .92f) - padding) / 8) * 8) + padding;
        assertEquals(expected, field("classFrameWidth", false));
        assertEquals(0, field("stableGeometrySamples", false));

        d5Call("resetGeometry", new Class<?>[] {});
        d5Set("boxWidth", 1000);
        assertFalse(d5Sample(800, null));
        assertFalse(d5Sample(800, null));
        assertTrue("samples are recorded before the null TextView guard", d5Sample(800, view));

        Rect video = new Rect(0, 0, 1264, 711);
        assertTrue((Boolean) d5Call("commitPresentationClass",
                new Class<?>[] {Activity.class, CaptionPresentationClass.Kind.class, Rect.class,
                    int.class, int.class, boolean.class},
                a, CaptionPresentationClass.Kind.SHORTS_FULL, video, 1264, 2736, true));
        assertEquals(Math.round(1264 * .78f), field("classBaseWidth", false));
        d5Set("boxWidth", 1000);
        assertFalse(d5Sample(850, view));
        assertFalse(d5Sample(850, view));
        assertTrue(d5Sample(850, view));
        int shortsStable = Math.max(8, ((Math.round(850 * .92f) - padding) / 8) * 8) + padding;
        assertEquals("Shorts stable replan remains 92%, not its 78% class margin",
                shortsStable, field("classFrameWidth", false));
        System.out.println("D5_ORIGINAL_STABLE gate=2pct_strict;samples_before_null_guard;shorts_commit=.78;shorts_stable=.92;quantize=8_after_padding");
    }

    @Test
    public void d5SlidingPrefetchIsReadOnlyAndMatchesTheActualCommitWidth() throws Exception {
        show("不同模式的真实预取", "d5:prefetch:" + System.nanoTime());
        awaitCaption();
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_FULLSCREEN");
        Rect full = new Rect(0, 0, 2247, 1264);
        d5Classify(full);
        assertEquals(CaptionPresentationClass.Kind.FULL, field("presentationClass", false));
        d5Sample(1901, text());
        d5Sample(1901, text());
        Object frame = field("classFrameWidth", false), base = field("classBaseWidth", false);
        Object memory = field("reducedVideoWidth", false), samples = field("stableGeometrySamples", false);
        int sampleWidth = d5PreviousSampleWidth();
        java.util.concurrent.CountDownLatch prefetched = new java.util.concurrent.CountDownLatch(1);
        java.util.concurrent.atomic.AtomicReference<CaptionPresentationBudget> seen = new java.util.concurrent.atomic.AtomicReference<>();
        CaptionActions.install(
                new app.yydarlinker.caption.contracts.CaptionContracts.CaptionPort() {
                    public void command(app.yydarlinker.caption.contracts.CaptionContracts.Action action, String value) {}
                    public boolean active() { return false; }
                    public boolean ownsNativeTrack() { return false; }
                    public String restoreTarget(String u) { return u; }
                    public String videoId() { return "fixture"; }
                    public void playback(long t) {}
                },
                new CaptionActions.SettingsServices() {
                    public String testApi() { return "fixture"; }
                    public List<String> models(String endpoint) { return Collections.emptyList(); }
                    public List<CaptionDisplayPage> displayPages(String body, long start, long end,
                            CaptionPresentationBudget budget, CaptionRenderSpec spec) {
                        if (Thread.currentThread().getName().equals("CaptionPrefetch")) {
                            seen.set(budget);
                            prefetched.countDown();
                        }
                        return TranslationPresentation.pages(body, start, end, budget, spec);
                    }
                });
        CaptionOverlay.setPlayerType("WATCH_WHILE_SLIDING_MINIMIZED_MAXIMIZED");
        assertTrue("real prefetch was dispatched", prefetched.await(5, TimeUnit.SECONDS));
        assertNotNull(seen.get());
        assertFalse("sliding keeps the currently committed class", d5Classify(new Rect(0, 0, 1478, 831)));
        assertEquals(CaptionPresentationClass.Kind.FULL, field("presentationClass", false));
        assertEquals(frame, field("classFrameWidth", false));
        assertEquals(base, field("classBaseWidth", false));
        assertEquals(memory, field("reducedVideoWidth", false));
        assertEquals(samples, field("stableGeometrySamples", false));
        assertEquals(sampleWidth, d5PreviousSampleWidth());
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_MAXIMIZED");
        assertTrue(d5Classify(full));
        int padding = text().getPaddingLeft() + text().getPaddingRight();
        assertEquals("prefetch and commit use the same full box width", seen.get().width + padding,
                field("classFrameWidth", false));
        assertEquals(1364, field("classFrameWidth", false));
        System.out.println("D5_ORIGINAL_PREFETCH sliding_current=FULL;target=REDUCED;prefetch_read_only=true;box=1364");
    }
}
