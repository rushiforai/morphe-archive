/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.seekbar;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.SeekBar;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.TimeUnit;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.PausedProcess;
import app.morphe.extension.pinedrama.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;

/**
 * Seek bar on sound previews (#185): the line goes into the sound page's cover, hidden, shows the
 * time played and the preview's length only while the preview plays with a known length, seeks only
 * the preview it showed while that preview plays, and leaves on off, on pause, when the cover is
 * built again and when the page goes. A stream that doesn't move when asked keeps PineDrama's own
 * controls.
 */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
@LooperMode(LooperMode.Mode.PAUSED)
public class SoundSeekbarTest {
    private static final int SCREEN = 1080;
    private static final int PICTURE = 600;

    private Context context;
    private final Object assem = new Object();
    private FakePreview preview;
    private FrameLayout page;
    private FrameLayout cover;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        reset();
        preview = new FakePreview();
        SoundSeekbar.previewForTests = preview;
    }

    @After
    public void tearDown() {
        reset();
    }

    private static void reset() {
        Settings.SOUND_SEEKBAR.save(false);
        PausedProcess.set(false);
        SoundSeekbar.reset();
        SoundSeekbar.previewForTests = null;
        HookStatus.clear();
    }

    /** The page's preview player as the bridges reach it: one view model for the cover. */
    static final class FakePreview implements SoundSeekbar.Preview {
        final Object model = new Object();
        boolean playing;
        int position;
        int duration;
        int limit;
        String sound;
        final List<Integer> seeks = new ArrayList<>();
        int asked;
        /** Calls to position or length, which set the player up when it isn't yet. */
        int measured;

        @Override
        public Object viewModel(Object owner) {
            return model;
        }

        @Override
        public boolean playing(Object model) {
            asked++;
            return playing;
        }

        @Override
        public int position(Object model) {
            measured++;
            return position;
        }

        @Override
        public int duration(Object model) {
            measured++;
            return duration;
        }

        @Override
        public int limit(Object model) {
            return limit;
        }

        @Override
        public String sound(Object model) {
            return sound;
        }

        @Override
        public void seek(Object model, int ms) {
            seeks.add(ms);
        }

        void plays(String id, int at, int length, int auditionEnd) {
            playing = true;
            sound = id;
            position = at;
            duration = length;
            limit = auditionEnd;
        }
    }

    /**
     * The sound page as PineDrama lays it out: the cover sizes itself to its picture, with a play
     * icon in its middle, and sits in a page as wide as the screen.
     */
    private void buildCover() {
        page = new FrameLayout(context);
        cover = new FrameLayout(context);
        View picture = new View(context);
        cover.addView(picture, new FrameLayout.LayoutParams(PICTURE, PICTURE));
        View icon = new View(context);
        cover.addView(icon, new FrameLayout.LayoutParams(72, 72, Gravity.CENTER));
        page.addView(cover, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    private SoundSeekbarView line() {
        return line(cover);
    }

    private static SoundSeekbarView line(ViewGroup group) {
        SoundSeekbarView found = null;
        for (int i = 0; i < group.getChildCount(); i++) {
            if (group.getChildAt(i) instanceof SoundSeekbarView) {
                assertNull("two lines in one cover", found);
                found = (SoundSeekbarView) group.getChildAt(i);
            }
        }
        return found;
    }

    private void layOut() {
        page.measure(View.MeasureSpec.makeMeasureSpec(SCREEN, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(SCREEN, View.MeasureSpec.EXACTLY));
        page.layout(0, 0, SCREEN, SCREEN);
    }

    /** A sound page with its line, the preview of m1 played 12 seconds into its 30. */
    private SoundSeekbarView playing() {
        Settings.SOUND_SEEKBAR.save(true);
        buildCover();
        SoundSeekbar.onCoverView(assem, cover);
        preview.plays("m1", 12_000, 60_000, 30_000);
        SoundSeekbarView line = line();
        assertNotNull(line);
        line.refresh(SystemClock.uptimeMillis());
        layOut();
        assertEquals(View.VISIBLE, line.getVisibility());
        return line;
    }

    private Activity inAWindow() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        activity.setContentView(page);
        return activity;
    }

    private static void idleFor(long ms) {
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(ms, TimeUnit.MILLISECONDS);
    }

    private boolean touch(int action, float x, float y) {
        long now = SystemClock.uptimeMillis();
        MotionEvent event = MotionEvent.obtain(now, now, action, x, y, 0);
        try {
            return page.dispatchTouchEvent(event);
        } finally {
            event.recycle();
        }
    }

    /** The x on screen that is this fraction along the line. */
    private static float along(SoundSeekbarView line, float fraction) {
        float inset = 8f * line.getResources().getDisplayMetrics().density;
        return line.getLeft() + inset + (line.getWidth() - 2f * inset) * fraction;
    }

    private static float onTheLine(SoundSeekbarView line) {
        return line.getTop() + line.getHeight() / 2f;
    }

    private static boolean reported(String family) {
        for (String line : HookStatus.report()) {
            if (line.contains(family)) return true;
        }
        return false;
    }

    @Test
    public void offTheCoverIsLeftAsTikTokBuiltIt() {
        buildCover();
        SoundSeekbar.onCoverView(assem, cover);

        assertEquals(2, cover.getChildCount());
        assertNull(SoundSeekbar.coverFor(assem));
        assertFalse(reported(SoundSeekbar.FAMILY));
    }

    @Test
    public void theLineGoesInHiddenAndShowsOnlyWhileThePreviewPlays() {
        Settings.SOUND_SEEKBAR.save(true);
        buildCover();
        SoundSeekbar.onCoverView(assem, cover);

        SoundSeekbarView line = line();
        assertNotNull(line);
        assertEquals(cover.getChildCount() - 1, cover.indexOfChild(line));
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) line.getLayoutParams();
        assertEquals(Gravity.BOTTOM, params.gravity);
        assertEquals(ViewGroup.LayoutParams.MATCH_PARENT, params.width);
        assertEquals(line.stripHeight(), params.height);
        assertEquals(View.GONE, line.getVisibility());
        assertTrue(reported(SoundSeekbar.FAMILY));
        assertTrue(HookStatus.missing(SoundSeekbar.FAMILY).isEmpty());

        // Nothing started yet, then a sound that's stopped: no line, and the player isn't asked
        // for a position or a length, which it would set itself up to answer.
        line.refresh(SystemClock.uptimeMillis());
        assertEquals(View.GONE, line.getVisibility());
        preview.sound = "m1";
        line.refresh(SystemClock.uptimeMillis());
        assertEquals(View.GONE, line.getVisibility());
        assertEquals(0, preview.measured);

        preview.plays("m1", 12_000, 60_000, 30_000);
        line.refresh(SystemClock.uptimeMillis());
        assertEquals(View.VISIBLE, line.getVisibility());
        assertEquals("m1", line.sound());
        assertEquals(30_000L, line.totalMs());
        assertEquals(12_000L, line.positionMs());
        assertEquals("0:12 / 0:30", line.label(12_000f / 30_000f));

        preview.playing = false;
        line.refresh(SystemClock.uptimeMillis());
        assertEquals(View.GONE, line.getVisibility());
    }

    @Test
    public void thePreviewsLengthIsWhereTikTokEndsItOrTheStreamIfShorter() {
        SoundSeekbarView line = playing();
        assertEquals(30_000L, line.totalMs());

        preview.limit = 0;
        line.refresh(SystemClock.uptimeMillis());
        assertEquals(60_000L, line.totalMs());

        preview.limit = 90_000;
        preview.position = 75_000;
        line.refresh(SystemClock.uptimeMillis());
        assertEquals(60_000L, line.totalMs());
        assertEquals(60_000L, line.positionMs());
    }

    @Test
    public void anUnknownLengthKeepsTikToksOwnControls() {
        Settings.SOUND_SEEKBAR.save(true);
        buildCover();
        SoundSeekbar.onCoverView(assem, cover);
        SoundSeekbarView line = line();

        preview.plays("m1", 2_000, 0, 30_000);
        line.refresh(SystemClock.uptimeMillis());
        assertEquals(View.GONE, line.getVisibility());
        preview.duration = -1;
        line.refresh(SystemClock.uptimeMillis());
        assertEquals(View.GONE, line.getVisibility());
        assertFalse(line.seekToMs(5_000L, "m1", SystemClock.uptimeMillis()));

        layOut();
        assertFalse(touch(MotionEvent.ACTION_DOWN, PICTURE / 2f, PICTURE - 10f));
        assertTrue(preview.seeks.isEmpty());
    }

    @Test
    public void aSeekLandsInsideThePreviewAndShowsTheNewSpot() {
        SoundSeekbarView line = playing();
        long now = SystemClock.uptimeMillis();

        assertTrue(line.seekToMs(20_000L, "m1", now));
        assertEquals(Collections.singletonList(20_000), preview.seeks);
        assertEquals(20_000L, line.shownMs());

        // Past the end stops a second short of it, so the preview isn't ended by the seek.
        assertTrue(line.seekToMs(45_000L, "m1", now));
        assertEquals(29_000, (int) preview.seeks.get(1));
        assertTrue(line.seekToMs(-4_000L, "m1", now));
        assertEquals(0, (int) preview.seeks.get(2));

        assertEquals(0L, SoundSeekbar.seekTarget(700L, 800L));
        assertEquals(9_000L, SoundSeekbar.seekTarget(12_000L, 10_000L));

        // The spot is held until the player reports near it.
        preview.position = 12_250;
        line.refresh(now + 250L);
        assertEquals(0L, line.shownMs());
        preview.position = 900;
        line.refresh(now + 500L);
        assertEquals(900L, line.shownMs());
    }

    @Test
    public void aSeekIsRefusedOnceThePreviewStopsOrMovesToAnotherSound() {
        SoundSeekbarView line = playing();
        long now = SystemClock.uptimeMillis();

        preview.playing = false;
        assertFalse(line.seekToMs(5_000L, "m1", now));

        preview.playing = true;
        preview.sound = "m2";
        assertFalse(line.seekToMs(5_000L, "m1", now));
        assertFalse(line.seekToMs(5_000L, "m2", now));

        preview.sound = "m1";
        SoundSeekbar.Cover held = SoundSeekbar.coverFor(assem);
        assertNotNull(held);
        assertFalse(SoundSeekbar.seek(held, new Object(), "m1", 5_000L));
        assertFalse(SoundSeekbar.seek(held, null, "m1", 5_000L));
        assertTrue(preview.seeks.isEmpty());

        assertTrue(line.seekToMs(5_000L, "m1", now));
        assertEquals(Collections.singletonList(5_000), preview.seeks);
    }

    @Test
    public void aNewSoundStartsTheLineOver() {
        SoundSeekbarView line = playing();
        long now = SystemClock.uptimeMillis();
        assertTrue(line.seekToMs(25_000L, "m1", now));

        preview.plays("m2", 1_000, 20_000, 0);
        line.refresh(now + 100L);
        assertEquals("m2", line.sound());
        assertEquals(20_000L, line.totalMs());
        assertEquals(1_000L, line.shownMs());
        assertFalse(line.isUnseekable());
        assertEquals(View.VISIBLE, line.getVisibility());
    }

    @Test
    public void offOrPausedTheSeekIsRefusedAndTheNextTickTakesTheLineOut() {
        SoundSeekbarView line = playing();
        inAWindow();
        idleFor(SoundSeekbarView.TICK_MS);
        assertTrue(line.isTicking());

        PausedProcess.set(true);
        assertFalse(line.seekToMs(5_000L, "m1", SystemClock.uptimeMillis()));
        idleFor(SoundSeekbarView.TICK_MS);
        assertNull(line());
        assertFalse(line.isTicking());
        assertEquals(2, cover.getChildCount());
        assertTrue(preview.seeks.isEmpty());

        // The next sound page gets it back.
        PausedProcess.set(false);
        FrameLayout next = new FrameLayout(context);
        Object nextAssem = new Object();
        SoundSeekbar.onCoverView(nextAssem, next);
        assertNotNull(line(next));

        Settings.SOUND_SEEKBAR.save(false);
        page.removeAllViews();
        page.addView(next);
        idleFor(SoundSeekbarView.TICK_MS);
        assertNull(line(next));
    }

    @Test
    public void theTicksAloneShowTheLineAndLeavingThePageStopsThem() {
        Settings.SOUND_SEEKBAR.save(true);
        buildCover();
        SoundSeekbar.onCoverView(assem, cover);
        SoundSeekbarView line = line();
        Activity activity = inAWindow();
        preview.plays("m1", 3_000, 30_000, 30_000);

        idleFor(SoundSeekbarView.TICK_MS);
        assertTrue(line.isTicking());
        assertEquals(View.VISIBLE, line.getVisibility());
        assertEquals(3_000L, line.positionMs());

        preview.position = 4_000;
        idleFor(SoundSeekbarView.TICK_MS);
        assertEquals(4_000L, line.positionMs());

        activity.setContentView(new View(context));
        assertFalse(line.isTicking());
        int asked = preview.asked;
        idleFor(SoundSeekbarView.TICK_MS * 4);
        assertEquals(asked, preview.asked);
    }

    @Test
    public void aCoverBuiltAgainMovesTheLineToTheNewView() {
        SoundSeekbarView first = playing();
        SoundSeekbar.onCoverView(assem, cover);
        assertSame(first, line());

        FrameLayout rebuilt = new FrameLayout(context);
        SoundSeekbar.onCoverView(assem, rebuilt);
        assertNull(line());
        assertFalse(first.isTicking());
        SoundSeekbarView second = line(rebuilt);
        assertNotNull(second);
        assertSame(second, SoundSeekbar.coverFor(assem).line.get());
    }

    @Test
    public void aStreamThatDoesNotMoveHidesTheLineForThatSound() {
        SoundSeekbarView line = playing();
        long now = SystemClock.uptimeMillis();

        // A short seek isn't checked.
        assertTrue(line.seekToMs(13_000L, "m1", now));
        preview.position = 14_500;
        line.refresh(now + SoundSeekbarView.CHECK_AFTER_MS);
        assertFalse(line.isUnseekable());

        // A long one that lands is fine.
        long later = now + 2_000L;
        assertTrue(line.seekToMs(25_000L, "m1", later));
        preview.position = 26_500;
        line.refresh(later + SoundSeekbarView.CHECK_AFTER_MS);
        assertFalse(line.isUnseekable());
        assertEquals(View.VISIBLE, line.getVisibility());

        // One the stream ignored: it played on from where it was.
        long last = later + 4_000L;
        assertTrue(line.seekToMs(5_000L, "m1", last));
        preview.position = 26_500 + (int) SoundSeekbarView.CHECK_AFTER_MS;
        line.refresh(last + SoundSeekbarView.CHECK_AFTER_MS);
        assertTrue(line.isUnseekable());
        assertEquals(View.GONE, line.getVisibility());
        line.refresh(last + 2_000L);
        assertEquals(View.GONE, line.getVisibility());
        assertFalse(line.seekToMs(1_000L, "m1", last + 2_000L));

        preview.plays("m2", 1_000, 20_000, 20_000);
        line.refresh(last + 2_250L);
        assertFalse(line.isUnseekable());
        assertEquals(View.VISIBLE, line.getVisibility());
    }

    @Test
    public void aCoverThatIsNotAFrameIsReportedAndLeftAlone() {
        Settings.SOUND_SEEKBAR.save(true);
        LinearLayout plain = new LinearLayout(context);
        plain.addView(new View(context));
        SoundSeekbar.onCoverView(assem, plain);

        assertEquals(1, plain.getChildCount());
        assertNull(SoundSeekbar.coverFor(assem));
        List<String> missing = HookStatus.missing(SoundSeekbar.FAMILY);
        assertEquals(missing.toString(), 1, missing.size());
        assertTrue(missing.toString(), missing.get(0).contains("FrameLayout"));
    }

    @Test
    public void inACoverSizedToItsPictureTheLineTakesThePicturesWidth() {
        Settings.SOUND_SEEKBAR.save(true);
        buildCover();
        SoundSeekbar.onCoverView(assem, cover);
        layOut();
        assertEquals(PICTURE, cover.getMeasuredWidth());

        SoundSeekbarView line = playing();
        assertSame(line, line());
        assertEquals(PICTURE, cover.getMeasuredWidth());
        assertEquals(PICTURE, cover.getMeasuredHeight());
        assertEquals(PICTURE, line.getWidth());
        assertEquals(line.stripHeight(), line.getHeight());
        assertEquals(PICTURE, line.getBottom());
        assertEquals(0, line.getLeft());
    }

    @Test
    public void aTapOrASidewaysDragSeeksAndAnUpOrDownDragIsLeftToThePage() {
        SoundSeekbarView line = playing();
        float y = onTheLine(line);

        assertTrue(touch(MotionEvent.ACTION_DOWN, along(line, 0.5f), y));
        touch(MotionEvent.ACTION_UP, along(line, 0.5f), y);
        assertEquals(1, preview.seeks.size());
        assertEquals(15_000, preview.seeks.get(0), 50);

        int slop = ViewConfiguration.get(context).getScaledTouchSlop();
        touch(MotionEvent.ACTION_DOWN, along(line, 0.2f), y);
        touch(MotionEvent.ACTION_MOVE, along(line, 0.5f), y);
        assertTrue(line.isDragging());
        touch(MotionEvent.ACTION_MOVE, along(line, 0.8f), y);
        touch(MotionEvent.ACTION_UP, along(line, 0.8f), y);
        assertFalse(line.isDragging());
        assertEquals(2, preview.seeks.size());
        assertEquals(24_000, preview.seeks.get(1), 50);

        touch(MotionEvent.ACTION_DOWN, along(line, 0.3f), y);
        touch(MotionEvent.ACTION_MOVE, along(line, 0.3f), y - slop * 3f);
        touch(MotionEvent.ACTION_UP, along(line, 0.3f), y - slop * 3f);
        assertEquals(2, preview.seeks.size());
    }

    @Test
    public void aScreenReaderHearsASeekBarAndCanMoveIt() {
        SoundSeekbarView line = playing();
        // A view outside a window gets an empty node, so this one goes in a window as on the phone.
        inAWindow();

        AccessibilityNodeInfo node = line.createAccessibilityNodeInfo();
        assertEquals(SeekBar.class.getName(), node.getClassName().toString());
        assertEquals("Sound position", node.getContentDescription().toString());
        assertEquals(30f, node.getRangeInfo().getMax(), 0f);
        assertEquals(12f, node.getRangeInfo().getCurrent(), 0f);
        List<Integer> actions = new ArrayList<>();
        for (AccessibilityNodeInfo.AccessibilityAction action : node.getActionList()) actions.add(action.getId());
        assertTrue(actions.contains(AccessibilityNodeInfo.ACTION_SCROLL_FORWARD));
        assertTrue(actions.contains(AccessibilityNodeInfo.ACTION_SCROLL_BACKWARD));
        node.recycle();

        assertTrue(line.performAccessibilityAction(AccessibilityNodeInfo.ACTION_SCROLL_FORWARD, null));
        assertEquals(Collections.singletonList(17_000), preview.seeks);
    }

    /**
     * A sound page closed while its line is on. PineDrama's views lead back to the cover (a tag
     * stands in for that here), and the line sits in those views, so a line held strongly would
     * keep the cover that keys it, and with it the page.
     */
    @Test
    public void aClosedSoundPageIsLetGoWithItsLine() throws InterruptedException {
        Settings.SOUND_SEEKBAR.save(true);
        WeakReference<Object> closed = openAPageWithALine();

        for (int attempt = 0; attempt < 20 && closed.get() != null; attempt++) {
            System.gc();
            Thread.sleep(10);
        }
        assertNull("the closed page is still held through its line", closed.get());
    }

    private WeakReference<Object> openAPageWithALine() {
        Object owner = new Object();
        FrameLayout root = new FrameLayout(context);
        root.setTag(owner);
        SoundSeekbar.onCoverView(owner, root);
        assertNotNull(line(root));
        return new WeakReference<>(owner);
    }
}
