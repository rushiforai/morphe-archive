package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class BiquadTest {
    private static final double SR = 48000;

    /** Peak level of the filter's output for a stereo sine of [hz], after it settles. */
    private static double gain(Biquad f, double hz) {
        int n = (int) SR;
        float[] buf = new float[2 * n];
        for (int i = 0; i < n; i++) {
            float v = (float) (0.5 * Math.sin(2 * Math.PI * hz * i / SR));
            buf[2 * i] = v;
            buf[2 * i + 1] = v;
        }
        f.process(buf, 0, n);
        double peak = 0;
        for (int i = n / 2; i < n; i++) {
            assertEquals("both channels filter alike", buf[2 * i], buf[2 * i + 1], 0);
            peak = Math.max(peak, Math.abs(buf[2 * i]));
        }
        return peak / 0.5;
    }

    @Test
    public void lowpassPassesLowsAndCutsHighs() {
        Biquad lp = new Biquad(Biquad.LOWPASS, SR, 0);
        lp.setValue(1000);
        assertEquals(1, gain(lp, 100), 0.02);
        lp = new Biquad(Biquad.LOWPASS, SR, 0);
        lp.setValue(1000);
        assertTrue(gain(lp, 10000) < 0.02);
    }

    @Test
    public void highpassPassesHighsAndCutsLows() {
        Biquad hp = new Biquad(Biquad.HIGHPASS, SR, 0);
        hp.setValue(2000);
        assertEquals(1, gain(hp, 15000), 0.03);
        hp = new Biquad(Biquad.HIGHPASS, SR, 0);
        hp.setValue(2000);
        assertTrue(gain(hp, 100) < 0.01);
    }

    @Test
    public void lowShelfBoostsBassByItsGainInDb() {
        Biquad ls = new Biquad(Biquad.LOWSHELF, SR, 200);
        ls.setValue(6);
        assertEquals(Math.pow(10, 6 / 20.0), gain(ls, 20), 0.03);
        ls = new Biquad(Biquad.LOWSHELF, SR, 200);
        ls.setValue(6);
        assertEquals(1, gain(ls, 10000), 0.02);
    }

    @Test
    public void highShelfCutsTrebleByItsGainInDb() {
        Biquad hs = new Biquad(Biquad.HIGHSHELF, SR, 3200);
        hs.setValue(-8);
        assertEquals(Math.pow(10, -8 / 20.0), gain(hs, 21000), 0.03);
        hs = new Biquad(Biquad.HIGHSHELF, SR, 3200);
        hs.setValue(-8);
        assertEquals(1, gain(hs, 50), 0.02);
    }

    @Test
    public void unsetFilterPassesThrough() {
        Biquad f = new Biquad(Biquad.LOWPASS, SR, 0); // coefficients still the identity
        assertEquals(1, gain(f, 5000), 1e-6);
    }

    @Test
    public void twentyHertzCornerStaysStable() {
        Biquad hp = new Biquad(Biquad.HIGHPASS, SR, 0);
        hp.setValue(20);
        float[] buf = new float[2 * 480000];
        java.util.Random r = new java.util.Random(1);
        for (int i = 0; i < buf.length; i++) buf[i] = (float) (r.nextGaussian() * 0.3);
        hp.process(buf, 0, buf.length / 2);
        for (float v : buf) {
            assertFalse(Float.isNaN(v));
            assertTrue(Math.abs(v) < 4);
        }
    }

    @Test
    public void cornerIsClampedBelowNyquist() {
        Biquad lp = new Biquad(Biquad.LOWPASS, SR, 0);
        lp.setValue(1e9); // beyond Nyquist: clamped, not unstable
        assertEquals(1, gain(lp, 1000), 0.02);
    }
}
