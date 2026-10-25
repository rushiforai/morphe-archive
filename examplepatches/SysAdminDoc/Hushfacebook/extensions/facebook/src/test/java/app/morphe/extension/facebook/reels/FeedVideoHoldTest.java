/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import androidx.recyclerview.widget.RecyclerView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;

import java.time.Duration;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Hold a feed video for 2x (#229): a hold on a video playing in a feed row sets its player to 2x,
 * turns the rest of the gesture into a cancel, and the lift puts back the speed it played at; a
 * video already at 2x, a Reels-row tile in a sideways list, a full-size page, a detached player, a
 * press that moves or lifts early, and everything with the switch off, paused or without the patch
 * are left to Facebook. Long press opens comments leaves a hold on a feed video to this one.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, qualifiers = "w1080dp-h2400dp-mdpi")
public class FeedVideoHoldTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Each player's container and speed, as the patch's stubs would read them. */
    private final Map<Object, ViewGroup> views = new IdentityHashMap<>();
    private final Map<Object, Float> speeds = new IdentityHashMap<>();
    /** Every speed set, in order. */
    private final List<Float> sets = new ArrayList<>();
    private final List<String> clicked = new ArrayList<>();
    private final List<String> facebook = new ArrayList<>();
    private ActivityController<Activity> window;
    private Activity activity;
    private FrameLayout root;
    private RecyclerView list;
    private FrameLayout row;
    private View name;
    private FrameLayout container;
    private final Object player = new Object();

    @Before
    public void setUp() {
        FeedVideoHold.reset();
        PostLongPress.reset();
        FeedVideoHold.inBuildForTests = true;
        FeedVideoHold.access = new FeedVideoHold.Players() {
            @Override
            public ViewGroup view(Object of) {
                return views.get(of);
            }

            @Override
            public float speed(Object of) {
                Float speed = speeds.get(of);
                return speed == null ? Float.NaN : speed;
            }

            @Override
            public void speed(Object of, float speed) {
                speeds.put(of, speed);
                sets.add(speed);
            }
        };
        Settings.HOLD_FEED_VIDEO_FOR_2X.save(true);
        window = Robolectric.buildActivity(Activity.class).setup();
        activity = window.get();
        root = new FrameLayout(activity);
        list = new RecyclerView(activity, true);
        place(root, list, 0, 100, 1080, 2100);
        row = post(list, 0);
        container = video(row, 0, 300, 1080, 900, player);
        activity.setContentView(root);
        layOut();
        window.windowFocusChanged(true);
        waitFor(0);
    }

    @After
    public void restore() {
        FeedVideoHold.reset();
        PostLongPress.reset();
        PauseForTests.resume();
        Settings.HOLD_FEED_VIDEO_FOR_2X.resetToDefault();
        Settings.LONG_PRESS_OPENS_COMMENTS.resetToDefault();
        HookStatus.clear();
    }

    /** A feed post at [top] in [into]: a name line, room for a video, and a footer of Like, Comment and Share. */
    private FrameLayout post(ViewGroup into, int top) {
        FrameLayout post = new FrameLayout(activity);
        place(into, post, 0, top, 1080, top + 1100);
        FrameLayout header = new FrameLayout(activity);
        header.setClickable(true);
        place(post, header, 0, 0, 1080, 181);
        name = new View(activity);
        place(header, name, 170, 35, 807, 84);
        FrameLayout bar = new FrameLayout(activity);
        bar.setClickable(true);
        place(post, bar, 0, 900, 1080, 1024);
        place(bar, button("like"), 0, 0, 162, 124);
        place(bar, button("comment"), 162, 0, 324, 124);
        place(bar, button("share"), 324, 0, 448, 124);
        return post;
    }

    /** [player]'s view container at the bounds in [into], attached as Facebook attaches one. */
    private FrameLayout video(ViewGroup into, int left, int top, int right, int bottom, Object of) {
        FrameLayout view = new FrameLayout(activity);
        view.setOnLongClickListener(v -> facebook.add("video long"));
        place(into, view, left, top, right, bottom);
        views.put(of, view);
        FeedVideoHold.attached(view, of);
        return view;
    }

    private View button(String label) {
        View view = new View(activity);
        view.setOnClickListener(v -> clicked.add(label));
        return view;
    }

    private static void place(ViewGroup parent, View child, int left, int top, int right, int bottom) {
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(right - left, bottom - top, Gravity.LEFT | Gravity.TOP);
        params.leftMargin = left;
        params.topMargin = top;
        parent.addView(child, params);
    }

    private void layOut() {
        activity.getWindow().getDecorView().requestLayout();
        waitFor(100);
    }

    private static int[] middleOf(View view) {
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        return new int[] {at[0] + view.getWidth() / 2, at[1] + view.getHeight() / 2};
    }

    private MotionEvent event(int action, int[] at) {
        long now = SystemClock.uptimeMillis();
        return MotionEvent.obtain(now, now, action, at[0], at[1], 0);
    }

    /** Sends [event] the way the hook does and hands it back. */
    private MotionEvent send(MotionEvent event) {
        FeedVideoHold.touch(activity, event);
        return event;
    }

    /** Sends [event] the way the hooks do, this one's first, then on through the window, and hands it back. */
    private MotionEvent deliver(MotionEvent event) {
        FeedVideoHold.touch(activity, event);
        PostLongPress.touch(activity, event);
        activity.getWindow().getDecorView().dispatchTouchEvent(event);
        return event;
    }

    private static void waitFor(long millis) {
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(millis));
    }

    private static void holdLongEnough() {
        waitFor(ViewConfiguration.getLongPressTimeout() + 50L);
    }

    private static String statusLine(String family) {
        for (String line : HookStatus.report()) {
            if (line.startsWith(family + ":")) return line;
        }
        return "";
    }

    @Test
    public void aHoldOnAFeedVideoPlaysItAt2xAndTheLiftPutsItsSpeedBack() {
        speeds.put(player, 1.5f);
        int[] at = middleOf(container);
        assertSame("the window finds the video", player, FeedVideoHold.videoAt(activity.getWindow().getDecorView(), at[0], at[1]));
        assertEquals(MotionEvent.ACTION_DOWN, send(event(MotionEvent.ACTION_DOWN, at)).getActionMasked());
        holdLongEnough();
        assertEquals(List.of(2f), sets);
        assertEquals("a move during the hold went on as a cancel", MotionEvent.ACTION_CANCEL,
                send(event(MotionEvent.ACTION_MOVE, at)).getActionMasked());
        assertEquals("the lift went on as a cancel", MotionEvent.ACTION_CANCEL,
                send(event(MotionEvent.ACTION_UP, at)).getActionMasked());
        assertEquals("the lift put back the speed it had", List.of(2f, 1.5f), sets);
        String status = statusLine(FamilyNames.HOLD_REEL_FOR_2X);
        assertTrue(status, status.contains(FeedVideoHold.HELD + " 1"));

        // The next gesture is Facebook's again.
        assertEquals(MotionEvent.ACTION_DOWN, send(event(MotionEvent.ACTION_DOWN, at)).getActionMasked());
        assertEquals(MotionEvent.ACTION_UP, send(event(MotionEvent.ACTION_UP, at)).getActionMasked());
        holdLongEnough();
        assertEquals("a tap sets nothing", 2, sets.size());
    }

    @Test
    public void aSpeedThatCantBeReadGoesBackToNormal() {
        int[] at = middleOf(container);
        send(event(MotionEvent.ACTION_DOWN, at));
        holdLongEnough();
        send(event(MotionEvent.ACTION_CANCEL, at));
        assertEquals(List.of(2f, 1f), sets);
    }

    @Test
    public void aLiftThisNeverHeardIsPutBackByTheNextFinger() {
        speeds.put(player, 1.25f);
        int[] at = middleOf(container);
        send(event(MotionEvent.ACTION_DOWN, at));
        holdLongEnough();
        assertEquals(List.of(2f), sets);
        send(event(MotionEvent.ACTION_DOWN, middleOf(name)));
        assertEquals(List.of(2f, 1.25f), sets);
        send(event(MotionEvent.ACTION_UP, middleOf(name)));
        assertEquals(2, sets.size());
    }

    /** The container's own long press, timed by the window from the same touch, never runs after the speed-up. */
    @Test
    public void theVideosOwnLongPressGivesWayToTheSpeedUp() {
        int[] at = middleOf(container);
        Settings.HOLD_FEED_VIDEO_FOR_2X.save(false);
        deliver(event(MotionEvent.ACTION_DOWN, at));
        holdLongEnough();
        deliver(event(MotionEvent.ACTION_UP, at));
        assertEquals("with the switch off the window runs the video's long press", List.of("video long"), facebook);
        assertTrue(sets.isEmpty());
        facebook.clear();

        Settings.HOLD_FEED_VIDEO_FOR_2X.save(true);
        deliver(event(MotionEvent.ACTION_DOWN, at));
        holdLongEnough();
        assertEquals(List.of(2f), sets);
        assertEquals("the lift went on as a cancel", MotionEvent.ACTION_CANCEL,
                deliver(event(MotionEvent.ACTION_UP, at)).getActionMasked());
        assertTrue("the video ran nothing: " + facebook, facebook.isEmpty());
    }

    @Test
    public void aVideoAlreadyAt2xOrFasterIsLeftAlone() {
        speeds.put(player, 2f);
        int[] at = middleOf(container);
        send(event(MotionEvent.ACTION_DOWN, at));
        holdLongEnough();
        assertEquals(MotionEvent.ACTION_UP, send(event(MotionEvent.ACTION_UP, at)).getActionMasked());
        assertTrue(sets.isEmpty());
        String status = statusLine(FamilyNames.HOLD_REEL_FOR_2X);
        assertTrue(status, status.contains(FeedVideoHold.ALREADY_FAST + " 1"));
        assertFalse(status, status.contains(FeedVideoHold.HELD));
    }

    @Test
    public void aMoveOrAnEarlyLiftStopsTheHold() {
        int[] at = middleOf(container);
        send(event(MotionEvent.ACTION_DOWN, at));
        send(event(MotionEvent.ACTION_MOVE, new int[] {at[0], at[1] + 200}));
        holdLongEnough();
        assertTrue("a scroll sped nothing up", sets.isEmpty());

        send(event(MotionEvent.ACTION_DOWN, at));
        waitFor(ViewConfiguration.getLongPressTimeout() / 2);
        assertEquals(MotionEvent.ACTION_UP, send(event(MotionEvent.ACTION_UP, at)).getActionMasked());
        holdLongEnough();
        assertTrue("a tap sped nothing up", sets.isEmpty());
    }

    @Test
    public void aReelsRowTileAFullSizePageAndADetachedPlayerAreLeftAlone() {
        // A tile in the feed's sideways Reels row: its nearest list doesn't scroll up and down.
        RecyclerView reels = new RecyclerView(activity, false);
        place(row, reels, 0, 181, 1080, 300);
        Object tile = new Object();
        FrameLayout tileView = video(reels, 0, 0, 300, 119, tile);
        // A full-size page, as the Reels viewer's are.
        RecyclerView pages = new RecyclerView(activity, true);
        place(list, pages, 0, 1100, 1080, 2000);
        FrameLayout page = new FrameLayout(activity);
        place(pages, page, 0, 0, 1080, 900);
        Object reel = new Object();
        FrameLayout reelView = video(page, 0, 0, 1080, 900, reel);
        layOut();

        View decor = activity.getWindow().getDecorView();
        int[] onTile = middleOf(tileView);
        assertNull("the tile", FeedVideoHold.videoAt(decor, onTile[0], onTile[1]));
        send(event(MotionEvent.ACTION_DOWN, onTile));
        holdLongEnough();
        int[] onReel = middleOf(reelView);
        assertNull("the page", FeedVideoHold.videoAt(decor, onReel[0], onReel[1]));
        send(event(MotionEvent.ACTION_DOWN, onReel));
        holdLongEnough();
        assertTrue(sets.isEmpty());

        // A player Facebook took off the screen is judged where its container is now.
        int[] at = middleOf(container);
        row.removeView(container);
        assertNull("the detached player", FeedVideoHold.videoAt(decor, at[0], at[1]));
        send(event(MotionEvent.ACTION_DOWN, at));
        holdLongEnough();
        assertTrue(sets.isEmpty());
    }

    @Test
    public void offPausedOrWithoutThePatchEveryTouchIsFacebooks() {
        int[] at = middleOf(container);
        Settings.HOLD_FEED_VIDEO_FOR_2X.save(false);
        send(event(MotionEvent.ACTION_DOWN, at));
        holdLongEnough();
        assertEquals(MotionEvent.ACTION_UP, send(event(MotionEvent.ACTION_UP, at)).getActionMasked());
        Settings.HOLD_FEED_VIDEO_FOR_2X.save(true);

        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        send(event(MotionEvent.ACTION_DOWN, at));
        holdLongEnough();
        PauseForTests.resume();

        FeedVideoHold.inBuildForTests = false;
        send(event(MotionEvent.ACTION_DOWN, at));
        holdLongEnough();
        assertFalse(FeedVideoHold.takes(activity.getWindow().getDecorView(), at[0], at[1]));
        assertTrue(sets.isEmpty());
        assertFalse(statusLine(FamilyNames.HOLD_REEL_FOR_2X).contains(FeedVideoHold.HELD));
    }

    @Test
    public void longPressOpensCommentsLeavesAHoldOnAFeedVideoToTheSpeedUp() {
        Settings.LONG_PRESS_OPENS_COMMENTS.save(true);
        int[] onName = middleOf(name);
        deliver(event(MotionEvent.ACTION_DOWN, onName));
        holdLongEnough();
        deliver(event(MotionEvent.ACTION_UP, onName));
        assertEquals("a hold on the name line still opens comments", List.of("comment"), clicked);
        assertTrue(sets.isEmpty());

        int[] at = middleOf(container);
        assertTrue(FeedVideoHold.takes(activity.getWindow().getDecorView(), at[0], at[1]));
        deliver(event(MotionEvent.ACTION_DOWN, at));
        holdLongEnough();
        deliver(event(MotionEvent.ACTION_UP, at));
        assertEquals("the video's hold opened no comments", List.of("comment"), clicked);
        assertEquals(List.of(2f, 1f), sets);
        String status = statusLine(FamilyNames.REEL_GESTURES);
        assertTrue(status, status.contains(PostLongPress.ON_VIDEO + " 1"));

        // With this switch off the video's hold opens comments as before.
        Settings.HOLD_FEED_VIDEO_FOR_2X.save(false);
        deliver(event(MotionEvent.ACTION_DOWN, at));
        holdLongEnough();
        deliver(event(MotionEvent.ACTION_UP, at));
        assertEquals(List.of("comment", "comment"), clicked);
    }
}
