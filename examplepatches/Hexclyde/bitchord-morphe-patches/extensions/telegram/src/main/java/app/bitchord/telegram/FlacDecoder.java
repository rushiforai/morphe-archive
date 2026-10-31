package app.bitchord.telegram;

/**
 * Decodes FLAC frames to samples. Used to play one track of an album kept as a single FLAC file
 * with a cue sheet: that track's samples are decoded and handed to the player as plain PCM, so it
 * starts and ends exactly where the cue sheet says.
 *
 * <p>Follows the FLAC format (RFC 9639): fixed and LPC predictors, Rice-coded residuals with
 * escapes, wasted bits and the three stereo decorrelations.
 */
final class FlacDecoder {
    private FlacDecoder() {}

    /** STREAMINFO, and where the first frame starts. */
    static final class Info {
        int minBlock, maxBlock, maxFrame, rate, channels, bits;
        long samples, firstFrame;
        // The file's own CUESHEET block and Vorbis comments, when it has them.
        byte[] cuesheet, comments;
    }

    /** A decoded frame: samples per channel, its first sample and how many bytes it took. */
    static final class Frame {
        int[][] samples;
        int count, channels, bits;
        long first;
        int length;
    }

    /** A frame header found by {@link #header}: where the frame's samples start in the stream. */
    static final class Header {
        int blockSize, channelAssignment, bits, rate, length;
        long number;
        boolean variable;
    }

    static final int[] RATES = {
        0, 88200, 176400, 192000, 8000, 16000, 22050, 24000, 32000, 44100, 48000, 96000
    };
    static final int[] SIZES = {0, 8, 12, 0, 16, 20, 24, 32};

    /** Reads STREAMINFO from the first bytes of a FLAC stream and finds its first frame. */
    static Info info(ZipDirectory.Range range, long size) throws Exception {
        byte[] head = range.read(0, 4 + 4 + 34);
        int start = AudioHeader.id3Size(head, head.length);
        if (start > 0) head = range.read(start, 4 + 4 + 34);
        if (head.length < 42
                || head[0] != 'f'
                || head[1] != 'L'
                || head[2] != 'a'
                || head[3] != 'C'
                || (head[4] & 0x7f) != 0) throw new java.io.IOException("Not a FLAC file");
        Info info = new Info();
        int s = 8;
        info.minBlock = be(head, s, 2);
        info.maxBlock = be(head, s + 2, 2);
        info.maxFrame = be(head, s + 7, 3);
        info.rate =
                ((head[s + 10] & 0xff) << 12)
                        | ((head[s + 11] & 0xff) << 4)
                        | ((head[s + 12] & 0xff) >> 4);
        info.channels = ((head[s + 12] & 0xff) >> 1 & 7) + 1;
        info.bits = (((head[s + 12] & 1) << 4) | ((head[s + 13] & 0xff) >> 4)) + 1;
        info.samples =
                ((long) (head[s + 13] & 0x0f) << 32)
                        | ((long) (head[s + 14] & 0xff) << 24)
                        | ((head[s + 15] & 0xff) << 16)
                        | ((head[s + 16] & 0xff) << 8)
                        | (head[s + 17] & 0xff);
        // The metadata blocks are walked by their headers, so a large cover is skipped unread.
        long at = start + 4;
        for (int n = 0; n < 1000; n++) {
            byte[] block = range.read(at, 4);
            if (block.length < 4) throw new java.io.IOException("Damaged FLAC file");
            int type = block[0] & 0x7f, length = be(block, 1, 3);
            if ((type == 4 || type == 5) && length <= 1 << 20) {
                byte[] body = range.read(at + 4, length);
                if (type == 4) info.comments = body;
                else info.cuesheet = body;
            }
            at += 4 + length;
            if ((block[0] & 0x80) != 0) break;
        }
        if (at >= size || info.rate == 0) throw new java.io.IOException("Damaged FLAC file");
        info.firstFrame = at;
        return info;
    }

    /**
     * The frame header at {@code at} in {@code b}, checked against its CRC-8 and the stream's
     * format, or null.
     */
    static Header header(byte[] b, int at, int end, Info info) {
        if (at + 6 > end || (b[at] & 0xff) != 0xff || ((b[at + 1] & 0xff) & 0xfe) != 0xf8)
            return null;
        Header h = new Header();
        h.variable = (b[at + 1] & 1) != 0;
        int sizeCode = (b[at + 2] & 0xff) >> 4, rateCode = b[at + 2] & 0x0f;
        h.channelAssignment = (b[at + 3] & 0xff) >> 4;
        int bitsCode = ((b[at + 3] & 0xff) >> 1) & 7;
        if ((b[at + 3] & 1) != 0 || sizeCode == 0 || rateCode == 15 || bitsCode == 3) return null;
        if (h.channelAssignment > 10) return null;
        int channels = h.channelAssignment < 8 ? h.channelAssignment + 1 : 2;
        if (channels != info.channels) return null;
        int p = at + 4;
        // The frame or sample number, coded like UTF-8.
        int first = b[p] & 0xff, extra;
        long number;
        if (first < 0x80) {
            number = first;
            extra = 0;
        } else if (first >= 0xc0 && first < 0xe0) {
            number = first & 0x1f;
            extra = 1;
        } else if (first >= 0xe0 && first < 0xf0) {
            number = first & 0x0f;
            extra = 2;
        } else if (first >= 0xf0 && first < 0xf8) {
            number = first & 0x07;
            extra = 3;
        } else if (first >= 0xf8 && first < 0xfc) {
            number = first & 0x03;
            extra = 4;
        } else if (first >= 0xfc && first < 0xfe) {
            number = first & 0x01;
            extra = 5;
        } else if (first == 0xfe) {
            number = 0;
            extra = 6;
        } else return null;
        p++;
        for (int i = 0; i < extra; i++, p++) {
            if (p >= end || ((b[p] & 0xff) >> 6) != 2) return null;
            number = number << 6 | (b[p] & 0x3f);
        }
        h.number = number;
        if (sizeCode == 1) h.blockSize = 192;
        else if (sizeCode <= 5) h.blockSize = 576 << (sizeCode - 2);
        else if (sizeCode == 6) {
            if (p >= end) return null;
            h.blockSize = (b[p++] & 0xff) + 1;
        } else if (sizeCode == 7) {
            if (p + 1 >= end) return null;
            h.blockSize = be(b, p, 2) + 1;
            p += 2;
        } else h.blockSize = 256 << (sizeCode - 8);
        if (rateCode == 0) h.rate = info.rate;
        else if (rateCode < 12) h.rate = RATES[rateCode];
        else if (rateCode == 12) {
            if (p >= end) return null;
            h.rate = (b[p++] & 0xff) * 1000;
        } else {
            if (p + 1 >= end) return null;
            h.rate = be(b, p, 2) * (rateCode == 14 ? 10 : 1);
            p += 2;
        }
        if (h.rate != info.rate) return null;
        h.bits = bitsCode == 0 ? info.bits : SIZES[bitsCode];
        if (h.bits != info.bits) return null;
        if (p >= end || crc8(b, at, p) != (b[p] & 0xff)) return null;
        h.length = p + 1 - at;
        if (h.blockSize > 65535 || (info.maxBlock > 0 && h.blockSize > info.maxBlock)) return null;
        return h;
    }

    /** The first sample a frame holds. */
    static long firstSample(Header h, Info info) {
        if (h.variable) return h.number;
        // Fixed block sizes: every frame but the last has the stream's block size.
        int block =
                info.minBlock == info.maxBlock && info.maxBlock > 0 ? info.maxBlock : h.blockSize;
        return h.number * block;
    }

    /**
     * Decodes the frame starting at {@code at} in {@code b}; null when the bytes run out before its
     * end or its CRC-16 doesn't match, which is how a false frame start shows itself.
     */
    static Frame decode(byte[] b, int at, int end, Info info) {
        Header h = header(b, at, end, info);
        if (h == null) return null;
        Bits in = new Bits(b, at + h.length, end);
        int channels = info.channels, count = h.blockSize;
        int[][] samples = new int[channels][count];
        try {
            for (int ch = 0; ch < channels; ch++) {
                int bits = h.bits;
                boolean side =
                        (h.channelAssignment == 8 && ch == 1)
                                || (h.channelAssignment == 9 && ch == 0)
                                || (h.channelAssignment == 10 && ch == 1);
                if (side) bits++;
                subframe(in, samples[ch], count, bits);
            }
            in.align();
            int footer = in.bytePosition();
            if (footer + 2 > end) return null;
            int crc = be(b, footer, 2);
            if (crc16(b, at, footer) != crc) return null;
            decorrelate(samples, h.channelAssignment, count);
            Frame f = new Frame();
            f.samples = samples;
            f.count = count;
            f.channels = channels;
            f.bits = h.bits;
            f.first = firstSample(h, info);
            f.length = footer + 2 - at;
            return f;
        } catch (ArrayIndexOutOfBoundsException | IllegalStateException e) {
            return null;
        }
    }

    private static void subframe(Bits in, int[] out, int count, int bits) {
        if (in.read(1) != 0) throw new IllegalStateException();
        int type = in.read(6);
        int wasted = 0;
        if (in.read(1) == 1) {
            wasted = 1;
            while (in.read(1) == 0) wasted++;
            bits -= wasted;
        }
        if (bits <= 0 || bits > 33) throw new IllegalStateException();
        if (type == 0) {
            int value = in.signed(bits);
            for (int i = 0; i < count; i++) out[i] = value;
        } else if (type == 1) {
            for (int i = 0; i < count; i++) out[i] = in.signed(bits);
        } else if (type >= 8 && type <= 12) {
            int order = type - 8;
            if (order > count) throw new IllegalStateException();
            for (int i = 0; i < order; i++) out[i] = in.signed(bits);
            residual(in, out, count, order);
            fixed(out, count, order);
        } else if (type >= 32) {
            int order = type - 31;
            if (order > count) throw new IllegalStateException();
            for (int i = 0; i < order; i++) out[i] = in.signed(bits);
            int precision = in.read(4) + 1;
            if (precision == 16) throw new IllegalStateException();
            int shift = in.signed(5);
            if (shift < 0) throw new IllegalStateException();
            int[] coefficients = new int[order];
            for (int i = 0; i < order; i++) coefficients[i] = in.signed(precision);
            residual(in, out, count, order);
            for (int i = order; i < count; i++) {
                long sum = 0;
                for (int j = 0; j < order; j++) sum += (long) coefficients[j] * out[i - 1 - j];
                out[i] += (int) (sum >> shift);
            }
        } else throw new IllegalStateException();
        if (wasted > 0) for (int i = 0; i < count; i++) out[i] <<= wasted;
    }

    private static void residual(Bits in, int[] out, int count, int order) {
        int method = in.read(2);
        if (method > 1) throw new IllegalStateException();
        int paramBits = method == 0 ? 4 : 5, escape = method == 0 ? 15 : 31;
        int partitionOrder = in.read(4);
        int partitions = 1 << partitionOrder;
        if ((count >> partitionOrder) < order || (count & (partitions - 1)) != 0)
            throw new IllegalStateException();
        int i = order;
        for (int p = 0; p < partitions; p++) {
            int n = (count >> partitionOrder) - (p == 0 ? order : 0);
            int param = in.read(paramBits);
            if (param == escape) {
                int raw = in.read(5);
                for (int k = 0; k < n; k++) out[i++] = raw == 0 ? 0 : in.signed(raw);
            } else
                for (int k = 0; k < n; k++) {
                    int q = in.unary();
                    long v = ((long) q << param) | (param == 0 ? 0 : in.read(param));
                    out[i++] = (int) ((v >>> 1) ^ -(v & 1));
                }
        }
    }

    private static void fixed(int[] s, int count, int order) {
        switch (order) {
            case 1:
                for (int i = 1; i < count; i++) s[i] += s[i - 1];
                break;
            case 2:
                for (int i = 2; i < count; i++) s[i] += 2 * s[i - 1] - s[i - 2];
                break;
            case 3:
                for (int i = 3; i < count; i++) s[i] += 3 * s[i - 1] - 3 * s[i - 2] + s[i - 3];
                break;
            case 4:
                for (int i = 4; i < count; i++)
                    s[i] += 4 * s[i - 1] - 6 * s[i - 2] + 4 * s[i - 3] - s[i - 4];
                break;
            default:
                break;
        }
    }

    private static void decorrelate(int[][] s, int assignment, int count) {
        if (assignment == 8) for (int i = 0; i < count; i++) s[1][i] = s[0][i] - s[1][i];
        else if (assignment == 9) for (int i = 0; i < count; i++) s[0][i] += s[1][i];
        else if (assignment == 10)
            for (int i = 0; i < count; i++) {
                long mid = ((long) s[0][i] << 1) | (s[1][i] & 1);
                long side = s[1][i];
                s[0][i] = (int) ((mid + side) >> 1);
                s[1][i] = (int) ((mid - side) >> 1);
            }
    }

    static int crc8(byte[] b, int from, int to) {
        int crc = 0;
        for (int i = from; i < to; i++) {
            crc ^= b[i] & 0xff;
            for (int k = 0; k < 8; k++)
                crc = (crc & 0x80) != 0 ? ((crc << 1) ^ 0x07) & 0xff : (crc << 1) & 0xff;
        }
        return crc;
    }

    static int crc16(byte[] b, int from, int to) {
        int crc = 0;
        for (int i = from; i < to; i++) {
            crc ^= (b[i] & 0xff) << 8;
            for (int k = 0; k < 8; k++)
                crc = (crc & 0x8000) != 0 ? ((crc << 1) ^ 0x8005) & 0xffff : (crc << 1) & 0xffff;
        }
        return crc;
    }

    static int be(byte[] b, int at, int bytes) {
        int v = 0;
        for (int i = 0; i < bytes; i++) v = v << 8 | (b[at + i] & 0xff);
        return v;
    }

    /** Most significant bit first. Running off the end throws, which ends the frame as damaged. */
    static final class Bits {
        private final byte[] b;
        private final int end;
        private long position;

        Bits(byte[] b, int start, int end) {
            this.b = b;
            this.end = end;
            this.position = (long) start * 8;
        }

        int read(int n) {
            int v = 0;
            for (int i = 0; i < n; i++) {
                int at = (int) (position >> 3);
                if (at >= end) throw new IllegalStateException();
                v = v << 1 | ((b[at] >> (7 - (position & 7))) & 1);
                position++;
            }
            return v;
        }

        int signed(int n) {
            if (n == 33) {
                long v = 0;
                for (int i = 0; i < 33; i++) v = v << 1 | read(1);
                return (int) ((v << 31) >> 31);
            }
            int v = read(n);
            return n == 32 ? v : (v << (32 - n)) >> (32 - n);
        }

        int unary() {
            int n = 0;
            while (true) {
                int at = (int) (position >> 3);
                if (at >= end) throw new IllegalStateException();
                int bit = (b[at] >> (7 - (position & 7))) & 1;
                position++;
                if (bit == 1) return n;
                n++;
            }
        }

        void align() {
            position = (position + 7) & ~7L;
        }

        int bytePosition() {
            return (int) (position >> 3);
        }
    }
}
