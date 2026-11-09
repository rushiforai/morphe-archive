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
public class UploadSpeedTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        Settings.FASTER_UPLOADS.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        Settings.FASTER_UPLOADS.resetToDefault();
        HookStatus.clear();
    }

    @Test public void telegramsOwnLimitStaysUntilTheSwitchIsOn() {
        assertFalse(Settings.FASTER_UPLOADS.get());
        for (int count : new int[] {1, 2, 16}) assertEquals(count, UploadSpeed.requests(count));
    }

    @Test public void switchOnMultipliesTheLimitButNotPastTheCap() {
        Settings.FASTER_UPLOADS.save(true);
        assertEquals("a slow network's single request stays one", 1, UploadSpeed.requests(1));
        assertEquals(8, UploadSpeed.requests(2));
        assertEquals(64, UploadSpeed.requests(16));
        assertEquals(64, UploadSpeed.requests(40));
        assertEquals("a limit already above the cap isn't lowered", 100, UploadSpeed.requests(100));
        assertEquals(0, UploadSpeed.requests(0));
    }

    @Test public void aBrokenSwitchReadKeepsTelegramsLimit() {
        SettingReadsForTests.breakReads(Settings.FASTER_UPLOADS);
        try {
            assertEquals(16, UploadSpeed.requests(16));
        } finally {
            SettingReadsForTests.mend(Settings.FASTER_UPLOADS);
        }
    }
}
