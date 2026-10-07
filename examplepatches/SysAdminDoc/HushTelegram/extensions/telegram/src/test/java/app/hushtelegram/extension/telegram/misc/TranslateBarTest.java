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
public class TranslateBarTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_TRANSLATE_BAR);
        Settings.HIDE_TRANSLATE_BAR.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultShowsTheBarWhereTelegramDoes() {
        assertFalse(Settings.HIDE_TRANSLATE_BAR.get());
        assertFalse(TranslateBar.hide(false, () -> false));
        assertTrue(TranslateBar.hide(true, () -> false));
    }

    @Test public void onHidesTheBarOfAChatThatIsNotBeingTranslated() {
        Settings.HIDE_TRANSLATE_BAR.save(true);
        assertTrue(TranslateBar.hide(false, () -> false));
        assertTrue(String.join("\n", HookStatus.report()).contains("translate bar hidden 1"));
    }

    @Test public void aChatBeingTranslatedKeepsItsBarForTheOriginal() {
        Settings.HIDE_TRANSLATE_BAR.save(true);
        assertFalse(TranslateBar.hide(false, () -> true));
        assertFalse(String.join("\n", HookStatus.report()).contains("translate bar hidden"));
    }

    @Test public void aBarTheChatHidItselfStaysHiddenWithoutAsking() {
        Settings.HIDE_TRANSLATE_BAR.save(true);
        assertTrue(TranslateBar.hide(true, () -> { throw new AssertionError("not asked"); }));
    }

    @Test public void theChatScreensQuestionGoesThroughTheStubs() {
        // Unpatched, the stubs answer "shown" and "not translating".
        assertFalse(TranslateBar.hidden(new Object(), 42L));
        Settings.HIDE_TRANSLATE_BAR.save(true);
        assertTrue(TranslateBar.hidden(new Object(), 42L));
    }

    @Test public void pausingOrAnEarlyStartShowsTheBar() {
        Settings.HIDE_TRANSLATE_BAR.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), TranslateBar.hide(false, () -> false));
            assertTrue(Settings.HIDE_TRANSLATE_BAR.savedValue());
            PauseForTests.resume();
            assertTrue(reason.name(), TranslateBar.hide(false, () -> false));
        }
        SettingsContextRule.withoutContext(() -> assertFalse(TranslateBar.hide(false, () -> false)));
    }

    @Test public void aFailureShowsTheBarAndReportsIt() {
        Settings.HIDE_TRANSLATE_BAR.save(true);
        assertFalse(TranslateBar.hide(false, () -> { throw new IllegalStateException("controller gone"); }));
        assertFalse(HookStatus.missing(FamilyNames.HIDE_TRANSLATE_BAR).isEmpty());

        HookStatus.clear();
        SettingReadsForTests.breakReads(Settings.HIDE_TRANSLATE_BAR);
        assertFalse(TranslateBar.hide(false, () -> false));
        assertFalse(HookStatus.missing(FamilyNames.HIDE_TRANSLATE_BAR).isEmpty());
    }
}
