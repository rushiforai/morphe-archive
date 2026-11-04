package app.tikkamasalla.stremio.oneahead.demux;

import java.io.ByteArrayOutputStream;
import java.util.Arrays;

/** Reads an stsd box's first entry into a {@link TrackInfo}. */
final class Mp4AudioEntry {
    private Mp4AudioEntry() {
    }

    /** b is the stsd body: 8 bytes of version and count, then the entry. */
    static void parse(byte[] b, TrackInfo t) {
        if (b.length < 8 + 36) return;
        int e = 8;
        long entrySize = Ebml.uint(b, e, 4);
        t.codecId = new String(b, e + 4, 4, java.nio.charset.StandardCharsets.ISO_8859_1);
        int version = (int) Ebml.uint(b, e + 16, 2);
        t.channels = (int) Ebml.uint(b, e + 24, 2);
        t.sampleRate = (int) Ebml.uint(b, e + 32, 2);
        // QuickTime sound descriptions carry 16 (v1) or 36 (v2) more bytes before the children.
        int children = e + 36 + (version == 1 ? 16 : version == 2 ? 36 : 0);
        if (version == 2 && b.length >= e + 36 + 16) {
            t.sampleRate = (int) Math.round(Double.longBitsToDouble(Ebml.uint(b, e + 40, 8)));
            t.channels = (int) Ebml.uint(b, e + 48, 4);
        }
        int end = (int) Math.min(b.length, e + entrySize);
        switch (t.codecId) {
            case "mp4a":
                parseEsds(b, children, end, t);
                break;
            case "ac-3":
                t.mime = "audio/ac3";
                break;
            case "ec-3":
                t.mime = "audio/eac3";
                break;
            case "Opus":
                t.mime = "audio/opus";
                int dops = find(b, children, end, "dOps");
                if (dops >= 0) t.codecPrivate = opusHead(b, dops, t);
                break;
            case "fLaC":
                t.mime = "audio/flac";
                int dfla = find(b, children, end, "dfLa");
                if (dfla >= 0) t.codecPrivate = flacPrivate(b, dfla);
                break;
            case ".mp3":
                t.mime = "audio/mpeg";
                break;
            default:
                break;
        }
    }

    /** Position after the header of the named child box, or -1. */
    private static int find(byte[] b, int from, int to, String type) {
        byte[] name = type.getBytes(java.nio.charset.StandardCharsets.ISO_8859_1);
        for (int p = from; p + 8 <= to; ) {
            long size = Ebml.uint(b, p, 4);
            if (size < 8 || p + size > to) return -1;
            if (b[p + 4] == name[0] && b[p + 5] == name[1] && b[p + 6] == name[2] && b[p + 7] == name[3]) return p + 8;
            p += (int) size;
        }
        return -1;
    }

    private static int boxEnd(byte[] b, int body) {
        return body - 8 + (int) Ebml.uint(b, body - 8, 4);
    }

    /** Proper descriptor walk: ES_Descriptor, then DecoderConfig (object type), then DecoderSpecificInfo. */
    private static void parseEsds(byte[] b, int from, int to, TrackInfo t) {
        int body = find(b, from, to, "esds");
        if (body < 0) return;
        int end = boxEnd(b, body);
        int[] cursor = {body + 4};
        int tag = descriptor(b, cursor, end);
        if (tag != 3) return;
        int p = cursor[0];
        if (p + 3 > end) return;
        int flags = b[p + 2] & 0xFF;
        p += 3;
        if ((flags & 0x80) != 0) p += 2;
        if ((flags & 0x40) != 0 && p < end) p += 1 + (b[p] & 0xFF);
        if ((flags & 0x20) != 0) p += 2;
        cursor[0] = p;
        tag = descriptor(b, cursor, end);
        if (tag != 4 || cursor[0] + 13 > end) return;
        int object = b[cursor[0]] & 0xFF;
        if (object == 0x40 || (object >= 0x66 && object <= 0x68)) t.mime = "audio/mp4a-latm";
        else if (object == 0x69 || object == 0x6B) t.mime = "audio/mpeg";
        else if (object == 0xA5) t.mime = "audio/ac3";
        else if (object == 0xA6) t.mime = "audio/eac3";
        cursor[0] += 13;
        if (cursor[0] < end && descriptor(b, cursor, end) == 5) {
            int length = lastDescriptorLength;
            if (cursor[0] + length <= end) t.codecPrivate = Arrays.copyOfRange(b, cursor[0], cursor[0] + length);
        }
    }

    private static int lastDescriptorLength;

    /** Reads a descriptor tag and length, leaving the cursor on its body. Returns the tag, or -1. */
    private static synchronized int descriptor(byte[] b, int[] cursor, int end) {
        int p = cursor[0];
        if (p >= end) return -1;
        int tag = b[p++] & 0xFF, length = 0;
        for (int i = 0; i < 4 && p < end; i++) {
            int v = b[p++] & 0xFF;
            length = (length << 7) | (v & 0x7F);
            if ((v & 0x80) == 0) break;
        }
        lastDescriptorLength = length;
        cursor[0] = p;
        return tag;
    }

    /** dOps is OpusHead in big-endian without the magic: rebuild the little-endian header. */
    private static byte[] opusHead(byte[] b, int d, TrackInfo t) {
        int end = boxEnd(b, d);
        if (d + 11 > end) return null;
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        out.write("OpusHead".getBytes(java.nio.charset.StandardCharsets.US_ASCII), 0, 8);
        out.write(1);
        out.write(b[d + 1]); // channels
        out.write(b[d + 3]); // pre-skip, swapped
        out.write(b[d + 2]);
        for (int i = 3; i >= 0; i--) out.write(b[d + 4 + i]); // input rate, swapped
        out.write(b[d + 9]); // gain, swapped
        out.write(b[d + 8]);
        out.write(b[d + 10]); // mapping family
        if (b[d + 10] != 0) out.write(b, d + 11, end - d - 11);
        long preSkip = Ebml.uint(b, d + 2, 2);
        t.codecDelayNs = preSkip * 1_000_000_000L / 48000;
        t.seekPreRollNs = 80_000_000L;
        return out.toByteArray();
    }

    /** dfLa holds the metadata blocks; the decoder wants them behind the stream marker. */
    private static byte[] flacPrivate(byte[] b, int d) {
        int end = boxEnd(b, d);
        if (d + 4 > end) return null;
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        out.write(new byte[]{'f', 'L', 'a', 'C'}, 0, 4);
        out.write(b, d + 4, end - d - 4);
        return out.toByteArray();
    }
}
