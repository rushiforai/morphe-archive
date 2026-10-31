package app.bitchord.telegram;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;

/**
 * Chromaprint fingerprints, the kind AcoustID looks songs up by: what notes sound how strongly,
 * moment by moment, folded into 32 bits per eighth of a second.
 *
 * <p>A port of Chromaprint's default algorithm (MIT licence, github.com/acoustid/chromaprint), with
 * its resampler from FFmpeg (LGPL 2.1 or later). The audio is brought to 11,025 Hz, cut into frames
 * of 4,096 samples a third of a frame apart, and each frame's spectrum folded into the 12 notes of
 * the scale. Sixteen filters over the last 16 frames of those notes give two bits each.
 */
final class Chromaprint {
    private Chromaprint() {}

    static final int RATE = 11025, FRAME = 4096, STEP = FRAME / 3, ALGORITHM = 1;
    static final int MIN_FREQ = 28, MAX_FREQ = 3520;

    /** How much of a file is fingerprinted, as fpcalc does. */
    static final int SECONDS = 120;

    private static final double[] CHROMA_FILTER = {0.25, 0.75, 1.0, 0.75, 0.25};

    // {type, y, height, width, t0, t1, t2}: Chromaprint's classifiers for its default algorithm.
    private static final double[][] CLASSIFIERS = {
        {0, 4, 3, 15, 1.98215, 2.35817, 2.63523},
        {4, 4, 6, 15, -1.03809, -0.651211, -0.282167},
        {1, 0, 4, 16, -0.298702, 0.119262, 0.558497},
        {3, 8, 2, 12, -0.105439, 0.0153946, 0.135898},
        {3, 4, 4, 8, -0.142891, 0.0258736, 0.200632},
        {4, 0, 3, 5, -0.826319, -0.590612, -0.368214},
        {1, 2, 2, 9, -0.557409, -0.233035, 0.0534525},
        {2, 7, 3, 4, -0.0646826, 0.00620476, 0.0784847},
        {2, 6, 2, 16, -0.192387, -0.029699, 0.215855},
        {2, 1, 3, 2, -0.0397818, -0.00568076, 0.0292026},
        {5, 10, 1, 15, -0.53823, -0.369934, -0.190235},
        {3, 6, 2, 10, -0.124877, 0.0296483, 0.139239},
        {2, 1, 1, 14, -0.101475, 0.0225617, 0.231971},
        {3, 5, 6, 4, -0.0799915, -0.00729616, 0.063262},
        {1, 9, 2, 12, -0.272556, 0.019424, 0.302559},
        {3, 4, 2, 14, -0.164292, -0.0321188, 0.0846339},
    };
    private static final int MAX_WIDTH = 16;
    private static final int[] GRAY = {0, 1, 3, 2};

    /** The fingerprint of mono 16-bit samples at {@code rate}, one value per step. */
    static int[] fingerprint(short[] samples, int length, int rate) {
        short[] audio =
                rate == RATE ? Arrays.copyOf(samples, length) : resample(samples, length, rate);
        double[] window = new double[FRAME];
        for (int i = 0; i < FRAME; i++)
            window[i] = (0.54 - 0.46 * Math.cos(i * 2.0 * Math.PI / (FRAME - 1))) / 32767.0;
        int min = Math.max(1, index(MIN_FREQ)), max = Math.min(FRAME / 2, index(MAX_FREQ));
        int[] notes = new int[FRAME];
        for (int i = min; i < max; i++) {
            double freq = (double) i * RATE / FRAME;
            double octave = Math.log(freq / (440.0 / 16.0)) / Math.log(2.0);
            notes[i] = (int) (12 * (octave - Math.floor(octave)));
        }
        List<double[]> chroma = new ArrayList<>();
        double[] re = new double[FRAME], im = new double[FRAME];
        for (int start = 0; start + FRAME <= audio.length; start += STEP) {
            for (int i = 0; i < FRAME; i++) {
                re[i] = audio[start + i] * window[i];
                im[i] = 0;
            }
            Fingerprint.fft(re, im);
            double[] features = new double[12];
            for (int i = min; i < max; i++) features[notes[i]] += re[i] * re[i] + im[i] * im[i];
            chroma.add(features);
        }
        // Smoothed over five frames, then each frame scaled to length 1.
        List<double[]> rows = new ArrayList<>();
        for (int f = CHROMA_FILTER.length - 1; f < chroma.size(); f++) {
            double[] row = new double[12];
            for (int j = 0; j < CHROMA_FILTER.length; j++) {
                double[] from = chroma.get(f - CHROMA_FILTER.length + 1 + j);
                for (int i = 0; i < 12; i++) row[i] += from[i] * CHROMA_FILTER[j];
            }
            double norm = 0;
            for (double v : row) norm += v * v;
            norm = norm > 0 ? Math.sqrt(norm) : 0;
            for (int i = 0; i < 12; i++) row[i] = norm < 0.01 ? 0 : row[i] / norm;
            rows.add(row);
        }
        // An integral image: each cell the sum of everything above and to the left of it.
        int n = rows.size();
        double[][] image = new double[n][12];
        for (int r = 0; r < n; r++)
            for (int c = 0; c < 12; c++)
                image[r][c] =
                        rows.get(r)[c]
                                + (c > 0 ? image[r][c - 1] : 0)
                                + (r > 0 ? image[r - 1][c] : 0)
                                - (r > 0 && c > 0 ? image[r - 1][c - 1] : 0);
        int count = Math.max(0, n - MAX_WIDTH + 1);
        int[] out = new int[count];
        for (int x = 0; x < count; x++) {
            int bits = 0;
            for (double[] k : CLASSIFIERS) {
                double value = filter((int) k[0], image, x, (int) k[1], (int) k[3], (int) k[2]);
                int q = value < k[5] ? (value < k[4] ? 0 : 1) : (value < k[6] ? 2 : 3);
                bits = (bits << 2) | GRAY[q];
            }
            out[x] = bits;
        }
        return out;
    }

    private static int index(double freq) {
        return (int) Math.round(FRAME * freq / RATE);
    }

    /** Sum of rows [r1, r2) and columns [c1, c2). */
    private static double area(double[][] image, int r1, int c1, int r2, int c2) {
        if (r1 == r2 || c1 == c2) return 0;
        double total = image[r2 - 1][c2 - 1];
        if (r1 > 0) total -= image[r1 - 1][c2 - 1];
        if (c1 > 0) total -= image[r2 - 1][c1 - 1];
        if (r1 > 0 && c1 > 0) total += image[r1 - 1][c1 - 1];
        return total;
    }

    private static double compare(double a, double b) {
        return Math.log((1.0 + a) / (1.0 + b));
    }

    private static double filter(int type, double[][] im, int x, int y, int w, int h) {
        double a, b;
        switch (type) {
            case 0:
                return compare(area(im, x, y, x + w, y + h), 0);
            case 1:
                a = area(im, x, y + h / 2, x + w, y + h);
                b = area(im, x, y, x + w, y + h / 2);
                return compare(a, b);
            case 2:
                a = area(im, x + w / 2, y, x + w, y + h);
                b = area(im, x, y, x + w / 2, y + h);
                return compare(a, b);
            case 3:
                a =
                        area(im, x, y + h / 2, x + w / 2, y + h)
                                + area(im, x + w / 2, y, x + w, y + h / 2);
                b =
                        area(im, x, y, x + w / 2, y + h / 2)
                                + area(im, x + w / 2, y + h / 2, x + w, y + h);
                return compare(a, b);
            case 4:
                a = area(im, x, y + h / 3, x + w, y + 2 * (h / 3));
                b = area(im, x, y, x + w, y + h / 3) + area(im, x, y + 2 * (h / 3), x + w, y + h);
                return compare(a, b);
            default:
                a = area(im, x + w / 3, y, x + 2 * (w / 3), y + h);
                b = area(im, x, y, x + w / 3, y + h) + area(im, x + 2 * (w / 3), y, x + w, y + h);
                return compare(a, b);
        }
    }

    // ── Resampling to 11,025 Hz, as Chromaprint does with FFmpeg's resampler ──

    private static final int FILTER_SIZE = 16, PHASE_SHIFT = 8, PHASES = 1 << PHASE_SHIFT;
    private static final int FILTER_SHIFT = 15, BUFFER = 32 * 1024;
    private static final double CUTOFF = 0.8;

    static short[] resample(short[] input, int length, int rate) {
        double factor = Math.min(RATE * CUTOFF / rate, 1.0);
        int taps = Math.max((int) Math.ceil(FILTER_SIZE / factor), 1);
        short[] bank = new short[taps * PHASES];
        double[] tab = new double[taps];
        int center = (taps - 1) / 2;
        for (int ph = 0; ph < PHASES; ph++) {
            double norm = 0;
            for (int i = 0; i < taps; i++) {
                double x = Math.PI * ((double) (i - center) - (double) ph / PHASES) * factor;
                double y = x == 0 ? 1.0 : Math.sin(x) / x;
                double w = 2.0 * x / (factor * taps * Math.PI);
                y *= bessel(9 * Math.sqrt(Math.max(1 - w * w, 0)));
                tab[i] = y;
                norm += y;
            }
            for (int i = 0; i < taps; i++) {
                long v = (long) Math.rint((float) (tab[i] * (1 << FILTER_SHIFT) / norm));
                bank[ph * taps + i] =
                        (short) Math.max(Short.MIN_VALUE, Math.min(Short.MAX_VALUE, v));
            }
        }
        int srcIncr = RATE, dstIncr = rate * PHASES;
        int whole = dstIncr / srcIncr, part = dstIncr % srcIncr;
        int index = -PHASES * ((taps - 1) / 2), frac = 0;
        // Chromaprint feeds the resampler 32,768 samples at a time, keeps what it didn't use, and
        // resamples what's left once more at the end.
        short[] buffer = new short[BUFFER];
        int filled = 0, read = 0, written = 0;
        short[] out = new short[(int) ((long) length * RATE / rate) + 16];
        while (true) {
            int n = Math.min(length - read, BUFFER - filled);
            System.arraycopy(input, read, buffer, filled, n);
            filled += n;
            read += n;
            boolean full = filled == BUFFER;
            if (!full && filled == 0) break;
            int start = written;
            while (written - start < BUFFER) {
                int sample = index >> PHASE_SHIFT;
                int phase = index & (PHASES - 1);
                long val = 0;
                if (sample < 0) {
                    for (int i = 0; i < taps; i++)
                        val += buffer[Math.abs(sample + i) % filled] * bank[phase * taps + i];
                } else if (sample + taps > filled) break;
                else
                    for (int i = 0; i < taps; i++)
                        val += buffer[sample + i] * bank[phase * taps + i];
                val = (val + (1 << (FILTER_SHIFT - 1))) >> FILTER_SHIFT;
                if (written >= out.length) out = Arrays.copyOf(out, out.length * 2);
                out[written++] = (short) Math.max(Short.MIN_VALUE, Math.min(Short.MAX_VALUE, val));
                frac += part;
                index += whole;
                if (frac >= srcIncr) {
                    frac -= srcIncr;
                    index++;
                }
            }
            int consumed = Math.max(index, 0) >> PHASE_SHIFT;
            if (index >= 0) index &= PHASES - 1;
            int remaining = Math.max(0, filled - consumed);
            System.arraycopy(buffer, consumed, buffer, 0, remaining);
            filled = remaining;
            if (!full) break;
        }
        return Arrays.copyOf(out, written);
    }

    private static double bessel(double x) {
        double v = 1, last = 0, t = 1;
        x = x * x / 4;
        for (int i = 1; v != last; i++) {
            last = v;
            t *= x / ((double) i * i);
            v += t;
        }
        return v;
    }

    // ── The compressed form AcoustID takes ──────────────────────────────────

    /** The fingerprint as fpcalc prints it: compressed, then URL-safe base64. */
    static String encode(int[] fingerprint) {
        List<Integer> normal = new ArrayList<>(), exceptional = new ArrayList<>();
        for (int i = 0; i < fingerprint.length; i++) {
            int x = i == 0 ? fingerprint[0] : fingerprint[i] ^ fingerprint[i - 1];
            int bit = 1, last = 0;
            while (x != 0) {
                if ((x & 1) != 0) {
                    int value = bit - last;
                    if (value >= 7) {
                        normal.add(7);
                        exceptional.add(value - 7);
                    } else normal.add(value);
                    last = bit;
                }
                x >>>= 1;
                bit++;
            }
            normal.add(0);
        }
        int size = fingerprint.length;
        byte[] out = new byte[4 + (normal.size() * 3 + 7) / 8 + (exceptional.size() * 5 + 7) / 8];
        out[0] = (byte) ALGORITHM;
        out[1] = (byte) (size >> 16);
        out[2] = (byte) (size >> 8);
        out[3] = (byte) size;
        int p = pack(normal, 3, out, 4);
        pack(exceptional, 5, out, p);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(out);
    }

    /** Values of {@code bits} bits each, packed least significant first; returns the next byte. */
    private static int pack(List<Integer> values, int bits, byte[] out, int at) {
        long buffer = 0;
        int have = 0;
        for (int v : values) {
            buffer |= (long) (v & ((1 << bits) - 1)) << have;
            have += bits;
            while (have >= 8) {
                out[at++] = (byte) buffer;
                buffer >>>= 8;
                have -= 8;
            }
        }
        if (have > 0) out[at++] = (byte) buffer;
        return at;
    }
}
