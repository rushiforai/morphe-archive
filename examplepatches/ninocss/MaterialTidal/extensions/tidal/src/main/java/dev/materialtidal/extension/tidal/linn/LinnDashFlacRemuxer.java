package dev.materialtidal.extension.tidal.linn;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Lossless ISOBMFF (fMP4) FLAC-in-DASH to native {@code audio/flac} stream remuxer.
 * <p>
 * Extracts the FLAC metadata blocks from the {@code dfLa} box in the DASH init segment, writes
 * the standard {@code fLaC} stream header (optionally patching {@code total_samples} when fragmented
 * muxers leave it 0), and streams raw FLAC frame payloads directly from {@code mdat} boxes with
 * zero re-encoding.
 */
public final class LinnDashFlacRemuxer {

    public static final class FlacHeaderInfo {
        public final byte[] headerBytes;
        public final int sampleRate;
        public final int bitDepth;
        public final long totalSamples;

        public FlacHeaderInfo(byte[] headerBytes, int sampleRate, int bitDepth, long totalSamples) {
            this.headerBytes = headerBytes;
            this.sampleRate = sampleRate;
            this.bitDepth = bitDepth;
            this.totalSamples = totalSamples;
        }
    }

    private LinnDashFlacRemuxer() {
    }

    public static FlacHeaderInfo parseAndBuildHeader(byte[] initSegmentBytes, long overrideTotalSamples)
            throws IOException {
        if (initSegmentBytes == null || initSegmentBytes.length < 16) {
            throw new IOException("DASH init segment too short");
        }
        int[] dflaRange = findDfLaBoxPayload(initSegmentBytes, 0, initSegmentBytes.length);
        if (dflaRange == null) {
            throw new IOException("dfLa box not found in DASH FLAC init segment");
        }
        int offset = dflaRange[0];
        int end = dflaRange[1];
        // dfLa FullBox begins with 4 bytes (version + flags).
        if (end - offset < 4 + 4 + 34) {
            throw new IOException("dfLa box truncated: length=" + (end - offset));
        }
        int cursor = offset + 4;

        ByteArrayOutputStream out = new ByteArrayOutputStream(128);
        out.write('f');
        out.write('L');
        out.write('a');
        out.write('C');

        byte[] rawBlocks = collectAndNormalizeBlocks(initSegmentBytes, cursor, end);
        int sampleRate = 44100;
        int bitDepth = 16;
        long totalSamples = 0;

        if (rawBlocks.length >= 38 && (rawBlocks[0] & 0x7F) == 0) {
            int s = 4;
            sampleRate = ((rawBlocks[s + 10] & 0xFF) << 12)
                    | ((rawBlocks[s + 11] & 0xFF) << 4)
                    | ((rawBlocks[s + 12] & 0xF0) >>> 4);
            bitDepth = (((rawBlocks[s + 12] & 0x01) << 4)
                    | ((rawBlocks[s + 13] & 0xF0) >>> 4)) + 1;
            totalSamples = ((long) (rawBlocks[s + 13] & 0x0F) << 32)
                    | ((rawBlocks[s + 14] & 0xFFL) << 24)
                    | ((rawBlocks[s + 15] & 0xFFL) << 16)
                    | ((rawBlocks[s + 16] & 0xFFL) << 8)
                    | (rawBlocks[s + 17] & 0xFFL);

            if (totalSamples <= 0 && overrideTotalSamples > 0) {
                rawBlocks[s + 13] = (byte) ((rawBlocks[s + 13] & 0xF0) | ((overrideTotalSamples >>> 32) & 0x0F));
                rawBlocks[s + 14] = (byte) ((overrideTotalSamples >>> 24) & 0xFF);
                rawBlocks[s + 15] = (byte) ((overrideTotalSamples >>> 16) & 0xFF);
                rawBlocks[s + 16] = (byte) ((overrideTotalSamples >>> 8) & 0xFF);
                rawBlocks[s + 17] = (byte) (overrideTotalSamples & 0xFF);
                totalSamples = overrideTotalSamples;
            }
        }
        out.write(rawBlocks);
        return new FlacHeaderInfo(out.toByteArray(), sampleRate, bitDepth, totalSamples);
    }

    private static byte[] collectAndNormalizeBlocks(byte[] data, int start, int end) throws IOException {
        ByteArrayOutputStream blocks = new ByteArrayOutputStream(end - start);
        int pos = start;
        int lastBlockStartInOut = -1;

        while (pos + 4 <= end) {
            int headerByte = data[pos] & 0x7F; // clear last-block bit until final block
            int blockLen = ((data[pos + 1] & 0xFF) << 16)
                    | ((data[pos + 2] & 0xFF) << 8)
                    | (data[pos + 3] & 0xFF);
            if (pos + 4 + blockLen > end) {
                throw new IOException("Corrupt FLAC metadata block in dfLa");
            }
            lastBlockStartInOut = blocks.size();
            blocks.write(headerByte);
            blocks.write(data, pos + 1, 3 + blockLen);
            pos += 4 + blockLen;
            if ((data[pos - (4 + blockLen)] & 0x80) != 0) {
                break;
            }
        }

        if (lastBlockStartInOut < 0) {
            throw new IOException("No FLAC metadata blocks found in dfLa");
        }
        byte[] result = blocks.toByteArray();
        result[lastBlockStartInOut] = (byte) (result[lastBlockStartInOut] | 0x80);
        return result;
    }

    /**
     * Streams every {@code mdat} box payload from a DASH {@code .m4s} media segment into {@code out}.
     */
    public static void writeMediaSegmentFrames(byte[] segmentBytes, OutputStream out) throws IOException {
        if (segmentBytes == null || segmentBytes.length < 8) {
            return;
        }
        int pos = 0;
        int limit = segmentBytes.length;
        while (pos + 8 <= limit) {
            long size = readUInt32(segmentBytes, pos);
            int headerSize = 8;
            if (size == 1) {
                if (pos + 16 > limit) {
                    break;
                }
                size = readUInt64(segmentBytes, pos + 8);
                headerSize = 16;
            } else if (size == 0) {
                size = limit - pos;
            }
            if (size < headerSize || pos + size > limit) {
                break;
            }
            if (matchesTag(segmentBytes, pos + 4, "mdat")) {
                out.write(segmentBytes, pos + headerSize, (int) (size - headerSize));
            }
            pos += (int) size;
        }
    }

    public static void streamDashFlac(
            String initUrl,
            List<String> segmentUrls,
            int startSegmentIndex,
            long estimatedRemainingSamples,
            OutputStream out,
            AtomicBoolean cancelled
    ) throws IOException {
        byte[] initBytes = downloadUrlBytes(initUrl, cancelled);
        FlacHeaderInfo header = parseAndBuildHeader(initBytes, estimatedRemainingSamples);
        out.write(header.headerBytes);
        out.flush();

        int start = Math.max(0, startSegmentIndex);
        for (int i = start; i < segmentUrls.size(); i++) {
            if (cancelled != null && cancelled.get()) {
                return;
            }
            byte[] segBytes = downloadUrlBytes(segmentUrls.get(i), cancelled);
            if (cancelled != null && cancelled.get()) {
                return;
            }
            writeMediaSegmentFrames(segBytes, out);
            out.flush();
        }
    }

    public static byte[] downloadUrlBytes(String urlStr, AtomicBoolean cancelled) throws IOException {
        HttpURLConnection conn = (HttpURLConnection) new URL(urlStr).openConnection();
        conn.setConnectTimeout(6000);
        conn.setReadTimeout(12000);
        conn.setRequestMethod("GET");
        try {
            int code = conn.getResponseCode();
            if (code < 200 || code >= 300) {
                throw new IOException("HTTP " + code + " fetching DASH segment");
            }
            try (InputStream in = conn.getInputStream()) {
                ByteArrayOutputStream out = new ByteArrayOutputStream(32768);
                byte[] buf = new byte[16384];
                int n;
                while ((n = in.read(buf)) != -1) {
                    if (cancelled != null && cancelled.get()) {
                        throw new IOException("Stream cancelled");
                    }
                    out.write(buf, 0, n);
                }
                return out.toByteArray();
            }
        } finally {
            conn.disconnect();
        }
    }

    private static int[] findDfLaBoxPayload(byte[] data, int start, int end) {
        int pos = start;
        while (pos + 8 <= end) {
            long size = readUInt32(data, pos);
            int headerSize = 8;
            if (size == 1 && pos + 16 <= end) {
                size = readUInt64(data, pos + 8);
                headerSize = 16;
            } else if (size == 0) {
                size = end - pos;
            }
            if (size < headerSize || pos + size > end) {
                return null;
            }
            int boxEnd = (int) (pos + size);
            String type = new String(data, pos + 4, 4, StandardCharsets.US_ASCII);
            if ("dfLa".equals(type)) {
                return new int[]{pos + headerSize, boxEnd};
            }
            if ("moov".equals(type) || "trak".equals(type) || "mdia".equals(type)
                    || "minf".equals(type) || "stbl".equals(type)) {
                int[] found = findDfLaBoxPayload(data, pos + headerSize, boxEnd);
                if (found != null) {
                    return found;
                }
            } else if ("stsd".equals(type) && pos + headerSize + 8 < boxEnd) {
                // stsd FullBox: 4 bytes version/flags + 4 bytes entry_count
                int[] found = findDfLaBoxPayload(data, pos + headerSize + 8, boxEnd);
                if (found != null) {
                    return found;
                }
            } else if ("fLaC".equals(type) && pos + headerSize + 28 < boxEnd) {
                // AudioSampleEntry v0 is 28 bytes (or v1 +16 bytes). Check direct child offset first,
                // then scan within the fLaC box for 'dfLa' if QuickTime v1/v2 extension is present.
                int[] found = findDfLaBoxPayload(data, pos + headerSize + 28, boxEnd);
                if (found != null) {
                    return found;
                }
                if (pos + headerSize + 44 < boxEnd) {
                    found = findDfLaBoxPayload(data, pos + headerSize + 44, boxEnd);
                    if (found != null) {
                        return found;
                    }
                }
                int scanned = scanTag(data, pos + headerSize + 16, boxEnd, "dfLa");
                if (scanned >= 8) {
                    long dfSize = readUInt32(data, scanned - 4);
                    int dfEnd = (int) Math.min(boxEnd, (scanned - 4) + dfSize);
                    return new int[]{scanned + 4, dfEnd};
                }
            }
            pos = boxEnd;
        }
        return null;
    }

    private static int scanTag(byte[] data, int start, int end, String tag) {
        byte[] t = tag.getBytes(StandardCharsets.US_ASCII);
        for (int i = Math.max(4, start); i <= end - 4; i++) {
            if (data[i] == t[0] && data[i + 1] == t[1] && data[i + 2] == t[2] && data[i + 3] == t[3]) {
                return i;
            }
        }
        return -1;
    }

    private static boolean matchesTag(byte[] data, int offset, String tag) {
        return offset + 4 <= data.length
                && data[offset] == tag.charAt(0)
                && data[offset + 1] == tag.charAt(1)
                && data[offset + 2] == tag.charAt(2)
                && data[offset + 3] == tag.charAt(3);
    }

    private static long readUInt32(byte[] data, int off) {
        return ((data[off] & 0xFFL) << 24)
                | ((data[off + 1] & 0xFFL) << 16)
                | ((data[off + 2] & 0xFFL) << 8)
                | (data[off + 3] & 0xFFL);
    }

    private static long readUInt64(byte[] data, int off) {
        return (readUInt32(data, off) << 32) | readUInt32(data, off + 4);
    }
}
