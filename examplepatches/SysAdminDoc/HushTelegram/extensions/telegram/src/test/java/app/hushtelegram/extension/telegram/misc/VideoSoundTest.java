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
import android.view.KeyEvent;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class VideoSoundTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        VideoSound.reset();
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.VIDEO_STARTS_SILENT);
        Settings.VIDEO_STARTS_SILENT.resetToDefault();
        HookStatus.clear();
    }

    private static String report() { return String.join("\n", HookStatus.report()); }

    @Test public void offByDefaultAVideoPlaysWithSoundUnlessTelegramMutesIt() {
        Object player = new Object();
        assertFalse(Settings.VIDEO_STARTS_SILENT.get());
        assertFalse(VideoSound.muted(player, false));
        assertTrue("a video sent without sound, or on a cast device", VideoSound.muted(player, true));
        assertFalse(report(), report().contains(VideoSound.STARTED_SILENT));
    }

    @Test public void onAnOpenedVideoStaysSilentEveryTimeTelegramGivesItSound() {
        Settings.VIDEO_STARTS_SILENT.save(true);
        Object player = new Object();
        // Starting, buffering and the first frame each tell the player again.
        assertTrue(VideoSound.muted(player, false));
        assertTrue(VideoSound.muted(player, false));
        assertTrue(VideoSound.muted(player, false));
        assertTrue(report(), report().contains(VideoSound.STARTED_SILENT + " 3"));
    }

    @Test public void aVolumeKeyGivesThatVideoItsSoundAndTheNextOneStartsSilent() {
        Settings.VIDEO_STARTS_SILENT.save(true);
        Object first = new Object();
        assertTrue(VideoSound.muted(first, false));
        VideoSound.setVolume(first, 1f);
        assertFalse("the volume key's video", VideoSound.muted(first, false));
        assertFalse("still after it buffers", VideoSound.muted(first, false));
        assertTrue(report(), report().contains(VideoSound.GIVEN_SOUND + " 1"));

        Object next = new Object();
        assertTrue("the next video gets a new player", VideoSound.muted(next, false));
    }

    private static KeyEvent press(int key) { return new KeyEvent(KeyEvent.ACTION_DOWN, key); }

    @Test public void aVolumeKeyInTheViewerGivesTheSilentVideoItsSound() {
        Settings.VIDEO_STARTS_SILENT.save(true);
        Object player = new Object();
        assertTrue(VideoSound.muted(player, false));
        // A held key, a key let go, another key or no video open leave it silent.
        VideoSound.volumeKey(player, new KeyEvent(0, 0, KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_VOLUME_UP, 1));
        VideoSound.volumeKey(player, new KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_VOLUME_UP));
        VideoSound.volumeKey(player, press(KeyEvent.KEYCODE_BACK));
        VideoSound.volumeKey(null, press(KeyEvent.KEYCODE_VOLUME_UP));
        VideoSound.volumeKey(player, null);
        assertTrue(VideoSound.muted(player, false));
        assertFalse(report(), report().contains(VideoSound.GIVEN_SOUND));

        VideoSound.volumeKey(player, press(KeyEvent.KEYCODE_VOLUME_DOWN));
        assertFalse("either volume key", VideoSound.muted(player, false));
        assertFalse("still after it buffers", VideoSound.muted(player, false));
        assertTrue(report(), report().contains(VideoSound.GIVEN_SOUND + " 1"));
        assertTrue("the next video starts silent again", VideoSound.muted(new Object(), false));
    }

    @Test public void aVolumeKeyLeavesTelegramsOwnMuteAndVideosTheSwitchNeverSilenced() {
        Object player = new Object();
        assertFalse("switch off", VideoSound.muted(player, false));
        VideoSound.volumeKey(player, press(KeyEvent.KEYCODE_VOLUME_UP));

        Settings.VIDEO_STARTS_SILENT.save(true);
        Object cast = new Object();
        assertTrue(VideoSound.muted(cast, false));
        assertTrue("a cast device or a video sent without sound", VideoSound.muted(cast, true));
        VideoSound.volumeKey(cast, press(KeyEvent.KEYCODE_VOLUME_UP));
        assertTrue(VideoSound.muted(cast, true));
        // An older video's key doesn't reach the one open now.
        Object old = new Object();
        Object open = new Object();
        assertTrue(VideoSound.muted(old, false));
        assertTrue(VideoSound.muted(open, false));
        VideoSound.volumeKey(old, press(KeyEvent.KEYCODE_VOLUME_UP));
        assertTrue(VideoSound.muted(open, false));
        assertFalse(report(), report().contains(VideoSound.GIVEN_SOUND));
    }

    @Test public void theEditorStartingAVideoAtNoVolumeDoesntCountAsSound() {
        Settings.VIDEO_STARTS_SILENT.save(true);
        Object player = new Object();
        VideoSound.setVolume(player, 0f);
        assertTrue(VideoSound.muted(player, false));
        assertFalse(report(), report().contains(VideoSound.GIVEN_SOUND));
    }

    @Test public void theEditorsSoundButtonTurningSoundBackOnIsHeard() {
        Settings.VIDEO_STARTS_SILENT.save(true);
        Object player = new Object();
        assertTrue(VideoSound.muted(player, false));
        // Mute, then sound on again: Telegram's own flag going back to off.
        assertTrue(VideoSound.muted(player, true));
        assertFalse(VideoSound.muted(player, false));
        assertFalse(VideoSound.muted(player, false));
        // Another player muted by Telegram doesn't hand the first one's sound to a new video.
        Object other = new Object();
        assertTrue(VideoSound.muted(other, false));
    }

    @Test public void pausingOrAnEarlyStartLeavesTheSoundToTelegram() {
        Settings.VIDEO_STARTS_SILENT.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), VideoSound.muted(new Object(), false));
            assertTrue(Settings.VIDEO_STARTS_SILENT.savedValue());
            PauseForTests.resume();
            assertTrue(reason.name(), VideoSound.muted(new Object(), false));
        }
        SettingsContextRule.withoutContext(() -> assertFalse(VideoSound.muted(new Object(), false)));
    }

    @Test public void anUnreadableSwitchLeavesTheSoundToTelegramAndReportsIt() {
        Settings.VIDEO_STARTS_SILENT.save(true);
        SettingReadsForTests.breakReads(Settings.VIDEO_STARTS_SILENT);
        assertFalse(VideoSound.muted(new Object(), false));
        assertFalse(HookStatus.missing(FamilyNames.KEEP_VIDEOS_MUTED).isEmpty());
    }

    @Test public void unpatchedTheHooksStillRun() {
        Settings.VIDEO_STARTS_SILENT.save(true);
        Object player = new Object();
        VideoSound.setMute(player, 0);
        VideoSound.setVolume(player, 1f);
        VideoSound.setMute(player, 0);
        assertTrue(report(), report().contains(VideoSound.STARTED_SILENT + " 1"));
        assertTrue(report(), report().contains(VideoSound.GIVEN_SOUND + " 1"));
    }
}
