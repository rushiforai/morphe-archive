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
        SettingReadsForTests.mend(Settings.HIDE_PINNED_BAR);
        Settings.HIDE_TRANSLATE_BAR.resetToDefault();
        Settings.HIDE_PINNED_BAR.resetToDefault();
        HookStatus.clear();
    }

    @Test public void thePinnedBarShowsUntilItsOwnSwitchIsOn() {
        assertFalse(Settings.HIDE_PINNED_BAR.get());
        assertFalse(TranslateBar.pinnedBarHidden());
        // The translate bar's switch is a separate choice.
        Settings.HIDE_TRANSLATE_BAR.save(true);
        assertFalse(TranslateBar.pinnedBarHidden());

        Settings.HIDE_PINNED_BAR.save(true);
        assertTrue(TranslateBar.pinnedBarHidden());
        assertTrue(String.join("\n", HookStatus.report()).contains("pinned bar hidden 1"));
        Settings.HIDE_TRANSLATE_BAR.save(false);
        assertTrue(TranslateBar.pinnedBarHidden());
    }

    @Test public void pausingOrAnEarlyStartShowsThePinnedBar() {
        Settings.HIDE_PINNED_BAR.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), TranslateBar.pinnedBarHidden());
            assertTrue(Settings.HIDE_PINNED_BAR.savedValue());
            PauseForTests.resume();
            assertTrue(reason.name(), TranslateBar.pinnedBarHidden());
        }
        SettingsContextRule.withoutContext(() -> assertFalse(TranslateBar.pinnedBarHidden()));
    }

    @Test public void aFailedReadShowsThePinnedBarAndReportsIt() {
        Settings.HIDE_PINNED_BAR.save(true);
        SettingReadsForTests.breakReads(Settings.HIDE_PINNED_BAR);
        assertFalse(TranslateBar.pinnedBarHidden());
        assertFalse(HookStatus.missing(FamilyNames.HIDE_TRANSLATE_BAR).isEmpty());
    }

    @Test public void aChatLeftOpenDecidesAgainWhenItComesBackAfterTheSwitchChanged() {
        Object chat = new Object();
        Object other = new Object();
        // Opening the chat decides on the bar anyway.
        assertFalse(TranslateBar.pinnedBarChanged(chat));
        assertFalse(TranslateBar.pinnedBarChanged(chat));

        Settings.HIDE_PINNED_BAR.save(true);
        assertTrue("on while the chat was behind the settings", TranslateBar.pinnedBarChanged(chat));
        assertFalse("once is enough", TranslateBar.pinnedBarChanged(chat));
        assertFalse("a chat opened after the change", TranslateBar.pinnedBarChanged(other));
        assertTrue(String.join("\n", HookStatus.report()).contains("pinned bar decided again 1"));

        Settings.HIDE_PINNED_BAR.save(false);
        assertTrue("and back off", TranslateBar.pinnedBarChanged(chat));
        assertTrue(TranslateBar.pinnedBarChanged(other));
    }

    @Test public void aPauseWhileAChatIsOpenBringsItsBarBack() {
        Settings.HIDE_PINNED_BAR.save(true);
        Object chat = new Object();
        assertFalse(TranslateBar.pinnedBarChanged(chat));
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertTrue(TranslateBar.pinnedBarChanged(chat));
        PauseForTests.resume();
        assertTrue(TranslateBar.pinnedBarChanged(chat));
    }

    @Test public void aFailedReadOnReturnLeavesTheChatAloneAndReportsIt() {
        Object chat = new Object();
        assertFalse(TranslateBar.pinnedBarChanged(chat));
        Settings.HIDE_PINNED_BAR.save(true);
        SettingReadsForTests.breakReads(Settings.HIDE_PINNED_BAR);
        assertFalse(TranslateBar.pinnedBarChanged(chat));
        assertFalse(HookStatus.missing(FamilyNames.HIDE_TRANSLATE_BAR).isEmpty());
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
