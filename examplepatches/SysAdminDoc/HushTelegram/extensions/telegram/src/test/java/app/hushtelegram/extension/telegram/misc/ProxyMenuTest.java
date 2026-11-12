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
public class ProxyMenuTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.PROXY_MENU);
        Settings.PROXY_MENU.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultTheMenuStaysAsTelegramBuiltIt() {
        assertFalse(Settings.PROXY_MENU.get());
        assertFalse(ProxyMenu.show(1));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.PROXY_MENU));
    }

    @Test public void onTheMenuAlwaysHasProxy() {
        Settings.PROXY_MENU.save(true);
        assertTrue(ProxyMenu.show(1));
        assertTrue("every open asks again", ProxyMenu.show(1));
        Settings.PROXY_MENU.save(false);
        assertFalse("off takes effect on the next open", ProxyMenu.show(1));
    }

    @Test public void pausedOrUnreadableTheMenuStaysAsTelegramBuiltIt() {
        Settings.PROXY_MENU.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), ProxyMenu.show(1));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(ProxyMenu.show(1)));
        SettingReadsForTests.breakReads(Settings.PROXY_MENU);
        assertFalse(ProxyMenu.show(1));
        assertFalse(HookStatus.missing(FamilyNames.PROXY_MENU).isEmpty());
    }
}
