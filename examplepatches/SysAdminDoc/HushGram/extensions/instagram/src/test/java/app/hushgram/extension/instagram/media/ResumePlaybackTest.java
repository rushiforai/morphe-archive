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

import android.content.Context;
import android.os.SystemClock;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

import java.util.Collections;
import java.util.List;

import app.hushgram.extension.instagram.media.ResumePlaybackForTests.Player;
import app.hushgram.extension.instagram.media.ResumePlaybackForTests.ProductType;
import app.hushgram.extension.instagram.media.ResumePlaybackForTests.Video;
import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.FeedFilterCounters;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;

/**
 * The rule Resume long videos holds every player to: a long video or reel stopped partway is saved,
 * its next first start in a player seeks back there once, and a seek Instagram makes first, a start
 * Instagram already placed, a new video and the end or loop of a video all start where Instagram
 * starts them. Off, paused, before the settings are ready, or when a stub isn't filled in, nothing
 * is saved and nothing seeks.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ResumePlaybackTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final int MINUTE = 60_000;

    @Before
    public void start() {
        SystemClock.sleep(60_000);
        ResumePlaybackForTests.install();
        HookStatus.clear();
        FeedFilterCounters.clear();
        Settings.RESUME_LONG_VIDEOS.save(true);
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.RESUME_LONG_VIDEOS.resetToDefault();
        ResumePlaybackForTests.forget();
        HookStatus.clear();
        FeedFilterCounters.clear();
    }

    private static Video longVideo(String id) {
        return new Video(id, 40 * MINUTE);
    }

    /** A player of [video] stopped at [at]. */
    private static void leftAt(Video video, int at) {
        Player player = new Player(video);
        player.position = at;
        ResumePlayback.stopped(player, "scroll");
    }

    /** A new player of [video] started at 0, with the resume it posts run. */
    private static Player opened(Video video) {
        return openedWith(new Player(video));
    }

    private static Player openedWith(Player player) {
        ResumePlayback.started(player);
        ResumePlaybackForTests.runLater();
        return player;
    }

    private static String report() {
        return String.join("\n", FeedFilterCounters.report());
    }

    @Test
    public void theSwitchStartsOff() {
        Settings.RESUME_LONG_VIDEOS.resetToDefault();
        assertFalse("nothing is saved or moved until it's turned on", Settings.RESUME_LONG_VIDEOS.get());
    }

    @Test
    public void aLongVideoLeftPartwayResumesThereOnce() {
        Video video = longVideo("3712345678901234567");
        leftAt(video, 12 * MINUTE + 34_000);
        Player player = opened(video);
        assertEquals(Collections.singletonList(754_000), player.seeks);

        // Instagram's later starts of the same video in the same player, after a pause or a
        // buffer, are its own.
        player.position = 20 * MINUTE;
        openedWith(player);
        assertEquals("it resumed a second time", 1, player.seeks.size());
        String report = report();
        assertTrue(report, report.contains("point saved 1") && report.contains("resumed 1"));
    }

    @Test
    public void aNewVideoStartsAtZero() {
        leftAt(longVideo("111111111"), 10 * MINUTE);
        Player other = opened(longVideo("222222222"));
        assertEquals("a video nobody left partway moved", Collections.emptyList(), other.seeks);
        assertTrue(report(), report().contains("no point yet 1"));
    }

    @Test
    public void aStopNearTheStartSavesNothingAndKeepsAnEarlierPoint() {
        Video video = longVideo("111111111");
        leftAt(video, ResumePlayback.MIN_SAVED_MS - 1);
        assertTrue("a glance saved a point", opened(video).seeks.isEmpty());

        leftAt(video, 9 * MINUTE);
        leftAt(video, 2_000);
        assertEquals("a stop at the start wiped the point", Collections.singletonList(540_000), opened(video).seeks);
    }

    @Test
    public void theEndOfTheVideoForgetsItsPoint() {
        Video video = longVideo("111111111");
        leftAt(video, 30 * MINUTE);
        leftAt(video, video.length - ResumePlayback.END_MARGIN_MS);
        assertTrue("a finished video resumed", opened(video).seeks.isEmpty());

        // Instagram's own end of a video, or its loop back to the start, forgets it too.
        leftAt(video, 30 * MINUTE);
        ResumePlayback.ended(new Player(video));
        assertTrue("a video that played to its end resumed", opened(video).seeks.isEmpty());
        assertTrue(report(), report().contains("point cleared at the end 2"));
    }

    @Test
    public void shortVideosLiveVideosAndAdsAreLeftAloneButALongReelResumes() {
        Video clip = new Video("1", ResumePlayback.MIN_DURATION_MS - 1);
        leftAt(clip, 60_000);
        assertTrue(opened(clip).seeks.isEmpty());

        Video live = longVideo("2");
        live.product = ProductType.LIVE;
        Video ad = longVideo("3");
        ad.product = ProductType.AD;
        Video sponsored = longVideo("4");
        sponsored.product = ProductType.CLIPS;
        sponsored.sponsored = true;
        for (Video video : new Video[]{live, ad, sponsored}) {
            leftAt(video, 10 * MINUTE);
            assertTrue(video.id, opened(video).seeks.isEmpty());
        }
        String report = report();
        assertFalse("something was saved: " + report, report.contains("point saved"));
        for (String kind : new String[]{"under two minutes 1", "live 1", "ad 2"}) {
            assertTrue(kind + " in " + report, report.contains(kind));
        }

        // Instagram shares nearly every video as a reel, so a long one resumes like any video, and
        // so does the replay of a live video.
        Video reel = longVideo("5");
        reel.product = ProductType.CLIPS;
        Video replay = longVideo("6");
        replay.product = ProductType.LIVE_VOD;
        for (Video video : new Video[]{reel, replay}) {
            leftAt(video, 10 * MINUTE);
            assertEquals(video.id, Collections.singletonList(600_000), opened(video).seeks);
        }
    }

    @Test
    public void theProductTypeIsReadByItsName() {
        assertTrue(ResumePlayback.factsOf("1", ProductType.LIVE, false).live);
        assertTrue(ResumePlayback.factsOf("1", ProductType.AD, false).ad);
        assertTrue(ResumePlayback.factsOf("1", ProductType.FEED, true).ad);
        ResumePlayback.Facts reel = ResumePlayback.factsOf("1", ProductType.CLIPS, false);
        assertFalse(reel.live || reel.ad);
        ResumePlayback.Facts unknown = ResumePlayback.factsOf("1", "LIVE", false);
        assertFalse("a type that isn't an enum", unknown.live || unknown.ad);
        assertFalse(ResumePlayback.factsOf("1", null, false).live);
        assertNull(ResumePlayback.factsOf(null, ProductType.FEED, false));
        assertNull(ResumePlayback.factsOf("", ProductType.FEED, false));
    }

    @Test
    public void aSeekBeforeTheResumeWins() {
        Video video = longVideo("111111111");
        leftAt(video, 10 * MINUTE);

        // Instagram carrying a position over, before the start.
        Player carried = new Player(video);
        ResumePlayback.seeking(carried, 95_000);
        assertTrue("the resume ran over Instagram's own position", openedWith(carried).seeks.isEmpty());

        // A drag of the scrubber after the start, before the resume runs.
        Player dragged = new Player(video);
        ResumePlayback.started(dragged);
        ResumePlayback.seeking(dragged, 5 * MINUTE);
        ResumePlaybackForTests.runLater();
        assertTrue("the resume ran over a drag", dragged.seeks.isEmpty());

        // A seek back to the start, which isn't someone placing the video, lets it resume.
        Player reset = new Player(video);
        ResumePlayback.seeking(reset, 0);
        assertEquals(Collections.singletonList(600_000), openedWith(reset).seeks);
        assertTrue(report(), report().contains("seek before the resume 2"));
    }

    @Test
    public void aStartInstagramPlacedStaysWhereItIs() {
        Video video = longVideo("111111111");
        leftAt(video, 10 * MINUTE);
        Player carried = new Player(video);
        carried.position = ResumePlayback.START_WINDOW_MS + 1;
        assertTrue("a start past the start moved", openedWith(carried).seeks.isEmpty());
        assertTrue(report(), report().contains("started past the start 1"));
    }

    @Test
    public void thePlayerMovingOnBeforeTheResumeRunsStopsIt() {
        Video video = longVideo("111111111");
        leftAt(video, 10 * MINUTE);
        Player player = new Player(video);
        ResumePlayback.started(player);
        player.video = longVideo("333333333");
        ResumePlaybackForTests.runLater();
        assertTrue("the next video was sought to the last one's point", player.seeks.isEmpty());
        assertTrue(report(), report().contains("moved on before the resume 1"));
    }

    @Test
    public void theResumesOwnSeekSavesNothingAndStopsNothing() {
        Video video = longVideo("111111111");
        leftAt(video, 10 * MINUTE);
        Player player = new Player(video);
        player.position = 800;
        // A seek of a playing video can pause it first, which runs the stop hook at the old
        // position, and restart it, which runs the start hook.
        player.duringSeek = () -> {
            ResumePlayback.stopped(player, "scroll");
            ResumePlayback.started(player);
        };
        assertEquals(Collections.singletonList(600_000), openedWith(player).seeks);
        assertTrue(report(), report().contains("point saved 1") && report().contains("resumed 1"));
        // The point is still 10:00.
        assertEquals(Collections.singletonList(600_000), opened(video).seeks);
    }

    @Test
    public void aSeeksOwnPauseSavesNothing() {
        Video video = longVideo("111111111");
        Player player = new Player(video);
        openedWith(player);
        // A drag of the scrubber on a playing video: Instagram pauses it for the seek, at the place
        // it's leaving, and plays on from the new one.
        player.position = 5 * MINUTE;
        for (String reason : TapToPlay.MOMENTARY) ResumePlayback.stopped(player, reason);
        // The long video viewer's scrubber, by name, so it can't drop out of the set unnoticed.
        ResumePlayback.stopped(player, "Seek start");
        assertTrue("a seek's pause saved a point", opened(video).seeks.isEmpty());
        assertFalse(report(), report().contains("point saved"));

        // The control: a real pause at the same place saves it.
        ResumePlayback.stopped(player, "fragment_paused");
        assertEquals(Collections.singletonList(300_000), opened(video).seeks);
    }

    @Test
    public void aNewBindStartsThePlayerOverUnlessItJustStarted() {
        Video video = longVideo("111111111");
        leftAt(video, 10 * MINUTE);
        Player player = new Player(video);
        assertEquals(1, openedWith(player).seeks.size());

        // A bind right after the start belongs to it, and isn't a new video.
        ResumePlayback.rebound(player);
        player.position = 0;
        assertEquals("a bind of the same start resumed again", 1, openedWith(player).seeks.size());

        // Later, the player given the same video again starts over. Its bind saves where it was.
        SystemClock.sleep(ResumePlayback.BIND_GRACE_MS + 1);
        player.position = 11 * MINUTE;
        ResumePlayback.rebound(player);
        player.position = 0;
        assertEquals(Collections.singletonList(660_000), openedWith(player).seeks.subList(1, 2));
    }

    @Test
    public void aPlayerThatLetGoOfItsVideoSavesNothingAndDoesntThrow() {
        Video video = longVideo("111111111");
        leftAt(video, 10 * MINUTE);
        Player released = new Player(video);
        released.released = true;
        released.position = 20 * MINUTE;
        ResumePlayback.stopped(released, "fragment_stopped");
        ResumePlayback.rebound(released);
        assertEquals("the unreadable length moved the point", Collections.singletonList(600_000), opened(video).seeks);
        String missing = HookStatus.missing(FamilyNames.RESUME_LONG_VIDEOS).toString();
        assertFalse(missing, missing.contains("threw"));
    }

    @Test
    public void thePointsOutliveTheProcess() {
        Video video = longVideo("111111111");
        leftAt(video, 10 * MINUTE);
        // A new process: nothing cached, the file read again.
        ResumePlaybackForTests.install();
        ShadowLooper.idleMainLooper();
        assertEquals(Collections.singletonList(600_000), opened(video).seeks);
        assertEquals(1, RuntimeEnvironment.getApplication()
                .getSharedPreferences(ResumePoints.FILE, Context.MODE_PRIVATE).getAll().size());
    }

    @Test
    public void offOrPausedNothingIsSavedOrMoved() {
        Video video = longVideo("111111111");
        Settings.RESUME_LONG_VIDEOS.save(false);
        leftAt(video, 10 * MINUTE);
        Settings.RESUME_LONG_VIDEOS.save(true);
        assertTrue("a stop saved with the switch off", opened(video).seeks.isEmpty());

        leftAt(video, 10 * MINUTE);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertTrue("a paused start moved", opened(video).seeks.isEmpty());
        PauseForTests.resume();

        Settings.RESUME_LONG_VIDEOS.save(false);
        assertTrue("a start with the switch off moved", opened(video).seeks.isEmpty());
        Player late = new Player(video);
        Settings.RESUME_LONG_VIDEOS.save(true);
        ResumePlayback.started(late);
        Settings.RESUME_LONG_VIDEOS.save(false);
        ResumePlaybackForTests.runLater();
        assertTrue("the switch turned off before the resume ran, and it moved", late.seeks.isEmpty());

        Settings.RESUME_LONG_VIDEOS.save(true);
        assertEquals("the control: on, the same start resumes", Collections.singletonList(600_000), opened(video).seeks);
    }

    @Test
    public void beforeTheSettingsAreReadyNothingIsSavedOrMoved() {
        Video video = longVideo("111111111");
        leftAt(video, 10 * MINUTE);
        SettingsContextRule.withoutContext(() -> {
            leftAt(video, 20 * MINUTE);
            assertTrue(opened(video).seeks.isEmpty());
        });
        SettingsContextRule.beforeThePauseIsDecided(() -> assertTrue(opened(video).seeks.isEmpty()));
        assertEquals("the control: ready, the saved point", Collections.singletonList(600_000), opened(video).seeks);
    }

    @Test
    public void unfilledStubsAndOddPlayersFailOpen() {
        Video video = longVideo("111111111");
        leftAt(video, 10 * MINUTE);

        // The app's own stubs, as they are before the patch fills them.
        ResumePlayback.access = ResumePlayback.PATCHED;
        Player player = new Player(video);
        ResumePlayback.started(player);
        ResumePlayback.stopped(player, "scroll");
        ResumePlayback.ended(player);
        ResumePlaybackForTests.runLater();
        assertTrue(player.seeks.isEmpty());
        List<String> missing = HookStatus.missing(FamilyNames.RESUME_LONG_VIDEOS);
        assertTrue(missing.toString(), missing.toString().contains("the video reader"));
        assertEquals(ResumePlayback.NOT_PATCHED_TIME, ResumePlayback.position(player));
        assertEquals(ResumePlayback.NOT_PATCHED_TIME, ResumePlayback.duration(player));
        assertSame(ResumePlayback.NOT_PATCHED, ResumePlayback.videoSource(player));
        assertNull(ResumePlayback.videoId(video));
        assertNull(ResumePlayback.productType(video));
        assertFalse(ResumePlayback.sponsored(video));
        assertFalse(ResumePlayback.seekPlayer(player, 1, false, false));

        // A player with no video, and a null player.
        ResumePlaybackForTests.install();
        ResumePlayback.started(new Player(null));
        ResumePlayback.stopped(new Player(null), "scroll");
        ResumePlayback.started(null);
        ResumePlayback.stopped(null, null);
        ResumePlayback.seeking(null, 5);
        ResumePlayback.ended(null);
        ResumePlayback.rebound(null);
        ResumePlaybackForTests.runLater();
        assertEquals("the control: the saved point", Collections.singletonList(600_000), opened(video).seeks);
    }

    @Test
    public void aThrowInsideLeavesThePlayerAlone() {
        Video video = longVideo("111111111");
        leftAt(video, 10 * MINUTE);
        ResumePlayback.access = new ResumePlayback.Player() {
            @Override public int position(Object p) { throw new IllegalArgumentException("position"); }
            @Override public int duration(Object p) { return 40 * MINUTE; }
            @Override public ResumePlayback.Facts facts(Object p) { return ResumePlayback.factsOf("111111111", null, false); }
            @Override public boolean seek(Object p, int ms) { throw new IllegalArgumentException("seek"); }
        };
        Player player = new Player(video);
        ResumePlayback.started(player);
        ResumePlayback.stopped(player, "scroll");
        ResumePlayback.rebound(player);
        ResumePlaybackForTests.runLater();
        assertTrue(player.seeks.isEmpty());
        String missing = HookStatus.missing(FamilyNames.RESUME_LONG_VIDEOS).toString();
        for (String hook : new String[]{"player start", "player pause", "player bind"}) {
            assertTrue(missing, missing.contains("'" + hook + "' hook (it threw java.lang.IllegalArgumentException)"));
        }
    }

    @Test
    public void onlyTheFirstVideoStartOfAProcessAgesThePoints() throws Exception {
        Settings.RESUME_LONG_VIDEOS.save(false);
        android.content.SharedPreferences file = RuntimeEnvironment.getApplication()
                .getSharedPreferences(ResumePoints.FILE, Context.MODE_PRIVATE);
        String old = ResumePoints.encode(90_000, System.currentTimeMillis() - ResumePoints.KEEP_MS - 60_000);
        file.edit().putString("first", old).commit();
        ResumePlayback.started(new Object());
        Utils.awaitBackgroundTasksForTests();
        assertFalse("the first start left a point past its age", file.contains("first"));

        file.edit().putString("second", old).commit();
        ResumePlayback.started(new Object());
        Utils.awaitBackgroundTasksForTests();
        assertTrue("every start read the whole file again", file.contains("second"));
        file.edit().clear().commit();
    }

    @Test
    public void positionsReadAsAPlayerShowsThem() {
        assertEquals("0:00", ResumePlayback.clock(0));
        assertEquals("12:34", ResumePlayback.clock(754_000));
        assertEquals("125:09", ResumePlayback.clock(125 * MINUTE + 9_999));
        assertEquals("0:00", ResumePlayback.clock(-5));
    }
}
