package app.ayham.extension.music.automix;

/**
 * The mix's soft limiter: while both songs sound, the sum is held under -1 dBFS. A 5 ms lookahead
 * lowers the gain before a peak arrives (the gain is the trailing 5 ms mean of the window's needed
 * gain, so it is under the ceiling at the peak and moves without a click); it comes back over
 * ~100 ms. It switches on one block before the overlap (the engine checks the next block), so
 * its history holds the real needs by the time both songs sound. Outside the overlap the samples
 * pass untouched, bit for bit.
 *
 * <p>Streaming: {@link #process} takes the block going out and the one after it (its lookahead),
 * so the deck gets the lookahead with no added delay: the engine renders one block ahead.
 */
final class Limiter {
    static final float CEILING = (float) Math.pow(10, -1 / 20.0);
    static final int LOOKAHEAD = 240;                       // 5 ms at 48 kHz
    private static final double RELEASE = 1 - Math.exp(-1 / (0.1 * Engine.SR));

    private final int block;
    private final float[] peak;
    private final int[] dq;
    private final float[] hist = new float[LOOKAHEAD];
    private int hAt, hBelow;          // hBelow: history entries under 1
    private double hSum = LOOKAHEAD;
    private double g = 1;   // double: near 1 a float can't take the release's steps

    /** For the mix's summary: the deepest gain, and the samples it lowered (read on the render thread only). */
    float deepest = 1;
    long lowered;

    Limiter(int block) {
        // the lookahead is read from the next block alone
        if (block < LOOKAHEAD) throw new IllegalArgumentException("block " + block + " < lookahead " + LOOKAHEAD);
        this.block = block;
        peak = new float[block + LOOKAHEAD];
        dq = new int[block + LOOKAHEAD];
        java.util.Arrays.fill(hist, 1f);
    }

    /**
     * [cur] (interleaved stereo, [block] frames) gets the gain; [next] is only read. [active]: both
     * songs sound in cur or next (the needed gain is worked out ahead of the overlap).
     */
    void process(float[] cur, float[] next, boolean active) {
        if (!active && g == 1 && hBelow == 0) return;
        int n = block + LOOKAHEAD;
        for (int j = 0; j < n; j++) {
            float[] b = j < block ? cur : next;
            int k = j < block ? j : j - block;
            if (j < block) {   // a NaN or infinite sample goes out as silence, so the gain stays finite
                if (!Float.isFinite(b[2 * k])) b[2 * k] = 0;
                if (!Float.isFinite(b[2 * k + 1])) b[2 * k + 1] = 0;
            }
            peak[j] = Math.max(finiteAbs(b[2 * k]), finiteAbs(b[2 * k + 1]));
        }
        // the window max over [i, i + LOOKAHEAD] (a monotonic queue), then the needed gain
        int head = 0, tail = 0;
        for (int j = 0; j < n; j++) {
            while (tail > head && peak[dq[tail - 1]] <= peak[j]) tail--;
            dq[tail++] = j;
            int i = j - LOOKAHEAD;
            if (i < 0) continue;
            if (dq[head] < i) head++;
            float max = peak[dq[head]];
            float need = active && max > CEILING ? CEILING / max : 1f;
            float old = hist[hAt];
            if (old < 1f) hBelow--;
            if (need < 1f) hBelow++;
            hist[hAt] = need;
            hAt = (hAt + 1) % LOOKAHEAD;
            hSum += need - old;
            g = Math.min(hSum / LOOKAHEAD, g + (1 - g) * RELEASE);
            if (hBelow == 0 && g > 0.9999) {
                g = 1;
                hSum = LOOKAHEAD;   // no drift from the running sum
            }
            if (g < 1) {
                cur[2 * i] *= (float) g;
                cur[2 * i + 1] *= (float) g;
                lowered++;
                if (g < deepest) deepest = (float) g;
            }
        }
    }

    /** A NaN or infinite sample counts as silence (peak 0). */
    static float finiteAbs(float v) {
        return Float.isFinite(v) ? Math.abs(v) : 0f;
    }
}
