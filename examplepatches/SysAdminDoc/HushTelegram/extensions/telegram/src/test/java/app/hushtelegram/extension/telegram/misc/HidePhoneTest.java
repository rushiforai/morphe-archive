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
public class HidePhoneTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_PHONE_NUMBER);
        Settings.HIDE_PHONE_NUMBER.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultNumbersShowAsTelegramFormatsThem() {
        assertFalse(Settings.HIDE_PHONE_NUMBER.get());
        assertFalse(HidePhone.on());
        assertEquals("+15551234567", HidePhone.shown(null, "+15551234567"));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.HIDE_PHONE_NUMBER));
    }

    @Test public void onlyAnAccountsOwnNumberMatches() {
        String[] accounts = {null, "15551234567", "447700900123"};
        assertTrue(HidePhone.own("+1 555 123 4567", i -> accounts[i], 3));
        assertTrue(HidePhone.own("447700900123", i -> accounts[i], 3));
        assertFalse(HidePhone.own("+1 555 123 4568", i -> accounts[i], 3));
        assertFalse(HidePhone.own("+44 7700 900123", i -> accounts[i], 2));
        assertFalse(HidePhone.own("", i -> accounts[i], 3));
        assertFalse(HidePhone.own(null, i -> accounts[i], 3));
    }

    @Test public void theMaskKeepsThePlusAndTheSpacing() {
        assertEquals("+• ••• ••• ••••", HidePhone.mask("+1 555 123 4567"));
    }

    @Test public void pausingOrAnEarlyStartLeavesNumbersAlone() {
        Settings.HIDE_PHONE_NUMBER.save(true);
        assertTrue(HidePhone.on());
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), HidePhone.on());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(HidePhone.on()));
        SettingReadsForTests.breakReads(Settings.HIDE_PHONE_NUMBER);
        assertFalse(HidePhone.on());
        assertFalse(HookStatus.missing(FamilyNames.HIDE_PHONE_NUMBER).isEmpty());
    }
}
