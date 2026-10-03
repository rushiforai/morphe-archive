/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Collections;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ChatSwipeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        Settings.DISABLE_CHAT_SWIPE.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.DISABLE_CHAT_SWIPE);
        Settings.DISABLE_CHAT_SWIPE.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultSoChatRowsSwipeAsTelegramsDo() {
        assertFalse(Settings.DISABLE_CHAT_SWIPE.get());
        assertFalse(ChatSwipe.keepRowStill());
        assertEquals(Collections.singletonList("Disable chat swipe actions: invoked 1, 0 found, 0 missing"), HookStatus.report());
    }

    @Test public void switchedOnEverySwipeIsStoppedAndCounted() {
        Settings.DISABLE_CHAT_SWIPE.save(true);
        assertTrue(ChatSwipe.keepRowStill());
        assertTrue(ChatSwipe.keepRowStill());
        assertEquals(Collections.singletonList("Disable chat swipe actions: invoked 2, 0 found, 0 missing. Counted: chat swipe stopped 2"),
                HookStatus.report());
    }

    @Test public void everyPauseReasonLetsRowsSwipeAndResumeStopsThemAgain() {
        Settings.DISABLE_CHAT_SWIPE.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), ChatSwipe.keepRowStill());
            PauseForTests.resume();
        }
        assertTrue(ChatSwipe.keepRowStill());
    }

    @Test public void unavailableSettingsLetRowsSwipe() {
        Settings.DISABLE_CHAT_SWIPE.save(true);
        SettingsContextRule.withoutContext(() -> assertFalse(ChatSwipe.keepRowStill()));
    }

    @Test public void unreadableSettingFailsOpenAndReportsItsStateFailure() {
        Settings.DISABLE_CHAT_SWIPE.save(true);
        SettingReadsForTests.breakReads(Settings.DISABLE_CHAT_SWIPE);
        assertFalse(ChatSwipe.keepRowStill());
        assertEquals(Collections.singletonList("a working 'switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.DISABLE_CHAT_SWIPE));
    }
}
