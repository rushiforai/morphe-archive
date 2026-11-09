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
public class PlaybackPositionTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.PLAYBACK_POSITION);
        Settings.PLAYBACK_POSITION.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultEveryLengthIsTelegrams() {
        assertFalse(Settings.PLAYBACK_POSITION.get());
        assertEquals(300, PlaybackPosition.videoSeconds(300));
        assertEquals(120, PlaybackPosition.videoSeconds(120));
        assertEquals(300L, PlaybackPosition.videoSecondsLong(300L));
        assertEquals(600.0, PlaybackPosition.audioSeconds(600.0), 0);
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.VOICE_MUSIC_PLAYER));
    }

    @Test public void onVideosVoiceAndMusicDropToTenSeconds() {
        Settings.PLAYBACK_POSITION.save(true);
        assertEquals(10, PlaybackPosition.videoSeconds(300));
        assertEquals(10, PlaybackPosition.videoSeconds(120));
        assertEquals(10L, PlaybackPosition.videoSecondsLong(300L));
        assertEquals(10.0, PlaybackPosition.audioSeconds(300.0), 0);
        assertEquals(10.0, PlaybackPosition.audioSeconds(600.0), 0);
        assertTrue(String.join("\n", HookStatus.report()).contains("playback position kept 5"));
    }

    @Test public void aLengthTelegramAlreadyAcceptsIsNeverRaised() {
        Settings.PLAYBACK_POSITION.save(true);
        assertEquals(10, PlaybackPosition.videoSeconds(10));
        assertEquals(5, PlaybackPosition.videoSeconds(5));
        assertEquals(5.0, PlaybackPosition.audioSeconds(5.0), 0);
    }

    @Test public void pausingOrAnEarlyStartKeepsTelegramsLengths() {
        Settings.PLAYBACK_POSITION.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertEquals(reason.name(), 300, PlaybackPosition.videoSeconds(300));
            assertEquals(reason.name(), 600.0, PlaybackPosition.audioSeconds(600.0), 0);
            assertTrue(Settings.PLAYBACK_POSITION.savedValue());
            PauseForTests.resume();
            assertEquals(reason.name(), 10, PlaybackPosition.videoSeconds(300));
        }
        SettingsContextRule.withoutContext(() -> assertEquals(300, PlaybackPosition.videoSeconds(300)));
    }

    @Test public void anUnreadableSwitchKeepsTelegramsLengthsAndReportsIt() {
        Settings.PLAYBACK_POSITION.save(true);
        SettingReadsForTests.breakReads(Settings.PLAYBACK_POSITION);
        assertEquals(300L, PlaybackPosition.videoSecondsLong(300L));
        assertFalse(HookStatus.missing(FamilyNames.VOICE_MUSIC_PLAYER).isEmpty());
    }
}
