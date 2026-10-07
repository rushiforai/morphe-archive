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
import java.util.ArrayList;
import java.util.Arrays;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class VoicePlaylistTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private final ArrayList<String> next = new ArrayList<>(Arrays.asList("second", "third"));

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.VOICE_ONE_AT_A_TIME);
        Settings.VOICE_ONE_AT_A_TIME.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultTelegramKeepsItsQueue() {
        assertFalse(Settings.VOICE_ONE_AT_A_TIME.get());
        assertSame(next, VoicePlaylist.queue(next));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.VOICE_ONE_AT_A_TIME));
    }

    @Test public void onTheQueueStaysEmpty() {
        Settings.VOICE_ONE_AT_A_TIME.save(true);
        assertNull(VoicePlaylist.queue(next));
        assertNull(VoicePlaylist.queue(null));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTheQueue() {
        Settings.VOICE_ONE_AT_A_TIME.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertSame(reason.name(), next, VoicePlaylist.queue(next));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertSame(next, VoicePlaylist.queue(next)));
        SettingReadsForTests.breakReads(Settings.VOICE_ONE_AT_A_TIME);
        assertSame(next, VoicePlaylist.queue(next));
        assertFalse(HookStatus.missing(FamilyNames.VOICE_ONE_AT_A_TIME).isEmpty());
    }
}
