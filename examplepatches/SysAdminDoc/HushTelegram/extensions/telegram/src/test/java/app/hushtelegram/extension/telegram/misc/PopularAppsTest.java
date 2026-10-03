/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Collections;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PopularAppsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        Settings.HIDE_POPULAR_APPS.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_POPULAR_APPS);
        Settings.HIDE_POPULAR_APPS.resetToDefault();
        HookStatus.clear();
    }

    @Test public void onByDefaultTheListIsNeitherLoadedNorDrawn() {
        assertTrue(Settings.HIDE_POPULAR_APPS.get());
        assertTrue(PopularApps.skipLoad());
        assertTrue(PopularApps.hideSection());
        assertEquals(Collections.singletonList("Hide popular apps: invoked 2, 0 found, 0 missing. "
                + "Counted: popular apps load skipped 1, popular apps section hidden 1"), HookStatus.report());
    }

    @Test public void switchedOffTheTabLoadsAndDrawsItAsTelegramDoes() {
        Settings.HIDE_POPULAR_APPS.save(false);
        assertFalse(PopularApps.skipLoad());
        assertFalse(PopularApps.hideSection());
        assertEquals(Collections.singletonList("Hide popular apps: invoked 2, 0 found, 0 missing"), HookStatus.report());
    }

    @Test public void everyPauseReasonBringsTheListBackAndResumeHidesItAgain() {
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), PopularApps.skipLoad());
            assertFalse(reason.name(), PopularApps.hideSection());
            PauseForTests.resume();
        }
        assertTrue(PopularApps.skipLoad());
        assertTrue(PopularApps.hideSection());
    }

    @Test public void unavailableSettingsShowTheList() {
        SettingsContextRule.withoutContext(() -> {
            assertFalse(PopularApps.skipLoad());
            assertFalse(PopularApps.hideSection());
        });
    }

    @Test public void unreadableSettingFailsOpenAndReportsItsStateFailure() {
        SettingReadsForTests.breakReads(Settings.HIDE_POPULAR_APPS);
        assertFalse(PopularApps.skipLoad());
        assertFalse(PopularApps.hideSection());
        assertEquals(Collections.singletonList("a working 'switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.HIDE_POPULAR_APPS));
    }
}
