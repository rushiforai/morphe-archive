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
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34)
public class StorySaveTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.STORY_SAVE_BUTTON);
        Settings.STORY_SAVE_BUTTON.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offKeepsTelegramsAnswers() {
        assertFalse(Settings.STORY_SAVE_BUTTON.get());
        assertFalse(StorySave.shareable(0));
        assertFalse(StorySave.premium(0));
        assertTrue(StorySave.shareable(1));
        assertTrue(StorySave.premium(1));
    }

    @Test public void onOffersTheItemOnAnyStoryWithoutPremium() {
        Settings.STORY_SAVE_BUTTON.save(true);
        assertTrue(StorySave.shareable(0));
        assertTrue(StorySave.premium(0));
    }

    @Test public void aNonZeroAnswerOfAnyShapeStaysYes() {
        assertTrue(StorySave.shareable(2));
        assertTrue(StorySave.premium(-1));
    }

    @Test public void pausedOrBrokenFallsBackToTelegramsAnswers() {
        Settings.STORY_SAVE_BUTTON.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertFalse(StorySave.premium(0));
        PauseForTests.resume();
        SettingReadsForTests.breakReads(Settings.STORY_SAVE_BUTTON);
        assertFalse(StorySave.premium(0));
        assertTrue(StorySave.premium(1));
        assertFalse(HookStatus.missing(FamilyNames.MESSAGE_MENU_REPEAT).isEmpty());
    }
}
