package app.ayham.extension.music.automix;

/**
 * editor.md §12 rule 3: the Effects returns and the noise (crossfade.js fxBus, hallImpulse,
 * noiseBuffer). Both decks feed the same three returns, each deck's sound taken after its fader,
 * EQ and filters, times its send curve; the returns play into the mix next to the decks and ring
 * on after the window (a tail is never cut at its end). The noise is white noise through a 1.5 kHz
 * high-pass at noise × 0.25, from the window's start to its end, not under a fader.
 */
final class FxBus {
    static final double ECHO_FEEDBACK = 0.45, ECHO_TONE_HZ = 3000, ECHO_TONE_Q_DB = 0.5, DELAY_FEEDBACK = 0.3;
    static final double REVERB_SEC = 2.4, REVERB_LEVEL = 0.7, NOISE_LEVEL = 0.25, NOISE_HP_HZ = 1500;
    /** The longest echo or delay time (Web Audio's DelayNode maxDelayTime there). */
    static final double MAX_DELAY_SEC = 3;
    private static final int SR = Engine.SR;

    private final Mix m;
    private final int block, control;
    private final Line echo, delay;
    private final Convolver reverb;
    private final Biquad noiseHp;
    private final float[] ein, din, rin;
    private long rng = 0x9E3779B97F4A7C15L;
    /** Mix seconds up to which the returns may still sound (the limiter's guard). */
    final double until;

    FxBus(Mix m, int block, int control) {
        this.m = m;
        this.block = block;
        this.control = control;
        echo = m.fx ? new Line(m.echoSec, ECHO_FEEDBACK, new Biquad(Biquad.LOWPASS, SR, 0, ECHO_TONE_Q_DB)) : null;
        if (echo != null) echo.tone.setValue(ECHO_TONE_HZ);
        delay = m.fx ? new Line(m.delaySec, DELAY_FEEDBACK, null) : null;
        reverb = m.fx ? new Convolver(block) : null;
        noiseHp = m.noise ? new Biquad(Biquad.HIGHPASS, SR, 0) : null;
        if (noiseHp != null) noiseHp.setValue(NOISE_HP_HZ);
        ein = new float[2 * block];
        din = new float[2 * block];
        rin = new float[2 * block];
        until = m.t0 + m.D + tailSec(m);
    }

    /** How long the returns ring after the window: the reverb's 2.4 s, the echo's and delay's repeats to about -60 dB. */
    static double tailSec(Mix m) {
        if (!m.fx) return 0;
        double echoTail = Math.min(MAX_DELAY_SEC, m.echoSec) * Math.log(1e-3) / Math.log(ECHO_FEEDBACK);
        double delayTail = Math.min(MAX_DELAY_SEC, m.delaySec) * Math.log(1e-3) / Math.log(DELAY_FEEDBACK);
        return Math.min(8, Math.max(REVERB_SEC, Math.max(echoTail, delayTail)));
    }

    /**
     * One block: the decks [bo], [bi] (after their faders and filters; mix frame [frame] on) at the
     * levels [lo], [li] they play at, sent to the returns; the returns and the noise added to [out].
     */
    void run(float[] bo, float[] bi, long frame, float lo, float li, float[] out) {
        if (echo != null) {
            for (int at = 0; at < block; at += control) {
                double t0 = (frame + at) / (double) SR, t1 = (frame + at + control) / (double) SR;
                send(bo, bi, at, lo, li, m.out.echoSend, m.in.echoSend, t0, t1, ein);
                send(bo, bi, at, lo, li, m.out.delaySend, m.in.delaySend, t0, t1, din);
                send(bo, bi, at, lo, li, m.out.reverbSend, m.in.reverbSend, t0, t1, rin);
            }
            echo.run(ein, out, block);
            delay.run(din, out, block);
            reverb.run(rin, out);
        }
        if (noiseHp != null) {
            float[] n = ein; // (free again: the echo has read it)
            for (int at = 0; at < block; at += control) {
                double t0 = (frame + at) / (double) SR, t1 = (frame + at + control) / (double) SR;
                // each deck's noise at its deck's level (YT's volume), as the sends (extension audit M6)
                double a = (m.out.noise.at(t0) * lo + m.in.noise.at(t0) * li) * NOISE_LEVEL,
                        b = (m.out.noise.at(t1) * lo + m.in.noise.at(t1) * li) * NOISE_LEVEL;
                for (int i = 0; i < control; i++) {
                    float g = (float) (a + (b - a) * i / control);
                    n[2 * (at + i)] = g * white();
                    n[2 * (at + i) + 1] = g * white();
                }
            }
            noiseHp.process(n, 0, block);
            for (int i = 0; i < 2 * block; i++) out[i] += n[i];
        }
    }

    /** One control step of both decks' sends to a return, the send curves ramped across it. */
    private void send(float[] bo, float[] bi, int at, float lo, float li, Mix.Lane so, Mix.Lane si, double t0, double t1, float[] to) {
        double o0 = so.at(t0) * lo, o1 = so.at(t1) * lo, i0 = si.at(t0) * li, i1 = si.at(t1) * li;
        for (int i = 0; i < control; i++) {
            float go = (float) (o0 + (o1 - o0) * i / control), gi = (float) (i0 + (i1 - i0) * i / control);
            int k = 2 * (at + i);
            to[k] = bo[k] * go + bi[k] * gi;
            to[k + 1] = bo[k + 1] * go + bi[k + 1] * gi;
        }
    }

    /** White noise in [-1, 1) (xorshift64*). */
    private float white() {
        rng ^= rng >>> 12;
        rng ^= rng << 25;
        rng ^= rng >>> 27;
        return ((rng * 0x2545F4914F6CDD1DL) >>> 40) / (float) (1 << 24) * 2 - 1;
    }

    /** A delay line with feedback; [tone] (or none) filters each repeat, and what is heard. */
    static final class Line {
        final float[] ring;
        final double feedback;
        final Biquad tone;
        private final float[] frame = new float[2];
        int at;

        Line(double sec, double feedback, Biquad tone) {
            double s = sec > 0 ? Math.min(MAX_DELAY_SEC, sec) : 0.25;
            ring = new float[2 * Math.max(1, (int) Math.round(s * SR))];
            this.feedback = feedback;
            this.tone = tone;
        }

        void run(float[] in, float[] out, int n) {
            for (int i = 0; i < n; i++) {
                frame[0] = ring[at];
                frame[1] = ring[at + 1];
                if (tone != null) tone.process(frame, 0, 1);
                for (int ch = 0; ch < 2; ch++) {
                    float y = frame[ch];
                    ring[at + ch] = in[2 * i + ch] + (float) feedback * y;
                    out[2 * i + ch] += y;
                }
                at = (at + 2) % ring.length;
            }
        }
    }

    /**
     * The reverb (Web Audio's ConvolverNode with a 2-channel impulse, normalized): left through the
     * impulse's left, right through its right, by uniformly partitioned convolution in blocks of
     * the engine's block (no latency at that grain). Silent input for longer than the impulse skips
     * the work: every stored spectrum is zero by then.
     */
    static final class Convolver {
        final int B, N, P;
        /** The impulse's partitions' spectra (bins 0..N/2), level and scale folded in. */
        final float[][] hlr, hli, hrr, hri;
        /** The input's spectra, newest at [idx]. */
        final float[][] xlr, xli, xrr, xri;
        final float[] prevL, prevR, re, im, ylr, yli, yrr, yri;
        final Fft fft;
        int idx, silent = Integer.MAX_VALUE / 2;

        Convolver(int block) {
            B = block;
            N = 2 * block;
            int L = (int) Math.round(REVERB_SEC * SR);
            P = (L + B - 1) / B;
            fft = new Fft(N);
            int K = N / 2 + 1;
            hlr = new float[P][K];
            hli = new float[P][K];
            hrr = new float[P][K];
            hri = new float[P][K];
            xlr = new float[P][K];
            xli = new float[P][K];
            xrr = new float[P][K];
            xri = new float[P][K];
            prevL = new float[B];
            prevR = new float[B];
            re = new float[N];
            im = new float[N];
            ylr = new float[K];
            yli = new float[K];
            yrr = new float[K];
            yri = new float[K];
            float[][] h = impulse();
            double scale = gain(h) / N;
            for (int p = 0; p < P; p++) {
                java.util.Arrays.fill(re, 0);
                java.util.Arrays.fill(im, 0);
                for (int i = 0; i < B && p * B + i < L; i++) {
                    re[i] = h[0][p * B + i];
                    im[i] = h[1][p * B + i];
                }
                fft.run(re, im, false);
                split(re, im, hlr[p], hli[p], hrr[p], hri[p]);
                for (int k = 0; k < K; k++) {
                    hlr[p][k] *= scale;
                    hli[p][k] *= scale;
                    hrr[p][k] *= scale;
                    hri[p][k] *= scale;
                }
            }
        }

        /** The impulse: stereo white noise decaying by 60 dB over 2.4 s (crossfade.js hallImpulse). */
        static float[][] impulse() {
            int L = (int) Math.round(REVERB_SEC * SR);
            java.util.Random r = new java.util.Random(24);
            float[][] h = new float[2][L];
            for (int ch = 0; ch < 2; ch++) {
                for (int i = 0; i < L; i++) h[ch][i] = (float) ((r.nextDouble() * 2 - 1) * Math.pow(10, -3.0 * i / L));
            }
            return h;
        }

        /** The impulse's gain: Web Audio's normalization (Reverb::calculateNormalizationScale: 1 / RMS, -58 dB, 44.1 kHz calibrated), times the level. */
        static double gain(float[][] h) {
            double power = 0;
            for (float[] c : h) for (float v : c) power += v * (double) v;
            double rms = Math.max(0.000125, Math.sqrt(power / (2.0 * h[0].length)));
            return 1 / rms * Math.pow(10, -58 * 0.05) * (44100.0 / SR) * REVERB_LEVEL;
        }

        /** The spectra of two real signals from one complex FFT of (left + i·right). */
        private void split(float[] zr, float[] zi, float[] lr, float[] li, float[] rr, float[] ri) {
            for (int k = 0; k <= N / 2; k++) {
                int j = (N - k) % N;
                float a = zr[k], b = zi[k], c = zr[j], d = zi[j];
                lr[k] = (a + c) / 2;
                li[k] = (b - d) / 2;
                rr[k] = (b + d) / 2;
                ri[k] = -(a - c) / 2;
            }
        }

        /** One block of the stereo input [in] (B frames); its reverb added to [out]. */
        void run(float[] in, float[] out) {
            boolean any = false;
            for (int i = 0; i < 2 * B && !any; i++) any = in[i] != 0;
            silent = any ? 0 : silent + 1;
            if (silent > P + 1) return; // every stored spectrum is zero: nothing rings
            for (int i = 0; i < B; i++) {
                re[i] = prevL[i];
                im[i] = prevR[i];
                re[B + i] = prevL[i] = in[2 * i];
                im[B + i] = prevR[i] = in[2 * i + 1];
            }
            fft.run(re, im, false);
            split(re, im, xlr[idx], xli[idx], xrr[idx], xri[idx]);
            int K = N / 2 + 1;
            java.util.Arrays.fill(ylr, 0);
            java.util.Arrays.fill(yli, 0);
            java.util.Arrays.fill(yrr, 0);
            java.util.Arrays.fill(yri, 0);
            for (int p = 0; p < P; p++) {
                int s = idx - p < 0 ? idx - p + P : idx - p;
                float[] ar = xlr[s], ai = xli[s], br = xrr[s], bi = xri[s], hr = hlr[p], hi = hli[p], gr = hrr[p], gi = hri[p];
                for (int k = 0; k < K; k++) {
                    ylr[k] += ar[k] * hr[k] - ai[k] * hi[k];
                    yli[k] += ar[k] * hi[k] + ai[k] * hr[k];
                    yrr[k] += br[k] * gr[k] - bi[k] * gi[k];
                    yri[k] += br[k] * gi[k] + bi[k] * gr[k];
                }
            }
            // back as one complex signal, left + i·right
            for (int k = 0; k < N; k++) {
                if (k <= N / 2) {
                    re[k] = ylr[k] - yri[k];
                    im[k] = yli[k] + yrr[k];
                } else {
                    int j = N - k;
                    re[k] = ylr[j] + yri[j];
                    im[k] = -yli[j] + yrr[j];
                }
            }
            fft.run(re, im, true);
            for (int i = 0; i < B; i++) {
                out[2 * i] += re[B + i];
                out[2 * i + 1] += im[B + i];
            }
            idx = (idx + 1) % P;
        }
    }

    /** An in-place radix-2 complex FFT of a power-of-two size (unscaled both ways). */
    static final class Fft {
        final int n;
        final int[] rev;
        final float[] cos, sin;

        Fft(int n) {
            this.n = n;
            rev = new int[n];
            int bits = Integer.numberOfTrailingZeros(n);
            for (int i = 0; i < n; i++) rev[i] = Integer.reverse(i) >>> (32 - bits);
            cos = new float[n / 2];
            sin = new float[n / 2];
            for (int i = 0; i < n / 2; i++) {
                cos[i] = (float) Math.cos(2 * Math.PI * i / n);
                sin[i] = (float) Math.sin(2 * Math.PI * i / n);
            }
        }

        void run(float[] re, float[] im, boolean inverse) {
            for (int i = 0; i < n; i++) {
                int j = rev[i];
                if (j > i) {
                    float t = re[i];
                    re[i] = re[j];
                    re[j] = t;
                    t = im[i];
                    im[i] = im[j];
                    im[j] = t;
                }
            }
            float sign = inverse ? 1 : -1;
            for (int len = 2; len <= n; len <<= 1) {
                int half = len >> 1, step = n / len;
                for (int i = 0; i < n; i += len) {
                    for (int k = 0; k < half; k++) {
                        float wr = cos[k * step], wi = sign * sin[k * step];
                        int a = i + k, b = a + half;
                        float xr = re[b] * wr - im[b] * wi, xi = re[b] * wi + im[b] * wr;
                        re[b] = re[a] - xr;
                        im[b] = im[a] - xi;
                        re[a] += xr;
                        im[a] += xi;
                    }
                }
            }
        }
    }
}
