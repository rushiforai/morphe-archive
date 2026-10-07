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
public class MessageTimeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.MESSAGE_SECONDS);
        Settings.MESSAGE_SECONDS.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefault() {
        assertFalse(Settings.MESSAGE_SECONDS.get());
        assertFalse(MessageTime.on());
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.MESSAGE_SECONDS));
    }

    @Test public void theSecondsGoRightAfterTheMinutes() {
        long at = 1_699_999_987_000L; // 7 seconds past the minute
        assertEquals("21:13:07", MessageTime.withSeconds("21:13", at));
        assertEquals("9:13:07 PM", MessageTime.withSeconds("9:13 PM", at));
        assertEquals("edited 9:13:47", MessageTime.withSeconds("edited 9:13", at + 40_000));
        assertEquals("21.13", MessageTime.withSeconds("21.13", at));
        assertEquals("12.03.26", MessageTime.withSeconds("12.03.26", at));
        assertEquals("21:13:07", MessageTime.withSeconds("21:13:07", at));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchLeavesTimesAlone() {
        Settings.MESSAGE_SECONDS.save(true);
        assertTrue(MessageTime.on());
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), MessageTime.on());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(MessageTime.on()));
        SettingReadsForTests.breakReads(Settings.MESSAGE_SECONDS);
        assertFalse(MessageTime.on());
        assertFalse(HookStatus.missing(FamilyNames.MESSAGE_SECONDS).isEmpty());
    }
}
