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
public class MutedMentionsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.IGNORE_MUTED_MENTIONS);
        Settings.IGNORE_MUTED_MENTIONS.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultAMentionUsesTheSendersSettings() {
        assertFalse(Settings.IGNORE_MUTED_MENTIONS.get());
        assertFalse(MutedMentions.on());
        // The unpatched stubs answer 0 for the sender, which Telegram's own call would return.
        assertEquals(0L, MutedMentions.notifyDialog(new Object()));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.IGNORE_MUTED_MENTIONS));
    }

    @Test public void onOnlyGroupsAndChannelsCanKeepTheirMute() {
        Settings.IGNORE_MUTED_MENTIONS.save(true);
        assertTrue(MutedMentions.on());
        assertTrue("a group", MutedMentions.groupOrChannel(-42L));
        assertTrue("a supergroup or channel", MutedMentions.groupOrChannel(-1001234567890L));
        assertFalse("a private chat", MutedMentions.groupOrChannel(42L));
        // An unmuted chat, which the stub reports, keeps Telegram's sender.
        assertEquals(0L, MutedMentions.notifyDialog(new Object()));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTheSender() {
        Settings.IGNORE_MUTED_MENTIONS.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), MutedMentions.on());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(MutedMentions.on()));
        SettingReadsForTests.breakReads(Settings.IGNORE_MUTED_MENTIONS);
        assertFalse(MutedMentions.on());
        assertFalse(HookStatus.missing(FamilyNames.IGNORE_MUTED_MENTIONS).isEmpty());
    }
}
