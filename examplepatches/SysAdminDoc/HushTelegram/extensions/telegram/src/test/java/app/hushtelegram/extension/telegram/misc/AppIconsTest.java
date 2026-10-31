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
public class AppIconsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.UNLOCK_PREMIUM_ICONS);
        Settings.UNLOCK_PREMIUM_ICONS.resetToDefault();
        HookStatus.clear();
    }

    @Test public void startsOffSoPremiumIconsStayLocked() {
        assertFalse(Settings.UNLOCK_PREMIUM_ICONS.get());
        assertTrue(AppIcons.premium(1));
        assertFalse(AppIcons.premium(0));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.HIDE_COMMERCE));
        assertFalse(String.join("\n", HookStatus.report()).contains("Premium icon unlocked"));
    }

    @Test public void turnedOnEveryIconReadsAsOrdinary() {
        Settings.UNLOCK_PREMIUM_ICONS.save(true);
        assertFalse(AppIcons.premium(1));
        assertFalse(AppIcons.premium(0));
        assertTrue(String.join("\n", HookStatus.report()).contains("Premium icon unlocked"));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTelegramsFlag() {
        Settings.UNLOCK_PREMIUM_ICONS.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertTrue(reason.name(), AppIcons.premium(1));
            assertFalse(reason.name(), AppIcons.premium(0));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertTrue(AppIcons.premium(1)));
        SettingReadsForTests.breakReads(Settings.UNLOCK_PREMIUM_ICONS);
        assertTrue(AppIcons.premium(1));
        assertFalse(HookStatus.missing(FamilyNames.HIDE_COMMERCE).isEmpty());
    }
}
