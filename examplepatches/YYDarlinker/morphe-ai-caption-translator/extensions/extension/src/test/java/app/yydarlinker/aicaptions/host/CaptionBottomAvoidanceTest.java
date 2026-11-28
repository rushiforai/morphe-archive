package app.yydarlinker.aicaptions.host;

import static app.morphe.extension.youtube.shared.PlayerType.NONE;
import static app.morphe.extension.youtube.shared.PlayerType.WATCH_WHILE_FULLSCREEN;
import static app.yydarlinker.aicaptions.host.CaptionBottomAvoidanceTest.Visibility.*;
import static org.junit.Assert.*;

import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Looper;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.TextureView;
import android.view.View;
import android.view.ViewStub;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.Space;
import android.widget.TextView;
import app.yydarlinker.aicaptions.overlay.CaptionOverlay;
import app.yydarlinker.aicaptions.settings.AiCaptionConfig;
import java.time.Duration;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.*;
import org.robolectric.shadows.ShadowChoreographer;
import org.robolectric.shadows.ShadowSystemClock;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, qualifiers = "w1264dp-h2736dp", shadows = {CaptionBottomAvoidanceTest.Ids.class, YouTubeHostFixture.Flags.class,
        YouTubeHostFixture.Model.class, YouTubeHostFixture.Credentials.class, YouTubeHostFixture.Menus.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@LooperMode(LooperMode.Mode.PAUSED)
public class CaptionBottomAvoidanceTest extends YouTubeHostFixture {
    enum Visibility {
        PLAYER_CONTROLS_VISIBILITY_HIDDEN, PLAYER_CONTROLS_VISIBILITY_WILL_SHOW,
        PLAYER_CONTROLS_VISIBILITY_SHOWN, PLAYER_CONTROLS_VISIBILITY_WILL_HIDE
    }

    private static final int WIDTH = 760, HEIGHT = 1000;
    private static final float POSITION = .84f;
    private static final List<String> NAMES = List.of("watch_player", "player_overlays_custom_views_container",
            "time_bar", "youtube_controls_bottom_ui_container", "reel_player_overlay_root",
            "reel_progress_bar", "reel_time_bar", "reel_player_page_container", "time_bar_reference_view",
            "large_controls_time_bar", "watch_while_time_bar_view", "watch_while_time_bar_view_overlay",
            "player_seekbar", "big_boards_timestamp_container", "timestamp", "chapter_title",
            "time_bar_timeline_title", "fullscreen_button", "controls_button_group_layout",
            "player_control_play_pause_replay_button", "top_bar_background", "scrim_overlay");

    @Implements(Resources.class)
    public static class Ids {
        @Implementation protected int getIdentifier(String name, String type, String pkg) {
            return type.equals("id") && NAMES.contains(name) ? id(name) : 0;
        }
    }

    private static int id(String name) { return 0x7f0b0001 + NAMES.indexOf(name); }

    private final class Player extends FrameLayout {
        int walks;
        Player(String name) {
            super(activity);
            setId(id(name));
        }
        @Override public int getChildCount() {
            walks++;
            return super.getChildCount();
        }
    }

    private Player player;
    private FrameLayout controls;
    private TextureView video;
    private View bar;
    private float baseTop, baseBottom;

    private void addPlayer(boolean shorts, int width, int height) {
        player = new Player(shorts ? "reel_player_overlay_root" : "watch_player");
        ((FrameLayout) activity.findViewById(android.R.id.content)).addView(player, params(width, height, 0, 0));
        video = new TextureView(activity);
        player.addView(video, params(width, height, 0, 0));
        if (!shorts) {
            FrameLayout layer = new FrameLayout(activity);
            layer.setId(id("player_overlays_custom_views_container"));
            player.addView(layer, params(width, height, 0, 0));
        }
        controls = new FrameLayout(activity);
        controls.setId(id("youtube_controls_bottom_ui_container"));
        player.addView(controls, params(width, height, 0, 0));
        bar = new View(activity);
        bar.setId(id(shorts ? "reel_progress_bar" : "time_bar"));
        bar.setBackgroundColor(Color.WHITE);
        bar.setVisibility(View.INVISIBLE);
        controls.addView(bar, params(width, 40, 0, 0));
        frames();
    }

    private static FrameLayout.LayoutParams params(int width, int height, int left, int top) {
        FrameLayout.LayoutParams p = new FrameLayout.LayoutParams(width, height);
        p.leftMargin = left;
        p.topMargin = top;
        return p;
    }

    private void open(boolean shorts) {
        open(shorts, false, false);
    }

    private void open(boolean shorts, boolean landscape, boolean twoLines) {
        addPlayer(shorts, landscape ? HEIGHT : WIDTH, landscape ? WIDTH : HEIGHT);
        AiCaptionConfig.saveCaptionPosition(activity, false, POSITION);
        AiCaptionConfig.saveShortsPosition(activity, POSITION);
        longShortsCue = twoLines;
        install(true);
        if (shorts) {
            shorts(true, true);
            video(FIRST);
        } else {
            regular(FIRST);
            if (landscape) {
                activity.getResources().getConfiguration().orientation = Configuration.ORIENTATION_LANDSCAPE;
                type(WATCH_WHILE_FULLSCREEN);
            }
        }
        commit(new Manager(FIRST), source(FIRST, "en"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(twoLines ? "这是一整行需要完整显示" : ORIGINAL);
        idle(220);
        frames();
        baseTop = anchor().getY();
        baseBottom = paintedBottom();
        bar.setLayoutParams(params(controls.getWidth(), 40, 0, Math.round(baseBottom) - 14));
        frames();
    }

    private float paintedBottom() {
        return anchor().getY() + caption().getHeight() * (1 + caption().getScaleY()) / 2f;
    }
    private float shift() { return baseTop - anchor().getY(); }
    private int gap() { return Math.round((video.getWidth() > video.getHeight() ? 8 : 4)
                * activity.getResources().getDisplayMetrics().density); }
    private float target() { return baseBottom - bar.getTop() + gap(); }
    private void sample() { player.getViewTreeObserver().dispatchOnPreDraw(); }
    private void visibility(Visibility state) {
        AiCaptionHook.onPlayerControlsVisibility(state);
        sample();
    }

    private void appear() {
        bar.setVisibility(View.VISIBLE);
        visibility(PLAYER_CONTROLS_VISIBILITY_WILL_SHOW);
    }
    private void assertUnregistered(Player oldPlayer) {
        oldPlayer.walks = 0;
        activity.getWindow().getDecorView().getViewTreeObserver().dispatchOnGlobalLayout();
        assertEquals(0, oldPlayer.walks);
    }

    private static void controlVsync() {
        ShadowChoreographer.setPaused(true);
        ShadowChoreographer.setFrameDelay(Duration.ofMillis(16));
    }

    private static void tick(int frames) {
        for (int i = 0; i < frames; i++) {
            ShadowSystemClock.advanceBy(Duration.ofMillis(16));
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
    }

    @Test public void fullscreenOneLineUsesTheFullEightDpClearanceOver160ms() {
        open(false, true, false);
        assertEquals(1, caption().getLineCount());
        assertEquals(.8f, AiCaptionConfig.captionPositionY(activity, true), 0);
        controlVsync();
        appear();
        assertEquals(0, shift(), 1);
        tick(4);
        assertTrue(shift() > 0 && shift() < target());
        tick(7);
        assertEquals(target(), shift(), 1);
        assertEquals(gap(), bar.getTop() - paintedBottom(), 1);
        assertFalse(anchor().isLayoutRequested());
    }

    @Test public void willHideStopsSamplingAndReturnsEvenWhenControlsStillDraw() {
        open(false);
        controlVsync();
        appear();
        tick(11);
        float raised = shift();
        assertTrue(raised > 0);
        visibility(PLAYER_CONTROLS_VISIBILITY_WILL_HIDE);
        assertUnregistered(player);
        assertEquals(View.VISIBLE, bar.getVisibility());
        assertEquals(raised, shift(), 1);
        tick(4);
        assertTrue("mid-fade shift " + shift() + " from " + raised, shift() > 0 && shift() < raised);
        tick(7);
        assertEquals(0, shift(), 1);
    }

    @Test public void parentAlphaUsesHysteresisAndSettlesAtFullClearance() {
        open(false);
        controlVsync();
        controls.setAlpha(.5f);
        bar.setAlpha(.14f);
        appear();
        tick(11);
        assertEquals(0, shift(), 1);
        bar.setAlpha(.16f);
        sample();
        tick(11);
        assertEquals(target(), shift(), 1);
        controls.setAlpha(.6f);
        bar.setAlpha(1);
        sample();
        tick(11);
        assertEquals(target(), shift(), 1);
        controls.setAlpha(.05f);
        sample();
        tick(11);
        assertEquals(target(), shift(), 1);
        controls.setAlpha(.02f);
        sample();
        tick(11);
        assertEquals(0, shift(), 0);
        controls.setAlpha(.05f);
        sample();
        tick(11);
        assertEquals(0, shift(), 0);
        controls.setAlpha(1);
        View content = activity.findViewById(android.R.id.content);
        content.setAlpha(.05f);
        sample();
        tick(11);
        assertEquals(0, shift(), 0);
        content.setAlpha(1);
        sample();
        tick(11);
        assertEquals(target(), shift(), 1);
    }

    @Test public void scrimPlaceholderClippedAndOldPlayerViewsDoNotMoveTheCaption() {
        open(false);
        bar.setLayoutParams(params(WIDTH, 480, 0, bar.getTop()));
        bar.setVisibility(View.VISIBLE);
        View placeholder = new Space(activity);
        placeholder.setBackgroundColor(Color.WHITE);
        placeholder.setId(id("time_bar"));
        controls.addView(placeholder, params(WIDTH, 30, 0, Math.round(baseBottom) - 10));
        ViewStub stub = new ViewStub(activity);
        stub.setId(id("player_seekbar"));
        controls.addView(stub, params(WIDTH, 30, 0, Math.round(baseBottom) - 10));
        View scrim = new View(activity);
        scrim.setId(id("scrim_overlay"));
        scrim.setBackgroundColor(Color.WHITE);
        controls.addView(scrim, params(WIDTH, 40, 0, Math.round(baseBottom) - 10));
        View clipped = new View(activity);
        clipped.setId(id("time_bar"));
        clipped.setBackgroundColor(Color.WHITE);
        controls.addView(clipped, params(WIDTH, 30, 0, HEIGHT + 10));
        FrameLayout old = new FrameLayout(activity);
        old.setId(id("watch_player"));
        View oldBar = new View(activity);
        oldBar.setId(id("time_bar"));
        oldBar.setBackgroundColor(Color.WHITE);
        old.addView(oldBar, params(WIDTH, 30, 0, Math.round(baseBottom) - 10));
        player.addView(old, params(WIDTH, HEIGHT, 0, 0));
        frames();
        visibility(PLAYER_CONTROLS_VISIBILITY_SHOWN);
        player.getViewTreeObserver().dispatchOnGlobalLayout();
        sample();
        idle(180);
        assertEquals(0, shift(), 0);
    }

    @Test public void portraitUsesFourDpEvenWhenTheControlMissesTheCaptionHorizontally() {
        open(false);
        bar.setLayoutParams(params(20, 40, 0, bar.getTop()));
        appear();
        frames();
        idle(180);
        assertEquals(target(), shift(), 1);
        assertEquals(gap(), bar.getTop() - paintedBottom(), 1);
    }

    @Test public void shiftingToAHigherBandStartsFromTheCurrentPaintedPosition() {
        open(false);
        controlVsync();
        appear();
        tick(11);
        float initial = shift();
        assertEquals(target(), initial, 1);
        int higher = bar.getTop() - 60;
        addTimestamp("time_bar_timeline_title", controls, higher);
        frames();
        assertEquals(initial, shift(), 1);
        tick(4);
        assertTrue(shift() > initial && shift() < initial + 60);
        tick(7);
        assertEquals(gap(), higher - paintedBottom(), 1);
    }

    @Test public void highCaptionAboveTheBandStaysAtItsBaseline() {
        open(false);
        AiCaptionConfig.saveCaptionPosition(activity, false, .25f);
        frames();
        float high = anchor().getY();
        appear();
        idle(180);
        assertEquals(high, anchor().getY(), 0);
        assertTrue(paintedBottom() <= bar.getTop());
    }

    @Test public void fullscreenTwoLinesClearTimestampAndProgressAtTheDefaultPosition() {
        open(false, true, true);
        assertEquals(2, caption().getLineCount());
        assertEquals(.8f, AiCaptionConfig.captionPositionY(activity, true), 0);
        int band = Math.round(baseBottom) - 28;
        addTimestamp("time_bar_current_time", controls, band);
        appear();
        frames();
        idle(180);
        assertEquals(gap(), band - paintedBottom(), 1);
        assertTrue(bar.getTop() > paintedBottom());
    }

    @Test public void fullscreenBottomDragClearsTheHighestOfAllControlRows() {
        open(false, true, false);
        touch(MotionEvent.ACTION_DOWN, 20);
        idle(360);
        touch(MotionEvent.ACTION_MOVE, 2000);
        touch(MotionEvent.ACTION_UP, 2000);
        frames();
        idle(180);
        float saved = AiCaptionConfig.captionPositionY(activity, true);
        assertTrue(saved > .92f);
        assertAtBottom();

        FrameLayout wrapper = new FrameLayout(activity);
        wrapper.setId(id("watch_while_time_bar_view_overlay"));
        controls.addView(wrapper, params(-1, -1, 0, 0));
        FrameLayout nested = new FrameLayout(activity);
        nested.setId(id("large_controls_time_bar"));
        wrapper.addView(nested, params(-1, -1, 0, 0));
        int band = video.getHeight() - 145;
        View innerBar = new FrameLayout(activity) {
            @Override protected void onDraw(Canvas canvas) {
                canvas.drawColor(Color.WHITE);
            }
        };
        innerBar.setWillNotDraw(false);
        nested.addView(innerBar, params(220, 5, 0, band));
        FrameLayout timestamps = new FrameLayout(activity);
        timestamps.setId(id("big_boards_timestamp_container"));
        controls.addView(timestamps, params(-1, -1, 0, 0));
        addTimestamp("timestamp", timestamps, band + 25);
        addTimestamp("chapter_title", timestamps, band + 36);
        ImageView fullscreen = new ImageView(activity);
        fullscreen.setId(id("fullscreen_button"));
        fullscreen.setImageDrawable(new ColorDrawable(Color.WHITE));
        int inset = Math.round(22 * activity.getResources().getDisplayMetrics().density);
        fullscreen.setPadding(0, inset, 0, inset);
        controls.addView(fullscreen, params(44, inset * 2 + 12, 0, band - inset + 2));
        bar.setLayoutParams(params(180, 12, 0, band + 52));
        appear();
        frames();
        idle(180);
        assertEquals(gap(), band - paintedBottom(), 1);
        assertEquals(saved, AiCaptionConfig.captionPositionY(activity, true), 0);
    }

    @Test public void topAndCentralControlsNeverBecomeObstacles() {
        open(false);
        addTimestamp("top_bar_background", controls, HEIGHT / 2 + 10);
        FrameLayout center = new FrameLayout(activity);
        center.setId(id("controls_button_group_layout"));
        controls.addView(center, params(-1, -1, 0, 0));
        addTimestamp("time_bar_timeline_title", center, HEIGHT / 2 + 20);
        addTimestamp("player_control_play_pause_replay_button", controls, HEIGHT / 2 + 30);
        visibility(PLAYER_CONTROLS_VISIBILITY_SHOWN);
        frames();
        idle(180);
        assertEquals(0, shift(), 0);
    }

    private void addTimestamp(String name, FrameLayout parent, int top) {
        TextView timestamp = new TextView(activity);
        timestamp.setId(id(name));
        timestamp.setText("0:30");
        parent.addView(timestamp, params(80, 24, 0, top));
    }

    @Test public void bottomBandCannotLiftTheBoxThroughTheSafeTop() {
        open(false);
        int height = Math.max(55, caption().getHeight() + 9);
        video.setLayoutParams(params(WIDTH, height, 0, 100));
        AiCaptionConfig.saveCaptionPosition(activity, true, .5f);
        bar.setLayoutParams(params(WIDTH, 18, 0, 100 + (height + 1) / 2));
        frames();
        idle(220);
        frames();
        float topBefore = 2 * anchor().getY() + anchor().getHeight() - paintedBottom();
        appear();
        idle(180);
        float topAfter = 2 * anchor().getY() + anchor().getHeight() - paintedBottom();
        assertTrue(topBefore > topAfter);
        assertEquals(100, topAfter, 1);
    }

    @Test public void dragTakesOverAtThePaintedPositionAndSavesTheFinalVisualCenter() {
        open(false);
        appear();
        idle(180);
        float raised = anchor().getY();
        float previousShift = baseTop - raised;
        int videoHeight = CaptionSurface.currentVideoBounds((View) anchor().getParent()).height();
        touch(MotionEvent.ACTION_DOWN, 20);
        idle(360);
        assertEquals(raised, anchor().getY(), 0);
        assertUnregistered(player);
        visibility(PLAYER_CONTROLS_VISIBILITY_HIDDEN);
        touch(MotionEvent.ACTION_MOVE, -80);
        assertEquals(raised - 100, anchor().getY(), 1);
        assertEquals(POSITION, AiCaptionConfig.captionPositionY(activity, false), 0);
        touch(MotionEvent.ACTION_UP, -80);
        frames();
        idle(180);
        assertEquals(POSITION - (100 + previousShift) / videoHeight,
                AiCaptionConfig.captionPositionY(activity, false), .001f);
        assertEquals(raised - 100, anchor().getY(), 1);
    }

    @Test public void hiddenGateSkipsVisibleOpaqueNativeOverlayAndFullscreenButton() {
        open(false);
        bar.setId(id("watch_while_time_bar_view_overlay"));
        bar.setVisibility(View.VISIBLE);
        ImageView fullscreen = new ImageView(activity);
        fullscreen.setId(id("fullscreen_button"));
        fullscreen.setImageDrawable(new ColorDrawable(Color.WHITE));
        controls.addView(fullscreen, params(40, 40, 0, bar.getTop() - 12));
        frames();
        visibility(PLAYER_CONTROLS_VISIBILITY_HIDDEN);
        idle(180);
        assertEquals(0, shift(), 0);
        assertUnregistered(player);
        AiCaptionHook.enabled(false);
        visibility(PLAYER_CONTROLS_VISIBILITY_SHOWN);
        AiCaptionHook.enabled(true);
        frames();
        idle(180);
        assertEquals(0, shift(), 0);
        assertUnregistered(player);
    }

    @Test public void twoLineCaptionStaysAtTheBottomAfterCancelAndDeferredClear() {
        open(false, true, true);
        assertEquals(2, caption().getLineCount());
        touch(MotionEvent.ACTION_DOWN, 20);
        idle(360);
        String displayed = caption().getText().toString();
        CaptionOverlay.hide(() -> true);
        assertTrue(anchor().isShown());
        assertEquals(displayed, caption().getText().toString());
        touch(MotionEvent.ACTION_MOVE, 2000);
        assertAtBottom();
        float movedTop = anchor().getY();
        touch(MotionEvent.ACTION_CANCEL, 2000);
        assertFalse(anchor().isShown());
        assertEquals(movedTop, anchor().getY(), 1);
        float saved = AiCaptionConfig.captionPositionY(activity, true);
        assertEquals((movedTop + anchor().getHeight() / 2f) / video.getHeight(), saved, .001f);
        CaptionOverlay.showStatus(displayed, () -> true);
        frames();
        assertTrue(anchor().isShown());
        assertAtBottom();
    }

    @Test public void shownControlsRaiseTheJustSavedBottomPositionAndHideReturnsToIt() {
        open(false, true, false);
        int band = video.getHeight() - 92;
        bar.setLayoutParams(params(video.getWidth(), 14, 0, band + 30));
        addTimestamp("time_bar_timeline_title", controls, band);
        appear();
        visibility(PLAYER_CONTROLS_VISIBILITY_SHOWN);
        frames();
        idle(180);
        touch(MotionEvent.ACTION_DOWN, 20);
        idle(360);
        touch(MotionEvent.ACTION_MOVE, 2000);
        assertAtBottom();
        float dropped = anchor().getY();
        controlVsync();
        touch(MotionEvent.ACTION_UP, 2000);
        sample();
        float saved = AiCaptionConfig.captionPositionY(activity, true);
        assertEquals((dropped + anchor().getHeight() / 2f) / video.getHeight(), saved, .001f);
        assertEquals(dropped, anchor().getY(), 0);
        tick(4);
        assertTrue(anchor().getY() < dropped && paintedBottom() > band - gap());
        tick(7);
        assertEquals(gap(), band - paintedBottom(), 1);
        visibility(PLAYER_CONTROLS_VISIBILITY_HIDDEN);
        tick(4);
        assertTrue(anchor().getY() < dropped);
        tick(7);
        assertEquals(dropped, anchor().getY(), 1);
        assertAtBottom();
        assertEquals(saved, AiCaptionConfig.captionPositionY(activity, true), 0);
    }

    private void assertAtBottom() {
        int edge = Math.round(4 * activity.getResources().getDisplayMetrics().density);
        assertEquals(edge, video.getHeight() - paintedBottom(), 1);
    }

    private void touch(int action, float y) {
        long now = SystemClock.uptimeMillis();
        MotionEvent event = MotionEvent.obtain(now, now, action, 20, y, 0);
        try { assertTrue(caption().dispatchTouchEvent(event)); }
        finally { event.recycle(); }
    }

    @Test public void fullscreenRemountUnregistersAndIgnoresTheRetiredPlayer() {
        open(false);
        appear();
        idle(180);
        assertTrue(shift() > 0);
        Player old = player;
        FrameLayout box = anchor();
        type(WATCH_WHILE_FULLSCREEN);
        assertEquals(baseTop, box.getY(), 0);
        assertUnregistered(old);
        ((FrameLayout) old.getParent()).removeView(old);
        addPlayer(false, HEIGHT, WIDTH);
        CaptionOverlay.refreshSurface();
        frames();
        assertSame(box, anchor());
        assertTrue(anchor().isShown());
        assertUnregistered(old);
    }

    @Test public void enteringShortsClearsTheRegularControlsObservationAndShift() {
        open(false);
        appear();
        idle(180);
        assertTrue(shift() > 0);
        Player old = player;
        FrameLayout box = anchor();
        shorts(true, true);
        assertEquals(baseTop, box.getY(), 1);
        ((FrameLayout) old.getParent()).removeView(old);
        addPlayer(true, WIDTH, HEIGHT);
        video(SECOND);
        type(NONE);
        commit(new Manager(SECOND), source(SECOND, "en"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(ORIGINAL);
        assertTrue(CaptionSurface.isShorts());
        assertUnregistered(old);
        assertNull(CaptionSurface.bottomControlsHost());
    }

    @Test public void shortsCommentsKeepTheirViewportAndTheSameCaption() {
        open(true);
        appear();
        idle(180);
        assertEquals(0, shift(), 0);
        assertNull(CaptionSurface.bottomControlsHost());
        assertUnregistered(player);
        View text = caption();
        float scale = text.getScaleY();
        video.setLayoutParams(params(WIDTH, 560, 0, 0));
        frames();
        idle(180);
        assertSame(text, caption());
        assertTrue(shows(ORIGINAL));
        assertTrue(paintedBottom() < 560);
        assertEquals(scale, text.getScaleY(), .002f);
    }

    @Test public void shortsGlyphTransitionIgnoresTheProgressBar() {
        open(true);
        controlVsync();
        float initialScale = caption().getScaleY();
        var metrics = activity.getResources().getDisplayMetrics();
        int original = metrics.widthPixels;
        metrics.widthPixels = Math.round(Math.min(original, metrics.heightPixels) * .85f);
        try {
            appear();
            assertEquals(initialScale, caption().getScaleY(), .002f);
            tick(5);
            assertEquals(0, shift(), 0);
            assertTrue(caption().getScaleY() < initialScale);
            assertTrue("glyph " + caption().getScaleY() + " from " + initialScale,
                    caption().getScaleY() > initialScale * .85f);
            tick(8);
            assertEquals(initialScale * .85f, caption().getScaleY(), .005f);
            assertEquals(0, shift(), 0);
        } finally {
            metrics.widthPixels = original;
        }
    }
}
