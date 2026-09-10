/*
 * Copyright (C) 2026 Dual VoT contributors
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.extension.youtube.patches.voiceovertranslation.yandex;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Production HTTP byte-range reader for one Yandex part, with strict validation of every
 * {@code 206} response before any byte is uploaded.
 *
 * <p>The connection is injectable so the parser and the read loop are unit-tested against
 * fake responses: correct {@code Content-Range}, wrong start/end/total, a missing header,
 * {@code 206} bodies that must never be mistaken for a full file, partial {@code InputStream}
 * reads, truncation, and abort during the read are all covered without a network.
 */
final class YandexVotHttpAudioPartReader implements YandexVotAudioTransfer.PartReader {
    private static final int CONNECT_TIMEOUT_MS = 15_000;
    private static final int READ_TIMEOUT_MS = 30_000;
    private static final String USER_AGENT =
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 " +
                    "(KHTML, like Gecko) Chrome/134.0.0.0 YaBrowser/25.4.0.0 Safari/537.36";

    /** View over one HTTP response that the read loop needs. */
    interface Connection extends AutoCloseable {
        int status() throws IOException;

        @Nullable
        String header(String name);

        /** Length of the response body, or -1 when unknown. */
        long contentLength();

        InputStream stream() throws IOException;

        @Override
        void close();
    }

    /** Opens a connection for one byte range. */
    interface Factory {
        Connection open(String url, long start, long endInclusive) throws IOException;
    }

    private final String url;
    /** Full track size when already known (from clen or a probe), otherwise 0. */
    private final long knownTotal;
    private final Factory factory;
    /** A single full-body response reused for sequential multipart reads when Range is ignored. */
    @Nullable
    private Connection wholeBodyConnection;
    @Nullable
    private InputStream wholeBodyStream;
    private long wholeBodyPosition;

    YandexVotHttpAudioPartReader(String url, long knownTotal) {
        this(url, knownTotal, YandexVotHttpAudioPartReader::openRealConnection);
    }

    YandexVotHttpAudioPartReader(String url, long knownTotal, Factory factory) {
        this.url = url;
        this.knownTotal = knownTotal;
        this.factory = factory;
    }

    /**
     * Learns the full track size with a one-byte probe. A {@code 206} response is only
     * trusted when its {@code Content-Range} total is present and covers the probe; the
     * {@code Content-Length} of a partial response is never treated as the full size.
     *
     * @throws YandexVotAudioTransfer.SourceDeniedException on HTTP 403
     * @throws YandexVotAudioTransfer.SourceReadException when no full size can be proven
     */
    static long probeTotalSize(String url)
            throws YandexVotAudioTransfer.SourceDeniedException,
            YandexVotAudioTransfer.SourceReadException {
        return probeTotalSize(url, YandexVotHttpAudioPartReader::openRealConnection);
    }

    /**
     * Same strict one-byte size probe through a caller-selected transport.  The player-media
     * path supplies a Cronet-backed factory so this must not silently fall back to a new
     * platform connection.
     */
    static long probeTotalSize(String url, Factory factory)
            throws YandexVotAudioTransfer.SourceDeniedException,
            YandexVotAudioTransfer.SourceReadException {
        try (Connection connection = factory.open(url, 0, 0)) {
            return resolveTotalSize(
                    connection.status(),
                    connection.header("Content-Range"),
                    connection.contentLength()
            );
        } catch (YandexVotAudioTransfer.SourceDeniedException ex) {
            throw ex;
        } catch (YandexVotAudioTransfer.SourceReadException ex) {
            throw ex;
        } catch (IOException ex) {
            throw new YandexVotAudioTransfer.SourceReadException(
                    "Audio size probe could not be read");
        }
    }

    static Factory factoryForUserAgent(@Nullable String userAgent) {
        String effectiveUserAgent = userAgent == null || userAgent.isEmpty()
                ? USER_AGENT
                : userAgent;
        return (url, start, endInclusive) ->
                openRealConnection(url, start, endInclusive, effectiveUserAgent);
    }

    /**
     * Pure size-resolution policy shared by the probe and by tests.
     *
     * @param status HTTP status code of the probe response
     * @param contentRange the {@code Content-Range} header (may be null)
     * @param contentLength {@code Content-Length} of the response body, or -1 when unknown
     * @return the proven full track size
     * @throws YandexVotAudioTransfer.SourceDeniedException on HTTP 403
     * @throws YandexVotAudioTransfer.SourceReadException when no full size can be proven
     */
    static long resolveTotalSize(int status, @Nullable String contentRange, long contentLength)
            throws YandexVotAudioTransfer.SourceDeniedException,
            YandexVotAudioTransfer.SourceReadException {
        if (status == HttpURLConnection.HTTP_FORBIDDEN) {
            throw new YandexVotAudioTransfer.SourceDeniedException(
                    "Media server denied the range probe (HTTP 403)");
        }
        if (status == HttpURLConnection.HTTP_PARTIAL) {
            YandexVotContentRange range = YandexVotContentRange.require(contentRange, 0, 0, 0);
            return range.total;
        }
        if (status == HttpURLConnection.HTTP_OK) {
            // The server ignored the Range header and returned the whole body.
            if (contentLength <= 0) {
                throw new YandexVotAudioTransfer.SourceReadException(
                        "Audio size probe has no usable full length");
            }
            return contentLength;
        }
        throw new YandexVotAudioTransfer.SourceReadException(
                "Audio size probe failed: HTTP " + status);
    }

    @Override
    public byte[] read(long start, int length, YandexVotAudioTransfer.AbortSignal abort)
            throws YandexVotAudioTransfer.SourceDeniedException,
            YandexVotAudioTransfer.SourceReadException,
            YandexVotAudioTransfer.ReadAbortedException {
        if (length <= 0 || length > YandexVotAudioParts.PART_SIZE_BYTES) {
            throw new YandexVotAudioTransfer.SourceReadException("Invalid audio part size");
        }
        if (wholeBodyConnection != null) {
            return readFromWholeBody(start, length, abort);
        }
        long end = start + length - 1;

        Connection connection = null;
        try {
            connection = factory.open(url, start, end);
            int status = connection.status();
            if (status == HttpURLConnection.HTTP_FORBIDDEN) {
                throw new YandexVotAudioTransfer.SourceDeniedException(
                        "Media server denied the requested range (HTTP 403)");
            }
            if (status == HttpURLConnection.HTTP_PARTIAL) {
                // Mandatory strict validation: without an exact matching Content-Range the
                // response could be a different range or an unknown-length body, and its
                // bytes must never be uploaded.
                YandexVotContentRange.require(
                        connection.header("Content-Range"), start, end, knownTotal);
            } else if (status == HttpURLConnection.HTTP_OK) {
                // Some player transports return the complete resource even when Range is
                // present. Keep that one validated body open and consume its parts in order;
                // reopening and discarding the prefix per part would turn a long track into
                // quadratic network traffic.
                if (knownTotal <= 0 || connection.contentLength() != knownTotal) {
                    throw new YandexVotAudioTransfer.SourceReadException(
                            "Media server returned an unproven whole-body response");
                }
                if (start != 0) {
                    throw new YandexVotAudioTransfer.SourceReadException(
                            "Whole-body source did not begin at the first audio part");
                }
                InputStream fullBodyStream = connection.stream();
                wholeBodyConnection = connection;
                wholeBodyStream = fullBodyStream;
                wholeBodyPosition = 0;
                connection = null; // Ownership moved to close()/readFromWholeBody().
                return readFromWholeBody(start, length, abort);
            } else {
                throw new YandexVotAudioTransfer.SourceReadException(
                        "Audio download failed: HTTP " + status);
            }

            return readConnectionBody(connection, length, abort);
        } catch (YandexVotAudioTransfer.SourceDeniedException ex) {
            throw ex;
        } catch (YandexVotAudioTransfer.SourceReadException ex) {
            throw ex;
        } catch (YandexVotAudioTransfer.ReadAbortedException ex) {
            throw ex;
        } catch (IOException ex) {
            // A network failure that arrives after the abort signal fired (for example a
            // socket read timing out) is an abort outcome, not a corrupted-part outcome.
            if (abort != null && abort.shouldAbort()) {
                throw new YandexVotAudioTransfer.ReadAbortedException();
            }
            throw new YandexVotAudioTransfer.SourceReadException(
                    "Audio part could not be read");
        } finally {
            if (connection != null) connection.close();
        }
    }

    @Override
    public void close() {
        closeWholeBody();
    }

    private byte[] readFromWholeBody(
            long start,
            int length,
            YandexVotAudioTransfer.AbortSignal abort
    ) throws YandexVotAudioTransfer.SourceReadException,
            YandexVotAudioTransfer.ReadAbortedException {
        if (wholeBodyStream == null || start != wholeBodyPosition) {
            closeWholeBody();
            throw new YandexVotAudioTransfer.SourceReadException(
                    "Whole-body source cannot serve a non-sequential audio part");
        }
        try {
            byte[] part = readStream(wholeBodyStream, length, abort);
            wholeBodyPosition += length;
            if (wholeBodyPosition == knownTotal) {
                closeWholeBody();
            }
            return part;
        } catch (YandexVotAudioTransfer.SourceReadException
                 | YandexVotAudioTransfer.ReadAbortedException ex) {
            closeWholeBody();
            throw ex;
        } catch (IOException ex) {
            closeWholeBody();
            if (abort != null && abort.shouldAbort()) {
                throw new YandexVotAudioTransfer.ReadAbortedException();
            }
            throw new YandexVotAudioTransfer.SourceReadException("Audio part could not be read");
        }
    }

    private static byte[] readConnectionBody(
            Connection connection,
            int length,
            YandexVotAudioTransfer.AbortSignal abort
    ) throws YandexVotAudioTransfer.SourceReadException,
            YandexVotAudioTransfer.ReadAbortedException,
            IOException {
        InputStream inputStream = null;
        try {
            inputStream = connection.stream();
            return readStream(inputStream, length, abort);
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException ignored) {
                }
            }
        }
    }

    private static byte[] readStream(
            InputStream inputStream,
            int length,
            YandexVotAudioTransfer.AbortSignal abort
    ) throws YandexVotAudioTransfer.SourceReadException,
            YandexVotAudioTransfer.ReadAbortedException,
            IOException {
        byte[] out = new byte[length];
        int total = 0;
        while (total < length) {
            if (abort.shouldAbort()) {
                // Stop the active transfer now; the connection is closed by the caller.
                throw new YandexVotAudioTransfer.ReadAbortedException();
            }
            int read = inputStream.read(out, total, length - total);
            if (read == -1) break;
            if (read <= 0) continue;
            total += read;
        }
        if (total != length) {
            throw new YandexVotAudioTransfer.SourceReadException(
                    "Incomplete audio part: expected " + length + " bytes, got " + total);
        }
        return out;
    }

    private void closeWholeBody() {
        InputStream stream = wholeBodyStream;
        wholeBodyStream = null;
        if (stream != null) {
            try {
                stream.close();
            } catch (IOException ignored) {
            }
        }
        Connection connection = wholeBodyConnection;
        wholeBodyConnection = null;
        wholeBodyPosition = 0;
        if (connection != null) connection.close();
    }

    private static YandexVotHttpAudioPartReader.Connection openRealConnection(
            String url,
            long start,
            long end
    ) throws IOException {
        return openRealConnection(url, start, end, USER_AGENT);
    }

    private static YandexVotHttpAudioPartReader.Connection openRealConnection(
            String url,
            long start,
            long end,
            String userAgent
    ) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("Range", "bytes=" + start + "-" + end);
        connection.setRequestProperty("Accept", "*/*");
        connection.setRequestProperty("Accept-Encoding", "identity");
        connection.setRequestProperty("User-Agent", userAgent);
        connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
        connection.setReadTimeout(READ_TIMEOUT_MS);
        connection.setInstanceFollowRedirects(true);
        return new RealConnection(connection);
    }

    /** Wraps a connection opened by the player-media transport. */
    static Connection wrap(HttpURLConnection connection) {
        return new RealConnection(connection);
    }

    private static final class RealConnection implements Connection {
        private final HttpURLConnection connection;

        RealConnection(HttpURLConnection connection) {
            this.connection = connection;
        }

        @Override
        public int status() throws IOException {
            return connection.getResponseCode();
        }

        @Override
        public String header(String name) {
            return connection.getHeaderField(name);
        }

        @Override
        public long contentLength() {
            return connection.getContentLengthLong();
        }

        @Override
        public InputStream stream() throws IOException {
            return connection.getInputStream();
        }

        @Override
        public void close() {
            connection.disconnect();
        }
    }
}
