package app.morphe.extension.tiktok.cleardisplay;

import static org.junit.Assert.*;
import android.os.Looper;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.settings.preference.categories.InterfacePreferenceCategory;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.After;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class AutomaticClearDisplayTest {
    @After public void tearDown() {
        SettingsStatus.automaticClearDisplayEnabled = false;
        // The live state is static and outlived every test: one asserted "not cleared" first
        // and passed only because JUnit ran it before the ones that clear.
        RememberClearDisplayPatch.resetForTests();
    }
    public static class Event {
        public boolean LIZ;
        public int LIZIZ;
        Event(boolean clear, int type) { LIZ = clear; LIZIZ = type; }
    }
    @Before public void setup() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        RememberClearDisplayPatch.resetForTests();
        Settings.AUTOMATIC_CLEAR_DISPLAY.save(false);
        Settings.CLEAR_DISPLAY.save(false);
        RememberClearDisplayPatch.firstFrame("reset", () -> true, value -> true);
        Settings.AUTOMATIC_CLEAR_DISPLAY.save(true);
        Settings.AUTOMATIC_CLEAR_DISPLAY_DELAY.save(1000);
    }
    /**
     * The daily hold's panel says messages, profiles and search still work, and clear display
     * takes away the tabs that lead there. So a hold going up gives the controls back, and while
     * it runs neither the automatic path nor a remembered clear display clears again. The choice
     * stays saved for the videos after the hold.
     */
    @Test public void theDailyHoldBringsTheControlsBackAndNothingClearsUnderIt() {
        org.robolectric.util.ReflectionHelpers.callStaticMethod(app.morphe.extension.tiktok.wellbeing.SessionBudget.class, "awaitWritesForTests");
        try {
            List<Boolean> events = new ArrayList<>();
            RememberClearDisplayPatch.firstFrame("before", () -> true, events::add);
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(1000));
            assertTrue("the fixture never cleared", RememberClearDisplayPatch.isClearDisplayNow());

            lockTheDay();
            RememberClearDisplayPatch.leaveForHold();
            assertFalse("the hold left the controls hidden", RememberClearDisplayPatch.isClearDisplayNow());

            events.clear();
            RememberClearDisplayPatch.firstFrame("held", () -> true, events::add);
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(2000));
            assertEquals("the automatic path cleared under the hold", List.of(false), events);
            assertFalse(RememberClearDisplayPatch.isClearDisplayNow());

            Settings.AUTOMATIC_CLEAR_DISPLAY.save(false);
            Settings.CLEAR_DISPLAY.save(true);
            events.clear();
            RememberClearDisplayPatch.firstFrame("remembered", () -> true, events::add);
            assertEquals("a remembered clear display cleared under the hold", List.of(), events);

            unlockTheDay();
            RememberClearDisplayPatch.firstFrame("after", () -> true, events::add);
            assertEquals("the remembered choice didn't come back after the hold", List.of(true), events);
        } finally {
            unlockTheDay();
        }
    }

    /** The feed lock covers the feed like the hold does, and needs the tabs just as much. */
    @Test public void theFeedLockStopsClearDisplayFromClearingTheFeedItCovers() {
        SettingsStatus.blockAuthorEnabled = true;
        Settings.FEED_LOCK.save(true);
        try {
            Settings.AUTOMATIC_CLEAR_DISPLAY.save(false);
            Settings.CLEAR_DISPLAY.save(true);
            List<Boolean> events = new ArrayList<>();
            RememberClearDisplayPatch.firstFrame("remembered", () -> true, events::add);
            assertEquals("a remembered clear display cleared under the feed lock", List.of(), events);

            Settings.AUTOMATIC_CLEAR_DISPLAY.save(true);
            Settings.AUTOMATIC_CLEAR_DISPLAY_DELAY.save(0);
            events.clear();
            RememberClearDisplayPatch.firstFrame("auto", () -> true, events::add);
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(2000));
            assertEquals("the automatic path cleared under the feed lock", List.of(false), events);

            Settings.FEED_LOCK.save(false);
            Settings.AUTOMATIC_CLEAR_DISPLAY.save(false);
            events.clear();
            RememberClearDisplayPatch.firstFrame("after", () -> true, events::add);
            assertEquals("the remembered choice didn't come back", List.of(true), events);
        } finally {
            Settings.FEED_LOCK.resetToDefault();
            Settings.CLEAR_DISPLAY.resetToDefault();
            SettingsStatus.blockAuthorEnabled = false;
        }
    }

    private static void lockTheDay() {
        Settings.SESSION_BUDGET_VIDEOS.save(1);
        Settings.SESSION_BUDGET_LOCK_MINUTES.save(5);
        app.morphe.extension.tiktok.wellbeing.SessionBudget.noteVideo("clear-display-held");
        assertTrue("the fixture's hold never started", app.morphe.extension.tiktok.wellbeing.SessionBudget.claimNotice());
        assertTrue(app.morphe.extension.tiktok.wellbeing.SessionBudget.isLocked());
    }

    private static void unlockTheDay() {
        Class<?> budget = app.morphe.extension.tiktok.wellbeing.SessionBudget.class;
        org.robolectric.util.ReflectionHelpers.callStaticMethod(budget, "awaitWritesForTests");
        Settings.SESSION_BUDGET_STATE.save("");
        Settings.SESSION_BUDGET_VIDEOS.resetToDefault();
        Settings.SESSION_BUDGET_LOCK_MINUTES.resetToDefault();
        org.robolectric.util.ReflectionHelpers.callStaticMethod(budget, "resetForTests");
    }

    @Test public void theAutomaticPathReportsClearDisplayEvenThoughItNeverWritesTheSetting() {
        // rememberClearDisplayEvent is the only writer of the setting, and it returns early
        // for anything posted from here, so the setting stays false through the whole
        // automatic path. Anything that needs to know whether the controls are hidden has
        // to ask for the live state instead.
        assertFalse(RememberClearDisplayPatch.isClearDisplayNow());

        List<Boolean> events = new ArrayList<>();
        RememberClearDisplayPatch.firstFrame("auto", () -> true, events::add);
        assertFalse("the controls are still up during the delay", RememberClearDisplayPatch.isClearDisplayNow());

        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(1000));
        assertEquals(List.of(false, true), events);
        assertTrue("the controls are hidden now", RememberClearDisplayPatch.isClearDisplayNow());
        assertFalse("and the setting still says nothing", Settings.CLEAR_DISPLAY.get());

        // This is what the tab strip hide reads, which is why it cannot read the setting.
        assertNotEquals(RememberClearDisplayPatch.isClearDisplayNow(), Settings.CLEAR_DISPLAY.get());
    }

    @Test public void aTapThatLeavesClearDisplayIsReportedToo() {
        List<Boolean> events = new ArrayList<>();
        RememberClearDisplayPatch.firstFrame("auto", () -> true, events::add);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(1000));
        assertTrue(RememberClearDisplayPatch.isClearDisplayNow());

        // TikTok posts its own event when the user taps to bring the controls back.
        RememberClearDisplayPatch.rememberClearDisplayEvent(new Event(false, 1));
        assertFalse(RememberClearDisplayPatch.isClearDisplayNow());
    }

    @Test public void waitsAndDoesNotRearmRepeatedFirstFrame() {
        List<Boolean> events = new ArrayList<>();
        RememberClearDisplayPatch.firstFrame("one", () -> true, events::add);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(999));
        assertEquals(List.of(false), events);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(1));
        assertEquals(List.of(false, true), events);
        RememberClearDisplayPatch.firstFrame("one", () -> true, events::add);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(2));
        assertEquals(List.of(false, true), events);
        assertFalse("an automatic clear was stored as the reader's own choice", Settings.CLEAR_DISPLAY.get());
    }
    @Test public void newVideoAndManualRestoreCancelPendingWork() {
        List<Boolean> old = new ArrayList<>(), next = new ArrayList<>();
        RememberClearDisplayPatch.firstFrame("one", () -> true, old::add);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(500));
        RememberClearDisplayPatch.firstFrame("two", () -> true, next::add);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(500));
        assertEquals(List.of(false), old);
        RememberClearDisplayPatch.rememberClearDisplayEvent(new Event(false, 0));
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(2));
        assertEquals(List.of(false), next);
        RememberClearDisplayPatch.firstFrame("two", () -> true, next::add);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(2));
        assertEquals(List.of(false), next);
        RememberClearDisplayPatch.firstFrame("three", () -> true, next::add);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
        assertEquals(List.of(false, false, true), next);
    }
    @Test public void disabledOrStalePlaybackDoesNotHideAndManualMemorySurvives() {
        List<Boolean> events = new ArrayList<>();
        RememberClearDisplayPatch.firstFrame("one", () -> false, events::add);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
        RememberClearDisplayPatch.firstFrame("two", () -> true, events::add);
        Settings.AUTOMATIC_CLEAR_DISPLAY.save(false);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
        assertEquals(List.of(false, false), events);
        RememberClearDisplayPatch.rememberClearDisplayEvent(new Event(true, 0));
        RememberClearDisplayPatch.rememberClearDisplayEvent(new Event(false, 3));
        assertTrue("the reader's clear display wasn't remembered", Settings.CLEAR_DISPLAY.get());
        assertTrue("an ignored event type took the live state away", RememberClearDisplayPatch.isClearDisplayNow());
        RememberClearDisplayPatch.firstFrame("three", () -> true, events::add);
        assertEquals(List.of(false, false, true), events);
    }
    /**
     * The switch-off branch ran only for items with an id, so an item with no id left the
     * controls hidden and the tab strip hide kept TikTok's top bar away there. It gives the
     * controls back to any item now; clearing still needs an id.
     */
    @Test public void switchingTheAutomaticPathOffGivesTheControlsBackOnAnItemWithNoId() {
        List<Boolean> events = new ArrayList<>();
        RememberClearDisplayPatch.firstFrame("one", () -> true, events::add);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(1000));
        assertTrue("the fixture never cleared", RememberClearDisplayPatch.isClearDisplayNow());

        Settings.AUTOMATIC_CLEAR_DISPLAY.save(false);
        events.clear();
        RememberClearDisplayPatch.firstFrame(null, () -> true, events::add);
        assertEquals("an item with no id kept the controls hidden", List.of(false), events);
        assertFalse(RememberClearDisplayPatch.isClearDisplayNow());

        // A remembered clear display still needs an id to clear.
        Settings.CLEAR_DISPLAY.save(true);
        events.clear();
        RememberClearDisplayPatch.firstFrame("", () -> true, events::add);
        assertEquals("an item with no id was cleared", List.of(), events);
    }

    /**
     * And with nothing switched off. A remembered clear display is posted per video with an id,
     * and TikTok gives the controls back on a new item by itself, so an item with no id after a
     * cleared one showed TikTok's controls while the live state still said hidden, and the tab
     * strip hide kept the top bar away there (refutation review of b172f2c5).
     */
    @Test public void aRememberedClearDisplayGivesTheControlsBackOnAnItemWithNoId() {
        Settings.AUTOMATIC_CLEAR_DISPLAY.save(false);
        Settings.CLEAR_DISPLAY.save(true);
        List<Boolean> events = new ArrayList<>();
        RememberClearDisplayPatch.firstFrame("one", () -> true, events::add);
        assertTrue(RememberClearDisplayPatch.isClearDisplayNow());

        RememberClearDisplayPatch.firstFrame(null, () -> true, events::add);
        assertEquals("an item with no id kept the remembered clear state", List.of(true, false), events);
        assertFalse(RememberClearDisplayPatch.isClearDisplayNow());

        RememberClearDisplayPatch.firstFrame("two", () -> true, events::add);
        assertEquals("the next video lost the remembered choice", List.of(true, false, true), events);
    }

    /**
     * A clear mode the user set through TikTok's own bar is theirs: an item with no id must not
     * undo it (refutation review of b5183ca7). Only the clears this patch makes are undone there.
     */
    @Test public void tikToksOwnClearModeStaysAcrossAnItemWithNoId() {
        Settings.AUTOMATIC_CLEAR_DISPLAY.save(false);
        List<Boolean> events = new ArrayList<>();
        RememberClearDisplayPatch.rememberClearDisplayEvent(new Event(true, 0));
        assertTrue(RememberClearDisplayPatch.isClearDisplayNow());

        RememberClearDisplayPatch.firstFrame(null, () -> true, events::add);
        assertEquals("an item with no id undid TikTok's own clear mode", List.of(), events);
        assertTrue(RememberClearDisplayPatch.isClearDisplayNow());
    }

    @Test public void theAutomaticPathGivesTheControlsBackOnAnItemWithNoId() {
        List<Boolean> events = new ArrayList<>();
        RememberClearDisplayPatch.firstFrame("one", () -> true, events::add);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(1000));
        assertTrue(RememberClearDisplayPatch.isClearDisplayNow());

        RememberClearDisplayPatch.firstFrame("", () -> true, events::add);
        assertEquals("an item with no id kept the automatic clear state", List.of(false, true, false), events);
        assertFalse(RememberClearDisplayPatch.isClearDisplayNow());
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(2));
        assertEquals("an item with no id was cleared", List.of(false, true, false), events);

        RememberClearDisplayPatch.firstFrame("two", () -> true, events::add);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(1000));
        assertEquals(List.of(false, true, false, false, true), events);
    }

    /**
     * Switched off while it had the controls hidden: TikTok shows them on the next video by
     * itself (S22, 2026-09-23), and the live state has to say so, or the tab strip hide keeps
     * TikTok's top strip away with the feature off. Once shown, later videos ask nothing more.
     */
    /**
     * With no delay the next video is cleared as soon as it starts, but TikTok's clear mode
     * belongs to one video, so between the swipe and that clear the incoming one would show its
     * controls (#84). The cleared state carries across the swipe until something asks for the
     * controls back.
     */
    @Test public void withNoDelayTheClearCarriesAcrossTheSwipe() {
        Settings.AUTOMATIC_CLEAR_DISPLAY_DELAY.save(0);
        List<Boolean> events = new ArrayList<>();
        assertFalse(RememberClearDisplayPatch.isCarryingClear());
        RememberClearDisplayPatch.firstFrame("one", () -> true, events::add);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertTrue(RememberClearDisplayPatch.isClearDisplayNow());
        assertTrue("the automatic clear isn't carried", RememberClearDisplayPatch.isCarryingClear());

        RememberClearDisplayPatch.firstFrame("two", () -> true, events::add);
        assertEquals(List.of(false, true, false), events);
        assertFalse(RememberClearDisplayPatch.isClearDisplayNow());
        assertTrue("the swipe dropped the carried clear", RememberClearDisplayPatch.isCarryingClear());
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(List.of(false, true, false, true), events);
        assertTrue(RememberClearDisplayPatch.isCarryingClear());

        // Restore display, or any change TikTok makes itself, ends it.
        RememberClearDisplayPatch.rememberClearDisplayEvent(new Event(false, 1));
        assertFalse("a manual restore kept the controls away", RememberClearDisplayPatch.isCarryingClear());
        RememberClearDisplayPatch.firstFrame("two", () -> true, events::add);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertFalse("the restore didn't stick", RememberClearDisplayPatch.isClearDisplayNow());
        assertFalse(RememberClearDisplayPatch.isCarryingClear());
        // The next video is cleared again, as before, and carries again.
        RememberClearDisplayPatch.firstFrame("three", () -> true, events::add);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertTrue(RememberClearDisplayPatch.isClearDisplayNow());
        assertTrue(RememberClearDisplayPatch.isCarryingClear());
    }

    /** The overlay hider keeps the incoming video's controls away while the clear carries. */
    @Test public void aCarriedClearHidesTheIncomingVideosControls() {
        Class<?> hider = app.morphe.extension.tiktok.feed.VideoOverlayHider.class;
        var name = org.robolectric.util.ReflectionHelpers.ClassParameter.from(String.class, "desc");
        int cellId = 0x7f0a0c31;
        int captionId = 0x7f0a0c32;
        org.robolectric.util.ReflectionHelpers.callStaticMethod(hider, "resolveForTests", name,
                org.robolectric.util.ReflectionHelpers.ClassParameter.from(int.class, captionId));
        org.robolectric.util.ReflectionHelpers.callStaticMethod(hider, "resolveForTests",
                org.robolectric.util.ReflectionHelpers.ClassParameter.from(String.class, "view_rootview"),
                org.robolectric.util.ReflectionHelpers.ClassParameter.from(int.class, cellId));
        try (var controller = Robolectric.buildActivity(android.app.Activity.class).setup()) {
            android.app.Activity activity = controller.get();
            Utils.setContext(activity);
            android.widget.FrameLayout root = new android.widget.FrameLayout(activity);
            android.widget.FrameLayout cell = new android.widget.FrameLayout(activity);
            cell.setId(cellId);
            android.view.View caption = new android.view.View(activity);
            caption.setId(captionId);
            cell.addView(caption);
            root.addView(cell);
            activity.setContentView(root);
            var apply = org.robolectric.util.ReflectionHelpers.ClassParameter.from(android.app.Activity.class, activity);

            Settings.AUTOMATIC_CLEAR_DISPLAY_DELAY.save(0);
            RememberClearDisplayPatch.firstFrame("one", () -> true, value -> true);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            RememberClearDisplayPatch.firstFrame("two", () -> true, value -> true);
            assertFalse(RememberClearDisplayPatch.isClearDisplayNow());
            org.robolectric.util.ReflectionHelpers.callStaticMethod(hider, "applyTo", apply);
            assertEquals("the incoming video showed its caption", android.view.View.GONE, caption.getVisibility());

            RememberClearDisplayPatch.rememberClearDisplayEvent(new Event(false, 1));
            org.robolectric.util.ReflectionHelpers.callStaticMethod(hider, "applyTo", apply);
            assertEquals("Restore display left the caption hidden", android.view.View.VISIBLE, caption.getVisibility());
        } finally {
            org.robolectric.util.ReflectionHelpers.callStaticMethod(hider, "resolveForTests",
                    org.robolectric.util.ReflectionHelpers.ClassParameter.from(String.class, "view_rootview"),
                    org.robolectric.util.ReflectionHelpers.ClassParameter.from(int.class, 0));
        }
    }

    @Test public void theCarriedClearNeedsNoDelayTheSwitchAndNoHold() {
        org.robolectric.util.ReflectionHelpers.callStaticMethod(app.morphe.extension.tiktok.wellbeing.SessionBudget.class, "awaitWritesForTests");
        Settings.AUTOMATIC_CLEAR_DISPLAY_DELAY.save(0);
        List<Boolean> events = new ArrayList<>();
        RememberClearDisplayPatch.firstFrame("one", () -> true, events::add);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertTrue(RememberClearDisplayPatch.isCarryingClear());

        // A delay means the reader wants a look at the controls first.
        Settings.AUTOMATIC_CLEAR_DISPLAY_DELAY.save(1000);
        assertFalse("carried with a delay chosen", RememberClearDisplayPatch.isCarryingClear());
        Settings.AUTOMATIC_CLEAR_DISPLAY_DELAY.save(0);
        assertTrue(RememberClearDisplayPatch.isCarryingClear());

        // Switched off, the next video shows its controls and nothing carries.
        Settings.AUTOMATIC_CLEAR_DISPLAY.save(false);
        assertFalse("carried with the switch off", RememberClearDisplayPatch.isCarryingClear());
        RememberClearDisplayPatch.firstFrame("two", () -> true, events::add);
        Settings.AUTOMATIC_CLEAR_DISPLAY.save(true);
        assertFalse("switching off didn't end the carry", RememberClearDisplayPatch.isCarryingClear());

        RememberClearDisplayPatch.firstFrame("three", () -> true, events::add);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertTrue(RememberClearDisplayPatch.isCarryingClear());
        try {
            lockTheDay();
            assertFalse("carried under the daily hold", RememberClearDisplayPatch.isCarryingClear());
            RememberClearDisplayPatch.leaveForHold();
            unlockTheDay();
            assertFalse("the hold didn't end the carry", RememberClearDisplayPatch.isCarryingClear());
        } finally {
            unlockTheDay();
        }
    }

    @Test public void switchingTheAutomaticPathOffShowsTheControlsOnTheNextVideo() {
        List<Boolean> events = new ArrayList<>();
        RememberClearDisplayPatch.firstFrame("one", () -> true, events::add);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(1000));
        assertTrue(RememberClearDisplayPatch.isClearDisplayNow());

        Settings.AUTOMATIC_CLEAR_DISPLAY.save(false);
        RememberClearDisplayPatch.firstFrame("two", () -> true, events::add);
        assertEquals(List.of(false, true, false), events);
        assertFalse(RememberClearDisplayPatch.isClearDisplayNow());

        RememberClearDisplayPatch.firstFrame("three", () -> true, events::add);
        assertEquals(List.of(false, true, false), events);
    }

    /**
     * A clear display the user chose is theirs, even where it isn't remembered: while Hushfeed
     * is paused TikTok's own clear mode is not saved, and switching nothing on or off must not
     * bring the controls back over it.
     */
    @Test public void aClearDisplayTheUserChoseIsLeftAloneWhilePaused() {
        List<Boolean> events = new ArrayList<>();
        // The automatic path hides the controls and the user brings them back with TikTok's X,
        RememberClearDisplayPatch.firstFrame("one", () -> true, events::add);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(1000));
        RememberClearDisplayPatch.rememberClearDisplayEvent(new Event(false, 0));
        app.morphe.extension.shared.settings.PausedProcess.set(true);
        try {
            // then, paused, hides them with TikTok's own mode, which a paused process doesn't save.
            RememberClearDisplayPatch.rememberClearDisplayEvent(new Event(true, 0));
            assertTrue(RememberClearDisplayPatch.isClearDisplayNow());
            RememberClearDisplayPatch.firstFrame("next", () -> true, events::add);
            assertEquals("nothing asked of TikTok on the next video", List.of(false, true), events);
            assertTrue(RememberClearDisplayPatch.isClearDisplayNow());
        } finally {
            app.morphe.extension.shared.settings.PausedProcess.set(false);
        }
    }

    @Test public void disablingAndReenablingBeforeTheDeadlineCancelsTheTimer() {
        List<Boolean> events = new ArrayList<>();
        RememberClearDisplayPatch.firstFrame("one", () -> true, events::add);
        Settings.AUTOMATIC_CLEAR_DISPLAY.save(false);
        Settings.AUTOMATIC_CLEAR_DISPLAY.save(true);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(2));
        assertEquals(List.of(false), events);
    }
    @Test public void leavingAndReturningBeforeTheDeadlineRearmsTheCurrentItem() {
        try (var owner = Robolectric.buildActivity(android.app.Activity.class).setup().visible()) {
            RememberClearDisplayPatch.observeWindow(owner.get().getWindow().getDecorView());
            List<Boolean> events = new ArrayList<>();
            RememberClearDisplayPatch.firstFrame("one", () -> true, events::add);
            owner.windowFocusChanged(false);
            owner.windowFocusChanged(true);
            RememberClearDisplayPatch.firstFrame("one", () -> true, events::add);
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(2));
            assertEquals(List.of(false, true), events);
        }
    }
    @Test public void aCancelledCallbackCannotApplyDuringTheNewAttemptsDelay() {
        List<Boolean> events = new ArrayList<>();
        RememberClearDisplayPatch.firstFrame("same", () -> true, events::add);
        Runnable cancelled = org.robolectric.util.ReflectionHelpers.getStaticField(
                RememberClearDisplayPatch.class, "pending");
        RememberClearDisplayPatch.cancel();
        RememberClearDisplayPatch.firstFrame("same", () -> true, events::add);
        cancelled.run();
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(999));
        assertEquals("the stale attempt cleared before the new delay", List.of(false), events);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(1));
        assertEquals(List.of(false, true), events);
    }
    @Test public void aReplacementWindowCanClearTheSameItemAgain() {
        try (var old = Robolectric.buildActivity(android.app.Activity.class).setup().visible();
             var replacement = Robolectric.buildActivity(android.app.Activity.class).setup().visible()) {
            List<Boolean> events = new ArrayList<>();
            RememberClearDisplayPatch.observeWindow(old.get().getWindow().getDecorView());
            RememberClearDisplayPatch.firstFrame("same", () -> true, events::add);
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
            RememberClearDisplayPatch.observeWindow(replacement.get().getWindow().getDecorView());
            RememberClearDisplayPatch.firstFrame("same", () -> true, events::add);
            assertEquals(List.of(false, true, false), events);
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
            assertEquals(List.of(false, true, false, true), events);
        }
    }
    @Test public void focusReturnAndWindowReplacementPreserveAManualExitOnTheSameItem() {
        try (var owner = Robolectric.buildActivity(android.app.Activity.class).setup().visible();
             var replacement = Robolectric.buildActivity(android.app.Activity.class).setup().visible()) {
            RememberClearDisplayPatch.observeWindow(owner.get().getWindow().getDecorView());
            List<Boolean> events = new ArrayList<>();
            RememberClearDisplayPatch.firstFrame("same", () -> true, events::add);
            RememberClearDisplayPatch.rememberClearDisplayEvent(new Event(false, 0));
            owner.windowFocusChanged(false);
            owner.windowFocusChanged(true);
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(2));
            RememberClearDisplayPatch.observeWindow(replacement.get().getWindow().getDecorView());
            RememberClearDisplayPatch.firstFrame("same", () -> true, events::add);
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(2));
            assertEquals("returning re-applied a clear the user exited", List.of(false), events);
            RememberClearDisplayPatch.firstFrame("next", () -> true, events::add);
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
            assertEquals(List.of(false, false, true), events);
        }
    }
    @Test public void focusReturnCanClearTheFirstItemAfterItsInitialAttemptHadNoFocus() {
        try (var owner = Robolectric.buildActivity(android.app.Activity.class).setup().visible()) {
            RememberClearDisplayPatch.observeWindow(owner.get().getWindow().getDecorView());
            owner.windowFocusChanged(false);
            var focused = new java.util.concurrent.atomic.AtomicBoolean(false);
            List<Boolean> events = new ArrayList<>();
            RememberClearDisplayPatch.firstFrame("first", focused::get, events::add);
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(2));
            assertEquals(List.of(false), events);

            focused.set(true);
            owner.windowFocusChanged(true);
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(999));
            assertEquals("focus return must retain the chosen delay", List.of(false), events);
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(1));
            assertEquals("the first item remained permanently ineligible", List.of(false, true), events);
        }
    }
    @Test public void aFailedClearDispatchCanRetryOnTheSameItem() {
        List<Boolean> events = new ArrayList<>();
        var fail = new java.util.concurrent.atomic.AtomicBoolean(true);
        RememberClearDisplayPatch.ClearEvent receiver = value -> {
            if (value && fail.getAndSet(false)) throw new IllegalStateException("receiver unavailable");
            return events.add(value);
        };
        RememberClearDisplayPatch.firstFrame("first", () -> true, receiver);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
        assertFalse("a failed dispatch was recorded as clear", RememberClearDisplayPatch.isClearDisplayNow());
        RememberClearDisplayPatch.firstFrame("first", () -> true, receiver);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
        assertEquals(List.of(false, true), events);
    }
    @Test public void aQueuedManualEventFromTheOldItemCannotCancelTheNextItem() throws Exception {
        List<Boolean> events = new ArrayList<>();
        RememberClearDisplayPatch.firstFrame("old", () -> true, events::add);
        Thread delivery = new Thread(() ->
                RememberClearDisplayPatch.rememberClearDisplayEvent(new Event(false, 0)));
        delivery.start();
        delivery.join();
        RememberClearDisplayPatch.firstFrame("next", () -> true, events::add);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
        assertEquals("old event delivery cancelled the next item's timer", List.of(false, false, true), events);
    }

    @Test public void rejectedNativeEntryRetriesOnMatchingProgressWithoutRepeatingTheChosenDelay() {
        Object controller = new Object();
        org.robolectric.util.ReflectionHelpers.setStaticField(RememberClearDisplayPatch.class,
                "currentController", new java.lang.ref.WeakReference<>(controller));
        var ready = new java.util.concurrent.atomic.AtomicBoolean();
        List<Boolean> events = new ArrayList<>();
        RememberClearDisplayPatch.firstFrame("first", () -> true, value -> {
            events.add(value);
            Event ownEvent = new Event(value, 0);
            RememberClearDisplayPatch.beginNativeDispatch(ownEvent, value);
            RememberClearDisplayPatch.rememberClearDisplayEvent(ownEvent);
            return !value || ready.get();
        });
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
        assertFalse("posting without applying claimed success", RememberClearDisplayPatch.isClearDisplayNow());
        assertFalse(org.robolectric.util.ReflectionHelpers.getStaticField(RememberClearDisplayPatch.class, "applied"));
        ready.set(true);
        RememberClearDisplayPatch.onPlaybackProgress(new Object(), "first");
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        RememberClearDisplayPatch.onPlaybackProgress(controller, "other");
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(List.of(false, true), events);
        RememberClearDisplayPatch.onPlaybackProgress(controller, "first");
        RememberClearDisplayPatch.onPlaybackProgress(controller, "first");
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("retry must coalesce and retain the elapsed deadline", List.of(false, true, true), events);
        assertTrue(RememberClearDisplayPatch.isClearDisplayNow());
        RememberClearDisplayPatch.onPlaybackProgress(controller, "first");
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(3, events.size());
    }

    @Test public void canceledOrManualOrDisabledEntryNeverRetriesFromQueuedProgress() {
        for (int stop = 0; stop < 4; stop++) {
            RememberClearDisplayPatch.resetForTests();
            Settings.AUTOMATIC_CLEAR_DISPLAY.save(true);
            Object controller = new Object();
            org.robolectric.util.ReflectionHelpers.setStaticField(RememberClearDisplayPatch.class,
                    "currentController", new java.lang.ref.WeakReference<>(controller));
            List<Boolean> events = new ArrayList<>();
            RememberClearDisplayPatch.firstFrame("first", () -> true, value -> {
                events.add(value);
                return !value;
            });
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
            RememberClearDisplayPatch.onPlaybackProgress(controller, "first");
            if (stop == 0) RememberClearDisplayPatch.cancel();
            else if (stop == 1) RememberClearDisplayPatch.rememberClearDisplayEvent(new Event(false, 2));
            else if (stop == 2) Settings.AUTOMATIC_CLEAR_DISPLAY.save(false);
            else app.morphe.extension.shared.settings.PausedProcess.set(true);
            try {
                Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(2));
                assertEquals("withdrawn request retried: " + stop, List.of(false, true), events);
            } finally { app.morphe.extension.shared.settings.PausedProcess.set(false); }
        }
    }

    public static final class NativeItem {
        public String getAid() { return "same"; }
    }
    public static final class NativeCell {
        NativeItem item = new NativeItem();
        public NativeItem getAweme() { return item; }
    }

    @Test public void onlyTheDispatchedEventAndCurrentCellCanAcknowledgeNativeCompletion() {
        try (var current = Robolectric.buildActivity(android.app.Activity.class).setup().visible()) {
            current.windowFocusChanged(true);
            RememberClearDisplayPatch.observeWindow(current.get().getWindow().getDecorView());
            RememberClearDisplayPatch.firstFrame("same", () -> true, value -> true);
            Object event = new Object();
            NativeCell cell = new NativeCell();
            Object controller = new Object();
            org.robolectric.util.ReflectionHelpers.setStaticField(RememberClearDisplayPatch.class,
                    "currentController", new java.lang.ref.WeakReference<>(controller));
            org.robolectric.util.ReflectionHelpers.setStaticField(RememberClearDisplayPatch.class,
                    "currentModel", new java.lang.ref.WeakReference<>(cell.item));
            RememberClearDisplayPatch.beginNativeDispatch(event, true);
            RememberClearDisplayPatch.beforeNativeApply(new Object(), cell, controller);
            RememberClearDisplayPatch.onNativeApplied(cell, true);
            assertFalse(RememberClearDisplayPatch.finishNativeDispatch());
            RememberClearDisplayPatch.beforeNativeApply(event, cell, new Object());
            RememberClearDisplayPatch.onNativeApplied(cell, true);
            assertFalse("same model on another controller acknowledged", RememberClearDisplayPatch.finishNativeDispatch());
            NativeCell sameId = new NativeCell();
            RememberClearDisplayPatch.beforeNativeApply(event, sameId, controller);
            RememberClearDisplayPatch.onNativeApplied(sameId, true);
            assertFalse("same ID on another model acknowledged", RememberClearDisplayPatch.finishNativeDispatch());
            RememberClearDisplayPatch.beforeNativeApply(event, cell, controller);
            assertFalse("the early native return acknowledged", RememberClearDisplayPatch.finishNativeDispatch());
            RememberClearDisplayPatch.onNativeApplied(new NativeCell(), true);
            RememberClearDisplayPatch.onNativeApplied(cell, false);
            assertFalse(RememberClearDisplayPatch.finishNativeDispatch());
            RememberClearDisplayPatch.onNativeApplied(cell, true);
            assertTrue(RememberClearDisplayPatch.finishNativeDispatch());
            RememberClearDisplayPatch.beforeNativeApply(event, new NativeCell(), new Object());
            RememberClearDisplayPatch.beforeNativeApply(new Object(), cell, controller);
            assertTrue("another subscriber discarded the current cell's completion",
                    RememberClearDisplayPatch.finishNativeDispatch());
            NativeCell replacement = new NativeCell();
            replacement.item = cell.item;
            RememberClearDisplayPatch.beforeNativeApply(event, replacement, controller);
            assertFalse("replacement cell reused the previous cell's completion",
                    RememberClearDisplayPatch.finishNativeDispatch());
            RememberClearDisplayPatch.onNativeApplied(replacement, true);
            assertTrue(RememberClearDisplayPatch.finishNativeDispatch());
            RememberClearDisplayPatch.cancel();
            assertFalse("a canceled generation acknowledged", RememberClearDisplayPatch.finishNativeDispatch());
        }
    }

    @Test public void nativeCompletionCannotAcknowledgeAReplacedOwnerOrItemOrLostEligibility() {
        for (int stale = 0; stale < 5; stale++) {
            RememberClearDisplayPatch.resetForTests();
            var eligible = new java.util.concurrent.atomic.AtomicBoolean(true);
            RememberClearDisplayPatch.firstFrame("same", eligible::get, value -> true);
            Object controller = new Object();
            NativeCell cell = new NativeCell();
            org.robolectric.util.ReflectionHelpers.setStaticField(RememberClearDisplayPatch.class,
                    "currentController", new java.lang.ref.WeakReference<>(controller));
            org.robolectric.util.ReflectionHelpers.setStaticField(RememberClearDisplayPatch.class,
                    "currentModel", new java.lang.ref.WeakReference<>(cell.item));
            Object event = new Object();
            RememberClearDisplayPatch.beginNativeDispatch(event, true);
            RememberClearDisplayPatch.beforeNativeApply(event, cell, controller);
            RememberClearDisplayPatch.onNativeApplied(cell, true);
            assertTrue(RememberClearDisplayPatch.finishNativeDispatch());
            if (stale == 0) org.robolectric.util.ReflectionHelpers.setStaticField(RememberClearDisplayPatch.class,
                    "currentController", new java.lang.ref.WeakReference<>(new Object()));
            else if (stale == 1) org.robolectric.util.ReflectionHelpers.setStaticField(RememberClearDisplayPatch.class,
                    "currentModel", new java.lang.ref.WeakReference<>(new NativeItem()));
            else if (stale == 2) eligible.set(false);
            else if (stale == 3) cell.item = new NativeItem();
            else org.robolectric.util.ReflectionHelpers.setStaticField(RememberClearDisplayPatch.class, "activeId", "other");
            RememberClearDisplayPatch.onNativeApplied(cell, true);
            assertFalse("stale native completion was accepted: " + stale, RememberClearDisplayPatch.finishNativeDispatch());
        }
    }

    @Test public void aForeignManualExitDuringDispatchCancelsTheAutomaticRequest() {
        for (boolean accepted : new boolean[] {false, true}) {
            RememberClearDisplayPatch.resetForTests();
            Object controller = new Object();
            org.robolectric.util.ReflectionHelpers.setStaticField(RememberClearDisplayPatch.class,
                    "currentController", new java.lang.ref.WeakReference<>(controller));
            List<Boolean> events = new ArrayList<>();
            RememberClearDisplayPatch.firstFrame("same", () -> true, value -> {
                events.add(value);
                RememberClearDisplayPatch.beginNativeDispatch(new Event(value, 0), value);
                if (value) RememberClearDisplayPatch.rememberClearDisplayEvent(new Event(false, 2));
                return accepted;
            });
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
            RememberClearDisplayPatch.onPlaybackProgress(controller, "same");
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(2));
            assertEquals(List.of(false, true), events);
            assertFalse(RememberClearDisplayPatch.isClearDisplayNow());
            assertFalse(Settings.CLEAR_DISPLAY.get());
        }
    }
    @Test public void standaloneControlsShowDelayInMilliseconds() throws Exception {
        boolean overlays = SettingsStatus.videoOverlaysEnabled;
        try (var owner = Robolectric.buildActivity(
                app.morphe.extension.tiktok.interaction.GestureActionsTest.TestActivity.class).setup()) {
            var activity = owner.get();
            Utils.setContext(activity);
            Utils.setIsDarkModeEnabled(true);
            SettingsStatus.videoOverlaysEnabled = true;
            SettingsStatus.automaticClearDisplayEnabled = true;
            var screen = activity.getPreferenceManager().createPreferenceScreen(activity);
            new InterfacePreferenceCategory(activity, screen);
            assertNotNull(screen.findPreference("automatic_clear_display"));
            var clearDisplayControls = screen.findPreference(Settings.HIDE_CLEAR_DISPLAY_CONTROLS.key);
            assertTrue(clearDisplayControls.getSummary().toString().contains("pinch the screen"));
            // "ms" is a developer's unit. The row says the word.
            assertTrue(screen.findPreference("automatic_clear_display_delay")
                    .getSummary().toString().contains("1,000 milliseconds"));
            activity.setPreferenceScreen(screen);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            app.morphe.extension.tiktok.UiCapture.save(activity.getWindow().getDecorView(), "clear-display-settings.png");
            app.morphe.extension.tiktok.UiCapture.save(
                    clearDisplayControls.getView(null, activity.getListView()),
                    "clear-display-controls-setting.png");
        } finally {
            SettingsStatus.videoOverlaysEnabled = overlays;
        }
    }
    @Test public void hidingTheControlsSitsUnderTheAutomaticSwitch() throws Exception {
        // It sat at the end of Around the video, where the #84 reporter couldn't find it next to
        // the switch it goes with.
        boolean overlays = SettingsStatus.videoOverlaysEnabled;
        try (var owner = Robolectric.buildActivity(
                app.morphe.extension.tiktok.interaction.GestureActionsTest.TestActivity.class).setup()) {
            var activity = owner.get();
            Utils.setContext(activity);
            SettingsStatus.videoOverlaysEnabled = true;
            SettingsStatus.automaticClearDisplayEnabled = true;
            List<String> titles = feedScreenTitles(activity);
            int heading = titles.indexOf("Clear display");
            assertTrue(titles.toString(), heading >= 0);
            assertEquals(List.of("Clear display", "Automatic clear display", "Clear display delay",
                    "Hide the Clear display controls"), titles.subList(heading, heading + 4));
            assertEquals(1, titles.stream().filter("Hide the Clear display controls"::equals).count());

            // The row belongs to the overlay patch, so a bundle without the automatic one still
            // shows it, under its own heading.
            SettingsStatus.automaticClearDisplayEnabled = false;
            titles = feedScreenTitles(activity);
            heading = titles.indexOf("Clear display");
            assertTrue(titles.toString(), heading >= 0);
            assertEquals("Hide the Clear display controls", titles.get(heading + 1));
            assertFalse(titles.contains("Automatic clear display"));
        } finally {
            SettingsStatus.videoOverlaysEnabled = overlays;
        }
    }

    private static List<String> feedScreenTitles(android.preference.PreferenceActivity activity) {
        var screen = activity.getPreferenceManager().createPreferenceScreen(activity);
        var category = new InterfacePreferenceCategory(activity, screen);
        List<String> titles = new ArrayList<>();
        for (int i = 0; i < category.getPreferenceCount(); i++) {
            titles.add(String.valueOf(category.getPreference(i).getTitle()));
        }
        return titles;
    }
}
