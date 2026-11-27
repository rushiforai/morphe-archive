package app.ayham.extension.music.automix;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Automix v2's evidence from the mono song (the extension's host.js lowEnd, from Orchard
 * evidence.rs, chroma.rs and loudness.rs): the sub-bass ratio, the bass curve, the pitch profile
 * (whole song and every 0.5 s) and the 100 ms K-weighted loudness. Pure Java.
 */
public final class Evidence {
    private Evidence() {
    }

    /** Fills [a]'s subBassRatio, bassCurve, chroma, chromaCurve and loudnessCurve from mono [x] at [sr]. */
    public static void measure(float[] x, double sr, Analysis a) {
        Low c = lowCopy(x, sr);
        a.subBassRatio = subBassRatio(c);
        a.bassCurve = bassCurve(c);
        chroma(x, sr, a);
        a.loudnessCurve = loudnessCurve(x, sr);
    }

    static float[] biquad(float[] x, boolean lowpass, double f, double sr) {
        return KickLock.biquad(x, lowpass, f, sr);
    }

    /** A band: two high-passes, two low-passes (Orchard's band()). */
    static float[] band(float[] x, double lo, double hi, double r) {
        return biquad(biquad(biquad(biquad(x, false, lo, r), false, lo, r), true, hi, r), true, hi, r);
    }

    static final class Low {
        float[] low;
        double r;
    }

    /** The song low-passed under 400 Hz and kept at about 2756 Hz (every 16th sample at 44.1 kHz). */
    static Low lowCopy(float[] mono, double sr) {
        float[] pre = biquad(biquad(mono, true, 400, sr), true, 400, sr);
        int step = (int) Math.max(1, Math.round(sr / 2756.25));
        Low l = new Low();
        l.low = new float[pre.length / step];
        for (int i = 0; i < l.low.length; i++) l.low[i] = pre[i * step];
        l.r = sr / step;
        return l;
    }

    /** log10 of the energy at 25-60 Hz over 60-250 Hz in the song's middle 60%; NaN when silent. */
    static double subBassRatio(Low c) {
        float[] body = Arrays.copyOfRange(c.low, c.low.length / 5, (int) Math.floor(c.low.length * 4 / 5.0));
        double sub = energy(band(body, 25, 60, c.r)), bass = energy(band(body, 60, 250, c.r));
        return sub > 0 && bass > 0 ? Math.log10(sub / bass) : Double.NaN;
    }

    private static double energy(float[] x) {
        double e = 0;
        for (float v : x) e += (double) v * v;
        return e;
    }

    static final double BASS_STEP = 0.25;

    /** 35-140 Hz RMS every 0.25 s, 1 = the song's usual level (75th percentile of its per-second means). */
    static Analysis.Curve bassCurve(Low c) {
        float[] f = band(c.low, 35, 140, c.r);
        List<Double> levels = new ArrayList<>();
        for (int i = 0; edge(i + 1, c.r) <= f.length; i++) {
            long a = edge(i, c.r), b = edge(i + 1, c.r);
            double ss = 0;
            for (long k = a; k < b; k++) ss += (double) f[(int) k] * f[(int) k];
            levels.add(Math.sqrt(ss / Math.max(1, b - a)));
        }
        int perSec = (int) Math.round(1 / BASS_STEP);
        List<Double> seconds = new ArrayList<>();
        for (int i = 0; i < levels.size(); i += perSec) {
            int e = Math.min(levels.size(), i + perSec);
            double s = 0;
            for (int k = i; k < e; k++) s += levels.get(k);
            seconds.add(s / (e - i));
        }
        if (seconds.isEmpty()) return null;
        double[] sorted = new double[seconds.size()];
        for (int i = 0; i < sorted.length; i++) sorted[i] = seconds.get(i);
        Arrays.sort(sorted);
        double ref = Math.max(sorted[(int) Math.round((sorted.length - 1) * 0.75)], 1e-6);
        Analysis.Curve curve = new Analysis.Curve();
        curve.start = 0;
        curve.step = BASS_STEP;
        curve.values = new double[levels.size()];
        for (int i = 0; i < curve.values.length; i++) curve.values[i] = Math.round(levels.get(i) / ref * 1000) / 1000.0;
        return curve;
    }

    private static long edge(int i, double r) {
        return Math.round(i * BASS_STEP * r);
    }

    static final double CHROMA_STEP = 0.5, CHROMA_LOW = 65, CHROMA_HIGH = 2100;

    /**
     * Pitch classes every 0.5 s: a ~2.7 Hz-bin spectrum; each peak from 65 Hz to 2.1 kHz over twice
     * the frame's median, parabolic on log magnitude, adds its square root to its two nearest
     * pitch classes. Each frame summed to 1 with its weight against the median frame; the whole
     * song's profile summed to 1.
     */
    static void chroma(float[] mono, double sr, Analysis a) {
        int size = 1 << (int) Math.ceil(Math.log(Math.max(512, sr / 2.7)) / Math.log(2));
        int hop = (int) Math.max(1, Math.round(CHROMA_STEP * sr));
        if (mono.length < size) return;
        double[] win = new double[size];
        for (int i = 0; i < size; i++) win[i] = 0.5 - 0.5 * Math.cos(2 * Math.PI * i / (size - 1));
        int low = (int) Math.max(2, Math.ceil(CHROMA_LOW * size / sr));
        int high = (int) Math.min(size / 2 - 2, Math.floor(Math.min(CHROMA_HIGH, sr * 0.45) * size / sr));
        Fft fft = new Fft(size);
        double[] frame = new double[size], band = new double[high - low + 1];
        double binHz = sr / size;
        List<double[]> frames = new ArrayList<>();
        for (int begin = 0; begin + size <= mono.length; begin += hop) {
            for (int i = 0; i < size; i++) frame[i] = mono[begin + i] * win[i];
            double[] m = fft.magnitudes(frame);
            System.arraycopy(m, low, band, 0, band.length);
            Arrays.sort(band);
            double floor = band[band.length >> 1] * 2;
            double[] c = new double[12];
            for (int bin = low; bin <= high; bin++) {
                double l = m[bin - 1], mid = m[bin], r = m[bin + 1];
                if (mid <= floor || mid <= l || mid < r) continue;
                double la = Math.log(l + 1e-12), lb = Math.log(mid + 1e-12), lc = Math.log(r + 1e-12);
                double curv = la - 2 * lb + lc;
                double off = curv < 0 ? Math.max(-0.5, Math.min(0.5, 0.5 * (la - lc) / curv)) : 0;
                double pitch = 69 + 12 * (Math.log(((bin + off) * binHz) / 440) / Math.log(2));
                int lower = (int) Math.floor(pitch);
                double near = Math.pow(Math.cos((pitch - lower) * Math.PI / 2), 2), w = Math.sqrt(mid);
                c[((lower % 12) + 12) % 12] += w * near;
                c[(((lower + 1) % 12) + 12) % 12] += w * (1 - near);
            }
            frames.add(c);
        }
        double[] totals = new double[frames.size()];
        for (int i = 0; i < totals.length; i++) for (double v : frames.get(i)) totals[i] += v;
        double[] sorted = totals.clone();
        Arrays.sort(sorted);
        double typical = Math.max(sorted.length > 0 ? sorted[sorted.length / 2] : 0, 1e-9);
        double[] sum = new double[12];
        for (double[] f : frames) for (int k = 0; k < 12; k++) sum[k] += f[k];
        double all = 0;
        for (double v : sum) all += v;
        if (!(all > 0)) return;
        a.chroma = new double[12];
        for (int k = 0; k < 12; k++) a.chroma[k] = Math.round(sum[k] / all * 1e4) / 1e4;
        Analysis.ChromaCurve cc = new Analysis.ChromaCurve();
        cc.start = r3(size / 2.0 / sr);
        cc.step = hop / sr;
        cc.values = new double[frames.size()][];
        cc.weights = new double[frames.size()];
        for (int i = 0; i < cc.values.length; i++) {
            double[] f = frames.get(i), v = new double[12];
            for (int k = 0; k < 12; k++) v[k] = r3(f[k] / Math.max(totals[i], 1e-12));
            cc.values[i] = v;
            cc.weights[i] = r3(Math.min(totals[i] / typical, 4));
        }
        a.chromaCurve = cc;
    }

    private static double r3(double v) {
        return Math.round(v * 1000) / 1000.0;
    }

    /** A radix-2 FFT's magnitudes (bins 0..size/2), its buffers reused. */
    static final class Fft {
        final int size;
        final int[] rev;
        final double[] cos, sin, re, im, mag;

        Fft(int size) {
            this.size = size;
            int bits = Integer.numberOfTrailingZeros(size);
            rev = new int[size];
            for (int i = 0; i < size; i++) rev[i] = (rev[i >> 1] >> 1) | ((i & 1) << (bits - 1));
            cos = new double[size / 2];
            sin = new double[size / 2];
            for (int i = 0; i < size / 2; i++) {
                cos[i] = Math.cos(2 * Math.PI * i / size);
                sin[i] = -Math.sin(2 * Math.PI * i / size);
            }
            re = new double[size];
            im = new double[size];
            mag = new double[size / 2 + 1];
        }

        double[] magnitudes(double[] frame) {
            for (int i = 0; i < size; i++) {
                re[rev[i]] = frame[i];
                im[rev[i]] = 0;
            }
            for (int len = 2; len <= size; len <<= 1) {
                int half = len >> 1, step = size / len;
                for (int i = 0; i < size; i += len) {
                    for (int j = 0, k = 0; j < half; j++, k += step) {
                        int a = i + j, b = a + half;
                        double tr = re[b] * cos[k] - im[b] * sin[k], ti = re[b] * sin[k] + im[b] * cos[k];
                        re[b] = re[a] - tr;
                        im[b] = im[a] - ti;
                        re[a] += tr;
                        im[a] += ti;
                    }
                }
            }
            for (int i = 0; i <= size / 2; i++) mag[i] = Math.hypot(re[i], im[i]);
            return mag;
        }
    }

    static final double LOUDNESS_STEP = 0.1;

    private static float[] kStage(float[] x, double b0, double b1, double b2, double a1, double a2) {
        float[] y = new float[x.length];
        double x1 = 0, x2 = 0, y1 = 0, y2 = 0;
        for (int i = 0; i < x.length; i++) {
            double v = b0 * x[i] + b1 * x1 + b2 * x2 - a1 * y1 - a2 * y2;
            x2 = x1;
            x1 = x[i];
            y2 = y1;
            y1 = v;
            y[i] = (float) v;
        }
        return y;
    }

    /** ITU BS.1770 loudness every 100 ms: K-weighted (a high shelf, then a high-pass), its mean square in dB. */
    static Analysis.Curve loudnessCurve(float[] mono, double sr) {
        double K = Math.tan(Math.PI * 1681.974450955533 / sr);
        double Q1 = 0.7071752369554196, Vh = Math.pow(10, 3.999843853973347 / 20), Vb = Math.pow(Vh, 0.4996667741545416);
        double a0 = 1 + K / Q1 + K * K;
        float[] shelf = kStage(mono, (Vh + Vb * K / Q1 + K * K) / a0, 2 * (K * K - Vh) / a0, (Vh - Vb * K / Q1 + K * K) / a0,
                2 * (K * K - 1) / a0, (1 - K / Q1 + K * K) / a0);
        K = Math.tan(Math.PI * 38.13547087602444 / sr);
        double Q2 = 0.5003270373238773;
        a0 = 1 + K / Q2 + K * K;
        float[] z = kStage(shelf, 1, -2, 1, 2 * (K * K - 1) / a0, (1 - K / Q2 + K * K) / a0);
        int n = (int) Math.round(LOUDNESS_STEP * sr);
        int count = n > 0 ? z.length / n : 0;
        if (count == 0) return null;
        double[] values = new double[count];
        for (int j = 0; j < count; j++) {
            double ss = 0;
            for (int k = j * n; k < (j + 1) * n; k++) ss += (double) z[k] * z[k];
            values[j] = Math.max(-120, Math.round(10 * Math.log10(ss / n + 1e-30) * 10) / 10.0);
        }
        Analysis.Curve c = new Analysis.Curve();
        c.start = 0;
        c.step = LOUDNESS_STEP;
        c.values = values;
        return c;
    }
}
