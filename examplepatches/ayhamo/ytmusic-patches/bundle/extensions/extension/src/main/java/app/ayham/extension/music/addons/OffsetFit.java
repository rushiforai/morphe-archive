package app.ayham.extension.music.addons;

import java.util.Arrays;

/**
 * Fits an addon's file of a song to YouTube's audio of it, and levels it (spec/addons/offset-map.md).
 * A port of the extension's src/addons/offset-fit.js.
 *
 * Each side is read once, while it decodes ({@link Side#add}): mono at 22 050 Hz (FIT_RATE) from
 * the same decode path that plays it. A Side keeps only what the fit needs, never the PCM: the
 * 10 ms RMS envelope (100 values a second), the 1 kHz band-limited stream at 4 kHz (the fine
 * fit's input) and the loudness blocks. The true peak is a {@link PeakMeter} fed with the
 * file's channels as it plays.
 *
 * The map: addonTime = youtubeTime + offsetSec.
 */
public final class OffsetFit {
    private OffsetFit() {
    }

    public static final int FIT_RATE = 22050;
    static final double ENV_WIN_SEC = 0.01;           // coarse envelope: RMS of 10 ms windows
    static final double ENV_WIN = FIT_RATE * ENV_WIN_SEC;   // 220.5 samples
    static final double SILENT_RMS = 0.001;            // -60 dBFS: a silent window
    static final double COARSE_SEC = 60, COARSE_LAG_SEC = 15, MIN_SCORE = 0.8, MIN_OVERLAP = 0.5;
    static final int FINE_RATE = 4000, FINE_CUTOFF = 1000;
    static final double FINE_SEC = 20, FINE_LAG_SEC = 0.02;
    static final double CHECK_LAG_SEC = 0.5, CHECK_AGREE_SEC = 0.03, CHECK_BEFORE_END = 30, SHORT_SONG = 90;
    public static final double MAX_BOOST_DB = 6, CEILING_DBTP = -1;

    // ---- the 4 kHz stream: y[n] = sum_k x[k] h(t_n - k), t_n = n * 22050 / 4000 = n * 441 / 80,
    // h(u) = g sinc(g u) (0.5 + 0.5 cos(pi u / W)), g = 2 * 1000 / 22050, W = ceil(4 * 22050 / 1000) = 89.
    // t_n's fraction repeats every 80 outputs, so the taps are 80 tables.

    static final int LOW_NUM = 441, LOW_DEN = 80;      // 22050 / 4000
    static final int W = (int) Math.ceil(4.0 * FIT_RATE / FINE_CUTOFF);
    private static final int[] LOW_FIRST = new int[LOW_DEN];   // the first tap's offset from floor(t)
    private static final double[][] LOW_TAPS = new double[LOW_DEN][];

    static {
        double g = 2.0 * FINE_CUTOFF / FIT_RATE;
        for (int p = 0; p < LOW_DEN; p++) {
            double frac = (double) p / LOW_DEN;
            int first = p == 0 ? -W : -W + 1;   // ceil(t - W) - floor(t)
            LOW_FIRST[p] = first;
            double[] taps = new double[W - first + 1];
            for (int i = 0; i < taps.length; i++) {
                double u = frac - (first + i);   // t - k
                double a = Math.PI * g * u;
                double sinc = u == 0 ? 1 : Math.sin(a) / a;
                taps[i] = g * sinc * (0.5 + 0.5 * Math.cos((Math.PI * u) / W));
            }
            LOW_TAPS[p] = taps;
        }
    }

    private static final int RING = 1024, MASK = RING - 1;

    /** One side of the fit, built while its audio decodes. */
    public static final class Side {
        private final float[] ring = new float[RING];
        private long count;
        private boolean finished;
        // envelope: window i covers samples [round(i * 220.5), round((i + 1) * 220.5))
        private float[] rms = new float[1024];
        private int nRms;
        private double winSum;
        private long winStart, winEnd = Math.round(ENV_WIN);
        // the 4 kHz stream
        private float[] low = new float[4096];
        private int nLow;
        // loudness
        private final Loudness loudness = new Loudness(FIT_RATE);

        /** Mono samples at FIT_RATE, in order. */
        public void add(float[] x, int off, int len) {
            if (finished) throw new IllegalStateException("finished");
            for (int i = off; i < off + len; i++) {
                float v = x[i];
                ring[(int) (count & MASK)] = v;
                winSum += (double) v * v;
                count++;
                if (count == winEnd) {
                    if (nRms == rms.length) rms = Arrays.copyOf(rms, nRms * 2);
                    rms[nRms++] = (float) Math.sqrt(winSum / (winEnd - winStart));
                    winSum = 0;
                    winStart = winEnd;
                    winEnd = Math.round((nRms + 1) * ENV_WIN);
                }
                loudness.add(v);
                while (lowLast(nLow) < count) emitLow();
            }
        }

        /** The end of the audio: the stream's tail is read with silence after the last sample. */
        public void finish() {
            if (finished) return;
            finished = true;
            while (lowFirst(nLow) <= count - 1) emitLow();
        }

        private static long lowQ(long n) {
            return n * LOW_NUM / LOW_DEN;
        }

        private static long lowFirst(long n) {
            return lowQ(n) + LOW_FIRST[(int) (n * LOW_NUM % LOW_DEN)];
        }

        private static long lowLast(long n) {
            return lowQ(n) + W;
        }

        private void emitLow() {
            long n = nLow;
            int p = (int) (n * LOW_NUM % LOW_DEN);
            long k0 = lowQ(n) + LOW_FIRST[p];
            double[] taps = LOW_TAPS[p];
            double s = 0;
            for (int i = 0; i < taps.length; i++) {
                long k = k0 + i;
                if (k < 0 || k >= count) continue;   // outside the file: silence
                s += ring[(int) (k & MASK)] * taps[i];
            }
            if (nLow == low.length) low = Arrays.copyOf(low, nLow * 2);
            low[nLow++] = (float) s;
        }

        public double durationSec() {
            return (double) count / FIT_RATE;
        }

        /** EBU R128 integrated loudness of everything added, or -Infinity. */
        public double lufs() {
            return loudness.integrated();
        }

        float[] rms() {
            return Arrays.copyOf(rms, nRms);
        }

        /** The 4 kHz stream from index start, count values; silence outside. */
        float[] low(long start, int n) {
            float[] out = new float[Math.max(0, n)];
            for (int i = 0; i < out.length; i++) {
                long k = start + i;
                if (k >= 0 && k < nLow) out[i] = low[(int) k];
            }
            return out;
        }

        /** A whole decoded song at once (tests, short files). */
        public static Side of(float[] x) {
            Side s = new Side();
            for (int i = 0; i < x.length; i += 8192) s.add(x, i, Math.min(8192, x.length - i));
            s.finish();
            return s;
        }
    }

    // ---- correlation ----

    /** Pearson of y[0..n) against a[lag..lag+n) over the part inside a; NaN when under minOverlap of y is covered. */
    static double pearsonAt(float[] y, float[] a, int lag, double minOverlap) {
        int i0 = Math.max(0, -lag), i1 = Math.min(y.length, a.length - lag);
        int n = i1 - i0;
        if (n < Math.max(2, minOverlap * y.length)) return Double.NaN;
        double sy = 0, sa = 0, syy = 0, saa = 0, sya = 0;
        for (int i = i0; i < i1; i++) {
            double p = y[i], q = a[i + lag];
            sy += p;
            sa += q;
            syy += p * p;
            saa += q * q;
            sya += p * q;
        }
        double cov = sya - (sy * sa) / n, vy = syy - (sy * sy) / n, va = saa - (sa * sa) / n;
        return vy > 1e-12 && va > 1e-12 ? cov / Math.sqrt(vy * va) : 0;
    }

    static final class Best {
        int lag;
        double score;
        double at;
    }

    /** The best lag in [lo, hi], refined parabolically on its neighbours; null when no lag has overlap. */
    static Best bestLag(float[] y, float[] a, int lo, int hi, double minOverlap) {
        if (hi < lo) return null;
        double[] scores = new double[hi - lo + 1];
        Best best = null;
        for (int lag = lo; lag <= hi; lag++) {
            double c = pearsonAt(y, a, lag, minOverlap);
            scores[lag - lo] = c;
            if (Double.isNaN(c)) continue;
            if (best == null || c > best.score) {
                if (best == null) best = new Best();
                best.lag = lag;
                best.score = c;
            }
        }
        if (best == null) return null;
        double l = best.lag - 1 >= lo ? scores[best.lag - 1 - lo] : Double.NaN;
        double r = best.lag + 1 <= hi ? scores[best.lag + 1 - lo] : Double.NaN;
        double frac = 0;
        if (!Double.isNaN(l) && !Double.isNaN(r)) {
            double d = l - 2 * best.score + r;
            if (d < 0) frac = Math.max(-0.5, Math.min(0.5, (l - r) / (2 * d)));
        }
        best.at = best.lag + frac;
        return best;
    }

    static final class Lag {
        final double offsetSec, score;

        Lag(double offsetSec, double score) {
            this.offsetSec = offsetSec;
            this.score = score;
        }
    }

    static float[] logEnv(float[] rms) {
        float[] e = new float[rms.length];
        for (int i = 0; i < rms.length; i++) e[i] = (float) Math.log1p(rms[i] * 100.0);
        return e;
    }

    private static float[] slice(float[] x, long from, long to) {
        int a = (int) Math.max(0, Math.min(x.length, from)), b = (int) Math.max(0, Math.min(x.length, to));
        return Arrays.copyOfRange(x, a, Math.max(a, b));
    }

    /** Coarse: YouTube's [startSec, startSec + spanSec) against the addon's envelope, lags around aroundSec within ±lagSec. */
    static Lag coarse(float[] ytEnv, float[] adEnv, double startSec, double spanSec, double aroundSec, double lagSec) {
        int i0 = (int) Math.round(startSec / ENV_WIN_SEC);
        float[] y = slice(ytEnv, i0, Math.min(ytEnv.length, i0 + Math.round(spanSec / ENV_WIN_SEC)));
        int c = (int) Math.round(aroundSec / ENV_WIN_SEC), L = (int) Math.round(lagSec / ENV_WIN_SEC);
        Best b = bestLag(y, adEnv, i0 + c - L, i0 + c + L, MIN_OVERLAP);   // (a's index = y's index + i0 + lag)
        return b == null ? null : new Lag((b.lag - i0) * ENV_WIN_SEC, b.score);
    }

    /** Fine: both sides' 4 kHz streams, ±20 ms around aroundSec. */
    static Lag fine(Side yt, Side ad, double startSec, double spanSec, double aroundSec) {
        int M = (int) Math.round(FINE_LAG_SEC * FINE_RATE), PAD = M + 4;
        int N = (int) Math.round(spanSec * FINE_RATE);
        float[] y = yt.low(Math.round(startSec * FINE_RATE), N);
        // the addon on the 4 kHz grid from YouTube's start + the coarse offset - PAD samples; the
        // grid point nearest that start is read and its fraction added back to the result
        double aStart = (startSec + aroundSec) * FINE_RATE - PAD;
        long aAt = Math.round(aStart);
        float[] a = ad.low(aAt, N + 2 * PAD);
        Best b = bestLag(y, a, PAD - M, PAD + M, 1);
        return b == null ? null : new Lag(aroundSec + (b.at + (aAt - aStart) - PAD) / FINE_RATE, b.score);
    }

    /** The fit's answer: offsetSec and its scores, or none with why ("no match", "different edit", "length", "silent"). */
    public static final class Result {
        public String none;
        public Double offsetSec;
        public Double score;
        public Double coarseScore;
        public Double fineScore;
        public Double checkSec;
        public Double checkScore;
        public Double checkOffsetSec;
        public Double extraSec;

        @Override
        public String toString() {
            return "{none=" + none + ", offsetSec=" + offsetSec + ", score=" + score + ", coarseScore=" + coarseScore
                    + ", fineScore=" + fineScore + ", checkSec=" + checkSec + ", checkScore=" + checkScore
                    + ", checkOffsetSec=" + checkOffsetSec + ", extraSec=" + extraSec + "}";
        }
    }

    private static Result none(String why) {
        Result r = new Result();
        r.none = why;
        return r;
    }

    /** offset-map.md, Fit: coarse, fine, the check near the end, the length. slackSec: the user's length slack (default 5). */
    public static Result fit(Side yt, Side ad, double slackSec) {
        yt.finish();
        ad.finish();
        final double ytDur = yt.durationSec(), adDur = ad.durationSec();
        float[] ytRms = yt.rms(), adRms = ad.rms();
        float[] ytEnv = logEnv(ytRms), adEnv = logEnv(adRms);
        // start: 0, or the first whole second holding a non-silent window
        int first = -1;
        for (int i = 0; i < ytRms.length && first < 0; i++) if (ytRms[i] >= SILENT_RMS) first = i;
        boolean adSound = false;
        for (float r : adRms) if (r >= SILENT_RMS) adSound = true;
        if (first < 0 || !adSound) return none("silent");
        double start = Math.floor(first * ENV_WIN_SEC);
        double span = Math.min(COARSE_SEC, ytDur - start);
        float[] read = slice(ytRms, Math.round(start / ENV_WIN_SEC), Math.round((start + span) / ENV_WIN_SEC));
        int loud = 0;
        for (float r : read) if (r >= SILENT_RMS) loud++;
        if (loud < 0.5 * read.length) return none("silent");

        Lag c = coarse(ytEnv, adEnv, start, span, 0, COARSE_LAG_SEC);
        if (c == null || c.score < MIN_SCORE) {
            Result r = none("no match");
            r.score = c == null ? null : c.score;
            return r;
        }
        double fLen = Math.min(FINE_SEC, ytDur - 0.2);
        Lag f = fine(yt, ad, inside(start, fLen, c.offsetSec, ytDur, adDur), fLen, c.offsetSec);
        // the waveforms must agree too: songs on the same beat grid can share an envelope
        if (f == null || f.score < MIN_SCORE) {
            Result r = none("no match");
            r.score = c.score;
            r.fineScore = f == null ? null : f.score;
            return r;
        }

        // the check, near the end (a short song: its middle 20 s)
        double checkSec = ytDur < SHORT_SONG ? (ytDur - FINE_SEC) / 2 : ytDur - CHECK_BEFORE_END - FINE_SEC;
        checkSec = inside(Math.max(0, checkSec), fLen, f.offsetSec, ytDur, adDur);
        Lag cc = coarse(ytEnv, adEnv, checkSec, fLen, f.offsetSec, CHECK_LAG_SEC);
        Lag cf = cc != null && cc.score >= MIN_SCORE ? fine(yt, ad, inside(checkSec, fLen, cc.offsetSec, ytDur, adDur), fLen, cc.offsetSec) : null;
        if (cf == null || Math.abs(cf.offsetSec - f.offsetSec) > CHECK_AGREE_SEC) {
            Result r = none("different edit");
            r.offsetSec = f.offsetSec;
            r.checkOffsetSec = cf != null ? Double.valueOf(cf.offsetSec) : cc != null ? Double.valueOf(cc.offsetSec) : null;
            r.checkScore = cc == null ? null : cc.score;
            return r;
        }
        if (Math.abs(adDur - f.offsetSec - ytDur) > slackSec) {
            Result r = none("length");
            r.offsetSec = f.offsetSec;
            r.extraSec = adDur - f.offsetSec - ytDur;
            return r;
        }
        Result r = new Result();
        r.offsetSec = f.offsetSec;
        r.score = f.score;
        r.coarseScore = c.score;
        r.checkSec = checkSec;
        r.checkScore = cf.score;
        return r;
    }

    /** The streamed copy's window: at least this long to fit on. */
    public static final double WINDOW_SEC = 12, MIN_WINDOW_FINE_SEC = 4;

    /**
     * Ours (the phone, streaming like BitChord): the addon copy is known only over
     * [winSec, winSec + lenSec) of its own time, the window the audition buffered at YouTube's
     * position (ad holds silence elsewhere). The same coarse (±15 s on the envelope) and fine (±20 ms
     * at 4 kHz) stages and 0.8 bars as {@link #fit}, on YouTube's span 1 s inside that window. On the
     * 9 pair songs it found the full-song offset within 0.01 ms in 37 of 37 windows and refused both
     * other recordings in every window. No end check and no length rule: the player's length watch
     * stands in for them.
     */
    public static Result window(Side yt, Side ad, double winSec, double lenSec) {
        yt.finish();
        ad.finish();
        final double ytDur = yt.durationSec();
        float[] ytRms = yt.rms(), adRms = ad.rms();
        double start = winSec + 1, span = lenSec - 2;
        if (span < MIN_WINDOW_FINE_SEC || ytDur <= 0) return none("no match");
        float[] read = slice(adRms, Math.round(winSec / ENV_WIN_SEC), Math.round((winSec + lenSec) / ENV_WIN_SEC));
        int loud = 0;
        for (float r : read) if (r >= SILENT_RMS) loud++;
        if (read.length == 0 || loud < 0.5 * read.length) return none("silent");
        // the template (addon time [winSec + 1, winSec + lenSec - 1)) slid over YouTube's copy, as the
        // extension's fitWindow (offset-map.md, Window check): every sample compared is known whatever
        // the offset. coarse() and fine() slide their second side under the first, so they return
        // YouTube time - addon time, the negative of offsetSec.
        Lag c = coarse(logEnv(adRms), logEnv(ytRms), start, span, 0, COARSE_LAG_SEC);
        if (c == null || c.score < MIN_SCORE) {
            Result r = none("no match");
            r.score = c == null ? null : c.score;
            return r;
        }
        Lag f = fine(ad, yt, start, span, c.offsetSec);
        if (f == null || f.score < MIN_SCORE) {
            Result r = none("no match");
            r.score = c.score;
            r.fineScore = f == null ? null : f.score;
            return r;
        }
        Result r = new Result();
        r.offsetSec = -f.offsetSec + 0.0;
        r.score = f.score;
        r.coarseScore = c.score;
        r.checkSec = winSec;
        return r;
    }

    static final double GUIDE_STEP_SEC = 0.03, GUIDE_SPREAD_SEC = 0.005;
    static final int GUIDE_WINDOWS = 4, GUIDE_STEPS = 3;

    /**
     * Ours (the phone's Dolby Atmos): a file that is another mix of the song (its envelope and waveform
     * differ from YouTube's, so {@link #fit} finds no match) placed by a stereo file of the same release
     * that did fit: priorSec is that file's offset. The fine fit (the 1 kHz waveform: the drums and
     * the voice keep their timing in another mix) scans ±0.11 s around it in 4 windows across the song;
     * where they agree within 5 ms their median is taken, otherwise priorSec. (The envelope's coarse
     * fit is not used: across mixes it lands tens of ms off, outside the fine fit's ±20 ms.) Refused
     * only for its length. score is the windows' mean fine score (for the log), not a gate; checkSec
     * holds their spread.
     */
    public static Result guided(Side yt, Side ad, double priorSec, double slackSec) {
        yt.finish();
        ad.finish();
        final double ytDur = yt.durationSec(), adDur = ad.durationSec();
        float[] ytRms = yt.rms();
        int first = -1;
        for (int i = 0; i < ytRms.length && first < 0; i++) if (ytRms[i] >= SILENT_RMS) first = i;
        double start = first < 0 ? 0 : Math.floor(first * ENV_WIN_SEC);
        double fLen = Math.min(FINE_SEC, ytDur - 0.2);
        Result r = new Result();
        r.offsetSec = priorSec;
        double[] at = new double[GUIDE_WINDOWS];
        int n = 0;
        double scores = 0;
        for (int w = 0; w < GUIDE_WINDOWS; w++) {
            double s = start + (ytDur - start - fLen) * (w + 0.5) / GUIDE_WINDOWS;
            Lag best = null;
            // 7 centres 30 ms apart, each looking ±20 ms: ±0.11 s, a whole number of steps so
            // rounding never adds or drops the last one
            for (int k = -GUIDE_STEPS; k <= GUIDE_STEPS; k++) {
                double c = priorSec + k * GUIDE_STEP_SEC;
                Lag f = fine(yt, ad, inside(s, fLen, c, ytDur, adDur), fLen, c);
                if (f != null && (best == null || f.score > best.score)) best = f;
            }
            if (best == null) continue;
            at[n++] = best.offsetSec;
            scores += best.score;
        }
        if (n > 0) {
            double[] sorted = Arrays.copyOf(at, n);
            Arrays.sort(sorted);
            double median = n % 2 == 1 ? sorted[n / 2] : (sorted[n / 2 - 1] + sorted[n / 2]) / 2;
            r.fineScore = scores / n;
            r.checkOffsetSec = median;   // where they landed, taken or not
            r.checkSec = sorted[n - 1] - sorted[0];
            if (n >= 3 && r.checkSec <= GUIDE_SPREAD_SEC) r.offsetSec = median;
        }
        r.score = r.fineScore;
        if (Math.abs(adDur - r.offsetSec - ytDur) > slackSec) {
            r.none = "length";
            r.extraSec = adDur - r.offsetSec - ytDur;
        }
        return r;
    }

    /** A span of len seconds from s, moved inside both files (YouTube's, and the addon's read at offset off). */
    private static double inside(double s, double len, double off, double ytDur, double adDur) {
        double lo = Math.max(Math.max(s, -off + 0.05), 0.05);
        double hi = Math.min(ytDur, adDur - off) - len - 0.05;
        return lo <= hi ? lo : Math.max(0.05, hi);
    }

    // ---- level: BS.1770-4 K-weighting at any rate (libebur128's design) ----

    /** EBU R128 integrated loudness, fed sample by sample: 400 ms blocks every 100 ms, gates -70 LUFS and -10 LU. */
    public static final class Loudness {
        private final double[] shelf, high;
        private double sx1, sx2, sy1, sy2, hx1, hx2, hy1, hy2;
        private final int blk, hop;
        private final float[] ring;
        private long count;
        private double[] z = new double[256];
        private int nz;

        public Loudness(double rate) {
            double f0 = 1681.974450955533, G = 3.999843853973347, Q = 0.7071752369554196;
            double K = Math.tan((Math.PI * f0) / rate), Vh = Math.pow(10, G / 20), Vb = Math.pow(Vh, 0.4996667741545416);
            double a0 = 1 + K / Q + K * K;
            shelf = new double[]{(Vh + (Vb * K) / Q + K * K) / a0, (2 * (K * K - Vh)) / a0, (Vh - (Vb * K) / Q + K * K) / a0,
                    1, (2 * (K * K - 1)) / a0, (1 - K / Q + K * K) / a0};
            double hf0 = 38.13547087602444, hQ = 0.5003270373238773;
            double hK = Math.tan((Math.PI * hf0) / rate), d = 1 + hK / hQ + hK * hK;
            high = new double[]{1, -2, 1, 1, (2 * (hK * hK - 1)) / d, (1 - hK / hQ + hK * hK) / d};
            blk = (int) Math.round(0.4 * rate);
            hop = (int) Math.round(0.1 * rate);
            ring = new float[blk];
        }

        public void add(float v) {
            double[] s = shelf;
            double y = (s[0] * v + s[1] * sx1 + s[2] * sx2 - s[4] * sy1 - s[5] * sy2) / s[3];
            sx2 = sx1;
            sx1 = v;
            sy2 = sy1;
            sy1 = y;
            float o = (float) y;
            double[] h = high;
            double k = (h[0] * o + h[1] * hx1 + h[2] * hx2 - h[4] * hy1 - h[5] * hy2) / h[3];
            hx2 = hx1;
            hx1 = o;
            hy2 = hy1;
            hy1 = k;
            ring[(int) (count % blk)] = (float) k;
            count++;
            if (count >= blk && (count - blk) % hop == 0) {
                double e = 0;
                for (long i = count - blk; i < count; i++) {
                    double q = ring[(int) (i % blk)];
                    e += q * q;
                }
                if (nz == z.length) z = Arrays.copyOf(z, nz * 2);
                z[nz++] = e / blk;
            }
        }

        public void add(float[] x, int off, int len) {
            for (int i = off; i < off + len; i++) add(x[i]);
        }

        private static double L(double v) {
            return -0.691 + 10 * Math.log10(v);
        }

        public double integrated() {
            double sum = 0;
            int n = 0;
            for (int i = 0; i < nz; i++) {
                if (L(z[i]) > -70) {
                    sum += z[i];
                    n++;
                }
            }
            if (n == 0) return Double.NEGATIVE_INFINITY;
            double rel = L(sum / n) - 10;
            double gs = 0;
            int gn = 0;
            for (int i = 0; i < nz; i++) {
                if (L(z[i]) > -70 && L(z[i]) > rel) {
                    gs += z[i];
                    gn++;
                }
            }
            if (gn == 0) return Double.NEGATIVE_INFINITY;   // only non-finite blocks (a damaged decode): not NaN
            return L(gs / gn);
        }
    }

    public static double integratedLufs(float[] mono, double rate) {
        Loudness l = new Loudness(rate);
        l.add(mono, 0, mono.length);
        return l.integrated();
    }

    // ---- true peak: 4x oversampled (Hann-windowed sinc, 8 input samples each side), per channel ----

    private static final int TP_H = 8;
    private static final double[][] TP_TAPS = new double[4][];

    static {
        for (int p = 1; p < 4; p++) {
            double[] taps = new double[2 * TP_H];
            for (int m = -TP_H + 1; m <= TP_H; m++) {   // k = j + m, t = j + p / 4
                double u = p / 4.0 - m, a = Math.PI * u;
                taps[m + TP_H - 1] = (Math.sin(a) / a) * (0.5 + 0.5 * Math.cos(a / TP_H));
            }
            TP_TAPS[p] = taps;
        }
    }

    /**
     * The file's true peak, fed with each channel as it plays (its own rate). Oversampled values
     * are computed only around samples at or over -10.5 dBFS (the lowest level a +6 dB boost
     * could need: -1 dBTP - 6 dB - 3.5 dB) and kept by that level in 0.01 dB steps, so
     * {@link #truePeakDb(double)} answers for any threshold from there up, as offset-fit.js's
     * truePeakDb(channels, rate, aboveDb) does (a 0.01 dB step may include a few more samples).
     */
    public static final class PeakMeter {
        static final double FLOOR_DB = CEILING_DBTP - MAX_BOOST_DB - 3.5;
        private static final double STEP_DB = 0.01;
        private static final int BINS = (int) Math.round((24 - FLOOR_DB) / STEP_DB) + 1;
        private final double floorLin = Math.pow(10, FLOOR_DB / 20);
        private final double[] binPeak = new double[BINS];
        private double samplePeak;
        private final Channel[] channels;

        private final class Channel {
            final float[] ring = new float[64];
            long count, next;   // next: the next j to look at

            void add(float v) {
                ring[(int) (count & 63)] = v;
                count++;
                double a = Math.abs(v);
                if (a > samplePeak) samplePeak = a;
                while (next + TP_H < count) look(next++);
            }

            void finish() {
                while (next + 1 < count) look(next++);
            }

            float at(long k) {
                return k < 0 || k >= count ? 0 : ring[(int) (k & 63)];
            }

            // j between samples j and j + 1: looked at when either is over the floor
            void look(long j) {
                double trig = Math.max(Math.abs(at(j)), Math.abs(at(j + 1)));
                if (trig < floorLin) return;
                double over = 0;
                for (int p = 1; p < 4; p++) {
                    double[] taps = TP_TAPS[p];
                    double s = 0;
                    for (int i = 0; i < taps.length; i++) s += at(j - TP_H + 1 + i) * taps[i];
                    over = Math.max(over, Math.abs(s));
                }
                int bin = (int) Math.min(BINS - 1, Math.max(0, Math.floor((20 * Math.log10(trig) - FLOOR_DB) / STEP_DB)));
                if (over > binPeak[bin]) binPeak[bin] = over;
            }
        }

        public PeakMeter(int channelCount) {
            channels = new Channel[channelCount];
            for (int c = 0; c < channelCount; c++) channels[c] = new Channel();
        }

        public void add(int channel, float[] x, int off, int len) {
            Channel c = channels[channel];
            for (int i = off; i < off + len; i++) c.add(x[i]);
        }

        public void finish() {
            for (Channel c : channels) c.finish();
        }

        /** The peak in dBTP, oversampled around samples at or over aboveDb dBFS (never below -10.5). */
        public double truePeakDb(double aboveDb) {
            finish();
            double peak = samplePeak;
            int from = (int) Math.max(0, Math.floor((aboveDb - FLOOR_DB) / STEP_DB));
            for (int b = from; b < BINS; b++) peak = Math.max(peak, binPeak[b]);
            return peak > 0 ? 20 * Math.log10(peak) : Double.NEGATIVE_INFINITY;
        }

        public static PeakMeter of(float[]... channels) {
            PeakMeter m = new PeakMeter(channels.length);
            for (int c = 0; c < channels.length; c++) m.add(c, channels[c], 0, channels[c].length);
            m.finish();
            return m;
        }
    }

    /** The deck's source gain. wantDb is NaN when a loudness is unknown; truePeakDb NaN when not measured. */
    public static final class Gain {
        public double gainDb;
        public double wantDb = Double.NaN;
        /** null, "boost" (capped at +6 dB) or "peak" (held at -1 dBTP). */
        public String capped;
        public double truePeakDb = Double.NaN;

        @Override
        public String toString() {
            return "{gainDb=" + gainDb + ", wantDb=" + wantDb + ", capped=" + capped + ", truePeakDb=" + truePeakDb + "}";
        }
    }

    /**
     * YouTube's level minus the file's over the same seconds of the song (the file's [fromSec,
     * untilSec), YouTube's shifted by the offset: fileTime = youtubeTime + offsetSec), from both 10 ms
     * envelopes: the gain that brings the file to YouTube's copy as it is heard. Windows where either
     * is under -60 dBFS are left out; NaN under 2 s of sound in both.
     */
    /** The gain played for a {@link #windowGainDb} reading (offset-map.md, Level [phone only]): 0 when not known, a boost at most MAX_BOOST_DB, cuts unlimited. */
    public static double windowLevelDb(double measuredDb) {
        return Double.isNaN(measuredDb) ? 0 : Math.min(measuredDb, MAX_BOOST_DB);
    }

    public static double windowGainDb(float[] ytRms, float[] fileRms, double offsetSec, double fromSec, double untilSec) {
        if (ytRms == null || fileRms == null) return Double.NaN;
        double yt = 0, file = 0;
        int n = 0;
        int i0 = (int) Math.max(0, Math.ceil(fromSec / ENV_WIN_SEC)), i1 = (int) Math.min(fileRms.length, Math.floor(untilSec / ENV_WIN_SEC));
        for (int i = i0; i < i1; i++) {
            int j = (int) Math.round(i - offsetSec / ENV_WIN_SEC);
            if (j < 0 || j >= ytRms.length) continue;
            float a = ytRms[j], b = fileRms[i];
            if (a < 1e-3f || b < 1e-3f) continue;
            yt += (double) a * a;
            file += (double) b * b;
            n++;
        }
        return n * ENV_WIN_SEC < 2 ? Double.NaN : 10 * Math.log10(yt / file);
    }

    /**
     * The phone's level (offset-map.md, Level): YouTube's loudnessDb as its player normalises with
     * it, a cut of that many dB when positive and nothing otherwise; NaN (not known) is nothing.
     */
    public static double loudnessGainDb(double loudnessDb) {
        return Double.isNaN(loudnessDb) || loudnessDb <= 0 ? 0 : -loudnessDb;
    }

    /**
     * YouTube's loudness minus the file's: a boost capped at +6 dB and kept under -1 dBTP (the
     * true peak read only when boosting), cuts unlimited.
     */
    public static Gain sourceGainDb(double ytLufs, double addonLufs, PeakMeter addonPeaks) {
        Gain g = new Gain();
        if (Double.isNaN(ytLufs) || Double.isInfinite(ytLufs) || Double.isNaN(addonLufs) || Double.isInfinite(addonLufs)) {
            g.gainDb = 0;
            return g;
        }
        double want = ytLufs - addonLufs;
        g.wantDb = want;
        if (want <= 0) {
            g.gainDb = want;
            return g;
        }
        double gain = Math.min(want, MAX_BOOST_DB);
        g.capped = want > MAX_BOOST_DB ? "boost" : null;
        double tp = addonPeaks.truePeakDb(CEILING_DBTP - gain - 3.5);
        if (tp + gain > CEILING_DBTP) {
            gain = Math.max(0, CEILING_DBTP - tp);
            g.capped = "peak";
        }
        g.gainDb = gain;
        g.truePeakDb = tp;
        return g;
    }
}
