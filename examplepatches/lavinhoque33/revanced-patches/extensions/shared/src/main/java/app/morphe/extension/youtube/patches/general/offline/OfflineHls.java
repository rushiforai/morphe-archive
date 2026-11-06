/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-10-24.
 */

package app.morphe.extension.youtube.patches.general.offline;

import androidx.annotation.Nullable;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.spoof.ClientType;
import app.morphe.extension.shared.spoof.requests.StreamOrDetailsDataRequest;
import app.morphe.extension.shared.utils.Logger;

/**
 * The 1080p Premium stream (itag 616, an enhanced-bitrate VP9 encode) and the HLS playlists it is
 * served with.
 * <p>
 * Measured on 2026-10-24: of the fork's clients only visionOS answers with an HLS master playlist
 * that lists itag 616, and its segments download without a Premium account or a PoToken. The DASH
 * answers of every client the fork has (TV, Android, Android VR/XR, visionOS) have no Premium
 * format for signed-out users. The rendition is fragmented MP4 (an init segment and media
 * segments) without audio; its audio group is packed AAC (ADTS), so the Opus DASH stream is used
 * instead and the video is saved as WebM, like the other VP9 downloads.
 */
final class OfflineHls {
    private static final ClientType[] PREMIUM_CLIENTS = {ClientType.VISIONOS_1_03, ClientType.VISIONOS_1_02};
    private static final int PREMIUM_ITAG = 616;
    private static final Pattern ITAG_IN_URL = Pattern.compile("/itag/(\\d+)/");
    private static final Pattern ATTRIBUTE = Pattern.compile("([A-Z0-9-]+)=(\"[^\"]*\"|[^,]*)");
    /** The init segment url names the size of the underlying file: {@code sgovp/clen%3D152418061%3B...}. */
    private static final Pattern CONTENT_LENGTH = Pattern.compile("clen%3D(\\d+)");
    private static final int TIMEOUT_MS = 15_000;
    private static final int MAX_PLAYLIST_BYTES = 4 * 1024 * 1024;

    private OfflineHls() {
    }

    /** The Premium stream and the user agent its urls have to be requested with. */
    record Premium(OfflineFormats.Stream stream, String userAgent) {
    }

    /** A piece of a rendition. {@code length} is -1 for a whole resource, else a byte range. */
    record Segment(String url, long offset, long length) {
    }

    /** @param segments The init segment (if the rendition has one) first, then the media segments. */
    record MediaPlaylist(List<Segment> segments) {
    }

    // region premium stream

    /**
     * Asks the clients that serve HLS for the master playlist and picks the Premium rendition.
     *
     * @return Null if no client lists it, which is the normal case for most videos.
     */
    @Nullable
    static Premium fetchPremium(String videoId, Map<String, String> headers) {
        for (ClientType client : PREMIUM_CLIENTS) {
            try {
                String masterUrl = fetchMasterUrl(videoId, client, headers);
                if (masterUrl == null) continue;

                OfflineFormats.Stream stream = premiumRendition(fetchText(masterUrl, client.userAgent),
                        masterUrl, client.userAgent);
                Logger.printInfo(() -> "HLS master of " + videoId + " from " + client.name() + ": "
                        + (stream == null ? "no Premium stream" : "Premium itag " + stream.itag()));
                // The master playlists of these clients list the same renditions; asking again does not help.
                return stream == null ? null : new Premium(stream, client.userAgent);
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not read the HLS streams of " + videoId + " with " + client.name(), ex);
            }
        }
        return null;
    }

    @Nullable
    private static String fetchMasterUrl(String videoId, ClientType client, Map<String, String> headers)
            throws IOException {
        StreamOrDetailsDataRequest.StreamData data =
                StreamOrDetailsDataRequest.fetchDownloadStream(videoId, client, headers);
        if (data == null) return null;
        String url = PlayerResponse.parseFrom(data.streamingData()).getStreamingData().getHlsManifestUrl();
        return url.isEmpty() ? null : url;
    }

    /** @return The Premium VP9 rendition of the master playlist, or null if it has none this device can save. */
    @Nullable
    private static OfflineFormats.Stream premiumRendition(String master, String masterUrl, String userAgent)
            throws IOException {
        String[] lines = master.split("\n");
        for (int i = 1; i < lines.length; i++) {
            String uri = lines[i].trim();
            String info = lines[i - 1].trim();
            if (uri.startsWith("#") || !info.startsWith("#EXT-X-STREAM-INF:")) continue;
            if (itagOf(uri) != PREMIUM_ITAG) continue;
            return premiumStream(attributes(info), resolve(masterUrl, uri), userAgent);
        }
        return null;
    }

    @Nullable
    private static OfflineFormats.Stream premiumStream(Map<String, String> attributes, String mediaUrl,
                                                       String userAgent) throws IOException {
        String codecs = attributes.getOrDefault("CODECS", "");
        if (!codecs.startsWith("vp09.00")) {
            // Only 8-bit VP9 goes the WebM way. Anything else would need another container path.
            Logger.printInfo(() -> "Skipping the Premium stream with codecs " + codecs);
            return null;
        }
        int[] size = parseResolution(attributes.getOrDefault("RESOLUTION", ""));
        if (size == null) return null;
        final int labelHeight = Math.min(size[0], size[1]);
        final int fps = (int) Math.round(parseDouble(attributes.getOrDefault("FRAME-RATE", "30"), 30));
        final int bandwidth = (int) parseDouble(attributes.getOrDefault("BANDWIDTH", "0"), 0);

        MediaPlaylist playlist = fetchMediaPlaylist(mediaUrl, userAgent);
        final long length = playlist.segments().isEmpty() ? -1 : contentLengthOf(playlist.segments().get(0));
        final String videoCodec = codecs.split(",")[0];
        return new OfflineFormats.Stream(mediaUrl, PREMIUM_ITAG, "video/mp4; codecs=\"" + videoCodec + "\"",
                length, labelHeight, fps, OfflineFormats.CODEC_VP9, bandwidth,
                OfflineFormats.canDecodeVp9(size[0], size[1], fps), true, true);
    }

    private static int itagOf(String url) {
        Matcher matcher = ITAG_IN_URL.matcher(url);
        return matcher.find() ? Integer.parseInt(matcher.group(1)) : -1;
    }

    /** Approximate: the size of the file the segments are cut from. The progress bar copes with that. */
    private static long contentLengthOf(Segment segment) {
        Matcher matcher = CONTENT_LENGTH.matcher(segment.url());
        return matcher.find() ? Long.parseLong(matcher.group(1)) : -1;
    }

    // endregion

    // region playlists

    static MediaPlaylist fetchMediaPlaylist(String url, @Nullable String userAgent) throws IOException {
        return parseMediaPlaylist(fetchText(url, userAgent), url);
    }

    /**
     * Supports what YouTube's VOD playlists use: {@code EXT-X-MAP} (with an optional byte range),
     * {@code EXT-X-BYTERANGE} and relative urls. Encrypted playlists are refused.
     */
    static MediaPlaylist parseMediaPlaylist(String text, String playlistUrl) throws IOException {
        List<Segment> segments = new ArrayList<>();
        long[] range = null;
        long nextOffset = 0;
        for (String raw : text.split("\n")) {
            String line = raw.trim();
            if (line.isEmpty()) continue;
            if (line.startsWith("#EXT-X-KEY:") && !line.contains("METHOD=NONE")) {
                throw new IOException("Encrypted HLS stream");
            } else if (line.startsWith("#EXT-X-MAP:")) {
                // A second init segment (a discontinuity) cannot be joined into one file.
                if (!segments.isEmpty()) throw new IOException("HLS init segment after media segments");
                Map<String, String> attributes = attributes(line);
                long[] mapRange = parseByteRange(attributes.get("BYTERANGE"), 0);
                segments.add(segment(resolve(playlistUrl, attributes.get("URI")), mapRange));
            } else if (line.startsWith("#EXT-X-BYTERANGE:")) {
                range = parseByteRange(line.substring("#EXT-X-BYTERANGE:".length()), nextOffset);
            } else if (!line.startsWith("#")) {
                segments.add(segment(resolve(playlistUrl, line), range));
                nextOffset = range == null ? 0 : range[0] + range[1];
                range = null;
            }
        }
        if (segments.isEmpty()) throw new IOException("HLS playlist without segments");
        return new MediaPlaylist(segments);
    }

    private static Segment segment(String url, @Nullable long[] range) {
        return range == null ? new Segment(url, 0, -1) : new Segment(url, range[0], range[1]);
    }

    /** {@code length[@offset]}. @return {@code {offset, length}}, or null without a range. */
    @Nullable
    private static long[] parseByteRange(@Nullable String value, long defaultOffset) throws IOException {
        if (value == null || value.isEmpty()) return null;
        try {
            String[] parts = value.split("@");
            long length = Long.parseLong(parts[0].trim());
            long offset = parts.length > 1 ? Long.parseLong(parts[1].trim()) : defaultOffset;
            return new long[]{offset, length};
        } catch (NumberFormatException ex) {
            throw new IOException("Invalid byte range " + value, ex);
        }
    }

    private static Map<String, String> attributes(String tagLine) {
        Map<String, String> attributes = new HashMap<>();
        Matcher matcher = ATTRIBUTE.matcher(tagLine.substring(tagLine.indexOf(':') + 1));
        while (matcher.find()) {
            String value = matcher.group(2);
            if (value.startsWith("\"")) value = value.substring(1, value.length() - 1);
            attributes.put(matcher.group(1), value);
        }
        return attributes;
    }

    @Nullable
    private static int[] parseResolution(String value) {
        String[] parts = value.split("x");
        if (parts.length != 2) return null;
        try {
            return new int[]{Integer.parseInt(parts[0]), Integer.parseInt(parts[1])};
        } catch (NumberFormatException ex) {
            return null;
        }
    }

    private static double parseDouble(String value, double fallback) {
        try {
            return Double.parseDouble(value);
        } catch (NumberFormatException ex) {
            return fallback;
        }
    }

    private static String resolve(String base, @Nullable String reference) throws IOException {
        if (reference == null || reference.isEmpty()) throw new IOException("HLS entry without url");
        return new URL(new URL(base), reference).toString();
    }

    private static String fetchText(String url, @Nullable String userAgent) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        try {
            connection.setConnectTimeout(TIMEOUT_MS);
            connection.setReadTimeout(TIMEOUT_MS);
            if (userAgent != null) connection.setRequestProperty("User-Agent", userAgent);
            int code = connection.getResponseCode();
            if (code == HttpURLConnection.HTTP_FORBIDDEN) throw new OfflineDownloader.ForbiddenException();
            if (code != HttpURLConnection.HTTP_OK) throw new IOException("HLS playlist returned HTTP " + code);
            try (InputStream input = connection.getInputStream()) {
                return readText(input);
            }
        } finally {
            connection.disconnect();
        }
    }

    private static String readText(InputStream input) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        byte[] buffer = new byte[16 * 1024];
        int read;
        while ((read = input.read(buffer)) != -1) {
            bytes.write(buffer, 0, read);
            if (bytes.size() > MAX_PLAYLIST_BYTES) throw new IOException("HLS playlist too large");
        }
        return bytes.toString(StandardCharsets.UTF_8.name());
    }

    // endregion
}
