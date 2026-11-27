package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ClipJudgeTest {
    private static final int W = ClipJudge.W, H = ClipJudge.H;

    /** A frame of noise-like texture at [seed], with black rows [bar] high at top and bottom. */
    private static int[] frame(int seed, int bar) {
        int[] f = new int[W * H];
        for (int y = 0; y < H; y++)
            for (int x = 0; x < W; x++)
                f[y * W + x] = y < bar || y >= H - bar ? 5 : 60 + (x * 37 + y * 11 + seed * 53) % 120;
        return f;
    }

    private static int[] flat(int v) {
        int[] f = new int[W * H];
        Arrays.fill(f, v);
        return f;
    }

    @Test
    public void letterboxBarsAreFound() {
        List<int[]> frames = new ArrayList<>();
        for (int i = 0; i < 10; i++) frames.add(frame(i, 3));
        float[] bars = ClipJudge.bars(frames);
        assertEquals(0f, bars[0], 1e-6);
        assertEquals(3f / H, bars[1], 1e-6);
        assertEquals(3f / H, bars[3], 1e-6);
    }

    @Test
    public void aStillUploadIsStill() {
        List<int[]> frames = new ArrayList<>();
        for (int i = 0; i < 10; i++) frames.add(frame(0, 0));
        assertTrue(ClipJudge.still(frames, new float[4]));
        List<int[]> moving = new ArrayList<>();
        for (int i = 0; i < 10; i++) moving.add(frame(i, 0));
        assertFalse(ClipJudge.still(moving, new float[4]));
    }

    @Test
    public void theLoopEndsOnTheLastCutInRange() {
        // 30 fps for 10 s: one shot, a cut at 6 s, another shot
        List<int[]> frames = new ArrayList<>();
        long[] t = new long[300];
        for (int i = 0; i < 300; i++) {
            t[i] = i * 1000L / 30;
            frames.add(t[i] < 6000 ? flat(80) : flat(180));
        }
        long end = ClipJudge.end(frames, t, 10_000);
        assertTrue("end " + end, end >= 5_990 && end <= 6_040);
    }

    @Test
    public void strobingIsNeverShown() {
        // black/white every frame at 10 fps for 10 s, no cuts to retreat to
        List<int[]> frames = new ArrayList<>();
        long[] t = new long[100];
        for (int i = 0; i < 100; i++) {
            t[i] = i * 100L;
            frames.add(flat(i % 2 == 0 ? 10 : 240));
        }
        assertTrue(ClipJudge.flashing(frames, t, 10_000));
        assertEquals(-1, ClipJudge.end(frames, t, 10_000));
    }
}
