/*
 * Copyright (C) 2026 Dual VoT contributors
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.extension.youtube.patches.voiceovertranslation.yandex;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Test;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.IntConsumer;

import app.morphe.extension.youtube.patches.voiceovertranslation.yandex.YandexVotAudioTransfer.AbortSignal;
import app.morphe.extension.youtube.patches.voiceovertranslation.yandex.YandexVotAudioTransfer.PartReader;
import app.morphe.extension.youtube.patches.voiceovertranslation.yandex.YandexVotAudioTransfer.ReadAbortedException;
import app.morphe.extension.youtube.patches.voiceovertranslation.yandex.YandexVotAudioTransfer.SourceDeniedException;
import app.morphe.extension.youtube.patches.voiceovertranslation.yandex.YandexVotAudioTransfer.SourceReadException;
import app.morphe.extension.youtube.patches.voiceovertranslation.yandex.YandexVotHttpAudioPartReader.Connection;
import app.morphe.extension.youtube.patches.voiceovertranslation.yandex.YandexVotHttpAudioPartReader.Factory;

public class YandexVotHttpAudioPartReaderTest {
    private static final int PART = YandexVotAudioParts.PART_SIZE_BYTES;
    private static final AbortSignal NO_ABORT = () -> false;

    private static final class FakeConn implements Connection {
        final int status;
        final Map<String, String> headers = new HashMap<>();
        final long contentLength;
        byte[] body;
        boolean closed = false;
        int slice = Integer.MAX_VALUE;
        Runnable afterChunk;
        long bodyBytesRead;

        FakeConn(int status) {
            this.status = status;
            this.contentLength = -1;
        }

        FakeConn(int status, long contentLength) {
            this.status = status;
            this.contentLength = contentLength;
        }

        FakeConn withHeader(String name, String value) {
            headers.put(name, value);
            return this;
        }

        FakeConn withBody(byte[] body) {
            this.body = body;
            return this;
        }

        @Override
        public int status() {
            return status;
        }

        @Override
        public String header(String name) {
            return headers.get(name);
        }

        @Override
        public long contentLength() {
            return contentLength;
        }

        @Override
        public InputStream stream() {
            return new ChunkedInput(body, slice, afterChunk, amount -> bodyBytesRead += amount);
        }

        @Override
        public void close() {
            closed = true;
        }
    }

    /** InputStream that returns at most {@code slice} bytes per read call. */
    private static final class ChunkedInput extends InputStream {
        private final byte[] data;
        private final int slice;
        private final Runnable afterChunk;
        private final IntConsumer afterRead;
        private int position = 0;

        ChunkedInput(byte[] data, int slice, Runnable afterChunk, IntConsumer afterRead) {
            this.data = data == null ? new byte[0] : data;
            this.slice = slice;
            this.afterChunk = afterChunk;
            this.afterRead = afterRead;
        }

        @Override
        public int read() {
            return position < data.length ? data[position++] & 0xFF : -1;
        }

        @Override
        public int read(byte[] buffer, int offset, int length) {
            if (position >= data.length) return -1;
            int amount = Math.min(length, Math.min(slice, data.length - position));
            System.arraycopy(data, position, buffer, offset, amount);
            position += amount;
            if (afterRead != null) afterRead.accept(amount);
            if (afterChunk != null) afterChunk.run();
            return amount;
        }
    }

    private static byte[] bytes(int length, int seed) {
        byte[] data = new byte[length];
        for (int i = 0; i < length; i++) {
            data[i] = (byte) ((seed + i) % 251);
        }
        return data;
    }

    private static FakeConn open(FakeConn conn) {
        return conn;
    }

    private static Factory factoryOf(final FakeConn conn) {
        return new Factory() {
            @Override
            public Connection open(String url, long start, long endInclusive) {
                return conn;
            }
        };
    }

    private static PartReader reader(long knownTotal, Factory factory) {
        return new YandexVotHttpAudioPartReader("https://media.example/audio", knownTotal, factory);
    }

    private static void expectSourceRead(ThrowingRead action) {
        try {
            action.read();
            fail("Expected SourceReadException");
        } catch (SourceReadException expected) {
            // expected
        } catch (Exception unexpected) {
            fail("Expected SourceReadException but got " + unexpected);
        }
    }

    private interface ThrowingRead {
        void read() throws Exception;
    }

    @Test
    public void readsExactRangeFromValid206() throws Exception {
        byte[] body = bytes(100, 1);
        FakeConn conn = open(new FakeConn(206)).withHeader(
                "Content-Range", "bytes 100-199/10000").withBody(body);
        PartReader reader = reader(10000, factoryOf(conn));

        byte[] result = reader.read(100, 100, NO_ABORT);

        assertArrayEquals(body, result);
        assertTrue(conn.closed);
    }

    @Test
    public void rejectsWrongStartOffsetInContentRange() {
        FakeConn conn = open(new FakeConn(206)).withHeader(
                "Content-Range", "bytes 99-198/10000").withBody(bytes(100, 1));
        PartReader reader = reader(10000, factoryOf(conn));

        expectSourceRead(() -> reader.read(100, 100, NO_ABORT));
        assertTrue(conn.closed);
    }

    @Test
    public void rejectsWrongEndInContentRange() {
        FakeConn conn = open(new FakeConn(206)).withHeader(
                "Content-Range", "bytes 100-198/10000").withBody(bytes(100, 1));
        PartReader reader = reader(10000, factoryOf(conn));

        expectSourceRead(() -> reader.read(100, 100, NO_ABORT));
        assertTrue(conn.closed);
    }

    @Test
    public void rejectsTotalContradictingKnownFileSize() {
        FakeConn conn = open(new FakeConn(206)).withHeader(
                "Content-Range", "bytes 0-99/9999").withBody(bytes(100, 1));
        PartReader reader = reader(10000, factoryOf(conn));

        expectSourceRead(() -> reader.read(0, 100, NO_ABORT));
        assertTrue(conn.closed);
    }

    @Test
    public void rejectsMissingContentRangeOn206() {
        FakeConn conn = open(new FakeConn(206)).withBody(bytes(100, 1));
        PartReader reader = reader(10000, factoryOf(conn));

        expectSourceRead(() -> reader.read(0, 100, NO_ABORT));
        assertTrue(conn.closed);
    }

    @Test
    public void rejectsMalformedContentRangeOn206() {
        FakeConn conn = open(new FakeConn(206)).withHeader(
                "Content-Range", "bytes 0-99/*").withBody(bytes(100, 1));
        PartReader reader = reader(10000, factoryOf(conn));

        expectSourceRead(() -> reader.read(0, 100, NO_ABORT));
        assertTrue(conn.closed);
    }

    @Test
    public void handlesPartialInputStreamReadsAndAccumulates() throws Exception {
        byte[] body = bytes(100, 5);
        FakeConn conn = open(new FakeConn(206)).withHeader(
                "Content-Range", "bytes 0-99/10000").withBody(body);
        conn.slice = 1; // one byte per read() call
        PartReader reader = reader(10000, factoryOf(conn));

        byte[] result = reader.read(0, 100, NO_ABORT);

        assertArrayEquals(body, result);
        assertTrue(conn.closed);
    }

    @Test
    public void truncatedBodyIsNeverReturned() {
        FakeConn conn = open(new FakeConn(206)).withHeader(
                "Content-Range", "bytes 0-99/10000").withBody(bytes(50, 5));
        PartReader reader = reader(10000, factoryOf(conn));

        expectSourceRead(() -> reader.read(0, 100, NO_ABORT));
        assertTrue(conn.closed);
    }

    @Test
    public void emptyBodyIsNeverReturned() {
        FakeConn conn = open(new FakeConn(206)).withHeader(
                "Content-Range", "bytes 0-99/10000").withBody(new byte[0]);
        PartReader reader = reader(10000, factoryOf(conn));

        expectSourceRead(() -> reader.read(0, 100, NO_ABORT));
        assertTrue(conn.closed);
    }

    @Test
    public void http403IsSourceDenied() {
        FakeConn conn = open(new FakeConn(403));
        PartReader reader = reader(10000, factoryOf(conn));

        try {
            reader.read(0, 100, NO_ABORT);
            fail("Expected SourceDeniedException");
        } catch (SourceDeniedException expected) {
            // expected
        } catch (Exception unexpected) {
            fail("Expected SourceDeniedException but got " + unexpected);
        }
        assertTrue(conn.closed);
    }

    @Test
    public void http200LaterPartIsRejectedAsIgnoredRange() {
        FakeConn conn = open(new FakeConn(200, 10000)).withBody(bytes(10000, 1));
        PartReader reader = reader(10000, factoryOf(conn));

        expectSourceRead(() -> reader.read(100, 100, NO_ABORT));
        assertTrue(conn.closed);
    }

    @Test
    public void http200SingleWholePartIsAcceptedWhenLengthMatches() throws Exception {
        byte[] whole = bytes(300, 1);
        FakeConn conn = open(new FakeConn(200, whole.length)).withBody(whole);
        PartReader reader = reader(whole.length, factoryOf(conn));

        byte[] result = reader.read(0, whole.length, NO_ABORT);

        assertArrayEquals(whole, result);
        assertTrue(conn.closed);
    }

    @Test
    public void http200WholeBodySupportsMultipartPartsByDiscardingEarlierBytes() throws Exception {
        byte[] whole = bytes(2 * PART + 3, 1);
        List<Long> starts = new ArrayList<>();
        List<FakeConn> connections = new ArrayList<>();
        Factory wholeBodyFactory = new Factory() {
            @Override
            public Connection open(String url, long start, long endInclusive) {
                starts.add(start);
                FakeConn connection = new FakeConn(200, whole.length).withBody(whole);
                connections.add(connection);
                return connection;
            }
        };
        PartReader reader = reader(whole.length, wholeBodyFactory);

        assertArrayEquals(Arrays.copyOfRange(whole, 0, PART), reader.read(0, PART, NO_ABORT));
        assertArrayEquals(
                Arrays.copyOfRange(whole, PART, 2 * PART),
                reader.read(PART, PART, NO_ABORT));
        assertArrayEquals(
                Arrays.copyOfRange(whole, 2 * PART, whole.length),
                reader.read(2L * PART, 3, NO_ABORT));

        assertEquals(Arrays.asList(0L), starts);
        assertEquals(1, connections.size());
        assertEquals((long) whole.length, connections.get(0).bodyBytesRead);
        assertTrue(connections.get(0).closed);
    }

    @Test
    public void http200WholeBodyTruncationClosesTheRetainedConnection() throws Exception {
        long total = PART + 5L;
        FakeConn connection = open(new FakeConn(200, total)).withBody(bytes(PART + 2, 1));
        PartReader reader = reader(total, factoryOf(connection));

        reader.read(0, PART, NO_ABORT);
        expectSourceRead(() -> reader.read(PART, 5, NO_ABORT));

        assertTrue(connection.closed);
    }

    @Test
    public void http200WholeBodyCancellationClosesTheRetainedConnection() throws Exception {
        long total = PART + 3L;
        FakeConn connection = open(new FakeConn(200, total)).withBody(bytes((int) total, 1));
        PartReader reader = reader(total, factoryOf(connection));

        reader.read(0, PART, NO_ABORT);
        try {
            reader.read(PART, 3, () -> true);
            fail("Expected ReadAbortedException");
        } catch (ReadAbortedException expected) {
            // expected
        }

        assertTrue(connection.closed);
    }

    @Test
    public void http200FirstPartWithContradictingLengthIsRejected() {
        FakeConn conn = open(new FakeConn(200, 9999)).withBody(bytes(9999, 1));
        PartReader reader = reader(10000, factoryOf(conn));

        expectSourceRead(() -> reader.read(0, 100, NO_ABORT));
        assertTrue(conn.closed);
    }

    @Test
    public void unexpectedHttpStatusIsSourceReadFailure() {
        FakeConn conn = open(new FakeConn(500));
        PartReader reader = reader(10000, factoryOf(conn));

        expectSourceRead(() -> reader.read(0, 100, NO_ABORT));
        assertTrue(conn.closed);
    }

    @Test
    public void abortDuringReadStopsAndClosesConnection() throws Exception {
        final boolean[] abort = {false};
        final int[] chunks = {0};
        byte[] body = bytes(200, 1);
        FakeConn conn = open(new FakeConn(206)).withHeader(
                "Content-Range", "bytes 0-199/10000").withBody(body);
        conn.slice = 10;
        conn.afterChunk = () -> {
            chunks[0]++;
            if (chunks[0] == 3) abort[0] = true;
        };
        PartReader reader = reader(10000, factoryOf(conn));

        try {
            reader.read(0, 200, () -> abort[0]);
            fail("Expected ReadAbortedException");
        } catch (ReadAbortedException expected) {
            // expected
        }
        assertTrue(conn.closed);
    }

    @Test
    public void sizeProbeUsesContentRangeTotalNotPartialContentLength() throws Exception {
        assertEquals(
                12345,
                YandexVotHttpAudioPartReader.resolveTotalSize(
                        206, "bytes 0-0/12345", 1)
        );
        // A partial response with Content-Length 1 must never be read as a 1-byte file.
        expectSourceRead(() ->
                YandexVotHttpAudioPartReader.resolveTotalSize(206, null, 1));
        expectSourceRead(() ->
                YandexVotHttpAudioPartReader.resolveTotalSize(206, "bytes 0-0/*", 1));
        expectSourceRead(() ->
                YandexVotHttpAudioPartReader.resolveTotalSize(206, "garbage", 1));
    }

    @Test
    public void sizeProbeAcceptsWholeBodyResponse() throws Exception {
        assertEquals(
                12345,
                YandexVotHttpAudioPartReader.resolveTotalSize(200, null, 12345)
        );
        expectSourceRead(() -> YandexVotHttpAudioPartReader.resolveTotalSize(200, null, -1));
        expectSourceRead(() -> YandexVotHttpAudioPartReader.resolveTotalSize(200, null, 0));
    }

    @Test
    public void sizeProbeRejectsDeniedAndUnknownStatuses() {
        try {
            YandexVotHttpAudioPartReader.resolveTotalSize(403, null, -1);
            fail("Expected SourceDeniedException");
        } catch (SourceDeniedException expected) {
            // expected
        } catch (Exception unexpected) {
            fail("Expected SourceDeniedException but got " + unexpected);
        }
        expectSourceRead(() -> YandexVotHttpAudioPartReader.resolveTotalSize(500, null, -1));
    }

    @Test
    public void oversizedPartRequestIsRejected() {
        FakeConn conn = open(new FakeConn(206)).withHeader(
                "Content-Range", "bytes 0-" + (PART - 1) + "/10000000");
        PartReader reader = reader(10000000, factoryOf(conn));

        expectSourceRead(() -> reader.read(0, PART + 1, NO_ABORT));
        expectSourceRead(() -> reader.read(0, 0, NO_ABORT));
        expectSourceRead(() -> reader.read(0, -1, NO_ABORT));
    }
}
