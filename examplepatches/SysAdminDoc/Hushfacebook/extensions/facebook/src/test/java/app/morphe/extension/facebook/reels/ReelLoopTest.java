/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

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
 * Clean up Reels' Play reels once switch: on, a reel whose settings ask for a loop at its end is
 * told no, so it stops there; anything that isn't a reel, and every answer while the switch is off,
 * paused or before the settings are ready, stays Facebook's.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReelLoopTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stands in for a reel's VideoPlayerParams. */
    private static final Object REEL = new Object();
    /** Stands in for a feed video's or a story's. */
    private static final Object VIDEO = new Object();

    @Before
    public void reelCheck() {
        ReelLoop.reelForTests = params -> params == REEL;
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.PLAY_REELS_ONCE.resetToDefault();
        ReelLoop.forgetForTests();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.REEL_DECLUTTER + ":")) return line;
        }
        return "";
    }

    @Test
    public void theSwitchStartsOffAndOffReelsLoop() {
        assertFalse(Settings.PLAY_REELS_ONCE.defaultValue);
        assertTrue(PatchFamily.REEL_DECLUTTER.switches.contains(Settings.PLAY_REELS_ONCE));
        assertTrue(ReelLoop.loops(true, REEL));
        assertFalse(statusLine().contains(ReelLoop.PLAYED_ONCE));
    }

    @Test
    public void onAReelStopsAtItsEnd() {
        Settings.PLAY_REELS_ONCE.save(true);
        assertFalse(ReelLoop.loops(true, REEL));
        String line = statusLine();
        assertTrue(line, line.contains(ReelLoop.PLAYED_ONCE + " 1"));
        assertTrue(line, line.contains("invoked 1, 1 found, 0 missing"));
    }

    @Test
    public void onEverythingElseKeepsFacebooksAnswer() {
        Settings.PLAY_REELS_ONCE.save(true);
        assertTrue("a feed video or a story that loops stopped looping", ReelLoop.loops(true, VIDEO));
        assertFalse("a video that doesn't loop started looping", ReelLoop.loops(false, VIDEO));
        assertFalse("a reel that doesn't loop started looping", ReelLoop.loops(false, REEL));
        assertTrue("no params, no reel", ReelLoop.loops(true, null));
        assertFalse(statusLine().contains(ReelLoop.PLAYED_ONCE));
    }

    @Test
    public void pausedReelsLoopAgain() {
        Settings.PLAY_REELS_ONCE.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertTrue(ReelLoop.loops(true, REEL));
        PauseForTests.resume();
        assertFalse(ReelLoop.loops(true, REEL));
    }

    @Test
    public void beforeTheSettingsAreReadyReelsLoop() {
        Settings.PLAY_REELS_ONCE.save(true);
        SettingsContextRule.withoutContext(() -> assertTrue(ReelLoop.loops(true, REEL)));
    }

    @Test
    public void aFailingReelCheckKeepsFacebooksAnswer() {
        Settings.PLAY_REELS_ONCE.save(true);
        ReelLoop.reelForTests = params -> {
            throw new IllegalStateException("for this test");
        };
        assertTrue(ReelLoop.loops(true, REEL));
        String line = statusLine();
        assertTrue(line, line.contains("'reel loop' hook (it threw java.lang.IllegalStateException)"));
    }

    /** Unpatched, the stub knows no reels, so nothing changes. */
    @Test
    public void theUnfilledStubKnowsNoReels() {
        ReelLoop.forgetForTests();
        Settings.PLAY_REELS_ONCE.save(true);
        assertFalse(ReelLoop.fbShorts(REEL));
        assertTrue(ReelLoop.loops(true, REEL));
    }
}
