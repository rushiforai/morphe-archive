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
public class VolumeKeysTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.KEEP_VIDEOS_MUTED);
        Settings.KEEP_VIDEOS_MUTED.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultTheChatStillGetsTheKey() {
        assertFalse(Settings.KEEP_VIDEOS_MUTED.get());
        assertFalse(VolumeKeys.keepMuted());
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.KEEP_VIDEOS_MUTED));
    }

    @Test public void onTheKeyGoesToTheVolume() {
        Settings.KEEP_VIDEOS_MUTED.save(true);
        assertTrue(VolumeKeys.keepMuted());
        // The chat isn't asked, so nothing plays with sound and the key isn't kept.
        assertFalse(VolumeKeys.chatTakesKey(new Object()));
        assertTrue(String.join("\n", HookStatus.report()).contains("volume key left to the volume 2"));
    }

    @Test public void unpatchedTheChatsAnswerIsNo() {
        assertFalse(VolumeKeys.chatTakesKey(new Object()));
    }

    @Test public void pausingOrAnEarlyStartLeavesTheKeyToTheChat() {
        Settings.KEEP_VIDEOS_MUTED.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), VolumeKeys.keepMuted());
            assertTrue(Settings.KEEP_VIDEOS_MUTED.savedValue());
            PauseForTests.resume();
            assertTrue(reason.name(), VolumeKeys.keepMuted());
        }
        SettingsContextRule.withoutContext(() -> assertFalse(VolumeKeys.keepMuted()));
    }

    @Test public void anUnreadableSwitchLeavesTheKeyToTheChatAndReportsIt() {
        Settings.KEEP_VIDEOS_MUTED.save(true);
        SettingReadsForTests.breakReads(Settings.KEEP_VIDEOS_MUTED);
        assertFalse(VolumeKeys.keepMuted());
        assertFalse(HookStatus.missing(FamilyNames.KEEP_VIDEOS_MUTED).isEmpty());
    }
}
