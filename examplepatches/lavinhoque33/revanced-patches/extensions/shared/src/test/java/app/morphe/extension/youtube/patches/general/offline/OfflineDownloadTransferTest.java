/*
 * Copyright (C) 2026 lavinhoque33
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25.
 */

package app.morphe.extension.youtube.patches.general.offline;

import static java.nio.charset.StandardCharsets.US_ASCII;
import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import java.io.BufferedInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

public class OfflineDownloadTransferTest {
    private static final int BUFFER = 64 * 1024;
    private static final int INTERRUPTED_AT = 8_193;
    private static final long LARGE_OFFSET = (long) Integer.MAX_VALUE + 13_000;
    private static final String ETAG = "\"original-v1\"";

    @Rule public final TemporaryFolder scratch = new TemporaryFolder();

    private final ExecutorService workers = Executors.newCachedThreadPool();
    private final List<WireRequest> requests = new CopyOnWriteArrayList<>();
    private final byte[] payload = new byte[192_113];
    private WireServer server;

    @Before
    public void startServer() throws IOException {
        new Random(84).nextBytes(payload);
        server = new WireServer();
    }

    @After
    public void stopServer() throws Exception {
        workers.shutdownNow();
        if (server != null) server.close();
    }

    @Test
    public void connectionLossResumesTheUnflushedPrefixOfSparseRangeAboveTwoGiB() throws Exception {
        int finished = 65_536;
        long total = LARGE_OFFSET + payload.length;
        long end = total - 1;
        long pendingStart = LARGE_OFFSET + finished;
        server.createContext("/dash", exchange -> {
            WireRequest request = record(exchange);
            if (request.range().equals(range(LARGE_OFFSET, pendingStart - 1))) {
                respond(exchange, 206, LARGE_OFFSET, pendingStart - 1, total, ETAG, 0, finished);
            } else if (request.range().equals(range(pendingStart, end))) {
                respond(exchange, 206, pendingStart, end, total, ETAG, finished, INTERRUPTED_AT);
            } else {
                respond(exchange, 206, pendingStart + INTERRUPTED_AT, end, total, ETAG,
                        finished + INTERRUPTED_AT, payload.length - finished - INTERRUPTED_AT);
            }
        });

        CountDownLatch unavailable = new CountDownLatch(1);
        OfflineTransferControl control = new OfflineTransferControl(unavailable::countDown, 3, 1);
        control.onNetworkFailure(() -> control.setOnline(false));
        OfflineDownloadTransfer.Source source = unchanged("/dash", total);
        AtomicLong committed = new AtomicLong();
        try (RandomAccessFile output = new RandomAccessFile(scratch.newFile(), "rw")) {
            output.setLength(total);
            copy(control, source, LARGE_OFFSET, pendingStart - 1, output, LARGE_OFFSET, committed);
            Future<?> transfer = workers.submit(() -> {
                copy(control, source, pendingStart, end, output, pendingStart, committed);
                return null;
            });
            await(unavailable);
            assertEquals(OfflineTransferControl.State.WAITING, control.state());
            assertEquals(finished + INTERRUPTED_AT, committed.get());
            assertFalse(transfer.isDone());

            control.setOnline(true);
            transfer.get(5, TimeUnit.SECONDS);
            assertEquals(payload.length, committed.get());
            assertEquals(total, output.length());
            assertArrayEquals(payload, readAt(output, LARGE_OFFSET, payload.length));
        }
        assertEquals(List.of(new WireRequest("/dash", range(LARGE_OFFSET, pendingStart - 1), null),
                        new WireRequest("/dash", range(pendingStart, end), ETAG),
                        new WireRequest("/dash", range(pendingStart + INTERRUPTED_AT, end), ETAG)), requests);
    }

    @Test
    public void sustainedSocketLossRecoversFromTheRetainedOffsetWithoutANetworkCallback() throws Exception {
        int end = payload.length - 1;
        WireServer interrupted = server;
        int port = interrupted.port();
        OfflineDownloadTransfer.Source source = unchanged("/nominally-online", payload.length);
        interrupted.createContext("/nominally-online", exchange -> {
            record(exchange);
            interrupted.stopListening();
            respond(exchange, 206, 0, end, payload.length, ETAG, 0, INTERRUPTED_AT);
        });

        CountDownLatch failures = new CountDownLatch(5);
        OfflineTransferControl control = new OfflineTransferControl(() -> {}, 3, 10);
        // Observe failures without changing online. A short body followed by repeated refused sockets
        // must outlive the ordinary three-attempt budget while Android still reports Internet.
        control.onNetworkFailure(failures::countDown);
        AtomicLong committed = new AtomicLong();
        AtomicReference<OfflineTransferControl.State> stateAtRecovery = new AtomicReference<>();
        try (RandomAccessFile output = new RandomAccessFile(scratch.newFile(), "rw")) {
            output.setLength(payload.length);
            Future<?> transfer = workers.submit(() -> {
                copy(control, source, 0, end, output, 0, committed);
                return null;
            });
            try {
                await(failures);
                assertEquals(OfflineTransferControl.State.WAITING, control.state());
                assertEquals(INTERRUPTED_AT, committed.get());
                assertFalse(transfer.isDone());

                interrupted.close();
                server = new WireServer(port, Map.of("/nominally-online", exchange -> {
                    stateAtRecovery.set(control.state());
                    record(exchange);
                    respond(exchange, 206, INTERRUPTED_AT, end, payload.length, ETAG,
                            INTERRUPTED_AT, payload.length - INTERRUPTED_AT);
                }));

                transfer.get(5, TimeUnit.SECONDS);
                assertEquals(OfflineTransferControl.State.WAITING, stateAtRecovery.get());
                assertEquals(OfflineTransferControl.State.RUNNING, control.state());
                assertEquals(payload.length, committed.get());
                assertArrayEquals(payload, readAt(output, 0, payload.length));
            } finally {
                control.cancel();
            }
        }
        assertEquals(List.of(new WireRequest("/nominally-online", range(0, end), null),
                new WireRequest("/nominally-online", range(INTERRUPTED_AT, end), ETAG)), requests);
    }

    @Test
    public void manualPauseCancelsActiveReadAndConnectivityReturnDoesNotStartAnotherRequest() throws Exception {
        CountDownLatch releaseFirst = new CountDownLatch(1);
        CountDownLatch bytesWritten = new CountDownLatch(1);
        CountDownLatch paused = new CountDownLatch(1);
        AtomicReference<OfflineTransferControl> gate = new AtomicReference<>();
        OfflineTransferControl control = new OfflineTransferControl(() -> {
            if (gate.get().state() == OfflineTransferControl.State.PAUSED) paused.countDown();
        }, 3, 1);
        gate.set(control);
        server.createContext("/segment", exchange -> {
            WireRequest request = record(exchange);
            if (request.range() == null) {
                OutputStream body = exchange.output();
                // Whole unknown-length HLS/progressive response; leave the chunked response open until pause.
                writeAscii(body, "HTTP/1.1 200 OK\r\nConnection: close\r\nETag: " + ETAG
                        + "\r\nTransfer-Encoding: chunked\r\n\r\n" + Integer.toHexString(INTERRUPTED_AT) + "\r\n");
                body.write(payload, 0, INTERRUPTED_AT);
                writeAscii(body, "\r\n");
                body.flush();
                await(releaseFirst);
            } else {
                int start = Integer.parseInt(request.range().substring("bytes=".length(), request.range().length() - 1));
                respond(exchange, 206, start, payload.length - 1, payload.length, ETAG, start, payload.length - start);
            }
        });

        AtomicLong committed = new AtomicLong();
        try (RandomAccessFile output = new RandomAccessFile(scratch.newFile(), "rw")) {
            Future<?> transfer = workers.submit(() -> {
                OfflineDownloadTransfer.copy(control, unchanged("/segment", -1), 0, -1, output, 0,
                        new byte[1024], size -> {
                            if (committed.addAndGet(size) >= 4096) bytesWritten.countDown();
                        });
                return null;
            });
            try {
                await(bytesWritten);
                control.setPaused(true);
                await(paused);
                long pausedAt = committed.get();
                assertTrue(pausedAt >= 4096 && pausedAt <= INTERRUPTED_AT);

                control.setOnline(false);
                control.setOnline(true);
                assertEquals(OfflineTransferControl.State.PAUSED, control.state());
                assertEquals(pausedAt, committed.get());
                assertEquals(1, requests.size());
                assertFalse(transfer.isDone());

                releaseFirst.countDown();
                control.setPaused(false);
                transfer.get(5, TimeUnit.SECONDS);
                assertEquals(payload.length, committed.get());
                assertArrayEquals(payload, readAt(output, 0, payload.length));
                assertEquals(new WireRequest("/segment", range(pausedAt, -1), ETAG), requests.get(1));
            } finally {
                releaseFirst.countDown();
                control.cancel();
            }
        }
    }

    @Test
    public void expiredWholeSegmentResumesWithVerifiedNewSignedEndpointAndIfRange() throws Exception {
        int end = payload.length - 1;
        server.createContext("/expired", exchange -> {
            WireRequest request = record(exchange);
            if (request.range() == null) {
                respond(exchange, 200, 0, end, payload.length, ETAG, 0, INTERRUPTED_AT);
            } else {
                respond(exchange, 403, 0, -1, payload.length, null, 0, 0);
            }
        });
        server.createContext("/fresh", exchange -> {
            record(exchange);
            respond(exchange, 206, INTERRUPTED_AT, end, payload.length, ETAG,
                    INTERRUPTED_AT, payload.length - INTERRUPTED_AT);
        });

        OfflineDownloadTransfer.Endpoint expired = endpoint("/expired");
        AtomicReference<OfflineDownloadTransfer.Endpoint> current = new AtomicReference<>(expired);
        AtomicInteger refreshes = new AtomicInteger();
        OfflineDownloadTransfer.Source source = new OfflineDownloadTransfer.Source(current::get, previous -> {
            assertSame(expired, previous);
            refreshes.incrementAndGet();
            current.set(endpoint("/fresh"));
        }, -1);
        AtomicLong committed = new AtomicLong();
        try (RandomAccessFile output = new RandomAccessFile(scratch.newFile(), "rw")) {
            copy(control(), source, 0, -1, output, 0, committed);
            assertEquals(payload.length, committed.get());
            assertArrayEquals(payload, readAt(output, 0, payload.length));
        }
        assertEquals(1, refreshes.get());
        assertEquals(List.of(new WireRequest("/expired", null, null),
                new WireRequest("/expired", range(INTERRUPTED_AT, end), ETAG),
                new WireRequest("/fresh", range(INTERRUPTED_AT, end), ETAG)), requests);
    }

    @Test
    public void resumedHlsByteRangeUsesSourceOffsetsButWritesARelativeSegmentFile() throws Exception {
        long end = LARGE_OFFSET + payload.length - 1;
        long resumedAt = LARGE_OFFSET + INTERRUPTED_AT;
        long total = end + 1024;
        server.createContext("/clip", exchange -> {
            WireRequest request = record(exchange);
            if (request.range().equals(range(LARGE_OFFSET, end))) {
                respond(exchange, 206, LARGE_OFFSET, end, total, null, 0, INTERRUPTED_AT);
            } else {
                respond(exchange, 206, resumedAt, end, total, null, INTERRUPTED_AT, payload.length - INTERRUPTED_AT);
            }
        });

        AtomicLong committed = new AtomicLong();
        try (RandomAccessFile output = new RandomAccessFile(scratch.newFile(), "rw")) {
            copy(control(), unchanged("/clip", -1), LARGE_OFFSET, end, output, 0, committed);
            assertEquals(payload.length, committed.get());
            assertEquals(payload.length, output.length());
            assertArrayEquals(payload, readAt(output, 0, payload.length));
        }
        assertEquals(List.of(new WireRequest("/clip", range(LARGE_OFFSET, end), null),
                new WireRequest("/clip", range(resumedAt, end), null)), requests);
    }

    @Test
    public void refusesIgnoredAndInconsistentRangesWithoutWritingTheSuffix() throws Exception {
        List<String> bad = List.of("ignored", "start", "end", "total", "length", "etag");
        int end = payload.length - 1;
        for (String mode : bad) {
            String path = "/" + mode;
            server.createContext(path, exchange -> {
                WireRequest request = record(exchange);
                if (request.range().equals(range(0, end))) {
                    respond(exchange, 206, 0, end, payload.length, ETAG, 0, INTERRUPTED_AT);
                    return;
                }

                int start = mode.equals("start") ? INTERRUPTED_AT + 1 : INTERRUPTED_AT;
                int last = mode.equals("end") ? end - 1 : end;
                long total = mode.equals("total") ? payload.length + 1 : payload.length;
                int status = mode.equals("ignored") ? 200 : 206;
                String tag = mode.equals("etag") ? "\"new-v2\"" : ETAG;
                long declared = last - start + 1L + (mode.equals("length") ? 1 : 0);
                respond(exchange, status, start, last, total, tag, start, 1, declared);
            });

            AtomicLong committed = new AtomicLong();
            try (RandomAccessFile output = new RandomAccessFile(scratch.newFile(), "rw")) {
                output.setLength(payload.length);
                assertThrows(mode, OfflineTransferControl.PermanentFailure.class,
                        () -> copy(control(), unchanged(path, payload.length), 0, end, output, 0, committed));
                assertEquals(mode, INTERRUPTED_AT, committed.get());
                assertArrayEquals(mode, new byte[payload.length - INTERRUPTED_AT],
                        readAt(output, INTERRUPTED_AT, payload.length - INTERRUPTED_AT));
            }
        }
        assertEquals(bad.size() * 2, requests.size());
    }

    @Test
    public void persistentShortReadIsBoundedRatherThanSpinning() throws Exception {
        int end = payload.length - 1;
        server.createContext("/empty", exchange -> {
            record(exchange);
            respond(exchange, 206, 0, end, payload.length, null, 0, 0);
        });

        AtomicLong committed = new AtomicLong();
        try (RandomAccessFile output = new RandomAccessFile(scratch.newFile(), "rw")) {
            assertThrows(IOException.class,
                    () -> copy(control(), unchanged("/empty", payload.length), 0, end, output, 0, committed));
        }
        assertEquals(0, committed.get());
        assertEquals(3, requests.size());
    }

    @Test
    public void cancelUnblocksParkedWorkersWithoutConnectingOrFinalizing() throws Exception {
        server.createContext("/never", exchange -> {
            record(exchange);
            respond(exchange, 206, 0, 0, 1, null, 0, 1);
        });

        for (boolean manuallyPaused : List.of(true, false)) {
            OfflineTransferControl control = control();
            if (manuallyPaused) control.setPaused(true);
            else control.setOnline(false);
            try (RandomAccessFile output = new RandomAccessFile(scratch.newFile(), "rw")) {
                CountDownLatch started = new CountDownLatch(1);
                Future<?> transfer = workers.submit(() -> {
                    started.countDown();
                    copy(control, unchanged("/never", 1), 0, 0, output, 0, new AtomicLong());
                    control.seal(() -> { throw new AssertionError("Cancelled transfer must not publish"); });
                    return null;
                });
                await(started);
                control.cancel();
                control.setPaused(false);
                control.setOnline(true);
                ExecutionException failure = assertThrows(ExecutionException.class,
                        () -> transfer.get(5, TimeUnit.SECONDS));
                assertTrue(failure.getCause() instanceof CancellationException);
                assertEquals(0, output.length());
            }
        }
        assertTrue(requests.isEmpty());
    }

    private OfflineDownloadTransfer.Endpoint endpoint(String path) {
        return new OfflineDownloadTransfer.Endpoint("http://127.0.0.1:" + server.port() + path, null);
    }

    private OfflineDownloadTransfer.Source unchanged(String path, long length) {
        OfflineDownloadTransfer.Endpoint endpoint = endpoint(path);
        return new OfflineDownloadTransfer.Source(() -> endpoint, unused -> {
            throw new AssertionError("Unexpected refresh");
        }, length);
    }

    private static OfflineTransferControl control() {
        return new OfflineTransferControl(() -> {}, 3, 1);
    }

    private static void copy(OfflineTransferControl control, OfflineDownloadTransfer.Source source,
                             long start, long end, RandomAccessFile output, long destination, AtomicLong committed)
            throws IOException {
        OfflineDownloadTransfer.copy(control, source, start, end, output, destination,
                new byte[BUFFER], committed::addAndGet);
    }

    private WireRequest record(WireExchange exchange) {
        WireRequest request = exchange.request();
        requests.add(request);
        return request;
    }

    private void respond(WireExchange exchange, int status, long start, long end, long total,
                         String etag, int offset, int size) throws IOException {
        respond(exchange, status, start, end, total, etag, offset, size, end - start + 1);
    }

    private void respond(WireExchange exchange, int status, long start, long end, long total,
                         String etag, int offset, int size, long declared) throws IOException {
        StringBuilder headers = new StringBuilder("HTTP/1.1 ").append(status).append(" Fixture\r\n")
                .append("Connection: close\r\nContent-Length: ").append(status == 403 ? 0 : declared).append("\r\n");
        if (status == 206) {
            headers.append("Content-Range: bytes ").append(start).append('-').append(end)
                    .append('/').append(total).append("\r\n");
        }
        if (etag != null) headers.append("ETag: ").append(etag).append("\r\n");
        headers.append("\r\n");

        OutputStream body = exchange.output();
        writeAscii(body, headers.toString());
        if (size > 0) body.write(payload, offset, size);
        body.flush();
        // The fixture closes the socket after the handler returns, even for a deliberately short body.
    }

    private static String range(long start, long end) {
        return "bytes=" + start + "-" + (end < 0 ? "" : end);
    }

    private static byte[] readAt(RandomAccessFile file, long start, int size) throws IOException {
        byte[] bytes = new byte[size];
        file.seek(start);
        file.readFully(bytes);
        return bytes;
    }

    private static void await(CountDownLatch latch) {
        try {
            assertTrue("Timed out waiting for the transfer", latch.await(5, TimeUnit.SECONDS));
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            throw new AssertionError(interrupted);
        }
    }

    private static void writeAscii(OutputStream output, String text) throws IOException {
        output.write(text.getBytes(US_ASCII));
    }

    @FunctionalInterface
    private interface Handler {
        void reply(WireExchange exchange) throws IOException;
    }

    private record WireExchange(WireRequest request, OutputStream output) {}

    /** One request per socket, so a short body really ends before the advertised Content-Length. */
    private static final class WireServer {
        private final Map<String, Handler> handlers = new ConcurrentHashMap<>();
        private final ServerSocket listener;
        private final Thread thread;
        private Throwable failure;

        WireServer() throws IOException {
            this(0, Map.of());
        }

        WireServer(int port, Map<String, Handler> initialHandlers) throws IOException {
            handlers.putAll(initialHandlers);
            listener = new ServerSocket();
            listener.setReuseAddress(true);
            listener.bind(new InetSocketAddress("127.0.0.1", port));
            thread = new Thread(this::serve, "offline-download-http-fixture");
            thread.setDaemon(true);
            thread.start();
        }

        int port() {
            return listener.getLocalPort();
        }

        void createContext(String path, Handler handler) {
            handlers.put(path, handler);
        }

        void stopListening() throws IOException {
            listener.close();
        }

        void close() throws IOException, InterruptedException {
            stopListening();
            thread.join(5000);
            assertFalse("HTTP fixture did not stop", thread.isAlive());
            if (failure != null) throw new AssertionError("HTTP fixture failed", failure);
        }

        private void serve() {
            while (!listener.isClosed()) {
                try (Socket socket = listener.accept()) {
                    socket.setSoTimeout(5000);
                    WireRequest request = readRequest(new BufferedInputStream(socket.getInputStream()));
                    Handler handler = handlers.get(request.path());
                    if (handler == null) throw new IOException("Unexpected request path: " + request.path());
                    handler.reply(new WireExchange(request, socket.getOutputStream()));
                } catch (IOException | AssertionError | RuntimeException error) {
                    if (!listener.isClosed()) failure = error;
                    return;
                }
            }
        }

        private static WireRequest readRequest(InputStream input) throws IOException {
            String[] request = readLine(input).split(" ", 3);
            if (request.length != 3 || !"GET".equals(request[0])) throw new IOException("Invalid request line");

            String range = null;
            String ifRange = null;
            for (int count = 0; count < 32; count++) {
                String line = readLine(input);
                if (line.isEmpty()) return new WireRequest(request[1], range, ifRange);
                int separator = line.indexOf(':');
                if (separator < 0) throw new IOException("Invalid request header");
                String name = line.substring(0, separator);
                if ("Range".equalsIgnoreCase(name)) range = line.substring(separator + 1).trim();
                if ("If-Range".equalsIgnoreCase(name)) ifRange = line.substring(separator + 1).trim();
            }
            throw new IOException("Too many request headers");
        }

        private static String readLine(InputStream input) throws IOException {
            StringBuilder line = new StringBuilder();
            for (int count = 0; count < 4096; count++) {
                int value = input.read();
                if (value < 0) throw new EOFException("Incomplete request");
                if (value == '\r') {
                    if (input.read() != '\n') throw new IOException("Invalid request line ending");
                    return line.toString();
                }
                line.append((char) value);
            }
            throw new IOException("Request line too long");
        }
    }

    private record WireRequest(String path, String range, String ifRange) {}
}
