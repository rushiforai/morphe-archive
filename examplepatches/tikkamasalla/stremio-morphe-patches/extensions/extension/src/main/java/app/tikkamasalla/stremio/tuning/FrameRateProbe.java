package app.tikkamasalla.stremio.tuning;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Reads a video's frame rate from the stream header: Matroska/WebM (Tracks, video DefaultDuration) and MP4/MOV (moov,
 * mdhd timescale and stts). One head read, plus one capped read when an MP4's moov sits behind the media data.
 * No Android types. Every failure is "no frame rate" (-1), never an exception.
 */
final class FrameRateProbe {
    static final long BUDGET_MS = 800L;
    static final int HEAD_BYTES = 128 * 1024;
    static final int MOOV_CAP_BYTES = 1024 * 1024;
    private static final int HOPS = 5;

    private static final int ID_EBML = 0x1A45DFA3, ID_SEGMENT = 0x18538067, ID_TRACKS = 0x1654AE6B, ID_CLUSTER = 0x1F43B675,
            ID_TRACK_ENTRY = 0xAE, ID_TRACK_TYPE = 0x83, ID_DEFAULT_DURATION = 0x23E383;
    private static final int TRACK_VIDEO = 1;

    private static final int BOX_MOOV = box("moov"), BOX_TRAK = box("trak"), BOX_MDIA = box("mdia"), BOX_MDHD = box("mdhd"),
            BOX_HDLR = box("hdlr"), BOX_MINF = box("minf"), BOX_STBL = box("stbl"), BOX_STTS = box("stts"), BOX_FTYP = box("ftyp"),
            BOX_MDAT = box("mdat"), BOX_FREE = box("free"), BOX_SKIP = box("skip"), BOX_WIDE = box("wide"), HANDLER_VIDE = box("vide");

    /** One frame duration must cover this share of the frames; below that it is variable frame rate: no answer. */
    private static final int DOMINANT_PERCENT = 75;

    private FrameRateProbe() {
    }

    private static int box(String name) {
        return (name.charAt(0) << 24) | (name.charAt(1) << 16) | (name.charAt(2) << 8) | name.charAt(3);
    }

    // ----------------------------------------------------------------- sources

    interface Source {
        /** Up to length bytes from this offset; null on any failure. */
        byte[] read(long from, int length);

        /** The file size if the last answer told it, else -1. */
        long total();
    }

    /** The frame rate of the stream, or -1. Never throws. */
    static float read(String url, long budgetMs) {
        try {
            if (url == null || !(url.startsWith("http://") || url.startsWith("https://"))) return -1f;
            return read(new Http(url, budgetMs));
        } catch (Throwable ignored) {
            return -1f;
        }
    }

    static float read(Source source) {
        byte[] head = source.read(0L, HEAD_BYTES);
        if (head == null || head.length < 16) return -1f;
        if (readId(head, 0) == ID_EBML) return parseMatroska(head);
        if (!looksLikeMp4(head)) return -1f;
        // The moov is either in the head, or right behind the first box too big for it (the media data).
        long at = 0L;
        while (at + 8L <= head.length) {
            int p = (int) at;
            long size = boxSize(head, p);
            int type = int32(head, p + 4);
            if (type == BOX_MOOV) return parseMoov(head, boxBody(head, p), clampEnd(at, size, head.length));
            if (size <= 0L) return -1f;
            at += size;
        }
        long total = source.total();
        if (at <= 0L || (total > 0L && at + 8L > total)) return -1f;
        byte[] tail = source.read(at, MOOV_CAP_BYTES);
        if (tail == null || tail.length < 16) return -1f;
        long tailAt = 0L;
        while (tailAt + 8L <= tail.length) {
            int p = (int) tailAt;
            long size = boxSize(tail, p);
            int type = int32(tail, p + 4);
            if (type == BOX_MOOV) return parseMoov(tail, boxBody(tail, p), clampEnd(tailAt, size, tail.length));
            if (size <= 0L) return -1f;
            tailAt += size;
        }
        return -1f;
    }

    private static boolean looksLikeMp4(byte[] head) {
        int type = int32(head, 4);
        return type == BOX_FTYP || type == BOX_MOOV || type == BOX_MDAT || type == BOX_FREE || type == BOX_SKIP || type == BOX_WIDE;
    }

    // ----------------------------------------------------------------- Matroska

    /** The first video track's DefaultDuration as a frame rate, or -1. Tracks must be in the buffer (it always is in practice). */
    static float parseMatroska(byte[] b) {
        try {
            if (readId(b, 0) != ID_EBML) return -1f;
            int p = idLen(b[0]);
            long size = readSize(b, p);
            if (size < 0L) return -1f;
            p = p + sizeLen(b[p]) + (int) size;
            if (readId(b, p) != ID_SEGMENT) return -1f;
            p += idLen(b[p]);
            p += sizeLen(b[p]);
            while (p + 2 < b.length) {
                int id = readId(b, p);
                if (id == -1) return -1f;
                int idLength = idLen(b[p]);
                long childSize = readSize(b, p + idLength);
                int sizeLength = sizeLen(b[p + idLength]);
                if (sizeLength == 0) return -1f;
                int body = p + idLength + sizeLength;
                if (id == ID_TRACKS) return parseTracks(b, body, end(body, childSize, b.length));
                if (id == ID_CLUSTER || childSize < 0L) return -1f;
                long next = body + childSize;
                if (next > b.length) return -1f;
                p = (int) next;
            }
        } catch (Throwable ignored) {
            // A malformed or cut header: no answer.
        }
        return -1f;
    }

    private static float parseTracks(byte[] b, int from, int to) {
        int p = from;
        while (p + 2 < to) {
            int id = readId(b, p);
            if (id == -1) return -1f;
            int idLength = idLen(b[p]);
            long size = readSize(b, p + idLength);
            int sizeLength = sizeLen(b[p + idLength]);
            if (size < 0L || sizeLength == 0) return -1f;
            int body = p + idLength + sizeLength;
            if (id == ID_TRACK_ENTRY) {
                float fps = parseTrackEntry(b, body, end(body, size, to));
                if (fps != 0f) return fps;
            }
            long next = body + size;
            if (next > to) return -1f;
            p = (int) next;
        }
        return -1f;
    }

    /** 0: not a video track. -1: a video track without DefaultDuration. */
    private static float parseTrackEntry(byte[] b, int from, int to) {
        long type = -1L;
        long duration = -1L;
        int p = from;
        while (p + 2 < to) {
            int id = readId(b, p);
            if (id == -1) break;
            int idLength = idLen(b[p]);
            long size = readSize(b, p + idLength);
            int sizeLength = sizeLen(b[p + idLength]);
            if (size < 0L || sizeLength == 0) break;
            int body = p + idLength + sizeLength;
            long next = body + size;
            if (next > to) break;
            if (id == ID_TRACK_TYPE && size <= 8L) type = readUInt(b, body, (int) size);
            else if (id == ID_DEFAULT_DURATION && size <= 8L) duration = readUInt(b, body, (int) size);
            p = (int) next;
        }
        if (type != TRACK_VIDEO) return 0f;
        return duration > 0L ? (float) (1e9d / duration) : -1f;
    }

    private static int end(int body, long size, int limit) {
        if (size < 0L || body + size > limit) return limit;
        return (int) (body + size);
    }

    private static int idLen(byte first) {
        int v = first & 0xFF;
        if (v >= 0x80) return 1;
        if (v >= 0x40) return 2;
        if (v >= 0x20) return 3;
        if (v >= 0x10) return 4;
        return 0;
    }

    private static int sizeLen(byte first) {
        int v = first & 0xFF;
        for (int i = 0; i < 8; i++) {
            if ((v & (0x80 >> i)) != 0) return i + 1;
        }
        return 0;
    }

    private static int readId(byte[] b, int p) {
        if (p < 0 || p >= b.length) return -1;
        int len = idLen(b[p]);
        if (len == 0 || p + len > b.length) return -1;
        int id = 0;
        for (int i = 0; i < len; i++) id = (id << 8) | (b[p + i] & 0xFF);
        return id;
    }

    /** -1 = unknown size (all ones) or truncated. */
    private static long readSize(byte[] b, int p) {
        if (p >= b.length) return -1L;
        int len = sizeLen(b[p]);
        if (len == 0 || p + len > b.length) return -1L;
        long value = (b[p] & 0xFF) & (0xFF >> len);
        boolean allOnes = value == (0xFF >> len);
        for (int i = 1; i < len; i++) {
            value = (value << 8) | (b[p + i] & 0xFF);
            if ((b[p + i] & 0xFF) != 0xFF) allOnes = false;
        }
        return allOnes ? -1L : value;
    }

    private static long readUInt(byte[] b, int p, int len) {
        long value = 0L;
        for (int i = 0; i < len && p + i < b.length; i++) value = (value << 8) | (b[p + i] & 0xFF);
        return value;
    }

    // ----------------------------------------------------------------- MP4 / MOV

    private static int int32(byte[] b, int p) {
        if (p < 0 || p + 4 > b.length) return 0;
        return ((b[p] & 0xFF) << 24) | ((b[p + 1] & 0xFF) << 16) | ((b[p + 2] & 0xFF) << 8) | (b[p + 3] & 0xFF);
    }

    private static long uint32(byte[] b, int p) {
        return int32(b, p) & 0xFFFFFFFFL;
    }

    /** Whole box size; -1 for "to the end of the file" (0) and for anything unreadable. */
    private static long boxSize(byte[] b, int p) {
        if (p + 8 > b.length) return -1L;
        long size = uint32(b, p);
        if (size == 1L) {
            if (p + 16 > b.length) return -1L;
            size = (uint32(b, p + 8) << 32) | uint32(b, p + 12);
            return size >= 16L ? size : -1L;
        }
        if (size == 0L) return -1L;
        return size >= 8L ? size : -1L;
    }

    private static int boxBody(byte[] b, int p) {
        return uint32(b, p) == 1L ? p + 16 : p + 8;
    }

    /** A size-less or too long box ends with the buffer. */
    private static int clampEnd(long at, long size, int limit) {
        if (size <= 0L || at + size > limit) return limit;
        return (int) (at + size);
    }

    /** The frame rate of the first video track, -1 when it has no usable stts (cut off, fragmented, variable). */
    static float parseMoov(byte[] b, int from, int to) {
        try {
            int p = from;
            while (p + 8 <= to) {
                long size = boxSize(b, p);
                if (size < 0L) return -1f;
                if (int32(b, p + 4) == BOX_TRAK) {
                    int[] mdia = child(b, boxBody(b, p), clampEnd(p, size, to), BOX_MDIA);
                    if (mdia != null && isVideo(b, mdia[0], mdia[1])) return mediaFps(b, mdia[0], mdia[1]);
                }
                if (p + size > to) return -1f;
                p += (int) size;
            }
        } catch (Throwable ignored) {
            // A malformed or cut header: no answer.
        }
        return -1f;
    }

    /** {body, end} of the first child of that type, null when absent; a child cut off by the buffer ends with the buffer. */
    private static int[] child(byte[] b, int from, int to, int type) {
        int p = from;
        while (p + 8 <= to) {
            long size = boxSize(b, p);
            if (size < 0L) return null;
            if (int32(b, p + 4) == type) return new int[]{boxBody(b, p), clampEnd(p, size, to)};
            if (p + size > to) return null;
            p += (int) size;
        }
        return null;
    }

    private static boolean isVideo(byte[] b, int from, int to) {
        int[] hdlr = child(b, from, to, BOX_HDLR);
        // version + flags, pre_defined, then the handler type.
        return hdlr != null && hdlr[1] - hdlr[0] >= 12 && int32(b, hdlr[0] + 8) == HANDLER_VIDE;
    }

    private static float mediaFps(byte[] b, int from, int to) {
        int[] mdhd = child(b, from, to, BOX_MDHD);
        int[] minf = child(b, from, to, BOX_MINF);
        if (mdhd == null || minf == null) return -1f;
        int version = b[mdhd[0]] & 0xFF;
        int scaleAt = version == 1 ? mdhd[0] + 20 : mdhd[0] + 12;
        if (scaleAt + 4 > mdhd[1]) return -1f;
        long timescale = uint32(b, scaleAt);
        int[] stbl = child(b, minf[0], minf[1], BOX_STBL);
        if (stbl == null || timescale <= 0L) return -1f;
        int[] stts = child(b, stbl[0], stbl[1], BOX_STTS);
        if (stts == null || stts[1] - stts[0] < 8) return -1f;
        long entries = uint32(b, stts[0] + 4);
        if (entries <= 0L || stts[0] + 8 + entries * 8L > stts[1]) return -1f;
        long frames = 0L;
        long bestCount = 0L;
        long bestDelta = 0L;
        for (int i = 0; i < entries; i++) {
            int at = stts[0] + 8 + i * 8;
            long count = uint32(b, at);
            long delta = uint32(b, at + 4);
            frames += count;
            if (count > bestCount && delta > 0L) {
                bestCount = count;
                bestDelta = delta;
            }
        }
        if (bestDelta <= 0L || bestCount * 100L < frames * DOMINANT_PERCENT) return -1f;
        return (float) ((double) timescale / bestDelta);
    }

    // ----------------------------------------------------------------- HTTP

    /** Bounded range reads: the whole probe gets one time budget, and past it every read fails. */
    private static final class Http implements Source {
        private final long deadline;
        private String target;
        private long total = -1L;

        Http(String url, long budgetMs) {
            this.target = url;
            this.deadline = System.currentTimeMillis() + budgetMs;
        }

        @Override
        public long total() {
            return total;
        }

        @Override
        public byte[] read(long from, int length) {
            try {
                for (int hop = 0; hop < HOPS; hop++) {
                    int left = (int) (deadline - System.currentTimeMillis());
                    if (left <= 0) return null;
                    HttpURLConnection connection = (HttpURLConnection) new URL(target).openConnection();
                    try {
                        connection.setInstanceFollowRedirects(false);
                        connection.setConnectTimeout(left);
                        connection.setReadTimeout(left);
                        connection.setRequestProperty("Range", "bytes=" + from + "-" + (from + length - 1));
                        connection.setRequestProperty("User-Agent", "Stremio");
                        int code = connection.getResponseCode();
                        if (code >= 300 && code < 400) {
                            String location = connection.getHeaderField("Location");
                            if (location == null) return null;
                            target = new URL(new URL(target), location).toString();
                            continue;
                        }
                        // A 200 means the server ignored Range: fine for the head, useless further on.
                        if (code != 206 && !(code == 200 && from == 0L)) return null;
                        total = totalOf(connection.getHeaderField("Content-Range"));
                        return body(connection.getInputStream(), length);
                    } finally {
                        connection.disconnect();
                    }
                }
            } catch (Throwable ignored) {
                // Fail soft: the caller sees "no data".
            }
            return null;
        }

        private byte[] body(InputStream input, int length) throws Exception {
            try {
                ByteArrayOutputStream out = new ByteArrayOutputStream(Math.min(length, HEAD_BYTES));
                byte[] buffer = new byte[16384];
                int n;
                while (out.size() < length && System.currentTimeMillis() < deadline
                        && (n = input.read(buffer, 0, Math.min(buffer.length, length - out.size()))) > 0) {
                    out.write(buffer, 0, n);
                }
                return out.toByteArray();
            } finally {
                input.close();
            }
        }
    }

    /** "bytes 0-131071/734003200" -> 734003200; -1 when missing or "*". */
    static long totalOf(String contentRange) {
        try {
            if (contentRange == null) return -1L;
            int slash = contentRange.lastIndexOf('/');
            if (slash < 0) return -1L;
            return Long.parseLong(contentRange.substring(slash + 1).trim());
        } catch (Throwable ignored) {
            return -1L;
        }
    }
}
