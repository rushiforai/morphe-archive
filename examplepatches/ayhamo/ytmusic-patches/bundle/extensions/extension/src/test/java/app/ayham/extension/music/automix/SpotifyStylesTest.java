package app.ayham.extension.music.automix;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/**
 * editor.md §3, the styles from Spotify's editor screenshots (17e67dbd): volume fadeIn1BarCutOut (12)
 * and overlap1BarCutOut (13), eq bassFadeOut (15); and spotify-mixes.md rule 10's tempo gate (333b2fc5):
 * B plays at A's played tempo and glides back to its own speed after the mix.
 */
public class SpotifyStylesTest {
    private static MixOverride lanes(String volume, String eq) {
        return MixOverride.fromJson(Json.parse("{\"v\":1,\"preset\":\"custom\",\"lanes\":{\"volume\":\"" + volume + "\",\"eq\":\"" + eq + "\",\"effect\":\"none\"}}"));
    }

    private static void points(double[][] want, double[][] got) {
        assertEquals(java.util.Arrays.deepToString(got), want.length, got.length);
        for (int i = 0; i < want.length; i++) assertArrayEquals(java.util.Arrays.deepToString(got), want[i], got[i], 1e-6);
    }

    @Test
    public void oneBarCutOutsCutAOneBarBeforeTheEnd() {
        double D = 16, beat = 0.5, e = MixOverride.CUT_RAMP_SEC / D, b = 1 - 4 * beat / D;   // 0.875
        Curves c = MixOverride.presetCurves(lanes("fadeIn1BarCutOut", "none"), D, beat);
        points(new double[][]{{0, 1}, {b * D, 1}, {(b + e) * D, 0}}, c.out.get("gain"));
        points(new double[][]{{0, 0}, {0.5 * D, 1}}, c.in.get("gain"));
        c = MixOverride.presetCurves(lanes("overlap1BarCutOut", "none"), D, beat);
        points(new double[][]{{0, 1}, {b * D, 1}, {(b + e) * D, 0}}, c.out.get("gain"));
        points(new double[][]{{0, 0}, {e * D, 1}}, c.in.get("gain"));
        // a window under two bars: the cut no earlier than the middle
        c = MixOverride.presetCurves(lanes("overlap1BarCutOut", "none"), 3, beat);
        assertEquals(0.5 * 3, c.out.get("gain")[1][0], 1e-6);
        // beat match Off: 0.875
        c = MixOverride.presetCurves(lanes("fadeIn1BarCutOut", "none"), 10, Double.NaN);
        assertEquals(0.875 * 10, c.out.get("gain")[1][0], 1e-6);
    }

    @Test
    public void bassFadeOutIsAnSCurveToTheCutAtTheMiddle() {
        double D = 16, C = MixOverride.CUT_DB;
        Curves c = MixOverride.presetCurves(lanes("crossfade", "bassFadeOut"), D, 0.5);
        double[][] bass = c.out.get("bassDb");
        assertEquals(17, bass.length);
        for (int i = 0; i <= 16; i++) {
            double t = i / 16.0;
            assertEquals(t / 2 * D, bass[i][0], 1e-6);
            assertEquals(C * (1 - Math.cos(t * Math.PI)) / 2, bass[i][1], 1e-6);
        }
        assertNull(c.in.get("bassDb"));
    }

    @Test
    public void theNewStylesAreOffered() {
        assertTrue(java.util.Arrays.asList(MixOverride.VOLUMES).contains("fadeIn1BarCutOut"));
        assertTrue(java.util.Arrays.asList(MixOverride.VOLUMES).contains("overlap1BarCutOut"));
        assertTrue(java.util.Arrays.asList(MixOverride.EQS).contains("bassFadeOut"));
    }

    /** The hand-over's lead is the measured output latency too, 40 ms without a reading. */
    @Test
    public void theHandOverLeadsByTheMeasuredLatency() {
        assertEquals(0.040, Engine.handoverLead(Double.NaN), 1e-9);
        assertEquals(0.053, Engine.handoverLead(0.053), 1e-9);
    }

    /** B at A's played tempo through the mix, then back to its own speed in glide steps, and on at it. */
    @Test
    public void bGlidesBackToItsSpeedAfterTheMix() {
        Planner.Settings s = new Planner.Settings();
        s.version = 3;
        Analysis a = PlannerTest.song("a", 102.3, 220, 0.9), b = PlannerTest.song("b", 93, 210, 0.9);
        Planner.Plan p = Planner.plan(s, "a", "b", a, b, a.durationSec, 60, 60 + PlannerTest.EARLIEST_LEAD, null, null, 0.97057, 1.03228);
        assertEquals("blend", p.style);
        assertEquals(0.97057 * 102.3 / 93, p.rate, 1e-9);
        Mix m = Mix.blend(p, "a", "b", 220);
        assertEquals(p.rate, m.in.rateAt(m.t0 + m.D / 2), 1e-6);
        assertEquals(1.03228, m.in.rateAt(m.elementAt), 1e-6);
        assertEquals(1.03228, m.in.rateAt(m.elementAt + 60), 1e-6);
        // the glide moves at most GLIDE_STEP per step
        double last = p.rate;
        for (double t = m.t0 + m.D; t < m.elementAt; t += Mix.GLIDE_STEP_SEC / 2) {
            double r = m.in.rateAt(t);
            assertTrue(Math.abs(r - last) <= Mix.GLIDE_STEP + 1e-9);
            last = r;
        }
    }
}
