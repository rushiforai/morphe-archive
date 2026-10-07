/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import android.content.Context;
import android.net.Uri;

import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.function.LongSupplier;

/** Streams into a chosen document and validates every redirect before connecting. */
final class PinTransfer {
    private PinTransfer() {}

    // Android 9 saves have one five-minute budget across every redirect and copy, and a
    // 256 MiB byte limit. The watchdog cancels network reads; provider I/O is cooperative
    // because a document provider may ignore interruption. Pause doesn't cancel a running save.
    static final long TIME_LIMIT_MS = TimeUnit.MINUTES.toMillis(5);
    static final long BYTE_LIMIT = 256L * 1024 * 1024;
    private static final ScheduledThreadPoolExecutor DEADLINES = new ScheduledThreadPoolExecutor(1, task -> {
        Thread thread = new Thread(task, "HushPinterest pin deadline");
        thread.setDaemon(true);
        return thread;
    });
    static { DEADLINES.setRemoveOnCancelPolicy(true); }

    interface Connection {
        HttpURLConnection open(URI uri) throws IOException;
    }

    static final Connection NETWORK = uri -> (HttpURLConnection) uri.toURL().openConnection();

    /**
     * True when the media host answers a HEAD request for the address with a 200 and the image
     * type the address names. It follows no redirect.
     */
    static boolean present(PinMedia.Source source, Connection factory) throws IOException {
        URI uri = PinMedia.mediaUri(source.url);
        if (uri == null) throw new IOException("Not a public Pinterest media URL");
        HttpURLConnection head = factory.open(uri);
        try {
            head.setRequestMethod("HEAD");
            head.setInstanceFollowRedirects(false);
            head.setUseCaches(false);
            head.setConnectTimeout(5000);
            head.setReadTimeout(5000);
            head.setRequestProperty("Accept-Encoding", "identity");
            if (head.getResponseCode() != HttpURLConnection.HTTP_OK) return false;
            String type = head.getContentType();
            return type != null && type.split(";", 2)[0].trim().equalsIgnoreCase(source.mime);
        } finally {
            head.disconnect();
        }
    }

    /** Only an owned destination proved incomplete is safe for the caller to remove. */
    static final class SaveFailure extends IOException {
        final boolean incomplete;
        SaveFailure(Throwable cause, boolean incomplete) {
            super(cause.getMessage(), cause);
            this.incomplete = incomplete;
        }
    }

    static void save(Context context, Uri destination, String source) throws SaveFailure {
        save(context, destination, source, NETWORK, System::nanoTime, TIME_LIMIT_MS, BYTE_LIMIT);
    }

    static void save(Context context, Uri destination, String source, Connection factory,
                     LongSupplier clock, long timeoutMs, long byteLimit) throws SaveFailure {
        if (destination == null || !"content".equals(destination.getScheme())) {
            throw new SaveFailure(new IOException("Save location is not a document"), false);
        }
        Run run = new Run(clock, timeoutMs, byteLimit);
        try (run) {
            HttpURLConnection connection = connect(source, factory, run);
            run.expected = connection.getContentLengthLong();
            if (run.expected > byteLimit) throw new IOException("Pin media exceeds the byte limit");
            run.check();
            try (InputStream input = connection.getInputStream();
                 OutputStream output = context.getContentResolver().openOutputStream(destination, "w")) {
                if (output == null) throw new IOException("Save location unavailable");
                long bytes = copy(input, output, run);
                if (bytes == 0 || (run.expected >= 0 && bytes != run.expected)) {
                    run.invalid = true;
                    throw new IOException("Incomplete pin media");
                }
                run.check();
                output.flush();
                run.check();
            }
            run.check();
        } catch (IOException | RuntimeException failure) {
            if (run.expired) {
                InterruptedIOException timeout = new InterruptedIOException("Pin transfer exceeded its time limit");
                timeout.initCause(failure);
                throw new SaveFailure(timeout, run.incomplete());
            }
            throw new SaveFailure(failure, run.incomplete());
        }
    }

    static HttpURLConnection connect(String source, Connection factory) throws IOException {
        try (Run run = new Run(System::nanoTime, TIME_LIMIT_MS, BYTE_LIMIT)) {
            HttpURLConnection connection = connect(source, factory, run);
            run.connection = null;
            return connection;
        }
    }

    private static HttpURLConnection connect(String source, Connection factory, Run run) throws IOException {
        URI uri = PinMedia.mediaUri(source);
        if (uri == null) throw new IOException("Not a public Pinterest media URL");
        for (int redirects = 0; redirects <= 5; redirects++) {
            run.check();
            HttpURLConnection connection = factory.open(uri);
            run.connection = connection;
            boolean returned = false;
            try {
                run.check();
                connection.setInstanceFollowRedirects(false);
                connection.setConnectTimeout(run.timeout(20000));
                connection.setReadTimeout(run.timeout(30000));
                connection.setRequestProperty("Accept-Encoding", "identity");
                int status = connection.getResponseCode();
                run.check();
                if (status == HttpURLConnection.HTTP_OK) {
                    returned = true;
                    return connection;
                }
                if (status != 301 && status != 302 && status != 303 && status != 307 && status != 308) {
                    throw new IOException("Media response " + status);
                }
                String location = connection.getHeaderField("Location");
                if (location == null) throw new IOException("Media redirect without location");
                try {
                    uri = PinMedia.mediaUri(uri.resolve(location).toString());
                } catch (IllegalArgumentException malformed) {
                    throw new IOException("Malformed media redirect", malformed);
                }
                if (uri == null) throw new IOException("Media redirected away from Pinterest CDN");
            } finally {
                if (!returned) {
                    run.connection = null;
                    connection.disconnect();
                }
            }
        }
        throw new IOException("Too many media redirects");
    }

    static long copy(InputStream input, OutputStream output) throws IOException {
        try (Run run = new Run(System::nanoTime, TIME_LIMIT_MS, BYTE_LIMIT)) {
            return copy(input, output, run);
        }
    }

    private static long copy(InputStream input, OutputStream output, Run run) throws IOException {
        byte[] buffer = new byte[32768];
        while (true) {
            run.check();
            if (run.connection != null) run.connection.setReadTimeout(run.timeout(30000));
            int size = input.read(buffer);
            if (size == -1) return run.written;
            run.check();
            if (size == 0) continue;
            if (size > run.byteLimit - run.written ||
                    (run.expected >= 0 && size > run.expected - run.written)) {
                run.invalid = true;
                throw new IOException("Pin media exceeds its byte limit or declared length");
            }
            // A throwing write may still have accepted this whole chunk. Keep that upper bound
            // so a late provider error never turns a possibly complete file into a deletion.
            run.possible = run.written + size;
            output.write(buffer, 0, size);
            run.written += size;
            run.check();
        }
    }

    private static final class Run implements AutoCloseable {
        final LongSupplier clock;
        final long start, timeoutNanos, byteLimit;
        final Thread worker = Thread.currentThread();
        final ScheduledFuture<?> deadline;
        volatile HttpURLConnection connection;
        volatile boolean expired;
        private boolean finished;
        long expected = -1, written, possible;
        boolean invalid;

        Run(LongSupplier clock, long timeoutMs, long byteLimit) {
            if (timeoutMs <= 0 || timeoutMs > TIME_LIMIT_MS || byteLimit <= 0 || byteLimit > BYTE_LIMIT) {
                throw new IllegalArgumentException("Invalid pin transfer budget");
            }
            this.clock = clock;
            this.start = clock.getAsLong();
            this.timeoutNanos = TimeUnit.MILLISECONDS.toNanos(timeoutMs);
            this.byteLimit = byteLimit;
            deadline = DEADLINES.schedule(this::expire, timeoutMs, TimeUnit.MILLISECONDS);
        }

        private void expire() {
            HttpURLConnection active;
            synchronized (this) {
                if (finished) return;
                expired = true;
                worker.interrupt();
                active = connection;
            }
            if (active != null) active.disconnect();
        }

        void check() throws InterruptedIOException {
            if (expired || clock.getAsLong() - start >= timeoutNanos) {
                throw new InterruptedIOException("Pin transfer exceeded its time limit");
            }
            if (worker.isInterrupted()) throw new InterruptedIOException("Pin transfer canceled");
        }

        int timeout(int maximum) throws InterruptedIOException {
            check();
            long remaining = TimeUnit.NANOSECONDS.toMillis(timeoutNanos - (clock.getAsLong() - start));
            return (int) Math.max(1, Math.min(maximum, remaining));
        }

        boolean incomplete() { return invalid || possible == 0 || expected > possible; }

        @Override public void close() {
            HttpURLConnection active;
            synchronized (this) {
                finished = true;
                active = connection;
                connection = null;
            }
            deadline.cancel(false);
            if (active != null) active.disconnect();
        }
    }
}
