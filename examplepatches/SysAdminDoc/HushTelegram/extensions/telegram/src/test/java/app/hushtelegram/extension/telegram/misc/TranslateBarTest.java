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

import java.util.ArrayList;
import java.util.List;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TranslateBarTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        TranslateBarForTests.restore();
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_TRANSLATE_BAR);
        SettingReadsForTests.mend(Settings.HIDE_PINNED_BAR);
        SettingReadsForTests.mend(Settings.ALWAYS_SHOW_TRANSLATE_BAR);
        Settings.HIDE_TRANSLATE_BAR.resetToDefault();
        Settings.HIDE_PINNED_BAR.resetToDefault();
        Settings.ALWAYS_SHOW_TRANSLATE_BAR.resetToDefault();
        HookStatus.clear();
    }

    private static final long SELF = 7L;
    private static final long CHAT = 42L;

    @Test public void alwaysShowStartsOffAndLeavesTelegramsAnswersAlone() {
        assertFalse(Settings.ALWAYS_SHOW_TRANSLATE_BAR.get());
        assertFalse(TranslateBar.show(() -> true, () -> false));
        assertFalse(TranslateBar.offer(false, () -> true));
        assertTrue("Telegram's own offer stands", TranslateBar.offer(true, () -> false));
        assertFalse(TranslateBar.tap(() -> true, () -> { throw new AssertionError("not flipped"); }));
        TranslateBar.close(() -> true, () -> { throw new AssertionError("not hidden"); });
        assertFalse(TranslateBar.label(false, () -> true, () -> true));
        assertTrue(TranslateBar.label(true, () -> false, () -> false));
    }

    @Test public void alwaysShowPutsTheBarOnAChatTelegramPassedOver() {
        Settings.ALWAYS_SHOW_TRANSLATE_BAR.save(true);
        assertTrue(TranslateBar.show(() -> true, () -> false));
        assertTrue(String.join("\n", HookStatus.report()).contains("translate bar always shown 1"));
        assertTrue("the chat menu offers it too", TranslateBar.offer(false, () -> true));
    }

    @Test public void aChatThatCantBeTranslatedGetsNoBar() {
        Settings.ALWAYS_SHOW_TRANSLATE_BAR.save(true);
        assertFalse(TranslateBar.show(() -> false, () -> false));
        assertFalse(TranslateBar.offer(false, () -> false));
    }

    @Test public void aBarClosedInThatChatStaysClosed() {
        Settings.ALWAYS_SHOW_TRANSLATE_BAR.save(true);
        assertFalse(TranslateBar.show(() -> true, () -> true));
        assertFalse(String.join("\n", HookStatus.report()).contains("translate bar always shown"));
    }

    @Test public void hideTranslateBarWinsOverAlwaysShow() {
        Settings.ALWAYS_SHOW_TRANSLATE_BAR.save(true);
        Settings.HIDE_TRANSLATE_BAR.save(true);
        assertFalse(TranslateBar.show(() -> true, () -> false));
        assertFalse(TranslateBar.offer(false, () -> true));
        assertFalse(TranslateBar.tap(() -> true, () -> { throw new AssertionError("not flipped"); }));
        TranslateBar.close(() -> true, () -> { throw new AssertionError("not hidden"); });
        assertFalse(TranslateBar.label(false, () -> true, () -> true));
    }

    @Test public void secretChatsSavedMessagesAndNoWayToTranslateAreLeftOut() {
        assertTrue("Telegram can", TranslateBar.offers(CHAT, SELF, false, true, false));
        assertTrue("the outside service can", TranslateBar.offers(CHAT, SELF, false, false, true));
        assertFalse("neither can", TranslateBar.offers(CHAT, SELF, false, false, false));
        assertFalse("secret chat", TranslateBar.offers(CHAT, SELF, true, true, true));
        assertFalse("Saved Messages", TranslateBar.offers(SELF, SELF, false, true, true));
        assertFalse("no chat yet", TranslateBar.offers(0L, SELF, false, true, true));
    }

    @Test public void theBarsTapGoesToTheOutsideServiceOnlyWhenItHandlesTheChat() {
        Settings.ALWAYS_SHOW_TRANSLATE_BAR.save(true);
        int[] flips = {0};
        assertTrue(TranslateBar.tap(() -> true, () -> flips[0]++));
        assertEquals(1, flips[0]);
        assertFalse("Telegram's own toggle takes it", TranslateBar.tap(() -> false, () -> flips[0]++));
        assertEquals(1, flips[0]);
    }

    @Test public void closingTheBarHidesItOnlyWhereTheOutsideServiceHandlesTheChat() {
        Settings.ALWAYS_SHOW_TRANSLATE_BAR.save(true);
        int[] hides = {0};
        TranslateBar.close(() -> true, () -> hides[0]++);
        assertEquals(1, hides[0]);
        TranslateBar.close(() -> false, () -> hides[0]++);
        assertEquals("Telegram's own close handles it", 1, hides[0]);
    }

    @Test public void theBarsLabelFollowsTheOutsideServicesChoiceForTheChat() {
        Settings.ALWAYS_SHOW_TRANSLATE_BAR.save(true);
        assertTrue(TranslateBar.label(false, () -> true, () -> true));
        assertFalse(TranslateBar.label(false, () -> true, () -> false));
        assertFalse("Telegram answers for its own", TranslateBar.label(false, () -> false, () -> true));
        assertTrue("and a chat it translates stays so", TranslateBar.label(true, () -> true, () -> false));
    }

    @Test public void pausingOrAnEarlyStartPutsAlwaysShowBack() {
        Settings.ALWAYS_SHOW_TRANSLATE_BAR.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), TranslateBar.show(() -> true, () -> false));
            assertFalse(reason.name(), TranslateBar.offer(false, () -> true));
            assertTrue(Settings.ALWAYS_SHOW_TRANSLATE_BAR.savedValue());
            PauseForTests.resume();
            assertTrue(reason.name(), TranslateBar.show(() -> true, () -> false));
        }
        SettingsContextRule.withoutContext(() -> assertFalse(TranslateBar.show(() -> true, () -> false)));
    }

    @Test public void aFailureLeavesTelegramsAnswerAndReportsIt() {
        Settings.ALWAYS_SHOW_TRANSLATE_BAR.save(true);
        assertFalse(TranslateBar.show(() -> { throw new IllegalStateException("gone"); }, () -> false));
        assertFalse(HookStatus.missing(FamilyNames.HIDE_TRANSLATE_BAR).isEmpty());
        HookStatus.clear();
        assertTrue(TranslateBar.offer(true, () -> { throw new AssertionError("not asked"); }));
        assertFalse(TranslateBar.offer(false, () -> { throw new IllegalStateException("gone"); }));
        assertFalse(HookStatus.missing(FamilyNames.HIDE_TRANSLATE_BAR).isEmpty());
        HookStatus.clear();
        assertFalse(TranslateBar.tap(() -> true, () -> { throw new IllegalStateException("gone"); }));
        assertFalse(HookStatus.missing(FamilyNames.HIDE_TRANSLATE_BAR).isEmpty());
        HookStatus.clear();
        TranslateBar.close(() -> true, () -> { throw new IllegalStateException("gone"); });
        assertFalse(HookStatus.missing(FamilyNames.HIDE_TRANSLATE_BAR).isEmpty());
        HookStatus.clear();
        assertTrue(TranslateBar.label(true, () -> { throw new AssertionError("not asked"); }, () -> true));
        assertFalse(TranslateBar.label(false, () -> { throw new IllegalStateException("gone"); }, () -> true));
        assertFalse(HookStatus.missing(FamilyNames.HIDE_TRANSLATE_BAR).isEmpty());
        HookStatus.clear();
        SettingReadsForTests.breakReads(Settings.ALWAYS_SHOW_TRANSLATE_BAR);
        assertFalse(TranslateBar.show(() -> true, () -> false));
        assertFalse(HookStatus.missing(FamilyNames.HIDE_TRANSLATE_BAR).isEmpty());
    }

    @Test public void theHooksAnswerLikeTelegramOnAnUnpatchedApp() {
        // Unpatched, every stub says there's no chat and nothing can translate it.
        Settings.ALWAYS_SHOW_TRANSLATE_BAR.save(true);
        Object chat = new Object();
        assertFalse(TranslateBar.alwaysShown(chat));
        assertFalse(TranslateBar.offered(chat, CHAT));
        assertFalse(TranslateBar.barTapped(chat));
        TranslateBar.barClosed(chat);
        assertFalse(TranslateBar.barTranslating(chat, CHAT));
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

    @Test public void theSettingsClosingHaveTheChatUnderThemDecideOnce() {
        Object chat = new Object();
        List<Object> decided = new ArrayList<>();
        TranslateBarForTests.decideWith(decided::add);
        assertFalse(TranslateBar.pinnedBarChanged(chat));

        TranslateBar.settingsClosed();
        assertTrue("nothing changed", decided.isEmpty());

        Settings.HIDE_PINNED_BAR.save(true);
        TranslateBar.settingsClosed();
        TranslateBar.settingsClosed();
        assertEquals(List.of(chat), decided);
        assertFalse("and it isn't asked again on return", TranslateBar.pinnedBarChanged(chat));
        assertTrue(String.join("\n", HookStatus.report()).contains("pinned bar decided again 1"));
    }

    @Test public void onlyTheChatAtTheFrontDecidesWhenTheSettingsClose() {
        Object under = new Object();
        Object front = new Object();
        List<Object> decided = new ArrayList<>();
        TranslateBarForTests.decideWith(decided::add);
        assertFalse(TranslateBar.pinnedBarChanged(under));
        assertFalse(TranslateBar.pinnedBarChanged(front));

        Settings.HIDE_PINNED_BAR.save(true);
        TranslateBar.settingsClosed();
        assertEquals(List.of(front), decided);
        assertTrue("the other decides when it comes back", TranslateBar.pinnedBarChanged(under));
    }

    @Test public void theSettingsClosingWithNoChatOpenAsksNothing() {
        TranslateBarForTests.decideWith(screen -> { throw new AssertionError("no chat to ask"); });
        Settings.HIDE_PINNED_BAR.save(true);
        TranslateBar.settingsClosed();
        assertTrue(HookStatus.missing(FamilyNames.HIDE_TRANSLATE_BAR).isEmpty());
    }

    @Test public void aBuildThatCantDecideLeavesItForTheChatsReturn() {
        Object chat = new Object();
        assertFalse(TranslateBar.pinnedBarChanged(chat));
        Settings.HIDE_PINNED_BAR.save(true);
        TranslateBar.settingsClosed();
        assertTrue("the stub said no, so the return still decides", TranslateBar.pinnedBarChanged(chat));
    }

    @Test public void aFailedDecisionLeavesTheChatForItsReturnAndReportsIt() {
        Object chat = new Object();
        TranslateBarForTests.decideWith(screen -> { throw new IllegalStateException("injected"); });
        assertFalse(TranslateBar.pinnedBarChanged(chat));
        Settings.HIDE_PINNED_BAR.save(true);
        TranslateBar.settingsClosed();
        assertFalse(HookStatus.missing(FamilyNames.HIDE_TRANSLATE_BAR).isEmpty());
        assertTrue(TranslateBar.pinnedBarChanged(chat));
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
