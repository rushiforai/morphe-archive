package app.morphed.extension.twitch.musicfilter;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Test;

/** A problem with the player's sound that stays true is never hidden behind "waiting". */
public class SongStatusTest {
    @After
    public void clear() {
        SongRemoval.soundProblem = null;
    }

    @Test
    public void waitingKeepsALastingSoundProblem() {
        SongRemoval.soundProblem = "Song removal works on 48 kHz mono or stereo sound only, this stream's is 44100 Hz with 2 channels";
        SongRemoval.Status waiting = SongRemoval.waiting();
        assertEquals(SongRemoval.WAITING, waiting.step);
        assertEquals(SongRemoval.soundProblem, waiting.problem);
        assertFalse(waiting.filtering);
    }

    @Test
    public void waitingWithNothingWrongIsPlain() {
        assertNull(SongRemoval.waiting().problem);
    }

    @Test
    public void theSameStatusToldAgainIsNotShownAnew() {
        assertTrue(SongRemoval.unchanged("Resting", 52_000, "Resting", 52_400));
        assertFalse("its end moved", SongRemoval.unchanged("Resting", 52_000, "Resting", 53_000));
        assertFalse(SongRemoval.unchanged("Resting", 52_000, "Listening", 52_000));
        assertTrue(SongRemoval.unchanged(null, 0, null, 0));
        assertFalse(SongRemoval.unchanged(null, 0, "Shazam busy | x", 0));
    }

    @Test
    public void aLastingProblemShowsWheneverTheTrackerHasNone() {
        assertEquals("Shazam unreachable | x", SongRemoval.shownProblem("Shazam unreachable | x", "Filter broke | y", "z"));
        assertEquals("Filter broke | y", SongRemoval.shownProblem(null, "Filter broke | y", "z"));
        assertEquals("z", SongRemoval.shownProblem(null, null, "z"));
        assertNull(SongRemoval.shownProblem(null, null, null));
    }

    @Test
    public void aPlayerLeftFromTheStreamBeforeIsNotListenedTo() {
        SongRemoval.keyPlayedKey = "";
        SongRemoval.keyPlayedAt = 0;
        SongRemoval.Renderer old = new SongRemoval.Renderer(48000, 2);
        old.stream = "channel:velja_lol";
        assertTrue(SongRemoval.playsStream(old, "channel:velja_lol", 1024, 0));
        assertFalse("its last sound isn't the new stream's", SongRemoval.playsStream(old, "channel:tyrone", 1024, 10));
        SongRemoval.Renderer early = new SongRemoval.Renderer(48000, 2); // made before any stream was known
        assertTrue(SongRemoval.playsStream(early, "channel:tyrone", 1024, 20));
        assertFalse(SongRemoval.playsStream(early, "channel:other", 1024, 30));
    }

    @Test
    public void aLeftoverPlayerIsNeverTakenWhileTheNewStreamsPlays() {
        SongRemoval.keyPlayedKey = "";
        SongRemoval.keyPlayedAt = 0;
        SongRemoval.Renderer old = new SongRemoval.Renderer(48000, 2), fresh = new SongRemoval.Renderer(48000, 2);
        old.stream = "channel:a";
        fresh.stream = "channel:b";
        for (long ms = 0; ms < 3 * SongRemoval.ADOPT_MS; ms += 20) {
            assertTrue(SongRemoval.playsStream(fresh, "channel:b", 960, ms));
            assertFalse("at " + ms + " ms", SongRemoval.playsStream(old, "channel:b", 960, ms));
        }
    }

    @Test
    public void aPlayerGivenTheNewStreamWithoutAFlushIsTakenAfterAWhile() {
        SongRemoval.keyPlayedKey = "";
        SongRemoval.keyPlayedAt = 0;
        SongRemoval.Renderer reused = new SongRemoval.Renderer(48000, 2);
        reused.stream = "channel:a";
        long ms = 0;
        for (; ms < SongRemoval.ADOPT_MS - 20; ms += 20) {
            assertFalse("at " + ms + " ms", SongRemoval.playsStream(reused, "channel:b", 960, ms));
        }
        boolean taken = false;
        for (int i = 0; i < 3 && !taken; i++, ms += 20) taken = SongRemoval.playsStream(reused, "channel:b", 960, ms);
        assertTrue("taken as the new stream's after about " + SongRemoval.ADOPT_MS + " ms", taken);
        assertEquals("channel:b", reused.stream);
    }

    @Test
    public void mutedSoundIsNotHeard() {
        assertEquals(0, SongRemoval.heardFrames(false, 4096, 2));
        assertEquals(1024, SongRemoval.heardFrames(true, 4096, 2));
        assertEquals(2048, SongRemoval.heardFrames(true, 4096, 1));
    }

    @Test
    public void onlyTimeWithNoNewPlayerPlayingCounts() {
        SongRemoval.keyPlayedKey = "";
        SongRemoval.keyPlayedAt = 0;
        SongRemoval.Renderer old = new SongRemoval.Renderer(48000, 2), fresh = new SongRemoval.Renderer(48000, 2);
        old.stream = "channel:a";
        fresh.stream = "channel:b";
        long ms = 0;
        for (; ms < SongRemoval.ADOPT_MS - 200; ms += 20) { // the old one plays alone at first, nearly long enough
            assertFalse(SongRemoval.playsStream(old, "channel:b", 960, ms));
        }
        long both = ms;
        for (; ms < both + 2 * SongRemoval.ADOPT_MS; ms += 20) { // then both play: the old one's time starts over
            SongRemoval.playsStream(fresh, "channel:b", 960, ms);
            assertFalse(SongRemoval.playsStream(old, "channel:b", 960, ms));
        }
        long stopped = ms; // the new stream's player stops; the old one goes on
        boolean taken = false;
        for (; ms < stopped + 3 * SongRemoval.ADOPT_MS && !taken; ms += 20) {
            taken = SongRemoval.playsStream(old, "channel:b", 960, ms);
        }
        assertTrue(taken);
        assertTrue("only after it played on alone for a while: " + (ms - stopped) + " ms",
                ms - stopped >= 2 * SongRemoval.ADOPT_MS - 100);
    }

    @Test
    public void aProblemToldBeforeTheFirstSessionIsShownByIt() {
        SongRemoval.takeHeldProblem();
        SongRemoval.holdForFirstSession("Song list unreadable | songs.json is damaged", false);
        assertEquals("handed to the first session", "Song list unreadable | songs.json is damaged", SongRemoval.takeHeldProblem());
        assertNull("once", SongRemoval.takeHeldProblem());
        SongRemoval.holdForFirstSession("Filter broke | x", true);
        assertNull("a lasting one is shown always, not handed over", SongRemoval.takeHeldProblem());
        SongRemoval.holdForFirstSession("Shazam unreachable | x", false); // (the clock reads 0 in tests)
        assertNull("old news by the time a session starts", SongRemoval.takeHeldProblem(SongRemoval.HELD_PROBLEM_MS + 1));
    }
}
