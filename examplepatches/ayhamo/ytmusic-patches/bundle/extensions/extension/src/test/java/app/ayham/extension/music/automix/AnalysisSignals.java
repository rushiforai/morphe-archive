package app.ayham.extension.music.automix;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * The synthetic songs of spec/automix/analysis-cases.md, rendered sample by sample at any rate: a
 * line-by-line port of the extension's scripts/analysis_signals.mjs. Doubles everywhere as in JS,
 * StrictMath (fdlibm, as V8's Math) for sin / exp / pow, and each sample rounded to float when it is
 * stored, as a Float32Array does. AnalysisSignalsTest holds the JS renderer's checksums.
 */
final class AnalysisSignals {
    private AnalysisSignals() {
    }

    /** mulberry32, the noise generator (spec/addons/offset-map.md uses the same one). */
    static final class Mulberry32 {
        private int a;

        Mulberry32(long seed) {
            a = (int) seed;
        }

        double next() {
            a += 0x6d2b79f5;
            int t = a;
            t = (t ^ (t >>> 15)) * (t | 1);
            t ^= t + (t ^ (t >>> 7)) * (t | 61);
            return ((t ^ (t >>> 14)) & 0xffffffffL) / 4294967296.0;
        }
    }

    /** A song of analysis-cases.json ("song"). */
    static final class Song {
        double sec;
        String kit;
        long seed = 1;
        final List<double[]> parts = new ArrayList<>(); // {from, bpm}
        final List<double[]> voice = new ArrayList<>(); // {from, to}
        int[] pad;

        @SuppressWarnings("unchecked")
        static Song of(Map<String, Object> m) {
            Song s = new Song();
            s.sec = ((Number) m.get("sec")).doubleValue();
            s.kit = (String) m.get("kit");
            if (m.get("seed") instanceof Number) s.seed = ((Number) m.get("seed")).longValue();
            for (Object p : (List<Object>) m.get("parts")) {
                Map<String, Object> pm = (Map<String, Object>) p;
                s.parts.add(new double[]{((Number) pm.get("from")).doubleValue(), ((Number) pm.get("bpm")).doubleValue()});
            }
            if (m.get("voice") != null) for (Object v : (List<Object>) m.get("voice")) {
                List<Object> l = (List<Object>) v;
                s.voice.add(new double[]{((Number) l.get(0)).doubleValue(), ((Number) l.get(1)).doubleValue()});
            }
            if (m.get("pad") != null) {
                List<Object> l = (List<Object>) m.get("pad");
                s.pad = new int[l.size()];
                for (int i = 0; i < s.pad.length; i++) s.pad[i] = ((Number) l.get(i)).intValue();
            }
            return s;
        }
    }

    /** A beat of the truth: its time, its place in the bar (0 = the bar's start), its part's tempo. */
    static final class Beat {
        final double t, bpm;
        final int beatInBar;

        Beat(double t, int beatInBar, double bpm) {
            this.t = t;
            this.beatInBar = beatInBar;
            this.bpm = bpm;
        }
    }

    /** The beat times of a song: its parts, each running until the next (or the end). */
    static List<Beat> beatTimes(Song song) {
        List<Beat> out = new ArrayList<>();
        for (int k = 0; k < song.parts.size(); k++) {
            double[] p = song.parts.get(k);
            double end = k + 1 < song.parts.size() ? song.parts.get(k + 1)[0] : song.sec;
            double period = 60 / p[1];
            for (int n = 0; ; n++) {
                double t = p[0] + n * period;
                if (t >= end - 1e-9) break;
                out.add(new Beat(t, n % 4, p[1]));
            }
        }
        return out;
    }

    private static long round(double x) {
        return Math.round(x); // floor(x + 0.5), as JS Math.round
    }

    /** One drum hit added into x at time t (seconds). */
    private static void hit(float[] x, double sr, double t, String kind, Mulberry32 rnd) {
        long i0 = round(t * sr);
        int len = x.length;
        switch (kind) {
            case "click":
            case "accent": {
                // a 30 ms sine blip, 1000 Hz (1500 Hz accented), 8 ms decay, peak 0.5
                double f = kind.equals("accent") ? 1500 : 1000;
                for (int i = 0; i < 0.03 * sr && i0 + i < len; i++)
                    x[(int) (i0 + i)] += 0.5 * StrictMath.sin(2 * Math.PI * f * i / sr) * StrictMath.exp(-i / (0.008 * sr));
                break;
            }
            case "kick": {
                // 150 ms, the pitch falling 150 -> 50 Hz (40 ms time constant), 60 ms decay, peak 0.9
                double ph = 0;
                for (int i = 0; i < 0.15 * sr && i0 + i < len; i++) {
                    double s = i / sr, f = 50 + 100 * StrictMath.exp(-s / 0.04);
                    ph += 2 * Math.PI * f / sr;
                    x[(int) (i0 + i)] += 0.9 * StrictMath.sin(ph) * StrictMath.exp(-s / 0.06);
                }
                break;
            }
            case "snare": {
                // 120 ms of noise (uniform -1..1) plus 190 Hz, 40 ms decay, peak 0.5
                for (int i = 0; i < 0.12 * sr && i0 + i < len; i++) {
                    double s = i / sr;
                    x[(int) (i0 + i)] += 0.5 * StrictMath.exp(-s / 0.04) * (0.7 * (rnd.next() * 2 - 1) + 0.3 * StrictMath.sin(2 * Math.PI * 190 * s));
                }
                break;
            }
            case "crash": {
                // the bar marker: 600 ms of first-difference noise, 150 ms decay, peak 0.3
                double prev = 0;
                for (int i = 0; i < 0.6 * sr && i0 + i < len; i++) {
                    double n = rnd.next() * 2 - 1;
                    x[(int) (i0 + i)] += 0.3 * StrictMath.exp(-i / sr / 0.15) * (n - prev) / 2;
                    prev = n;
                }
                break;
            }
            case "hat": {
                // 30 ms of noise, first-difference high-passed, 8 ms decay, peak 0.15
                double prev = 0;
                for (int i = 0; i < 0.03 * sr && i0 + i < len; i++) {
                    double n = rnd.next() * 2 - 1;
                    x[(int) (i0 + i)] += 0.15 * StrictMath.exp(-i / sr / 0.008) * (n - prev) / 2;
                    prev = n;
                }
                break;
            }
            default:
                throw new IllegalArgumentException(kind);
        }
    }

    /**
     * A voice-like tone: 220 Hz with 8 harmonics (amplitude 1/h), 5.5 Hz vibrato of +-2%, a 4 Hz
     * syllable envelope (0.3 + 0.7 * max(0, sin)), peak about 0.25.
     */
    private static void voice(float[] x, double sr, double from, double to) {
        double ph = 0;
        for (long i = round(from * sr); i < Math.min(x.length, round(to * sr)); i++) {
            double s = i / sr, f = 220 * (1 + 0.02 * StrictMath.sin(2 * Math.PI * 5.5 * s));
            ph += 2 * Math.PI * f / sr;
            double v = 0;
            for (int h = 1; h <= 8; h++) v += StrictMath.sin(h * ph) / h;
            x[(int) i] += 0.1 * v * (0.3 + 0.7 * Math.max(0, StrictMath.sin(2 * Math.PI * 4 * s)));
        }
    }

    /** A sustained chord over the whole song: MIDI notes (A4 = 69 = 440 Hz), each a sine at 0.06 with its octave at 0.03. */
    private static void pad(float[] x, double sr, int[] notes) {
        double[] fs = new double[notes.length];
        for (int k = 0; k < notes.length; k++) fs[k] = 440 * StrictMath.pow(2, (notes[k] - 69) / 12.0);
        for (int i = 0; i < x.length; i++) {
            double v = 0;
            for (double f : fs) v += 0.06 * StrictMath.sin(2 * Math.PI * f * i / sr) + 0.03 * StrictMath.sin(4 * Math.PI * f * i / sr);
            x[i] += v;
        }
    }

    /** A song at sample rate sr, mono. */
    static float[] render(Song song, double sr) {
        float[] x = new float[(int) round(song.sec * sr)];
        Mulberry32 rnd = new Mulberry32(song.seed);
        for (Beat b : beatTimes(song)) {
            if (song.kit.equals("click")) hit(x, sr, b.t, b.beatInBar == 0 ? "accent" : "click", rnd);
            else {
                // kick and a crash on 1, a kick on the half beat after 3, snare on 2 and 4, hats on every half beat
                double half = 30 / b.bpm;
                if (b.beatInBar == 0) {
                    hit(x, sr, b.t, "kick", rnd);
                    hit(x, sr, b.t, "crash", rnd);
                }
                if (b.beatInBar == 2) hit(x, sr, b.t + half, "kick", rnd);
                if (b.beatInBar == 1 || b.beatInBar == 3) hit(x, sr, b.t, "snare", rnd);
                hit(x, sr, b.t, "hat", rnd);
                hit(x, sr, b.t + half, "hat", rnd);
            }
        }
        for (double[] v : song.voice) voice(x, sr, v[0], v[1]);
        if (song.pad != null) pad(x, sr, song.pad);
        return x;
    }

    /**
     * analysis_signals.mjs half (analysis-cases.md §4): the beat model's 22050 Hz input from the 44100 Hz
     * render. h[n] = 2fc·sinc(2fc·n)·Blackman(n), n = -64..64, fc = 0.23, scaled to sum to 1;
     * y[k] = Σ h[n]·x[2k + n] (0 outside), summed in doubles over n in order, stored as float;
     * floor(x.length / 2) samples. For the synthetic songs only: the phone's decode resamples real ones.
     */
    static float[] half(float[] x) {
        final int N = 64;
        final double fc = 0.23;
        double[] h = new double[2 * N + 1];
        double sum = 0;
        for (int n = -N; n <= N; n++) {
            double a = 2 * fc * n, sinc = n == 0 ? 1 : StrictMath.sin(Math.PI * a) / (Math.PI * a);
            double w = 0.42 + 0.5 * StrictMath.cos(Math.PI * n / N) + 0.08 * StrictMath.cos(2 * Math.PI * n / N);
            h[n + N] = 2 * fc * sinc * w;
            sum += h[n + N];
        }
        for (int i = 0; i < h.length; i++) h[i] /= sum;
        float[] y = new float[x.length / 2];
        for (int k = 0; k < y.length; k++) {
            double v = 0;
            int c = 2 * k;
            for (int n = -N; n <= N; n++) {
                int i = c + n;
                if (i >= 0 && i < x.length) v += h[n + N] * x[i];
            }
            y[k] = (float) v;
        }
        return y;
    }
}
