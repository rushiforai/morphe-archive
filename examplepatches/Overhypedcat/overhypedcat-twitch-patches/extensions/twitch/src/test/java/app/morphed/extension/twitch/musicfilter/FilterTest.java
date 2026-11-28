package app.morphed.extension.twitch.musicfilter;

import static app.morphed.extension.twitch.musicfilter.Canceller.DELAY;
import static app.morphed.extension.twitch.musicfilter.Canceller.HOP;
import static app.morphed.extension.twitch.musicfilter.Canceller.SIZE;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.List;

/**
 * The port against Mor's Python filter (filter.bin, made by Mor's make_filter_fixture.py): the same stream and
 * song through every case the Filter tells apart must come out the same.
 */
public class FilterTest {
    static ByteBuffer resource(String name) throws IOException {
        try (InputStream in = FilterTest.class.getResourceAsStream("/musicfilter/" + name)) {
            byte[] bytes = in.readAllBytes();
            return ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN);
        }
    }

    private static final class Fixture {
        int n;
        int[][] timeline; // at, song, offset, round
        float[][] stream;
        SongCopy copy;
        float[][] expected;
    }

    private static Fixture read() throws IOException {
        ByteBuffer buf = resource("filter.bin");
        Fixture f = new Fixture();
        f.n = buf.getInt();
        int songLength = buf.getInt();
        int pieces = buf.getInt();
        f.timeline = new int[pieces][];
        for (int i = 0; i < pieces; i++) f.timeline[i] = new int[]{buf.getInt(), buf.getInt(), buf.getInt(), buf.getInt()};
        f.stream = new float[][]{floats(buf, f.n), floats(buf, f.n)};
        short[] left = new short[songLength], right = new short[songLength];
        for (int i = 0; i < songLength; i++) left[i] = buf.getShort();
        for (int i = 0; i < songLength; i++) right[i] = buf.getShort();
        f.copy = new SongCopy("vid", left, right);
        int outLength = buf.getInt();
        f.expected = new float[][]{floats(buf, outLength), floats(buf, outLength)};
        return f;
    }

    static float[] floats(ByteBuffer buf, int count) {
        float[] out = new float[count];
        for (int i = 0; i < count; i++) out[i] = buf.getFloat();
        return out;
    }

    private static final Song[] SONGS = {null, new Song("k1", "Title", "Artist"), new Song("k2", "Other", "Artist")};

    @Test
    public void portTakesTheSongOutExactlyAsThePythonFilterDoes() throws IOException {
        Fixture f = read();
        long[] heard = {0};
        Filter filter = new Filter((mono, length) -> heard[0] += length, text -> {
            throw new AssertionError("broke: " + text);
        });
        List<float[]> left = new ArrayList<>(), right = new ArrayList<>();
        float[] l = new float[128], r = new float[128];
        for (int start = 0; start < f.n; start += 128) {
            for (int[] piece : f.timeline) {
                if (piece[0] != start) continue;
                filter.wanted = piece[1] < 0 ? null : new Playing(SONGS[piece[1]], f.copy, piece[2], piece[3]);
            }
            System.arraycopy(f.stream[0], start, l, 0, 128);
            System.arraycopy(f.stream[1], start, r, 0, 128);
            filter.push(l, r, 128, (a, b) -> { // (the blocks are the filter's own, reused: copied)
                left.add(a.clone());
                right.add(b.clone());
            });
        }
        assertEquals(f.expected[0].length, left.size() * HOP);
        double worst = 0, peak = 0;
        for (int block = 0; block < left.size(); block++) {
            for (int i = 0; i < HOP; i++) {
                int at = block * HOP + i;
                worst = Math.max(worst, Math.abs(left.get(block)[i] - f.expected[0][at]));
                worst = Math.max(worst, Math.abs(right.get(block)[i] - f.expected[1][at]));
                peak = Math.max(peak, Math.abs(f.expected[0][at]));
            }
        }
        assertTrue("largest difference " + worst + " (peak " + peak + ")", worst < 1e-4 * Math.max(peak, 1));
        assertEquals(f.n, heard[0]); // every sample went to the tracker
    }

    @Test
    public void songIsMostlyGoneOnceTheCancellersHaveLearnedIt() throws IOException {
        Fixture f = read();
        int from = HOP * 100, to = HOP * 115;
        double in = 0, out = 0;
        for (int i = from; i < to; i++) {
            in += f.stream[0][i] * f.stream[0][i];
            out += f.expected[0][i + DELAY] * f.expected[0][i + DELAY];
        }
        assertTrue("left " + out / in, out < in * 0.1);
    }

    @Test
    public void withoutASongTheSoundGoesThroughDelayBehind() {
        Canceller c = new Canceller();
        float[] input = new float[HOP * 8];
        for (int i = 0; i < input.length; i++) input[i] = (float) (Math.sin(i / 7.0) * 0.5);
        float[] out = new float[input.length];
        for (int i = 0; i < 8; i++) {
            float[] hop = new float[HOP];
            System.arraycopy(input, i * HOP, hop, 0, HOP);
            System.arraycopy(c.process(hop, null), 0, out, i * HOP, HOP);
        }
        for (int i = SIZE; i < out.length; i++) assertEquals(input[i - DELAY], out[i], 1e-5);
    }

    @Test
    public void frameFftAndItsInverseGiveBackTheSamples() {
        FrameFft fft = new FrameFft(SIZE);
        double[] x = new double[SIZE];
        for (int i = 0; i < SIZE; i++) x[i] = Math.cos(i * 0.37) + (i % 5) * 0.1;
        double[] re = new double[SIZE / 2 + 1], im = new double[SIZE / 2 + 1], back = new double[SIZE];
        fft.rfft(x, re, im);
        double dc = 0;
        for (double v : x) dc += v;
        assertEquals(dc, re[0], 1e-9);
        fft.irfft(re, im, back);
        for (int i = 0; i < SIZE; i++) assertEquals(x[i], back[i], 1e-9);
    }

    @Test
    public void aSongsSliceIsItsSoundUnderTheStreamNothingBeforeOrAfter() {
        SongCopy copy = new SongCopy("v", new short[]{16384, -16384, 0, 8192}, new short[]{1, 2, 3, 4});
        Playing p = new Playing(new Song("k", "t", "a"), copy, 1, 0);
        float[] l = new float[3], r = new float[3];
        assertTrue(p.slice(0, 2, l, r));
        assertEquals(-0.5f, l[0], 0);
        assertEquals(0f, l[1], 0);
        assertTrue(p.slice(2, 3, l, r));
        assertEquals(0.25f, l[0], 0);
        assertEquals(0f, l[1], 0);
        assertFalse(p.slice(3, 2, l, r));
        assertFalse(p.slice(-5, 2, l, r));
    }

    @Test
    public void aFilterThatBreaksLetsTheSoundThroughStillInStep() {
        List<String> problems = new ArrayList<>();
        Filter filter = new Filter((mono, length) -> { }, problems::add);
        filter.wanted = new Playing(new Song("k", "t", "a"), new SongCopy("v", new short[HOP * 20], new short[HOP * 20]), 0, 0);
        filter.cancellers[0] = new Canceller() {
            @Override
            public float[] process(float[] stream, float[] song) {
                throw new IllegalStateException("boom");
            }
        };
        float[] block = new float[HOP];
        for (int i = 0; i < HOP; i++) block[i] = (float) i / HOP;
        List<Float> flat = new ArrayList<>();
        for (int i = 0; i < 6; i++) filter.push(block, block, HOP, (a, b) -> { for (float v : a) flat.add(v); });
        assertEquals(1, problems.size());
        assertTrue(problems.get(0), problems.get(0).startsWith("Filter broke | ") && problems.get(0).contains("broke, the sound plays unfiltered: boom"));
        for (int i = DELAY; i < flat.size(); i++) assertEquals(block[(i - DELAY) % HOP], flat.get(i), 1e-7);
    }

    @Test
    public void switchedOffTheSoundGoesThroughTheSameDelay() {
        Filter filter = new Filter((mono, length) -> { }, text -> { });
        filter.enabled = false;
        float[] block = new float[HOP];
        for (int i = 0; i < HOP; i++) block[i] = (float) Math.sin(i / 9.0);
        List<Float> flat = new ArrayList<>();
        for (int i = 0; i < 6; i++) filter.push(block, block, HOP, (a, b) -> { for (float v : a) flat.add(v); });
        for (int i = 0; i < DELAY; i++) assertEquals(0f, flat.get(i), 0);
        for (int i = DELAY; i < flat.size(); i++) assertEquals(block[(i - DELAY) % HOP], flat.get(i), 1e-7);
    }
}
