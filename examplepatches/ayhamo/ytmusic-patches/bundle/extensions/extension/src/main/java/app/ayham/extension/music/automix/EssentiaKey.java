package app.ayham.extension.music.automix;

import java.util.ArrayList;
import java.util.List;

/**
 * spec/automix/analysis-cases.md "The key [all]" (107d0f51): Essentia's KeyExtractor with its
 * defaults, the PC's analyser, step by step; a port of the extension's scripts/key_port.mjs. Input:
 * the whole song, mono, at 44100 Hz.
 */
final class EssentiaKey {
    static final int SR = 44100, N = 4096, HOP = 4096;
    private static final double FMIN = 25, FMAX = 3500, THR = 1e-4;
    private static final int MAXPEAKS = 60;
    static final String[] NOTES = {"A", "Bb", "B", "C", "C#", "D", "Eb", "E", "F", "F#", "G", "Ab"};
    private static final double[] MAJ = {1, 0, 0.42, 0, 0.53, 0.37, 0, 0.77, 0, 0.38, 0.21, 0.30};
    private static final double[] MIN = {1, 0, 0.36, 0.39, 0, 0.38, 0, 0.74, 0.27, 0, 0.42, 0.23};
    private static final double[][] HARM = {
            {0, 3},
            {12 * log2(3) - 12, 1},
            {12 * log2(5) - 24, 1 / Math.max(1, 12 * log2(5) / 12 * 0.5)}};
    private static final double[] WIN = new double[N];

    static {
        double s = 0;
        for (int i = 0; i < N; i++) {
            WIN[i] = 0.5 - 0.5 * Math.cos(2 * Math.PI * i / (N - 1));
            s += WIN[i];
        }
        for (int i = 0; i < N; i++) WIN[i] *= 2 / s;
    }

    private EssentiaKey() {
    }

    static final class Key {
        final String name;
        final double strength;

        Key(String name, double strength) {
            this.name = name;
            this.strength = strength;
        }
    }

    private static double log2(double x) {
        return Math.log(x) / Math.log(2);
    }

    /** The key of [x] (mono, 44100 Hz, [n] samples). */
    static Key of(float[] x, int n) {
        double[] acc = new double[12];
        int frames = 0;
        double[] re = new double[N], im = new double[N], mag = new double[N / 2 + 1];
        for (long start = -N / 2; ; start += HOP) {
            for (int k = 0; k < N; k++) {
                int j = (k + N / 2) % N;
                long s = start + j;
                re[k] = (s >= 0 && s < n ? x[(int) s] : 0) * WIN[j];
                im[k] = 0;
            }
            fft(re, im);
            for (int k = 0; k <= N / 2; k++) mag[k] = Math.hypot(re[k], im[k]);
            hpcp(whiten(mag, peaks(mag)), acc);
            frames++;
            if (start + N / 2 >= n) break;
        }
        double[] p = new double[12];
        double mx = 0;
        for (int k = 0; k < 12; k++) {
            p[k] = acc[k] / frames;
            mx = Math.max(mx, p[k]);
        }
        for (int k = 0; k < 12; k++) {
            p[k] = mx > 0 ? p[k] / mx : 0;
            if (p[k] < 0.2) p[k] = 0;
        }
        return key(p);
    }

    static void fft(double[] re, double[] im) {
        int n = re.length;
        for (int i = 1, j = 0; i < n; i++) {
            int b = n >> 1;
            for (; (j & b) != 0; b >>= 1) j ^= b;
            j ^= b;
            if (i < j) {
                double t = re[i];
                re[i] = re[j];
                re[j] = t;
                t = im[i];
                im[i] = im[j];
                im[j] = t;
            }
        }
        for (int len = 2; len <= n; len <<= 1) {
            double a = -2 * Math.PI / len, wr = Math.cos(a), wi = Math.sin(a);
            int h = len / 2;
            for (int i = 0; i < n; i += len) {
                double cr = 1, ci = 0;
                for (int k = 0; k < h; k++) {
                    double ur = re[i + k], ui = im[i + k];
                    double xr = re[i + k + h] * cr - im[i + k + h] * ci, xi = re[i + k + h] * ci + im[i + k + h] * cr;
                    re[i + k] = ur + xr;
                    im[i + k] = ui + xi;
                    re[i + k + h] = ur - xr;
                    im[i + k + h] = ui - xi;
                    double t = cr * wr - ci * wi;
                    ci = cr * wi + ci * wr;
                    cr = t;
                }
            }
        }
    }

    /** PeakDetection: {frequency, value} pairs, the 60 largest (ties: the lower frequency first). */
    static List<double[]> peaks(double[] mag) {
        double scale = (double) SR / N;
        int size = mag.length;
        List<double[]> out = new ArrayList<>();
        int i = (int) Math.max(0, Math.ceil(FMIN / scale));
        if (i + 1 < size && mag[i] > mag[i + 1] && mag[i] > THR) out.add(new double[]{i * scale, mag[i]});
        while (true) {
            while (i + 1 < size - 1 && mag[i] >= mag[i + 1]) i++;
            while (i + 1 < size - 1 && mag[i] < mag[i + 1]) i++;
            int j = i;
            while (j + 1 < size - 1 && mag[j] == mag[j + 1]) j++;
            if (j + 1 < size - 1 && mag[j + 1] < mag[j] && mag[j] > THR) {
                double pos, val;
                if (j != i) {
                    pos = (i + j) * 0.5;
                    val = mag[i];
                } else {
                    double L = mag[j - 1], M = mag[j], R = mag[j + 1], d = 0.5 * ((L - R) / (L - 2 * M + R));
                    pos = j + d;
                    val = M - 0.25 * (L - R) * d;
                }
                if (pos * scale > FMAX) break;
                out.add(new double[]{pos * scale, val});
            }
            i = j;
            if (i + 1 >= size - 1) break;
        }
        out.sort((a, b) -> a[1] != b[1] ? Double.compare(b[1], a[1]) : Double.compare(a[0], b[0]));
        return out.size() > MAXPEAKS ? new ArrayList<>(out.subList(0, MAXPEAKS)) : out;
    }

    private static double lin2db(double x) {
        return x < 1e-10 ? -100 : 10 * Math.log10(x);
    }

    /** SpectralWhitening (maxFrequency 3500 raised to 4200): each peak's value whitened. */
    static List<double[]> whiten(double[] spec, List<double[]> pk) {
        double maxFreq = FMAX * 1.2, range = SR / 2.0;
        int S = spec.length;
        List<Double> xs = new ArrayList<>(), ys = new ArrayList<>();
        for (double f = 0; f <= maxFreq && f <= range; f += 100) {
            double bf = f - Math.max(50, f * 0.34), ef = f + Math.max(50, f * 0.58);
            int b = (int) (bf / range * (S - 1) + 0.5);
            b = Math.min(S - 1, Math.max(0, b));
            int e = (int) (ef / range * (S - 1) + 0.5);
            e = Math.min(S, Math.max(e, b + 1));
            double c = b / 2.0 + e / 2.0, hw = e - c, wavg = 0, cnt = 0;
            for (int i = b; i < e; i++) {
                double w = 1 - Math.abs(i - c) / hw;
                w *= w;
                w *= w;
                double en = spec[i] * spec[i];
                w *= en;
                wavg += en * w;
                cnt += w;
            }
            if (cnt != 0) wavg /= cnt;
            xs.add(f);
            ys.add(wavg);
        }
        int m = ys.size();
        ys.set(m - 1, ys.get(m - 2));
        double[] X = new double[m], Y = new double[m];
        for (int k = 0; k < m; k++) {
            X[k] = xs.get(k);
            Y[k] = 2 * lin2db(Math.sqrt(ys.get(k)));
        }
        List<double[]> out = new ArrayList<>(pk.size());
        for (double[] p : pk) {
            double f = p[0], amp = 2 * lin2db(p[1]), w;
            if (f > maxFreq - 100) w = amp;
            else {
                int k = Math.min(m - 2, (int) Math.floor(f / 100));
                double t = (f - X[k]) / (X[k + 1] - X[k]), ae = Y[k] + t * (Y[k + 1] - Y[k]);
                w = amp > ae ? 0 : amp > ae - 30 ? amp - ae : -200;
                w -= 20 * f / 4000;
            }
            out.add(new double[]{f, Math.pow(10, w / 2 / 10)});
        }
        return out;
    }

    /** HPCP: 12 bins from A 440, cosine weighting over a semitone, 4 harmonics; added into [h]. */
    static void hpcp(List<double[]> pk, double[] h) {
        for (double[] p : pk) {
            double f0 = p[0], m = p[1];
            if (f0 < FMIN || f0 > FMAX) continue;
            for (double[] hw : HARM) {
                double f = f0 * Math.pow(2, -hw[0] / 12), bin = log2(f / 440) * 12, w = hw[1];
                for (int i = (int) Math.ceil(bin - 0.5); i <= (int) Math.floor(bin + 0.5); i++) {
                    double d = Math.abs(bin - i);
                    h[((i % 12) + 12) % 12] += Math.cos(Math.PI * d) * m * m * w * w;
                }
            }
        }
    }

    private static double[] meanSd(double[] v) {
        double m = 0;
        for (double x : v) m += x;
        m /= 12;
        double s = 0;
        for (double x : v) s += (x - m) * (x - m);
        return new double[]{m, Math.sqrt(s)};
    }

    /** Key (profile "bgate"): the best-correlated table and shift; a tie is minor. */
    static Key key(double[] p) {
        double[] ps = meanSd(p);
        double[][] best = new double[2][];
        double[][] tables = {MAJ, MIN};
        for (int t = 0; t < 2; t++) {
            double[] ts = meanSd(tables[t]);
            double mx = -1;
            int at = 0;
            for (int sh = 0; sh < 12; sh++) {
                double r = 0;
                if (ps[1] != 0 && ts[1] != 0) {
                    for (int i = 0; i < 12; i++) r += (p[i] - ps[0]) * (tables[t][((i - sh) % 12 + 12) % 12] - ts[0]);
                    r /= ps[1] * ts[1];
                }
                if (r > mx) {
                    mx = r;
                    at = sh;
                }
            }
            best[t] = new double[]{mx, at};
        }
        return best[0][0] > best[1][0]
                ? new Key(NOTES[(int) best[0][1]] + " major", best[0][0])
                : new Key(NOTES[(int) best[1][1]] + " minor", best[1][0]);
    }
}
