package app.tikkamasalla.stremio.oneahead;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Landmark hashing over the 4 kHz band-limited signal (spectral peak pairs, the
 * SoundFingerprinting/Shazam idea, written for this codebase): proposes lags where the same
 * music survives in a different mix but whole-window waveform correlation buries it. Peaks are
 * picked one per quasi-log band so dialogue formants cannot take every slot; pair hashes vote
 * for a frame lag, which is then refined to one sample on the waveform before any stretch is
 * measured. Also carries the log-band energies for the centred-modulation verifier. All state
 * is per call except the FFT plan; a 360 s window is ~11k frames.
 */
public final class Landmark {
    static final int NFFT = 512, HOP = 128;                 // 128 ms window, 32 ms hop, 7.8 Hz bins
    static final int BANDS = 12;
    private static final int BIN_LO = 10, BIN_HI = 192;     // 78..1500 Hz
    private static final int[] PEAK_BANDS = {10, 23, 46, 92, 192};
    private static final int MAX_DT = 24, FANOUT = 8;       // pair reach 0.77 s
    private static final int ENV_QUIET = 55;                // dB below FS: AGC'd silence makes phantom peaks

    private final Rfft fft = new Rfft(NFFT);
    private final float[] buf = new float[NFFT];
    private final float[] hann = new float[NFFT];

    public Landmark() {
        for (int i = 0; i < NFFT; i++) hann[i] = (float) (0.5 - 0.5 * Math.cos(2 * Math.PI * i / (NFFT - 1)));
    }

    /** Per-track features: peak bins per frame (quantised, -1 = none), log band energies, packed hashes. */
    public static final class Feat {
        int frames;
        int[] peaks;        // frames * 4, quantised bin or -1
        float[] logE;       // frames * BANDS
        public int[] hash, hframe; // parallel: pair hash, anchor frame
    }

    public static final class Match {
        public int lag;          // samples, Correlator convention: target[m] ~ ref[m - lag]
        public int lagFrames, votes;
        public int[] hitFrames;  // target anchor frames voting at lagFrames
    }

    public Feat feat(Track t) {
        Feat f = new Feat();
        f.frames = t.n < NFFT ? 0 : (t.n - NFFT) / HOP + 1;
        f.peaks = new int[f.frames * 4];
        Arrays.fill(f.peaks, -1);
        f.logE = new float[f.frames * BANDS];
        double[] edges = new double[BANDS + 1];
        for (int b = 0; b <= BANDS; b++) edges[b] = 80 * Math.pow(1500.0 / 80, b / (double) BANDS);
        float[] mag = new float[NFFT / 2 + 1];
        float[] sig = new float[t.n];
        for (int i = 0; i < t.n; i++) sig[i] = t.at(i);
        for (int fr = 0; fr < f.frames; fr++) {
            int base = fr * HOP;
            for (int i = 0; i < NFFT; i++) buf[i] = sig[base + i] * hann[i];
            fft.forward(buf);
            mag[0] = Math.abs(buf[0]);
            mag[NFFT / 2] = Math.abs(buf[1]);
            for (int k = 1; k < NFFT / 2; k++) { float re = buf[2 * k], im = buf[2 * k + 1]; mag[k] = (float) Math.sqrt(re * re + im * im); }
            for (int b = 0; b < BANDS; b++) {
                int k0 = Math.max(1, (int) Math.round(edges[b] * NFFT / Track.SR));
                int k1 = Math.min(NFFT / 2, Math.max(k0 + 1, (int) Math.round(edges[b + 1] * NFFT / Track.SR)));
                double p = 0;
                for (int k = k0; k < k1; k++) p += (double) mag[k] * mag[k];
                f.logE[fr * BANDS + b] = (float) Math.log10(p + 1e-9);
            }
            int ei = base / Track.ENV_SAMPLES;
            if (t.env != null && ei >= 0 && ei < t.env.length && (t.env[ei] & 0xFF) > ENV_QUIET) continue;
            for (int b = 0; b < 4; b++) {
                int k0 = PEAK_BANDS[b], k1 = PEAK_BANDS[b + 1], best = -1;
                double mean = 0;
                for (int k = k0; k < k1; k++) mean += mag[k];
                mean /= Math.max(1, k1 - k0);
                for (int k = k0; k < k1; k++) {
                    if (mag[k] <= mag[k - 1] || (k + 1 < mag.length && mag[k] < mag[k + 1])) continue;
                    if (best < 0 || mag[k] > mag[best]) best = k;
                }
                if (best >= BIN_LO && best < BIN_HI && mag[best] > 2.5 * mean) f.peaks[fr * 4 + b] = best >> 1;
            }
        }
        // Peak list in time order, then pair hashes with bounded fan-out.
        int np = 0;
        for (int v : f.peaks) if (v >= 0) np++;
        int[] pf = new int[np], pq = new int[np];
        for (int fr = 0, j = 0; fr < f.frames; fr++) for (int b = 0; b < 4; b++) {
            int q = f.peaks[fr * 4 + b];
            if (q >= 0) { pf[j] = fr; pq[j] = q; j++; }
        }
        int cap = Math.max(16, np * FANOUT), nh = 0;
        int[] hh = new int[cap], hf = new int[cap];
        for (int i = 0; i < np; i++) {
            int made = 0, lastF = -1, inF = 0;
            for (int j = i + 1; j < np && made < FANOUT; j++) {
                int dt = pf[j] - pf[i];
                if (dt > MAX_DT) break;
                if (dt < 1) continue;
                if (pf[j] != lastF) { lastF = pf[j]; inF = 0; }
                if (inF >= 2) continue; // two loud frames must not eat the whole 0.77 s reach
                inF++;
                hh[nh] = (pq[i] << 12) | (pq[j] << 5) | dt;
                hf[nh] = pf[i];
                nh++;
                made++;
            }
        }
        f.hash = Arrays.copyOf(hh, nh);
        f.hframe = Arrays.copyOf(hf, nh);
        return f;
    }

    /** Best frame lags by hash votes, refined to one sample on the waveform. */
    public Match[] match(Track t, Feat ft, Track r, Feat fr, int maxLags, int minVotes) {
        Map<Integer, int[]> ref = new HashMap<>();
        Map<Integer, Integer> cnt = new HashMap<>();
        for (int h : fr.hash) cnt.put(h, cnt.getOrDefault(h, 0) + 1);
        for (Map.Entry<Integer, Integer> e : cnt.entrySet()) if (e.getValue() <= 20) ref.put(e.getKey(), new int[e.getValue()]);
        Map<Integer, Integer> fill = new HashMap<>();
        for (int i = 0; i < fr.hash.length; i++) {
            int[] a = ref.get(fr.hash[i]);
            if (a == null) continue;
            int at = fill.getOrDefault(fr.hash[i], 0);
            a[at] = fr.hframe[i];
            fill.put(fr.hash[i], at + 1);
        }
        int span = ft.frames + fr.frames + 1;
        int[] votes = new int[span];
        for (int i = 0; i < ft.hash.length; i++) {
            int[] a = ref.get(ft.hash[i]);
            if (a == null) continue;
            for (int rf : a) votes[ft.hframe[i] - rf + fr.frames]++;
        }
        List<Match> out = new ArrayList<>();
        boolean[] dead = new boolean[span];
        for (int pick = 0; pick < maxLags; pick++) {
            int best = -1;
            for (int i = 0; i < span; i++) if (!dead[i] && (best < 0 || votes[i] > votes[best])) best = i;
            if (best < 0 || votes[best] < minVotes) break;
            Match m = new Match();
            m.lagFrames = best - fr.frames;
            m.votes = votes[best];
            List<Integer> hits = new ArrayList<>();
            for (int i = 0; i < ft.hash.length; i++) {
                int[] a = ref.get(ft.hash[i]);
                if (a == null) continue;
                for (int rf : a) if (ft.hframe[i] - rf == m.lagFrames) { hits.add(ft.hframe[i]); break; }
            }
            int[] hs = new int[hits.size()];
            for (int i = 0; i < hits.size(); i++) hs[i] = hits.get(i);
            Arrays.sort(hs);
            int nd = 0;
            for (int i = 0; i < hs.length; i++) if (i == 0 || hs[i] != hs[i - 1]) hs[nd++] = hs[i];
            m.hitFrames = Arrays.copyOf(hs, nd);
            m.lag = refine(t, r, m.lagFrames * HOP, m.hitFrames);
            out.add(m);
            int sep = (int) Math.round(2.0 * Track.SR / HOP);
            for (int i = Math.max(0, best - sep); i < Math.min(span, best + sep + 1); i++) dead[i] = true;
        }
        return out.toArray(new Match[0]);
    }

    /** Sample-exact lag near k0 maximising waveform correlation around the voting anchors. */
    private static int refine(Track t, Track r, int k0, int[] hitFrames) {
        if (hitFrames.length == 0) return k0;
        int best = k0;
        double bestV = Double.NEGATIVE_INFINITY;
        for (int step : new int[]{4, 1}) {
            int lo = step == 4 ? k0 - HOP : best - 4, hi = step == 4 ? k0 + HOP : best + 4;
            for (int k = lo; k <= hi; k += step) {
                double p = 0, a = 0, b = 0;
                int take = Math.min(hitFrames.length, 24);
                for (int s = 0; s < take; s++) {
                    int base = hitFrames[(int) ((long) s * hitFrames.length / take)] * HOP;
                    for (int i = 0; i < 1024; i++) {
                        int ti = base + i, ri = ti - k;
                        if (ti < 0 || ti >= t.n || ri < 0 || ri >= r.n) continue;
                        double x = t.at(ti), y = r.at(ri);
                        p += x * y; a += x * x; b += y * y;
                    }
                }
                if (a <= 0 || b <= 0) continue;
                double v = p / Math.sqrt(a * b + 1e-12);
                if (v > bestV) { bestV = v; best = k; }
            }
        }
        return best;
    }

    /** Share of whole 1 s buckets of [s, e) (target clock) holding at least one voting anchor. */
    public static double coverage(Match m, Track t, double s, double e) {
        int buckets = (int) Math.ceil(e - s);
        if (buckets <= 0) return 0;
        boolean[] hit = new boolean[buckets];
        for (int fr : m.hitFrames) {
            double at = t.offset + fr * HOP / (double) Track.SR;
            int b = (int) Math.floor(at - s);
            if (b >= 0 && b < buckets) hit[b] = true;
        }
        int n = 0;
        for (boolean h : hit) if (h) n++;
        return n / (double) buckets;
    }

    /** Centred log-band modulation correlation over the aligned span: static EQ and stationary
     * beds score ~0, the same chord/rhythm pattern scores high through a different mix. */
    public static double melCos(Feat ft, Feat fr, int lagFrames, Track t, Track r, double s, double e) {
        int f0 = Math.max(0, (int) Math.round((s - t.offset) * Track.SR / HOP));
        int f1 = Math.min(ft.frames, (int) Math.round((e - t.offset) * Track.SR / HOP));
        int n = 0;
        double[] mt = new double[BANDS], mr = new double[BANDS];
        for (int f = f0; f < f1; f++) {
            int g = f - lagFrames;
            if (g < 0 || g >= fr.frames) continue;
            n++;
            for (int b = 0; b < BANDS; b++) { mt[b] += ft.logE[f * BANDS + b]; mr[b] += fr.logE[g * BANDS + b]; }
        }
        if (n < 20) return 0;
        for (int b = 0; b < BANDS; b++) { mt[b] /= n; mr[b] /= n; }
        double p = 0, a = 0, bb = 0;
        for (int f = f0; f < f1; f++) {
            int g = f - lagFrames;
            if (g < 0 || g >= fr.frames) continue;
            for (int b = 0; b < BANDS; b++) {
                double x = ft.logE[f * BANDS + b] - mt[b], y = fr.logE[g * BANDS + b] - mr[b];
                p += x * y; a += x * x; bb += y * y;
            }
        }
        return p / Math.sqrt(a * bb + 1e-12);
    }
}
