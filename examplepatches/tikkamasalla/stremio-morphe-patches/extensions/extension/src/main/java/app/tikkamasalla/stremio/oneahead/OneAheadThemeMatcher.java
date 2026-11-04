package app.tikkamasalla.stremio.oneahead;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

/**
 * Backup theme matcher: official opening/ending songs against one episode window.
 * A port of the Python theme stage (themes_stage plus themes/theme_matcher and the
 * prep/top_lags it uses from align). Same sample rate, band, windows, speeds, loose
 * gate, 2 s inward trim and episode-range ranking. A theme result only ever fills a
 * segment type the main run did not find.
 *
 * Shipped gate is the loose gate: lag_ncc at least 0.12, median at least 0.25, at
 * least 1 window over threshold. It has 0 real wrong matches over 2200 cross-show
 * pairs and 648 own-show regions; the 2 flagged passes are real ending songs whose
 * keys simply list no credits. Every result is trimmed 2 s inward at each end; a
 * result 4 s or shorter after trim is dropped.
 */
public final class OneAheadThemeMatcher {
    public static final int SR = 8000;
    public static final double BAND_LO = 80.0, BAND_HI = 1500.0;
    public static final double WIN_S = 10.0, HOP_S = 2.0;
    public static final double[] SPEEDS = {1.0, 0.95904};
    /** Loose gate, the shipped one. */
    public static final double LOOSE_LAG = 0.12, LOOSE_MED = 0.25;
    public static final int LOOSE_HI = 1;
    public static final double TRIM_S = 2.0;
    public static final double HEAD_S = 360.0, TAIL_S = 300.0;
    /** Head window loses its tail: previews and recaps sit there, not the opening. */
    public static final double MASK_TAIL_OP_S = 35.0;
    public static final int MAX_CAND = 4;

    private OneAheadThemeMatcher() {}

    /** One AnimeThemes song entry: type OP/ED, sequence in its season, slug, episode range. */
    public static final class Theme {
        public final String type;
        public final Integer sequence;
        public final String slug;
        public final String episodes;
        public Theme(String type, Integer sequence, String slug, String episodes) {
            this.type = type; this.sequence = sequence; this.slug = slug; this.episodes = episodes;
        }
    }

    /** One scored window of episode audio against one theme core. */
    public static final class Match {
        public boolean pass;
        public final String theme;
        /** Raw (untrimmed) edges in episode clock seconds, rounded to ms like the Python stage. */
        public double startS, endS;
        public double lagNcc, median, span, speed;
        public int hiN, wins;
        Match(String theme) { this.theme = theme; }
    }

    /** Zero mean, FFT band limit 80-1500 Hz, 1 s sliding RMS gain control. */
    public static float[] prep(float[] x) {
        int n = x.length;
        double mean = 0;
        for (float v : x) mean += v;
        mean /= Math.max(n, 1);
        int nfft = Rfft.nextPow2(Math.max(n, 4));
        float[] z = new float[nfft];
        for (int i = 0; i < n; i++) z[i] = (float) (x[i] - mean);
        Rfft fft = new Rfft(nfft);
        fft.forward(z);
        int h = nfft / 2;
        double hz = SR / (double) nfft;
        for (int k = 0; k <= h; k++) {
            double f = k * hz;
            if (f >= BAND_LO && f <= BAND_HI) continue;
            if (k == 0) z[0] = 0;
            else if (k == h) z[1] = 0;
            else { z[2 * k] = 0; z[2 * k + 1] = 0; }
        }
        fft.inverse(z);
        double[] c = new double[n + 1];
        for (int i = 0; i < n; i++) { double y = z[i]; c[i + 1] = c[i] + y * y; }
        float[] env = new float[n];
        int w = SR;
        for (int i = 0; i < n; i++) {
            int i0 = Math.max(0, i - w / 2), i1 = Math.min(n, i + w / 2);
            env[i] = (float) Math.sqrt(Math.max(c[i1] - c[i0], 0.0) / Math.max(i1 - i0, 1));
        }
        float[] s = env.clone();
        Arrays.sort(s);
        double med = n == 0 ? 0 : n % 2 == 1 ? s[n / 2] : 0.5 * (s[n / 2 - 1] + s[n / 2]);
        double add = 0.2 * (med + 1e-9);
        float[] out = new float[n];
        for (int i = 0; i < n; i++) out[i] = (float) (z[i] / (env[i] + add));
        return out;
    }

    /** Linear resample by a speed factor, endpoints clamped like numpy.interp. */
    static float[] resample(float[] x, double speed) {
        if (speed == 1.0) return x;
        int n = (int) (x.length * speed);
        float[] out = new float[Math.max(n, 1)];
        for (int j = 0; j < out.length; j++) {
            double pos = j / speed;
            int i = (int) Math.floor(pos);
            double f = pos - i;
            float v0 = x[Math.min(Math.max(i, 0), x.length - 1)];
            float v1 = x[Math.min(Math.max(i + 1, 0), x.length - 1)];
            out[j] = (float) (v0 + f * (v1 - v0));
        }
        return out;
    }

    /**
     * Best lag k with th[m] ~ ep[m-k]: overlap-energy normalised correlation peaks,
     * at least 2 s apart. Returns {lag, ncc, noise} or null. k is fixed to 1 here,
     * the only use the theme stage has.
     */
    static double[] topLag(float[] th, float[] ep) {
        int n = th.length, m = ep.length;
        int minOverlap = 20 * SR;
        int kMin = -(m - minOverlap), kMax = n - minOverlap;
        if (kMax < kMin) return null;
        int nfft = 1;
        while (nfft < n + m) nfft *= 2;
        float[] a = new float[nfft], b = new float[nfft];
        System.arraycopy(th, 0, a, 0, n);
        System.arraycopy(ep, 0, b, 0, m);
        Rfft fft = new Rfft(nfft);
        fft.forward(a);
        fft.forward(b);
        float[] c = new float[nfft];
        c[0] = a[0] * b[0];
        c[1] = a[1] * b[1];
        int h = nfft / 2;
        for (int k = 1; k < h; k++) {
            float ar = a[2 * k], ai = a[2 * k + 1], br = b[2 * k], bi = b[2 * k + 1];
            c[2 * k] = ar * br + ai * bi;
            c[2 * k + 1] = ai * br - ar * bi;
        }
        fft.inverse(c);
        double[] ea = new double[n + 1], eb = new double[m + 1];
        for (int i = 0; i < n; i++) ea[i + 1] = ea[i] + (double) th[i] * th[i];
        for (int i = 0; i < m; i++) eb[i + 1] = eb[i] + (double) ep[i] * ep[i];
        int nk = kMax - kMin + 1;
        float[] ncc = new float[nk];
        for (int k = kMin; k <= kMax; k++) {
            int lo = Math.max(0, k), hi = Math.min(n, m + k);
            double ex = ea[hi] - ea[lo], ey = eb[hi - k] - eb[lo - k];
            double cc = k >= 0 ? c[k] : c[nfft + k];
            ncc[k - kMin] = (float) (cc / Math.sqrt(Math.max(ex, 0) * Math.max(ey, 0) + 1e-9));
        }
        float[] mag = new float[nk];
        for (int i = 0; i < nk; i++) mag[i] = Math.abs(ncc[i]);
        Arrays.sort(mag);
        double noise = nk % 2 == 1 ? mag[nk / 2] : 0.5 * (mag[nk / 2 - 1] + mag[nk / 2]);
        double bar = Math.max(0.012, 8.0 * noise);
        int best = -1;
        float bestV = 0;
        for (int i = 0; i < nk; i++) {
            if (ncc[i] > bestV) { best = i; bestV = ncc[i]; }
        }
        if (best < 0 || bestV < bar) return null;
        return new double[]{kMin + best, bestV, noise};
    }

    /** Per 10 s window (2 s hop) normalised correlation of theme against episode at one lag. */
    static List<double[]> winNccs(float[] thp, float[] epp, int lag) {
        List<double[]> out = new ArrayList<>();
        int win = (int) (WIN_S * SR), hop = (int) (HOP_S * SR);
        if (thp.length < win) return out;
        int cnt = (thp.length - win) / hop + 1;
        for (int i = 0; i < cnt; i++) {
            int s = i * hop, e = lag + s;
            if (e < 0 || e + win > epp.length) continue;
            double sw = 0, sg = 0, ww = 0, gg = 0, wg = 0;
            for (int j = 0; j < win; j++) { sw += thp[s + j]; sg += epp[e + j]; }
            sw /= win; sg /= win;
            for (int j = 0; j < win; j++) {
                double w = thp[s + j] - sw, g = epp[e + j] - sg;
                wg += w * g; ww += w * w; gg += g * g;
            }
            out.add(new double[]{s / (double) SR, wg / Math.sqrt(ww * gg + 1e-12)});
        }
        return out;
    }

    /**
     * Score prepared episode samples against a theme core. Same gates as the Python match_epx.
     * leadSamp/trailSamp are the silence-trimmed sample counts around the core at 8 kHz.
     */
    public static Match matchEpx(float[] epx, double off, float[] core,
                                 int leadSamp, int trailSamp, String theme) {
        Match out = new Match(theme);
        float[] eppFull = prep(epx);
        double bestNcc = Double.NEGATIVE_INFINITY;
        double bestMed = 0, bestSpeed = 1;
        int bestLag = 0, bestHi = 0, bestWins = 0;
        double bestSpan = 0;
        int bestThLen = 0;
        for (double speed : SPEEDS) {
            float[] th = resample(core, speed);
            float[] thp = prep(th);
            double[] lag = topLag(thp, eppFull);
            if (lag == null) continue;
            int epCore = -(int) lag[0];
            if (epCore < 0 || epCore + th.length > eppFull.length) continue;
            List<double[]> wins = winNccs(thp, eppFull, epCore);
            if (wins.isEmpty()) continue;
            double[] vals = new double[wins.size()];
            for (int i = 0; i < vals.length; i++) vals[i] = wins.get(i)[1];
            Arrays.sort(vals);
            double med = vals[vals.length / 2];
            int hi = 0;
            for (double v : vals) if (v > 0.88) hi++;
            double span;
            double first = -1, last = -1;
            for (double[] w2 : wins) if (w2[1] > 0.88) { if (first < 0) first = w2[0]; last = w2[0]; }
            if (first >= 0) span = last - first;
            else { span = wins.get(wins.size() - 1)[0] - wins.get(0)[0]; }
            if (lag[1] > bestNcc) {
                bestNcc = lag[1]; bestMed = med; bestSpeed = speed; bestLag = (int) lag[0];
                bestHi = hi; bestWins = wins.size(); bestSpan = span; bestThLen = th.length;
            }
        }
        if (bestNcc == Double.NEGATIVE_INFINITY) return out;
        out.pass = bestNcc >= LOOSE_LAG && bestMed >= LOOSE_MED && bestHi >= LOOSE_HI;
        double leadS = leadSamp / (double) SR / bestSpeed;
        double trailS = trailSamp / (double) SR / bestSpeed;
        double coreStart = off + (-bestLag) / (double) SR;
        out.startS = Math.round((coreStart - leadS) * 1000.0) / 1000.0;
        out.endS = Math.round((coreStart + bestThLen / (double) SR + trailS) * 1000.0) / 1000.0;
        out.lagNcc = Math.round(bestNcc * 1000.0) / 1000.0;
        out.median = Math.round(bestMed * 1000.0) / 1000.0;
        out.span = Math.round(bestSpan * 10.0) / 10.0;
        out.speed = bestSpeed;
        out.hiN = bestHi;
        out.wins = bestWins;
        return out;
    }

    /** Trim 2 s inward at each end; null when 4 s or less is left after the trim. */
    public static double[] trimmed(double start, double end) {
        double s = Math.round((start + TRIM_S) * 1000.0) / 1000.0;
        double e = Math.round((end - TRIM_S) * 1000.0) / 1000.0;
        return e > s ? new double[]{s, e} : null;
    }

    /**
     * True/False/null (unknown). Handles open-ended ranges such as 1203-.
     * Null when the range is missing or the episode number is unknown.
     */
    public static Boolean epInRange(String epstr, Integer n) {
        if (epstr == null || epstr.isEmpty() || n == null) return null;
        for (String part : epstr.split(",")) {
            part = part.trim();
            if (part.contains("-")) {
                int dash = part.indexOf('-');
                String a = part.substring(0, dash).trim(), b = part.substring(dash + 1).trim();
                try {
                    int lo = a.isEmpty() ? 1 : Integer.parseInt(a);
                    int hi = b.isEmpty() ? 1000000000 : Integer.parseInt(b);
                    if (lo <= n && n <= hi) return true;
                } catch (NumberFormatException bad) { /* next part */ }
            } else {
                try {
                    if (Integer.parseInt(part) == n) return true;
                } catch (NumberFormatException bad) { /* next part */ }
            }
        }
        return false;
    }

    /** In-range first ordered by sequence, then unknown range, then out-of-range. */
    public static List<Theme> rank(List<Theme> themes, Integer n, String kind) {
        List<Theme> a = new ArrayList<>(), b = new ArrayList<>(), c = new ArrayList<>();
        for (Theme t : themes) {
            if (!kind.equals(t.type)) continue;
            Boolean r = epInRange(t.episodes, n);
            if (r != null && r) a.add(t);
            else if (r == null) b.add(t);
            else c.add(t);
        }
        Comparator<Theme> bySeq = (x, y) -> Integer.compare(
                x.sequence == null ? 999 : x.sequence, y.sequence == null ? 999 : y.sequence);
        a.sort(bySeq); b.sort(bySeq); c.sort(bySeq);
        List<Theme> out = new ArrayList<>(a.size() + b.size() + c.size());
        out.addAll(a); out.addAll(b); out.addAll(c);
        return out;
    }
}
