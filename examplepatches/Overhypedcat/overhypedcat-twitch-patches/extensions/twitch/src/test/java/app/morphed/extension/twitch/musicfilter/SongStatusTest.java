package app.morphed.extension.twitch.musicfilter;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;

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
}
