package app.morphe.extension.youtube.bilibilidanmaku;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class DanmakuPlaybackClockTest {
    private final DanmakuPlaybackClock clock = new DanmakuPlaybackClock();

    @Test public void seeksImmediatelyThenAbsorbsLateReportsWithoutReversing() {
        clock.setPlaying(true, 0);
        clock.sample(8000, 0);
        clock.sample(18000, 200);
        assertEquals(18000, clock.position(200));
        // The first report after the skip repeats the target half a second later.
        clock.sample(18000, 700);
        assertEquals(18500, clock.position(700));
        assertEquals(18750, clock.position(1200));
        assertEquals(19000, clock.position(1700));
        clock.sample(2300, 1700);
        assertEquals(2300, clock.position(1700));
        clock.sample(2400, 2200);
        assertEquals(2800, clock.position(2200));
        assertEquals(3400, clock.position(3200));
    }

    @Test public void enteringAndLeavingDoubleSpeedPreservesTheCurrentFrame() {
        clock.setPlaying(true, 0);
        clock.sample(10000, 0);
        clock.setSpeed(2, 200);
        assertEquals(10200, clock.position(200));
        clock.sample(10900, 700);
        assertEquals(11200, clock.position(700));
        clock.setSpeed(1, 900);
        assertEquals(11540, clock.position(900));
        clock.sample(11900, 1400);
        assertEquals(11920, clock.position(1400));
        assertEquals(12900, clock.position(2400));
    }

    @Test public void slightlyEarlierReportAfterScrubbingDoesNotUndoTheSeek() {
        clock.setPlaying(true, 0);
        clock.sample(10000, 0);
        clock.sample(30000, 100);
        clock.sample(29600, 600);
        assertEquals(30500, clock.position(600));
        assertEquals(30550, clock.position(1100));
        assertEquals(30600, clock.position(1600));
    }

    @Test public void repeatedPlayingNotificationsDoNotRestartInterpolation() {
        clock.setPlaying(true, 10);
        clock.sample(1000, 10);
        clock.setPlaying(true, 510);
        assertEquals(1600, clock.position(610));
        clock.setPlaying(false, 610);
        clock.sample(1000, 620);
        assertEquals(1600, clock.position(2000));
        clock.sample(980, 2000);
        assertEquals(980, clock.position(3000));
        clock.setPlaying(true, 3000);
        assertEquals(1480, clock.position(3500));
        clock.reset();
        assertEquals(-1, clock.position(4000));
        clock.sample(17, 4010);
        assertEquals(17, clock.position(4010));
    }

    @Test public void delayedReportsAtHighSpeedDoNotReverseEvenAfterSlowingDown() {
        clock.setPlaying(true, 0);
        clock.setSpeed(4, 0);
        clock.sample(10000, 0);
        clock.sample(10050, 1000);
        clock.setSpeed(.5f, 1050);
        long previous = clock.position(1050);
        for (int t = 1066; t <= 10000; t += 16) {
            long current = clock.position(t);
            assertTrue(current >= previous);
            previous = current;
        }
        assertEquals(14725, clock.position(10000));
    }
}
