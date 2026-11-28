/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.Context;
import android.os.Looper;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.Window;
import android.widget.FrameLayout;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowToast;

import java.net.InetAddress;
import java.time.Duration;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;

/**
 * What Hold to download does with the touches of a window: a two-finger hold on a feed post or a reel
 * that stays still for the chosen time saves once and takes the gesture from Instagram; a hold that
 * ends early, moves, gets another finger, starts after Instagram's long press or strays off the post
 * does nothing; one finger never gets past a look at its pointer count; and off, paused or before the
 * settings are ready no window is watched at all.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37}, qualifiers = "w1080dp-h1920dp")
public class HoldDownloadTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final HoldDownload.Saver SAVER = HoldDownload.saver;
    private static final HoldDownload.Reads READS = HoldDownload.reads;

    private ActivityController<Activity> controller;
    private Activity activity;
    private Window window;
    private Post frame;
    private Reel reel;
    private View caption;
    private FrameLayout root;
    private FrameLayout videoFrame;
    private Cover cover;
    private final Object holder = new Object();
    private final Object videoHolder = new Object();
    private final Object detector = new Object();
    private final List<String> saves = new ArrayList<>();

    /** A feed post's media frame: its touch method hands each touch to the hook first, as the patched one does, and keeps the gesture. */
    static final class Post extends FrameLayout {
        final Object holder;
        final List<Integer> seen = new ArrayList<>();

        Post(Context context, Object holder) {
            super(context);
            this.holder = holder;
        }

        @Override public boolean onTouchEvent(MotionEvent event) {
            HoldDownload.feedTouch(holder, event);
            seen.add(event.getActionMasked());
            return true;
        }
    }

    /** A reel: its gesture detector's touch method hands each touch to the hook first. */
    static final class Reel extends FrameLayout {
        final Object detector;
        final List<Integer> seen = new ArrayList<>();

        Reel(Context context, Object detector) {
            super(context);
            this.detector = detector;
        }

        @Override public boolean onTouchEvent(MotionEvent event) {
            HoldDownload.reelTouch(detector, this, event);
            seen.add(event.getActionMasked());
            return true;
        }
    }

    /** What Instagram calls its list of rows: a RecyclerView by name. */
    static final class RecyclerView extends FrameLayout {
        RecyclerView(Context context) {
            super(context);
        }
    }

    /** The clickable cover a reel preview ends on, over a feed video's frame: it takes the first finger, so the frame's touch method never runs. */
    static final class Cover extends View {
        final List<Integer> seen = new ArrayList<>();
        int clicks;

        Cover(Context context) {
            super(context);
            setClickable(true);
            setOnClickListener(view -> clicks++);
        }

        @Override public boolean onTouchEvent(MotionEvent event) {
            seen.add(event.getActionMasked());
            return super.onTouchEvent(event);
        }
    }

    @Before
    public void open() {
        reset();
        Settings.HOLD_TO_DOWNLOAD.save(true);
        Settings.DOWNLOAD_VIDEOS.save(true);
        Settings.DOWNLOAD_PHOTOS.save(true);
        controller = Robolectric.buildActivity(Activity.class).setup();
        activity = controller.get();
        window = activity.getWindow();
        root = new FrameLayout(activity);
        frame = new Post(activity, holder);
        reel = new Reel(activity, detector);
        caption = new View(activity);
        root.addView(frame, place(0));
        root.addView(reel, place(110));
        root.addView(caption, place(220));
        // A video row: the frame the hold is about, with the cover over it, in a list of rows.
        RecyclerView list = new RecyclerView(activity);
        FrameLayout row = new FrameLayout(activity);
        videoFrame = new FrameLayout(activity);
        cover = new Cover(activity);
        row.addView(videoFrame, new FrameLayout.LayoutParams(-1, -1));
        row.addView(cover, new FrameLayout.LayoutParams(-1, -1));
        list.addView(row, new FrameLayout.LayoutParams(-1, -1));
        root.addView(list, place(330));
        activity.setContentView(root);
        idle();
        assertEquals("the post is laid out", 200, frame.getWidth());
        HoldDownload.reads = new HoldDownload.Reads() {
            @Override public Object feedMedia(Object owner) {
                return owner == holder ? "post" : null;
            }

            @Override public Object feedState(Object owner) {
                return owner == holder ? 1 : null;
            }

            @Override public Object feedFrame(Object owner) {
                return owner == holder ? frame : owner == videoHolder ? videoFrame : null;
            }

            @Override public Object reelMedia(Object owner) {
                return owner == detector ? "reel" : null;
            }
        };
        HoldDownload.saver = (kind, owner, at) -> {
            saves.add(kind + " " + (owner == holder ? "holder" : owner == detector ? "detector" : owner == videoHolder ? "video holder" : owner) + " " + (at == activity));
            return true;
        };
        HookStatus.clear();
    }

    @After
    public void close() throws InterruptedException {
        // A save a test started ends before the next test, so none of them holds a slot.
        long deadline = System.currentTimeMillis() + 10_000;
        while (MediaSave.savesInFlight() > 0 && System.currentTimeMillis() < deadline) Thread.sleep(20);
        MediaSave.policyForTests = null;
        if (controller != null) controller.close();
        reset();
    }

    private static void reset() {
        HoldDownload.saver = SAVER;
        HoldDownload.reads = READS;
        HoldDownload.target = null;
        Settings.HOLD_TO_DOWNLOAD.resetToDefault();
        Settings.HOLD_FINGERS.resetToDefault();
        Settings.HOLD_TIME.resetToDefault();
        Settings.DOWNLOAD_VIDEOS.resetToDefault();
        Settings.DOWNLOAD_PHOTOS.resetToDefault();
        Settings.DOWNLOAD_REELS.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        Media.clear();
        HookStatus.clear();
    }

    private static FrameLayout.LayoutParams place(int top) {
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(200, 100);
        // Well below the window's top, where API 35 and later lay the bars over the content and they take the touch.
        params.topMargin = 400 + top;
        return params;
    }

    private static void idle() {
        shadowOf(Looper.getMainLooper()).idle();
    }

    private static void pass(long millis) {
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(millis));
    }

    private long holdTime() {
        return Settings.HOLD_TIME.get().millis;
    }

    /** One gesture on the window, its fingers placed from [on]'s corner. Each event goes through the window's callback, as the decor view sends it. */
    private final class Gesture {
        final long down = SystemClock.uptimeMillis();
        final float left;
        final float top;
        final List<float[]> fingers = new ArrayList<>();
        final List<Integer> ids = new ArrayList<>();
        int nextId;

        Gesture(View on, float x, float y) {
            int[] at = new int[2];
            on.getLocationInWindow(at);
            left = at[0];
            top = at[1];
            fingers.add(new float[] {left + x, top + y});
            ids.add(nextId++);
            send(MotionEvent.ACTION_DOWN);
            List<Integer> seen = on instanceof Post ? ((Post) on).seen : on instanceof Reel ? ((Reel) on).seen : on instanceof Cover ? ((Cover) on).seen : null;
            if (seen != null) assertEquals("the touch reached the view", MotionEvent.ACTION_DOWN, (int) seen.get(seen.size() - 1));
        }

        Gesture add(float x, float y) {
            fingers.add(new float[] {left + x, top + y});
            ids.add(nextId++);
            send(MotionEvent.ACTION_POINTER_DOWN | ((fingers.size() - 1) << MotionEvent.ACTION_POINTER_INDEX_SHIFT));
            return this;
        }

        Gesture move(int finger, float dx, float dy) {
            fingers.get(finger)[0] += dx;
            fingers.get(finger)[1] += dy;
            send(MotionEvent.ACTION_MOVE);
            return this;
        }

        Gesture lift(int finger) {
            send(MotionEvent.ACTION_POINTER_UP | (finger << MotionEvent.ACTION_POINTER_INDEX_SHIFT));
            fingers.remove(finger);
            ids.remove(finger);
            return this;
        }

        void up() {
            while (fingers.size() > 1) lift(fingers.size() - 1);
            send(MotionEvent.ACTION_UP);
        }

        void cancel() {
            send(MotionEvent.ACTION_CANCEL);
        }

        private void send(int action) {
            int count = fingers.size();
            MotionEvent.PointerProperties[] properties = new MotionEvent.PointerProperties[count];
            MotionEvent.PointerCoords[] coords = new MotionEvent.PointerCoords[count];
            for (int i = 0; i < count; i++) {
                properties[i] = new MotionEvent.PointerProperties();
                properties[i].id = ids.get(i);
                properties[i].toolType = MotionEvent.TOOL_TYPE_FINGER;
                coords[i] = new MotionEvent.PointerCoords();
                coords[i].x = fingers.get(i)[0];
                coords[i].y = fingers.get(i)[1];
                coords[i].pressure = 1f;
                coords[i].size = 1f;
            }
            MotionEvent event = MotionEvent.obtain(down, SystemClock.uptimeMillis(), action, count, properties, coords,
                    0, 0, 1f, 1f, 0, 0, InputDevice.SOURCE_TOUCHSCREEN, 0);
            try {
                window.getCallback().dispatchTouchEvent(event);
            } finally {
                event.recycle();
            }
        }
    }

    private Gesture twoFingersOn(View view) {
        return new Gesture(view, 40, 40).add(120, 60);
    }

    /** Two fingers held still past the time save the post once, and Instagram's gesture gets a cancel and nothing after it. */
    @Test
    public void aTwoFingerHoldPastTheTimeSavesOnceAndCancelsInstagramsGesture() {
        Gesture hold = twoFingersOn(frame);
        assertTrue("the window has a watcher", window.getCallback() instanceof HoldDownload.Watcher);
        pass(holdTime() - 1);
        assertTrue("not before the time", saves.isEmpty());
        pass(2);
        assertEquals(List.of("FEED holder true"), saves);
        List<Integer> seen = new ArrayList<>(frame.seen);
        assertEquals("Instagram's gesture ends in a cancel", MotionEvent.ACTION_CANCEL, (int) seen.get(seen.size() - 1));

        hold.move(0, 50, 50).move(1, 50, 50);
        hold.up();
        pass(holdTime() * 3);
        assertEquals("the rest of the gesture is kept from Instagram", seen, frame.seen);
        assertEquals("one save", 1, saves.size());
        assertEquals(List.of(FamilyNames.VIDEO_DOWNLOAD + ": invoked 1, 0 found, 0 missing. Counted: " + HoldDownload.COUNT_SAVED + " 1"),
                HookStatus.report());

        // The next gesture is Instagram's again.
        new Gesture(frame, 30, 30).up();
        assertEquals(MotionEvent.ACTION_UP, (int) frame.seen.get(frame.seen.size() - 1));
    }

    @Test
    public void releasedEarlyDoesNothing() {
        Gesture hold = twoFingersOn(frame);
        pass(holdTime() / 2);
        hold.lift(1);
        pass(holdTime() * 3);
        hold.up();
        pass(holdTime() * 3);
        assertTrue(saves.isEmpty());
        assertEquals("Instagram saw the whole gesture", MotionEvent.ACTION_UP, (int) frame.seen.get(frame.seen.size() - 1));
        assertFalse(frame.seen.contains(MotionEvent.ACTION_CANCEL));

        Gesture again = twoFingersOn(frame);
        pass(holdTime() / 2);
        again.up();
        pass(holdTime() * 3);
        assertTrue("both fingers lifting together is early too", saves.isEmpty());
    }

    /** One finger, however long, is Instagram's: the watcher passes each event on after a look at its pointer count. */
    @Test
    public void oneFingerNeverTriggers() {
        Gesture press = new Gesture(frame, 40, 40);
        HoldDownload.Watcher watcher = (HoldDownload.Watcher) window.getCallback();
        pass(holdTime() * 4);
        press.move(0, 2, 2);
        pass(holdTime() * 4);
        press.up();
        assertTrue(saves.isEmpty());
        assertEquals(HoldDownload.Watcher.IDLE, watcher.state);
        assertEquals(List.of(MotionEvent.ACTION_DOWN, MotionEvent.ACTION_MOVE, MotionEvent.ACTION_UP), frame.seen);
    }

    @Test
    public void aThirdFingerOrAMovePastTheTouchSlopCancels() {
        float slop = ViewConfiguration.get(activity).getScaledTouchSlop();

        Gesture third = twoFingersOn(frame);
        pass(holdTime() / 2);
        third.add(80, 20);
        pass(holdTime() * 3);
        third.up();
        assertTrue("a third finger", saves.isEmpty());

        Gesture slid = twoFingersOn(frame);
        pass(holdTime() / 2);
        slid.move(1, slop + 4, 0);
        pass(holdTime() * 3);
        slid.up();
        assertTrue("a finger past the slop", saves.isEmpty());

        Gesture steady = twoFingersOn(frame);
        steady.move(1, slop / 2, 0);
        pass(holdTime() + 1);
        steady.up();
        assertEquals("a finger that shook within the slop still holds", 1, saves.size());

        Gesture cancelled = twoFingersOn(frame);
        pass(holdTime() / 2);
        cancelled.cancel();
        pass(holdTime() * 3);
        assertEquals("a cancel ends it", 1, saves.size());
    }

    /** The fingers all land before Instagram's own long press could start, all on the post, the first where it went down. */
    @Test
    public void aLateSecondFingerAFingerOffThePostOrASlidFirstFingerDoNothing() {
        Gesture late = new Gesture(frame, 40, 40);
        pass(ViewConfiguration.getLongPressTimeout() + 50);
        late.add(120, 60);
        pass(holdTime() * 3);
        late.up();
        assertTrue("after Instagram's long press time", saves.isEmpty());

        Gesture off = new Gesture(frame, 40, 40).add(40, 240);
        pass(holdTime() * 3);
        off.up();
        assertTrue("a finger on the caption", saves.isEmpty());

        float slop = ViewConfiguration.get(activity).getScaledTouchSlop();
        Gesture slid = new Gesture(frame, 40, 40).move(0, slop + 10, 0).add(120, 60);
        pass(holdTime() * 3);
        slid.up();
        assertTrue("a first finger that slid first", saves.isEmpty());
    }

    @Test
    public void threeFingersAndTheTimeAreTheChosenOnes() {
        Settings.HOLD_FINGERS.save(HoldFingers.THREE);
        Settings.HOLD_TIME.save(HoldTime.HALF_SECOND);
        Gesture two = twoFingersOn(frame);
        pass(2000);
        two.up();
        assertTrue("two fingers aren't three", saves.isEmpty());

        Gesture three = twoFingersOn(frame).add(80, 20);
        pass(499);
        assertTrue(saves.isEmpty());
        pass(2);
        three.up();
        assertEquals(List.of("FEED holder true"), saves);
    }

    @Test
    public void aReelSavesWhatItsDetectorKeepsAndNeedsDownloadOnReels() {
        Gesture hold = twoFingersOn(reel);
        pass(holdTime() + 1);
        hold.up();
        assertEquals(List.of("REEL detector true"), saves);
        assertEquals(MotionEvent.ACTION_CANCEL, (int) reel.seen.get(reel.seen.size() - 1));
        assertTrue("the feed post wasn't touched", frame.seen.isEmpty());

        Settings.DOWNLOAD_REELS.save(false);
        Gesture off = twoFingersOn(reel);
        pass(holdTime() * 3);
        off.up();
        assertEquals("Download on reels off", 1, saves.size());
        assertNull(HoldDownload.target);
    }

    /** Off, paused or before the settings are ready, a first finger notes nothing and the window keeps its own callback. */
    @Test
    public void offPausedOrNotReadyWatchNothing() {
        Settings.HOLD_TO_DOWNLOAD.save(false);
        holdAndLift(frame);
        assertSame("off", activity, window.getCallback());

        Settings.HOLD_TO_DOWNLOAD.save(true);
        Settings.DOWNLOAD_VIDEOS.save(false);
        Settings.DOWNLOAD_PHOTOS.save(false);
        holdAndLift(frame);
        assertSame("no download switch to save with", activity, window.getCallback());
        Settings.DOWNLOAD_PHOTOS.save(true);

        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        holdAndLift(frame);
        holdAndLift(reel);
        assertSame("paused", activity, window.getCallback());
        assertTrue("the choice is kept while paused", Settings.HOLD_TO_DOWNLOAD.savedValue());
        PauseForTests.resume();

        SettingsContextRule.withoutContext(() -> holdAndLift(frame));
        assertSame("not ready", activity, window.getCallback());
        assertTrue(saves.isEmpty());
        assertNull(HoldDownload.target);
        assertTrue("nothing was counted", HookStatus.report().isEmpty());
    }

    /** Two fingers on [on] for longer than any hold time, then lifted. Reads no setting, so it runs before the settings are ready too. */
    private void holdAndLift(View on) {
        Gesture hold = twoFingersOn(on);
        pass(5000);
        hold.up();
    }

    /** A window watched from before goes back to its own callback at its next touch with two fingers once the switch is off, or pause comes. */
    @Test
    public void turnedOffOrPausedTheWatcherStepsOut() {
        new Gesture(frame, 40, 40).up();
        assertTrue(window.getCallback() instanceof HoldDownload.Watcher);
        assertTrue(HoldDownload.watched(window));
        Settings.HOLD_TO_DOWNLOAD.save(false);
        holdAndLift(frame);
        assertSame(activity, window.getCallback());
        assertFalse(HoldDownload.watched(window));
        assertTrue(saves.isEmpty());

        Settings.HOLD_TO_DOWNLOAD.save(true);
        Gesture armed = twoFingersOn(frame);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        pass(holdTime() * 3);
        armed.up();
        assertTrue("paused mid-hold", saves.isEmpty());
        holdAndLift(frame);
        assertSame(activity, window.getCallback());
    }

    /** Wrapped since by another watcher, it stays a pass-through when turned off, and wakes when a finger lands again with it on. */
    @Test
    public void underAnotherWrapperItStaysAPassThroughAndWakesAgain() {
        new Gesture(frame, 40, 40).up();
        HoldDownload.Watcher watcher = (HoldDownload.Watcher) window.getCallback();
        Window.Callback outer = new Outer(watcher);
        window.setCallback(outer);
        assertSame("another wrapper sees through it", activity, HoldDownload.innerOf(watcher));
        assertSame(outer, HoldDownload.innerOf(outer));

        Settings.HOLD_TO_DOWNLOAD.save(false);
        holdAndLift(frame);
        assertSame(outer, window.getCallback());
        assertFalse(watcher.active);
        Settings.HOLD_TO_DOWNLOAD.save(true);
        Gesture hold = twoFingersOn(frame);
        assertTrue("a first finger wakes it", watcher.active);
        pass(holdTime() + 1);
        hold.up();
        assertEquals(List.of("FEED holder true"), saves);
        assertSame("no second watcher", outer, window.getCallback());
    }

    /** A wrapper of the kind Glass tab bar's scroll hide puts on: passes every touch on. */
    private static final class Outer implements Window.Callback {
        final Window.Callback inner;

        Outer(Window.Callback inner) {
            this.inner = inner;
        }

        @Override public boolean dispatchTouchEvent(MotionEvent event) {
            return inner.dispatchTouchEvent(event);
        }

        @Override public boolean dispatchKeyEvent(android.view.KeyEvent event) { return inner.dispatchKeyEvent(event); }
        @Override public boolean dispatchKeyShortcutEvent(android.view.KeyEvent event) { return inner.dispatchKeyShortcutEvent(event); }
        @Override public boolean dispatchTrackballEvent(MotionEvent event) { return inner.dispatchTrackballEvent(event); }
        @Override public boolean dispatchGenericMotionEvent(MotionEvent event) { return inner.dispatchGenericMotionEvent(event); }
        @Override public boolean dispatchPopulateAccessibilityEvent(android.view.accessibility.AccessibilityEvent event) {
            return inner.dispatchPopulateAccessibilityEvent(event);
        }
        @Override public View onCreatePanelView(int featureId) { return inner.onCreatePanelView(featureId); }
        @Override public boolean onCreatePanelMenu(int featureId, android.view.Menu menu) { return inner.onCreatePanelMenu(featureId, menu); }
        @Override public boolean onPreparePanel(int featureId, View view, android.view.Menu menu) { return inner.onPreparePanel(featureId, view, menu); }
        @Override public boolean onMenuOpened(int featureId, android.view.Menu menu) { return inner.onMenuOpened(featureId, menu); }
        @Override public boolean onMenuItemSelected(int featureId, android.view.MenuItem item) { return inner.onMenuItemSelected(featureId, item); }
        @Override public void onWindowAttributesChanged(android.view.WindowManager.LayoutParams attrs) { inner.onWindowAttributesChanged(attrs); }
        @Override public void onContentChanged() { inner.onContentChanged(); }
        @Override public void onWindowFocusChanged(boolean hasFocus) { inner.onWindowFocusChanged(hasFocus); }
        @Override public void onAttachedToWindow() { inner.onAttachedToWindow(); }
        @Override public void onDetachedFromWindow() { inner.onDetachedFromWindow(); }
        @Override public void onPanelClosed(int featureId, android.view.Menu menu) { inner.onPanelClosed(featureId, menu); }
        @Override public boolean onSearchRequested() { return inner.onSearchRequested(); }
        @Override public boolean onSearchRequested(android.view.SearchEvent event) { return inner.onSearchRequested(event); }
        @Override public android.view.ActionMode onWindowStartingActionMode(android.view.ActionMode.Callback callback) {
            return inner.onWindowStartingActionMode(callback);
        }
        @Override public android.view.ActionMode onWindowStartingActionMode(android.view.ActionMode.Callback callback, int type) {
            return inner.onWindowStartingActionMode(callback, type);
        }
        @Override public void onActionModeStarted(android.view.ActionMode mode) { inner.onActionModeStarted(mode); }
        @Override public void onActionModeFinished(android.view.ActionMode mode) { inner.onActionModeFinished(mode); }
    }

    /** A dialog taking the window's focus ends a hold under way. */
    @Test
    public void losingTheWindowsFocusEndsAHold() {
        Gesture hold = twoFingersOn(frame);
        assertTrue("the window has a watcher", window.getCallback() instanceof HoldDownload.Watcher);
        window.getCallback().onWindowFocusChanged(false);
        pass(holdTime() * 3);
        hold.up();
        assertTrue(saves.isEmpty());
    }

    /** A save that throws is counted, and the app goes on. */
    @Test
    public void aSaveThatThrowsIsCountedNotThrown() {
        HoldDownload.saver = (kind, owner, at) -> {
            throw new IllegalStateException("broken");
        };
        Gesture hold = twoFingersOn(frame);
        pass(holdTime() + 1);
        hold.up();
        assertTrue(HookStatus.report().get(0).contains("hold to download save"));
    }

    // A video under a cover of its own, which takes the first finger before the frame's touch method runs.

    /** Two fingers held on the cover save the video once, the cover gets a cancel and nothing after it, so the tap never opens the Reels viewer. */
    @Test
    public void aHoldOnAVideoUnderItsCoverSavesOnceAndTheTapNeverReachesTheCover() {
        // An earlier gesture on another post leaves its target behind.
        new Gesture(frame, 40, 40).up();
        pass(100);
        HoldDownload.feedMade(videoHolder);
        Gesture hold = twoFingersOn(cover);
        assertTrue("the frame's own touch method never ran", HoldDownload.target == null || HoldDownload.target.downTime != hold.down);
        pass(holdTime() - 1);
        assertTrue("not before the time", saves.isEmpty());
        pass(2);
        assertEquals(List.of("FEED video holder true"), saves);
        List<Integer> seen = new ArrayList<>(cover.seen);
        assertEquals("the cover's gesture ends in a cancel", MotionEvent.ACTION_CANCEL, (int) seen.get(seen.size() - 1));

        hold.move(0, 50, 50).move(1, 50, 50);
        hold.up();
        pass(holdTime() * 3);
        assertEquals("the rest of the gesture is kept from the cover", seen, cover.seen);
        assertEquals("the tap never reached the cover", 0, cover.clicks);
        assertEquals("one save", 1, saves.size());
        assertEquals(List.of(FamilyNames.VIDEO_DOWNLOAD + ": invoked 1, 0 found, 0 missing. Counted: " + HoldDownload.COUNT_SAVED + " 1"),
                HookStatus.report());

        // One finger is the cover's, as before.
        new Gesture(cover, 30, 30).up();
        pass(50);
        assertEquals(1, cover.clicks);
        assertEquals(1, saves.size());
    }

    /** A holder made before its frame is on a window watches the window once the frame is on it. */
    @Test
    public void aHolderMadeBeforeItsFrameIsOnAWindowWatchesItWhenItIs() {
        FrameLayout late = new FrameLayout(activity);
        Object lateHolder = new Object();
        HoldDownload.Reads before = HoldDownload.reads;
        HoldDownload.reads = new HoldDownload.Reads() {
            @Override public Object feedMedia(Object owner) {
                return before.feedMedia(owner);
            }

            @Override public Object feedState(Object owner) {
                return before.feedState(owner);
            }

            @Override public Object feedFrame(Object owner) {
                return owner == lateHolder ? late : before.feedFrame(owner);
            }

            @Override public Object reelMedia(Object owner) {
                return before.reelMedia(owner);
            }
        };
        HoldDownload.feedMade(lateHolder);
        assertFalse("no window yet", HoldDownload.watched(window));
        root.addView(late, place(500));
        idle();
        assertTrue("watched once the frame is on the window", HoldDownload.watched(window));
    }

    /** Off or paused, a made holder keeps nothing and no window is watched; paused after it was made, the hold is refused and the cover keeps its gesture. */
    @Test
    public void offOrPausedAVideoUnderItsCoverNotesNothing() {
        Settings.HOLD_TO_DOWNLOAD.save(false);
        HoldDownload.feedMade(videoHolder);
        assertFalse(HoldDownload.watched(window));
        Settings.HOLD_TO_DOWNLOAD.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        HoldDownload.feedMade(videoHolder);
        assertFalse(HoldDownload.watched(window));
        PauseForTests.resume();
        holdAndLift(cover);
        assertSame("never kept, so never watched", activity, window.getCallback());
        assertTrue(saves.isEmpty());
        assertFalse(cover.seen.contains(MotionEvent.ACTION_CANCEL));

        HoldDownload.feedMade(videoHolder);
        assertTrue(HoldDownload.watched(window));
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        cover.seen.clear();
        holdAndLift(cover);
        assertTrue("paused after it was made", saves.isEmpty());
        assertFalse("the cover kept its gesture", cover.seen.contains(MotionEvent.ACTION_CANCEL));
        assertSame(activity, window.getCallback());
        assertTrue("nothing was counted", HookStatus.report().isEmpty());
    }

    /** A sheet over the feed, or fingers off the frame, never save the video below: only a cover inside its own row is looked past. */
    @Test
    public void aSheetOverTheFeedOrFingersOffTheFrameSaveNothing() {
        HoldDownload.feedMade(videoHolder);
        Cover sheet = new Cover(activity);
        root.addView(sheet, place(330));
        idle();
        holdAndLift(sheet);
        assertTrue("a clickable sheet from outside the row", saves.isEmpty());
        assertFalse(sheet.seen.contains(MotionEvent.ACTION_CANCEL));

        root.removeView(sheet);
        idle();
        holdAndLift(caption);
        assertTrue("fingers off the frame", saves.isEmpty());
        Gesture straddle = new Gesture(cover, 40, 40).add(120, 160);
        pass(holdTime() * 3);
        straddle.up();
        assertTrue("one finger off the frame", saves.isEmpty());
    }

    /** A video under its cover saves through the same Download as the menu's row. */
    @Test
    @Config(shadows = Media.class)
    public void aVideoUnderItsCoverSavesThroughDownload() {
        useTheRealSave("video post", 1);
        Media.videos.put("cover video", META + "cover.mp4");
        HoldDownload.feedMade(videoHolder);
        holdAndLift(cover);
        idle();
        assertEquals(Set.of("cover video"), Media.asked);
        assertSaving();
    }

    // The saves the menus make, picked for what's under the fingers.

    /** A feed post with a video saves its video, through Download's own save, which says it started. */
    @Test
    @Config(shadows = Media.class)
    public void aFeedVideoSavesThroughDownload() {
        useTheRealSave("video post", 1);
        Media.videos.put("video post", META + "720.mp4");
        holdAndLift(frame);
        idle();
        assertEquals(Set.of("video post"), Media.asked);
        assertSaving();
    }

    /** A feed carousel saves the page its feed state says is on screen, here a photo, and no other. */
    @Test
    @Config(shadows = Media.class)
    public void aFeedCarouselSavesThePageOnScreen() {
        useTheRealSave("carousel", 1);
        Media.carousels.put("carousel", List.of("page 0", "page 1", "page 2"));
        Media.videos.put("page 0", META + "0.mp4");
        Media.photos.put("page 1", META + "1.jpg");
        Media.videos.put("page 2", META + "2.mp4");
        holdAndLift(frame);
        idle();
        assertEquals(Set.of("page 1"), Media.asked);
        assertSaving();
    }

    /** A reel saves through Download on reels' own save. */
    @Test
    @Config(shadows = Media.class)
    public void aReelSavesThroughDownloadOnReels() {
        useTheRealSave("video post", 1);
        Media.videos.put("the reel", META + "reel.mp4");
        holdAndLift(reel);
        idle();
        assertTrue(Media.asked.contains("the reel"));
        assertFalse(Media.asked.contains("video post"));
        assertSaving();
    }

    /** A photo with Download feed photos off has nothing the switches save, and a short note says so. */
    @Test
    @Config(shadows = Media.class)
    public void nothingToSaveSaysSo() {
        Settings.DOWNLOAD_PHOTOS.save(false);
        useTheRealSave("photo post", 0);
        Media.photos.put("photo post", META + "photo.jpg");
        holdAndLift(frame);
        idle();
        assertEquals("Nothing to download on this post", String.valueOf(ShadowToast.getTextOfLatestToast()));
        assertTrue(HookStatus.report().get(0).contains(HoldDownload.COUNT_NOTHING + " 1"));
    }

    private void useTheRealSave(Object post, int page) {
        HoldDownload.saver = SAVER;
        HoldDownload.reads = new HoldDownload.Reads() {
            @Override public Object feedMedia(Object owner) {
                return owner == holder ? post : owner == videoHolder ? "cover video" : null;
            }

            @Override public Object feedState(Object owner) {
                return owner == holder ? page : owner == videoHolder ? 0 : null;
            }

            @Override public Object feedFrame(Object owner) {
                return owner == holder ? frame : owner == videoHolder ? videoFrame : null;
            }

            @Override public Object reelMedia(Object owner) {
                return owner == detector ? "the reel" : null;
            }
        };
        // Every lookup answers a private address, so a started save ends at once and nothing goes out.
        MediaSave.policyForTests = new MediaUrlPolicy(host -> new InetAddress[] {InetAddress.getByName("10.9.8.7")});
    }

    private static void assertSaving() {
        assertTrue("the save didn't say it started", ShadowToast.showedToast("Saving...")
                || ShadowToast.showedToast("Saving... You can cancel from Downloads in HushGram settings."));
    }

    /** An address on Meta's media servers, which the save takes. */
    private static final String META = "https://scontent.cdninstagram.com/v/t51.2885-15/";

    /** Posts as the bridges read them: each one's video file or picture, a carousel's pages and the page a feed state names. */
    @Implements(value = InstagramMedia.class, isInAndroidSdk = false)
    public static class Media {
        static final Map<Object, String> videos = new HashMap<>();
        static final Map<Object, String> photos = new HashMap<>();
        static final Map<Object, List<Object>> carousels = new HashMap<>();
        /** Every post or page whose files a save read. */
        static final Set<Object> asked = new HashSet<>();

        static void clear() {
            videos.clear();
            photos.clear();
            carousels.clear();
            asked.clear();
        }

        @Implementation protected static List<?> carouselMedia(Object media) { return carousels.get(media); }
        @Implementation protected static int carouselIndex(Object itemState) { return itemState instanceof Integer ? (Integer) itemState : -1; }

        @Implementation protected static List<?> videoVersions(Object media) {
            asked.add(media);
            String url = videos.get(media);
            return url == null ? null : List.of(new MediaSave.Rendition(url, 720, 1280, 0));
        }

        @Implementation protected static String dashManifest(Object media) { return null; }
        @Implementation protected static String versionUrl(Object version) { return ((MediaSave.Rendition) version).url; }
        @Implementation protected static Integer versionWidth(Object version) { return ((MediaSave.Rendition) version).width; }
        @Implementation protected static Integer versionHeight(Object version) { return ((MediaSave.Rendition) version).height; }

        @Implementation protected static Object imageVersions(Object media) {
            asked.add(media);
            return photos.containsKey(media) ? media : null;
        }

        @Implementation protected static List<?> imageCandidates(Object versions) {
            return List.of(new MediaSave.Rendition(photos.get(versions), 1080, 1080, 0));
        }

        @Implementation protected static String candidateUrl(Object candidate) { return ((MediaSave.Rendition) candidate).url; }
        @Implementation protected static int candidateWidth(Object candidate) { return ((MediaSave.Rendition) candidate).width; }
        @Implementation protected static int candidateHeight(Object candidate) { return ((MediaSave.Rendition) candidate).height; }
    }
}
