/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.io.InputStream;
import java.net.CookieHandler;
import java.net.HttpCookie;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.net.URI;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.LongSupplier;

import app.hushpinterest.extension.pinterest.settings.NoCookies;
import app.hushpinterest.extension.shared.Logger;

/**
 * HEAD requests for downloads and Plain pin links: whether the media host has an original behind a
 * supplied size, and where a pin.it short link leads. Neither follows a redirect or reads a body,
 * and neither carries a cookie ({@link NoCookies}). Downloads go through Android's DownloadManager,
 * except the ones {@link InAppDownloads} saves itself with a whole-file GET ({@link #fetch}). Media
 * details' Check the file adds one GET for the start of a file, with the same limits and a bounded
 * read ({@link #prefix}).
 */
public final class PinTransfer {
    private PinTransfer() {}

    interface Connection {
        HttpURLConnection open(URI uri) throws IOException;
    }

    static final Connection NETWORK = uri -> (HttpURLConnection) uri.toURL().openConnection();
    static final LongSupplier CLOCK = () -> TimeUnit.NANOSECONDS.toMillis(System.nanoTime());

    // A stuck resolver cannot consume the shared app workers or create a new thread on every tap.
    private static final ThreadPoolExecutor exchanges = workers("hushpinterest-media-request");
    private static final ThreadPoolExecutor disconnects = workers("hushpinterest-media-close");
    // How long a turned-away request waits for a worker that has just answered to come back.
    private static final long HANDOFF_MS = 500;

    private static ThreadPoolExecutor workers(String name) {
        ThreadPoolExecutor pool = new ThreadPoolExecutor(2, 2, 1, TimeUnit.MINUTES,
                new SynchronousQueue<>(), runnable -> {
                    Thread thread = new Thread(runnable, name);
                    thread.setDaemon(true);
                    return thread;
                }, new ThreadPoolExecutor.AbortPolicy());
        pool.allowCoreThreadTimeOut(true);
        return pool;
    }

    private interface Answer<T> {
        T read(HttpURLConnection connection, int status) throws IOException;
    }

    /**
     * The connection for a HEAD request, unless the process's cookie handler would put a cookie on
     * it. What a CookieManager keeps for pin.it or the media host is dropped first, but never for a
     * pinterest.com hop of the short-link redirector, where Pinterest's sign-in lives: a cookie
     * there stops the request instead.
     */
    private static HttpURLConnection open(URI uri, Connection factory, CookieHandler cookies) throws IOException {
        if (forgettable(uri)) NoCookies.forget(cookies, uri);
        String refusal = NoCookies.refusal(cookies, uri);
        if (refusal != null) throw new IOException(refusal);
        return factory.open(uri);
    }

    /**
     * Closes [head] and drops what its answer stored: everything on pin.it and the media host, and
     * on a pinterest.com hop only what the answer set ([answered]) over what was [kept], or that
     * cookie would stop every later lookup.
     */
    private static void close(HttpURLConnection head, URI uri, @Nullable CookieHandler cookies,
                              @Nullable List<HttpCookie> kept, Set<String> answered) {
        try {
            head.disconnect();
        } finally {
            if (forgettable(uri)) NoCookies.forget(cookies, uri);
            else NoCookies.forgetSince(cookies, uri, kept, answered);
        }
    }

    private static boolean forgettable(URI uri) {
        String host = uri.getHost() == null ? "" : uri.getHost().toLowerCase(Locale.ROOT);
        return host.equals("pin.it") || host.equals("pinimg.com") || host.endsWith(".pinimg.com");
    }

    /**
     * True when the media host answers a HEAD request for the address with a 200 and the image
     * type the address names. It follows no redirect. A 5xx or 429 throws, like a failed
     * connection: the host couldn't answer now, which doesn't say the file isn't there.
     */
    static boolean present(PinMedia.Source source, Connection factory) throws IOException {
        return present(source, factory, CLOCK, CLOCK.getAsLong() + OriginalLookup.DEADLINE_MS);
    }

    /** A HEAD sharing its caller's monotonic deadline across all original candidates. */
    static boolean present(PinMedia.Source source, Connection factory, LongSupplier clock, long deadline) throws IOException {
        URI uri = PinMedia.mediaUri(source.url);
        if (uri == null) throw new IOException("Not a public Pinterest media URL");
        return exchange(uri, factory, clock, deadline, 5000, false, (head, status) -> {
            if (status >= 500 || status == 429) throw new IOException("The media host couldn't answer now: " + status);
            if (status != HttpURLConnection.HTTP_OK) return false;
            String type = head.getContentType();
            return type != null && type.split(";", 2)[0].trim().equalsIgnoreCase(source.mime);
        });
    }

    /**
     * Where a redirect at the address points: its Location header, or null when the answer isn't a
     * redirect. A HEAD request with no redirect followed and no body read. The caller checks the
     * address and the answer.
     */
    public static String location(URI uri, int timeoutMs) throws IOException {
        return location(uri, timeoutMs, NETWORK);
    }

    static String location(URI uri, int timeoutMs, Connection factory) throws IOException {
        if (timeoutMs <= 0) throw new SocketTimeoutException("The media host took too long");
        return exchange(uri, factory, CLOCK, CLOCK.getAsLong() + timeoutMs, timeoutMs, false, (head, status) -> {
            if (status != 301 && status != 302 && status != 303 && status != 307 && status != 308) return null;
            return head.getHeaderField("Location");
        });
    }

    /** The most of a file a check reads. Image headers sit well inside it. */
    static final int PREFIX_BYTES = 65536;

    /** How long reading the start of a file may take in all, however slowly its bytes arrive. */
    static final long PREFIX_DEADLINE_MS = 15000;

    /** How long a request dropped at the deadline gets to close and put cookies back. */
    private static final long CLOSE_GRACE_MS = 1000;

    /** What the media host answered a ranged GET with, and at most {@link #PREFIX_BYTES} of its body. */
    static final class Prefix {
        final int status;
        /** The Content-Range header, or null. */
        @Nullable final String range;
        /** The Content-Length header, or -1. For a 206 it's the part sent, never the whole file. */
        final long length;
        /** The Content-Encoding header, or null. */
        @Nullable final String encoding;
        final byte[] bytes;

        Prefix(int status, @Nullable String range, long length, @Nullable String encoding, byte[] bytes) {
            this.status = status;
            this.range = range;
            this.length = length;
            this.encoding = encoding;
            this.bytes = bytes;
        }
    }

    /**
     * One GET for the first {@link #PREFIX_BYTES} bytes of the media file at [source], for Media
     * details' Check the file. Like the HEAD requests it follows no redirect and carries no cookie.
     * It reads no more than {@link #PREFIX_BYTES} bytes of the body, whatever the host sends, and
     * gives up {@link #PREFIX_DEADLINE_MS} after it starts, counting the connection, the headers
     * and the body. The original lookup before it has its own timeouts. An answer other than 200
     * or 206 comes back with no body read.
     */
    static Prefix prefix(PinMedia.Source source, Connection factory, LongSupplier clock) throws IOException {
        return prefix(source, factory, clock, PREFIX_DEADLINE_MS);
    }

    /** {@link #prefix} with a deadline of [deadlineMs]. Tests shorten it. */
    static Prefix prefix(PinMedia.Source source, Connection factory, LongSupplier clock, long deadlineMs) throws IOException {
        URI uri = PinMedia.mediaUri(source.url);
        if (uri == null) throw new IOException("Not a public Pinterest media URL");
        long deadline = clock.getAsLong() + deadlineMs;
        return exchange(uri, factory, clock, deadline, 5000, true, (get, status) -> {
            if (status != HttpURLConnection.HTTP_OK && status != HttpURLConnection.HTTP_PARTIAL) {
                return new Prefix(status, null, -1, null, new byte[0]);
            }
            return new Prefix(status, get.getHeaderField("Content-Range"), get.getContentLengthLong(),
                    get.getContentEncoding(), read(get.getInputStream(), clock, deadline));
        });
    }

    /** The file is bigger than the caller allows, by its Content-Length or by the bytes that arrived. */
    static final class TooLarge extends IOException {
        TooLarge(long limit) {
            super("The media file is bigger than " + limit + " bytes");
        }
    }

    /** What the media host answered a whole-file GET with. [written] is 0 unless the body was kept. */
    static final class Fetched {
        final int status;
        /** The Content-Type header, or null. */
        @Nullable final String type;
        final long written;

        Fetched(int status, @Nullable String type, long written) {
            this.status = status;
            this.type = type;
            this.written = written;
        }
    }

    /**
     * One GET for the whole file at [source], written to [into] (Copy image). Like the other
     * requests it follows no redirect and carries no cookie, and the one budget of [budgetMs]
     * counts the connection, the headers and every byte of the body. The body is kept only for a
     * 200 whose type [typeOk] accepts, and never past [maxBytes]: a longer Content-Length or a
     * longer body throws {@link TooLarge}. A body that fails part way leaves no file behind.
     */
    static Fetched fetch(PinMedia.Source source, java.io.File into, long maxBytes, java.util.function.Predicate<String> typeOk,
                         Connection factory, LongSupplier clock, long budgetMs) throws IOException {
        return fetch(source, new Sink() {
            @Override public java.io.OutputStream open() throws IOException {
                return new java.io.FileOutputStream(into);
            }

            @Override public void discard() {
                if (!into.delete() && into.exists()) into.deleteOnExit();
            }
        }, maxBytes, typeOk, factory, clock, budgetMs);
    }

    /** Where a whole-file GET writes its body. */
    interface Sink {
        java.io.OutputStream open() throws IOException;

        /** Throws away what was written: the body failed part way or was refused. */
        void discard();
    }

    /** {@link #fetch} into a [into] the caller supplies, such as a MediaStore entry (Download pins). */
    static Fetched fetch(PinMedia.Source source, Sink into, long maxBytes, java.util.function.Predicate<String> typeOk,
                         Connection factory, LongSupplier clock, long budgetMs) throws IOException {
        URI uri = PinMedia.mediaUri(source.url);
        if (uri == null) throw new IOException("Not a public Pinterest media URL");
        long deadline = clock.getAsLong() + budgetMs;
        return exchange(uri, factory, clock, deadline, 5000, true, false, (get, status) -> {
            String type = get.getContentType();
            if (status != HttpURLConnection.HTTP_OK || !typeOk.test(type)) return new Fetched(status, type, 0);
            if (get.getContentLengthLong() > maxBytes) throw new TooLarge(maxBytes);
            String encoding = get.getContentEncoding();
            if (encoding != null && !encoding.trim().equalsIgnoreCase("identity")) {
                throw new IOException("The media host encoded the file");
            }
            boolean kept = false;
            try (InputStream body = get.getInputStream(); java.io.OutputStream out = into.open()) {
                byte[] buffer = new byte[16384];
                long total = 0;
                while (true) {
                    if (clock.getAsLong() > deadline) throw new SocketTimeoutException("The media host sent the file too slowly");
                    int read = body.read(buffer);
                    if (read < 0) break;
                    total += read;
                    if (total > maxBytes) throw new TooLarge(maxBytes);
                    out.write(buffer, 0, read);
                }
                kept = true;
                return new Fetched(status, type, total);
            } finally {
                if (!kept) into.discard();
            }
        });
    }

    /**
     * The pool only turns a request away when both workers exist, and one that has just answered may
     * not be back at the queue yet. A lookup asks up to four questions in a row, so without this wait
     * it could find both workers "busy" between two answers and settle for the supplied size. Two
     * workers that are really stuck still refuse it, never past the caller's deadline.
     */
    private static boolean handOff(Runnable request, LongSupplier clock, long deadline) {
        long wait = Math.min(HANDOFF_MS, deadline - clock.getAsLong());
        if (wait <= 0) return false;
        try {
            return exchanges.getQueue().offer(request, wait, TimeUnit.MILLISECONDS);
        } catch (InterruptedException stopped) {
            Thread.currentThread().interrupt();
            return false;
        }
    }

    /** All three exchanges include opening, headers, reading and cleanup in one caller budget. */
    private static <T> T exchange(URI uri, Connection factory, LongSupplier clock, long deadline,
                                  int socketTimeout, boolean prefix, Answer<T> answer) throws IOException {
        return exchange(uri, factory, clock, deadline, socketTimeout, prefix, prefix, answer);
    }

    /** [get] asks with GET instead of HEAD, and [ranged] limits that GET to the start of the file. */
    private static <T> T exchange(URI uri, Connection factory, LongSupplier clock, long deadline,
                                  int socketTimeout, boolean get, boolean ranged, Answer<T> answer) throws IOException {
        if (clock.getAsLong() >= deadline) throw new SocketTimeoutException("The media host took too long");
        CookieHandler cookies = CookieHandler.getDefault();
        AtomicReference<HttpURLConnection> opened = new AtomicReference<>();
        AtomicBoolean expired = new AtomicBoolean();
        CountDownLatch closed = new CountDownLatch(1);
        FutureTask<T> request = new FutureTask<>(() -> {
            HttpURLConnection connection = null;
            List<HttpCookie> kept = NoCookies.kept(cookies, uri);
            Set<String> answered = Collections.emptySet();
            try {
                if (expired.get()) throw new SocketTimeoutException("The media host took too long");
                connection = open(uri, factory, cookies);
                opened.set(connection);
                if (expired.get() || clock.getAsLong() >= deadline) {
                    throw new SocketTimeoutException("The media host took too long");
                }
                connection.setRequestMethod(get ? "GET" : "HEAD");
                connection.setInstanceFollowRedirects(false);
                connection.setUseCaches(false);
                connection.setConnectTimeout(socketTimeout);
                connection.setReadTimeout(socketTimeout);
                connection.setRequestProperty("Accept-Encoding", "identity");
                if (ranged) connection.setRequestProperty("Range", "bytes=0-" + (PREFIX_BYTES - 1));
                int status = connection.getResponseCode();
                answered = NoCookies.setBy(connection.getHeaderFields());
                if (expired.get() || clock.getAsLong() >= deadline) {
                    throw new SocketTimeoutException("The media host took too long");
                }
                T result = answer.read(connection, status);
                if (expired.get() || clock.getAsLong() >= deadline) {
                    throw new SocketTimeoutException("The media host took too long");
                }
                return result;
            } finally {
                try {
                    if (connection != null) close(connection, uri, cookies, kept, answered);
                } finally {
                    closed.countDown();
                }
            }
        });
        try {
            exchanges.execute(request);
        } catch (RejectedExecutionException busy) {
            if (!handOff(request, clock, deadline)) throw new IOException("No media lookup worker is free", busy);
        }
        try {
            long left = deadline - clock.getAsLong();
            if (left <= 0) throw new TimeoutException();
            return request.get(left, TimeUnit.MILLISECONDS);
        } catch (TimeoutException | InterruptedException stopped) {
            boolean interrupted = stopped instanceof InterruptedException;
            expired.set(true);
            HttpURLConnection connection = opened.get();
            if (connection != null) {
                try {
                    disconnects.execute(() -> {
                        try {
                            connection.disconnect();
                        } catch (RuntimeException failure) {
                            Logger.printInfo(() -> "Timed-out media connection didn't close", failure);
                        }
                    });
                } catch (RejectedExecutionException busy) {
                    Logger.printInfo(() -> "Media connection cleanup is busy");
                }
            }
            request.cancel(true);
            // Future cancellation completes before its running task's finally. Wait for the actual
            // cookie cleanup, without waiting forever on a resolver or a blocked disconnect.
            if (!interrupted) {
                try {
                    closed.await(CLOSE_GRACE_MS, TimeUnit.MILLISECONDS);
                } catch (InterruptedException gone) {
                    interrupted = true;
                }
            }
            if (interrupted) Thread.currentThread().interrupt();
            throw new SocketTimeoutException("The media host took too long");
        } catch (ExecutionException failed) {
            Throwable cause = failed.getCause();
            if (cause instanceof IOException) throw (IOException) cause;
            if (cause instanceof RuntimeException) throw (RuntimeException) cause;
            if (cause instanceof Error) throw (Error) cause;
            throw new IOException(cause);
        }
    }

    private static byte[] read(InputStream body, LongSupplier clock, long deadline) throws IOException {
        byte[] buffer = new byte[PREFIX_BYTES];
        int filled = 0;
        while (filled < PREFIX_BYTES) {
            if (clock.getAsLong() > deadline) throw new SocketTimeoutException("The media host sent the file too slowly");
            int read = body.read(buffer, filled, PREFIX_BYTES - filled);
            if (read < 0) break;
            filled += read;
        }
        return Arrays.copyOf(buffer, filled);
    }
}
