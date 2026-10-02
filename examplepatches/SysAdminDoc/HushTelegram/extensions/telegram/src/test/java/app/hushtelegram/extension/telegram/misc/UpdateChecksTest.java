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

import java.util.Arrays;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * {@link UpdateChecks}'s one hook, read on its own: what it counts with the switch on, what it
 * leaves alone with the switch off, paused, or before the settings are ready, and what it does
 * when the switch itself cannot be read.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class UpdateChecksTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void setUp() {
        HookStatus.clear();
    }

    @After
    public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.DISABLE_UPDATE_CHECKS);
        Settings.DISABLE_UPDATE_CHECKS.resetToDefault();
        HookStatus.clear();
    }

    @Test
    public void theUpdateCheckIsSkippedAndCountedWhileTheSwitchIsOn() {
        Settings.DISABLE_UPDATE_CHECKS.save(true);
        assertTrue(UpdateChecks.skipUpdateCheck());
        assertEquals(Arrays.asList(
                        "Disable update checks: invoked 1, 0 found, 0 missing. Counted: update check skipped 1"),
                HookStatus.report());
    }

    @Test
    public void theUpdateCheckRunsWithTheSwitchOff() {
        Settings.DISABLE_UPDATE_CHECKS.save(false);
        assertFalse(UpdateChecks.skipUpdateCheck());
        assertEquals(Arrays.asList("Disable update checks: invoked 1, 0 found, 0 missing"), HookStatus.report());
    }

    @Test
    public void theUpdateCheckRunsWhilePaused() {
        Settings.DISABLE_UPDATE_CHECKS.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertFalse(UpdateChecks.skipUpdateCheck());
        assertEquals(Arrays.asList("Disable update checks: invoked 1, 0 found, 0 missing"), HookStatus.report());
    }

    @Test
    public void theUpdateCheckRunsBeforeTheSettingsAreReady() {
        Settings.DISABLE_UPDATE_CHECKS.save(true);
        SettingsContextRule.withoutContext(() -> assertFalse(UpdateChecks.skipUpdateCheck()));
        assertEquals(Arrays.asList("Disable update checks: invoked 1, 0 found, 0 missing"), HookStatus.report());
    }

    @Test
    public void aHookThatCannotReadTheSwitchSkipsNothingAndRecordsWhatThrew() {
        Settings.DISABLE_UPDATE_CHECKS.save(true);
        SettingReadsForTests.breakReads(Settings.DISABLE_UPDATE_CHECKS);
        assertFalse(UpdateChecks.skipUpdateCheck());
        assertEquals(Arrays.asList(
                        "a working 'switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.DISABLE_UPDATE_CHECKS));
        assertFalse("a throw must not count as a skip", HookStatus.report().get(0).contains("Counted:"));
    }
}
