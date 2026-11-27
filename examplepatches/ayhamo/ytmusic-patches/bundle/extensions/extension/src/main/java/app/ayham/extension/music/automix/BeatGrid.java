package app.ayham.extension.music.automix;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

/**
 * The analysis maths the extension runs in its host page, from BitChord web (models.ts pickPeaks /
 * tempoFromBeats / gridConfidence, beatgrid.ts fitGrid / normalizeTempo, analysis.worker.ts
 * localGrid, energy.ts, camelot.ts) and the extension's host.js contentEnd. Pure Java.
 */
public final class BeatGrid {
    private BeatGrid() {
    }

    public static final double BEAT_FPS = 50;
    static final int PEAK_WINDOW = 7;
    static final int MIN_BEATS = 8;

    /** Local maxima over seven frames with a positive logit, ties collapsed, refined by a parabola. */
    public static double[] pickPeaks(float[] logits) {
        int half = PEAK_WINDOW >> 1;
        List<Integer> peaks = new ArrayList<>();
        for (int i = 0; i < logits.length; i++) {
            if (logits[i] <= 0) continue;
            boolean max = true;
            for (int o = -half; o <= half && max; o++) {
                int n = i + o;
                if (n >= 0 && n < logits.length && logits[n] > logits[i]) max = false;
            }
            if (max) peaks.add(i);
        }
        List<Integer> deduped = new ArrayList<>();
        for (int i = 0; i < peaks.size(); i++) {
            double mean = peaks.get(i);
            int count = 1;
            while (i + 1 < peaks.size() && peaks.get(i + 1) - mean <= 1) {
                i++;
                count++;
                mean += (peaks.get(i) - mean) / count;
            }
            deduped.add((int) Math.round(mean));
        }
        double[] out = new double[deduped.size()];
        for (int k = 0; k < out.length; k++) {
            int f = deduped.get(k);
            if (f <= 0 || f + 1 >= logits.length) {
                out[k] = f;
                continue;
            }
            double l = logits[f - 1], c = logits[f], r = logits[f + 1], d = l - 2 * c + r;
            out[k] = Math.abs(d) <= 1e-9 ? f : f + Math.max(-0.5, Math.min(0.5, (0.5 * (l - r)) / d));
        }
        return out;
    }

    static double median(double[] v) {
        if (v.length == 0) return 0;
        double[] s = v.clone();
        Arrays.sort(s);
        return s[s.length >> 1];
    }

    static double[] gaps(double[] beats) {
        double[] g = new double[Math.max(0, beats.length - 1)];
        for (int i = 0; i < g.length; i++) g[i] = beats[i + 1] - beats[i];
        return g;
    }

    public static double tempoFromBeats(double[] beats) {
        if (beats.length < MIN_BEATS) return 0;
        double[] gaps = gaps(beats);
        double rough = median(gaps);
        if (rough <= 0) return 0;
        int n = 0;
        for (double g : gaps) if (Math.abs(g - rough) <= rough * 0.2) n++;
        double[] kept = new double[n];
        n = 0;
        for (double g : gaps) if (Math.abs(g - rough) <= rough * 0.2) kept[n++] = g;
        double interval = median(kept.length >= 4 ? kept : gaps);
        if (interval <= 0) return 0;
        double bpm = 60 / interval;
        return bpm >= 40 && bpm <= 220 ? bpm : 0;
    }

    /** Regularity of the spacing and decisiveness of the peaks, capped at 0.95 (BeatTracker.gridConfidence). */
    public static double gridConfidence(double[] beats, double[] peakLogits) {
        if (beats.length < MIN_BEATS) return 0;
        double[] gaps = gaps(beats);
        double interval = median(gaps);
        if (interval <= 0) return 0;
        int regular = 0;
        for (double g : gaps) if (Math.abs(g - interval) <= interval * 0.1) regular++;
        double strength = 1 / (1 + Math.exp(-(median(peakLogits) - 0.5)));
        return Math.max(0, Math.min(0.95, 0.35 + 0.4 * regular / gaps.length + 0.25 * strength));
    }

    /** models.ts trackBeats after the model: beats and downbeats (song seconds) from the two logit tracks. */
    public static Analysis.BeatSide trackBeats(float[] beatLogits, float[] downLogits, double offsetSec) {
        double[] beatFrames = pickPeaks(beatLogits);
        double[] beats = new double[beatFrames.length];
        for (int i = 0; i < beats.length; i++) beats[i] = beatFrames[i] / BEAT_FPS + offsetSec;
        if (beats.length < MIN_BEATS) return null;
        double bpm = tempoFromBeats(beats);
        if (bpm <= 0) return null;
        double[] downFrames = pickPeaks(downLogits);
        java.util.TreeSet<Double> downs = new java.util.TreeSet<>();
        for (double f : downFrames) {
            double t = f / BEAT_FPS + offsetSec, best = beats[0];
            for (double b : beats) if (Math.abs(b - t) < Math.abs(best - t)) best = b;
            downs.add(best);
        }
        double[] peakLogits = new double[beatFrames.length];
        for (int i = 0; i < peakLogits.length; i++) {
            int f = (int) Math.round(beatFrames[i]);
            peakLogits[i] = f >= 0 && f < beatLogits.length ? beatLogits[f] : 0;
        }
        Analysis.BeatSide s = new Analysis.BeatSide();
        s.beats = beats;
        s.downbeats = new double[downs.size()];
        int k = 0;
        for (double d : downs) s.downbeats[k++] = d;
        s.bpm = bpm;
        s.confidence = gridConfidence(beats, peakLogits);
        return s;
    }

    /** beatgrid.ts fitGrid: the beat period on which the ticks' phases line up best; {interval, offset} or null. */
    public static double[] fitGrid(double[] ticks) {
        int n = ticks.length;
        if (n < 8) return null;
        double[] g = gaps(ticks);
        Arrays.sort(g);
        double median = g[g.length >> 1];
        if (!(median > 0)) return null;
        double[] best = {median, -1, 0}; // interval, coherence, phase
        scan(ticks, median * 0.96, median * 1.04, 400, best);
        double step = best[0] * 0.0002;
        scan(ticks, best[0] - step, best[0] + step, 40, best);
        double interval = best[0];
        double offset = ((((best[2] / (2 * Math.PI)) % 1) + 1) % 1) * interval;
        return new double[]{interval, offset};
    }

    private static void scan(double[] ticks, double lo, double hi, int steps, double[] best) {
        int n = ticks.length;
        for (int k = 0; k <= steps; k++) {
            double interval = lo + ((hi - lo) * k) / steps;
            double c = 0, s = 0;
            for (double t : ticks) {
                double a = (2 * Math.PI * t) / interval;
                c += Math.cos(a);
                s += Math.sin(a);
            }
            double coherence = Math.hypot(c, s) / n;
            if (coherence > best[1]) {
                best[0] = interval;
                best[1] = coherence;
                best[2] = Math.atan2(s, c);
            }
        }
    }

    /** normalizeTempo: the beat interval folded into 70-180 BPM. */
    static double normalizeInterval(double beatIntervalSec) {
        // no tempo to fold (0, negative, NaN, infinite): the loops below would never end
        if (!(beatIntervalSec > 0) || Double.isInfinite(beatIntervalSec)) return beatIntervalSec;
        double bpm = 60 / beatIntervalSec;
        while (bpm < 70) {
            bpm *= 2;
            beatIntervalSec /= 2;
        }
        while (bpm > 180) {
            bpm /= 2;
            beatIntervalSec *= 2;
        }
        return beatIntervalSec;
    }

    /** analysis.worker.ts localGrid: a model grid as AutoMix's constant grid (confidence 0.35-0.95 onto 0-1). */
    public static Analysis.LocalGrid localGrid(Analysis.BeatSide side) {
        double[] fit = fitGrid(side.beats);
        double beatIntervalSec = fit != null ? normalizeInterval(fit[0]) : 60 / side.bpm;
        Analysis.LocalGrid g = new Analysis.LocalGrid();
        g.bpm = 60 / beatIntervalSec;
        g.beatIntervalSec = beatIntervalSec;
        g.firstDownbeatSec = side.downbeats.length > 0 ? side.downbeats[0] : side.beats[0];
        g.gridConfidence = Math.max(0, Math.min(1, (side.confidence - 0.35) / 0.6));
        return g;
    }

    // ---- energy.ts ----

    /** Mono PCM, however it is stored. */
    public interface Samples {
        int length();

        float get(int i);
    }

    public static Samples of(float[] a) {
        return new Samples() {
            public int length() {
                return a.length;
            }

            public float get(int i) {
                return a[i];
            }
        };
    }

    public static Samples of(short[] a, int length) {
        return new Samples() {
            public int length() {
                return length;
            }

            public float get(int i) {
                return a[i] / 32768f;
            }
        };
    }

    /** Per-window RMS (normalized to peak = 1) of mono PCM. */
    public static double[] energyCurve(Samples samples, double sampleRate, double windowSec) {
        int win = (int) Math.max(1, Math.round(windowSec * sampleRate));
        int len = samples.length();
        int n = (len + win - 1) / win;
        double[] curve = new double[n];
        double peak = 1e-9;
        for (int w = 0; w < n; w++) {
            int start = w * win, end = Math.min(len, start + win);
            double acc = 0;
            for (int i = start; i < end; i++) {
                float x = samples.get(i);
                acc += x * x;
            }
            curve[w] = Math.sqrt(acc / (end - start));
            peak = Math.max(peak, curve[w]);
        }
        for (int w = 0; w < n; w++) curve[w] /= peak;
        return curve;
    }

    /** {introEndSec, outroStartSec}: full energy is two windows in a row at 60% of the peak or more. */
    public static double[] introOutro(double[] curve, double windowSec, double durationSec) {
        final double THRESH = 0.6;
        double introEnd = 0;
        for (int i = 0; i < curve.length - 1; i++) {
            if (curve[i] >= THRESH && curve[i + 1] >= THRESH) {
                introEnd = i * windowSec;
                break;
            }
        }
        double outroStart = durationSec;
        for (int i = curve.length - 2; i >= 0; i--) {
            if (curve[i] >= THRESH && curve[i + 1] >= THRESH) {
                outroStart = Math.min(durationSec, (i + 2) * windowSec);
                break;
            }
        }
        return new double[]{Math.min(introEnd, durationSec / 3), Math.max(outroStart, durationSec / 2)};
    }

    /**
     * host.js contentEnd (BitChord phone audio_analysis.cpp): where the music ends, from RMS in 0.25 s
     * windows; NaN when unmeasurable.
     */
    public static double contentEnd(Samples mono, double sr) {
        int win = (int) Math.round(0.25 * sr);
        int n = mono.length() / win;
        if (n < 12) return Double.NaN;
        float[] env = new float[n];
        for (int w = 0; w < n; w++) {
            double ss = 0;
            int c = 0;
            for (int i = w * win, e = i + win; i < e; i += 4) {
                double x = mono.get(i);
                ss += x * x;
                c++;
            }
            env[w] = (float) Math.sqrt(ss / c);
        }
        float[] sorted = env.clone();
        Arrays.sort(sorted);
        double ref = sorted[(int) Math.floor(n * 0.85)], noise = sorted[(int) Math.floor(n * 0.05)];
        if (!(ref > 0)) return Double.NaN;
        double thr = Math.max(0.0025, Math.max(Math.min(noise * 2.6, ref * 0.28), ref * 0.1));
        double silence = Math.max(0.0015, Math.min(thr * 0.25, ref * 0.04));
        int w = n;
        while (w > 0 && env[w - 1] < silence) w--;
        if ((n - w) * 0.25 >= 0.35) return w * 0.25;
        for (int b = n - 6; b >= 0; b--) {
            int on = 0;
            double sum = 0;
            for (int k = b; k < b + 6; k++) {
                if (env[k] >= thr) on++;
                sum += env[k];
            }
            if (on >= 3 && sum / 6 >= 0.85 * thr) return (b + 6) * 0.25;
        }
        return Double.NaN;
    }

    // ---- camelot.ts ----

    private static final Map<String, Integer> MAJOR = new HashMap<>(), MINOR = new HashMap<>();

    static {
        Object[] major = {"C", 8, "G", 9, "D", 10, "A", 11, "E", 12, "B", 1, "F#", 2, "Gb", 2, "C#", 3, "Db", 3, "G#", 4, "Ab", 4,
                "D#", 5, "Eb", 5, "A#", 6, "Bb", 6, "F", 7};
        Object[] minor = {"A", 8, "E", 9, "B", 10, "F#", 11, "Gb", 11, "C#", 12, "Db", 12, "G#", 1, "Ab", 1, "D#", 2, "Eb", 2,
                "A#", 3, "Bb", 3, "F", 4, "C", 5, "G", 6, "D", 7};
        for (int i = 0; i < major.length; i += 2) MAJOR.put((String) major[i], (Integer) major[i + 1]);
        for (int i = 0; i < minor.length; i += 2) MINOR.put((String) minor[i], (Integer) minor[i + 1]);
    }

    /** A key name such as "E♭ minor" or "F# major" into the analysis' Camelot fields; false if unknown. */
    public static boolean camelot(String keyName, Analysis a) {
        if (keyName == null) return false;
        String[] parts = keyName.trim().replace('♯', '#').replace('♭', 'b').split("\\s+");
        if (parts.length < 2) return false;
        boolean major = parts[1].toLowerCase().startsWith("maj");
        Integer num = (major ? MAJOR : MINOR).get(parts[0]);
        if (num == null) return false;
        a.camelotNum = num;
        a.camelotLetter = major ? 'B' : 'A';
        return true;
    }
}
