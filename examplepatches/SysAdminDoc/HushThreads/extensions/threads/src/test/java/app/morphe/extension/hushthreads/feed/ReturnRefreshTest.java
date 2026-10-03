/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at d12e61b4 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.os.SystemClock;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowPausedSystemClock;

import java.util.Collections;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReturnRefreshTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Before as well as after, so a test that stopped half way, or another class, leaves nothing behind. */
    @Before @After public void restore() {
        PauseForTests.resume();
        Settings.BLOCK_RETURN_REFRESH.resetToDefault();
        Settings.RETURN_REFRESH_NO_LIMIT.resetToDefault();
        BaseSettings.DEBUG.resetToDefault();
        LogBufferManager.clearLogBuffer();
        ReturnRefresh.askAt(Long.MAX_VALUE, ReturnRefresh.HOT_START);
    }

    /** A return within ten minutes keeps the feed for its own checks, and only for those. */
    @Test public void aReturnWithinTenMinutesKeepsPositionForThatReturnOnly() {
        long back = 1_000 + 10 * 60 * 1000;
        assertFalse(ReturnRefresh.askAt(100, ReturnRefresh.HOT_START));
        ReturnRefresh.uiHidden(1_000);
        assertTrue(ReturnRefresh.askAt(back, ReturnRefresh.HOT_START));
        assertTrue(ReturnRefresh.askAt(back, ReturnRefresh.WARM_START));
        assertFalse(ReturnRefresh.askAt(back + ReturnRefresh.SAME_RETURN_MS + 1, ReturnRefresh.WARM_START));
        ReturnRefresh.uiHidden(1_000);
        assertFalse(ReturnRefresh.askAt(back + 1, ReturnRefresh.HOT_START));
    }

    /** With No time limit on, a return after any absence keeps the feed, for that return only. */
    @Test public void noTimeLimitKeepsTheFeedAfterAnyAbsence() {
        long back = 1_000 + 24L * 60 * 60 * 1000;
        Settings.RETURN_REFRESH_NO_LIMIT.save(true);
        ReturnRefresh.uiHidden(1_000);
        assertTrue(ReturnRefresh.askAt(back, ReturnRefresh.HOT_START));
        assertTrue(ReturnRefresh.askAt(back + 1, ReturnRefresh.WARM_START));
        assertFalse(ReturnRefresh.askAt(back + ReturnRefresh.SAME_RETURN_MS + 1, ReturnRefresh.WARM_START));
        Settings.BLOCK_RETURN_REFRESH.save(false);
        ReturnRefresh.uiHidden(1_000);
        assertFalse(ReturnRefresh.askAt(1_000 + 11 * 60 * 1000, ReturnRefresh.HOT_START));
        Settings.BLOCK_RETURN_REFRESH.save(true);
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        ReturnRefresh.uiHidden(1_000);
        assertFalse(ReturnRefresh.askAt(1_000 + 11 * 60 * 1000, ReturnRefresh.HOT_START));
    }

    /**
     * Threads checks up to four times as it comes back: the hot-start decision and the reset to
     * main feed from onStart, then the feed screen's warm-start check and For you's swap to the
     * posts fetched in the background. Whichever comes first decides, and the others of the same
     * return get its answer.
     */
    @Test public void everyCheckOfOneReturnGetsTheSameAnswer() {
        long back = 1_000 + 7 * 60 * 1000;
        ReturnRefresh.uiHidden(1_000);
        assertTrue(ReturnRefresh.askAt(back, ReturnRefresh.HOT_START));
        assertTrue("the reset of a 7-minute return went ahead", ReturnRefresh.askAt(back + 40, ReturnRefresh.RESET_TO_FEED));
        assertTrue("the warm-start check of a 7-minute return refreshed",
                ReturnRefresh.askAt(back + ReturnRefresh.SAME_RETURN_MS, ReturnRefresh.WARM_START));

        // 11 minutes away is past the window, so it holds only with No time limit, and then for all.
        back = 1_000 + 11 * 60 * 1000;
        ReturnRefresh.uiHidden(1_000);
        assertFalse(ReturnRefresh.askAt(back, ReturnRefresh.RESET_TO_FEED));
        assertFalse(ReturnRefresh.askAt(back + 40, ReturnRefresh.WARM_START));
        Settings.RETURN_REFRESH_NO_LIMIT.save(true);
        ReturnRefresh.uiHidden(1_000);
        assertTrue(ReturnRefresh.askAt(back, ReturnRefresh.WARM_START));
        assertTrue(ReturnRefresh.askAt(back + 40, ReturnRefresh.HOT_START));

        // A check after the return's own, a later onStart from another Threads screen, is Threads'.
        assertFalse(ReturnRefresh.askAt(back + ReturnRefresh.SAME_RETURN_MS + 1, ReturnRefresh.WARM_START));
        assertFalse(ReturnRefresh.askAt(back + ReturnRefresh.SAME_RETURN_MS + 2, ReturnRefresh.HOT_START));
    }

    /**
     * The reset and the warm-start check only ask when Threads was about to act: a false answer
     * stays false and counts nothing, so it can't use up the return either.
     */
    @Test public void onlyARefreshOrResetIsAQuestion() {
        HookStatus.clear();
        try {
            ReturnRefresh.uiHidden();
            assertFalse(ReturnRefresh.resetToFeed(false));
            assertFalse(ReturnRefresh.warmStart(false));
            String quiet = String.join("\n", HookStatus.report());
            assertFalse(quiet, quiet.contains(FamilyNames.RETURN_REFRESH));
            assertFalse("a refresh in the return was let through", ReturnRefresh.warmStart(true));
            assertFalse("a reset in the same return was let through", ReturnRefresh.resetToFeed(true));
            String report = String.join("\n", HookStatus.report());
            assertTrue(report, report.contains(FamilyNames.RETURN_REFRESH + ": invoked 2"));
            assertTrue(report, report.contains("kept the feed at warm start 1, kept the feed from the reset to feed 1"));
        } finally {
            HookStatus.clear();
        }
    }

    /**
     * For you's swap to the posts fetched in the background asks only when it was about to swap, and
     * gets the answer the return's first check gave: kept with the switch on, let through with it off.
     */
    @Test public void theSwapToBackgroundPostsGetsTheReturnsAnswer() {
        HookStatus.clear();
        try {
            ReturnRefresh.uiHidden();
            assertFalse(ReturnRefresh.cachedPosts(false));
            String quiet = String.join("\n", HookStatus.report());
            assertFalse(quiet, quiet.contains(FamilyNames.RETURN_REFRESH));
            assertTrue(ReturnRefresh.holdHotStart());
            assertFalse("the swap in a held return went ahead", ReturnRefresh.cachedPosts(true));
            String kept = String.join("\n", HookStatus.report());
            assertTrue(kept, kept.contains(FamilyNames.RETURN_REFRESH + ": invoked 2"));
            assertTrue(kept, kept.contains("kept the feed from the cached posts swap 1"));

            HookStatus.clear();
            Settings.BLOCK_RETURN_REFRESH.save(false);
            ReturnRefresh.uiHidden();
            assertTrue(ReturnRefresh.cachedPosts(true));
            String refused = String.join("\n", HookStatus.report());
            assertTrue(refused, refused.contains("let Threads refresh: switch off 1"));
        } finally {
            Settings.BLOCK_RETURN_REFRESH.resetToDefault();
            HookStatus.clear();
        }
    }

    /** With Debug logging on, each check names itself, how long Threads was away, and what it decided. */
    @Test public void eachDecisionIsLoggedWithDebugOn() {
        BaseSettings.DEBUG.save(true);
        LogBufferManager.clearLogBuffer();
        long back = 1_000 + 7 * 60 * 1000;
        ReturnRefresh.uiHidden(1_000);
        ReturnRefresh.askAt(back, ReturnRefresh.HOT_START);
        ReturnRefresh.askAt(back + 40, ReturnRefresh.WARM_START);
        ReturnRefresh.askAt(back + ReturnRefresh.SAME_RETURN_MS + 1, ReturnRefresh.WARM_START);
        ReturnRefresh.uiHidden(1_000);
        ReturnRefresh.askAt(1_000 + 11 * 60 * 1000, ReturnRefresh.HOT_START);
        ReturnRefresh.askAt(1_000 + 11 * 60 * 1000 + 30, ReturnRefresh.RESET_TO_FEED);
        String log = LogBufferManager.buildExportText();
        for (String line : new String[]{
                "Return refresh: Threads' screens were hidden",
                "Return refresh: hot start after 420 s away: keeping the feed",
                "Return refresh: warm start in the same return: keeping the feed",
                "Return refresh: warm start: Threads goes ahead, no return from the background",
                "Return refresh: hot start after 660 s away: Threads goes ahead, away over ten minutes",
                "Return refresh: reset to feed in the same return: Threads goes ahead, "
                        + "as the first check of this return decided"}) {
            assertTrue(line + " missing from:\n" + log, log.contains(line));
        }
    }

    @Test public void disabledOrPausedReturnsLetThreadsRefresh() {
        Settings.BLOCK_RETURN_REFRESH.save(false);
        ReturnRefresh.uiHidden(1_000);
        assertFalse(ReturnRefresh.askAt(1_001, ReturnRefresh.HOT_START));
        Settings.BLOCK_RETURN_REFRESH.save(true);
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        ReturnRefresh.uiHidden(2_000);
        assertFalse(ReturnRefresh.askAt(2_001, ReturnRefresh.WARM_START));
    }

    @Test public void clocksMovingBackCannotHoldTheFeed() {
        ReturnRefresh.uiHidden(2_000);
        assertFalse(ReturnRefresh.askAt(1_999, ReturnRefresh.HOT_START));
    }

    /**
     * A check that lets Threads refresh counts too, under its reason's own label, so a report from
     * someone whose feed keeps resetting says why.
     */
    @Test public void everyDecisionCountsBothWaysInTheReport() {
        HookStatus.clear();
        try {
            ReturnRefresh.uiHidden();
            assertTrue(ReturnRefresh.holdHotStart());
            assertFalse(ReturnRefresh.resetToFeed(true));
            assertFalse(ReturnRefresh.warmStart(true));
            String kept = String.join("\n", HookStatus.report());
            assertTrue(kept, kept.contains(FamilyNames.RETURN_REFRESH + ": invoked 3"));
            assertTrue(kept, kept.contains("kept the feed at hot start 1, kept the feed from the reset to feed 1, "
                    + "kept the feed at warm start 1"));

            HookStatus.clear();
            Settings.BLOCK_RETURN_REFRESH.save(false);
            ReturnRefresh.uiHidden();
            assertFalse(ReturnRefresh.holdHotStart());
            assertTrue(ReturnRefresh.resetToFeed(true));
            assertTrue(ReturnRefresh.warmStart(true));
            String refused = String.join("\n", HookStatus.report());
            assertTrue(refused, refused.contains(FamilyNames.RETURN_REFRESH + ": invoked 3"));
            assertTrue(refused, refused.contains("let Threads refresh: switch off 3"));
        } finally {
            Settings.BLOCK_RETURN_REFRESH.resetToDefault();
            HookStatus.clear();
        }
    }

    /**
     * An onStart with no background return, after another Threads screen closes, runs the "not a
     * return" branch. It isn't a decision, so it counts nothing beyond the invoke.
     */
    @Test public void aStartWithNoBackgroundReturnCountsNothingButInvoked() {
        HookStatus.clear();
        try {
            for (int i = 0; i < 5; i++) {
                assertFalse(ReturnRefresh.holdHotStart());
                assertTrue(ReturnRefresh.resetToFeed(true));
                assertTrue(ReturnRefresh.warmStart(true));
            }
            String report = String.join("\n", HookStatus.report());
            assertTrue(report, report.contains(FamilyNames.RETURN_REFRESH + ": invoked 15"));
            assertFalse(report, report.contains("let Threads refresh"));
            assertFalse(report, report.contains("kept the feed"));
        } finally {
            HookStatus.clear();
        }
    }

    /** Each fixed reason counts under its own label, and later checks of a return keep its reason. */
    @Test public void eachRefusalReasonCountsUnderItsOwnLabel() {
        HookStatus.clear();
        try {
            ReturnRefresh.uiHidden(Long.MAX_VALUE / 2);
            assertFalse(ReturnRefresh.holdHotStart());

            Settings.BLOCK_RETURN_REFRESH.save(false);
            ReturnRefresh.uiHidden();
            assertFalse(ReturnRefresh.holdHotStart());

            Settings.BLOCK_RETURN_REFRESH.save(true);
            PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
            ReturnRefresh.uiHidden();
            assertFalse(ReturnRefresh.holdHotStart());

            PauseForTests.resume();
            ReturnRefresh.uiHidden();
            SystemClock.sleep(11 * 60 * 1000L);
            assertFalse(ReturnRefresh.holdHotStart());
            assertTrue("a later check of the same return keeps the same reason", ReturnRefresh.warmStart(true));

            String report = String.join("\n", HookStatus.report());
            assertTrue(report, report.contains(FamilyNames.RETURN_REFRESH + ": invoked 5"));
            for (String label : new String[]{
                    "let Threads refresh: the clock went back 1",
                    "let Threads refresh: switch off 1",
                    "let Threads refresh: HushThreads paused 1",
                    "let Threads refresh: away over ten minutes 2"}) {
                assertTrue(report + "\nmissing: " + label, report.contains(label));
            }
        } finally {
            PauseForTests.resume();
            Settings.BLOCK_RETURN_REFRESH.resetToDefault();
            HookStatus.clear();
        }
    }

    /**
     * A failure inside the check lets Threads decide, as it would unpatched, and the report names
     * the hook that threw. The clock is what the check asks first once it has counted the call.
     */
    @Test @Config(shadows = FailingClock.class)
    public void aFailureLetsThreadsRefreshAndTheReportSaysSo() {
        HookStatus.clear();
        try {
            ReturnRefresh.uiHidden();
            assertTrue(ReturnRefresh.holdHotStart());

            ReturnRefresh.uiHidden();
            FailingClock.failNext = true;
            assertTrue(ReturnRefresh.warmStart(true));
            assertFalse("the check never asked the clock", FailingClock.failNext);
            assertEquals(Collections.singletonList("a working 'warm start' hook (it threw "
                            + IllegalStateException.class.getName() + ")"),
                    HookStatus.missing(FamilyNames.RETURN_REFRESH));
        } finally {
            FailingClock.failNext = false;
            HookStatus.clear();
        }
    }

    /** Robolectric's clock, except that the next elapsedRealtime() can be made to throw, once. */
    @Implements(SystemClock.class)
    public static class FailingClock extends ShadowPausedSystemClock {
        static volatile boolean failNext;

        @Implementation
        protected static long elapsedRealtime() {
            if (failNext) {
                failNext = false;
                throw new IllegalStateException("the clock failed");
            }
            return ShadowPausedSystemClock.elapsedRealtime();
        }
    }
}
