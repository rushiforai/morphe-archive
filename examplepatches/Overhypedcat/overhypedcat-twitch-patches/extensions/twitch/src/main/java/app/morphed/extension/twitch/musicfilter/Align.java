package app.morphed.extension.twitch.musicfilter;

import java.util.List;

/**
 * Where in a song a stretch of the stream is (a port of Mor Assistant's align.py; same thresholds and steps).
 * <p>
 * The stream is compared with the whole song at every position, at a sixth of the sample rate for speed, then
 * pinned to the exact sample at full rate. A match has to stand far above how alike the stream and the song look
 * everywhere else, so a different recording of the same song (a remaster, a live version, a cover) isn't taken
 * for it.
 */
public final class Align {
    static final int STEP = 6; // 48 kHz to 8 kHz
    static final int LOWPASS = 63; // taps of the filter before dropping samples
    static final int WHITEN = 64; // bins the loudness of each pitch is averaged over
    public static final double SURE = 14.0; // how far a match has to stand above the rest (robust z-score)
    public static final double STILL_SURE = 6.0; // confirming the song is still where it was
    public static final int REACH = 256; // samples either side of where it should be that still count as there
    static final double ALIKE = 0.8; // places scoring this share of the best are the same bars repeated
    public static final int THIN = 8; // a print: the reduction with THIN times fewer samples (1 kHz)
    public static final double KNOWN_SURE = 28.0; // how far the stream must stand out in a print to be that song

    static final float[] KERNEL = lowpass();

    private Align() {
    }

    /** A place found and how sure; at is null when it wasn't found. */
    public static final class Found {
        public final Long at;
        public final double score;

        Found(Long at, double score) {
            this.at = at;
            this.score = score;
        }
    }

    private static float[] lowpass() {
        double[] kernel = new double[LOWPASS];
        double sum = 0;
        for (int i = 0; i < LOWPASS; i++) {
            double n = i - (LOWPASS - 1) / 2.0;
            double x = n / STEP;
            double sinc = x == 0 ? 1 : Math.sin(Math.PI * x) / (Math.PI * x);
            double hamming = 0.54 - 0.46 * Math.cos(2 * Math.PI * i / (LOWPASS - 1));
            kernel[i] = sinc * hamming;
            sum += kernel[i];
        }
        float[] out = new float[LOWPASS];
        for (int i = 0; i < LOWPASS; i++) out[i] = (float) (kernel[i] / sum);
        return out;
    }

    /** The low-passed sound at every STEP-th sample. */
    static float[] decimate(float[] sound) {
        int half = LOWPASS / 2;
        int padded = sound.length + 2 * half;
        int count = (padded - LOWPASS) / STEP + 1;
        if (count <= 0) return new float[0];
        float[] out = new float[count];
        for (int c = 0; c < count; c++) {
            double sum = 0;
            int base = c * STEP - half; // index into sound of padded[c * STEP]
            for (int t = 0; t < LOWPASS; t++) {
                int i = base + t;
                if (i >= 0 && i < sound.length) sum += sound[i] * KERNEL[LOWPASS - 1 - t];
            }
            out[c] = (float) sum;
        }
        return out;
    }

    /**
     * A mono sound at a sixth of its rate with every pitch made equally loud, for comparing: its bass would
     * otherwise outweigh the rest, and bass looks alike in many places of a song, and in other versions of it.
     */
    public static float[] reduce(float[] sound) {
        float[] low = decimate(sound);
        int size = RealFft.sizeFor(Math.max(low.length, 2));
        int bins = size / 2 + 1;
        double[] re = new double[bins], im = new double[bins];
        RealFft.rfft(low, low.length, size, re, im);
        double[] magnitude = new double[bins];
        for (int k = 0; k < bins; k++) magnitude[k] = Math.hypot(re[k], im[k]);
        // np.convolve(magnitude, ones(WHITEN) / WHITEN, mode="same"): bins [k - 32, k + 31]
        double[] prefix = new double[bins + 1];
        for (int k = 0; k < bins; k++) prefix[k + 1] = prefix[k] + magnitude[k];
        int before = WHITEN / 2, after = WHITEN - before - 1;
        for (int k = 0; k < bins; k++) {
            int lo = Math.max(0, k - before), hi = Math.min(bins, k + after + 1);
            double level = (prefix[hi] - prefix[lo]) / WHITEN;
            re[k] /= level + 1e-9;
            im[k] /= level + 1e-9;
        }
        double[] back = RealFft.irfft(re, im, size);
        float[] out = new float[low.length];
        for (int i = 0; i < low.length; i++) out[i] = (float) back[i];
        return out;
    }

    /** A reduced sound's print: THIN times fewer samples, each the average of THIN. */
    public static float[] thin(float[] reduced) {
        int n = reduced.length / THIN;
        float[] out = new float[n];
        for (int i = 0; i < n; i++) {
            float sum = 0;
            for (int j = 0; j < THIN; j++) sum += reduced[i * THIN + j];
            out[i] = sum / THIN;
        }
        return out;
    }

    /** The latest song's spectrum and energy, for the checks that follow it every few seconds. */
    private static final class Kept {
        final float[] song;
        final int size;
        final double[] re, im, energy;

        Kept(float[] song, int size, double[] re, double[] im, double[] energy) {
            this.song = song;
            this.size = size;
            this.re = re;
            this.im = im;
            this.energy = energy;
        }
    }

    private static Kept kept; // guarded by Align.class

    private static double[] energy(float[] signal) {
        double[] energy = new double[signal.length + 1];
        for (int i = 0; i < signal.length; i++) energy[i + 1] = energy[i] + (double) signal[i] * signal[i];
        return energy;
    }

    /** How alike short is with long at each position of long, from -1 to 1. */
    static double[] correlate(float[] longer, float[] shorter, boolean keep) {
        int size = RealFft.sizeFor(longer.length + shorter.length);
        int bins = size / 2 + 1;
        double[] songRe, songIm, energy;
        Kept cached;
        synchronized (Align.class) {
            cached = keep ? kept : null;
        }
        if (cached != null && cached.song == longer && cached.size == size) {
            songRe = cached.re;
            songIm = cached.im;
            energy = cached.energy;
        } else {
            songRe = new double[bins];
            songIm = new double[bins];
            RealFft.rfft(longer, longer.length, size, songRe, songIm);
            energy = energy(longer);
            if (keep) {
                synchronized (Align.class) {
                    kept = new Kept(longer, size, songRe, songIm, energy); // only one song is kept: memory
                }
            }
        }
        double[] re = new double[bins], im = new double[bins];
        RealFft.rfft(shorter, shorter.length, size, re, im);
        for (int k = 0; k < bins; k++) { // spectrum * conj(short spectrum)
            double ar = songRe[k], ai = songIm[k], br = re[k], bi = -im[k];
            re[k] = ar * br - ai * bi;
            im[k] = ar * bi + ai * br;
        }
        double[] dots = RealFft.irfft(re, im, size);
        int count = longer.length - shorter.length + 1;
        double norm = 0;
        for (float v : shorter) norm += (double) v * v;
        norm = Math.sqrt(norm) + 1e-12;
        double[] likeness = new double[count];
        for (int j = 0; j < count; j++) {
            double window = energy[j + shorter.length] - energy[j];
            likeness[j] = dots[j] / (Math.sqrt(Math.max(window, 1e-12)) * norm);
        }
        return likeness;
    }

    /** Forgets the kept song (its copy was let go). */
    static synchronized void forget() {
        kept = null;
    }

    static double median(double[] values) {
        return medianInPlace(values.clone());
    }

    /**
     * The median, exactly as a sort would give it, by selection (linear time, not a sort of millions of values);
     * reorders the array, so only for arrays of one's own.
     */
    static double medianInPlace(double[] a) {
        int n = a.length;
        double upper = select(a, n / 2);
        if (n % 2 == 1) return upper;
        double lower = Double.NEGATIVE_INFINITY; // (the largest of what select left below n / 2)
        for (int i = 0; i < n / 2; i++) if (a[i] > lower) lower = a[i];
        return (lower + upper) / 2;
    }

    /** The k-th smallest; afterwards everything before k is no larger and everything after no smaller. */
    static double select(double[] a, int k) {
        int lo = 0, hi = a.length - 1;
        while (hi > lo) {
            // median of three as the pivot: sorted or repeating data don't make it quadratic
            int mid = (lo + hi) >>> 1;
            if (a[mid] < a[lo]) swap(a, mid, lo);
            if (a[hi] < a[lo]) swap(a, hi, lo);
            if (a[hi] < a[mid]) swap(a, hi, mid);
            double pivot = a[mid];
            int i = lo, j = hi;
            while (i <= j) {
                while (a[i] < pivot) i++;
                while (a[j] > pivot) j--;
                if (i <= j) swap(a, i++, j--);
            }
            if (k <= j) hi = j;
            else if (k >= i) lo = i;
            else return a[k];
        }
        return a[k];
    }

    private static void swap(double[] a, int i, int j) {
        double t = a[i];
        a[i] = a[j];
        a[j] = t;
    }

    /** Robust z-scores: (x - median) / (1.4826 * MAD). */
    static double[] zScores(double[] likeness) {
        double median = median(likeness);
        double[] deviation = new double[likeness.length];
        for (int i = 0; i < likeness.length; i++) deviation[i] = Math.abs(likeness[i] - median);
        double spread = 1.4826 * medianInPlace(deviation) + 1e-12;
        double[] scores = new double[likeness.length];
        for (int i = 0; i < likeness.length; i++) scores[i] = (likeness[i] - median) / spread;
        return scores;
    }

    /** Which of these prints (its index as at) the stream is in, and how sure; at null when none stands out. */
    public static Found known(float[] stream, List<float[]> prints) {
        float[] heard = thin(reduce(stream));
        int best = -1;
        double bestScore = 0.0;
        for (int i = 0; i < prints.size(); i++) {
            float[] print = prints.get(i);
            if (print.length < heard.length + 2) continue;
            double[] likeness = correlate(print, heard, false);
            double median = median(likeness);
            double[] deviation = new double[likeness.length];
            double max = Double.NEGATIVE_INFINITY;
            for (int j = 0; j < likeness.length; j++) {
                deviation[j] = Math.abs(likeness[j] - median);
                max = Math.max(max, likeness[j]);
            }
            double spread = 1.4826 * medianInPlace(deviation) + 1e-12;
            double score = (max - median) / spread;
            if (score > bestScore) {
                best = i;
                bestScore = score;
            }
        }
        return new Found(bestScore >= KNOWN_SURE ? (long) best : null, bestScore);
    }

    private static double[] scores(float[] stream, float[] reducedSong) {
        float[] reduced = reduce(stream);
        if (reduced.length < 2 || reducedSong.length < reduced.length) return null;
        return zScores(correlate(reducedSong, reduced, true));
    }

    private static int argmax(double[] values, int from, int to) {
        int best = from;
        for (int i = from + 1; i < to; i++) if (values[i] > values[best]) best = i;
        return best;
    }

    /**
     * Where in the song (sample index) the stream's first sample is, and how sure; at null when it isn't there.
     * expected (a song sample index, or null) picks among places that sound alike.
     */
    public static Found find(float[] stream, SongCopy song, Long expected) {
        double[] scores = scores(stream, song.reduced());
        if (scores == null) return new Found(null, 0.0);
        int peak = argmax(scores, 0, scores.length);
        if (scores[peak] < SURE) return new Found(null, scores[peak]);
        if (expected != null) peak = nearestAlike(scores, peak, expected);
        return new Found(pin(stream, song, (long) peak * STEP), scores[peak]);
    }

    /** Of the places scoring nearly as high as the peak, the top of the one nearest expected (song samples). */
    static int nearestAlike(double[] scores, int peak, long expected) {
        double bar = Math.max(SURE, scores[peak] * ALIKE);
        int nearest = -1;
        long nearestDistance = Long.MAX_VALUE;
        for (int i = 0; i < scores.length; i++) {
            if (scores[i] < bar) continue;
            long distance = Math.abs((long) i * STEP - expected);
            if (distance < nearestDistance) {
                nearestDistance = distance;
                nearest = i;
            }
        }
        int steps = Math.max(2, (int) Math.round((double) REACH / STEP));
        int lo = Math.max(nearest - steps, 0), hi = Math.min(nearest + steps + 1, scores.length);
        return argmax(scores, lo, hi);
    }

    /** Is the stream still at song sample expected (give or take REACH samples)? Its exact place there. */
    public static Found still(float[] stream, SongCopy song, long expected) {
        double[] scores = scores(stream, song.reduced());
        if (scores == null) return new Found(null, 0.0);
        long rough = Math.round((double) expected / STEP);
        int steps = Math.max(2, (int) Math.round((double) REACH / STEP));
        long lo = Math.max(rough - steps, 0), hi = Math.min(rough + steps + 1, scores.length);
        if (lo >= hi) return new Found(null, 0.0);
        int near = argmax(scores, (int) lo, (int) hi);
        if (scores[near] < STILL_SURE) return new Found(null, scores[near]);
        return new Found(pin(stream, song, (long) near * STEP), scores[near]);
    }

    /** The exact sample near rough where the stream lines up with the song best. */
    static long pin(float[] stream, SongCopy song, long rough) {
        double best = Double.NEGATIVE_INFINITY;
        long bestAt = rough;
        long from = Math.max(rough - STEP, 0), to = Math.min(rough + STEP, (long) song.length() - stream.length);
        for (long at = from; at <= to; at++) {
            double dot = 0;
            for (int i = 0; i < stream.length; i++) dot += stream[i] * song.monoAt((int) (at + i));
            if (dot > best) {
                best = dot;
                bestAt = at;
            }
        }
        return bestAt;
    }
}
