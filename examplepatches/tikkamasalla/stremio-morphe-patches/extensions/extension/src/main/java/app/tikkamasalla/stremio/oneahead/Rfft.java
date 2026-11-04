package app.tikkamasalla.stremio.oneahead;

/**
 * In-place real FFT on float data with twiddles computed in double. Forward output is packed:
 * z[0]=X[0], z[1]=X[n/2], z[2k]=Re X[k], z[2k+1]=Im X[k]. inverse(forward(x)) == x.
 */
final class Rfft {
    final int n;
    private final int h;
    private final float[] wr, wi; // e^(-2 pi i k / n), k < n/2

    Rfft(int n) {
        if (n < 4 || (n & (n - 1)) != 0) throw new IllegalArgumentException("size " + n);
        this.n = n;
        h = n / 2;
        wr = new float[h];
        wi = new float[h];
        for (int k = 0; k < h; k++) {
            double a = -2.0 * Math.PI * k / n;
            wr[k] = (float) Math.cos(a);
            wi[k] = (float) Math.sin(a);
        }
    }

    static int nextPow2(int v) {
        int m = 4;
        while (m < v) m <<= 1;
        return m;
    }

    void forward(float[] z) {
        cfft(z, false);
        float r0 = z[0], i0 = z[1];
        z[0] = r0 + i0;
        z[1] = r0 - i0;
        for (int k = 1; k <= h / 2; k++) {
            int j = h - k, ka = 2 * k, ja = 2 * j;
            float zr = z[ka], zi = z[ka + 1], yr = z[ja], yi = z[ja + 1];
            float er = 0.5f * (zr + yr), ei = 0.5f * (zi - yi);
            float or = 0.5f * (zi + yi), oi = 0.5f * (yr - zr);
            float tr = or * wr[k] - oi * wi[k], ti = or * wi[k] + oi * wr[k];
            z[ka] = er + tr;
            z[ka + 1] = ei + ti;
            z[ja] = er - tr;
            z[ja + 1] = ti - ei;
        }
    }

    void inverse(float[] z) {
        float a0 = z[0], a1 = z[1];
        z[0] = 0.5f * (a0 + a1);
        z[1] = 0.5f * (a0 - a1);
        for (int k = 1; k <= h / 2; k++) {
            int j = h - k, ka = 2 * k, ja = 2 * j;
            float xr = z[ka], xi = z[ka + 1], yr = z[ja], yi = -z[ja + 1];
            float er = 0.5f * (xr + yr), ei = 0.5f * (xi + yi);
            float dr = 0.5f * (xr - yr), di = 0.5f * (xi - yi);
            float or = dr * wr[k] + di * wi[k], oi = di * wr[k] - dr * wi[k];
            z[ka] = er - oi;
            z[ka + 1] = ei + or;
            z[ja] = er + oi;
            z[ja + 1] = or - ei;
        }
        cfft(z, true);
        float s = 1.0f / h;
        for (int i = 0; i < n; i++) z[i] *= s;
    }

    private void cfft(float[] z, boolean inverse) {
        for (int i = 1, j = 0; i < h; i++) {
            int bit = h >> 1;
            for (; (j & bit) != 0; bit >>= 1) j ^= bit;
            j |= bit;
            if (i < j) {
                float t = z[2 * i]; z[2 * i] = z[2 * j]; z[2 * j] = t;
                t = z[2 * i + 1]; z[2 * i + 1] = z[2 * j + 1]; z[2 * j + 1] = t;
            }
        }
        float sign = inverse ? -1f : 1f;
        for (int len = 2; len <= h; len <<= 1) {
            int half = len >> 1, step = n / len;
            for (int i = 0; i < h; i += len) {
                for (int m = 0, t = 0; m < half; m++, t += step) {
                    float cr = wr[t], ci = sign * wi[t];
                    int a = 2 * (i + m), b = a + len;
                    float vr = z[b] * cr - z[b + 1] * ci, vi = z[b] * ci + z[b + 1] * cr;
                    z[b] = z[a] - vr;
                    z[b + 1] = z[a + 1] - vi;
                    z[a] += vr;
                    z[a + 1] += vi;
                }
            }
        }
    }
}
