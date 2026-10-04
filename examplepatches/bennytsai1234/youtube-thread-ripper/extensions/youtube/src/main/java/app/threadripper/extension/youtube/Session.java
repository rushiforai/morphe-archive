package app.threadripper.extension.youtube;

import android.os.SystemClock;

import org.chromium.net.CronetEngine;
import org.chromium.net.CronetException;
import org.chromium.net.UrlRequest;
import org.chromium.net.UrlResponseInfo;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.nio.ByteBuffer;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/**
 * Downloads one media byte range as fixed-size chunks over several concurrent requests and hands
 * the bytes to the player strictly in order, as soon as each byte is contiguous with what was
 * already delivered. googlevideo limits each request of a spoofed-client stream while concurrent
 * requests for different parts add up (measured on a PC over HTTP/1.1: 5-10 Mbps per request; on the
 * phone over HTTP/3 a single request reached 29-85 Mbps, so the gain there depends on the network).
 *
 * Invariants:
 * - Bytes reach the player only in file order, and only bytes that were requested for that exact
 *   offset. Each response must be 2xx with the expected length; anything else is retried from the
 *   last received byte, never spliced.
 * - At most {@code window} chunks are buffered or in flight past the read position, bounding memory.
 * - close() cancels every request; nothing is delivered after close.
 * - Request priority falls with distance from the read position, so the bytes the player needs
 *   first are not slowed down by chunks further ahead (at startup on a slow link, equal shares
 *   would make the player wait for all concurrent chunks before the first one completes).
 */
final class Session {
    /** No byte for this long on an active request: cancel and resume elsewhere. */
    private static final long STALL_MS = 6000;
    /** How long open() waits for the first response before giving the request back to the app. */
    private static final long FIRST_RESPONSE_MS = 10000;
    private static final int MAX_ATTEMPTS = 4;
    private static final int READ_BUFFER = 64 * 1024;
    /** Cronet REQUEST_PRIORITY_HIGHEST (4) down to REQUEST_PRIORITY_LOWEST (1). */
    private static final int PRIORITY_HIGHEST = 4;
    private static final int PRIORITY_LOWEST = 1;

    private static final ExecutorService CALLBACKS = Executors.newFixedThreadPool(2, r -> {
        Thread t = new Thread(r, "ThreadRipper-net");
        t.setDaemon(true);
        return t;
    });
    private static final ScheduledExecutorService WATCHDOG = Executors.newSingleThreadScheduledExecutor(r -> {
        Thread t = new Thread(r, "ThreadRipper-watchdog");
        t.setDaemon(true);
        return t;
    });

    private final CronetEngine engine;
    private final String baseUrl;
    private final Map<String, String> headers;
    private final long start;
    private final long length;
    private final int threads;
    private final int window;
    private final Chunk[] chunks;

    // All mutable state below is guarded by "this".
    private int nextToStart;
    private int active;
    private int readChunk;
    private int readOffset;
    private boolean closed;
    private IOException failure;
    /** HTTP status of the first response, or -1 if it failed without one. 0 = not yet known. */
    private int firstStatus;
    private String protocol;
    private int retries;
    private long delivered;
    private final long openedAt = SystemClock.elapsedRealtime();
    /** Milliseconds after open until the first byte of the range and until its first chunk was complete. */
    private long firstByteMs = -1;
    private long firstChunkMs = -1;
    private ScheduledFuture<?> watchdog;

    Session(CronetEngine engine, String url, Map<String, String> headers, long start, long length, Config config) {
        this.engine = engine;
        this.baseUrl = stripRange(url);
        this.headers = headers;
        this.start = start;
        this.length = length;
        this.threads = config.threads;
        this.window = config.threads * 2;
        int count = (int) ((length + config.chunkBytes - 1) / config.chunkBytes);
        chunks = new Chunk[count];
        for (int i = 0; i < count; i++) {
            long off = (long) i * config.chunkBytes;
            chunks[i] = new Chunk(i, start + off, (int) Math.min(config.chunkBytes, length - off));
        }
    }

    /**
     * Starts the downloads and waits for the first response.
     *
     * @return false if the server did not accept the request (for example 403 after the URL's
     * byte quota). The session is closed and the app should load the range itself, so its own
     * error handling (such as refreshing the stream URL) sees the real response.
     */
    boolean open() throws InterruptedIOException {
        synchronized (this) {
            startMore();
            watchdog = WATCHDOG.scheduleWithFixedDelay(this::checkStalls, 1, 1, TimeUnit.SECONDS);
            long deadline = SystemClock.elapsedRealtime() + FIRST_RESPONSE_MS;
            try {
                while (firstStatus == 0) {
                    long left = deadline - SystemClock.elapsedRealtime();
                    if (left <= 0) break;
                    wait(left);
                }
            } catch (InterruptedException ex) {
                close();
                Thread.currentThread().interrupt();
                throw new InterruptedIOException();
            }
            if (firstStatus >= 200 && firstStatus < 300) return true;
        }
        Log.d("First response " + firstStatus + ", leaving range to the app");
        close();
        return false;
    }

    /** media3 DataReader.read() contract: bytes read, or -1 at the end of the range. */
    int read(byte[] buffer, int offset, int length) throws IOException {
        if (length == 0) return 0;
        synchronized (this) {
            while (true) {
                if (closed) throw new IOException("ThreadRipper session closed");
                if (readChunk >= chunks.length) return -1;
                Chunk c = chunks[readChunk];
                int available = c.filled - readOffset;
                if (available > 0) {
                    int n = Math.min(length, available);
                    System.arraycopy(c.data, readOffset, buffer, offset, n);
                    readOffset += n;
                    delivered += n;
                    if (readOffset == c.size) {
                        c.data = null;
                        readChunk++;
                        readOffset = 0;
                        startMore();
                    }
                    return n;
                }
                // A later chunk's failure only matters once this chunk can make no more progress.
                if (failure != null && c.request == null && !c.done) throw failure;
                try {
                    wait(1000);
                } catch (InterruptedException ex) {
                    Thread.currentThread().interrupt();
                    throw new InterruptedIOException();
                }
            }
        }
    }

    void close() {
        synchronized (this) {
            if (closed) return;
            closed = true;
            if (watchdog != null) watchdog.cancel(false);
            for (Chunk c : chunks) {
                if (c.request != null) {
                    c.request.cancel();
                    c.request = null;
                }
                c.data = null;
            }
            notifyAll();
        }
        long ms = Math.max(1, SystemClock.elapsedRealtime() - openedAt);
        Log.d("Closed " + (start) + "+" + length + ": delivered " + delivered + " B in " + ms + " ms = "
                + (delivered * 8 / ms / 1000) + " Mbps, chunks " + chunks.length + ", threads " + threads
                + ", retries " + retries + ", " + protocol + ", first byte " + firstByteMs + " ms, first chunk "
                + firstChunkMs + " ms, slowest" + slowestChunks(3));
    }

    /** The longest chunk downloads, as " #index Nms/attempts" (unfinished chunks count until now). */
    private String slowestChunks(int count) {
        long now = SystemClock.elapsedRealtime();
        StringBuilder sb = new StringBuilder();
        boolean[] used = new boolean[chunks.length];
        for (int k = 0; k < count; k++) {
            int best = -1;
            long bestMs = -1;
            for (int i = 0; i < chunks.length; i++) {
                Chunk c = chunks[i];
                if (used[i] || c.startedAt == 0) continue;
                long ms = (c.doneAt != 0 ? c.doneAt : now) - c.startedAt;
                if (ms > bestMs) {
                    best = i;
                    bestMs = ms;
                }
            }
            if (best < 0) break;
            used[best] = true;
            sb.append(" #").append(best).append(' ').append(bestMs).append("ms/").append(chunks[best].attempts)
                    .append(chunks[best].doneAt == 0 ? " unfinished" : "");
        }
        return sb.toString();
    }

    // region Scheduling

    /** Starts requests while below the thread limit and inside the read window. Holds lock. */
    private void startMore() {
        if (closed || failure != null) return;
        // Resume chunks that need a retry first: they are earlier in the file than new ones.
        for (int i = readChunk; i < nextToStart && active < threads; i++) {
            Chunk c = chunks[i];
            if (c.request == null && !c.done) startAttempt(c);
        }
        while (active < threads && nextToStart < chunks.length && nextToStart < readChunk + window) {
            Chunk c = chunks[nextToStart++];
            c.data = new byte[c.size];
            startAttempt(c);
        }
    }

    /** Holds lock. */
    private void startAttempt(Chunk c) {
        if (c.filled == c.size) {
            // Every byte arrived before the attempt was declared failed.
            c.done = true;
            notifyAll();
            return;
        }
        c.attempts++;
        if (c.startedAt == 0) c.startedAt = SystemClock.elapsedRealtime();
        long from = c.offset + c.filled;
        long to = c.offset + c.size - 1;
        String url = baseUrl + "&range=" + from + "-" + to;
        UrlRequest.Builder builder = engine.newUrlRequestBuilder(url, new ChunkCallback(c), CALLBACKS)
                .setHttpMethod("GET")
                .setPriority(Math.max(PRIORITY_LOWEST, PRIORITY_HIGHEST - (c.index - readChunk)));
        for (Map.Entry<String, String> h : headers.entrySet()) {
            builder.addHeader(h.getKey(), h.getValue());
        }
        UrlRequest request = builder.build();
        c.request = request;
        c.expected = (int) (to - from + 1);
        c.received = 0;
        c.lastProgress = SystemClock.elapsedRealtime();
        active++;
        request.start();
    }

    /** The attempt ended without completing the chunk. Holds lock. */
    private void attemptFailed(Chunk c, String reason, int status) {
        c.request = null;
        active--;
        if (closed) return;
        if (c.index == 0 && c.filled == 0 && firstStatus == 0) {
            // Nothing delivered yet: let open() hand the whole range back to the app.
            firstStatus = status > 0 ? status : -1;
            notifyAll();
            return;
        }
        if (status == 403 || status == 404 || status == 410 || c.attempts >= MAX_ATTEMPTS) {
            failure = new IOException("ThreadRipper chunk " + c.index + " failed: " + reason);
            Log.d(failure.getMessage());
            notifyAll();
            return;
        }
        retries++;
        Log.d("Retry chunk " + c.index + " at " + c.filled + "/" + c.size + ": " + reason);
        startMore();
    }

    private void checkStalls() {
        synchronized (this) {
            if (closed) return;
            long now = SystemClock.elapsedRealtime();
            for (int i = readChunk; i < nextToStart; i++) {
                Chunk c = chunks[i];
                if (c.request != null && now - c.lastProgress > STALL_MS) {
                    UrlRequest r = c.request;
                    attemptFailed(c, "stalled", 0);
                    r.cancel();
                }
            }
        }
    }

    // endregion

    private final class ChunkCallback extends UrlRequest.Callback {
        private final Chunk chunk;

        ChunkCallback(Chunk chunk) {
            this.chunk = chunk;
        }

        /** True if this callback belongs to the chunk's current attempt. Holds lock. */
        private boolean current(UrlRequest request) {
            return !closed && chunk.request == request;
        }

        @Override
        public void onRedirectReceived(UrlRequest request, UrlResponseInfo info, String newLocationUrl) {
            request.followRedirect();
        }

        @Override
        public void onResponseStarted(UrlRequest request, UrlResponseInfo info) {
            synchronized (Session.this) {
                if (!current(request)) return;
                int status = info.getHttpStatusCode();
                if (status < 200 || status > 299) {
                    attemptFailed(chunk, "HTTP " + status, status);
                    request.cancel();
                    return;
                }
                long contentLength = header(info, "Content-Length");
                if (contentLength >= 0 && contentLength != chunk.expected) {
                    attemptFailed(chunk, "Content-Length " + contentLength + " != " + chunk.expected, 0);
                    request.cancel();
                    return;
                }
                if (firstStatus == 0) {
                    firstStatus = status;
                    protocol = info.getNegotiatedProtocol();
                    Session.this.notifyAll();
                }
                chunk.lastProgress = SystemClock.elapsedRealtime();
            }
            request.read(ByteBuffer.allocateDirect(READ_BUFFER));
        }

        @Override
        public void onReadCompleted(UrlRequest request, UrlResponseInfo info, ByteBuffer buffer) {
            buffer.flip();
            synchronized (Session.this) {
                if (!current(request)) return;
                int n = buffer.remaining();
                if (chunk.received + n > chunk.expected) {
                    attemptFailed(chunk, "response longer than requested", 0);
                    request.cancel();
                    return;
                }
                if (chunk.index == 0 && chunk.filled == 0 && n > 0) {
                    firstByteMs = SystemClock.elapsedRealtime() - openedAt;
                }
                buffer.get(chunk.data, chunk.filled, n);
                chunk.filled += n;
                chunk.received += n;
                chunk.lastProgress = SystemClock.elapsedRealtime();
                if (chunk.index == readChunk) Session.this.notifyAll();
            }
            buffer.clear();
            request.read(buffer);
        }

        @Override
        public void onSucceeded(UrlRequest request, UrlResponseInfo info) {
            synchronized (Session.this) {
                if (!current(request)) return;
                if (chunk.received != chunk.expected) {
                    attemptFailed(chunk, "short response " + chunk.received + "/" + chunk.expected, 0);
                    return;
                }
                chunk.done = true;
                chunk.request = null;
                active--;
                chunk.doneAt = SystemClock.elapsedRealtime();
                if (chunk.index == 0) firstChunkMs = chunk.doneAt - openedAt;
                startMore();
                Session.this.notifyAll();
            }
        }

        @Override
        public void onFailed(UrlRequest request, UrlResponseInfo info, CronetException error) {
            synchronized (Session.this) {
                if (!current(request)) return;
                attemptFailed(chunk, String.valueOf(error.getMessage()),
                        info == null ? 0 : info.getHttpStatusCode());
            }
        }
    }

    private static final class Chunk {
        final int index;
        final long offset;
        final int size;
        byte[] data;
        /** Contiguous bytes stored from the start of the chunk; only grows. */
        int filled;
        boolean done;
        int attempts;
        UrlRequest request;
        /** Bytes the current attempt asked for, and has received. */
        int expected;
        int received;
        long lastProgress;
        /** Start of the first attempt and completion time, for the log. */
        long startedAt;
        long doneAt;

        Chunk(int index, long offset, int size) {
            this.index = index;
            this.offset = offset;
            this.size = size;
        }
    }

    private static long header(UrlResponseInfo info, String name) {
        for (Map.Entry<String, List<String>> e : info.getAllHeaders().entrySet()) {
            if (e.getKey().equalsIgnoreCase(name) && !e.getValue().isEmpty()) {
                try {
                    return Long.parseLong(e.getValue().get(0).trim());
                } catch (NumberFormatException ex) {
                    return -1;
                }
            }
        }
        return -1;
    }

    /** Removes the range and ump query parameters, keeping every other parameter byte-for-byte. */
    static String stripRange(String url) {
        int q = url.indexOf('?');
        if (q < 0) return url + "?";
        StringBuilder sb = new StringBuilder(url.length()).append(url, 0, q + 1);
        boolean first = true;
        for (String part : url.substring(q + 1).split("&")) {
            if (part.isEmpty() || part.startsWith("range=") || part.startsWith("ump=")) continue;
            if (!first) sb.append('&');
            sb.append(part);
            first = false;
        }
        return sb.toString();
    }
}
