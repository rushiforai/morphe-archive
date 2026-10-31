package app.bitchord.telegram;

import java.util.*;

/**
 * Audio fingerprints in the style of the published Shazam method: the loudest points of a
 * spectrogram, paired into small hashes of two frequencies and the time between them. Two
 * recordings match when many hashes agree on the same time offset between them; a different
 * recording, or a different performance of the same song, shares only scattered coincidences.
 *
 * <p>It says whether two copies are the same recording. It doesn't say they're the same quality.
 */
final class Fingerprint {
    static final int RATE = 8000, WINDOW = 1024, HOP = 256;

    /** Seconds per spectrogram frame. */
    static final double FRAME = HOP / (double) RATE;

    private static final int LOW_BIN = 8, HIGH_BIN = 400; // about 60 Hz to 3.1 kHz
    private static final int PEAK_TIME = 4, PEAK_FREQ = 8, PEAKS_PER_FRAME = 6;
    private static final int FAN_OUT = 4, MAX_DT = 48, MAX_DF = 63;

    /** Hashes and the frame each starts at, in frame order. */
    final int[] hashes, times;

    private Fingerprint(int[] hashes, int[] times) {
        this.hashes = hashes;
        this.times = times;
    }

    int size() {
        return hashes.length;
    }

    /** A fingerprint of mono samples at the given rate. */
    static Fingerprint of(float[] samples, int length, int rate) {
        float[] audio = resample(samples, length, rate);
        float[][] spectrum = spectrogram(audio);
        List<int[]> peaks = peaks(spectrum);
        return pair(peaks);
    }

    /** Mono at 8 kHz, low-passed first so what's above 4 kHz doesn't fold down into it. */
    static float[] resample(float[] in, int length, int rate) {
        if (rate == RATE) return Arrays.copyOf(in, length);
        double step = rate / (double) RATE;
        int out = (int) (length / step);
        float[] result = new float[Math.max(0, out)];
        // Windowed sinc at 3.6 kHz, evaluated only where an output sample falls.
        double cutoff = 3600.0 / rate;
        int half = (int) Math.ceil(4 / cutoff / 2) * 2;
        half = Math.min(half, 16);
        for (int n = 0; n < out; n++) {
            double centre = n * step;
            int first = (int) Math.floor(centre) - half + 1, last = (int) Math.floor(centre) + half;
            double sum = 0, weight = 0;
            for (int i = Math.max(0, first); i <= Math.min(length - 1, last); i++) {
                double x = i - centre;
                double sinc =
                        x == 0 ? 2 * cutoff : Math.sin(2 * Math.PI * cutoff * x) / (Math.PI * x);
                double window = 0.5 + 0.5 * Math.cos(Math.PI * x / (half + 1));
                double w = sinc * window;
                sum += in[i] * w;
                weight += w;
            }
            result[n] = weight == 0 ? 0 : (float) (sum / weight);
        }
        return result;
    }

    /** Log magnitudes, one row per frame, Hann-windowed. */
    static float[][] spectrogram(float[] audio) {
        int frames = audio.length < WINDOW ? 0 : 1 + (audio.length - WINDOW) / HOP;
        float[][] rows = new float[frames][];
        double[] re = new double[WINDOW], im = new double[WINDOW], hann = new double[WINDOW];
        for (int i = 0; i < WINDOW; i++) hann[i] = 0.5 - 0.5 * Math.cos(2 * Math.PI * i / WINDOW);
        for (int t = 0; t < frames; t++) {
            for (int i = 0; i < WINDOW; i++) {
                re[i] = audio[t * HOP + i] * hann[i];
                im[i] = 0;
            }
            fft(re, im);
            float[] row = new float[WINDOW / 2];
            for (int f = 0; f < row.length; f++)
                row[f] = (float) Math.log(1e-9 + re[f] * re[f] + im[f] * im[f]);
            rows[t] = row;
        }
        return rows;
    }

    /** In-place radix-2 FFT. */
    static void fft(double[] re, double[] im) {
        int n = re.length;
        for (int i = 1, j = 0; i < n; i++) {
            int bit = n >> 1;
            for (; (j & bit) != 0; bit >>= 1) j ^= bit;
            j ^= bit;
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
            double angle = -2 * Math.PI / len;
            double wr = Math.cos(angle), wi = Math.sin(angle);
            for (int i = 0; i < n; i += len) {
                double cr = 1, ci = 0;
                for (int k = 0; k < len / 2; k++) {
                    int a = i + k, b = a + len / 2;
                    double xr = re[b] * cr - im[b] * ci, xi = re[b] * ci + im[b] * cr;
                    re[b] = re[a] - xr;
                    im[b] = im[a] - xi;
                    re[a] += xr;
                    im[a] += xi;
                    double next = cr * wr - ci * wi;
                    ci = cr * wi + ci * wr;
                    cr = next;
                }
            }
        }
    }

    /**
     * Points louder than everything near them in time and frequency, and clearly above the frame's
     * average: {frame, bin}. At most a few per frame, the loudest.
     */
    static List<int[]> peaks(float[][] spectrum) {
        List<int[]> peaks = new ArrayList<>();
        for (int t = 0; t < spectrum.length; t++) {
            float[] row = spectrum[t];
            double mean = 0;
            for (int f = LOW_BIN; f < HIGH_BIN; f++) mean += row[f];
            mean /= HIGH_BIN - LOW_BIN;
            List<int[]> frame = new ArrayList<>();
            for (int f = LOW_BIN; f < HIGH_BIN; f++) {
                float v = row[f];
                if (v < mean + 2) continue;
                boolean top = true;
                for (int dt = -PEAK_TIME; dt <= PEAK_TIME && top; dt++) {
                    int tt = t + dt;
                    if (tt < 0 || tt >= spectrum.length) continue;
                    for (int df = -PEAK_FREQ; df <= PEAK_FREQ; df++) {
                        int ff = f + df;
                        if (ff < LOW_BIN || ff >= HIGH_BIN || (dt == 0 && df == 0)) continue;
                        if (spectrum[tt][ff] > v || (spectrum[tt][ff] == v && (dt < 0 || df < 0))) {
                            top = false;
                            break;
                        }
                    }
                }
                if (top) frame.add(new int[] {t, f});
            }
            frame.sort((a, b) -> Float.compare(row[b[1]], row[a[1]]));
            peaks.addAll(frame.subList(0, Math.min(PEAKS_PER_FRAME, frame.size())));
        }
        peaks.sort(
                (a, b) -> a[0] != b[0] ? Integer.compare(a[0], b[0]) : Integer.compare(a[1], b[1]));
        return peaks;
    }

    /** Each peak paired with the next few after it: frequency, frequency change, time gap. */
    static Fingerprint pair(List<int[]> peaks) {
        int[] hashes = new int[peaks.size() * FAN_OUT], times = new int[hashes.length];
        int n = 0;
        for (int i = 0; i < peaks.size(); i++) {
            int[] a = peaks.get(i);
            int paired = 0;
            for (int j = i + 1; j < peaks.size() && paired < FAN_OUT; j++) {
                int[] b = peaks.get(j);
                int dt = b[0] - a[0];
                if (dt == 0) continue;
                if (dt > MAX_DT) break;
                int df = b[1] - a[1];
                if (Math.abs(df) > MAX_DF) continue;
                hashes[n] = a[1] << 13 | (df + MAX_DF) << 6 | dt;
                times[n] = a[0];
                n++;
                paired++;
            }
        }
        return new Fingerprint(Arrays.copyOf(hashes, n), Arrays.copyOf(times, n));
    }

    /** How well a short excerpt matches a reference. */
    static final class Match {
        /** Hashes that agree on the best offset. */
        final int score;

        /** Where the excerpt starts in the reference, in seconds. */
        final double offset;

        /** Hashes in the excerpt. */
        final int size;

        Match(int score, double offset, int size) {
            this.score = score;
            this.offset = offset;
            this.size = size;
        }

        /**
         * Same recording: plenty of hashes line up on one offset. Measured on test tunes, the same
         * recording through a lossy stream lines up 36-89% of its hashes, the same notes played
         * 3-6% faster or slower 4-11%, and unrelated music under 3%.
         */
        boolean same() {
            return score >= MIN_SCORE && score >= size * MIN_SHARE;
        }

        @Override
        public String toString() {
            return String.format(Locale.US, "%d of %d hashes at %.2f s", score, size, offset);
        }
    }

    static final int MIN_SCORE = 50;
    static final double MIN_SHARE = 0.12;

    /** Finds the offset where the most of {@code excerpt}'s hashes appear in {@code reference}. */
    static Match match(Fingerprint reference, Fingerprint excerpt) {
        Map<Integer, List<Integer>> index = new HashMap<>();
        for (int i = 0; i < reference.hashes.length; i++)
            index.computeIfAbsent(reference.hashes[i], h -> new ArrayList<>())
                    .add(reference.times[i]);
        Map<Integer, Integer> offsets = new HashMap<>();
        for (int i = 0; i < excerpt.hashes.length; i++) {
            List<Integer> at = index.get(excerpt.hashes[i]);
            if (at == null) continue;
            for (int t : at) offsets.merge(t - excerpt.times[i], 1, Integer::sum);
        }
        int best = 0, bestOffset = 0;
        for (Map.Entry<Integer, Integer> e : offsets.entrySet()) {
            int o = e.getKey();
            // Neighbouring offsets count too: frames don't line up exactly between two encodings.
            int score =
                    e.getValue() + offsets.getOrDefault(o - 1, 0) + offsets.getOrDefault(o + 1, 0);
            if (score > best || (score == best && o < bestOffset)) {
                best = score;
                bestOffset = o;
            }
        }
        return new Match(best, bestOffset * FRAME, excerpt.size());
    }
}
