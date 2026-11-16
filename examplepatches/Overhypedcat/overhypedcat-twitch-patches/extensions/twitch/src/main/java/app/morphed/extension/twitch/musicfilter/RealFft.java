package app.morphed.extension.twitch.musicfilter;

/**
 * Real FFTs of any power-of-two size, as numpy.fft.rfft / irfft compute them (zero-padded input, double
 * precision), for lining up whole songs. A real transform of n samples runs as a complex one of n / 2 and an
 * untangling pass, so a 4-minute song needs half the work and memory of a plain complex transform.
 * The twiddle tables of the sizes in use are kept (a few MB for a song); everything else is per call.
 */
final class RealFft {
    private RealFft() {
    }

    /** cos/sin of 2*pi*k/n for k in [0, n/2), kept for the latest few sizes. */
    private static final class Table {
        final int n;
        final double[] cos, sin;

        Table(int n) {
            this.n = n;
            int half = n / 2;
            cos = new double[half];
            sin = new double[half];
            for (int k = 0; k < half; k++) {
                double angle = 2 * Math.PI * k / n;
                cos[k] = Math.cos(angle);
                sin[k] = Math.sin(angle);
            }
        }
    }

    private static final Table[] TABLES = new Table[4];
    private static int nextTable;

    private static synchronized Table table(int n) {
        for (Table table : TABLES) if (table != null && table.n == n) return table;
        Table made = new Table(n);
        TABLES[nextTable] = made;
        nextTable = (nextTable + 1) % TABLES.length;
        return made;
    }

    static int sizeFor(int length) {
        int size = 1;
        while (size < length) size <<= 1;
        return Math.max(size, 2);
    }

    /** In-place complex FFT of m points (sign -1 forward, +1 inverse, unscaled); tw is the table of 2m. */
    private static void complex(double[] re, double[] im, int m, Table tw, int sign) {
        int bits = Integer.numberOfTrailingZeros(m);
        if (m > 1) {
            for (int i = 0; i < m; i++) {
                int j = Integer.reverse(i) >>> (32 - bits);
                if (j > i) {
                    double t = re[i];
                    re[i] = re[j];
                    re[j] = t;
                    t = im[i];
                    im[i] = im[j];
                    im[j] = t;
                }
            }
        }
        // the table holds angles 2*pi*k/(2m): a step of 2 per index of an m-point transform
        for (int size = 2; size <= m; size <<= 1) {
            int half = size >> 1;
            int step = (m / size) * 2;
            for (int start = 0; start < m; start += size) {
                for (int k = 0, t = 0; k < half; k++, t += step) {
                    double wr = tw.cos[t];
                    double wi = sign * tw.sin[t];
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

    /** Spectrum (n / 2 + 1 bins) of x[0, length) zero-padded to n, into outRe / outIm. */
    static void rfft(float[] x, int length, int n, double[] outRe, double[] outIm) {
        int m = n / 2;
        double[] re = new double[m], im = new double[m];
        int count = Math.min(length, n);
        for (int i = 0; i < m; i++) {
            int a = 2 * i, b = a + 1;
            re[i] = a < count ? x[a] : 0;
            im[i] = b < count ? x[b] : 0;
        }
        rfftPacked(re, im, n, outRe, outIm);
    }

    static void rfft(double[] x, int length, int n, double[] outRe, double[] outIm) {
        int m = n / 2;
        double[] re = new double[m], im = new double[m];
        int count = Math.min(length, n);
        for (int i = 0; i < m; i++) {
            int a = 2 * i, b = a + 1;
            re[i] = a < count ? x[a] : 0;
            im[i] = b < count ? x[b] : 0;
        }
        rfftPacked(re, im, n, outRe, outIm);
    }

    private static void rfftPacked(double[] re, double[] im, int n, double[] outRe, double[] outIm) {
        int m = n / 2;
        Table tw = table(n);
        complex(re, im, m, tw, -1);
        // X[k] = (Z[k] + conj(Z[m-k])) / 2 - i/2 * e^(-2*pi*i*k/n) * (Z[k] - conj(Z[m-k]))
        for (int k = 0; k <= m; k++) {
            int a = k % m, b = (m - k) % m;
            double zr = re[a], zi = im[a];
            double cr = re[b], ci = -im[b];
            double er = (zr + cr) / 2, ei = (zi + ci) / 2;
            double dr = (zr - cr) / 2, di = (zi - ci) / 2;
            double wr, wi;
            if (k < m) {
                wr = tw.cos[k];
                wi = -tw.sin[k];
            } else {
                wr = -1;
                wi = 0;
            }
            // -i * w * d
            double pr = wr * dr - wi * di, pi = wr * di + wi * dr;
            outRe[k] = er + pi;
            outIm[k] = ei - pr;
        }
    }

    /** Samples (n) from a spectrum (n / 2 + 1 bins); the imaginary parts of the first and last are ignored. */
    static double[] irfft(double[] inRe, double[] inIm, int n) {
        int m = n / 2;
        Table tw = table(n);
        double[] re = new double[m], im = new double[m];
        double lastRe = inRe[m];
        for (int k = 0; k < m; k++) {
            double xr = inRe[k], xi = k == 0 ? 0 : inIm[k];
            int j = m - k;
            double yr = j == m ? lastRe : inRe[j], yi = (j == m || j == 0) ? 0 : -inIm[j]; // conj(X[m-k])
            double er = xr + yr, ei = xi + yi; // Z even part * 2
            double dr = xr - yr, di = xi - yi;
            double wr = tw.cos[k], wi = tw.sin[k]; // e^(+2*pi*i*k/n)
            // i * w * d
            double pr = wr * dr - wi * di, pi = wr * di + wi * dr;
            re[k] = (er - pi) / 2;
            im[k] = (ei + pr) / 2;
        }
        complex(re, im, m, tw, 1);
        double[] out = new double[n];
        for (int i = 0; i < m; i++) {
            out[2 * i] = re[i] / m;
            out[2 * i + 1] = im[i] / m;
        }
        return out;
    }
}
