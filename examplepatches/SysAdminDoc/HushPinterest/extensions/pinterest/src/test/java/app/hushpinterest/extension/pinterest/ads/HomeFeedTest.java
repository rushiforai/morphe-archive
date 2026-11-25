/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Collections;
import java.util.HashMap;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/**
 * Keep Home feed's two holds: the return check that reloads Home after five minutes away, and
 * the refresh every Home reload goes through. A call with mask bit 0x2 passes no map at all, the
 * way the new pins prompt and the other reloads you ask for call it, and a call with a map of pins
 * is loading those pins, so both always pass.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class HomeFeedTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.KEEP_HOME_FEED.resetToDefault();
        Settings.BACK_LEAVES_HOME.resetToDefault();
        Settings.HIDE_REFRESH_PILL.resetToDefault();
        HookStatus.clear();
    }

    private static String line() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.KEEP_HOME_FEED + ":")) return line;
        }
        return "";
    }

    @Test public void offToStartSoHomeRefreshesAsPinterestDoes() {
        assertFalse(Settings.KEEP_HOME_FEED.get());
        assertFalse(HomeFeed.holdResumeRefresh(HomeFeed.AWAY_MS + 1));
        assertFalse(HomeFeed.holdHomeRefresh(null, 1));
        assertFalse(HomeFeed.holdHomeRefresh(null, 3));
    }

    @Test public void onHoldsTheReturnCheckAndTheAutomaticRefreshes() {
        Settings.KEEP_HOME_FEED.save(true);
        assertTrue(HomeFeed.holdResumeRefresh(HomeFeed.AWAY_MS + 1));
        assertTrue(HomeFeed.holdResumeRefresh(6 * 60 * 60 * 1000L));
        // Mask 1: the sticky refresh event and its replay. 0: every argument given, still no map.
        assertTrue(HomeFeed.holdHomeRefresh(null, 1));
        assertTrue(HomeFeed.holdHomeRefresh(Collections.emptyMap(), 1));
        assertTrue(HomeFeed.holdHomeRefresh(null, 0));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, line().contains("refresh on return held"));
        assertTrue(report, line().contains("automatic refresh held"));
    }

    /** Pinterest refreshes nothing on a return within five minutes, so nothing is held or counted. */
    @Test public void aShortReturnRunsAsPinterestWroteIt() {
        Settings.KEEP_HOME_FEED.save(true);
        assertFalse(HomeFeed.holdResumeRefresh(0));
        assertFalse(HomeFeed.holdResumeRefresh(90_000));
        assertFalse(HomeFeed.holdResumeRefresh(HomeFeed.AWAY_MS));
        assertFalse(line(), line().contains("refresh on return held"));
    }

    @Test public void theNewPinsPromptAndItsPinsAlwaysLoad() {
        Settings.KEEP_HOME_FEED.save(true);
        assertFalse(HomeFeed.holdHomeRefresh(null, 2));
        assertFalse(HomeFeed.holdHomeRefresh(null, 3));
        HashMap<String, Object> pins = new HashMap<>();
        pins.put("pin_ids", "1,2");
        assertFalse(HomeFeed.holdHomeRefresh(pins, 1));
        assertFalse(HomeFeed.holdHomeRefresh(pins, 0));
    }

    @Test public void pausedHomeRefreshesAsPinterestDoes() {
        Settings.KEEP_HOME_FEED.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertFalse(HomeFeed.holdResumeRefresh(HomeFeed.AWAY_MS + 1));
        assertFalse(HomeFeed.holdHomeRefresh(null, 1));
    }

    /** #36: off to start, Back on a scrolled-down Home jumps to the top and refreshes as Pinterest wrote it. */
    @Test public void backJumpsToTheTopUntilItsSwitchIsOn() {
        assertFalse(Settings.BACK_LEAVES_HOME.get());
        assertFalse(HomeFeed.leave());
        // Keep Home feed's own switch doesn't turn it on.
        Settings.KEEP_HOME_FEED.save(true);
        assertFalse(HomeFeed.leave());
        assertFalse(line(), line().contains("Back left Home"));
    }

    @Test public void onBackLeavesHomeWithKeepHomeFeedOnOrOff() {
        Settings.BACK_LEAVES_HOME.save(true);
        assertTrue(HomeFeed.leave());
        Settings.KEEP_HOME_FEED.save(true);
        assertTrue(HomeFeed.leave());
        assertTrue(line(), line().contains("Back left Home"));
        // The two holds still answer to Keep Home feed alone.
        Settings.KEEP_HOME_FEED.save(false);
        assertFalse(HomeFeed.holdHomeRefresh(null, 1));
    }

    @Test public void pausedBackJumpsToTheTop() {
        Settings.BACK_LEAVES_HOME.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertFalse(HomeFeed.leave());
    }

    /** #48: off to start, Home shows its refresh pill, and Keep Home feed's own switch doesn't hide it. */
    @Test public void theRefreshPillShowsUntilItsSwitchIsOn() {
        assertFalse(Settings.HIDE_REFRESH_PILL.get());
        assertFalse(HomeFeed.hideRefreshPill());
        Settings.KEEP_HOME_FEED.save(true);
        assertFalse(HomeFeed.hideRefreshPill());
        assertFalse(line(), line().contains("refresh pill hidden"));
    }

    @Test public void onTheRefreshPillIsHiddenAndCounted() {
        Settings.HIDE_REFRESH_PILL.save(true);
        assertTrue(HomeFeed.hideRefreshPill());
        assertTrue(line(), line().contains("refresh pill hidden"));
        // The pill's switch holds no refresh of its own.
        assertFalse(HomeFeed.holdHomeRefresh(null, 1));
        assertFalse(HomeFeed.leave());
    }

    @Test public void pausedTheRefreshPillShows() {
        Settings.HIDE_REFRESH_PILL.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertFalse(HomeFeed.hideRefreshPill());
    }
}
