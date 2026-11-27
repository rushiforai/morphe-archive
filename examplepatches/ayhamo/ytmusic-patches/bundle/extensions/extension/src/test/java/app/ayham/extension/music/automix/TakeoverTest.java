package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;

import org.junit.Test;

/**
 * The takeover's splice and the loop mix's clip guard (pair 1 on the emulator, 2026-11-25: 108
 * flat-top runs up to 220 samples in the 0.2 s after the takeover, YT and the deck both playing A at
 * full level; and 160 more while B's run-on played alone on the deck, the limiter off).
 */
public class TakeoverTest {
    /**
     * YT's volume is set on the mixer and heard one output latency later, while the deck's samples
     * are placed on the heard timeline: YT is muted that latency ahead of the deck's 25 ms fade-in,
     * or both play A whole until it lands (~200 ms on LDPlayer, ~40 ms on the S21 FE).
     */
    @Test
    public void ytIsMutedOneOutputLatencyAheadOfTheDeck() {
        // the deck's A at full from mix 0; YT silent as heard by then, not 12 ms after the mixer
        assertTrue(Engine.takeoverMuteAt(0.200) + 0.200 <= 0);
        assertTrue(Engine.takeoverMuteAt(0.040) + 0.040 <= 0);
        // ...but not before the deck's fade-in starts (no hole): heard within its 25 ms
        assertTrue(Engine.takeoverMuteAt(0.200) + 0.200 >= -Mix.H);
        assertEquals(Engine.takeoverMuteAt(0.040), -0.040 - 0.012 - 0.010, 1e-9);
    }

    /** The latency is measured on the track (its playback head less the frame being heard), its median. */
    @Test
    public void theOutputLatencyIsMeasuredWithADefault() {
        assertEquals(0.200, Engine.outputLatency(Arrays.asList(0.21, 0.19, 0.20, 0.35, 0.20)), 1e-9);
        // no readings, or a track that reports its head as heard: the S21 FE's measured 40 ms
        assertEquals(0.040, Engine.outputLatency(Arrays.asList()), 1e-9);
        assertEquals(0.040, Engine.outputLatency(Arrays.asList(0.0, 0.001, 0.0)), 1e-9);
        // a stuck clock's nonsense is held to 0.5 s
        assertEquals(0.5, Engine.outputLatency(Arrays.asList(3.0, 3.0, 3.0)), 1e-9);
    }

    /**
     * The loop mix's clip guard covers every sample our deck plays: from the takeover's fade-in, over
     * the enter bars (B's gain still 0 at mix 0), and B's run-on after its loop's release up to the
     * hand-over, a hot master held to ±1 on the deck is otherwise heard at full scale.
     */
    @Test
    public void theLoopMixIsLimitedWhileTheDeckPlays() {
        Planner.LoopPlan lp = PlannerTest.loopPlan();
        Mix m = Mix.loop(lp, "a", "b", 200);
        Planner.LoopSchedule x = Planner.loopSchedule(lp, 0);
        assertTrue(Engine.limits(m, -Mix.H / 2, false, false));
        assertTrue(Engine.limits(m, 0, false, false));
        assertTrue(Engine.limits(m, x.enterEnd / 2, false, false));
        assertTrue(Engine.limits(m, x.releaseAt + 1, false, false));
        assertTrue(Engine.limits(m, m.elementAt + 2, false, false));
        // before the takeover the deck is silent
        assertFalse(Engine.limits(m, -1, false, false));
    }

    /**
     * A blend too is limited while a deck sounds (versions.md 8ba27b64 "The mix's ceiling" rule 1):
     * Stay alone on the deck at x0.97 over the hand lead clipped (pair 2, 2026-11-25: 332 flat-top runs
     * in the 4 s before the blend).
     */
    @Test
    public void aBlendIsLimitedWhileADeckSounds() {
        Mix m = new Mix();
        m.style = "blend";
        m.t0 = 10;
        m.D = 8;
        m.out.gain.set(1, 0).set(1, 10).lin(0, 18);
        m.in.gain.set(0, 0).set(0, 10).lin(1, 18);
        assertFalse(Engine.limits(m, -1, false, false));
        assertTrue(Engine.limits(m, -Mix.H / 2, false, false));
        assertTrue(Engine.limits(m, 5, false, false));
        assertTrue(Engine.limits(m, 12, false, false));
        assertTrue(Engine.limits(m, 20, false, false));
    }

    /**
     * YT plays A at its playlist speed before the takeover: the decks lock on its clock at that
     * speed, so mix 0 is where YT reaches takeoverSong (pair 2: locked as x1, the splice was 36-41 ms
     * off after a 1.5 s pre-roll at x0.97057).
     */
    @Test
    public void theDecksLockOnYtsClockAtItsSpeed() {
        double r = 0.97057, start = 150, takeover = 194.25;
        // readings over the pre-roll: YT's position (ms) at heard time tau
        java.util.List<Double> cs = new java.util.ArrayList<>();
        for (double tau = 40; tau < 41; tau += 0.2) cs.add(Engine.clockOf(Math.round((start + r * tau) * 1000), tau, r));
        java.util.Collections.sort(cs);
        double off = Engine.offsetSec(cs.get(cs.size() / 2), takeover, r);
        // the heard time where the mix clock reads 0, and YT's song time then
        double tau0 = -off;
        assertEquals(takeover, start + r * tau0, 0.002);
        // and after it, YT's song second as the seek check expects it
        assertEquals(start + r * (tau0 + 3), Engine.ytSongAt(takeover, 3, r), 0.002);
        // at x1 nothing changes
        assertEquals(194.25 - 100, Engine.offsetSec(Engine.clockOf(194250, 100, 1), 0, 1), 1e-9);
    }
}
