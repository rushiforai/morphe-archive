/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.Settings;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class InstantLockTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        Settings.INSTANT_LOCK.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        Settings.INSTANT_LOCK.resetToDefault();
        HookStatus.clear();
    }

    @Test public void theUsersAutoLockStaysUntilTheSwitchIsOn() {
        assertFalse(Settings.INSTANT_LOCK.get());
        for (int seconds : new int[] {0, 60, 300, 3600, 18000}) assertEquals(seconds, InstantLock.autoLockIn(seconds));
    }

    @Test public void switchOnLocksAfterOneSecondWhateverAutoLockSays() {
        Settings.INSTANT_LOCK.save(true);
        // 0 is Auto-lock turned off, and Instant lock still locks.
        for (int seconds : new int[] {0, 1, 60, 300, 3600, 18000}) assertEquals(1, InstantLock.autoLockIn(seconds));
    }

    @Test public void aBrokenSwitchReadKeepsTheUsersAutoLock() {
        SettingReadsForTests.breakReads(Settings.INSTANT_LOCK);
        try {
            assertEquals(60, InstantLock.autoLockIn(60));
        } finally {
            SettingReadsForTests.mend(Settings.INSTANT_LOCK);
        }
    }
}
