/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.stories;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
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
 * Longer music on photo stories: with its switch on, a photo's song gets a 30 second clip in place
 * of Facebook's 15 seconds or a shorter server length, and that's counted. A length of 30 seconds
 * or more of Facebook's own stays. Off, paused, or before the settings are ready, Facebook's
 * length goes on untouched.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class StoryMusicTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.LONGER_STORY_MUSIC.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.STORY_MUSIC_LENGTH + ":")) return line;
        }
        return null;
    }

    @Test
    public void theSwitchStartsOffAndBelongsToItsPatch() {
        assertFalse("Longer music on photo stories doesn't start off", Settings.LONGER_STORY_MUSIC.defaultValue);
        assertEquals(FamilyNames.STORY_MUSIC_LENGTH, PatchFamily.STORY_MUSIC_LENGTH.patchName);
        assertTrue(PatchFamily.STORY_MUSIC_LENGTH.switches.contains(Settings.LONGER_STORY_MUSIC));
    }

    @Test
    public void onAPhotosSongGetsThirtySecondsAndIsCounted() {
        Settings.LONGER_STORY_MUSIC.save(true);
        assertEquals("Facebook's 15 seconds stayed", 30_000, StoryMusic.clipLength(15_000));
        assertEquals("a shorter server length stayed", 30_000, StoryMusic.clipLength(20_000));
        assertEquals("Facebook's own 30 seconds changed", 30_000, StoryMusic.clipLength(30_000));
        assertEquals("a longer server length was cut", 45_000, StoryMusic.clipLength(45_000));
        assertEquals(FamilyNames.STORY_MUSIC_LENGTH + ": invoked 4, 1 found, 0 missing. Counted: " + StoryMusic.RAISED + " 2",
                statusLine());
    }

    @Test
    public void offPausedOrColdFacebooksLengthGoesOn() {
        assertEquals("off, a photo's song got a longer clip", 15_000, StoryMusic.clipLength(15_000));

        Settings.LONGER_STORY_MUSIC.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(reason);
            assertEquals("a Hushfacebook paused by " + reason + " lengthened a photo's song",
                    15_000, StoryMusic.clipLength(15_000));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertEquals(
                "a photo's song lengthened before the settings were ready", 15_000, StoryMusic.clipLength(15_000)));

        String line = statusLine();
        assertFalse("a length left to Facebook was counted: " + line, line != null && line.contains("Counted"));
        assertEquals("on again after the pause, a photo's song kept 15 seconds", 30_000, StoryMusic.clipLength(15_000));
    }
}
