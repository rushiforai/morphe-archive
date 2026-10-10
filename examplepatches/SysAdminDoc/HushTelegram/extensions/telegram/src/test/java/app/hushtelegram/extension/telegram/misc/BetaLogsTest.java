/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class BetaLogsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.BETA_LOGS_OFF);
        Settings.BETA_LOGS_OFF.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultTheBetaKeepsForcingItsLogs() {
        assertFalse(Settings.BETA_LOGS_OFF.get());
        assertTrue(Settings.BETA_LOGS_OFF.rebootApp);
        assertTrue(BetaLogs.forceLogs(true));
        assertFalse(BetaLogs.forceLogs(false));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.BETA_LOGS_OFF));
    }

    @Test public void onTheBetaStopsForcingItsLogs() {
        Settings.BETA_LOGS_OFF.save(true);
        assertFalse(BetaLogs.forceLogs(true));
        assertTrue(String.join("\n", HookStatus.report()).contains("forced beta logging turned off"));
    }

    @Test public void aBuildThatDoesNotForceLogsIsNeverTurnedOn() {
        Settings.BETA_LOGS_OFF.save(true);
        assertFalse(BetaLogs.forceLogs(false));
        Settings.BETA_LOGS_OFF.save(false);
        assertFalse(BetaLogs.forceLogs(false));
        SettingsContextRule.withoutContext(() -> assertFalse(BetaLogs.forceLogs(false)));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchLeavesTheBetaLogging() {
        Settings.BETA_LOGS_OFF.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertTrue(reason.name(), BetaLogs.forceLogs(true));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertTrue(BetaLogs.forceLogs(true)));
        assertTrue(String.join("\n", HookStatus.report()).contains("logging decided before app start"));
        SettingReadsForTests.breakReads(Settings.BETA_LOGS_OFF);
        assertTrue(BetaLogs.forceLogs(true));
        assertFalse(HookStatus.missing(FamilyNames.BETA_LOGS_OFF).isEmpty());
    }
}
