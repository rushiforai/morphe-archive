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

/** Open Saved Messages on its media (#103): what the chat list hears when it reads View as Chats. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SavedMediaTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.SAVED_MEDIA_FIRST);
        Settings.SAVED_MEDIA_FIRST.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultTelegramsOwnAnswerGoesThrough() {
        assertFalse(Settings.SAVED_MEDIA_FIRST.get());
        assertEquals(0, SavedMedia.viewAsChats(0));
        assertEquals(1, SavedMedia.viewAsChats(1));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.HIDE_FOLDER_COUNTERS));
    }

    @Test public void onTheChatListOpensTheMediaPage() {
        Settings.SAVED_MEDIA_FIRST.save(true);
        assertEquals(1, SavedMedia.viewAsChats(0));
        assertEquals(1, SavedMedia.viewAsChats(1));
    }

    @Test public void pausedOrUnreadableItLeavesTelegramsAnswerAlone() {
        Settings.SAVED_MEDIA_FIRST.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertEquals(reason.name(), 0, SavedMedia.viewAsChats(0));
            // Telegram's own View as Chats stays on through a pause.
            assertEquals(reason.name(), 1, SavedMedia.viewAsChats(1));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertEquals(0, SavedMedia.viewAsChats(0)));
        SettingReadsForTests.breakReads(Settings.SAVED_MEDIA_FIRST);
        assertEquals(0, SavedMedia.viewAsChats(0));
        assertEquals(1, SavedMedia.viewAsChats(1));
        assertFalse(HookStatus.missing(FamilyNames.HIDE_FOLDER_COUNTERS).isEmpty());
    }
}
