package app.bitchord.telegram;

import java.util.Random;

public final class FingerprintTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    /** A tune of random notes with harmonics and a soft beat, at 44.1 kHz. */
    static float[] tune(long seed, double seconds, double tempo) {
        int rate = 44100;
        float[] out = new float[(int) (seconds * rate)];
        Random random = new Random(seed);
        double beat = 0.25 / tempo;
        for (double start = 0; start < seconds; start += beat) {
            double freq = 110 * Math.pow(2, random.nextInt(36) / 12.0);
            double length = beat * (1 + random.nextInt(3));
            int from = (int) (start * rate),
                    to = Math.min(out.length, (int) ((start + length) * rate));
            for (int i = from; i < to; i++) {
                double t = (i - from) / (double) rate;
                double envelope = Math.exp(-3 * t);
                double v = 0;
                for (int h = 1; h <= 4; h++) v += Math.sin(2 * Math.PI * freq * h * t) / h;
                out[i] += (float) (0.2 * envelope * v);
            }
            int kick = (int) (start * rate);
            for (int i = 0; i < 2000 && kick + i < out.length; i++)
                out[kick + i] += (float) (0.3 * Math.exp(-i / 300.0) * Math.sin(i * 0.02));
        }
        return out;
    }

    /** What a lossy stream does to it: 48 kHz, high end cut, noise, a different level. */
    static float[] streamed(float[] in, double fromSecond, double seconds, long seed) {
        int inRate = 44100, outRate = 48000;
        int n = (int) (seconds * outRate);
        float[] out = new float[n];
        Random noise = new Random(seed);
        float smooth = 0;
        for (int i = 0; i < n; i++) {
            double pos = fromSecond * inRate + i * (double) inRate / outRate;
            int k = (int) pos;
            if (k + 1 >= in.length) break;
            double frac = pos - k;
            float v = (float) (in[k] * (1 - frac) + in[k + 1] * frac);
            smooth += 0.35f * (v - smooth); // a gentle low-pass
            out[i] = 0.7f * smooth + (float) (noise.nextGaussian() * 0.01);
        }
        return out;
    }

    static float[] slice(float[] in, int rate, double from, double seconds) {
        int start = (int) (from * rate), n = (int) (seconds * rate);
        float[] out = new float[n];
        System.arraycopy(in, start, out, 0, Math.min(n, in.length - start));
        return out;
    }

    public static void main(String[] args) {
        // FFT sanity: a pure tone lands in its bin.
        double[] re = new double[1024], im = new double[1024];
        for (int i = 0; i < 1024; i++) re[i] = Math.sin(2 * Math.PI * 64 * i / 1024);
        Fingerprint.fft(re, im);
        int top = 0;
        for (int f = 1; f < 512; f++)
            if (Math.hypot(re[f], im[f]) > Math.hypot(re[top], im[top])) top = f;
        check(top == 64, "FFT bin " + top);

        float[] song = tune(1, 60, 1.0);
        Fingerprint reference = Fingerprint.of(song, (int) (45 * 44100), 44100);
        check(reference.size() > 2000, "Reference has hashes: " + reference.size());

        // The same recording, streamed, heard from 2 s in for 15 s.
        float[] heard = streamed(song, 2.0, 15, 7);
        Fingerprint excerpt = Fingerprint.of(heard, heard.length, 48000);
        Fingerprint.Match same = Fingerprint.match(reference, excerpt);
        check(same.same(), "Same recording matches: " + same);
        check(Math.abs(same.offset - 2.0) < 0.1, "At the right point: " + same);

        // Heard from the start, as when a song begins.
        Fingerprint.Match start =
                Fingerprint.match(
                        reference, Fingerprint.of(streamed(song, 0, 15, 8), 15 * 48000, 48000));
        check(start.same() && Math.abs(start.offset) < 0.1, "From the start: " + start);

        // A copy that starts 6 seconds later (a longer intro) matches 6 s off.
        float[] intro = new float[song.length + 6 * 44100];
        System.arraycopy(song, 0, intro, 6 * 44100, song.length);
        Fingerprint.Match shifted =
                Fingerprint.match(
                        Fingerprint.of(intro, 45 * 44100, 44100),
                        Fingerprint.of(streamed(song, 0, 15, 9), 15 * 48000, 48000));
        check(shifted.same() && Math.abs(shifted.offset - 6.0) < 0.1, "Shifted: " + shifted);

        // Other recordings don't: a different tune, and the same tune played a little faster
        // (another performance of the same song).
        for (long seed = 2; seed < 7; seed++) {
            Fingerprint.Match other =
                    Fingerprint.match(
                            reference,
                            Fingerprint.of(
                                    streamed(tune(seed, 30, 1.0), 0, 15, seed), 15 * 48000, 48000));
            check(!other.same(), "Different tune " + seed + " doesn't match: " + other);
        }
        Fingerprint.Match cover = null;
        for (double tempo : new double[] {1.03, 1.06, 0.95}) {
            cover =
                    Fingerprint.match(
                            reference,
                            Fingerprint.of(
                                    streamed(tune(1, 60, tempo), 0, 15, 3), 15 * 48000, 48000));
            check(!cover.same(), "Another performance (" + tempo + "x) doesn't match: " + cover);
        }

        // Silence and very short excerpts never match.
        float[] quiet = new float[15 * 48000];
        check(
                !Fingerprint.match(reference, Fingerprint.of(quiet, quiet.length, 48000)).same(),
                "Silence");
        check(
                !Fingerprint.match(reference, Fingerprint.of(heard, 4000, 48000)).same(),
                "Too short");

        long begin = System.nanoTime();
        Fingerprint.of(song, (int) (45 * 44100), 44100);
        long millis = (System.nanoTime() - begin) / 1_000_000;
        check(millis < 5000, "45 s fingerprinted in " + millis + " ms");
        System.out.println(
                "PASS: "
                        + checks
                        + " fingerprint FFT, same-recording, offset and other-recording checks ("
                        + same
                        + "; other at most "
                        + cover
                        + "; "
                        + millis
                        + " ms).");
    }
}
