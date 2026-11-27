package app.ayham.extension.music.automix;

/**
 * Automix v2's kick lock (the extension's automix.js kickLock, from Orchard lock.rs). Beat
 * trackers put a beat tens of ms off its kick, differently per song, and two kicks 30 ms apart
 * flam. Over the blend and 8 beats either side, each song's kick onsets (35-140 Hz level, 10 ms
 * smoothing, its rise over 10 ms, every 1 ms) are folded into 256 bins of the playing song's beat;
 * the next song's cue moves by the shift (under an eighth of a beat) that lines its profile up,
 * when the two match well (0.5) and much better than as planned (by 0.2). Pure Java.
 */
public final class KickLock {
    private KickLock() {
    }

    static final double HOP = 0.001;
    static final int BINS = 256, CONTEXT_BEATS = 8, LIMIT = BINS / 8;
    static final double MIN_MATCH = 0.5, MIN_GAIN = 0.2;

    /** Mono samples, their rate, the song second of data[0]. */
    public static final class Side {
        public final float[] data;
        public final double rate, origin;

        public Side(float[] data, double rate, double origin) {
            this.data = data;
            this.rate = rate;
            this.origin = origin;
        }
    }

    /** The cue shift (seconds of the next song; positive: its kick comes late), or why none. */
    public static final class Result {
        public String none;
        public double shift = Double.NaN, score = Double.NaN, gain = Double.NaN;

        @Override
        public String toString() {
            return none != null ? "kick lock: " + none + (Double.isNaN(score) ? "" : " (match " + score + ", gain " + gain + ")")
                    : String.format(java.util.Locale.US, "kick lock: next song's cue %+.1f ms (match %.3f, gain %.3f)", shift * 1000, score, gain);
        }
    }

    static float[] biquad(float[] x, boolean lowpass, double f, double sr) {
        double w = 2 * Math.PI * f / sr, cw = Math.cos(w), al = Math.sin(w) / (2 * Math.sqrt(0.5));
        double b1 = lowpass ? 1 - cw : -(1 + cw), b0 = Math.abs(b1) / 2, a0 = 1 + al;
        double B0 = b0 / a0, B1 = b1 / a0, B2 = b0 / a0, A1 = -2 * cw / a0, A2 = (1 - al) / a0;
        float[] y = new float[x.length];
        double x1 = 0, x2 = 0, y1 = 0, y2 = 0;
        for (int i = 0; i < x.length; i++) {
            double v = B0 * x[i] + B1 * x1 + B2 * x2 - A1 * y1 - A2 * y2;
            x2 = x1;
            x1 = x[i];
            y2 = y1;
            y1 = v;
            y[i] = (float) v;
        }
        return y;
    }

    /** A side's kick onset strength by song second (NaN outside it), or null when under a second of audio. */
    interface Onsets {
        double at(double t);
    }

    static Onsets kickOnsets(Side side, double from, double to) {
        double r = side.rate;
        int a = (int) Math.max(0, Math.floor((from - side.origin) * r)), b = (int) Math.min(side.data.length, Math.ceil((to - side.origin) * r));
        if (b - a < r) return null;
        float[] x = java.util.Arrays.copyOfRange(side.data, a, b);
        x = biquad(x, false, 35, r);
        x = biquad(x, false, 35, r);
        x = biquad(x, true, 140, r);
        x = biquad(x, true, 140, r);
        double alpha = 1 - Math.exp(-1 / (0.010 * r));
        int step = (int) Math.max(1, Math.round(HOP * r));
        double[] levels = new double[(x.length + step - 1) / step];
        int n = 0;
        double level = 0;
        for (int i = 0; i < x.length; i++) {
            level += alpha * ((double) x[i] * x[i] - level);
            if (i % step == 0) levels[n++] = Math.log1p(level * 1e4);
        }
        final double[] values = new double[n];
        for (int i = 10; i < n; i++) values[i] = Math.max(0, levels[i] - levels[i - 10]);
        final double origin = side.origin + a / r;
        return t -> {
            long i = Math.round((t - origin) / HOP);
            return i >= 0 && i < values.length ? values[(int) i] : Double.NaN;
        };
    }

    /**
     * A side from decoded channels: downmixed, low-passed under 400 Hz twice and kept every few
     * samples (about 3 kHz), so the next song's opening is cheap to hold until its blend.
     */
    public static Side kickSource(float[][] channels, double rate, double origin, double from, double to) {
        int a = (int) Math.max(0, Math.floor(from * rate)), b = (int) Math.min(channels[0].length, Math.ceil(to * rate));
        int n = Math.max(0, b - a);
        float[] mono = new float[n];
        for (float[] c : channels) for (int i = 0; i < n; i++) mono[i] = (float) (mono[i] + (double) c[a + i] / channels.length);
        float[] low = biquad(biquad(mono, true, 400, rate), true, 400, rate);
        int step = (int) Math.max(1, Math.floor(rate / 3000));
        float[] data = new float[n / step];
        for (int i = 0; i < data.length; i++) data[i] = low[i * step];
        return new Side(data, rate / step, origin + a / rate);
    }

    /** The two songs' second at output second t of a blend plan (before it: its first speed; after: its last). */
    static final class Clocks {
        double D, inPerOut;
        java.util.function.DoubleUnaryOperator out, in;
    }

    static Clocks blendClocks(Planner.Plan m) {
        Clocks c = new Clocks();
        if (m.glide != null) {
            Planner.GlideSteps G = Planner.glideSteps(m.glide.q, m.glide.beats, m.glide.beatOutSec);
            int B = G.outRate.length;
            c.D = G.total;
            c.inPerOut = G.beatInSec / m.glide.beatOutSec;
            c.out = t -> along(G, t, m.mixOutTrackTime, m.glide.beatOutSec, G.outRate, G.outRate[B - 1]);
            c.in = t -> along(G, t, m.mixInTrackTime, G.beatInSec, G.inRate, 1);
            return c;
        }
        double outRate = m.outRate > 0 ? m.outRate : 1, rate = m.rate > 0 ? m.rate : 1;
        c.D = m.durationSec;
        c.inPerOut = rate / outRate;
        c.out = t -> m.mixOutTrackTime + t * outRate;
        c.in = t -> m.mixInTrackTime + t * rate;
        return c;
    }

    private static double along(Planner.GlideSteps G, double t, double base, double beatSec, double[] rates, double after) {
        int B = rates.length;
        if (t < 0) return base + t * rates[0];
        if (t >= G.total) return base + B * beatSec + (t - G.total) * after;
        int k = 0;
        while (k + 1 < B && G.at[k + 1] <= t) k++;
        return base + k * beatSec + (t - G.at[k]) * rates[k];
    }

    /** null for a plan that isn't a beatmatched blend. */
    public static Result kickLock(Planner.Plan m, Side outSide, Side inSide) {
        double interval = m.beatSec;
        if (m.windowIn) {
            // a mix-in placed in the editor: a shift of up to an eighth of a beat would undo a nudge
            Result r = new Result();
            r.none = "the mix-in was placed in the editor";
            return r;
        }
        if (!Planner.kickLockAllowed(m) || !(interval > 0)) return null;
        Clocks ck = blendClocks(m);
        double context = CONTEXT_BEATS * interval;
        Onsets outAt = kickOnsets(outSide, ck.out.applyAsDouble(-context) - 0.05, ck.out.applyAsDouble(ck.D + context) + 0.05);
        Onsets inAt = kickOnsets(inSide, ck.in.applyAsDouble(-context) - 0.05, ck.in.applyAsDouble(ck.D + context) + 0.05);
        Result r = new Result();
        if (outAt == null || inAt == null) {
            r.none = "not enough audio";
            return r;
        }
        double[][] sums = new double[2][BINS];
        int[][] counts = new int[2][BINS];
        long steps = (long) Math.floor((ck.D + 2 * context) / HOP);
        for (long s = 0; s < steps; s++) {
            double t = -context + s * HOP, o = ck.out.applyAsDouble(t);
            double ph = (o - m.mixOutTrackTime) / interval;
            int bin = (int) Math.min(BINS - 1, Math.floor((ph - Math.floor(ph)) * BINS));
            double vo = outAt.at(o), vi = inAt.at(ck.in.applyAsDouble(t));
            if (!Double.isNaN(vo)) {
                sums[0][bin] += vo;
                counts[0][bin]++;
            }
            if (!Double.isNaN(vi)) {
                sums[1][bin] += vi;
                counts[1][bin]++;
            }
        }
        double[] L = profile(sums[0], counts[0]), R = profile(sums[1], counts[1]);
        if (L == null || R == null) {
            r.none = "no clear kick";
            return r;
        }
        double ll = 0, rr = 0;
        for (int b = 0; b < BINS; b++) {
            ll += L[b] * L[b];
            rr += R[b] * R[b];
        }
        double norm = Math.sqrt(ll * rr);
        if (!(norm > 0)) {
            r.none = "no clear kick";
            return r;
        }
        int best = 0;
        for (int sh = -LIMIT; sh <= LIMIT; sh++) if (score(L, R, sh, norm) > score(L, R, best, norm)) best = sh;
        r.score = Math.round(score(L, R, best, norm) * 1000) / 1000.0;
        r.gain = Math.round((score(L, R, best, norm) - score(L, R, 0, norm)) * 1000) / 1000.0;
        if (Math.abs(best) >= LIMIT || r.score < MIN_MATCH || r.gain < MIN_GAIN) {
            r.none = "the kicks already line up, or match too loosely";
            return r;
        }
        r.shift = (best / (double) BINS) * interval * ck.inPerOut;
        return r;
    }

    private static double[] profile(double[] sums, int[] counts) {
        double[] means = new double[BINS];
        double mean = 0, peak = Double.NEGATIVE_INFINITY;
        boolean all = true;
        for (int i = 0; i < BINS; i++) {
            means[i] = sums[i] / Math.max(1, counts[i]);
            mean += means[i];
            peak = Math.max(peak, means[i]);
            if (counts[i] == 0) all = false;
        }
        mean /= BINS;
        if (!all || !(mean > 0) || !(peak > 2 * mean)) return null;
        for (int i = 0; i < BINS; i++) means[i] -= mean;
        return means;
    }

    private static double score(double[] L, double[] R, int sh, double norm) {
        double s = 0;
        for (int b = 0; b < BINS; b++) s += L[b] * R[(((b + sh) % BINS) + BINS) % BINS];
        return s / norm;
    }
}
