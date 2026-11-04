package app.tikkamasalla.stremio.oneahead;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Audio alignment at 4 kHz with bounded memory. top_lags is computed by uniformly partitioned cross-correlation, so the
 * largest working array is one 2^17 block spectrum instead of a 2^22 FFT; lag energies slide instead of using prefix arrays;
 * stretches keep per-hop sums only. Lag convention: a[m] ~ b[m - k].
 */
public final class Correlator {
    public static final int WIN = 400, HOP = 100;
    static final int GAP = 23;                       // 0.6 s of 0.025 s steps, truncated
    static final double THR = 0.5, MIN_STRETCH = 4.0;
    static final int MIN_OVERLAP = 20 * Track.SR;
    static final int SEP = 2 * Track.SR;
    public static final int BLOCK = 1 << 16;         // 16.384 s
    private static final int PEAK_BIN = 100;
    private static final int HIST = 10000;

    private final Rfft fft = new Rfft(2 * BLOCK);
    private final float[] cur = new float[2 * BLOCK];
    private final float[] prev = new float[2 * BLOCK];

    /** Block spectra of a window. A null block is one the mask left out (a sparse probe). */
    public static final class Spec {
        final Track t;
        final float[][] blocks;
        final boolean[] mask;

        Spec(Track t, float[][] blocks, boolean[] mask) {
            this.t = t;
            this.blocks = blocks;
            this.mask = mask;
        }
    }

    public static final class Lag {
        public final int lag;
        public final double peak, noise;

        Lag(int lag, double peak, double noise) {
            this.lag = lag;
            this.peak = peak;
            this.noise = noise;
        }

        /** The same peak seen from the other window. */
        public Lag mirror() {
            return new Lag(-lag, peak, noise);
        }
    }

    /** A run where the two windows are the same recording at one lag; times in the first window's file clock. */
    public static final class Stretch {
        public double start, end, ncc, density;
        public boolean clipStart, clipEnd;
        public int lag, windows;

        public double len() {
            return end - start;
        }
    }

    public static int blocksOf(int n) {
        return (n + BLOCK - 1) / BLOCK;
    }

    /** Which blocks a probe looks at: every {@code every}-th one, starting at the first. */
    public static boolean[] probeMask(int n, int every) {
        boolean[] m = new boolean[blocksOf(n)];
        for (int i = 0; i < m.length; i++) m[i] = i % every == 0;
        return m;
    }

    public Spec spec(Track t, boolean[] mask) {
        int nb = blocksOf(t.n);
        float[][] out = new float[nb][];
        for (int p = 0; p < nb; p++) {
            if (mask != null && !mask[p]) continue;
            float[] z = new float[2 * BLOCK];
            int base = p * BLOCK, m = Math.min(BLOCK, t.n - base);
            for (int i = 0; i < m; i++) z[i] = t.at(base + i);
            fft.forward(z);
            out[p] = z;
        }
        return new Spec(t, out, mask);
    }

    private static float atm(Spec s, int i) {
        if (s.mask != null && !s.mask[i / BLOCK]) return 0f;
        return s.t.at(i);
    }

    /** Lag candidates, best first: peaks of the overlap-normalised correlation, at least 2 s apart. */
    public Lag[] topLags(Spec sa, Spec sb, int k) {
        return topLags(sa, sb, k, MIN_OVERLAP);
    }

    public Lag[] topLags(Spec sa, Spec sb, int k, int minOverlap) {
        int na = sa.t.n, nb = sb.t.n;
        int kMin = -(nb - minOverlap), kMax = na - minOverlap;
        if (kMax < kMin) return new Lag[0];
        int P = sa.blocks.length, Q = sb.blocks.length;
        int nk = kMax - kMin + 1;
        int nbins = nk / PEAK_BIN + 1;
        float[] binV = new float[nbins];
        int[] binK = new int[nbins];
        Arrays.fill(binV, -2f);
        int[] hist = new int[HIST + 1];

        // sliding overlap energies, in double to keep the running sums exact
        int lo = Math.max(0, kMin), hi = Math.min(na, nb + kMin);
        int aLo = lo, aHi = lo, bLo = lo - kMin, bHi = lo - kMin;
        double ex = 0, ey = 0;

        boolean havePrev = false;
        for (int d = -(Q - 1) - 1; d <= P - 1; d++) {
            // C_{d+1}: the sum of all block pairs with p - q = d + 1
            int dn = d + 1;
            boolean any = false;
            if (dn <= P - 1) {
                Arrays.fill(cur, 0f);
                for (int q = 0; q < Q; q++) {
                    int p = q + dn;
                    if (p < 0 || p >= P || sa.blocks[p] == null || sb.blocks[q] == null) continue;
                    any = true;
                    float[] A = sa.blocks[p], B = sb.blocks[q];
                    cur[0] += A[0] * B[0];
                    cur[1] += A[1] * B[1];
                    for (int i = 2; i < 2 * BLOCK; i += 2) {
                        float ar = A[i], ai = A[i + 1], br = B[i], bi = B[i + 1];
                        cur[i] += ar * br + ai * bi;
                        cur[i + 1] += ai * br - ar * bi;
                    }
                }
                if (any) fft.inverse(cur);
            }
            // emit c[dL + s], s in [0, L): positive part of C_d (prev) plus negative part of C_{d+1} (cur)
            if (d >= -(Q - 1) - 1) {
                long base = (long) d * BLOCK;
                for (int s = 0; s < BLOCK; s++) {
                    long kl = base + s;
                    if (kl < kMin) continue;
                    if (kl > kMax) break;
                    int kk = (int) kl;
                    int l2 = Math.max(0, kk), h2 = Math.min(na, nb + kk);
                    while (aHi < h2) { float v = atm(sa, aHi++); ex += (double) v * v; }
                    while (aLo < l2) { float v = atm(sa, aLo++); ex -= (double) v * v; }
                    int bl = l2 - kk, bh = h2 - kk;   // on b the overlap grows downward for k < 0, then shrinks from the top
                    while (bLo > bl) { float v = atm(sb, --bLo); ey += (double) v * v; }
                    while (bHi < bh) { float v = atm(sb, bHi++); ey += (double) v * v; }
                    while (bHi > bh) { float v = atm(sb, --bHi); ey -= (double) v * v; }
                    while (bLo < bl) { float v = atm(sb, bLo++); ey -= (double) v * v; }
                    double c = (havePrev ? prev[s] : 0f) + (any ? cur[BLOCK + s] : 0f);
                    double ncc = c / Math.sqrt(Math.max(ex, 0) * Math.max(ey, 0) + 1e-9);
                    int hb = (int) (Math.abs(ncc) * HIST);
                    hist[hb > HIST ? HIST : hb]++;
                    int bin = (kk - kMin) / PEAK_BIN;
                    if (ncc > binV[bin]) {
                        binV[bin] = (float) ncc;
                        binK[bin] = kk;
                    }
                }
            }
            havePrev = any;
            if (any) System.arraycopy(cur, 0, prev, 0, BLOCK);
        }
        // median of |ncc| from the histogram: within 1e-4 of the exact median
        long seen = 0, half = (nk + 1) / 2;
        double noise = 0;
        for (int i = 0; i <= HIST; i++) {
            seen += hist[i];
            if (seen >= half) {
                noise = (i + 0.5) / HIST;
                break;
            }
        }
        double bar = Math.max(0.012, 8.0 * noise);
        List<Lag> res = new ArrayList<>();
        for (int t = 0; t < k; t++) {
            int best = 0;
            for (int i = 1; i < nbins; i++) if (binV[i] > binV[best]) best = i;
            if (binV[best] < bar) break;
            int kk = binK[best];
            res.add(new Lag(kk, binV[best], noise));
            for (int i = 0; i < nbins; i++) if (binV[i] > -2f && Math.abs(binK[i] - kk) <= SEP) binV[i] = -2f;
        }
        return res.toArray(new Lag[0]);
    }

    /** Every run of 0.1 s windows at NCC >= 0.5 at lag k, gaps up to 0.6 s bridged, at least 4 s long. */
    public static List<Stretch> stretches(Track x, Track y, int k) {
        List<Stretch> res = new ArrayList<>();
        int lo = Math.max(0, k), hi = Math.min(x.n, y.n + k), n = hi - lo;
        if (n < 2 * WIN) return res;
        int m = (n - WIN + HOP - 1) / HOP;
        int chunks = m + WIN / HOP;
        double[] cp = new double[chunks], cx = new double[chunks], cy = new double[chunks];
        for (int c = 0, i = 0; c < chunks; c++) {
            double p = 0, a = 0, b = 0;
            for (int e = Math.min(n, i + HOP); i < e; i++) {
                double xs = x.at(lo + i), ys = y.at(lo - k + i);
                p += xs * ys;
                a += xs * xs;
                b += ys * ys;
            }
            cp[c] = p; cx[c] = a; cy[c] = b;
        }
        double[] ncc = new double[m], ex = new double[m], ey = new double[m];
        int w = WIN / HOP;
        int np = 0;
        for (int i = 0; i < m; i++) {
            double p = 0, a = 0, b = 0;
            for (int j = i; j < i + w; j++) { p += cp[j]; a += cx[j]; b += cy[j]; }
            ncc[i] = p / Math.sqrt(a * b + 1e-12);
            ex[i] = a;
            ey[i] = b;
            if (a > 0) np++;
        }
        double[] pos = new double[np];
        for (int i = 0, j = 0; i < m; i++) if (ex[i] > 0) pos[j++] = ex[i];
        Arrays.sort(pos);
        double floor = np == 0 ? 0 : 1e-4 * (np % 2 == 1 ? pos[np / 2] : 0.5 * (pos[np / 2 - 1] + pos[np / 2]));
        boolean[] match = new boolean[m];
        for (int i = 0; i < m; i++) {
            boolean live = ex[i] > floor && ey[i] > floor;
            if (!live) ncc[i] = -1.0;
            match[i] = ncc[i] >= THR;
        }
        double h = HOP / (double) Track.SR;
        double c0 = (lo + WIN / 2.0) / Track.SR;
        int i = 0;
        while (i < m) {
            if (!match[i]) { i++; continue; }
            int j = i, last = i, cnt = 0;
            while (j < m && j - last <= GAP) {
                if (match[j]) { last = j; cnt++; }
                j++;
            }
            double s, e;
            boolean cs = i == 0, ce = last == m - 1;
            if (cs) s = c0;
            else {
                double n0 = ncc[i - 1], n1 = ncc[i];
                double f = n1 != n0 ? (THR - n0) / (n1 - n0) : 0.0;
                s = c0 + (i - 1) * h + f * h;
            }
            if (ce) e = c0 + last * h;
            else {
                double n0 = ncc[last], n1 = ncc[last + 1];
                double f = n0 != n1 ? (n0 - THR) / (n0 - n1) : 0.0;
                e = c0 + last * h + f * h;
            }
            if (e - s >= MIN_STRETCH) {
                int i0 = Math.max((int) Math.round(s * Track.SR) - lo, 0), i1 = Math.min((int) Math.round(e * Track.SR) - lo, n);
                double p = 0, a = 0, b = 0;
                for (int t = i0; t < i1; t++) {
                    double xs = x.at(lo + t), ys = y.at(lo - k + t);
                    p += xs * ys;
                    a += xs * xs;
                    b += ys * ys;
                }
                Stretch st = new Stretch();
                st.start = s + x.offset;
                st.end = e + x.offset;
                st.ncc = p / Math.sqrt(a * b + 1e-12);
                st.density = cnt * h / Math.max(e - s, 1e-9);
                st.clipStart = cs;
                st.clipEnd = ce;
                st.lag = k;
                st.windows = cnt;
                res.add(st);
            }
            i = last + 1;
        }
        return res;
    }
}
