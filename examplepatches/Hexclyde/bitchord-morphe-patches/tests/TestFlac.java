package app.bitchord.telegram;

import java.io.ByteArrayOutputStream;

/**
 * A small FLAC encoder for tests: verbatim, fixed and LPC subframes with Rice-coded residuals, and
 * mid/side stereo, so the decoder's paths are all used without keeping audio files in the repo.
 */
final class TestFlac {
    private TestFlac() {}

    static final int BLOCK = 1152;

    /** A FLAC file of these samples ({@code pcm[channel][sample]}). */
    static byte[] encode(int[][] pcm, int rate, int bits, String vorbisCueSheet) {
        return withComment(
                pcm, rate, bits, vorbisCueSheet == null ? null : "CUESHEET=" + vorbisCueSheet);
    }

    /** As above, with one Vorbis comment such as "ENCODER=LAME3.100". */
    static byte[] withComment(int[][] pcm, int rate, int bits, String comment) {
        int channels = pcm.length, samples = pcm[0].length;
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        out.write('f');
        out.write('L');
        out.write('a');
        out.write('C');
        byte[] comments = comment == null ? null : comments(comment);
        // STREAMINFO
        out.write(comments == null ? 0x80 : 0x00);
        write(out, 34, 3);
        Writer si = new Writer();
        si.put(BLOCK, 16);
        si.put(BLOCK, 16);
        si.put(0, 24);
        si.put(0, 24);
        si.put(rate, 20);
        si.put(channels - 1, 3);
        si.put(bits - 1, 5);
        si.put((long) samples >>> 32, 4);
        si.put(samples, 32);
        for (int i = 0; i < 16; i++) si.put(0, 8);
        out.write(si.bytes(), 0, 34);
        if (comments != null) {
            out.write(0x80 | 4);
            write(out, comments.length, 3);
            out.write(comments, 0, comments.length);
        }
        for (int frame = 0, start = 0; start < samples; frame++, start += BLOCK) {
            int count = Math.min(BLOCK, samples - start);
            Writer w = new Writer();
            w.put(0x3ffe, 14);
            w.put(0, 1);
            w.put(0, 1); // fixed block size: frame numbers
            w.put(7, 4); // block size in 16 bits after the number
            w.put(0, 4); // rate from STREAMINFO
            boolean midSide = channels == 2 && frame % 2 == 1;
            w.put(midSide ? 10 : channels - 1, 4);
            w.put(bits == 16 ? 4 : bits == 24 ? 6 : 0, 3);
            w.put(0, 1);
            utf8(w, frame);
            w.put(count - 1, 16);
            byte[] head = w.bytes();
            w.put(FlacDecoder.crc8(head, 0, head.length), 8);
            for (int ch = 0; ch < channels; ch++) {
                int[] s = new int[count];
                int b = bits;
                for (int i = 0; i < count; i++) {
                    if (midSide) {
                        int l = pcm[0][start + i], r = pcm[1][start + i];
                        s[i] = ch == 0 ? (l + r) >> 1 : l - r;
                    } else s[i] = pcm[ch][start + i];
                }
                if (midSide && ch == 1) b++;
                int kind = (frame + ch) % 3;
                if (count < 4) kind = 0;
                if (kind == 0) {
                    w.put(0, 1);
                    w.put(1, 6);
                    w.put(0, 1);
                    for (int v : s) w.put(v, b);
                } else if (kind == 1) {
                    // Fixed, order 2.
                    w.put(0, 1);
                    w.put(8 + 2, 6);
                    w.put(0, 1);
                    w.put(s[0], b);
                    w.put(s[1], b);
                    int[] res = new int[count - 2];
                    for (int i = 2; i < count; i++) res[i - 2] = s[i] - (2 * s[i - 1] - s[i - 2]);
                    rice(w, res);
                } else {
                    // LPC, order 2, coefficients {2, -1} at precision 3, shift 0.
                    w.put(0, 1);
                    w.put(32 + 1, 6);
                    w.put(0, 1);
                    w.put(s[0], b);
                    w.put(s[1], b);
                    w.put(3 - 1, 4);
                    w.put(0, 5);
                    w.put(2, 3);
                    w.put(-1, 3);
                    int[] res = new int[count - 2];
                    for (int i = 2; i < count; i++) res[i - 2] = s[i] - (2 * s[i - 1] - s[i - 2]);
                    rice(w, res);
                }
            }
            w.align();
            byte[] body = w.bytes();
            int crc = FlacDecoder.crc16(body, 0, body.length);
            out.write(body, 0, body.length);
            out.write(crc >> 8);
            out.write(crc & 0xff);
        }
        return out.toByteArray();
    }

    /** One partition, with the best of a few Rice parameters. */
    private static void rice(Writer w, int[] res) {
        w.put(0, 2);
        w.put(0, 4);
        long sum = 0;
        for (int v : res) sum += Math.abs((long) v);
        int k = 0;
        while (k < 14 && (res.length << (k + 1)) < sum) k++;
        w.put(k, 4);
        for (int v : res) {
            long u = v >= 0 ? (long) v << 1 : ((-(long) v) << 1) - 1;
            long q = u >>> k;
            for (long i = 0; i < q; i++) w.put(0, 1);
            w.put(1, 1);
            if (k > 0) w.put(u & ((1L << k) - 1), k);
        }
    }

    private static void utf8(Writer w, long v) {
        if (v < 0x80) w.put(v, 8);
        else if (v < 0x800) {
            w.put(0xc0 | (v >> 6), 8);
            w.put(0x80 | (v & 0x3f), 8);
        } else {
            w.put(0xe0 | (v >> 12), 8);
            w.put(0x80 | ((v >> 6) & 0x3f), 8);
            w.put(0x80 | (v & 0x3f), 8);
        }
    }

    private static byte[] comments(String entry) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] vendor = "test".getBytes(java.nio.charset.StandardCharsets.UTF_8);
        le(out, vendor.length);
        out.write(vendor, 0, vendor.length);
        le(out, 1);
        byte[] e = entry.getBytes(java.nio.charset.StandardCharsets.UTF_8);
        le(out, e.length);
        out.write(e, 0, e.length);
        return out.toByteArray();
    }

    private static void le(ByteArrayOutputStream out, int v) {
        for (int i = 0; i < 4; i++) out.write(v >> (8 * i));
    }

    private static void write(ByteArrayOutputStream out, int v, int bytes) {
        for (int i = bytes - 1; i >= 0; i--) out.write(v >> (8 * i));
    }

    /** A test signal: a tone per channel with a little noise, at full scale for the bit depth. */
    static int[][] signal(int channels, int samples, int bits, long seed) {
        java.util.Random r = new java.util.Random(seed);
        int[][] pcm = new int[channels][samples];
        double peak = (1 << (bits - 1)) * 0.5;
        for (int ch = 0; ch < channels; ch++)
            for (int i = 0; i < samples; i++)
                pcm[ch][i] =
                        (int)
                                (peak * Math.sin(i * 0.031 * (ch + 1))
                                        + r.nextGaussian() * peak / 50);
        return pcm;
    }

    static final class Writer {
        private final ByteArrayOutputStream out = new ByteArrayOutputStream();
        private long acc;
        private int n;

        void put(long v, int bits) {
            for (int i = bits - 1; i >= 0; i--) {
                acc = acc << 1 | ((v >> i) & 1);
                if (++n == 8) {
                    out.write((int) acc);
                    acc = 0;
                    n = 0;
                }
            }
        }

        void align() {
            while (n != 0) put(0, 1);
        }

        byte[] bytes() {
            return out.toByteArray();
        }
    }
}
