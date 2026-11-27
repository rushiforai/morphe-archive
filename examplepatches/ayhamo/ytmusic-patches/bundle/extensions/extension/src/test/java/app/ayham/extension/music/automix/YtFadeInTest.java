package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class YtFadeInTest {
    /** The phone's ramp (2026-11-19 22:45:46): 0 at once, then 0.151 .. 1.000 within 470 ms. */
    @Test
    public void ytsStartRampIsNotFollowed() {
        YtFadeIn f = new YtFadeIn();
        long[] at = {0, 182, 233, 299, 365, 416, 470};
        float[] v = {0f, 0.151f, 0.463f, 0.740f, 0.924f, 0.991f, 1f};
        for (int i = 0; i < at.length; i++)
            for (long t = at[i]; t < (i + 1 < at.length ? at[i + 1] : 600); t += 5)
                assertTrue("t=" + t, Float.isNaN(f.follow(t, v[i])));
        assertEquals(1f, f.follow(670, 1f), 0);
    }

    @Test
    public void aSteadyLevelIsFollowedAfterTheRamp() {
        YtFadeIn f = new YtFadeIn();
        f.follow(0, 0.944f);
        assertEquals(0.944f, f.follow(YtFadeIn.STEADY_MS, 0.944f), 0);
        // later changes (a duck, normalization) are followed at once
        assertEquals(0.2f, f.follow(5000, 0.2f), 0);
        assertEquals(0f, f.follow(5005, 0f), 0);
    }

    @Test
    public void silenceHeldIsFollowedOnlyAfterTheCap() {
        YtFadeIn f = new YtFadeIn();
        for (long t = 0; t < YtFadeIn.MAX_MS; t += 5) assertTrue(Float.isNaN(f.follow(t, 0f)));
        assertEquals(0f, f.follow(YtFadeIn.MAX_MS, 0f), 0);
    }
}
