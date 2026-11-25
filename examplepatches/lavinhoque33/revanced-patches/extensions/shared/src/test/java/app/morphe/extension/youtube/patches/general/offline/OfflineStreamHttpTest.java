/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.youtube.patches.general.offline;

import static java.nio.charset.StandardCharsets.ISO_8859_1;
import static java.nio.charset.StandardCharsets.US_ASCII;
import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.io.StringReader;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.Arrays;
import java.util.HexFormat;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

public class OfflineStreamHttpTest {
    @Rule public final TemporaryFolder folder = new TemporaryFolder();

    @Test
    public void watchPlayerGetsLongSizeAndCanFollowVp9CuesForwardBackAndForward() throws IOException {
        try (RandomAccessFile file = new RandomAccessFile(folder.newFile(), "rw")) {
            FileChannel channel = file.getChannel();
            IndexedWebm fixture = IndexedWebm.write(channel);
            long total = channel.size();
            assertTrue(total > (1L << 32));

            // MediaHTTPConnection opens at zero with no HTTP Range header. On 200 its
            // URLConnection.getContentLength() is int-valued; the native caller caches that size.
            Response initial = readStartOfLargeFile(channel);
            initial.assertStatus("206 Partial Content");
            initial.assertHeader("Content-Length", Long.toString(total));
            initial.assertHeader("Content-Range", "bytes 0-" + (total - 1) + "/" + total);
            assertArrayEquals(HexFormat.of().parseHex("1a45dfa3"), Arrays.copyOf(initial.body, 4));

            long late = fixture.readCue(initial.body, 2);
            long earlier = fixture.readCue(initial.body, 1);
            assertTrue(late > (1L << 32));
            assertTrue(earlier < Integer.MAX_VALUE);

            assertCluster(channel, fixture, 2, late, "?cpn=test&range=" + rangeFor(fixture, 2, late), "");
            assertCluster(channel, fixture, 1, earlier, "?range=" + rangeFor(fixture, 2, late),
                    "rAnGe: bYtEs=" + rangeFor(fixture, 1, earlier) + "\r\n");
            assertCluster(channel, fixture, 2, late, "?range=bytes%3D" + late + "-", "");

            Response eof = request(channel, "GET /token/id HTTP/1.1\r\nRange: bytes=" + total + "-\r\n\r\n");
            eof.assertStatus("416 Range Not Satisfiable");
            eof.assertHeader("Content-Range", "bytes */" + total);
            assertEquals(0, eof.body.length);
        }
    }

    @Test
    public void unrangedResponseChangesOnlyWhenThePlatformIntSizeDoesNotFit() throws IOException {
        try (RandomAccessFile file = new RandomAccessFile(folder.newFile(), "rw")) {
            long limit = Integer.MAX_VALUE;
            file.setLength(limit);
            Response small = request(file.getChannel(), "HEAD /token/id?cpn=test HTTP/1.1\r\n\r\n");
            small.assertStatus("200 OK");
            small.assertHeader("Content-Length", Long.toString(limit));
            assertFalse(small.headers.contains("Content-Range"));

            file.setLength(limit + 1);
            Response large = request(file.getChannel(), "HEAD /token/id HTTP/1.1\r\n\r\n");
            large.assertStatus("206 Partial Content");
            large.assertHeader("Content-Range", "bytes 0-" + limit + "/" + (limit + 1));
            assertEquals(0, large.body.length);
        }
    }

    @Test
    public void suffixAndOpenRangesAreBoundedByDeclaredSliceAndPhysicalEof() throws IOException {
        try (RandomAccessFile file = new RandomAccessFile(folder.newFile(), "rw")) {
            file.write(new byte[] {0, 1, 2, 3, 4, 5, 6});
            FileChannel channel = file.getChannel();

            Response suffix = request(channel, 2, 3, "GET /token/id?range=-2 HTTP/1.1\r\n\r\n");
            suffix.assertStatus("206 Partial Content");
            suffix.assertHeader("Content-Range", "bytes 1-2/3");
            assertArrayEquals(new byte[] {3, 4}, suffix.body);

            Response open = request(channel, 2, 10, "GET /token/id HTTP/1.1\r\nRange: bytes=2-\r\n\r\n");
            open.assertHeader("Content-Range", "bytes 2-4/5");
            assertArrayEquals(new byte[] {4, 5, 6}, open.body);

            Response clamped = request(channel,
                    "GET /token/id HTTP/1.1\r\nRange: bytes=5-999999999999999999999\r\n\r\n");
            clamped.assertHeader("Content-Range", "bytes 5-6/7");
            assertArrayEquals(new byte[] {5, 6}, clamped.body);

            Response largeSuffix = request(channel,
                    "GET /token/id HTTP/1.1\r\nRange: bytes=-999999999999999999999\r\n\r\n");
            largeSuffix.assertHeader("Content-Range", "bytes 0-6/7");
            assertArrayEquals(new byte[] {0, 1, 2, 3, 4, 5, 6}, largeSuffix.body);
        }
    }

    @Test
    public void invalidAndUnsatisfiableRangesNeverFallBackToTheWholeFile() throws IOException {
        try (RandomAccessFile file = new RandomAccessFile(folder.newFile(), "rw")) {
            FileChannel channel = file.getChannel();
            file.setLength(7);

            for (String invalid : new String[] {"bytes=0", "bytes=-", "bytes=5--2", "bytes=++0-",
                    "bytes=0-3,4-6", "items=0-"}) {
                Response response = request(channel, "GET /token/id HTTP/1.1\r\nRange: " + invalid + "\r\n\r\n");
                response.assertStatus("400 Bad Request");
                assertEquals(0, response.body.length);
                assertFalse(response.reusable);
            }
            Response badQuery = request(channel, "GET /token/id?range=%ZZ HTTP/1.1\r\n\r\n");
            badQuery.assertStatus("400 Bad Request");

            for (String unsatisfiable : new String[] {"-0", "7-", "4-3", "999999999999999999999-"}) {
                Response response = request(channel, "GET /token/id?range=" + unsatisfiable + " HTTP/1.1\r\n\r\n");
                response.assertStatus("416 Range Not Satisfiable");
                response.assertHeader("Content-Range", "bytes */7");
                assertEquals(0, response.body.length);
                assertTrue(response.reusable);
            }

            file.setLength(0);
            Response empty = request(channel, "GET /token/id HTTP/1.1\r\n\r\n");
            empty.assertStatus("200 OK");
            empty.assertHeader("Content-Length", "0");
            Response range = request(channel,
                    "HEAD /token/id HTTP/1.1\r\nRange: bytes=-1\r\nConnection: keep-alive, close\r\n\r\n");
            range.assertStatus("416 Range Not Satisfiable");
            range.assertHeader("Content-Range", "bytes */0");
            assertFalse(range.reusable);
        }
    }

    private static void assertCluster(FileChannel channel, IndexedWebm fixture, int index, long position,
                                      String query, String headers) throws IOException {
        Response response = request(channel, "GET /token/id" + query + " HTTP/1.1\r\n" + headers + "\r\n");
        response.assertStatus("206 Partial Content");
        response.assertHeader("Content-Range", "bytes " + rangeFor(fixture, index, position) + "/" + channel.size());
        assertArrayEquals(fixture.clusters[index], response.body);
    }

    private static String rangeFor(IndexedWebm fixture, int index, long position) {
        return position + "-" + (position + fixture.clusters[index].length - 1);
    }

    private static Response request(FileChannel channel, String wireRequest) throws IOException {
        return request(channel, 0, -1, wireRequest);
    }

    private static Response readStartOfLargeFile(FileChannel channel) throws IOException {
        OfflineStreamHttp.Request request = readRequest("GET /token/id?cpn=test HTTP/1.1\r\n\r\n");
        ByteArrayOutputStream captured = new ByteArrayOutputStream();
        // Model the player reading just the initial headers and index before cancelling this connection.
        OutputStream prefix = new OutputStream() {
            @Override
            public void write(int value) throws IOException {
                if (captured.size() == 4096) throw new EOFException("Player moved to another range");
                captured.write(value);
            }
        };
        assertThrows(EOFException.class, () -> OfflineStreamHttp.serve(request, prefix, channel, 0, -1, "video/webm"));
        return responseFrom(captured, false);
    }

    private static Response request(FileChannel channel, long offset, long size, String wireRequest) throws IOException {
        OfflineStreamHttp.Request request = readRequest(wireRequest);
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        boolean reusable = OfflineStreamHttp.serve(request, out, channel, offset, size, "video/webm");
        return responseFrom(out, reusable);
    }

    private static OfflineStreamHttp.Request readRequest(String wireRequest) throws IOException {
        BufferedReader input = new BufferedReader(new StringReader(wireRequest));
        OfflineStreamHttp.Request request = OfflineStreamHttp.readRequest(input);
        assertEquals("/token/id", request.path());
        return request;
    }

    private static Response responseFrom(ByteArrayOutputStream out, boolean reusable) {
        byte[] wireResponse = out.toByteArray();
        String headers = new String(wireResponse, ISO_8859_1);
        int body = headers.indexOf("\r\n\r\n") + 4;
        assertTrue(body >= 4);
        return new Response(headers.substring(0, body), Arrays.copyOfRange(wireResponse, body, wireResponse.length),
                reusable);
    }

    private record Response(String headers, byte[] body, boolean reusable) {
        void assertStatus(String status) {
            assertTrue(headers, headers.startsWith("HTTP/1.1 " + status + "\r\n"));
        }

        void assertHeader(String name, String value) {
            assertTrue(headers, headers.contains("\r\n" + name + ": " + value + "\r\n"));
        }
    }

    /** Valid WebM structure with real VP9 keyframes and sparse EBML Void padding between clusters. */
    private record IndexedWebm(int firstCue, int segment, byte[][] clusters) {
        private static final long[] CLUSTER_POSITIONS = {4096, (1L << 30) + 127, (5L << 30) + 511};
        private static final int[] CUE_TIMES = {0, 778_616, 2_848_272};
        // Standalone libvpx-vp9 keyframes: ffmpeg -f lavfi -i color=c=<color>:s=16x16:r=1
        // -frames:v 1 -c:v libvpx-vp9 -f ivf -, without the 44-byte IVF file/frame headers.
        private static final String[] VP9_FRAMES = {
            "824983420000f000f60038241c184a00003060000010bffff71dafffffff5fdffffffff22ac000",
            "824983420000f000f60038241c184a000030600000187ffffe0858ffffffff90a07fffff5ff000",
            "824983420000f000f60038241c184a00003060000010bffff71daffffeed9fffffffccfa0000"
        };

        static IndexedWebm write(FileChannel channel) throws IOException {
            byte[] ebml = HexFormat.of().parseHex("1a45dfa39f4286810142f7810142f2810442f38108"
                    + "4282847765626d4287810442858102");
            byte[] info = element(0x1549a966, element(0x2ad7b1, unsigned(1_000_000, 3)),
                    element(0x4489, unsigned(Double.doubleToLongBits(CUE_TIMES[2] + 1000.0), 8)),
                    element(0x4d80, ascii("RVX test")), element(0x5741, ascii("RVX test")));
            byte[] tracks = element(0x1654ae6b, element(0xae,
                    element(0xd7, unsigned(1, 1)), element(0x73c5, unsigned(1, 1)), element(0x83, unsigned(1, 1)),
                    element(0x86, ascii("V_VP9")), element(0x23e383, unsigned(1_000_000_000L, 4)),
                    element(0xe0, element(0xb0, unsigned(16, 1)), element(0xba, unsigned(16, 1)))));
            byte[][] cues = new byte[CUE_TIMES.length][];
            byte[][] clusters = new byte[CUE_TIMES.length][];
            for (int index = 0; index < CUE_TIMES.length; index++) {
                cues[index] = element(0xbb, element(0xb3, unsigned(CUE_TIMES[index], 4)),
                        element(0xb7, element(0xf7, unsigned(1, 1)),
                                element(0xf1, unsigned(CLUSTER_POSITIONS[index], 5))));
                clusters[index] = element(0x1f43b675, element(0xe7, unsigned(CUE_TIMES[index], 4)),
                        element(0xa3, new byte[] {(byte) 0x81, 0, 0, (byte) 0x80},
                                HexFormat.of().parseHex(VP9_FRAMES[index])));
            }
            byte[] seekHead = seekHead(0);
            seekHead = seekHead(seekHead.length + info.length + tracks.length);
            byte[] cueIndex = element(0x1c53bb6b, cues);
            long segmentSize = CLUSTER_POSITIONS[2] + clusters[2].length;
            byte[] segmentHeader = join(unsigned(0x18538067, 4), vint(segmentSize, 8));
            byte[] header = join(ebml, segmentHeader, seekHead, info, tracks, cueIndex);
            final int segment = ebml.length + segmentHeader.length;
            int firstCue = header.length - cueIndex.length + 5;
            writeAt(channel, 0, header);
            long previousEnd = header.length;
            for (int index = 0; index < CLUSTER_POSITIONS.length; index++) {
                long position = segment + CLUSTER_POSITIONS[index];
                long padding = position - previousEnd - 9; // Void ID and eight-byte EBML size.
                writeAt(channel, previousEnd, join(new byte[] {(byte) 0xec}, vint(padding, 8)));
                writeAt(channel, position, clusters[index]);
                previousEnd = position + clusters[index].length;
            }
            return new IndexedWebm(firstCue, segment, clusters);
        }

        long readCue(byte[] index, int number) {
            int start = firstCue + number * 20;
            assertEquals(0xbb, index[start] & 0xff);
            assertEquals(CUE_TIMES[number], ByteBuffer.wrap(index).getInt(start + 4));
            assertEquals(0xf1, index[start + 13] & 0xff);
            return segment + ((index[start + 15] & 0xffL) << 32)
                    + Integer.toUnsignedLong(ByteBuffer.wrap(index).getInt(start + 16));
        }

        private static byte[] seekHead(long cueIndex) {
            return element(0x114d9b74, element(0x4dbb, element(0x53ab, unsigned(0x1c53bb6b, 4)),
                    element(0x53ac, unsigned(cueIndex, 5))));
        }

        private static byte[] element(int id, byte[]... parts) {
            byte[] contents = join(parts);
            if (contents.length >= 127) throw new AssertionError("Small element size exceeded");
            int idBytes = (Integer.SIZE - Integer.numberOfLeadingZeros(id) + 7) / 8;
            return join(unsigned(id, idBytes), vint(contents.length, 1), contents);
        }

        private static byte[] vint(long value, int width) {
            return unsigned(value | (1L << (7 * width)), width);
        }

        private static byte[] unsigned(long value, int width) {
            byte[] bytes = new byte[width];
            for (int index = width - 1; index >= 0; index--) {
                bytes[index] = (byte) value;
                value >>>= 8;
            }
            return bytes;
        }

        private static byte[] join(byte[]... parts) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            for (byte[] part : parts) out.write(part, 0, part.length);
            return out.toByteArray();
        }

        private static byte[] ascii(String value) {
            return value.getBytes(US_ASCII);
        }

        private static void writeAt(FileChannel channel, long offset, byte[] bytes) throws IOException {
            channel.position(offset);
            ByteBuffer buffer = ByteBuffer.wrap(bytes);
            while (buffer.hasRemaining()) channel.write(buffer);
        }
    }
}
