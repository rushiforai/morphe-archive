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
public class VoicePlayerTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.VOICE_MUSIC_PLAYER);
        Settings.VOICE_MUSIC_PLAYER.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultOnlyMusicOpensThePlayer() {
        assertFalse(Settings.VOICE_MUSIC_PLAYER.get());
        assertTrue(VoicePlayer.plays(true, false, false));
        assertFalse(VoicePlayer.plays(false, true, false));
        assertFalse(VoicePlayer.music(null));
        assertFalse(VoicePlayer.music(new Object()));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.VOICE_MUSIC_PLAYER));
    }

    @Test public void onVoiceOpensThePlayerButViewOnceVoiceNeverDoes() {
        Settings.VOICE_MUSIC_PLAYER.save(true);
        assertTrue(VoicePlayer.plays(false, true, false));
        assertFalse(VoicePlayer.plays(false, true, true));
        assertFalse(VoicePlayer.plays(false, false, false));
        assertTrue(VoicePlayer.plays(true, false, false));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsVoiceOutOfThePlayer() {
        Settings.VOICE_MUSIC_PLAYER.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), VoicePlayer.plays(false, true, false));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(VoicePlayer.plays(false, true, false)));
        SettingReadsForTests.breakReads(Settings.VOICE_MUSIC_PLAYER);
        assertFalse(VoicePlayer.plays(false, true, false));
        assertFalse(HookStatus.missing(FamilyNames.VOICE_MUSIC_PLAYER).isEmpty());
    }
}
