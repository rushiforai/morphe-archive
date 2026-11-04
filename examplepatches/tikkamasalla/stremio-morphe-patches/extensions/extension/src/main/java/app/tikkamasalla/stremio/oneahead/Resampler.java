package app.tikkamasalla.stremio.oneahead;

import java.util.Arrays;

/**
 * Streaming low-pass and resample of mono or interleaved PCM to 4 kHz. Kaiser-windowed sinc, 6 dB point at 2 kHz, stopband
 * from 2.5 kHz (aliases of 2-2.5 kHz land above the 1.5 kHz band the detector uses). Output sample j sits exactly at input
 * time j/4000, so the filter adds no delay to the file clock.
 */
public final class Resampler {
    public static final int OUT_RATE = 4000;
    private static final double BETA = 5.65; // about 60 dB
    private static final int BUF = 1 << 14;

    private final int rate, half, phases, taps;
    private final float[][] table;
    private final float[] buf;
    private int fill;           // samples in buf
    private long bufStart;      // input index of buf[0]
    private long consumed;      // input samples seen
    private long produced;      // output samples written
    private long nextBase;      // input index the next output sample is centred after
    private float[] out;

    public Resampler(int inputRate, double expectedSeconds) {
        if (inputRate < OUT_RATE) throw new IllegalArgumentException("rate " + inputRate);
        rate = inputRate;
        if (rate == OUT_RATE) {
            half = 0;
            taps = 0;
            phases = 1;
            table = null;
            buf = null;
        } else {
            phases = OUT_RATE / gcd(rate, OUT_RATE);
            double fc = 2000.0 / rate;
            half = ((int) Math.ceil(3.62 * rate / 1000.0) + 2) / 2;
            taps = 2 * half;
            table = new float[phases][taps];
            double i0b = bessel(BETA);
            double[] t = new double[taps];
            for (int p = 0; p < phases; p++) {
                double frac = p / (double) phases;   // output time = base + frac; tap m sits at base + m - half + 1
                double sum = 0;
                for (int m = 0; m < taps; m++) {
                    double d = m - half + 1 - frac;
                    double r = d / half;
                    double w = Math.abs(r) >= 1 ? 0 : bessel(BETA * Math.sqrt(1 - r * r)) / i0b;
                    t[m] = w * (d == 0 ? 2 * fc : Math.sin(2 * Math.PI * fc * d) / (Math.PI * d));
                    sum += t[m];
                }
                for (int m = 0; m < taps; m++) table[p][m] = (float) (t[m] / sum);
            }
            buf = new float[BUF + taps];
            fill = taps;              // silence before the first sample
            bufStart = -taps;
        }
        out = new float[Math.max(1024, (int) Math.ceil(expectedSeconds * OUT_RATE) + 16)];
    }

    private static int gcd(int a, int b) {
        return b == 0 ? a : gcd(b, a % b);
    }

    private static double bessel(double x) {
        double s = 1, t = 1;
        for (int k = 1; k < 40; k++) {
            t *= (x / (2 * k)) * (x / (2 * k));
            s += t;
        }
        return s;
    }

    /** Mono floats. */
    public void feed(float[] pcm, int offset, int frames) {
        for (int i = 0; i < frames; i++) push(pcm[offset + i]);
    }

    /** Interleaved floats, averaged to mono. */
    public void feedInterleaved(float[] pcm, int frames, int channels) {
        float g = 1f / channels;
        for (int f = 0, p = 0; f < frames; f++) {
            float s = 0;
            for (int c = 0; c < channels; c++) s += pcm[p++];
            push(s * g);
        }
    }

    /** Interleaved 16-bit, averaged to mono, scaled to -1..1. */
    public void feedInterleaved(short[] pcm, int frames, int channels) {
        float g = 1f / (32768f * channels);
        for (int f = 0, p = 0; f < frames; f++) {
            int s = 0;
            for (int c = 0; c < channels; c++) s += pcm[p++];
            push(s * g);
        }
    }

    private void push(float v) {
        consumed++;
        if (table == null) {
            append(v);
            return;
        }
        if (fill == buf.length) {
            System.arraycopy(buf, fill - taps, buf, 0, taps);
            bufStart += fill - taps;
            fill = taps;
        }
        buf[fill++] = v;
        while (nextBase + half < consumed) emit();
    }

    private void emit() {
        long pos = produced * rate;
        float[] t = table[(int) ((pos % OUT_RATE) * phases / OUT_RATE)];
        int p = (int) (nextBase - half + 1 - bufStart);
        float acc = 0;
        for (int m = 0; m < taps; m++) acc += t[m] * buf[p + m];
        append(acc);
        nextBase = produced * rate / OUT_RATE;
    }

    private void append(float v) {
        if (produced >= out.length) out = Arrays.copyOf(out, out.length + out.length / 4 + 1024);
        out[(int) produced++] = v;
    }

    /** Flushes the filter and returns the 4 kHz signal: the outputs that fall inside the input. */
    public float[] finish() {
        if (table != null) {
            long target = (consumed * OUT_RATE + rate - 1) / rate;
            long real = consumed;
            for (int i = 0; i < taps && produced < target; i++) {
                if (fill == buf.length) {
                    System.arraycopy(buf, fill - taps, buf, 0, taps);
                    bufStart += fill - taps;
                    fill = taps;
                }
                buf[fill++] = 0f;
                consumed++;
                while (nextBase + half < consumed && produced < target) emit();
            }
            consumed = real;
        }
        float[] r = produced == out.length ? out : Arrays.copyOf(out, (int) produced);
        out = null;
        return r;
    }
}
