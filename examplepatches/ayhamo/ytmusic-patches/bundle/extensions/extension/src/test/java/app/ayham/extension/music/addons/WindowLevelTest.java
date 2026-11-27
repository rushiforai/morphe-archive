package app.ayham.extension.music.addons;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class WindowLevelTest {
    /** 10 ms envelope of a song whose level moves, [sec] long, scaled by [db]. */
    private static float[] env(double sec, double db) {
        int n = (int) Math.round(sec / 0.01);
        float[] r = new float[n];
        double k = Math.pow(10, db / 20);
        for (int i = 0; i < n; i++) r[i] = (float) (k * (0.05 + 0.04 * Math.sin(i / 37.0)));
        return r;
    }

    @Test
    public void theSameMasterNeedsNoGain() {
        float[] yt = env(40, 0), file = env(40, 0);
        assertEquals(0, OffsetFit.windowGainDb(yt, file, 0, 0, 12), 1e-6);
    }

    @Test
    public void aQuieterFileIsBroughtUpToYouTube() {
        // the file 7.5 dB under YouTube's copy: +7.5 dB (the S21 FE heard the opposite as a -7.3 dB step)
        assertEquals(7.5, OffsetFit.windowGainDb(env(40, 0), env(40, -7.5), 0, 0, 12), 1e-4);
        assertEquals(-3, OffsetFit.windowGainDb(env(40, 0), env(40, 3), 0, 0, 12), 1e-4);
    }

    @Test
    public void theSameSecondsAreComparedThroughTheOffset() {
        // fileTime = youtubeTime + 1.5 s: the file's envelope is YouTube's 1.5 s later, 2 dB quieter
        float[] yt = env(40, 0), file = new float[4000];
        double k = Math.pow(10, -2 / 20.0);
        for (int i = 150; i < file.length; i++) file[i] = (float) (yt[i - 150] * k);
        assertEquals(2, OffsetFit.windowGainDb(yt, file, 1.5, 5, 17), 1e-4);
    }

    @Test
    public void silenceIsLeftOutAndTooLittleSoundIsNotKnown() {
        float[] yt = env(40, 0), file = env(40, -4);
        for (int i = 0; i < 600; i++) file[i] = 0;          // its first 6 s silent: the rest still counts
        assertEquals(4, OffsetFit.windowGainDb(yt, file, 0, 0, 12), 1e-4);
        assertTrue(Double.isNaN(OffsetFit.windowGainDb(yt, file, 0, 0, 7)));   // 1 s of sound
    }
}
