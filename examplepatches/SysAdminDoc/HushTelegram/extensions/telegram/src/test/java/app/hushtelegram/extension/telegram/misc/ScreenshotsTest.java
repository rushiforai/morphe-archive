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
public class ScreenshotsTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.ALLOW_SCREENSHOTS);
        Settings.ALLOW_SCREENSHOTS.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offKeepsTelegramsAnswers() {
        assertFalse(Settings.ALLOW_SCREENSHOTS.get());
        assertTrue(Screenshots.protectedContent(1));
        assertFalse(Screenshots.protectedContent(0));
        assertFalse(Screenshots.storyAllowed(0));
        assertTrue(Screenshots.storyAllowed(1));
    }

    @Test public void onLetsProtectedContentBeCaptured() {
        Settings.ALLOW_SCREENSHOTS.save(true);
        assertFalse(Screenshots.protectedContent(1));
        assertFalse(Screenshots.protectedContent(0));
        assertTrue(Screenshots.storyAllowed(0));
        assertTrue(Screenshots.storyAllowed(1));
    }

    @Test public void aNonZeroAnswerOfAnyShapeCounts() {
        assertTrue(Screenshots.protectedContent(-1));
        assertTrue(Screenshots.storyAllowed(2));
    }

    @Test public void pausedOrBrokenKeepsCaptureBlocked() {
        Settings.ALLOW_SCREENSHOTS.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertTrue(Screenshots.protectedContent(1));
        assertFalse(Screenshots.storyAllowed(0));
        PauseForTests.resume();
        SettingReadsForTests.breakReads(Settings.ALLOW_SCREENSHOTS);
        assertTrue(Screenshots.protectedContent(1));
        assertFalse(Screenshots.storyAllowed(0));
        assertFalse(HookStatus.missing(FamilyNames.MESSAGE_MENU_REPEAT).isEmpty());
    }
}
