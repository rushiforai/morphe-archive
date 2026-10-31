/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Collections;

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
 * Skip silent parts: with its switch on, each audio sink's skip-silence flag reaches the processor
 * chain as yes and is counted. Off, paused, or before the settings are ready, the chain gets
 * Facebook's flag, and a yes of Facebook's own always stays yes.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SkipSilenceTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        SkipSilenceForTests.forget();
        PauseForTests.resume();
        Settings.SKIP_SILENT_PARTS.resetToDefault();
        HookStatus.clear();
    }

    private static final String ON = "Skip silent parts: on";
    private static final String KEPT = "Skip silent parts: off for this video";

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.SKIP_SILENCE + ":")) return line;
        }
        return null;
    }

    @Test
    public void theSwitchStartsOffAndBelongsToItsPatch() {
        assertFalse("Skip silent parts doesn't start off", Settings.SKIP_SILENT_PARTS.defaultValue);
        assertEquals(FamilyNames.SKIP_SILENCE, PatchFamily.SKIP_SILENCE.patchName);
        assertTrue(PatchFamily.SKIP_SILENCE.switches.contains(Settings.SKIP_SILENT_PARTS));
    }

    @Test
    public void onEachSinksSoundSkipsSilentPartsAndIsCounted() {
        Settings.SKIP_SILENT_PARTS.save(true);
        assertTrue("a sink's sound kept its silent parts", SkipSilence.skipSilence(false));
        assertTrue("a yes of Facebook's own became a no", SkipSilence.skipSilence(true));
        assertTrue("the next sink's sound kept its silent parts", SkipSilence.skipSilence(false));
        assertEquals(FamilyNames.SKIP_SILENCE + ": invoked 3, 1 found, 0 missing. Counted: " + SkipSilence.SKIPPING + " 2",
                statusLine());
    }

    @Test
    public void offPausedOrColdTheChainGetsFacebooksFlag() {
        assertFalse("off, a sink's sound skipped its silent parts", SkipSilence.skipSilence(false));
        assertTrue("off, a yes of Facebook's own became a no", SkipSilence.skipSilence(true));

        Settings.SKIP_SILENT_PARTS.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(reason);
            assertFalse("a Hushfacebook paused by " + reason + " skipped silent parts", SkipSilence.skipSilence(false));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(
                "silent parts skipped before the settings were ready", SkipSilence.skipSilence(false)));

        String line = statusLine();
        assertFalse("a flag left to Facebook was counted: " + line, line != null && line.contains("Counted"));
        assertTrue("on again after the pause, a sink's sound kept its silent parts", SkipSilence.skipSilence(false));
    }

    // ---- The row (#144) -------------------------------------------------------------------------

    @Test
    public void aRowKeepsOneVideosSilentPartsAndSeeksInPlaceUntilAnotherStarts() {
        Settings.SKIP_SILENT_PARTS.save(true);
        ResumePlaybackForTests.Player first = SkipSilenceForTests.playing("111");
        assertEquals("111", SkipSilence.rowFor("111"));
        assertEquals(ON, SkipSilence.rowTitle("111"));

        SkipSilence.flip(null, "111");
        assertEquals("the playing video wasn't sought in place, so its sound kept the old flag",
                Collections.singletonList("BY_PLAYER@12000"), first.seeks);
        assertFalse("the row's video still skipped its silent parts", SkipSilence.skipSilence(false));
        assertEquals(KEPT, SkipSilence.rowTitle("111"));
        assertTrue("a yes of Facebook's own became a no", SkipSilence.skipSilence(true));

        // The same video starting again, a reel's loop, keeps the pick.
        ResumePlayback.started(first, ResumePlaybackForTests.Trigger.BY_AUTOPLAY);
        assertFalse("a loop of the row's video skipped its silent parts", SkipSilence.skipSilence(false));

        ResumePlayback.started(new ResumePlaybackForTests.Player(new ResumePlaybackForTests.Params("222", 60_000)),
                ResumePlaybackForTests.Trigger.BY_USER);
        assertTrue("the next video kept its silent parts", SkipSilence.skipSilence(false));
        assertEquals("the pick outlived another video's start", ON, SkipSilence.rowTitle("111"));
        assertTrue(statusLine(), statusLine().contains(SkipSilence.LEFT_IN + " 2"));
    }

    @Test
    public void aSecondTapSkipsAgain() {
        Settings.SKIP_SILENT_PARTS.save(true);
        ResumePlaybackForTests.Player player = SkipSilenceForTests.playing("111");
        SkipSilence.flip(null, "111");
        player.position = 15_000;
        SkipSilence.flip(null, "111");
        assertTrue("the second tap left the silent parts in", SkipSilence.skipSilence(false));
        assertEquals(ON, SkipSilence.rowTitle("111"));
        assertEquals(Arrays.asList("BY_PLAYER@12000", "BY_PLAYER@15000"), player.seeks);
    }

    @Test
    public void aRowForAVideoNotPlayingWaitsForItsStart() {
        Settings.SKIP_SILENT_PARTS.save(true);
        ResumePlaybackForTests.Player playing = SkipSilenceForTests.playing("111");
        assertEquals("a menu naming no video isn't for the playing one", "111", SkipSilence.rowFor(null));
        assertEquals("333", SkipSilence.rowFor("333"));

        SkipSilence.flip(null, "333");
        assertTrue("another video's pick sought the playing one", playing.seeks.isEmpty());
        assertTrue("another video's pick kept the playing one's silent parts", SkipSilence.skipSilence(false));

        ResumePlayback.started(new ResumePlaybackForTests.Player(new ResumePlaybackForTests.Params("333", 60_000)),
                ResumePlaybackForTests.Trigger.BY_USER);
        assertFalse("the picked video skipped its silent parts once it started", SkipSilence.skipSilence(false));
    }

    @Test
    public void noRowOffPausedOrBeforeAVideoStarted() {
        SkipSilenceForTests.playing("111");
        assertFalse("off, a start was kept for the row", SkipSilence.offersRow());
        assertNull("off, a menu got the row", SkipSilence.rowFor("111"));

        Settings.SKIP_SILENT_PARTS.save(true);
        assertNull("a menu got the row before any video started", SkipSilence.rowFor("111"));
        ResumePlaybackForTests.Player player = SkipSilenceForTests.playing("111");
        assertTrue(SkipSilence.offersRow());

        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse("paused, a menu could get the row", SkipSilence.offersRow());
        assertNull("paused, a menu got the row", SkipSilence.rowFor("111"));
        SkipSilence.flip(null, "111");
        assertTrue("paused, a tap sought the video", player.seeks.isEmpty());
        PauseForTests.resume();
        assertEquals("paused, a tap kept the silent parts", ON, SkipSilence.rowTitle("111"));
    }

    @Test
    public void aStartWhileOffForgetsTheVideoAndThePick() {
        Settings.SKIP_SILENT_PARTS.save(true);
        SkipSilenceForTests.playing("111");
        SkipSilence.flip(null, "111");
        Settings.SKIP_SILENT_PARTS.save(false);
        SkipSilenceForTests.playing("222");

        Settings.SKIP_SILENT_PARTS.save(true);
        assertFalse("a video started before the switch went off still offered a row", SkipSilence.offersRow());
        assertNull("a reel's sheet naming no video got a row for one from before", SkipSilenceRow.forReel(null));
        assertEquals("a pick outlived the switch going off", ON, SkipSilence.rowTitle("111"));
    }

    @Test
    public void theReelSheetsRowFollowsTheSameVideo() {
        assertNull("off, a reel's sheet got the row", SkipSilenceRow.forReel("111"));
        Settings.SKIP_SILENT_PARTS.save(true);
        ResumePlaybackForTests.Player reel = SkipSilenceForTests.playing("111");

        SkipSilenceRow row = SkipSilenceRow.forReel("111");
        assertNotNull("a reel's sheet got no row", row);
        assertEquals(ON, row.title());
        row.run();
        assertEquals(KEPT, row.title());
        assertEquals(Collections.singletonList("BY_PLAYER@12000"), reel.seeks);
        assertFalse(SkipSilence.skipSilence(false));
    }

    // ---- Facebook's checks on dropped frames (#286) ---------------------------------------------

    @Test
    public void whileSkippingFacebooksDropChecksReadAsOff() {
        Settings.SKIP_SILENT_PARTS.save(true);
        SkipSilenceForTests.playing("111");
        assertEquals("the health check still looks at a normal speed", 2f, SkipSilence.healthSpeed(1f), 0f);
        assertEquals("a speed the check skips anyway changed", 1.5f, SkipSilence.healthSpeed(1.5f), 0f);
        assertFalse("the drop fallback stayed on", SkipSilence.dropFallback(true));
        assertEquals("a drop threshold can still be reached", Long.MAX_VALUE, SkipSilence.dropThreshold(40));
        assertEquals("a threshold that's off came on", 0, SkipSilence.dropThreshold(0));
        assertEquals("dav1d's drop warnings still recover", 0, SkipSilence.dropRecovery(2));
        assertTrue(statusLine(), statusLine().contains(SkipSilence.HEALTH_LEFT_OUT + " 1"));
    }

    @Test
    public void offPausedOrKeptWholeFacebooksDropChecksStandAsTheyAre() {
        assertEquals("off, the health check was left out", 1f, SkipSilence.healthSpeed(1f), 0f);
        assertTrue("off, the drop fallback went off", SkipSilence.dropFallback(true));
        assertEquals("off, a threshold moved", 40, SkipSilence.dropThreshold(40));
        assertEquals("off, dav1d's recovery went off", 2, SkipSilence.dropRecovery(2));

        Settings.SKIP_SILENT_PARTS.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertEquals("paused, the health check was left out", 1f, SkipSilence.healthSpeed(1f), 0f);
        assertTrue("paused, the drop fallback went off", SkipSilence.dropFallback(true));
        PauseForTests.resume();

        SkipSilenceForTests.playing("111");
        SkipSilence.flip(null, "111");
        assertEquals("a video keeping its silent parts left the health check out", 1f, SkipSilence.healthSpeed(1f), 0f);
        assertEquals("a video keeping its silent parts moved a threshold", 40, SkipSilence.dropThreshold(40));
        assertFalse("nothing was left out, yet it was counted",
                String.valueOf(statusLine()).contains(SkipSilence.HEALTH_LEFT_OUT));
        assertFalse("a server flag that's off came on", SkipSilence.dropFallback(false));
    }

    @Test
    public void theHealthCheckIsCountedOncePerChange() {
        Settings.SKIP_SILENT_PARTS.save(true);
        for (int tick = 0; tick < 5; tick++) SkipSilence.healthSpeed(1f);
        Settings.SKIP_SILENT_PARTS.save(false);
        SkipSilence.healthSpeed(1f);
        Settings.SKIP_SILENT_PARTS.save(true);
        SkipSilence.healthSpeed(1f);
        assertTrue(statusLine(), statusLine().contains(SkipSilence.HEALTH_LEFT_OUT + " 2"));
    }
}
