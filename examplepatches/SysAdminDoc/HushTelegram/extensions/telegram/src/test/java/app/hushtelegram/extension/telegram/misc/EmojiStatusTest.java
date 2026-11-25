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
public class EmojiStatusTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_EMOJI_STATUS);
        Settings.HIDE_EMOJI_STATUS.resetToDefault();
        SettingReadsForTests.mend(Settings.MOVING_EMOJI_STATUS);
        Settings.MOVING_EMOJI_STATUS.resetToDefault();
        HookStatus.clear();
    }

    @Test public void startsOff() {
        assertFalse(Settings.HIDE_EMOJI_STATUS.get());
        assertFalse(EmojiStatus.hide());
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.HIDE_COMMERCE));
        assertFalse(String.join("\n", HookStatus.report()).contains("emoji status hidden"));
    }

    @Test public void turnedOnEveryNameReadsAsHavingNoStatus() {
        Settings.HIDE_EMOJI_STATUS.save(true);
        assertTrue(EmojiStatus.hide());
        assertTrue(String.join("\n", HookStatus.report()).contains("emoji status hidden"));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTheStatus() {
        Settings.HIDE_EMOJI_STATUS.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), EmojiStatus.hide());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(EmojiStatus.hide()));
        SettingReadsForTests.breakReads(Settings.HIDE_EMOJI_STATUS);
        assertFalse(EmojiStatus.hide());
        assertFalse(HookStatus.missing(FamilyNames.HIDE_COMMERCE).isEmpty());
    }

    @Test public void statusesStopAfterTwoPlaysUntilTheMovingSwitchIsOn() {
        assertFalse(Settings.MOVING_EMOJI_STATUS.get());
        for (int type : new int[] {7, 9, 10, 5, 17, 0}) assertEquals(type, EmojiStatus.statusRepeatType(type));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.HIDE_COMMERCE));

        Settings.MOVING_EMOJI_STATUS.save(true);
        assertEquals("a status next to a name", -1, EmojiStatus.statusRepeatType(7));
        assertEquals("a status in a sheet", -1, EmojiStatus.statusRepeatType(9));
        // Topic icons, tab strips and the rest keep Telegram's count.
        for (int type : new int[] {10, 11, 5, 6, 14, 17, 18, 22, 0, -1}) assertEquals(type, EmojiStatus.statusRepeatType(type));
        assertFalse("its own switch", Settings.HIDE_EMOJI_STATUS.get());
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsStatusesStoppingAfterTwoPlays() {
        Settings.MOVING_EMOJI_STATUS.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertEquals(reason.name(), 7, EmojiStatus.statusRepeatType(7));
            assertEquals(reason.name(), 9, EmojiStatus.statusRepeatType(9));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertEquals(7, EmojiStatus.statusRepeatType(7)));
        SettingReadsForTests.breakReads(Settings.MOVING_EMOJI_STATUS);
        assertEquals(7, EmojiStatus.statusRepeatType(7));
        assertFalse(HookStatus.missing(FamilyNames.HIDE_COMMERCE).isEmpty());
    }
}
