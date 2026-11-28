/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.reels;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.os.Bundle;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;

import androidx.recyclerview.widget.RecyclerView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.util.ReflectionHelpers;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.BooleanSupplier;

import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;

/**
 * Full screen Reels and Home, and Find the reel you came from, keep no look running once there's
 * nothing for it to do: with the switch off, while HushGram is paused, when the screen goes away,
 * and while nothing on the screen changes (#129).
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
public class ReelTimerLifecycleTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    private static final BooleanSupplier ON = () -> true;
    private static final String AUTHOR = "7";
    private static final String REEL = "3100_" + AUTHOR;

    /** A profile's Reels tab that counts how many times it's asked whether it's resumed: once each look. */
    public static final class CountingTab {
        public RecyclerView grid;
        public boolean resumed = true;
        int asked;
        private final Activity activity;
        private final Bundle arguments = new Bundle();

        CountingTab(Activity activity, RecyclerView grid) {
            this.activity = activity;
            this.grid = grid;
            arguments.putString(ReelOrigin.USER_KEY, AUTHOR);
        }

        public Activity getActivity() {
            return activity;
        }

        public Bundle getArguments() {
            return arguments;
        }

        public boolean isResumed() {
            asked++;
            return resumed;
        }
    }

    private final List<ActivityController<Activity>> controllers = new ArrayList<>();
    private final List<String> shown = new ArrayList<>();
    private ActivityController<Activity> controller;
    private Activity activity;
    private ActivityController<Activity> profileController;
    private Activity profile;
    private RecyclerView grid;

    @Before public void prepare() {
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        Settings.FULL_SCREEN_REELS.resetToDefault();
        Settings.FULL_SCREEN_HOME.resetToDefault();
        Settings.FIND_REEL_ORIGIN.save(true);
        HookStatus.clear();
        ReelOrigin.forget();
        controller = Robolectric.buildActivity(Activity.class).setup();
        controllers.add(controller);
        activity = controller.get();
        activity.setContentView(new FrameLayout(activity));
    }

    @After public void close() {
        FullScreenBars.release(activity);
        ReelOrigin.forget();
        for (ActivityController<Activity> each : controllers) {
            if (!each.get().isDestroyed()) each.pause().stop().destroy();
        }
        Settings.FULL_SCREEN_REELS.resetToDefault();
        Settings.FULL_SCREEN_HOME.resetToDefault();
        Settings.FIND_REEL_ORIGIN.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        HookStatus.clear();
    }

    /** A frame of [view]'s window, as far as its pre-draw listeners can tell. */
    private static void frame(View view) {
        view.getViewTreeObserver().dispatchOnPreDraw();
    }

    private static void idleSeconds(long seconds) {
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(seconds));
    }

    /** How many pre-draw listeners [view]'s window holds, from the observer's own list. */
    private static int frameListeners(View view) {
        Object listeners = ReflectionHelpers.getField(view.getViewTreeObserver(), "mOnPreDrawListeners");
        if (listeners == null) return 0;
        Integer size = ReflectionHelpers.callInstanceMethod(listeners, "size");
        return size;
    }

    // ---------------------------------------------------------------- Full screen Reels and Home

    @Test public void fullScreenWithBothSwitchesOffLeavesNoLookBehindAFrame() {
        View decor = activity.getWindow().getDecorView();
        FullScreenBars.track(activity);
        FullScreenBars.Session session = FullScreenBars.sessionFor(activity);
        assertNotNull("watched, so a switch turned on from the settings is seen at the next frame", session);
        for (int i = 0; i < 5; i++) frame(decor);
        assertFalse("off, a frame leaves no look waiting", session.checkQueued());
        idleSeconds(1);
        assertFalse(session.isHidden());

        Settings.FULL_SCREEN_REELS.save(true);
        frame(decor);
        frame(decor);
        assertTrue("on, a frame right after a look leaves one for a quiet moment", session.checkQueued());
        ShadowLooper.idleMainLooper(FullScreenBars.CHECK_MS * 2, java.util.concurrent.TimeUnit.MILLISECONDS);
        assertFalse(session.checkQueued());
    }

    @Test public void fullScreenWatchesNoActivityWhilePaused() {
        View decor = activity.getWindow().getDecorView();
        Settings.FULL_SCREEN_REELS.save(true);
        Settings.FULL_SCREEN_HOME.save(true);
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        int before = frameListeners(decor);

        FullScreenBars.track(activity);
        assertNull(FullScreenBars.sessionFor(activity));
        assertEquals(before, frameListeners(decor));

        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        FullScreenBars.track(activity);
        assertNotNull("not paused, it watches", FullScreenBars.sessionFor(activity));
        assertEquals(before + 1, frameListeners(decor));
    }

    @Test public void fullScreenLetsGoOfTheWindowAndItsLookWhenTheActivityPauses() {
        View decor = activity.getWindow().getDecorView();
        Settings.FULL_SCREEN_REELS.save(true);
        int before = frameListeners(decor);
        FullScreenBars.track(activity);
        FullScreenBars.Session session = FullScreenBars.sessionFor(activity);
        assertEquals(before + 1, frameListeners(decor));
        frame(decor);
        assertTrue(session.checkQueued());

        FullScreenBars.release(activity);

        assertNull(FullScreenBars.sessionFor(activity));
        assertFalse("the waiting look went with it", session.checkQueued());
        assertEquals("and the frame listener", before, frameListeners(decor));
    }

    // ---------------------------------------------------------------- Find the reel you came from

    /** Opens the profile's screen right after the tap, its Reels grid holding [reels], on screen or not. */
    private void openProfile(List<String> reels, boolean onScreen) {
        profileController = Robolectric.buildActivity(Activity.class).setup();
        controllers.add(profileController);
        profile = profileController.get();
        FrameLayout root = new FrameLayout(profile);
        grid = new RecyclerView(profile);
        grid.tiles = id -> new ReelOriginTest.Tile(profile, shown);
        grid.reels.addAll(reels);
        if (!onScreen) grid.setVisibility(View.INVISIBLE);
        root.addView(grid, new FrameLayout.LayoutParams(1080, RecyclerView.ROW * RecyclerView.SHOWN_ROWS));
        profile.setContentView(root);
        grid.bind();
        layoutProfile();
    }

    private void layoutProfile() {
        ShadowLooper.idleMainLooper();
        View decor = profile.getWindow().getDecorView();
        decor.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(1920, View.MeasureSpec.EXACTLY));
        decor.layout(0, 0, 1080, 1920);
    }

    /** A held reel and its author's Reels tab resumed in the profile, with the grid not on screen yet. */
    private CountingTab waitingTab(BooleanSupplier on) {
        ReelOrigin.opening(new ReelOriginTest.Reel(REEL), ON);
        openProfile(List.of(REEL), false);
        CountingTab tab = new CountingTab(profile, grid);
        ReelOrigin.reelsTabResumed(tab, on);
        ShadowLooper.idleMainLooper();
        assertEquals("looked once", 1, tab.asked);
        return tab;
    }

    @Test public void aGridNotOnScreenWaitsForAFrameInsteadOfLookingOnATimer() {
        CountingTab tab = waitingTab(ON);

        idleSeconds(10);
        // Every WAIT_MS that would be more than thirty looks; a stray frame of the test's window is one more.
        assertTrue("it kept looking while nothing drew: " + tab.asked, tab.asked <= 3);
        assertTrue(shown.isEmpty());
        assertEquals("still held for when the grid shows", REEL, ReelOrigin.heldForTests());
        // One look waits for the next frame, so one frame listener is out for it.
        int waiting = frameListeners(grid);

        // The grid coming on screen draws a frame, and the search goes on from there.
        grid.setVisibility(View.VISIBLE);
        layoutProfile();
        frame(grid);
        idleSeconds(2);
        assertEquals(List.of(REEL), shown);
        assertNull(ReelOrigin.heldForTests());
        assertEquals("the waiting frame listener took itself off", waiting - 1, frameListeners(grid));
    }

    @Test public void aWaitingLookStopsWhenTheTabIsLeft() {
        CountingTab tab = waitingTab(ON);

        tab.resumed = false;
        frame(grid);
        idleSeconds(1);
        assertTrue(HookStatus.report().toString(), HookStatus.report().toString().contains(ReelOrigin.LEFT + " 1"));
        int asked = tab.asked;
        for (int i = 0; i < 5; i++) frame(grid);
        idleSeconds(10);
        assertEquals("no look after the tab was left", asked, tab.asked);
        assertEquals("the reel is kept for the next time the tab opens", REEL, ReelOrigin.heldForTests());
    }

    @Test public void aWaitingLookStopsWhenTheSwitchGoesOffAndNeverStartsWhilePaused() {
        AtomicBoolean on = new AtomicBoolean(true);
        CountingTab tab = waitingTab(on::get);

        on.set(false);
        frame(grid);
        idleSeconds(1);
        int asked = tab.asked;
        for (int i = 0; i < 5; i++) frame(grid);
        idleSeconds(10);
        assertEquals("no look with the switch off", asked, tab.asked);

        // Paused, the real switch reads off, so a tab resumed then never starts a look at all.
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        CountingTab paused = new CountingTab(profile, grid);
        ReelOrigin.reelsTabResumed(paused);
        frame(grid);
        idleSeconds(10);
        assertEquals("paused", 0, paused.asked);
    }

    @Test public void aWaitingLookStopsWhenTheProfileCloses() {
        CountingTab tab = waitingTab(ON);

        profileController.pause().stop().destroy();
        assertNull("leaving the profile drops the reel", ReelOrigin.heldForTests());
        int asked = tab.asked;
        idleSeconds(10);
        assertEquals("no look after the profile closed", asked, tab.asked);
    }
}
