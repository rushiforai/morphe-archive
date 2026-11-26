/*
 * Copyright (C) 2026 lavinhoque33
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25.
 */

package app.morphe.extension.youtube.patches.general.offline;

import static app.morphe.extension.youtube.patches.general.offline.OfflineTransferControl.PermanentFailure;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.net.HttpURLConnection;
import java.util.concurrent.TimeUnit;
import java.util.function.IntConsumer;
import java.util.function.Supplier;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import okhttp3.Call;
import okhttp3.OkHttpClient;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;

/** Copies one owned extent. A preallocated file is never consulted to find its committed offset. */
final class OfflineDownloadTransfer {
    private static final Pattern CONTENT_RANGE = Pattern.compile("bytes ([0-9]+)-([0-9]+)/([0-9]+)");
    private static final OkHttpClient HTTP = new OkHttpClient.Builder()
            .connectTimeout(15, TimeUnit.SECONDS)
            .readTimeout(30, TimeUnit.SECONDS)
            .retryOnConnectionFailure(false)
            .build();
    private static final Request PLAYER_CONNECTION = new Request.Builder()
            .url("https://youtubei.googleapis.com/youtubei/v1/player").head().build();

    record Endpoint(String url, String userAgent) {}

    interface Refresh {
        void refresh(Endpoint rejected) throws IOException;
    }

    interface Read<T> {
        T read(Response response) throws IOException;
    }

    static final class ExpiredUrl extends PermanentFailure {
        final Endpoint endpoint;

        ExpiredUrl(int status, Endpoint endpoint) {
            super("HTTP " + status);
            this.endpoint = endpoint;
        }
    }

    /** Shared across the parallel extents of a single HTTP representation. */
    static final class Source {
        private final Supplier<Endpoint> endpoint;
        private final Refresh refresh;
        private volatile long length;
        private volatile String etag;

        Source(Supplier<Endpoint> endpoint, Refresh refresh, long length) {
            this.endpoint = endpoint;
            this.refresh = refresh;
            this.length = length;
        }

        long length() {
            return length;
        }

        synchronized void observe(Response response, long size) throws IOException {
            if (size >= 0) {
                if (length >= 0 && length != size) throw new PermanentFailure("Stream length changed");
                length = size;
            }
            String actualTag = response.header("ETag");
            if (actualTag != null) {
                if (etag != null && !etag.equals(actualTag)) throw new PermanentFailure("Stream ETag changed");
                if (actualTag.startsWith("\"") && actualTag.endsWith("\"")) etag = actualTag;
            }
        }

        <T> T withEndpoint(OfflineTransferControl control, EndpointRead<T> action) throws IOException {
            try {
                return control.execute(attempt -> action.read(attempt, endpoint.get()));
            } catch (ExpiredUrl first) {
                refresh.refresh(first.endpoint);
                return control.execute(attempt -> action.read(attempt, endpoint.get()));
            }
        }
    }

    interface EndpointRead<T> {
        T read(OfflineTransferControl.Attempt attempt, Endpoint endpoint) throws IOException;
    }

    private OfflineDownloadTransfer() {}

    static long probeLength(OfflineTransferControl control, Source source) throws IOException {
        return source.withEndpoint(control, (attempt, endpoint) -> request(attempt, endpoint,
                0, 0, null, response -> {
                    if (response.code() == HttpURLConnection.HTTP_OK) {
                        // Some origins only accept a whole GET. Don't use a 200 as a successful range.
                        source.observe(response, contentLength(response));
                        return -1L;
                    }
                    long size = rangeLength(response, 0, 0, contentLength(response));
                    source.observe(response, size);
                    return size;
                }));
    }

    /** {@code end} is inclusive in the source, or -1 for a whole (possibly unknown-length) resource. */
    static void copy(OfflineTransferControl control, Source source, long start, long end,
                     RandomAccessFile output, long destination, byte[] buffer, IntConsumer onBytes)
            throws IOException {
        // One cursor per extent, not per attempt. In particular output.length() might include other workers' data.
        Copy copy = new Copy(source, start, end, output, destination, buffer, onBytes);
        source.withEndpoint(control, copy::request);
    }

    private static final class Copy {
        private final Source source;
        private final long start;
        private final long end;
        private final RandomAccessFile output;
        private final long destination;
        private final byte[] buffer;
        private final IntConsumer onBytes;
        private long position;

        Copy(Source source, long start, long end, RandomAccessFile output, long destination,
             byte[] buffer, IntConsumer onBytes) {
            this.source = source;
            this.start = position = start;
            this.end = end;
            this.output = output;
            this.destination = destination;
            this.buffer = buffer;
            this.onBytes = onBytes;
        }

        Void request(OfflineTransferControl.Attempt attempt, Endpoint endpoint) throws IOException {
            boolean ranged = end >= 0 || position != start;
            long knownLength = source.length();
            long requestedEnd = end >= 0 ? end : knownLength - 1;
            return OfflineDownloadTransfer.request(attempt, endpoint, ranged ? position : -1, requestedEnd,
                    ranged ? source.etag : null, response -> {
                        long length = contentLength(response);
                        long last;
                        if (ranged) {
                            long size = rangeLength(response, position, requestedEnd, length);
                            source.observe(response, size);
                            last = requestedEnd < 0 ? size - 1 : requestedEnd;
                        } else {
                            if (response.code() != HttpURLConnection.HTTP_OK) throw unexpectedStatus(response.code());
                            source.observe(response, length);
                            if (source.length() == 0) throw new PermanentFailure("Empty stream response");
                            last = source.length() - 1;
                            requireFraming(response, last);
                        }
                        copyBody(attempt, response.body().byteStream(), last);
                        if (position == start) throw new PermanentFailure("Empty stream response");
                        attempt.mediaReceived();
                        return null;
                    });
        }

        private void copyBody(OfflineTransferControl.Attempt attempt, InputStream input, long last) throws IOException {
            try {
                output.seek(destination + (position - start));
            } catch (IOException failure) {
                throw new PermanentFailure("Could not seek in download scratch file", failure);
            }

            while (true) {
                long remaining = last < 0 ? buffer.length : last - position + 1;
                if (remaining == 0) return;
                int limit = (int) Math.min(buffer.length, remaining);
                int filled = 0;
                try {
                    while (filled < limit) {
                        attempt.check();
                        int received = input.read(buffer, filled, limit - filled);
                        if (received < 0) break;
                        filled += received;
                    }
                } catch (IOException failure) {
                    // A read failure after some short socket reads must not lose the bytes already received.
                    commit(filled);
                    throw failure;
                }
                if (last >= 0 && filled == remaining && input.read() != -1) {
                    throw new PermanentFailure("Oversized stream response");
                }
                commit(filled);
                if (filled < limit) {
                    if (last >= 0) throw new EOFException("Incomplete stream response");
                    return;
                }
            }
        }

        private void commit(int size) throws IOException {
            if (size == 0) return;
            try {
                output.write(buffer, 0, size);
            } catch (IOException failure) {
                throw new PermanentFailure("Could not write download scratch file", failure);
            }
            position += size;
            onBytes.accept(size);
        }
    }

    /** Validates inclusive endpoints, total size, and length before any response bytes reach disk. */
    private static long rangeLength(Response response, long start, long end, long length) throws IOException {
        if (response.code() != HttpURLConnection.HTTP_PARTIAL) throw unexpectedStatus(response.code());
        String header = response.header("Content-Range");
        Matcher range = CONTENT_RANGE.matcher(header == null ? "" : header);
        if (!range.matches()) throw new PermanentFailure("Invalid Content-Range");

        long actualStart = parseNumber(range.group(1));
        long actualEnd = parseNumber(range.group(2));
        long total = parseNumber(range.group(3));
        long expectedEnd = end < 0 ? total - 1 : end;
        if (actualStart != start || actualEnd != expectedEnd || actualEnd < actualStart || actualEnd >= total
                || length >= 0 && length != actualEnd - actualStart + 1) {
            throw new PermanentFailure("Byte range does not match the request");
        }
        return total;
    }

    private static long contentLength(Response response) throws IOException {
        String header = response.header("Content-Length");
        if (header != null && response.header("Transfer-Encoding") != null) {
            throw new PermanentFailure("Conflicting stream framing");
        }
        return header == null ? -1 : parseNumber(header);
    }

    private static void requireFraming(Response response, long last) throws IOException {
        if (last >= 0 || response.protocol() == Protocol.HTTP_2 || response.protocol() == Protocol.H2_PRIOR_KNOWLEDGE
                || "chunked".equalsIgnoreCase(response.header("Transfer-Encoding"))) return;

        // A close-delimited response could be an ordinary EOF or a cable pull. Don't publish an ambiguous file.
        throw new PermanentFailure("No reliable byte count for stream response");
    }

    private static long parseNumber(String header) throws IOException {
        for (int index = 0; index < header.length(); index++) {
            char digit = header.charAt(index);
            if (digit < '0' || digit > '9') throw new PermanentFailure("Invalid stream byte count");
        }
        try {
            long value = Long.parseLong(header);
            if (value >= 0) return value;
        } catch (NumberFormatException ignored) {
        }
        throw new PermanentFailure("Invalid stream byte count");
    }

    static <T> T request(OfflineTransferControl.Attempt attempt, Endpoint endpoint, long start, long end,
                         String ifRange, Read<T> read) throws IOException {
        Request.Builder request = new Request.Builder().url(endpoint.url()).header("Accept-Encoding", "identity");
        if (endpoint.userAgent() != null) request.header("User-Agent", endpoint.userAgent());
        if (start >= 0) {
            request.header("Range", "bytes=" + start + "-" + (end < 0 ? "" : end));
            if (ifRange != null) request.header("If-Range", ifRange);
        }

        Call call = HTTP.newCall(request.build());
        attempt.track(call);
        try (Response response = call.execute()) {
            attempt.check();
            int status = response.code();
            if (status == 401 || status == 403 || status == 410) {
                attempt.advanceRecovery();
                throw new ExpiredUrl(status, endpoint);
            }
            String encoding = response.header("Content-Encoding");
            if (encoding != null && !"identity".equalsIgnoreCase(encoding)) {
                throw new PermanentFailure("Unexpected Content-Encoding");
            }
            return read.read(response);
        }
    }

    /**
     * The shared player fetcher returns null for both transport failures and an unavailable format.
     * Probe the same HTTPS origin without credentials only when that distinction is needed.
     */
    static IOException unavailableMetadata(OfflineTransferControl.Attempt attempt, String message) throws IOException {
        Call call = HTTP.newCall(PLAYER_CONNECTION);
        attempt.track(call);
        try (Response ignored = call.execute()) {
            attempt.check();
            // Any HTTP response proves transport to the origin, not that the requested format is available.
            return new IOException(message);
        }
    }

    static IOException unexpectedStatus(int status) {
        String message = "Download request returned HTTP " + status;
        return status >= 500 || status == 408 || status == 429
                ? new IOException(message) : new PermanentFailure(message);
    }
}
