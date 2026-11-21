/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.newx.misc;

import android.content.Context;
import android.os.SystemClock;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.crimera.downloader.engine.DownloadLog;
import app.morphe.extension.crimera.downloader.engine.Reservation;
import app.morphe.extension.crimera.downloader.engine.TransferObserver;
import app.morphe.extension.crimera.downloader.engine.TransferOutcome;
import app.morphe.extension.crimera.downloader.engine.TransferRunner;
import app.morphe.extension.crimera.downloader.model.DownloadRequest;

/**
 * Assembles an HLS stream into the reserved document, segment by segment.
 *
 * <p>Broadcast replays have no progressive file: the request URL is a playlist. The transfer
 * fetches the playlist, picks the highest-bandwidth rendition of a master playlist, then
 * appends every media segment in order, which for MPEG-TS segments is already a playable
 * file. Fragmented MP4 (EXT-X-MAP) and encrypted playlists are refused rather than saved
 * into a file that would not play. A failed segment is retried a few times in place; the
 * transfer never resumes across engine retries, so a retry starts the stream over.
 */
final class HlsTransfer implements TransferRunner {
    private static final int CONNECT_TIMEOUT_MS = 15_000;
    // Matches HttpTransfer: a per-read stall budget, not a total deadline.
    private static final int READ_TIMEOUT_MS = 60_000;
    private static final int MAX_ATTEMPTS = 3;
    private static final long[] RETRY_DELAYS_MS = {0, 2_000, 5_000};
    /** Playlists are small; anything larger is not a playlist this transfer should read. */
    private static final int MAX_PLAYLIST_BYTES = 4 * 1024 * 1024;
    private static final String USER_AGENT =
            "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Mobile Safari/537.36";

    /** Cancel flags per in-flight transfer, keyed by download id. */
    private static final ConcurrentHashMap<Integer, AtomicBoolean> CANCEL_FLAGS =
            new ConcurrentHashMap<>();
    /** Live connections per in-flight transfer, so cancel unblocks a stalled read. */
    private static final ConcurrentHashMap<Integer, HttpURLConnection> ACTIVE_CONNECTIONS =
            new ConcurrentHashMap<>();

    private final DownloadLog log;

    HlsTransfer() {
        this(DownloadLog.NOOP);
    }

    HlsTransfer(DownloadLog log) {
        this.log = log != null ? log : DownloadLog.NOOP;
    }

    @Override
    public TransferOutcome run(
            Context context,
            Reservation reservation,
            DownloadRequest request,
            int id,
            TransferObserver observer
    ) {
        if (id > 0) {
            CANCEL_FLAGS.putIfAbsent(id, new AtomicBoolean(false));
        }
        try {
            if (isCancelled(id)) return TransferOutcome.cancelled();
            observer.onTransferring();
            assemble(context, reservation, request.url(), id, observer);
            if (isCancelled(id)) return TransferOutcome.cancelled();
            return TransferOutcome.saved();
        } catch (IOException | RuntimeException exception) {
            if (isCancelled(id)) return TransferOutcome.cancelled();
            log.error(() -> "Failed HLS download " + downloadLabel(id), exception);
            return TransferOutcome.failed(exception);
        } finally {
            if (id > 0) {
                CANCEL_FLAGS.remove(id);
                ACTIVE_CONNECTIONS.remove(id);
            }
        }
    }

    @Override
    public void cancel(int id) {
        if (id <= 0) return;
        AtomicBoolean flag = CANCEL_FLAGS.computeIfAbsent(id, k -> new AtomicBoolean(false));
        flag.set(true);
        HttpURLConnection connection = ACTIVE_CONNECTIONS.get(id);
        if (connection != null) {
            try {
                connection.disconnect();
            } catch (RuntimeException ignored) {
            }
        }
    }

    private void assemble(
            Context context,
            Reservation reservation,
            String playlistUrl,
            int id,
            TransferObserver observer
    ) throws IOException {
        String mediaUrl = playlistUrl;
        String mediaText = fetchPlaylist(playlistUrl, id);
        if (HlsPlaylist.isMaster(mediaText)) {
            HlsPlaylist.Rendition best =
                    HlsPlaylist.bestRendition(HlsPlaylist.parseMaster(mediaText, playlistUrl));
            if (best == null) {
                throw new IOException("HLS master playlist has no renditions: " + playlistUrl);
            }
            mediaUrl = best.url;
            mediaText = fetchPlaylist(mediaUrl, id);
            if (HlsPlaylist.isMaster(mediaText)) {
                throw new IOException("Nested HLS master playlist: " + mediaUrl);
            }
        }

        HlsPlaylist.Media media = HlsPlaylist.parseMedia(mediaText, mediaUrl);
        if (media.segmentUrls.isEmpty()) {
            throw new IOException("HLS media playlist has no segments: " + mediaUrl);
        }
        if (media.hasInitSegment) {
            throw new IOException("Fragmented MP4 HLS is not supported: " + mediaUrl);
        }
        if (media.encrypted) {
            throw new IOException("Encrypted HLS is not supported: " + mediaUrl);
        }

        List<String> segments = media.segmentUrls;
        log.info(() -> "HLS download " + downloadLabel(id) + " segments=" + segments.size()
                + " durationSeconds=" + Math.round(media.totalDurationSeconds)
                + " endList=" + media.hasEndList);

        OutputStream output = context.getContentResolver()
                .openOutputStream(reservation.documentUri(), "wt");
        if (output == null) throw new IOException("Could not open " + reservation.fileName());

        long total = 0;
        long lastUpdate = SystemClock.elapsedRealtime();
        try (OutputStream body = output) {
            byte[] buffer = new byte[64 * 1024];
            for (String segmentUrl : segments) {
                if (isCancelled(id)) return;
                total += copySegment(segmentUrl, body, buffer, id);

                long now = SystemClock.elapsedRealtime();
                if (now - lastUpdate > 200) {
                    // Segment sizes vary and no byte total is known up front.
                    observer.onProgress(total, -1);
                    lastUpdate = now;
                }
            }
            body.flush();
        }
        if (total == 0) {
            throw new IOException("HLS download produced no bytes: " + mediaUrl);
        }
        observer.onProgress(total, -1);
        final long completedBytes = total;
        log.info(() -> "HLS download " + downloadLabel(id) + " complete bytes=" + completedBytes);
    }

    /** Fetches one playlist with the same bounded retries as a segment. */
    private String fetchPlaylist(String url, int id) throws IOException {
        byte[] bytes = fetchBytes(url, id, MAX_PLAYLIST_BYTES);
        String text = new String(bytes, StandardCharsets.UTF_8);
        if (!HlsPlaylist.isPlaylist(text)) {
            throw new IOException("Not an HLS playlist: " + url);
        }
        return text;
    }

    /** Copies one segment into the output, retrying transient failures in place. */
    private long copySegment(String url, OutputStream output, byte[] buffer, int id)
            throws IOException {
        IOException failure = null;
        for (int attempt = 0; attempt < MAX_ATTEMPTS; attempt++) {
            if (!waitBeforeRetry(RETRY_DELAYS_MS[attempt], id)) {
                throw new IOException("HLS download cancelled");
            }
            HttpURLConnection connection = null;
            try {
                connection = openConnection(url, id);
                long written = 0;
                try (InputStream input = new BufferedInputStream(connection.getInputStream())) {
                    int read;
                    while ((read = input.read(buffer)) != -1) {
                        if (isCancelled(id)) throw new IOException("HLS download cancelled");
                        output.write(buffer, 0, read);
                        written += read;
                    }
                }
                return written;
            } catch (IOException exception) {
                if (isCancelled(id)) throw exception;
                failure = exception;
            } finally {
                untrackConnection(id, connection);
                if (connection != null) {
                    try {
                        connection.disconnect();
                    } catch (RuntimeException ignored) {
                    }
                }
            }
        }
        throw failure != null ? failure : new IOException("Failed HLS segment: " + url);
    }

    /** Reads a whole (small) response body with the same bounded retries as a segment. */
    private byte[] fetchBytes(String url, int id, int maxBytes) throws IOException {
        IOException failure = null;
        for (int attempt = 0; attempt < MAX_ATTEMPTS; attempt++) {
            if (!waitBeforeRetry(RETRY_DELAYS_MS[attempt], id)) {
                throw new IOException("HLS download cancelled");
            }
            HttpURLConnection connection = null;
            try {
                connection = openConnection(url, id);
                ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                byte[] buffer = new byte[16 * 1024];
                try (InputStream input = new BufferedInputStream(connection.getInputStream())) {
                    int read;
                    while ((read = input.read(buffer)) != -1) {
                        if (isCancelled(id)) throw new IOException("HLS download cancelled");
                        bytes.write(buffer, 0, read);
                        if (bytes.size() > maxBytes) {
                            throw new IOException("HLS playlist is too large: " + url);
                        }
                    }
                }
                return bytes.toByteArray();
            } catch (IOException exception) {
                if (isCancelled(id)) throw exception;
                failure = exception;
            } finally {
                untrackConnection(id, connection);
                if (connection != null) {
                    try {
                        connection.disconnect();
                    } catch (RuntimeException ignored) {
                    }
                }
            }
        }
        throw failure != null ? failure : new IOException("Failed HLS fetch: " + url);
    }

    /** Sleeps in slices so a cancel lands promptly; false when cancelled while waiting. */
    private boolean waitBeforeRetry(long delayMillis, int id) {
        long remaining = delayMillis;
        while (remaining > 0) {
            if (isCancelled(id)) return false;
            long slice = Math.min(remaining, 250);
            try {
                Thread.sleep(slice);
            } catch (InterruptedException exception) {
                Thread.currentThread().interrupt();
                return false;
            }
            remaining -= slice;
        }
        return !isCancelled(id);
    }

    private HttpURLConnection openConnection(String address, int id) throws IOException {
        URLConnection connection = new URL(address).openConnection();
        if (!(connection instanceof HttpURLConnection)) {
            throw new IOException("Unsupported HLS URL " + address);
        }
        HttpURLConnection httpConnection = (HttpURLConnection) connection;
        httpConnection.setInstanceFollowRedirects(true);
        httpConnection.setConnectTimeout(CONNECT_TIMEOUT_MS);
        httpConnection.setReadTimeout(READ_TIMEOUT_MS);
        httpConnection.setRequestProperty("User-Agent", USER_AGENT);
        httpConnection.connect();
        int status = httpConnection.getResponseCode();
        if (status < 200 || status >= 300) {
            httpConnection.disconnect();
            throw new IOException("HTTP " + status + " for " + address);
        }
        trackConnection(id, httpConnection);
        return httpConnection;
    }

    private static boolean isCancelled(int id) {
        if (id <= 0) return false;
        AtomicBoolean flag = CANCEL_FLAGS.get(id);
        return flag != null && flag.get();
    }

    private static void trackConnection(int id, HttpURLConnection connection) {
        if (id > 0 && connection != null) {
            ACTIVE_CONNECTIONS.put(id, connection);
        }
    }

    private static void untrackConnection(int id, HttpURLConnection connection) {
        if (id > 0 && connection != null) {
            ACTIVE_CONNECTIONS.remove(id, connection);
        }
    }

    private static String downloadLabel(int id) {
        return id > 0 ? "#" + id : "(untracked)";
    }
}
