/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.PatchFamily;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Mute stories (#261): with its switch on, every story plays silent until a speaker tap or the
 * volume up key turns the sound on, which lasts until you mute or a new session starts. Off, or
 * with the feed's own switch alone, a story's volume goes through as Facebook set it.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class StorySoundTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stand-ins for Facebook's enum of sound change reasons, whose names it keeps. */
    private enum Reason { BY_USER, BY_ANDROID }

    @Before
    public void start() {
        HookStatus.clear();
        StorySound.forget();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.MUTE_STORIES.resetToDefault();
        Settings.KEEP_FEED_VIDEOS_MUTED.resetToDefault();
        StorySound.forget();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.KEEP_FEED_VIDEOS_MUTED + ":")) return line;
        }
        return null;
    }

    @Test
    public void theSwitchStartsOffAndBelongsToTheMutedPatch() {
        assertFalse("Mute stories doesn't start off", Settings.MUTE_STORIES.defaultValue);
        assertTrue(PatchFamily.KEEP_FEED_VIDEOS_MUTED.switches.contains(Settings.MUTE_STORIES));
    }

    @Test
    public void offAStoryKeepsFacebooksVolume() {
        assertEquals(1f, StorySound.volume(1f), 0f);
        assertEquals(0.5f, StorySound.volume(0.5f), 0f);
        assertEquals(0f, StorySound.volume(0f), 0f);
        // The feed's switch alone doesn't reach stories.
        Settings.KEEP_FEED_VIDEOS_MUTED.save(true);
        assertEquals(1f, StorySound.volume(1f), 0f);
    }

    @Test
    public void onAStoryStartsSilentAndIsCounted() {
        Settings.MUTE_STORIES.save(true);
        assertEquals("a story played with sound", 0f, StorySound.volume(1f), 0f);
        assertEquals("a story's own quieter volume went through", 0f, StorySound.volume(0.4f), 0f);
        assertEquals("a silent story got sound", 0f, StorySound.volume(0f), 0f);
        String line = statusLine();
        assertNotNull(line);
        assertTrue(line, line.contains(StorySound.KEPT_MUTED + " 2"));
    }

    @Test
    public void yourSoundOnLastsUntilYouMuteOrANewSession() {
        Settings.MUTE_STORIES.save(true);
        // Facebook's own sound-on isn't yours.
        FeedSound.soundChange(Reason.BY_ANDROID, true, false);
        assertEquals("Facebook's sound-on reached stories", 0f, StorySound.volume(1f), 0f);

        FeedSound.soundChange(Reason.BY_USER, true, false);
        assertEquals("your speaker tap didn't reach stories", 1f, StorySound.volume(1f), 0f);
        assertEquals("the next story lost your sound", 0.7f, StorySound.volume(0.7f), 0f);

        FeedSound.soundChange(Reason.BY_ANDROID, false, true);
        assertEquals("Facebook's mute took your choice away", 1f, StorySound.volume(1f), 0f);

        FeedSound.soundChange(Reason.BY_USER, false, true);
        assertEquals("your mute didn't reach stories", 0f, StorySound.volume(1f), 0f);

        FeedSound.soundChange(Reason.BY_USER, true, false);
        assertEquals(1f, StorySound.volume(1f), 0f);
        FeedSound.sessionSound(true);
        assertEquals("a new session kept the sound on", 0f, StorySound.volume(1f), 0f);
    }

    @Test
    public void theVolumeKeyCountsAsYours() {
        Settings.MUTE_STORIES.save(true);
        onKeyUp();
        assertEquals("volume up didn't reach stories", 1f, StorySound.volume(1f), 0f);
    }

    /** A volume up key reaches Facebook through an activity's onKeyUp. */
    private static void onKeyUp() {
        FeedSound.soundChange(Reason.BY_ANDROID, true, false);
    }

    @Test
    public void storiesDontChangeTheFeedsAnswers() {
        Settings.MUTE_STORIES.save(true);
        assertTrue("Facebook's sound-on was held with only stories muted",
                FeedSound.soundChange(Reason.BY_ANDROID, true, false));
        assertTrue("a session started muted with only stories muted", FeedSound.sessionSound(true));
        Settings.KEEP_FEED_VIDEOS_MUTED.save(true);
        assertFalse("the feed let Facebook's sound-on through", FeedSound.soundChange(Reason.BY_ANDROID, true, false));
        assertTrue("the feed held your speaker tap", FeedSound.soundChange(Reason.BY_USER, true, false));
        assertEquals(1f, StorySound.volume(1f), 0f);
    }

    @Test
    public void pausedOrBeforeTheSettingsAStoryKeepsFacebooksVolume() {
        Settings.MUTE_STORIES.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertEquals("a paused Hushfacebook muted a story", 1f, StorySound.volume(1f), 0f);
        PauseForTests.resume();
        SettingsContextRule.withoutContext(() -> assertEquals(
                "a story was muted before the settings were ready", 1f, StorySound.volume(1f), 0f));
    }
}
