package app.tikkamasalla.stremio.oneahead;

import java.util.Arrays;

/**
 * One analysed audio window of an episode at 4 kHz: the band-limited signal with gain control (80-1500 Hz, 1 s sliding RMS),
 * held as int8, int16 or float, plus a coarse level track for edge checks. Times are file-clock seconds at {@link #offset}.
 */
public final class Track {
    public static final int SR = 4000;
    public static final int ENV_SAMPLES = 80;       // 20 ms
    private static final double BAND_LO = 80.0, BAND_HI = 1500.0;

    public final double offset;
    public final int n;
    final byte[] q8;
    final short[] q16;
    final float[] f;
    final float step;
    /** Level per 20 ms in whole dB below full scale (0..127), computed before band-limiting and AGC. */
    public final byte[] env;
    /** Centre-channel energy fraction per 20 ms (0..127 = 0..1 of total channel energy), for
     * 5.1 mixes: dialogue drives it up ~7x over score (0.055 theme vs 0.38 dialogue).
     * Null when unavailable (stereo, unmeasured): callers fall back to the mono path. */
    public final byte[] cenv;

    Track(double offset, int n, byte[] q8, short[] q16, float[] f, float step, byte[] env, byte[] cenv) {
        this.offset = offset;
        this.n = n;
        this.q8 = q8;
        this.q16 = q16;
        this.f = f;
        this.step = step;
        this.env = env;
        this.cenv = cenv;
    }

    float at(int i) {
        if (q8 != null) return q8[i] * step;
        if (q16 != null) return q16[i] * step;
        return f[i];
    }

    public int bits() {
        return q8 != null ? 8 : q16 != null ? 16 : 32;
    }

    public double end() {
        return offset + n / (double) SR;
    }

    /** Builds a window from 4 kHz PCM. bits is 8, 16, or 32 for float. pcm is not kept. */
    public static Track build(double offset, float[] pcm, int bits) {
        byte[] env = level(pcm);
        float[] p = bits < 0 ? pcm : prep(pcm); // bits < 0: pcm is already prepped, kept as float (cross-checks)
        return quantize(offset, p, env, bits);
    }

    /** Same track with centre-fraction levels attached (runtime only, never cached). */
    public Track withCenv(byte[] cenv) {
        return new Track(offset, n, q8, q16, f, step, env, cenv);
    }

    static Track quantize(double offset, float[] p, byte[] env, int bits) {
        int n = p.length;
        if (bits == 8) {
            float step = 4f / 127f;
            byte[] q = new byte[n];
            for (int i = 0; i < n; i++) {
                int v = Math.round(p[i] / step);
                q[i] = (byte) (v > 127 ? 127 : v < -127 ? -127 : v);
            }
            return new Track(offset, n, q, null, null, step, env, null);
        }
        if (bits == 16) {
            float step = 8f / 32767f;
            short[] q = new short[n];
            for (int i = 0; i < n; i++) {
                int v = Math.round(p[i] / step);
                q[i] = (short) (v > 32767 ? 32767 : v < -32767 ? -32767 : v);
            }
            return new Track(offset, n, null, q, null, step, env, null);
        }
        return new Track(offset, n, null, null, p, 1f, env, null);
    }

    /** RMS level per 20 ms in whole dB below full scale. */
    static byte[] level(float[] x) {
        int m = x.length / ENV_SAMPLES;
        byte[] e = new byte[m];
        for (int i = 0; i < m; i++) {
            double s = 0;
            for (int j = i * ENV_SAMPLES, end = j + ENV_SAMPLES; j < end; j++) s += (double) x[j] * x[j];
            double db = 10.0 * Math.log10(s / ENV_SAMPLES + 1e-13);
            e[i] = (byte) Math.max(0, Math.min(127, (int) Math.round(-db)));
        }
        return e;
    }

    /** Zero mean, FFT band limit, 1 s sliding RMS gain control with env + 0.2 * median(env). */
    public static float[] prep(float[] x) {
        int n = x.length;
        double mean = 0;
        for (float v : x) mean += v;
        mean /= Math.max(n, 1);
        int nfft = Rfft.nextPow2(n);
        float[] z = new float[nfft];
        for (int i = 0; i < n; i++) z[i] = (float) (x[i] - mean);
        Rfft fft = new Rfft(nfft);
        fft.forward(z);
        z[0] = 0;
        z[1] = 0;
        double hz = SR / (double) nfft;
        for (int k = 1; k < nfft / 2; k++) {
            double f = k * hz;
            if (f < BAND_LO || f > BAND_HI) {
                z[2 * k] = 0;
                z[2 * k + 1] = 0;
            }
        }
        fft.inverse(z);
        fft = null;
        float[] env = new float[n];
        double cur = 0;
        int i0 = 0, i1 = 0, w = SR / 2;
        for (int i = 0; i < n; i++) {
            int a = Math.max(0, i - w), b = Math.min(n, i + w);
            while (i1 < b) { cur += (double) z[i1] * z[i1]; i1++; }
            while (i0 < a) { cur -= (double) z[i0] * z[i0]; i0++; }
            env[i] = (float) Math.sqrt(Math.max(cur, 0.0) / Math.max(b - a, 1));
        }
        float[] sorted = env.clone();
        Arrays.sort(sorted);
        double med = n == 0 ? 0 : n % 2 == 1 ? sorted[n / 2] : 0.5 * (sorted[n / 2 - 1] + sorted[n / 2]);
        sorted = null;
        double add = 0.2 * (med + 1e-9);
        for (int i = 0; i < n; i++) env[i] = (float) (z[i] / (env[i] + add)); // in place: no third window-sized array
        return env;
    }
}
