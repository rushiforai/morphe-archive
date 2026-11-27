package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

/** Two players whose readings move every ~250 ms, read every 10 ms: their gap is found, not the step. */
public class StepClockTest {
    /** A reading that updates every period ms (from phase), showing the position at that update. */
    private static long reading(long t, long period, long phase, double offsetMs) {
        long upd = t - Math.floorMod(t - phase, period);
        return Math.round(upd + offsetMs);
    }

    @Test
    public void gapOfSteppedClocks() {
        for (double gap : new double[]{0, 40, -73, 5}) {
            StepClock a = new StepClock(), b = new StepClock();
            double est = Double.NaN;
            for (long t = 0; t < 4000; t += 10) {
                a.see(reading(t, 250, 37, 1000), t, 1f);
                b.see(reading(t, 253, 161, 1000 + gap), t, 1f);
                if (a.n() >= 6 && b.n() >= 6) est = b.at(t, 1f) - a.at(t, 1f);
            }
            assertEquals(gap, est, 10);
        }
    }

    /** A tempo glide (speed 1 → 1.08 → 1 over 3 s): the gap is still found without a reset. */
    @Test
    public void gapThroughASpeedGlide() {
        for (double gap : new double[]{0, 30, -45}) {
            StepClock a = new StepClock(), b = new StepClock();
            double posA = 1000, posB = 1000 + gap, est = Double.NaN;
            long nextA = 37, nextB = 161;
            long ra = Math.round(posA), rb = Math.round(posB);
            for (long t = 0; t < 6000; t += 10) {
                float s = t < 1500 ? 1f : t < 3000 ? 1f + 0.08f * (t - 1500) / 1500f : t < 4500 ? 1.08f - 0.08f * (t - 3000) / 1500f : 1f;
                posA += 10 * s;
                posB += 10 * s;
                if (t >= nextA) { ra = Math.round(posA); nextA += 250; }
                if (t >= nextB) { rb = Math.round(posB); nextB += 253; }
                a.see(ra, t, s);
                b.see(rb, t, s);
                if (t > 2000 && a.n() >= 6 && b.n() >= 6) {
                    est = b.at(t, s) - a.at(t, s);
                    assertEquals("at " + t, gap, est, 12);
                }
            }
            assertEquals(gap, est, 10);
        }
    }

    @Test
    public void speedChangeInAGapOfReadings() {
        // speed x1 -> x0.92 at 1000 ms; no readings from 1000 to 1300 ms (the settle after a change)
        StepClock c = new StepClock();
        double pos = 5000;
        for (long t = 0; t < 3000; t += 10) {
            float s = t < 1000 ? 1f : 0.92f;
            if (t == 1000) c.speed(t, s);
            if (t % 250 == 0 && (t < 1000 || t >= 1300)) c.see(Math.round(pos), t, s);
            pos += 10 * s; // the position at t + 10
        }
        // the true position at 3000 ms
        assertEquals(pos, c.at(3000, 0.92f), 6);
    }

    @Test
    public void naiveComparisonWouldSwing() {
        // the old way: our stale reading against YT's fresh one is off by up to a step
        long t = 1240;
        long diff = reading(t, 250, 161, 1000) - reading(t, 250, 37, 1000);
        assertEquals(124, Math.abs(diff), 2);
    }
}
