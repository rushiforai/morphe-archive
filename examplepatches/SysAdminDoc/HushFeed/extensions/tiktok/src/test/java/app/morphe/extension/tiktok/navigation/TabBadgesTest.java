/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.navigation;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.view.View;

import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.PausedProcess;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.Settings;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** The unread badges on the bottom tabs, answered in the tab icon's own visibility setters. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class TabBadgesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After public void tearDown() {
        Settings.HIDE_TAB_BADGES.resetToDefault();
        PausedProcess.set(false);
        HookStatus.clear();
    }

    @Test public void offTheBadgesShowAsTikTokAsks() {
        assertEquals(View.VISIBLE, TabBadges.countDotVisibility(View.VISIBLE));
        assertEquals(View.INVISIBLE, TabBadges.countDotVisibility(View.INVISIBLE));
        assertEquals(View.VISIBLE, TabBadges.tabDotVisibility(View.VISIBLE));
        assertEquals(View.GONE, TabBadges.tabDotVisibility(View.GONE));
    }

    @Test public void onEveryShowIsGoneHoweverOftenTikTokAsks() {
        Settings.HIDE_TAB_BADGES.save(true);
        assertEquals(View.GONE, TabBadges.countDotVisibility(View.VISIBLE));
        assertEquals(View.GONE, TabBadges.tabDotVisibility(View.VISIBLE));
        // A native update after the hide: the answer is the same, so nothing comes back.
        assertEquals(View.GONE, TabBadges.countDotVisibility(View.VISIBLE));
        assertEquals(View.GONE, TabBadges.countDotVisibility(View.INVISIBLE));
        assertEquals(View.GONE, TabBadges.tabDotVisibility(View.GONE));
    }

    @Test public void pausedTheBadgesShowAgain() {
        Settings.HIDE_TAB_BADGES.save(true);
        PausedProcess.set(true);
        assertEquals(View.VISIBLE, TabBadges.countDotVisibility(View.VISIBLE));
        assertEquals(View.VISIBLE, TabBadges.tabDotVisibility(View.VISIBLE));
    }

    @Test public void theExportNamesTheFamilyOnceItWasReached() {
        TabBadges.countDotVisibility(View.VISIBLE);
        TabBadges.tabDotVisibility(View.GONE);
        assertTrue(HookStatus.report().toString(),
                HookStatus.report().stream().anyMatch(line -> line.startsWith(TabBadges.FAMILY + ": 2 found, 0 missing")));
    }
}
