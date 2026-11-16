package app.morphed.extension.twitch.musicfilter;

/**
 * A real FFT of a fixed power-of-two size through an iterative radix-2 complex one, and its inverse as
 * numpy.fft.irfft computes it (the imaginary parts of the first and last bins are ignored). Not thread safe:
 * each user keeps its own.
 */
final class FrameFft {
    private final int n;
    private final int[] reverse;
    private final double[] cos, sin;
    private final double[] re, im;

    FrameFft(int n) {
        if (Integer.bitCount(n) != 1 || n < 2) throw new IllegalArgumentException("size " + n);
        this.n = n;
        int bits = Integer.numberOfTrailingZeros(n);
        reverse = new int[n];
        for (int i = 0; i < n; i++) reverse[i] = Integer.reverse(i) >>> (32 - bits);
        cos = new double[n / 2];
        sin = new double[n / 2];
        for (int i = 0; i < n / 2; i++) {
            cos[i] = Math.cos((2 * Math.PI * i) / n);
            sin[i] = Math.sin((2 * Math.PI * i) / n);
        }
        re = new double[n];
        im = new double[n];
    }

    int size() {
        return n;
    }

    private void transform(int sign) {
        for (int i = 0; i < n; i++) {
            int j = reverse[i];
            if (j > i) {
                double t = re[i];
                re[i] = re[j];
                re[j] = t;
                t = im[i];
                im[i] = im[j];
                im[j] = t;
            }
        }
        for (int size = 2; size <= n; size <<= 1) {
            int half = size >> 1;
            int step = n / size;
            for (int start = 0; start < n; start += size) {
                for (int k = 0; k < half; k++) {
                    double wr = cos[k * step];
                    double wi = sign * sin[k * step];
                    int a = start + k;
                    int b = a + half;
                    double xr = re[b] * wr - im[b] * wi;
                    double xi = re[b] * wi + im[b] * wr;
                    re[b] = re[a] - xr;
                    im[b] = im[a] - xi;
                    re[a] += xr;
                    im[a] += xi;
                }
            }
        }
    }

    /** samples (n) -> spectrum (n / 2 + 1) as outRe, outIm. */
    void rfft(double[] samples, double[] outRe, double[] outIm) {
        for (int i = 0; i < n; i++) {
            re[i] = samples[i];
            im[i] = 0;
        }
        transform(-1);
        int bins = n / 2 + 1;
        System.arraycopy(re, 0, outRe, 0, bins);
        System.arraycopy(im, 0, outIm, 0, bins);
    }

    /** spectrum (n / 2 + 1) -> samples (n). */
    void irfft(double[] inRe, double[] inIm, double[] out) {
        re[0] = inRe[0];
        im[0] = 0;
        re[n / 2] = inRe[n / 2];
        im[n / 2] = 0;
        for (int k = 1; k < n / 2; k++) {
            re[k] = inRe[k];
            im[k] = inIm[k];
            re[n - k] = inRe[k];
            im[n - k] = -inIm[k];
        }
        transform(1);
        for (int i = 0; i < n; i++) out[i] = re[i] / n;
    }
}
