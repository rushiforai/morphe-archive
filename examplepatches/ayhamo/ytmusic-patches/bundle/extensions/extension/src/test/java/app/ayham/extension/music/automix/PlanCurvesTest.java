package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.Map;

import org.junit.Test;

/**
 * The plan's curves (what the overview draws) say what the engine plays: the extension's audit of
 * 2026-11-27, M1 (B's late entry set before the curves) and L2 (B's glide back to its own speed).
 */
public class PlanCurvesTest {
    private static MixOverride ov(String json) {
        return MixOverride.fromJson((Map<String, Object>) Json.parse(json));
    }

    /** A curve's value at t (linear between its points). */
    private static double at(double[][] pts, double t) {
        if (t <= pts[0][0]) return pts[0][1];
        for (int i = 1; i < pts.length; i++) {
            if (t <= pts[i][0]) {
                double f = (t - pts[i - 1][0]) / Math.max(1e-12, pts[i][0] - pts[i - 1][0]);
                return pts[i - 1][1] + (pts[i][1] - pts[i - 1][1]) * f;
            }
        }
        return pts[pts.length - 1][1];
    }

    /** M1: with B held 3.2 s into the mix, A's drawn gain has no trim while it plays alone, as the engine plays it. */
    @Test
    public void aLateEntrysCurvesKeepAWhileBIsHeld() {
        Analysis a = PlannerTest.song("a", 120, 200, 0.9), b = PlannerTest.song("b", 120, 200, 0.9);
        Planner.Settings s = new Planner.Settings();
        s.version = 2;
        Planner.Plan base = Planner.plan(s, "a", "b", a, b, 200, 20, 24.5, null, ov("{\"v\":1,\"window\":{\"out\":{\"sec\":150},\"in\":{\"sec\":0}}}"), 1, 1, false);
        Planner.Plan p = Planner.plan(s, "a", "b", a, b, 200, 20, 24.5, null, ov("{\"v\":1,\"window\":{\"out\":{\"sec\":150},\"in\":{\"sec\":0,\"delaySec\":3.2}}}"), 1, 1, false);
        assertTrue(p.toString(), p.v2 && "blend".equals(p.style) && p.shape == null && p.preset == null);
        assertEquals(3.2, p.inDelaySec, 0);
        double[][] late = p.curves.out.get("gain"), now = base.curves.out.get("gain");
        // A alone: its own curve with no trim, which a delay past the mix's end gives
        float[][] alone = Mix.djShape(p.style, p.clash, p.durationSec, p.bpm, p.swapAt, 8000, p.durationSec + 1);
        double dipped = 0;
        for (double t = 0.1; t < 3.1; t += 0.1) {
            double own = alone[1][(int) Math.round(t / p.durationSec * 7999)];
            assertEquals("A at " + t + " s while B is held", own, at(late, t), 0.02);
            dipped = Math.max(dipped, at(late, t) - at(now, t));
        }
        assertTrue("without the late entry A dips here (" + dipped + ")", dipped > 0.01);
    }

    private static Planner.Plan blend(double rate, double speedIn) {
        Planner.Plan p = new Planner.Plan();
        p.style = "blend";
        p.durationSec = 16;
        p.barSec = 2;
        p.swapDb = -26;
        p.rate = rate;
        p.speedOut = 1;
        p.speedIn = speedIn;
        return p;
    }

    /** L2: B at a playlist speed of its own glides back to it after the mix, from x1 too. */
    @Test
    public void bGlidesBackToItsOwnSpeedEvenFromX1() {
        double[][] r = Curves.blend(blend(1, 0.97)).in.get("rate");
        assertNotNull("no rate curve for B at x0.97 after a x1 blend", r);
        assertEquals(1, r[0][1], 0);
        assertEquals(1, at(r, 16), 1e-9);
        assertEquals(0.97, r[r.length - 1][1], 1e-9);
        // 3% at 0.25% every 0.25 s after the mix, as many steps as the engine's glide takes (Mix: ceil)
        assertEquals(16 + Math.ceil(Math.abs(1 - 0.97) / Mix.GLIDE_STEP) * Mix.GLIDE_STEP_SEC, r[r.length - 1][0], 1e-9);
        assertTrue(r[r.length - 1][0] >= 19);
        // a blend beat-matched at B's own speed: held there, nothing to glide
        double[][] held = Curves.blend(blend(0.97, 0.97)).in.get("rate");
        assertEquals(2, held.length);
        assertEquals(0.97, held[1][1], 1e-9);
        // no playlist speeds: back to x1 as before
        Planner.Plan plain = blend(1.02, Double.NaN);
        plain.speedOut = Double.NaN;
        double[][] back = Curves.blend(plain).in.get("rate");
        assertEquals(1, back[back.length - 1][1], 1e-9);
        assertEquals(16 + Math.ceil(Math.abs(1.02 - 1) / Mix.GLIDE_STEP) * Mix.GLIDE_STEP_SEC, back[back.length - 1][0], 1e-9);
    }
}
