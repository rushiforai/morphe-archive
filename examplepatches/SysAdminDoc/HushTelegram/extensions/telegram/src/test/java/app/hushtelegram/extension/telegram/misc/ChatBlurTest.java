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
public class ChatBlurTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.ALLOW_CHAT_BLUR);
        Settings.ALLOW_CHAT_BLUR.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultTelegramRatesThePhone() {
        assertFalse(Settings.ALLOW_CHAT_BLUR.get());
        assertFalse(ChatBlur.allowed());
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.ALLOW_CHAT_BLUR));
    }

    @Test public void onEveryPhoneCanBlur() {
        Settings.ALLOW_CHAT_BLUR.save(true);
        assertTrue(ChatBlur.allowed());
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchLeavesTheRatingToTelegram() {
        Settings.ALLOW_CHAT_BLUR.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), ChatBlur.allowed());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(ChatBlur.allowed()));
        SettingReadsForTests.breakReads(Settings.ALLOW_CHAT_BLUR);
        assertFalse(ChatBlur.allowed());
        assertFalse(HookStatus.missing(FamilyNames.ALLOW_CHAT_BLUR).isEmpty());
    }
}
