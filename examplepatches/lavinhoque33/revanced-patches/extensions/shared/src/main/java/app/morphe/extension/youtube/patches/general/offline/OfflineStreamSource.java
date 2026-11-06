/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-10-20.
 * Modified by lavinhoque33, 2026-10-24.
 */

package app.morphe.extension.youtube.patches.general.offline;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.res.AssetFileDescriptor;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.os.Build;
import android.os.SystemClock;

import androidx.annotation.Nullable;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.StreamingData;
import app.morphe.extension.shared.spoof.SpoofVideoStreamsPatch;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;

/**
 * Plays downloaded videos in YouTube's own player, so the watch page (comments, related videos,
 * SponsorBlock, player buttons) works for them.
 * <p>
 * The file is served to the player over HTTP on the loopback address, and the player response of
 * that video is given one progressive stream that points there. YouTube plays such a stream with
 * the platform {@code MediaPlayer}, which needs nothing more than the url and a mime type.
 * <p>
 * The watch page itself still needs the internet, so {@link #open} does nothing offline and the
 * caller falls back to the built-in player.
 * <p>
 * The hooks called from the patched app ({@link #streamingData}, {@link #isServing},
 * {@link #isActive}, {@link #onVideoTime}) must stay cheap and must not touch settings or the
 * offline index until a video was opened from here: the class is also reachable from YouTube Music.
 */
public final class OfflineStreamSource {
    /** A video opened from the library that YouTube has not asked streams for within this time is forgotten. */
    private static final long ARM_TIMEOUT_MS = 30_000;
    private static final long POSITION_SAVE_INTERVAL_MS = 5_000;
    /** Playback this close to the end counts as finished, like in the built-in player. */
    private static final long END_MARGIN_MS = 5_000;
    private static final int ITAG_MP4 = 18;
    private static final int ITAG_WEBM = 43;
    private static final Pattern FPS_IN_LABEL = Pattern.compile("p(\\d+)");

    /** Opened from the library, waiting for YouTube's player response. */
    @Nullable
    private static volatile String armedId;
    private static volatile long armedAt;
    /** Served to the player, until another video loads. */
    @Nullable
    private static volatile String servingId;
    private static volatile long lastPositionSave;

    private static final Map<String, StreamInfo> infos = new ConcurrentHashMap<>();

    private static final Object SERVER_LOCK = new Object();
    @Nullable
    private static ServerSocket server;
    /** Part of every url, so only the player that was given the url can read the files. */
    private static final String TOKEN = randomToken();

    private OfflineStreamSource() {
    }

    // region opening

    /**
     * Opens a download on the video page of YouTube's player.
     *
     * @return False if the video cannot be played that way, and the built-in player must be used:
     * the setting is off, the patch is missing, there is no internet, the file is unreadable, the
     * device cannot decode it, or it is an audio-only download (the video page needs a picture).
     */
    public static boolean open(@Nullable Context context, OfflineVideo video) {
        try {
            if (video.audioOnly) return false;
            if (!Settings.OFFLINE_USE_YOUTUBE_PLAYER.get() || !SpoofVideoStreamsPatch.isPatchIncluded()) return false;
            if (!Utils.isNetworkConnected()) {
                Logger.printDebug(() -> "No network, using the built-in player for " + video.videoId);
                return false;
            }
            if (context == null) context = Utils.getContext();
            StreamInfo info = infoFor(context, video);
            if (info == null) return false;

            Uri.Builder uri = Uri.parse("https://www.youtube.com/watch").buildUpon()
                    .appendQueryParameter("v", video.videoId);
            long resume = video.lastPositionMs;
            if (resume > 0 && (video.lengthMs <= 0 || resume < video.lengthMs - END_MARGIN_MS)) {
                uri.appendQueryParameter("t", (resume / 1000) + "s");
            }

            armedId = video.videoId;
            armedAt = SystemClock.elapsedRealtime();
            Intent intent = new Intent(Intent.ACTION_VIEW, uri.build()).setPackage(context.getPackageName());
            if (!(context instanceof android.app.Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
            Logger.printInfo(() -> "Opening " + video.videoId + " in the YouTube player (" + info.mimeType + ")");
            return true;
        } catch (Exception ex) {
            armedId = null;
            Logger.printException(() -> "Could not open " + video.videoId + " in the YouTube player", ex);
            return false;
        }
    }

    // endregion

    // region hooks called from the patched app

    /**
     * @return True while a download is waiting for, or being served to, YouTube's player, so the
     * player response is replaced even when stream spoofing is off.
     */
    public static boolean isActive() {
        return servingId != null || isArmed();
    }

    /** @return True if YouTube's player plays the file of this video. */
    public static boolean isServing(String videoId) {
        return videoId.equals(servingId);
    }

    public static boolean isServingAny() {
        return servingId != null;
    }

    private static boolean isArmed() {
        return armedId != null && SystemClock.elapsedRealtime() - armedAt < ARM_TIMEOUT_MS;
    }

    /**
     * Injection point of the spoof hook, with the id of the video whose player response is built.
     *
     * @return A serialized player response that holds only the stream of the downloaded file, or
     * null to leave the response as it is.
     */
    @Nullable
    public static byte[] streamingData(String videoId) {
        try {
            if (videoId.equals(armedId) && isArmed()) {
                armedId = null;
                servingId = videoId;
                lastPositionSave = SystemClock.elapsedRealtime();
            } else if (!videoId.equals(servingId)) {
                return null;
            }

            OfflineVideo video = OfflineIndex.get(videoId);
            StreamInfo info = video == null ? null : infoFor(Utils.getContext(), video);
            if (video == null || info == null) {
                servingId = null;
                return null;
            }

            final int port = ensureServer();
            Format.Builder format = Format.newBuilder()
                    .setItag(info.itag)
                    .setMimeType(info.mimeType)
                    .setUrl("http://127.0.0.1:" + port + "/" + TOKEN + "/" + videoId)
                    .setContentLength(video.sizeBytes)
                    .setApproxDurationMs(info.durationMs)
                    .setBitrate(info.bitrate)
                    .setAverageBitrate(info.bitrate)
                    .setWidth(info.width)
                    .setHeight(info.height)
                    .setFps(info.fps)
                    .setQualityLabel(video.qualityLabel);
            Logger.printInfo(() -> "Serving " + videoId + " to the YouTube player on port " + port);

            return PlayerResponse.newBuilder()
                    .setStreamingData(StreamingData.newBuilder().addFormats(format))
                    .build().toByteArray();
        } catch (Exception ex) {
            servingId = null;
            Logger.printException(() -> "Could not serve " + videoId, ex);
            return null;
        }
    }

    /**
     * Injection point, from {@code VideoInformation.setVideoTime}, every 100 ms on the main thread.
     * Keeps the resume position of a download that YouTube's player plays.
     */
    public static void onVideoTime(String videoId, long timeMs) {
        final String serving = servingId;
        if (serving == null || !serving.equals(videoId)) return;
        final long now = SystemClock.elapsedRealtime();
        if (now - lastPositionSave < POSITION_SAVE_INTERVAL_MS) return;
        lastPositionSave = now;

        Utils.runOnBackgroundThread(() -> {
            OfflineVideo video = OfflineIndex.get(serving);
            if (video == null) return;
            long position = video.lengthMs > 0 && timeMs >= video.lengthMs - END_MARGIN_MS ? 0 : timeMs;
            video.lastPositionMs = position;
            OfflineIndex.savePosition(serving, position);
        });
    }

    /**
     * Injection point, from {@code VideoInformation.setVideoInformation}, when a video starts
     * loading in the player. Another video ends the playback of the downloaded file.
     */
    public static void onVideoLoaded(String videoId) {
        final String serving = servingId;
        if (serving != null && !serving.equals(videoId)) {
            Logger.printDebug(() -> "Stopped serving " + serving + ", " + videoId + " loads");
            servingId = null;
        }
    }

    // endregion

    // region stream description

    private record StreamInfo(int itag, String mimeType, int width, int height, int fps, int bitrate,
                              long durationMs, long sizeBytes) {
    }

    /** @return The description of the download, or null if YouTube's player cannot be given it. */
    @Nullable
    private static StreamInfo infoFor(Context context, OfflineVideo video) {
        StreamInfo cached = infos.get(video.videoId);
        if (cached != null && cached.sizeBytes == video.sizeBytes) return cached;

        final boolean webm = video.displayName.toLowerCase(Locale.ROOT).endsWith(".webm");
        final Uri uri = Uri.parse(video.contentUri);
        final ContentResolver resolver = context.getContentResolver();

        int width;
        int height;
        int fps = 0;
        long durationMs = video.lengthMs;
        try (MediaMetadataRetriever retriever = new MediaMetadataRetriever()) {
            retriever.setDataSource(context, uri);
            width = parseInt(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_WIDTH));
            height = parseInt(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_HEIGHT));
            long retrieved = parseInt(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION));
            if (retrieved > 0) durationMs = retrieved;
            if (Build.VERSION.SDK_INT >= 28 && durationMs > 0) {
                int frames = parseInt(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_FRAME_COUNT));
                if (frames > 0) fps = (int) Math.round(frames * 1000.0 / durationMs);
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not read " + video.videoId + ": " + ex);
            return null;
        }
        if (width <= 0 || height <= 0 || durationMs <= 0) return null;
        if (fps <= 0) {
            Matcher matcher = FPS_IN_LABEL.matcher(video.qualityLabel);
            fps = matcher.find() ? parseInt(matcher.group(1)) : 30;
        }

        String mimeType;
        if (webm) {
            if (!OfflineFormats.canDecodeVp9(width, height, fps)) return null;
            mimeType = "video/webm; codecs=\"vp9, opus\"";
        } else {
            String videoCodec;
            try (AssetFileDescriptor afd = resolver.openAssetFileDescriptor(uri, "r");
                 FileInputStream in = new FileInputStream(afd.getFileDescriptor())) {
                long length = afd.getLength() >= 0 ? afd.getLength() : video.sizeBytes;
                videoCodec = OfflineCodecs.mp4VideoCodec(in.getChannel(), afd.getStartOffset(), length);
            } catch (IOException | RuntimeException ex) {
                Logger.printInfo(() -> "Could not read the codec of " + video.videoId + ": " + ex);
                return null;
            }
            if (videoCodec == null) return null;
            if (videoCodec.startsWith("av01") && !OfflineFormats.canDecodeAv1(width, height, fps,
                    "video/mp4; codecs=\"" + videoCodec + "\"")) {
                return null;
            }
            mimeType = "video/mp4; codecs=\"" + videoCodec + ", mp4a.40.2\"";
        }

        int bitrate = (int) Math.min(Integer.MAX_VALUE, video.sizeBytes * 8000 / durationMs);
        StreamInfo info = new StreamInfo(webm ? ITAG_WEBM : ITAG_MP4, mimeType, width, height, fps,
                bitrate, durationMs, video.sizeBytes);
        infos.put(video.videoId, info);
        return info;
    }

    private static int parseInt(@Nullable String value) {
        if (value == null) return 0;
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException ex) {
            return 0;
        }
    }

    // endregion

    // region server

    private static int ensureServer() throws IOException {
        synchronized (SERVER_LOCK) {
            if (server == null || server.isClosed()) {
                // The address is spelled out: the loopback address of the JVM can be ::1, which
                // the player cannot reach through a 127.0.0.1 url.
                final ServerSocket socket = new ServerSocket(0, 16, InetAddress.getByAddress(new byte[]{127, 0, 0, 1}));
                server = socket;
                Thread acceptor = new Thread(() -> acceptLoop(socket), "rvx-offline-stream-server");
                acceptor.setDaemon(true);
                acceptor.start();
                Logger.printInfo(() -> "Offline stream server on port " + socket.getLocalPort());
            }
            return server.getLocalPort();
        }
    }

    private static void acceptLoop(ServerSocket socket) {
        while (!socket.isClosed()) {
            try {
                final Socket connection = socket.accept();
                Thread worker = new Thread(() -> serve(connection), "rvx-offline-stream-connection");
                worker.setDaemon(true);
                worker.start();
            } catch (IOException ex) {
                if (!socket.isClosed()) Logger.printInfo(() -> "Offline stream server stopped: " + ex);
                return;
            }
        }
    }

    private static void serve(Socket socket) {
        try (socket) {
            socket.setSoTimeout(60_000);
            BufferedReader in = new BufferedReader(
                    new InputStreamReader(socket.getInputStream(), StandardCharsets.ISO_8859_1));
            OutputStream out = socket.getOutputStream();
            // The player keeps the connection and sends one request after the other.
            while (serveRequest(in, out)) {
                out.flush();
            }
        } catch (IOException ex) {
            // The player closes connections when it seeks.
            Logger.printDebug(() -> "Offline stream connection ended: " + ex);
        } catch (RuntimeException ex) {
            Logger.printException(() -> "Offline stream connection failed", ex);
        }
    }

    /** @return True if the connection can take another request. */
    private static boolean serveRequest(BufferedReader in, OutputStream out) throws IOException {
        String requestLine = in.readLine();
        if (requestLine == null) return false;
        String range = null;
        boolean close = false;
        for (String line = in.readLine(); line != null && !line.isEmpty(); line = in.readLine()) {
            if (line.regionMatches(true, 0, "range:", 0, 6)) range = line.substring(6).trim();
            else if (line.regionMatches(true, 0, "connection:", 0, 11)) close = line.toLowerCase(Locale.ROOT).contains("close");
        }

        String[] parts = requestLine.split(" ");
        if (parts.length < 2 || (!"GET".equals(parts[0]) && !"HEAD".equals(parts[0]))) {
            writeStatus(out, "405 Method Not Allowed");
            return false;
        }
        String path = parts[1];
        int query = path.indexOf('?');
        if (query >= 0) path = path.substring(0, query);
        String[] segments = path.split("/");
        // "", token, video id
        if (segments.length != 3 || !TOKEN.equals(segments[1])) {
            writeStatus(out, "404 Not Found");
            return false;
        }
        OfflineVideo video = OfflineIndex.get(segments[2]);
        if (video == null) {
            writeStatus(out, "404 Not Found");
            return false;
        }

        final Context context = Utils.getContext();
        try (AssetFileDescriptor afd = context.getContentResolver().openAssetFileDescriptor(Uri.parse(video.contentUri), "r");
             FileInputStream file = new FileInputStream(afd.getFileDescriptor())) {
            final long total = afd.getLength() >= 0 ? afd.getLength() : video.sizeBytes;
            long start = 0;
            long end = total - 1;
            boolean partial = false;
            if (range != null && range.startsWith("bytes=")) {
                String[] bounds = range.substring(6).split(",")[0].trim().split("-", 2);
                try {
                    if (bounds[0].isEmpty()) {
                        // A suffix: the last bytes of the file.
                        start = Math.max(0, total - Long.parseLong(bounds[1]));
                    } else {
                        start = Long.parseLong(bounds[0]);
                        if (bounds.length > 1 && !bounds[1].isEmpty()) end = Math.min(end, Long.parseLong(bounds[1]));
                    }
                } catch (NumberFormatException | ArrayIndexOutOfBoundsException ex) {
                    writeStatus(out, "400 Bad Request");
                    return false;
                }
                if (start > end || start >= total) {
                    out.write(("HTTP/1.1 416 Range Not Satisfiable\r\nContent-Range: bytes */" + total
                            + "\r\nContent-Length: 0\r\n\r\n").getBytes(StandardCharsets.ISO_8859_1));
                    return !close;
                }
                partial = true;
            }

            final long length = end - start + 1;
            String header = (partial ? "HTTP/1.1 206 Partial Content\r\n" : "HTTP/1.1 200 OK\r\n")
                    + "Content-Type: " + OfflineMediaStore.mimeType(video.displayName) + "\r\n"
                    + "Accept-Ranges: bytes\r\n"
                    + "Content-Length: " + length + "\r\n"
                    + (partial ? "Content-Range: bytes " + start + "-" + end + "/" + total + "\r\n" : "")
                    + (close ? "Connection: close\r\n" : "")
                    + "\r\n";
            out.write(header.getBytes(StandardCharsets.ISO_8859_1));

            if ("GET".equals(parts[0])) {
                FileChannel channel = file.getChannel();
                ByteBuffer buffer = ByteBuffer.allocate(256 * 1024);
                long position = afd.getStartOffset() + start;
                long left = length;
                while (left > 0) {
                    buffer.clear();
                    buffer.limit((int) Math.min(buffer.capacity(), left));
                    int read = channel.read(buffer, position);
                    if (read <= 0) return false; // The file is shorter than the index says.
                    out.write(buffer.array(), 0, read);
                    position += read;
                    left -= read;
                }
            }
        } catch (IOException ex) {
            throw ex;
        } catch (RuntimeException ex) {
            Logger.printInfo(() -> "Could not read " + video.videoId + ": " + ex);
            writeStatus(out, "500 Internal Server Error");
            return false;
        }
        return !close;
    }

    private static void writeStatus(OutputStream out, String status) throws IOException {
        out.write(("HTTP/1.1 " + status + "\r\nContent-Length: 0\r\nConnection: close\r\n\r\n")
                .getBytes(StandardCharsets.ISO_8859_1));
    }

    private static String randomToken() {
        byte[] bytes = new byte[12];
        new SecureRandom().nextBytes(bytes);
        StringBuilder token = new StringBuilder();
        for (byte b : bytes) token.append(String.format(Locale.ROOT, "%02x", b));
        return token.toString();
    }

    // endregion
}
