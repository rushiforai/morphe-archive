package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** BitChord's audit patterns of 2026-11-24, checked on the phone. */
public class AuditPatternsTest {

    @Test
    public void onlyAMixPlayedToItsEndCountsAsHeard() {
        Planner.forgetMoves();
        Planner.ended("echo", false, false); // armed, then called off
        Planner.ended("echo", false, true);  // aborted after its hand-over
        assertTrue(Planner.recentMoves().isEmpty());
        Planner.ended("echo", true, true);
        assertEquals(1, Planner.recentMoves().size());
        Planner.forgetMoves();
    }

    @Test
    public void aNaNIsClampedToTheLowEnd() {
        assertEquals(0, Mix.clamp(Double.NaN, 0, 1), 0);
        assertEquals(20, Mix.glide(20, 200, Mix.clamp(0.0 / 0.0, 0, 1)), 1e-9);
        assertEquals(1, Mix.clamp(5, 0, 1), 0);
    }
}
