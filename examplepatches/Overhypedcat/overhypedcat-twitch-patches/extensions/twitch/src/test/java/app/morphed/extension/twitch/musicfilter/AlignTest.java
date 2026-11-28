package app.morphed.extension.twitch.musicfilter;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Random;

/** The port of align.py against its reference results (align.bin, made by make_align_fixture.py). */
public class AlignTest {
    private static final int RATE = 48000;

    @Test
    public void realFftMatchesTheDefinitionAndInvertsBack() {
        Random random = new Random(3);
        int n = 64;
        double[] x = new double[n];
        for (int i = 0; i < 50; i++) x[i] = random.nextGaussian(); // zero padded past 50
        double[] re = new double[n / 2 + 1], im = new double[n / 2 + 1];
        RealFft.rfft(x, 50, n, re, im);
        for (int k = 0; k <= n / 2; k++) {
            double r = 0, s = 0;
            for (int t = 0; t < n; t++) {
                r += x[t] * Math.cos(2 * Math.PI * k * t / n);
                s -= x[t] * Math.sin(2 * Math.PI * k * t / n);
            }
            assertEquals(r, re[k], 1e-9);
            assertEquals(s, im[k], 1e-9);
        }
        double[] back = RealFft.irfft(re, im, n);
        for (int i = 0; i < n; i++) assertEquals(x[i], back[i], 1e-9);
    }

    @Test
    public void matchesTheReference() throws IOException {
        ByteBuffer buf = FilterTest.resource("align.bin");
        int n = buf.getInt(), streamLength = buf.getInt();
        short[] left = new short[n], right = new short[n];
        for (int i = 0; i < n; i++) left[i] = buf.getShort();
        for (int i = 0; i < n; i++) right[i] = buf.getShort();
        float[] stream = FilterTest.floats(buf, streamLength);
        float[] other = FilterTest.floats(buf, 4 * RATE);
        float[] reducedSong = FilterTest.floats(buf, buf.getInt());
        long foundAt = buf.getLong();
        double foundScore = buf.getDouble();
        long stillAt = buf.getLong();
        double stillScore = buf.getDouble();
        long missAt = buf.getLong();
        double missScore = buf.getDouble();
        long knownAt = buf.getLong();
        double knownScore = buf.getDouble();
        float[] otherPrint = FilterTest.floats(buf, buf.getInt());

        SongCopy song = new SongCopy("v", left, right);
        float[] reduced = song.reduced();
        assertEquals(reducedSong.length, reduced.length);
        double worst = 0, peak = 0;
        for (int i = 0; i < reduced.length; i++) {
            worst = Math.max(worst, Math.abs(reduced[i] - reducedSong[i]));
            peak = Math.max(peak, Math.abs(reducedSong[i]));
        }
        assertTrue("reduce differs by " + worst + " of " + peak, worst < 1e-4 * peak);

        Align.Found found = Align.find(stream, song, null);
        assertEquals(foundAt, (long) found.at);
        assertEquals(foundScore, found.score, foundScore * 1e-3);

        Align.Found still = Align.still(Arrays.copyOf(stream, 4 * RATE), song, 123457 + 40);
        assertEquals(stillAt, (long) still.at);
        assertEquals(stillScore, still.score, stillScore * 1e-3);

        Align.Found miss = Align.still(other, song, 123457);
        assertEquals(-1, missAt);
        assertNull(miss.at);
        assertEquals(missScore, miss.score, 0.05);

        Align.Found known = Align.known(stream, Arrays.asList(otherPrint, Align.thin(reduced)));
        assertEquals(knownAt, (long) known.at);
        assertEquals(knownScore, known.score, knownScore * 1e-3);
    }

    @Test
    public void aStretchShorterThanNeededIsNotFound() {
        SongCopy song = new SongCopy("v", new short[100], new short[100]);
        Align.Found found = Align.find(new float[RATE], song, null);
        assertNull(found.at);
        assertEquals(0.0, found.score, 0);
    }

    @Test
    public void theMedianBySelectionIsTheSortsExactly() {
        java.util.Random random = new java.util.Random(7);
        for (int n : new int[]{1, 2, 3, 4, 5, 10, 11, 1000, 1001}) {
            for (int round = 0; round < 20; round++) {
                double[] values = new double[n];
                for (int i = 0; i < n; i++) values[i] = round % 3 == 0 ? random.nextInt(4) : random.nextGaussian();
                if (round % 5 == 1) java.util.Arrays.sort(values); // sorted already
                double[] sorted = values.clone();
                java.util.Arrays.sort(sorted);
                double expected = n % 2 == 1 ? sorted[n / 2] : (sorted[n / 2 - 1] + sorted[n / 2]) / 2;
                org.junit.Assert.assertEquals(expected, Align.median(values), 0.0);
            }
        }
    }
}
