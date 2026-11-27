package app.ayham.extension.music.automix;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class LimiterTest {
    private static final int B = 512;

    /** A stereo block of a sine at [amp], continuing from frame [from]. */
    private static float[] sine(double amp, long from) {
        float[] b = new float[B * 2];
        for (int i = 0; i < B; i++) {
            float v = (float) (amp * Math.sin(2 * Math.PI * 440 * (from + i) / 48000.0));
            b[2 * i] = v;
            b[2 * i + 1] = v;
        }
        return b;
    }

    private static float max(float[] b) {
        float m = 0;
        for (float v : b) m = Math.max(m, Math.abs(v));
        return m;
    }

    @Test
    public void holdsTheSumUnderTheCeiling() {
        Limiter l = new Limiter(B);
        float[] next = sine(1.8, 0);
        float worst = 0;
        for (int k = 0; k < 40; k++) {
            float[] cur = next;
            next = sine(k == 20 ? 0.3 : 1.8, (k + 1) * (long) B);
            l.process(cur, next, true);
            if (k > 0) worst = Math.max(worst, max(cur));   // from the overlap on: the engine switches it on a block early
        }
        assertTrue("peak " + worst, worst <= Limiter.CEILING * 1.0001f);
        assertTrue(l.deepest < 0.6f);
    }

    @Test
    public void aLoneDeckPassesBitForBit() {
        Limiter l = new Limiter(B);
        float[] cur = sine(1.5, 0), copy = cur.clone();
        l.process(cur, sine(1.5, B), false);
        assertArrayEquals(copy, cur, 0f);
        assertEquals(0, l.lowered);
    }

    @Test
    public void aQuietSumIsUntouched() {
        Limiter l = new Limiter(B);
        float[] cur = sine(0.8, 0), copy = cur.clone();
        l.process(cur, sine(0.8, B), true);
        assertArrayEquals(copy, cur, 0f);
    }

    @Test
    public void peaksAheadAreCaughtBeforeTheyArrive() {
        Limiter l = new Limiter(B);
        float[] cur = sine(0.5, 0);
        float[] next = new float[B * 2];
        next[2 * 100] = 2f;   // a spike 100 frames into the next block
        next[2 * 100 + 1] = 2f;
        l.process(cur, next, true);
        // the gain starts down in this block's last 140 frames, smoothly: no step bigger than 1%
        float[] plain = sine(0.5, 0);
        float prev = 1;
        for (int i = 0; i < B; i++) {
            float gi = plain[2 * i] == 0 ? prev : cur[2 * i] / plain[2 * i];
            assertTrue(Math.abs(gi - prev) < 0.01f || plain[2 * i] == 0);
            prev = gi;
        }
        float[] after = new float[B * 2];
        l.process(next, after, true);
        assertTrue(Math.abs(next[2 * 100]) <= Limiter.CEILING * 1.0001f);
    }

    @Test
    public void comesBackToOneAfterwards() {
        Limiter l = new Limiter(B);
        float[] next = sine(2, 0);
        for (int k = 0; k < 4; k++) {
            float[] cur = next;
            next = sine(2, (k + 1) * (long) B);
            l.process(cur, next, true);
        }
        // a second of quiet overlap: the gain returns to 1 and then leaves samples exact
        for (int k = 0; k < 100; k++) {
            float[] cur = next;
            next = sine(0.2, (k + 5) * (long) B);
            l.process(cur, next, true);
        }
        float[] cur = sine(0.2, 105L * B), copy = cur.clone();
        l.process(cur, sine(0.2, 106L * B), true);
        assertArrayEquals(copy, cur, 0f);
    }

    @Test
    public void aDeckIsClampedToFullScaleBeforeItsLevel() {
        float[] b = {1.3f, -1.2f, 0.5f, -0.99f, 1f, -1f};
        Engine.clamp(b);
        assertArrayEquals(new float[]{1f, -1f, 0.5f, -0.99f, 1f, -1f}, b, 0f);
    }

    @Test
    public void aNaNOrInfiniteSampleIsSilenceAndTheGainRecovers() {
        Limiter l = new Limiter(B);
        float[] next = sine(0.5, 0);
        next[2 * 10] = Float.NaN;
        next[2 * 20 + 1] = Float.POSITIVE_INFINITY;
        next[2 * 30] = Float.NEGATIVE_INFINITY;
        for (int k = 0; k < 60; k++) {
            float[] cur = next;
            next = sine(0.5, (k + 1) * (long) B);
            if (k == 5) next[2 * 7] = Float.POSITIVE_INFINITY;
            l.process(cur, next, true);
            for (float v : cur) assertTrue("block " + k, Float.isFinite(v));
        }
        assertEquals(1f, l.deepest, 0f);   // a bad sample never pulled the gain down
        // the gain is back at 1: a quiet block passes exact
        float[] cur = sine(0.5, 61L * B), copy = cur.clone();
        l.process(cur, sine(0.5, 62L * B), true);
        assertArrayEquals(copy, cur, 0f);
    }

    @Test
    public void aNaNDoesNotHideARealPeak() {
        Limiter l = new Limiter(B);
        float[] cur = sine(0.2, 0), next = new float[B * 2];
        next[2 * 50] = Float.NaN;
        next[2 * 60] = 2f;
        next[2 * 60 + 1] = 2f;
        l.process(cur, next, true);
        l.process(next, new float[B * 2], true);
        assertTrue(Math.abs(next[2 * 60]) <= Limiter.CEILING * 1.0001f);
        assertEquals(0f, next[2 * 50], 0f);
    }
}
