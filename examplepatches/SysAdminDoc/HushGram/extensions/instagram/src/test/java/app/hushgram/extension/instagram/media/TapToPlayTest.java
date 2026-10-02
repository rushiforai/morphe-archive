/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Modified for HushGram (Instagram), 2026.
 */
package app.hushgram.extension.instagram.media;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.ViewConfiguration;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;

import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;
import app.hushgram.extension.shared.settings.preference.LogBufferManager;

/**
 * The rule Tap to play holds every start to: a start goes ahead on an armed player or within a
 * second of a tap, whatever reason Instagram gives. Everything else is held. Off, paused, before
 * the settings are ready, or when the rule throws, every start goes ahead, and the autoplay check
 * answers what Instagram decided.
 */
@RunWith(RobolectricTestRunner.class)
public class TapToPlayTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Reasons Instagram 449 hands playInternal and IgGrootPlayer's play. */
    private static final List<String> REASONS = Arrays.asList(
            "autoplay", "resume", "start", "retry", "play_after_recovery", "seek_force_pause", "ig_live_pip");

    @Before
    public void start() {
        // Moves the clock well past zero, so "a tap five seconds ago" is a time the clock has seen.
        SystemClock.sleep(60_000);
        TapToPlayForTests.forget();
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.TAP_TO_PLAY.resetToDefault();
        BaseSettings.DEBUG.resetToDefault();
        TapToPlayForTests.forget();
        HookStatus.clear();
        LogBufferManager.clearLogBuffer();
    }

    /** Stands in for IgVideoPlayerImpl's state enum: only the constant names matter. */
    private enum State { IDLE, PREPARING, PREPARED, PLAYING, PAUSED, STOPPING }

    private static void tapAt(long upAt) {
        TapClock.record(MotionEvent.ACTION_DOWN, 50, 50, upAt - 90, 8);
        TapClock.record(MotionEvent.ACTION_UP, 51, 52, upAt, 8);
    }

    @Test
    public void theSwitchStartsOn() {
        assertTrue("picking the patch is the choice to use it", Settings.TAP_TO_PLAY.get());
    }

    @Test
    public void noStartGoesAheadWithoutATap() {
        for (String reason : REASONS) {
            assertFalse(reason, TapToPlay.allowStart(new Object(), reason));
            assertFalse(reason, TapToPlay.allowDirectStart(new Object(), reason));
        }
        assertFalse("no reason at all", TapToPlay.allowStart(new Object(), null));
        assertEquals("a held start arms nothing", 0, TapToPlay.armedCount());
    }

    @Test
    public void aStartWithinASecondOfATapGoesAhead() {
        long now = 100_000;
        tapAt(now - TapToPlay.TAP_WINDOW_MS);
        assertTrue("that tap's own first start", TapToPlay.decide(new Object(), "autoplay", now - 900, ""));
        assertTrue("another start on it, exactly a second after it", TapToPlay.decide(new Object(), "autoplay", now, ""));
        tapAt(now - TapToPlay.TAP_WINDOW_MS - 1);
        assertTrue("that tap's own first start", TapToPlay.decide(new Object(), "autoplay", now - TapToPlay.TAP_WINDOW_MS + 9, ""));
        assertFalse("another start just over a second after it", TapToPlay.decide(new Object(), "autoplay", now, ""));
        tapAt(now + 5);
        assertFalse("a tap the clock hasn't reached yet", TapToPlay.decide(new Object(), "autoplay", now, ""));
    }

    /**
     * A story a tap opened can take seconds to load, so the tap's first start goes ahead up to
     * {@link TapToPlay#LOAD_WINDOW_MS} after it. The next start past the second doesn't, nor does a
     * first start later than that, nor one after a drag.
     */
    @Test
    public void aTapsFirstStartMayComeAsLateAsALoad() {
        long now = 400_000;
        tapAt(now - 1_700);
        assertTrue("the story, 1.7 seconds after the tap", TapToPlay.decide(new Object(), "autoplay", now, ""));
        assertFalse("the next story, advanced to on its own", TapToPlay.decide(new Object(), "autoplay", now + 5_000, ""));
        assertFalse("another start on the same tap", TapToPlay.decide(new Object(), "autoplay", now + 1, ""));

        tapAt(now - TapToPlay.LOAD_WINDOW_MS);
        assertTrue("a first start exactly a load after the tap", TapToPlay.decide(new Object(), "autoplay", now, ""));
        tapAt(now - TapToPlay.LOAD_WINDOW_MS - 1);
        assertFalse("a first start later than a load", TapToPlay.decide(new Object(), "autoplay", now, ""));

        tapAt(now - 1_700);
        TapClock.record(MotionEvent.ACTION_DOWN, 50, 500, now - 1_000, 8);
        TapClock.record(MotionEvent.ACTION_MOVE, 50, 300, now - 900, 8);
        TapClock.record(MotionEvent.ACTION_UP, 50, 100, now - 800, 8);
        assertFalse("a drag since the tap", TapToPlay.decide(new Object(), "autoplay", now, ""));
    }

    /**
     * A tap that plays a video again on its still armed player uses the tap, so a second video
     * can't start on it a couple of seconds later. An armed restart more than a second after a tap
     * leaves that tap's first start to the video it opened.
     */
    @Test
    public void anArmedPlayersStartRightAfterATapUsesIt() {
        long now = 500_000;
        Object player = new Object();
        tapAt(now - 10_000);
        assertTrue(TapToPlay.decide(player, "autoplay", now - 9_900, ""));

        tapAt(now - 100);
        assertTrue("the video played again", TapToPlay.decide(player, "resume", now, ""));
        assertFalse("another video 1.5 seconds after the tap", TapToPlay.decide(new Object(), "autoplay", now + 1_400, ""));

        tapAt(now + 10_000);
        assertTrue("an armed restart 1.5 seconds after a tap", TapToPlay.decide(player, "resume", now + 11_500, ""));
        assertTrue("the story that tap opened", TapToPlay.decide(new Object(), "autoplay", now + 11_600, ""));
    }

    /** A story you tap starts with "autoplay", and playInternal only ever hears "autoplay" or "resume". */
    @Test
    public void anyReasonRightAfterATapGoesAhead() {
        long now = 200_000;
        tapAt(now - 300);
        for (String reason : REASONS) assertTrue(reason, TapToPlay.decide(new Object(), reason, now, ""));
    }

    @Test
    public void anArmedPlayerRestartsUntilItsPaused() {
        Object player = new Object();
        Object other = new Object();
        TapToPlayForTests.tapEnded(100);
        assertTrue(TapToPlay.allowStart(player, "autoplay"));
        assertTrue(TapToPlay.armed(player));
        TapClock.forget();

        assertTrue("IgGrootPlayer's own play of the same player", TapToPlay.allowDirectStart(player, "autoplay"));
        assertTrue("a resume", TapToPlay.allowStart(player, "resume"));
        assertFalse("another player", TapToPlay.allowStart(other, "autoplay"));

        TapToPlay.paused(player, "scroll");
        assertFalse(TapToPlay.armed(player));
        assertFalse("the start after a pause", TapToPlay.allowStart(player, "resume"));

        TapToPlayForTests.tapEnded(10);
        assertTrue("a tap plays it again", TapToPlay.allowStart(player, "resume"));
    }

    /** A seek pauses and plays again, and a reel loops the same way: neither undoes the tap. */
    @Test
    public void momentaryPausesKeepThePlayerArmed() {
        for (String reason : TapToPlay.MOMENTARY) {
            Object player = new Object();
            TapToPlayForTests.tapEnded(10);
            assertTrue(TapToPlay.allowDirectStart(player, "start"));
            TapClock.forget();
            TapToPlay.paused(player, reason);
            assertTrue(reason, TapToPlay.armed(player));
            assertTrue(reason, TapToPlay.allowDirectStart(player, reason));
        }
        Object held = new Object();
        TapToPlay.paused(held, "seek_force_pause");
        assertFalse("a seek on a held player doesn't start it", TapToPlay.allowDirectStart(held, "seek_force_pause"));
        Object paused = new Object();
        TapToPlayForTests.tapEnded(10);
        assertTrue(TapToPlay.allowDirectStart(paused, "start"));
        TapToPlay.paused(paused, null);
        assertFalse("a pause with no reason", TapToPlay.armed(paused));
    }

    /**
     * The long video viewer's scrubber pauses a playing video with "Seek start" and plays it again
     * when the drag ends, with an automatic start and no tap, since a drag isn't one. The video
     * plays on from where it was dragged to.
     */
    @Test
    public void aDragOfTheLongVideoScrubberKeepsItPlaying() {
        Object player = new Object();
        TapToPlayForTests.tapEnded(10);
        assertTrue(TapToPlay.allowStart(player, "autoplay"));
        TapClock.forget();

        TapToPlay.paused(player, "Seek start");

        assertTrue("the seek's pause disarmed it", TapToPlay.armed(player));
        assertTrue("the play at the drag's end", TapToPlay.allowStart(player, "autoplay"));
    }

    /** Debug logging says what ended a start, and a pause Instagram plays on from ends none. */
    @Test
    public void debugLoggingSaysWhatEndedAStart() {
        BaseSettings.DEBUG.save(true);
        LogBufferManager.clearLogBuffer();
        Object seeking = new Object();
        Object scrolled = new Object();
        Object rebound = new Object();
        TapToPlayForTests.tapEnded(10);
        for (Object player : Arrays.asList(seeking, scrolled, rebound)) assertTrue(TapToPlay.allowStart(player, "autoplay"));
        TapClock.forget();
        SystemClock.sleep(TapToPlay.BIND_GRACE_MS + 1);

        TapToPlay.paused(seeking, "Seek start");
        TapToPlay.paused(scrolled, "scroll");
        TapToPlay.paused(new Object(), "scroll");
        TapToPlay.rebound(rebound);

        String report = LogBufferManager.buildExportText();
        assertEquals(report, 1, occurrences(report, "Tap to play: a pause for scroll ends a start"));
        assertTrue(report, report.contains("Tap to play: a new video ends a start"));
        assertFalse(report, report.contains("Seek start ends"));
    }

    /** A new video disarms, but not a prepare right after the start the gate just let through. */
    @Test
    public void aNewVideoDisarmsButTheStartsOwnPrepareDoesnt() {
        Object player = new Object();
        TapToPlayForTests.tapEnded(20);
        assertTrue(TapToPlay.allowStart(player, "autoplay"));
        TapToPlay.rebound(player);
        assertTrue("the prepare right after the start", TapToPlay.armed(player));

        SystemClock.sleep(TapToPlay.BIND_GRACE_MS + 1);
        TapToPlay.rebound(player);
        assertFalse("the next video", TapToPlay.armed(player));
        assertFalse(TapToPlay.allowStart(player, "autoplay"));
    }

    @Test
    public void aRapidSwipeCannotReuseThePreviousTapOrThePlayersPrepareGrace() {
        Object player = new Object();
        tapAt(SystemClock.uptimeMillis());
        assertTrue(TapToPlay.allowStart(player, "autoplay"));
        TapToPlay.rebound(player);
        assertTrue("the tap's own prepare", TapToPlay.armed(player));

        SystemClock.sleep(10);
        long swipe = SystemClock.uptimeMillis();
        TapClock.record(MotionEvent.ACTION_DOWN, 50, 500, swipe, 8);
        TapClock.record(MotionEvent.ACTION_MOVE, 50, 300, swipe, 8);
        assertFalse("another player cannot borrow the previous tap during a swipe",
                TapToPlay.allowStart(new Object(), "autoplay"));
        assertTrue("scrolling alone doesn't interrupt the current video", TapToPlay.armed(player));
        TapToPlay.rebound(player);
        assertFalse("a new video after the swipe cannot borrow the previous start", TapToPlay.armed(player));
        TapClock.record(MotionEvent.ACTION_UP, 50, 100, swipe, 8);
        assertFalse(TapToPlay.allowStart(player, "autoplay"));
        assertFalse(TapToPlay.allowDirectStart(player, "start"));

        SystemClock.sleep(1);
        tapAt(SystemClock.uptimeMillis());
        assertTrue("the next video's own tap works", TapToPlay.allowStart(player, "autoplay"));
        TapToPlay.rebound(player);
        assertTrue("that tap keeps its own prepare grace", TapToPlay.armed(player));
    }

    /** Players are told apart by identity, so one whose equals claims another is still itself. */
    @Test
    public void playersAreToldApartByIdentity() {
        Object player = new AlwaysEqual();
        Object twin = new AlwaysEqual();
        TapToPlayForTests.tapEnded(20);
        assertTrue(TapToPlay.allowStart(player, "autoplay"));
        TapClock.forget();
        assertFalse(TapToPlay.allowStart(twin, "autoplay"));
        TapToPlay.paused(twin, "scroll");
        assertTrue(TapToPlay.armed(player));
    }

    /** An armed player Instagram drops is forgotten with it: the gate holds no player in memory. */
    @Test
    public void aDroppedPlayerIsForgotten() throws InterruptedException {
        TapToPlayForTests.tapEnded(20);
        WeakReference<Object> dropped = armOne();
        for (int i = 0; i < 100 && dropped.get() != null; i++) {
            System.gc();
            Thread.sleep(10);
        }
        assertNull("the gate kept the player alive", dropped.get());
        assertEquals(0, TapToPlay.armedCount());
    }

    private static WeakReference<Object> armOne() {
        Object player = new Object();
        assertTrue(TapToPlay.allowStart(player, "autoplay"));
        assertEquals(1, TapToPlay.armedCount());
        return new WeakReference<>(player);
    }

    @Test
    public void offPausedOrNotReadyEveryStartGoesAhead() {
        Settings.TAP_TO_PLAY.save(false);
        assertTrue(TapToPlay.allowStart(new Object(), "autoplay"));
        assertTrue(TapToPlay.allowDirectStart(new Object(), "autoplay"));
        assertTrue("Instagram's own answer", TapToPlay.autoplayAllowed(true));
        Settings.TAP_TO_PLAY.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertTrue(TapToPlay.allowStart(new Object(), "autoplay"));
        assertTrue(TapToPlay.autoplayAllowed(true));
        PauseForTests.resume();
        assertFalse("the control: running, the same start is held", TapToPlay.allowStart(new Object(), "autoplay"));
        assertEquals("nothing armed while off or paused", 0, TapToPlay.armedCount());
    }

    @Test
    public void aStartBeforeTheSettingsAreReadyGoesAhead() {
        SettingsContextRule.withoutContext(() -> {
            assertTrue(TapToPlay.allowStart(new Object(), "autoplay"));
            assertTrue(TapToPlay.autoplayAllowed(true));
        });
        SettingsContextRule.beforeThePauseIsDecided(() -> {
            assertTrue(TapToPlay.allowStart(new Object(), "autoplay"));
            assertTrue(TapToPlay.autoplayAllowed(true));
        });
        assertFalse("the control: ready, the same start is held", TapToPlay.allowStart(new Object(), "autoplay"));
    }

    @Test
    public void aFailureLetsTheStartGoAheadAndTheReportSaysSo() {
        TapToPlay.failNext = new IllegalStateException("the rule failed");
        assertTrue(TapToPlay.allowStart(new Object(), "autoplay"));
        assertEquals(Collections.singletonList("a working 'player start' hook (it threw "
                        + IllegalStateException.class.getName() + ")"),
                HookStatus.missing(FamilyNames.TAP_TO_PLAY));
        assertFalse("only the one start went ahead", TapToPlay.allowStart(new Object(), "autoplay"));

        TapToPlay.failNext = new IllegalStateException("the rule failed");
        assertTrue(TapToPlay.allowDirectStart(new Object(), "autoplay"));
        assertTrue(String.join("\n", HookStatus.missing(FamilyNames.TAP_TO_PLAY)),
                HookStatus.missing(FamilyNames.TAP_TO_PLAY).contains("a working 'direct start' hook (it threw "
                        + IllegalStateException.class.getName() + ")"));
    }

    @Test
    public void eachHookCountsAndBindsInTheReport() {
        TapToPlay.allowStart(new Object(), "autoplay");
        TapToPlay.allowDirectStart(new Object(), "autoplay");
        TapToPlay.paused(new Object(), "scroll");
        TapToPlay.rebound(new Object());
        TapToPlay.autoplayAllowed(true);
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(FamilyNames.TAP_TO_PLAY + ": invoked 5, 5 found, 0 missing"));
    }

    /**
     * Only a reel Instagram's resume can restart goes down it: prepared, where the gate leaves a held
     * reel, or paused. Idle, loading, stopping or playing, the tap does what Instagram decided.
     */
    @Test
    public void aTapOnAPreparedOrPausedReelStartsIt() {
        Object navigator = new Object();
        for (State state : State.values()) {
            TapToPlay.reelStates = asked -> {
                assertSame(navigator, asked);
                return state;
            };
            boolean resumable = state == State.PREPARED || state == State.PAUSED;
            assertEquals(state.name(), resumable, TapToPlay.resumeOnTap(false, navigator));
        }
        TapToPlay.reelStates = asked -> null;
        assertFalse("no player under the tap: Instagram's answer", TapToPlay.resumeOnTap(false, navigator));
        assertFalse(TapToPlay.resumeOnTap(false, null));
        assertTrue(HookStatus.missing(FamilyNames.TAP_TO_PLAY).toString(), HookStatus.missing(FamilyNames.TAP_TO_PLAY).isEmpty());
    }

    /** A reel you paused yourself already resumes. The reader isn't asked, so it can't turn that yes into a no. */
    @Test
    public void instagramsOwnResumeNeverAsksTheReader() {
        TapToPlay.reelStates = asked -> {
            throw new AssertionError("asked about a tap Instagram already resumes");
        };
        assertTrue(TapToPlay.resumeOnTap(true, new Object()));
        assertTrue(HookStatus.missing(FamilyNames.TAP_TO_PLAY).toString(), HookStatus.missing(FamilyNames.TAP_TO_PLAY).isEmpty());
    }

    /**
     * The sequence on the phone. Instagram's own start of the reel was held. A tap lands on it, the
     * tap takes the resume path, and the start that path makes on the same tap goes ahead and arms
     * the player. Without that tap, the same start is held.
     */
    @Test
    public void aTapOnAHeldReelResumesItAndThatStartGoesAhead() {
        long now = 300_000;
        Object player = new Object();
        assertFalse("Instagram's own start, with no tap", TapToPlay.decide(player, "autoplay", now - 5_000, ""));
        TapToPlay.reelStates = asked -> State.PREPARED;
        tapAt(now);
        assertTrue("the tap takes the resume path", TapToPlay.resumeOnTap(false, new Object()));
        assertTrue("the resume's start, on the tap", TapToPlay.decide(player, "resume", now + 20, ""));
        assertTrue("armed, so it plays on", TapToPlay.armed(player));
        assertFalse("the same start with the tap long gone",
                TapToPlay.decide(new Object(), "resume", now + TapToPlay.TAP_WINDOW_MS + 1, ""));
    }

    @Test
    public void offPausedOrNotReadyATapOnAReelDoesWhatInstagramDecided() {
        TapToPlay.reelStates = asked -> State.PREPARED;
        Settings.TAP_TO_PLAY.save(false);
        assertFalse(TapToPlay.resumeOnTap(false, new Object()));
        Settings.TAP_TO_PLAY.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertFalse(TapToPlay.resumeOnTap(false, new Object()));
        PauseForTests.resume();
        SettingsContextRule.withoutContext(() -> assertFalse(TapToPlay.resumeOnTap(false, new Object())));
        assertTrue("the control: on, the same tap starts the reel", TapToPlay.resumeOnTap(false, new Object()));
    }

    @Test
    public void anUnfilledReaderOrAFailureLeavesTheTapToInstagram() {
        // forget() put back the stub the patch fills in.
        assertFalse(TapToPlay.resumeOnTap(false, new Object()));
        List<String> missing = HookStatus.missing(FamilyNames.TAP_TO_PLAY);
        assertTrue(missing.toString(), missing.contains("method ClipsVideoPlayerController#the reel's state"));

        TapToPlay.reelStates = asked -> {
            throw new IllegalStateException("the controller failed");
        };
        assertFalse(TapToPlay.resumeOnTap(false, new Object()));
        missing = HookStatus.missing(FamilyNames.TAP_TO_PLAY);
        assertTrue(missing.toString(), missing.contains("a working 'Reels tap' hook (it threw "
                + IllegalStateException.class.getName() + ")"));
    }

    /** A press held [heldFor] ms that ended at [upAt]. */
    private static void holdEnded(long upAt, long heldFor) {
        TapClock.record(MotionEvent.ACTION_DOWN, 50, 50, upAt - heldFor, 8);
        TapClock.record(MotionEvent.ACTION_UP, 51, 52, upAt, 8);
    }

    private static long aHold() {
        return ViewConfiguration.getLongPressTimeout() + 200;
    }

    /**
     * The sequence on the phone. Instagram advanced to a story by itself and the gate held its start.
     * A press, a hold and a release: the story player's resume answers no, since the story never
     * played, and the hook turns that into a yes. The start that resume makes goes ahead on the
     * release, and the story plays.
     */
    @Test
    public void theReleaseOfAHoldStartsAHeldStory() {
        Object groot = new Object();
        Object storyPlayer = new Object();
        TapToPlay.storyPlayers = asked -> {
            assertSame(storyPlayer, asked);
            return groot;
        };
        assertFalse("Instagram's advance, with no tap", TapToPlay.allowDirectStart(groot, "autoplay"));
        holdEnded(SystemClock.uptimeMillis(), aHold());
        assertTrue("the release takes the resume path", TapToPlay.resumeHeldStory(false, storyPlayer));
        assertTrue("the resume's start, on the release", TapToPlay.allowDirectStart(groot, "resume"));
        assertTrue("armed, so it plays on", TapToPlay.armed(groot));
        assertFalse("it played, so it's no longer held", TapToPlay.resumeHeldStory(false, storyPlayer));
        assertTrue(HookStatus.missing(FamilyNames.TAP_TO_PLAY).toString(), HookStatus.missing(FamilyNames.TAP_TO_PLAY).isEmpty());
    }

    /**
     * A quick tap moves between stories, so its release gets Instagram's answer, and so do a release
     * long after the hold (a sheet closing), a story the gate never held, one with no player yet and
     * a held player that has been given a new story since.
     */
    @Test
    public void onlyAHoldsReleaseOnAHeldStoryStartsIt() {
        Object groot = new Object();
        TapToPlay.storyPlayers = asked -> groot;
        assertFalse(TapToPlay.allowDirectStart(groot, "autoplay"));
        long now = SystemClock.uptimeMillis();
        holdEnded(now, 90);
        assertFalse("a quick tap", TapToPlay.resumeHeldStory(false, new Object()));
        holdEnded(now - TapToPlay.TAP_WINDOW_MS - 1, aHold());
        assertFalse("a hold that ended too long ago", TapToPlay.resumeHeldStory(false, new Object()));

        holdEnded(now, aHold());
        TapToPlay.storyPlayers = asked -> new Object();
        assertFalse("a story the gate never held", TapToPlay.resumeHeldStory(false, new Object()));
        TapToPlay.storyPlayers = asked -> null;
        assertFalse("no player yet", TapToPlay.resumeHeldStory(false, new Object()));
        assertFalse(TapToPlay.resumeHeldStory(false, null));
        TapToPlay.storyPlayers = asked -> groot;
        assertTrue("the control: the same release on the held story", TapToPlay.resumeHeldStory(false, new Object()));
        TapToPlay.rebound(groot);
        assertFalse("the held player got a new story", TapToPlay.resumeHeldStory(false, new Object()));
    }

    /** A story Instagram paused while it played already resumes. The reader isn't asked. */
    @Test
    public void instagramsOwnStoryResumeNeverAsksTheReader() {
        TapToPlay.storyPlayers = asked -> {
            throw new AssertionError("asked about a resume Instagram already makes");
        };
        holdEnded(SystemClock.uptimeMillis(), aHold());
        assertTrue(TapToPlay.resumeHeldStory(true, new Object()));
        assertTrue(HookStatus.missing(FamilyNames.TAP_TO_PLAY).toString(), HookStatus.missing(FamilyNames.TAP_TO_PLAY).isEmpty());
    }

    @Test
    public void offPausedOrNotReadyAStoryReleaseDoesWhatInstagramDecided() {
        Object groot = new Object();
        TapToPlay.storyPlayers = asked -> groot;
        assertFalse(TapToPlay.allowDirectStart(groot, "autoplay"));
        holdEnded(SystemClock.uptimeMillis(), aHold());
        Settings.TAP_TO_PLAY.save(false);
        assertFalse(TapToPlay.resumeHeldStory(false, new Object()));
        Settings.TAP_TO_PLAY.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertFalse(TapToPlay.resumeHeldStory(false, new Object()));
        PauseForTests.resume();
        SettingsContextRule.withoutContext(() -> assertFalse(TapToPlay.resumeHeldStory(false, new Object())));
        assertTrue("the control: on, the same release starts the story", TapToPlay.resumeHeldStory(false, new Object()));
    }

    @Test
    public void anUnfilledStoryReaderOrAFailureLeavesTheReleaseToInstagram() {
        holdEnded(SystemClock.uptimeMillis(), aHold());
        // forget() put back the stub the patch fills in.
        assertFalse(TapToPlay.resumeHeldStory(false, new Object()));
        List<String> missing = HookStatus.missing(FamilyNames.TAP_TO_PLAY);
        assertTrue(missing.toString(), missing.contains("field the story player#its IgGrootPlayer"));

        TapToPlay.storyPlayers = asked -> {
            throw new IllegalStateException("the story player failed");
        };
        assertFalse(TapToPlay.resumeHeldStory(false, new Object()));
        missing = HookStatus.missing(FamilyNames.TAP_TO_PLAY);
        assertTrue(missing.toString(), missing.contains("a working 'story release' hook (it threw "
                + IllegalStateException.class.getName() + ")"));
    }

    /** While the switch is on, the check answers no, so the feed draws its play button. A no stays a no. */
    @Test
    public void theAutoplayCheckAnswersNoWhileTheSwitchIsOn() {
        assertFalse(TapToPlay.autoplayAllowed(true));
        assertFalse("Instagram's own no, data saver on", TapToPlay.autoplayAllowed(false));
        Settings.TAP_TO_PLAY.save(false);
        assertTrue(TapToPlay.autoplayAllowed(true));
        assertFalse(TapToPlay.autoplayAllowed(false));
    }

    /** The patch hands the check's answer over as an int, since a boolean method may return one. Non-zero is yes. */
    @Test
    public void theAutoplayChecksIntEntryReadsNonZeroAsYes() {
        assertFalse("a yes handed over as 1 stayed", TapToPlay.autoplayAllowed(1));
        assertFalse(TapToPlay.autoplayAllowed(2));
        assertFalse(TapToPlay.autoplayAllowed(0));
        Settings.TAP_TO_PLAY.save(false);
        assertTrue("with the switch off, 1 lost Instagram's yes", TapToPlay.autoplayAllowed(1));
        assertTrue("2 is a yes too", TapToPlay.autoplayAllowed(2));
        assertFalse(TapToPlay.autoplayAllowed(0));
    }

    /** The Reels tap's decision comes over as an int too, non-zero for resume. */
    @Test
    public void theReelTapsIntEntryReadsNonZeroAsResume() {
        TapToPlay.reelStates = asked -> State.PLAYING;
        assertFalse("a playing reel's pause, handed over as 0", TapToPlay.resumeOnTap(0, new Object()));
        assertTrue("Instagram's resume, handed over as 1", TapToPlay.resumeOnTap(1, new Object()));
        assertTrue("2 is a resume too", TapToPlay.resumeOnTap(2, new Object()));
        TapToPlay.reelStates = asked -> State.PREPARED;
        assertTrue("a held reel's tap, handed over as 0, still starts it", TapToPlay.resumeOnTap(0, new Object()));
    }

    /** The story player's resume flag comes over as an int too, non-zero for resume. */
    @Test
    public void theStoryReleasesIntEntryReadsNonZeroAsResume() {
        Object groot = new Object();
        TapToPlay.storyPlayers = asked -> groot;
        assertFalse("Instagram's advance, with no tap", TapToPlay.allowDirectStart(groot, "autoplay"));
        long now = SystemClock.uptimeMillis();
        holdEnded(now, 90);
        assertFalse("a quick tap's release, handed over as 0", TapToPlay.resumeHeldStory(0, new Object()));
        assertTrue("Instagram's resume, handed over as 1", TapToPlay.resumeHeldStory(1, new Object()));
        assertTrue("2 is a resume too", TapToPlay.resumeHeldStory(2, new Object()));
        holdEnded(now, aHold());
        assertTrue("a hold's release on the held story, handed over as 0, starts it", TapToPlay.resumeHeldStory(0, new Object()));
    }

    @Test
    public void debugLoggingSaysEachDecisionThenSumsThemUp() {
        BaseSettings.DEBUG.save(true);
        LogBufferManager.clearLogBuffer();
        TapToPlayForTests.tapEnded(250);
        Object player = new Object();
        TapToPlay.allowStart(player, "autoplay");
        TapToPlay.allowDirectStart(player, "autoplay");
        TapClock.forget();
        TapToPlay.allowStart(new Object(), "resume");
        TapToPlay.allowDirectStart(new Object(), "start");
        TapToPlay.autoplayAllowed(true);
        TapToPlay.autoplayAllowed(true);

        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("Tap to play: allowed autoplay 250 ms armed no"));
        assertTrue(report, report.contains("Tap to play: allowed autoplay 250 ms armed yes (direct)"));
        assertTrue(report, report.contains("Tap to play: held resume no tap armed no"));
        assertTrue(report, report.contains("Tap to play: held start no tap armed no (direct)"));
        assertEquals(report, 1, occurrences(report, "Tap to play: Instagram's autoplay check answers no"));

        // 4 so far: 36 more one by one, then 120 summed up in two lines, with 20 left over.
        for (int i = 0; i < 36 + 120; i++) TapToPlay.allowStart(new Object(), "autoplay");
        report = LogBufferManager.buildExportText();
        assertEquals(TapToPlay.LOGGED_ONE_BY_ONE, occurrences(report, "Tap to play: allowed ")
                + occurrences(report, "Tap to play: held "));
        assertEquals(report, 2, occurrences(report, "Tap to play: 50 more starts, 0 allowed, 50 held"));
    }

    @Test
    public void withoutDebugLoggingNothingIsLogged() {
        LogBufferManager.clearLogBuffer();
        TapToPlay.allowStart(new Object(), "autoplay");
        TapToPlay.autoplayAllowed(true);
        String report = LogBufferManager.buildExportText();
        assertFalse(report, report.contains("Tap to play: held"));
        assertFalse(report, report.contains("Tap to play: Instagram's autoplay check"));
    }

    private static int occurrences(String text, String part) {
        int count = 0;
        for (int at = text.indexOf(part); at >= 0; at = text.indexOf(part, at + part.length())) count++;
        return count;
    }

    private static final class AlwaysEqual {
        @Override
        public boolean equals(Object other) {
            return other instanceof AlwaysEqual;
        }

        @Override
        public int hashCode() {
            return 1;
        }
    }
}
