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
public class AlsoDeleteCheckedTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.ALSO_DELETE_CHECKED);
        Settings.ALSO_DELETE_CHECKED.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultTheBoxStartsUncheckedAsTelegramHasIt() {
        assertFalse(Settings.ALSO_DELETE_CHECKED.defaultValue);
        boolean[] forBoth = {false};
        assertFalse(MessageMenu.alsoDeleteChecked(forBoth));
        assertFalse("the dialog still deletes for you only", forBoth[0]);
    }

    @Test public void onTheBoxAndTheDeleteButtonBothStartOnBothSides() {
        Settings.ALSO_DELETE_CHECKED.save(true);
        boolean[] forBoth = {false};
        assertTrue(MessageMenu.alsoDeleteChecked(forBoth));
        assertTrue("the box and the flag Delete reads agree", forBoth[0]);
        // Telegram's own tap flips the same flag, so unchecking deletes for you only again.
        forBoth[0] = !forBoth[0];
        assertFalse(forBoth[0]);
        assertFalse(MessageMenu.alsoDeleteChecked(null));
        assertFalse(MessageMenu.alsoDeleteChecked(new boolean[0]));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchLeavesTheBoxUnchecked() {
        Settings.ALSO_DELETE_CHECKED.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            boolean[] forBoth = {false};
            assertFalse(reason.name(), MessageMenu.alsoDeleteChecked(forBoth));
            assertFalse(reason.name(), forBoth[0]);
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> {
            boolean[] forBoth = {false};
            assertFalse(MessageMenu.alsoDeleteChecked(forBoth));
            assertFalse(forBoth[0]);
        });
        SettingReadsForTests.breakReads(Settings.ALSO_DELETE_CHECKED);
        boolean[] forBoth = {false};
        assertFalse(MessageMenu.alsoDeleteChecked(forBoth));
        assertFalse(forBoth[0]);
        assertFalse(HookStatus.missing(FamilyNames.MESSAGE_MENU_REPEAT).isEmpty());
    }
}
