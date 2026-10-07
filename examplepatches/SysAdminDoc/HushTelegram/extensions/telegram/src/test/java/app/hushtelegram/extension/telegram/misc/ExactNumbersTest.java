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
public class ExactNumbersTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.EXACT_NUMBERS);
        Settings.EXACT_NUMBERS.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultKeepsTelegramsShortForm() {
        assertFalse(Settings.EXACT_NUMBERS.get());
        int[] rounded = {7};
        assertNull(ExactNumbers.format(12_345, rounded));
        assertEquals(7, rounded[0]);
    }

    @Test public void onWritesTheFullCountAndHandsItBackForPlurals() {
        Settings.EXACT_NUMBERS.save(true);
        int[] rounded = {0};
        assertEquals("12,345", ExactNumbers.format(12_345, rounded));
        assertEquals(12_345, rounded[0]);
        assertEquals("1,234,567", ExactNumbers.format(1_234_567, null));
        assertEquals("999", ExactNumbers.format(999, new int[0]));
        assertTrue(String.join("\n", HookStatus.report()).contains("count shown in full 3"));
    }

    @Test public void groupingCoversEveryLength() {
        assertEquals("0", ExactNumbers.grouped(0));
        assertEquals("100", ExactNumbers.grouped(100));
        assertEquals("1,000", ExactNumbers.grouped(1_000));
        assertEquals("100,000", ExactNumbers.grouped(100_000));
        assertEquals("2,147,483,647", ExactNumbers.grouped(Integer.MAX_VALUE));
        assertEquals("-2,147,483,648", ExactNumbers.grouped(Integer.MIN_VALUE));
    }

    @Test public void pausingOrAnEarlyStartKeepsTelegramsShortForm() {
        Settings.EXACT_NUMBERS.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertNull(reason.name(), ExactNumbers.format(12_345, null));
            assertTrue(Settings.EXACT_NUMBERS.savedValue());
            PauseForTests.resume();
            assertEquals(reason.name(), "12,345", ExactNumbers.format(12_345, null));
        }
        SettingsContextRule.withoutContext(() -> assertNull(ExactNumbers.format(12_345, null)));
    }

    @Test public void unreadableSwitchKeepsTelegramsShortFormAndReportsIt() {
        Settings.EXACT_NUMBERS.save(true);
        SettingReadsForTests.breakReads(Settings.EXACT_NUMBERS);
        int[] rounded = {7};
        assertNull(ExactNumbers.format(12_345, rounded));
        assertEquals(7, rounded[0]);
        assertFalse(HookStatus.missing(FamilyNames.EXACT_NUMBERS).isEmpty());
    }
}
