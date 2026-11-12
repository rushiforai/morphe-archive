/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

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
public class QuietSignUpTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        Settings.QUIET_SIGN_UP.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        Settings.QUIET_SIGN_UP.resetToDefault();
        HookStatus.clear();
    }

    @Test public void signUpsTellContactsUntilTheSwitchIsOn() {
        assertFalse(Settings.QUIET_SIGN_UP.get());
        assertFalse(QuietSignUp.noJoinedNotifications(0));
        assertTrue(QuietSignUp.noJoinedNotifications(1));
    }

    @Test public void switchOnKeepsEverySignUpQuiet() {
        Settings.QUIET_SIGN_UP.save(true);
        assertTrue(QuietSignUp.noJoinedNotifications(0));
        assertTrue(QuietSignUp.noJoinedNotifications(1));
    }

    @Test public void aBrokenSwitchReadSendsWhatTelegramSet() {
        SettingReadsForTests.breakReads(Settings.QUIET_SIGN_UP);
        try {
            assertFalse(QuietSignUp.noJoinedNotifications(0));
            assertTrue(QuietSignUp.noJoinedNotifications(1));
        } finally {
            SettingReadsForTests.mend(Settings.QUIET_SIGN_UP);
        }
    }
}
