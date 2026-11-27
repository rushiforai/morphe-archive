package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class KickLockTest {
    private static final int SR = 44100;

    /** 40 s of a 60 Hz kick (50 ms decay) every [beat] s from [offset]. */
    private static float[][] kicks(double beat, double offset) {
        float[] x = new float[40 * SR];
        for (double k = offset; k < 40; k += beat) {
            int a = (int) Math.round(k * SR);
            for (int i = 0; i < SR / 5 && a + i < x.length; i++) {
                double t = i / (double) SR;
                x[a + i] += (float) (0.8 * Math.sin(2 * Math.PI * 60 * t) * Math.exp(-t / 0.05));
            }
        }
        return new float[][]{x, x};
    }

    private static Planner.Plan blend(double beat) {
        Planner.Plan p = new Planner.Plan();
        p.style = "blend";
        p.beatSec = beat;
        p.mixOutTrackTime = 20;
        p.mixInTrackTime = 10;
        p.durationSec = 8;
        p.rate = 1;
        p.outRate = 1;
        return p;
    }

    @Test
    public void lateKickMovesTheCueOn() {
        KickLock.Side out = KickLock.kickSource(kicks(0.5, 0), SR, 0, 0, 40);
        KickLock.Side in = KickLock.kickSource(kicks(0.5, 0.03), SR, 0, 0, 40);
        KickLock.Result r = KickLock.kickLock(blend(0.5), out, in);
        assertNotNull(r);
        assertNull(r.toString(), r.none);
        assertEquals(r.toString(), 0.03, r.shift, 0.004);
    }

    @Test
    public void aMixInPlacedInTheEditorIsNotShifted() {
        // a late kick would move the cue, but the user placed the mix-in: it stays where they put it
        KickLock.Side out = KickLock.kickSource(kicks(0.5, 0), SR, 0, 0, 40);
        KickLock.Side in = KickLock.kickSource(kicks(0.5, 0.03), SR, 0, 0, 40);
        Planner.Plan p = blend(0.5);
        p.windowIn = true;
        KickLock.Result r = KickLock.kickLock(p, out, in);
        assertNotNull(r);
        assertEquals("the mix-in was placed in the editor", r.none);
        assertTrue(Double.isNaN(r.shift));
        assertFalse(Planner.kickLockAllowed(p));
    }

    @Test
    public void kicksInLineStayPut() {
        KickLock.Side out = KickLock.kickSource(kicks(0.5, 0), SR, 0, 0, 40);
        KickLock.Side in = KickLock.kickSource(kicks(0.5, 0), SR, 0, 0, 40);
        KickLock.Result r = KickLock.kickLock(blend(0.5), out, in);
        assertNotNull(r.toString(), r.none);
        assertTrue(Double.isNaN(r.shift));
    }

    @Test
    public void glideStepsKeepBothSongsOnTheBeat() {
        Planner.GlideSteps g = Planner.glideSteps(0.94, 16, 0.6);
        // the playing song starts near its own speed and ends near the next one's; the next ends near x1
        assertEquals(Math.pow(0.94, 0.5 / 16), g.outRate[0], 1e-12);
        assertEquals(Math.pow(0.94, -0.5 / 16), g.inRate[15], 1e-12);
        for (int k = 0; k < 16; k++) {
            // each output beat holds one beat of each song
            assertEquals(0.6, g.dur[k] * g.outRate[k], 1e-12);
            assertEquals(0.6 / 0.94, g.dur[k] * g.inRate[k], 1e-12);
        }
    }

    @Test
    public void glideBlendOnBothDecks() {
        Planner.Plan p = blend(0.6);
        p.v2 = true;
        p.v3 = true;
        p.bars = 4;
        p.bpm = 100;
        p.glide = new Planner.Glide(0.94, 16, 0.6);
        Planner.GlideSteps g = Planner.glideSteps(0.94, 16, 0.6);
        p.durationSec = g.total;
        p.rate = g.inRate[0];
        Mix m = Mix.blend(p, "a", "b", 200);
        // both decks step once per beat: one beat of each song per output beat, the next ending at x1
        for (int k = 0; k < 16; k++) {
            double t = m.t0 + g.at[k] + g.dur[k] / 2;
            assertEquals(g.outRate[k], m.out.rateAt(t), 1e-9);
            assertEquals(g.inRate[k], m.in.rateAt(t), 1e-9);
        }
        assertEquals(1, m.in.rateAt(m.t0 + g.total + 0.2), 1e-9);
        assertEquals(20 + 16 * 0.6, m.out.trackAt(m.t0 + g.total), 1e-9);
        assertEquals(10 + 16 * 0.6 / 0.94, m.in.trackAt(m.t0 + g.total), 1e-9);
    }

    @Test
    public void keysOnOrchardsTable() {
        assertEquals(1, Planner.keyRelationship(Planner.parsedKey("A minor"), Planner.parsedKey("a MINOR")), 0);
        assertEquals(0.95, Planner.keyRelationship(Planner.parsedKey("C major"), Planner.parsedKey("A minor")), 0);
        assertEquals(0, Planner.keyRelationship(Planner.parsedKey("C major"), Planner.parsedKey("F# major")), 0);
        assertEquals(0.3, Planner.keyRelationship(Planner.parsedKey("Db major"), Planner.parsedKey("D major")), 0);
        assertNull(Planner.parsedKey("H major"));
    }
}
