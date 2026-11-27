package app.ayham.extension.music.automix;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/**
 * spec/automix/playback.md e9697cc7, "The queue during a mix" rule 4: a mix whose audio clock stands
 * still for 3 s on the wall clock is called off (pair 2, 2026-11-25: the mix clock stood 11 s, then
 * the mix was aborted as "seeked").
 */
public class ClockWatchTest {
    @Test
    public void aClockStillForThreeSecondsIsStalled() {
        Engine.ClockWatch w = new Engine.ClockWatch();
        assertFalse(w.stalled(0, 1000));
        assertFalse(w.stalled(0, 3999));
        assertTrue(w.stalled(0, 4000));
    }

    @Test
    public void aMovingClockNeverIs() {
        Engine.ClockWatch w = new Engine.ClockWatch();
        long frame = 0;
        for (long t = 0; t < 60_000; t += 5) {
            // the head moves in bursts (one period at a time), at most every 100 ms
            if (t % 100 == 0) frame += 4800;
            assertFalse(w.stalled(frame, t));
        }
    }

    @Test
    public void theThreeSecondsStartOverWhenItMovesAgain() {
        Engine.ClockWatch w = new Engine.ClockWatch();
        w.stalled(10, 0);
        assertFalse(w.stalled(10, 2900));
        assertFalse(w.stalled(11, 2950));
        assertFalse(w.stalled(11, 5900));
        assertTrue(w.stalled(11, 5950));
    }
}
