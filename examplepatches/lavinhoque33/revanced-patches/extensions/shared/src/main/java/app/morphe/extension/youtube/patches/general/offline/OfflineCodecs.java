/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-10-20.
 */

package app.morphe.extension.youtube.patches.general.offline;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.Locale;

/**
 * Reads the RFC 6381 codec string of the video track of a downloaded MP4, which YouTube's player
 * needs in the mime type of a stream before it accepts the stream.
 */
final class OfflineCodecs {
    /** The moov box of a downloaded video holds the sample tables, so it is far below this. */
    private static final int MAX_MOOV_BYTES = 64 * 1024 * 1024;
    /** Fields of a VisualSampleEntry that come before its child boxes, after the box header. */
    private static final int VISUAL_SAMPLE_ENTRY_FIELDS = 78;

    private static final int MOOV = fourcc("moov");
    private static final int TRAK = fourcc("trak");
    private static final int MDIA = fourcc("mdia");
    private static final int HDLR = fourcc("hdlr");
    private static final int MINF = fourcc("minf");
    private static final int STBL = fourcc("stbl");
    private static final int STSD = fourcc("stsd");
    private static final int VIDE = fourcc("vide");
    private static final int AVC_C = fourcc("avcC");
    private static final int AV1_C = fourcc("av1C");

    private OfflineCodecs() {
    }

    /**
     * @param channel A readable MP4 file.
     * @param start   Offset of the file in the channel.
     * @param length  Length of the file.
     * @return {@code avc1.PPCCLL} or {@code av01.P.LLT.DD}, or null for any other codec or a
     * file this reader does not understand.
     */
    @Nullable
    static String mp4VideoCodec(FileChannel channel, long start, long length) throws IOException {
        byte[] moov = readMoov(channel, start, length);
        if (moov == null) return null;

        for (int trak = firstChild(moov, 8, moov.length, TRAK); trak >= 0;
             trak = nextSibling(moov, trak, moov.length, TRAK)) {
            int end = boxEnd(moov, trak, moov.length);
            int mdia = firstChild(moov, trak + 8, end, MDIA);
            if (mdia < 0) continue;
            int mdiaEnd = boxEnd(moov, mdia, end);
            int hdlr = firstChild(moov, mdia + 8, mdiaEnd, HDLR);
            // Payload: version and flags, pre-defined, then the handler type.
            if (hdlr < 0 || hdlr + 8 + 12 > mdiaEnd || u32(moov, hdlr + 8 + 8) != VIDE) continue;

            int minf = firstChild(moov, mdia + 8, mdiaEnd, MINF);
            if (minf < 0) return null;
            int stbl = firstChild(moov, minf + 8, boxEnd(moov, minf, mdiaEnd), STBL);
            if (stbl < 0) return null;
            int stblEnd = boxEnd(moov, stbl, mdiaEnd);
            int stsd = firstChild(moov, stbl + 8, stblEnd, STSD);
            if (stsd < 0) return null;
            return codecOfSampleEntry(moov, stsd + 8 + 8, boxEnd(moov, stsd, stblEnd));
        }
        return null;
    }

    @Nullable
    private static String codecOfSampleEntry(byte[] d, int entry, int limit) {
        if (entry + 8 + VISUAL_SAMPLE_ENTRY_FIELDS > limit) return null;
        int entryEnd = boxEnd(d, entry, limit);
        for (int child = entry + 8 + VISUAL_SAMPLE_ENTRY_FIELDS; child >= 0 && child + 8 <= entryEnd;
             child = nextSibling(d, child, entryEnd, 0)) {
            int type = u32(d, child + 4);
            int payload = child + 8;
            if (type == AVC_C && payload + 4 <= entryEnd) {
                return String.format(Locale.ROOT, "avc1.%02X%02X%02X",
                        d[payload + 1] & 0xFF, d[payload + 2] & 0xFF, d[payload + 3] & 0xFF);
            }
            if (type == AV1_C && payload + 4 <= entryEnd) {
                int profile = (d[payload + 1] & 0xFF) >> 5;
                int level = d[payload + 1] & 0x1F;
                boolean high = (d[payload + 2] & 0x80) != 0;
                boolean highBitDepth = (d[payload + 2] & 0x40) != 0;
                boolean twelveBit = (d[payload + 2] & 0x20) != 0;
                int bitDepth = highBitDepth ? (twelveBit ? 12 : 10) : 8;
                return String.format(Locale.ROOT, "av01.%d.%02d%s.%02d", profile, level, high ? "H" : "M", bitDepth);
            }
        }
        return null;
    }

    @Nullable
    private static byte[] readMoov(FileChannel channel, long start, long length) throws IOException {
        ByteBuffer header = ByteBuffer.allocate(16);
        long position = 0;
        while (position + 8 <= length) {
            header.clear();
            if (channel.read(header, start + position) < 8) return null;
            long size = u32(header.array(), 0) & 0xFFFFFFFFL;
            int type = u32(header.array(), 4);
            int headerSize = 8;
            if (size == 1) {
                if (header.position() < 16) return null;
                size = ByteBuffer.wrap(header.array(), 8, 8).getLong();
                headerSize = 16;
            } else if (size == 0) {
                size = length - position;
            }
            if (size < headerSize) return null;

            if (type == MOOV) {
                long payload = size - headerSize;
                if (payload > MAX_MOOV_BYTES) return null;
                // The returned array starts with a box header so offsets inside it match box offsets.
                byte[] moov = new byte[(int) payload + 8];
                ByteBuffer wrapped = ByteBuffer.wrap(moov, 8, (int) payload);
                long read = start + position + headerSize;
                while (wrapped.hasRemaining()) {
                    int n = channel.read(wrapped, read);
                    if (n <= 0) return null;
                    read += n;
                }
                return moov;
            }
            position += size;
        }
        return null;
    }

    private static int firstChild(byte[] d, int from, int to, int type) {
        int offset = from;
        while (offset + 8 <= to) {
            long size = u32(d, offset) & 0xFFFFFFFFL;
            if (size < 8 || offset + size > to) return -1;
            if (u32(d, offset + 4) == type) return offset;
            offset += (int) size;
        }
        return -1;
    }

    /** @param type The box type to look for, or 0 for the next box of any type. */
    private static int nextSibling(byte[] d, int box, int to, int type) {
        long size = u32(d, box) & 0xFFFFFFFFL;
        if (size < 8) return -1;
        long next = box + size;
        if (next + 8 > to) return -1;
        return type == 0 ? (int) next : firstChild(d, (int) next, to, type);
    }

    private static int boxEnd(byte[] d, int box, int limit) {
        long size = u32(d, box) & 0xFFFFFFFFL;
        long end = box + size;
        return size < 8 || end > limit ? limit : (int) end;
    }

    private static int u32(byte[] d, int offset) {
        return (d[offset] & 0xFF) << 24 | (d[offset + 1] & 0xFF) << 16
                | (d[offset + 2] & 0xFF) << 8 | (d[offset + 3] & 0xFF);
    }

    private static int fourcc(String type) {
        return type.charAt(0) << 24 | type.charAt(1) << 16 | type.charAt(2) << 8 | type.charAt(3);
    }
}
