/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.feed;

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

import java.util.Collections;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class VideoAutoplayTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /**
     * The patch is in Morphe Manager's default selection with its switch off; these tests turn it
     * on. Cleared first as well, so a test that stopped half way, or another class, leaves nothing
     * behind.
     */
    @Before public void turnTheSwitchOn() {
        restore();
        Settings.DISABLE_VIDEO_AUTOPLAY.save(true);
    }

    @After public void restore() {
        PauseForTests.resume();
        Settings.DISABLE_VIDEO_AUTOPLAY.resetToDefault();
        HookStatus.clear();
    }

    /** The switch starts off, so a default build plays videos as Threads does until it's turned on. */
    @Test public void theSwitchStartsOffAndOnHoldsAVideoThreadsWouldPlay() {
        assertFalse("the switch starts on", Settings.DISABLE_VIDEO_AUTOPLAY.defaultValue);
        assertTrue(Settings.DISABLE_VIDEO_AUTOPLAY.get());
        assertFalse(VideoAutoplay.play(true));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(FamilyNames.VIDEO_AUTOPLAY + ": invoked 1"));
        assertTrue(report, report.contains(VideoAutoplay.HELD + " 1"));
    }

    /** Off, Threads plays the video it picked, and one it didn't pick stays still. */
    @Test public void offLeavesThreadsAnswerEitherWay() {
        Settings.DISABLE_VIDEO_AUTOPLAY.save(false);
        assertTrue(VideoAutoplay.play(true));
        assertFalse("a video Threads didn't pick was started", VideoAutoplay.play(false));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(VideoAutoplay.LEFT_TO_THREADS + "switch off 1"));
    }

    /** Paused or in safe mode, the saved switch stays on and Threads' answer goes back unchanged. */
    @Test public void pauseAndSafeModeLeaveAutoplayToThreads() {
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        assertTrue(VideoAutoplay.play(true));
        assertFalse(VideoAutoplay.play(false));
        assertTrue(Settings.DISABLE_VIDEO_AUTOPLAY.savedValue());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(VideoAutoplay.LEFT_TO_THREADS + "HushThreads paused 1"));
        PauseForTests.resume();

        // Safe mode is the pause a crash loop starts.
        PauseForTests.pause(HushThreadsPause.Reason.CRASH_LOOP);
        assertTrue(VideoAutoplay.play(true));
        assertTrue(Settings.DISABLE_VIDEO_AUTOPLAY.savedValue());
    }

    /** A video Threads didn't pick is never a question: it stays still and counts nothing. */
    @Test public void aVideoThreadsDidNotPickIsNotCounted() {
        assertFalse(VideoAutoplay.play(false));
        assertEquals(Collections.emptyList(), HookStatus.missing(FamilyNames.VIDEO_AUTOPLAY));
        String report = String.join("\n", HookStatus.report());
        assertFalse(report, report.contains(VideoAutoplay.HELD));
        assertFalse(report, report.contains(VideoAutoplay.LEFT_TO_THREADS));
    }
}