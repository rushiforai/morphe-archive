package app.morphed.extension.twitch.musicfilter;

/**
 * Changes a sound's sample rate with a windowed-sinc filter (Kaiser window, 64 taps): clean enough that a song's
 * copy still lines up and cancels the way a natively 48 kHz copy does.
 */
final class Resampler {
    private static final int HALF = 32;
    private static final double BETA = 8.6;
    private static final int PHASES = 512; // the filter is tabulated at this many fractional positions

    private Resampler() {
    }

    static short[] resample(short[] in, int from, int to) {
        if (from == to) return in;
        double ratio = (double) to / from;
        double cutoff = Math.min(1.0, ratio) * 0.97; // just under the lower Nyquist
        float[][] table = new float[PHASES + 1][2 * HALF];
        double i0Beta = besselI0(BETA);
        for (int p = 0; p <= PHASES; p++) {
            double fraction = (double) p / PHASES;
            for (int k = 0; k < 2 * HALF; k++) {
                double x = k - (HALF - 1) - fraction;
                double sinc = x == 0 ? 1 : Math.sin(Math.PI * x * cutoff) / (Math.PI * x * cutoff);
                double w = x / HALF;
                double window = Math.abs(w) >= 1 ? 0 : besselI0(BETA * Math.sqrt(1 - w * w)) / i0Beta;
                table[p][k] = (float) (sinc * window * cutoff);
            }
        }
        int outLength = (int) Math.floor(in.length * ratio);
        short[] out = new short[outLength];
        for (int o = 0; o < outLength; o++) {
            double position = o / ratio;
            int base = (int) Math.floor(position);
            double fraction = position - base;
            float[] taps = table[(int) Math.round(fraction * PHASES)];
            double sum = 0;
            for (int k = 0; k < 2 * HALF; k++) {
                int i = base - (HALF - 1) + k;
                if (i >= 0 && i < in.length) sum += in[i] * taps[k];
            }
            out[o] = (short) Math.max(-32768, Math.min(32767, Math.round(sum)));
        }
        return out;
    }

    private static double besselI0(double x) {
        double sum = 1, term = 1;
        for (int k = 1; k < 40; k++) {
            term *= (x / (2 * k)) * (x / (2 * k));
            sum += term;
        }
        return sum;
    }
}
