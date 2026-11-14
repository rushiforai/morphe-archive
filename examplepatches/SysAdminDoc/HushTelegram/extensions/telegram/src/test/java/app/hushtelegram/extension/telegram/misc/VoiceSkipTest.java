/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.Collections;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.misc.FakeVoiceTelegram.Message;
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
public class VoiceSkipTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Telegram's media session buttons for a song and for a voice message (13.2). */
    private static final long SONG_ACTIONS = 2360118L;
    private static final long VOICE_ACTIONS = VoiceSkipForTests.VOICE_ACTIONS;

    private static final long CHAT = 7L;
    private static final long OTHER_CHAT = 8L;

    private VoiceSkip.Telegram stock;

    @Before public void reset() {
        stock = VoiceSkip.telegram;
        restore();
        VoiceSkip.telegram = stock;
    }

    @After public void restore() {
        if (stock != null) VoiceSkip.telegram = stock;
        VoiceSkip.forget();
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.VOICE_SKIP);
        Settings.VOICE_SKIP.resetToDefault();
        HookStatus.clear();
    }

    private FakeVoiceTelegram use(FakeVoiceTelegram telegram) {
        VoiceSkip.telegram = telegram;
        return telegram;
    }

    @Test public void theSkipButtonsAreWhatSetASongApart() {
        assertEquals(SONG_ACTIONS, VOICE_ACTIONS | VoiceSkip.SKIP_ACTIONS);
    }

    @Test public void offByDefaultVoiceMessagesKeepTelegramsButtons() {
        Message first = new Message(1, CHAT);
        Message second = new Message(2, CHAT);
        FakeVoiceTelegram telegram = use(FakeVoiceTelegram.playing(first, first, second));

        assertFalse(Settings.VOICE_SKIP.get());
        assertEquals(VOICE_ACTIONS, VoiceSkip.actions(VOICE_ACTIONS));
        assertFalse(VoiceSkip.skips(first));
        assertFalse(VoiceSkip.next(0));
        assertFalse(VoiceSkip.previous());
        assertEquals(Collections.emptyList(), telegram.calls);
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.VOICE_MUSIC_PLAYER));
    }

    @Test public void aVoiceMessageGetsNextAndPrevious() {
        Settings.VOICE_SKIP.save(true);
        Message first = new Message(1, CHAT);
        use(FakeVoiceTelegram.playing(first, first));

        assertEquals(SONG_ACTIONS, VoiceSkip.actions(VOICE_ACTIONS));
        assertTrue(VoiceSkip.skips(first));
        // While a message loads Telegram offers no buttons, and that stays so.
        assertEquals(0L, VoiceSkip.actions(0L));
    }

    @Test public void nextPlaysTheVoiceMessageAfterTheOnePlaying() {
        Settings.VOICE_SKIP.save(true);
        Message first = new Message(1, CHAT);
        Message second = new Message(2, CHAT);
        Message third = new Message(3, CHAT);
        FakeVoiceTelegram telegram = use(FakeVoiceTelegram.playing(first, first, second, third));

        assertTrue(VoiceSkip.next(0));
        assertTrue(VoiceSkip.next(0));
        assertEquals(Arrays.asList("play 2", "play 3"), telegram.calls);
        assertTrue(String.join("\n", HookStatus.report()).contains("skipped to the next voice message"));
    }

    @Test public void nextOnTheLastVoiceMessageLeavesItPlaying() {
        Settings.VOICE_SKIP.save(true);
        Message last = new Message(3, CHAT);
        FakeVoiceTelegram telegram = use(FakeVoiceTelegram.playing(last, last));

        assertTrue(VoiceSkip.next(0));
        assertSame(last, telegram.playing);
        assertEquals(Collections.emptyList(), telegram.calls);
    }

    @Test public void aMessageThatEndsByItselfIsTelegramsToFollow() {
        Settings.VOICE_SKIP.save(true);
        Message first = new Message(1, CHAT);
        FakeVoiceTelegram telegram = use(FakeVoiceTelegram.playing(first, first, new Message(2, CHAT)));

        assertFalse(VoiceSkip.next(1));
        assertEquals(Collections.emptyList(), telegram.calls);
    }

    @Test public void songsAndViewOnceMessagesAreLeftToTelegram() {
        Settings.VOICE_SKIP.save(true);
        Message song = Message.song(1, CHAT);
        FakeVoiceTelegram telegram = use(FakeVoiceTelegram.playing(song, song, Message.song(2, CHAT)));
        assertTrue(VoiceSkip.skips(song));
        assertEquals(SONG_ACTIONS, VoiceSkip.actions(SONG_ACTIONS));
        assertFalse(VoiceSkip.next(0));
        assertFalse(VoiceSkip.previous());

        Message once = new Message(3, CHAT);
        once.once = true;
        telegram = use(FakeVoiceTelegram.playing(once, once, new Message(4, CHAT)));
        assertFalse(VoiceSkip.skips(once));
        assertEquals(VOICE_ACTIONS, VoiceSkip.actions(VOICE_ACTIONS));
        assertFalse(VoiceSkip.next(0));
        assertFalse(VoiceSkip.previous());
        assertEquals(Collections.emptyList(), telegram.calls);
    }

    @Test public void previousGoesBackToTheVoiceMessageHeardBefore() {
        Settings.VOICE_SKIP.save(true);
        Message first = new Message(1, CHAT);
        Message second = new Message(2, CHAT);
        Message third = new Message(3, CHAT);
        FakeVoiceTelegram telegram = use(FakeVoiceTelegram.playing(first, first, second, third));
        VoiceSkip.actions(VOICE_ACTIONS);
        telegram.ends();
        VoiceSkip.actions(VOICE_ACTIONS);
        second.seconds = 2;

        assertTrue(VoiceSkip.previous());
        // Telegram dropped the first once it ended, so it goes back in ahead of the second.
        assertEquals(Arrays.asList("queue [1, 2, 3]", "play 1"), telegram.calls);
        assertSame(first, telegram.playing);
        assertTrue(String.join("\n", HookStatus.report()).contains("back to the previous voice message"));

        // And next carries on from there.
        telegram.calls.clear();
        assertTrue(VoiceSkip.next(0));
        assertEquals(Collections.singletonList("play 2"), telegram.calls);
    }

    @Test public void previousAfterNextNeedsNoNewQueue() {
        Settings.VOICE_SKIP.save(true);
        Message first = new Message(1, CHAT);
        Message second = new Message(2, CHAT);
        FakeVoiceTelegram telegram = use(FakeVoiceTelegram.playing(first, first, second));
        telegram.unread = true;
        assertTrue(VoiceSkip.next(0));

        assertTrue(VoiceSkip.previous());
        assertEquals(Arrays.asList("play 2", "play 1"), telegram.calls);
        assertTrue(telegram.unread);
    }

    @Test public void aRequeueKeepsTelegramsUnreadOnlyQueue() {
        Settings.VOICE_SKIP.save(true);
        Message first = new Message(1, CHAT);
        Message second = new Message(2, CHAT);
        FakeVoiceTelegram telegram = use(FakeVoiceTelegram.playing(first, first, second));
        telegram.unread = true;
        VoiceSkip.actions(VOICE_ACTIONS);
        telegram.ends();
        VoiceSkip.actions(VOICE_ACTIONS);

        assertTrue(VoiceSkip.previous());
        assertEquals(Arrays.asList("queue [1, 2] unread", "play 1"), telegram.calls);
    }

    @Test public void previousPastThreeSecondsStartsTheMessageAgain() {
        Settings.VOICE_SKIP.save(true);
        Message first = new Message(1, CHAT);
        Message second = new Message(2, CHAT);
        FakeVoiceTelegram telegram = use(FakeVoiceTelegram.playing(first, first, second));
        VoiceSkip.actions(VOICE_ACTIONS);
        telegram.ends();
        second.seconds = VoiceSkip.RESTART_AFTER_SECONDS + 1;

        assertTrue(VoiceSkip.previous());
        assertEquals(Collections.singletonList("start 2"), telegram.calls);
        assertTrue(String.join("\n", HookStatus.report()).contains("voice message started again"));
    }

    @Test public void previousOnTheFirstMessageHeardStartsItAgain() {
        Settings.VOICE_SKIP.save(true);
        Message first = new Message(5, CHAT);
        FakeVoiceTelegram telegram = use(FakeVoiceTelegram.playing(first, first, new Message(6, CHAT)));

        assertTrue(VoiceSkip.previous());
        assertEquals(Collections.singletonList("start 5"), telegram.calls);
    }

    @Test public void anotherChatStartsItsOwnHistory() {
        Settings.VOICE_SKIP.save(true);
        Message here = new Message(1, CHAT);
        FakeVoiceTelegram telegram = use(FakeVoiceTelegram.playing(here, here));
        VoiceSkip.actions(VOICE_ACTIONS);
        Message there = new Message(2, OTHER_CHAT);
        telegram = use(FakeVoiceTelegram.playing(there, there));
        VoiceSkip.actions(VOICE_ACTIONS);

        assertTrue(VoiceSkip.previous());
        assertEquals(Collections.singletonList("start 2"), telegram.calls);
    }

    @Test public void theSameMessageAgainIsMatchedByChatAndId() {
        Settings.VOICE_SKIP.save(true);
        Message first = new Message(1, CHAT);
        Message second = new Message(2, CHAT);
        FakeVoiceTelegram telegram = use(FakeVoiceTelegram.playing(first, first, second));
        VoiceSkip.actions(VOICE_ACTIONS);
        telegram.ends();
        VoiceSkip.actions(VOICE_ACTIONS);
        // Telegram builds a new MessageObject when a chat reloads.
        Message reloaded = new Message(2, CHAT);
        telegram.playing = reloaded;
        telegram.queue.set(0, reloaded);
        VoiceSkip.actions(VOICE_ACTIONS);

        assertTrue(VoiceSkip.previous());
        assertEquals(Arrays.asList("queue [1, 2]", "play 1"), telegram.calls);
    }

    @Test public void pausingOrAnEarlyStartKeepsTelegramsButtons() {
        Settings.VOICE_SKIP.save(true);
        Message first = new Message(1, CHAT);
        FakeVoiceTelegram telegram = use(FakeVoiceTelegram.playing(first, first, new Message(2, CHAT)));
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertEquals(reason.name(), VOICE_ACTIONS, VoiceSkip.actions(VOICE_ACTIONS));
            assertFalse(reason.name(), VoiceSkip.next(0));
            assertFalse(reason.name(), VoiceSkip.previous());
            assertTrue(Settings.VOICE_SKIP.savedValue());
            PauseForTests.resume();
            assertEquals(reason.name(), SONG_ACTIONS, VoiceSkip.actions(VOICE_ACTIONS));
        }
        SettingsContextRule.withoutContext(() -> assertEquals(VOICE_ACTIONS, VoiceSkip.actions(VOICE_ACTIONS)));
        assertEquals(Collections.emptyList(), telegram.calls);
    }

    @Test public void anUnreadableSwitchKeepsTelegramsButtonsAndReportsIt() {
        Settings.VOICE_SKIP.save(true);
        SettingReadsForTests.breakReads(Settings.VOICE_SKIP);
        Message first = new Message(1, CHAT);
        use(FakeVoiceTelegram.playing(first, first, new Message(2, CHAT)));

        assertEquals(VOICE_ACTIONS, VoiceSkip.actions(VOICE_ACTIONS));
        assertFalse(VoiceSkip.next(0));
        assertFalse(HookStatus.missing(FamilyNames.VOICE_MUSIC_PLAYER).isEmpty());
    }

    @Test public void aTelegramThatChangedShapeLeavesItsOwnSkipRunning() {
        Settings.VOICE_SKIP.save(true);
        Message first = new Message(1, CHAT);
        FakeVoiceTelegram telegram = use(FakeVoiceTelegram.playing(first, first, new Message(2, CHAT)));
        telegram.breaks = true;

        assertEquals(VOICE_ACTIONS, VoiceSkip.actions(VOICE_ACTIONS));
        assertFalse(VoiceSkip.next(0));
        assertFalse(VoiceSkip.previous());
        assertFalse(VoiceSkip.skips(first));
        assertFalse(HookStatus.missing(FamilyNames.VOICE_MUSIC_PLAYER).isEmpty());
    }
}
