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
public class ChannelShareTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_CHANNEL_SHARE);
        Settings.HIDE_CHANNEL_SHARE.resetToDefault();
        HookStatus.clear();
    }

    @Test public void startsOff() {
        assertFalse(Settings.HIDE_CHANNEL_SHARE.get());
        assertFalse(ChannelShare.on());
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.HIDE_CHANNEL_BUTTONS));
    }

    @Test public void turnedOnItAsksAboutEachMessage() {
        Settings.HIDE_CHANNEL_SHARE.save(true);
        assertTrue(ChannelShare.on());
    }

    @Test public void channelPostsAndChannelForwardsLoseTheButton() {
        // A post in the channel: no person sent it, and it isn't a forward.
        assertFalse(ChannelShare.shown(0, 0, 0));
        // A channel post forwarded into a chat, whether a person or the channel sent the copy.
        assertFalse(ChannelShare.shown(1, 1, 0));
        assertFalse(ChannelShare.shown(0, 1, 0));
        assertTrue(String.join("\n", HookStatus.report()).contains("channel share button hidden"));
    }

    @Test public void peopleBotsAndSavedMessagesKeepTheirs() {
        // A bot's message or a person's media in a public group, which Telegram also gives a button.
        assertTrue(ChannelShare.shown(1, 0, 0));
        // Saved Messages' jump back to the original, forwarded from a channel or not.
        assertTrue(ChannelShare.shown(0, 1, 1));
        assertTrue(ChannelShare.shown(0, 0, 1));
        assertTrue(ChannelShare.shown(1, 1, 1));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTheButton() {
        Settings.HIDE_CHANNEL_SHARE.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), ChannelShare.on());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(ChannelShare.on()));
        SettingReadsForTests.breakReads(Settings.HIDE_CHANNEL_SHARE);
        assertFalse(ChannelShare.on());
        assertFalse(HookStatus.missing(FamilyNames.HIDE_CHANNEL_BUTTONS).isEmpty());
    }
}
