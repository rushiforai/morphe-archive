/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.os.Looper;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * The Stories tray count of both of the feed's tray adapters: 0 while the switch is on, a change
 * of the switch reaching the feed only through the adapter's own notifyDataSetChanged, and the
 * report counting each decision under the adapter's kind, and each one hidden.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class StoriesTrayTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_TOP_STORIES_TRAY.resetToDefault();
        Settings.HIDE_STORIES_BETWEEN_POSTS.resetToDefault();
        Settings.HIDE_STORIES_YOU_MIGHT_LIKE.resetToDefault();
        FeedFilter.storiesTrayInBuildForTests = null;
        FeedFilter.forgetTraysForTests();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    /** Stands in for a tray adapter: its notifyDataSetChanged() counts the calls. */
    public static final class Tray {
        int notified;

        public void notifyDataSetChanged() {
            notified++;
        }
    }

    private static void idle() {
        shadowOf(Looper.getMainLooper()).idle();
    }

    private static String line() {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(FeedFilter.TRAY_ROUTE + ": ")) return line;
        }
        return null;
    }

    /** Picking the patch is the choice to hide the tray, so its switch starts on. */
    @Test
    public void theSwitchStartsOnOnceThePatchIsPicked() {
        assertTrue(Settings.HIDE_TOP_STORIES_TRAY.defaultValue);
    }

    /** Each adapter decides at its first count and keeps that answer however often the feed asks. */
    @Test
    public void anAdapterCountsZeroWhileTheSwitchIsOnAndItsOwnCountOtherwise() {
        Tray legacy = new Tray();
        Tray unified = new Tray();
        for (int i = 0; i < 5; i++) assertEquals(0, FeedFilter.storiesTrayCount(legacy, FeedFilter.LEGACY_TRAY, 1));
        assertEquals(0, FeedFilter.storiesTrayCount(unified, FeedFilter.UNIFIED_TRAY, 3));
        assertEquals(FeedFilter.TRAY_ROUTE + ": 2 lists, 2 items, 2 removed. Last reason: unified adapter hidden. "
                + "Removed: legacy adapter hidden 1, unified adapter hidden 1. Kinds: legacy 1, unified 1", line());

        Settings.HIDE_TOP_STORIES_TRAY.save(false);
        assertEquals(1, FeedFilter.storiesTrayCount(new Tray(), FeedFilter.LEGACY_TRAY, 1));
        assertEquals(3, FeedFilter.storiesTrayCount(new Tray(), FeedFilter.UNIFIED_TRAY, 3));
    }

    /**
     * The feed reads its children's counts on every change and tells the list only what the child
     * said, so an adapter's answer changes only through its own notifyDataSetChanged: a count that
     * finds the switch changed keeps the answer the feed has and posts one change, which flips it
     * and tells the adapter. Both ways, and a switch put back before the change runs tells nothing.
     */
    @Test
    public void aChangedSwitchReachesTheFeedOnlyThroughTheAdaptersOwnNotify() {
        Tray tray = new Tray();
        assertEquals(0, FeedFilter.storiesTrayCount(tray, FeedFilter.LEGACY_TRAY, 1));
        Settings.HIDE_TOP_STORIES_TRAY.save(false);
        for (int i = 0; i < 3; i++) {
            assertEquals("still the answer the feed has", 0, FeedFilter.storiesTrayCount(tray, FeedFilter.LEGACY_TRAY, 1));
        }
        assertEquals(0, tray.notified);
        idle();
        assertEquals("one change for three counts", 1, tray.notified);
        assertEquals(1, FeedFilter.storiesTrayCount(tray, FeedFilter.LEGACY_TRAY, 1));

        Settings.HIDE_TOP_STORIES_TRAY.save(true);
        assertEquals(1, FeedFilter.storiesTrayCount(tray, FeedFilter.LEGACY_TRAY, 1));
        idle();
        assertEquals(2, tray.notified);
        assertEquals(0, FeedFilter.storiesTrayCount(tray, FeedFilter.LEGACY_TRAY, 1));

        Settings.HIDE_TOP_STORIES_TRAY.save(false);
        assertEquals(0, FeedFilter.storiesTrayCount(tray, FeedFilter.LEGACY_TRAY, 1));
        Settings.HIDE_TOP_STORIES_TRAY.save(true);
        idle();
        assertEquals(2, tray.notified);
        assertEquals(0, FeedFilter.storiesTrayCount(tray, FeedFilter.LEGACY_TRAY, 1));
    }

    /** Paused, a hidden tray comes back through the same change, and a new adapter is shown. */
    @Test
    public void pausedAHiddenTrayComesBack() {
        Tray tray = new Tray();
        assertEquals(0, FeedFilter.storiesTrayCount(tray, FeedFilter.UNIFIED_TRAY, 2));
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertEquals(0, FeedFilter.storiesTrayCount(tray, FeedFilter.UNIFIED_TRAY, 2));
        idle();
        assertEquals(1, tray.notified);
        assertEquals(2, FeedFilter.storiesTrayCount(tray, FeedFilter.UNIFIED_TRAY, 2));
        assertEquals(2, FeedFilter.storiesTrayCount(new Tray(), FeedFilter.UNIFIED_TRAY, 2));
    }

    /**
     * An adapter the feed can't be told about keeps the answer the feed has until Facebook
     * restarts, says why in Hook status, and stops asking.
     */
    @Test
    public void anAdapterThatCantTellTheFeedKeepsItsAnswer() {
        Object untold = new Object();
        assertEquals(0, FeedFilter.storiesTrayCount(untold, FeedFilter.LEGACY_TRAY, 1));
        Settings.HIDE_TOP_STORIES_TRAY.save(false);
        assertEquals(0, FeedFilter.storiesTrayCount(untold, FeedFilter.LEGACY_TRAY, 1));
        idle();
        for (int i = 0; i < 3; i++) assertEquals(0, FeedFilter.storiesTrayCount(untold, FeedFilter.LEGACY_TRAY, 1));
        assertTrue("asked again after it failed", shadowOf(Looper.getMainLooper()).isIdle());
        String status = String.join("\n", HookStatus.report());
        assertTrue(status, status.contains("stories tray recount"));
    }

    @Test
    public void bothAdaptersAreHiddenWhileTheSwitchIsOn() {
        for (int i = 0; i < 3; i++) assertTrue(FeedFilter.hideStoriesTray(FeedFilter.LEGACY_TRAY));
        assertTrue(FeedFilter.hideStoriesTray(FeedFilter.UNIFIED_TRAY));

        assertEquals(FeedFilter.TRAY_ROUTE + ": 4 lists, 4 items, 4 removed. Last reason: unified adapter hidden. "
                + "Removed: legacy adapter hidden 3, unified adapter hidden 1. Kinds: legacy 3, unified 1", line());
        assertTrue(String.join("\n", HookStatus.report()),
                HookStatus.report().contains(FamilyNames.STORIES_TRAY + ": invoked 4, 0 found, 0 missing"));
    }

    /** The mutation control: off, both adapters are shown and only the asking is counted. */
    @Test
    public void switchedOffBothAdaptersAreShown() {
        Settings.HIDE_TOP_STORIES_TRAY.save(false);
        assertFalse(FeedFilter.hideStoriesTray(FeedFilter.LEGACY_TRAY));
        assertFalse(FeedFilter.hideStoriesTray(FeedFilter.UNIFIED_TRAY));
        assertEquals(FeedFilter.TRAY_ROUTE + ": 2 lists, 2 items, 0 removed. Kinds: legacy 1, unified 1", line());
    }

    private static int occurrences(String text, String of) {
        int count = 0;
        for (int at = text.indexOf(of); at >= 0; at = text.indexOf(of, at + 1)) count++;
        return count;
    }

    /**
     * With debug logging on, the first time each adapter is hidden or kept says so once, which
     * tells a report which tray this phone builds. Off, nothing is logged and nothing remembered,
     * so turning logging on later still gets the lines.
     */
    @Test
    public void theDebugLineNamesEachAdapterAndWhatHappenedOnce() {
        FeedFilter.TRAY_LOGGED.set(0);
        LogBufferManager.clearLogBuffer();
        try {
            FeedFilter.hideStoriesTray(FeedFilter.LEGACY_TRAY);
            assertEquals("a line was remembered with debug logging off", 0, FeedFilter.TRAY_LOGGED.get());

            BaseSettings.DEBUG.save(true);
            for (int i = 0; i < 3; i++) FeedFilter.hideStoriesTray(FeedFilter.LEGACY_TRAY);
            FeedFilter.hideStoriesTray(FeedFilter.UNIFIED_TRAY);
            Settings.HIDE_TOP_STORIES_TRAY.save(false);
            FeedFilter.hideStoriesTray(FeedFilter.LEGACY_TRAY);
            FeedFilter.hideStoriesTray(FeedFilter.LEGACY_TRAY);

            String log = LogBufferManager.buildExportText();
            assertEquals(log, 1, occurrences(log, "Stories tray: hid the legacy adapter"));
            assertEquals(log, 1, occurrences(log, "Stories tray: hid the unified adapter"));
            assertEquals(log, 1, occurrences(log, "Stories tray: kept the legacy adapter"));
            assertEquals(log, 0, occurrences(log, "Stories tray: kept the unified adapter"));
        } finally {
            BaseSettings.DEBUG.resetToDefault();
            FeedFilter.TRAY_LOGGED.set(0);
            LogBufferManager.clearLogBuffer();
        }
    }

    @Test
    public void pausedBothAdaptersAreShown() {
        for (HushfacebookPause.Reason why : new HushfacebookPause.Reason[]{
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(why);
            assertFalse(why + " hid the legacy tray", FeedFilter.hideStoriesTray(FeedFilter.LEGACY_TRAY));
            assertFalse(why + " hid the unified tray", FeedFilter.hideStoriesTray(FeedFilter.UNIFIED_TRAY));
        }
        PauseForTests.resume();
        assertTrue("the tray hook didn't come back after the pause", FeedFilter.hideStoriesTray(FeedFilter.UNIFIED_TRAY));
    }

    private enum Category { ORGANIC }

    @Test
    public void allFourChoicesKeepTopAdaptersAndBetweenPostRowsIndependent() {
        FeedFilter.storiesTrayInBuildForTests = true;
        Object[] rows = {FeedGuardForTests.storiesRow(false), TypedFeedUnit.storiesTray(),
                new TypedFeedUnit("StoriesOneColumnOneRowLargeTileFeedUnit"),
                new TypedFeedUnit("StoriesSingleBucketInlineViewerFeedUnit")};
        for (boolean top : new boolean[]{false, true}) {
            for (boolean between : new boolean[]{false, true}) {
                Settings.HIDE_TOP_STORIES_TRAY.save(top);
                Settings.HIDE_STORIES_BETWEEN_POSTS.save(between);
                assertEquals(top, FeedFilter.hideStoriesTray(FeedFilter.LEGACY_TRAY));
                assertEquals(top, FeedFilter.hideStoriesTray(FeedFilter.UNIFIED_TRAY));
                for (Object row : rows) assertEquals(between, FeedFilter.hideEdge(Category.ORGANIC, row, false, false));
                assertFalse(FeedFilter.hideEdge(Category.ORGANIC, new TypedFeedUnit("Story"), false, false));
                assertFalse(FeedFilter.hideEdge(Category.ORGANIC, new TypedFeedUnit.Unreadable(), false, false));

                PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
                assertFalse(FeedFilter.hideStoriesTray(FeedFilter.LEGACY_TRAY));
                assertFalse(FeedFilter.hideStoriesTray(FeedFilter.UNIFIED_TRAY));
                for (Object row : rows) assertFalse(FeedFilter.hideEdge(Category.ORGANIC, row, false, false));
                assertEquals(top, Settings.HIDE_TOP_STORIES_TRAY.savedValue());
                assertEquals(between, Settings.HIDE_STORIES_BETWEEN_POSTS.savedValue());
                PauseForTests.resume();
            }
        }
    }

    @Test
    public void storiesYouMightLikeStaysIndependentOfBothNewChoices() {
        FeedFilter.storiesTrayInBuildForTests = true;
        for (boolean top : new boolean[]{false, true}) {
            Settings.HIDE_TOP_STORIES_TRAY.save(top);
            Settings.HIDE_STORIES_BETWEEN_POSTS.save(false);
            Settings.HIDE_STORIES_YOU_MIGHT_LIKE.save(true);
            assertTrue(FeedFilter.hideEdge(Category.ORGANIC, FeedGuardForTests.storiesRow(true), false, true));
            assertFalse(FeedFilter.hideEdge(Category.ORGANIC, FeedGuardForTests.storiesRow(false), false, true));
            Settings.HIDE_STORIES_YOU_MIGHT_LIKE.save(false);
            assertFalse(FeedFilter.hideEdge(Category.ORGANIC, FeedGuardForTests.storiesRow(true), false, true));
        }
    }
}
