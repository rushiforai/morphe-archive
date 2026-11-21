/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.newx.misc;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Minimal HLS playlist reading (RFC 8216) for media that has no progressive file.
 *
 * <p>Broadcast replays expose a single variant whose URL is a playlist instead of an mp4.
 * This class only parses playlist text and resolves the URIs inside it; {@link HlsTransfer}
 * performs the actual download. It stays free of Android types so the parsing rules can be
 * unit tested directly.
 */
final class HlsPlaylist {
    private HlsPlaylist() {
    }

    /** True when the URL path (before any query or fragment) names an HLS playlist. */
    static boolean isHlsUrl(String url) {
        if (url == null) return false;

        int end = url.length();
        int query = url.indexOf('?');
        if (query >= 0) end = query;
        int fragment = url.indexOf('#');
        if (fragment >= 0 && fragment < end) end = fragment;
        return url.substring(0, end).toLowerCase(Locale.ROOT).endsWith(".m3u8");
    }

    /** True when a media variant is an HLS playlist rather than a progressive file. */
    static boolean isHlsVariant(String url, String contentType) {
        if (url == null) return false;
        if (contentType != null
                && (contentType.equalsIgnoreCase("application/x-mpegURL")
                || contentType.equalsIgnoreCase("application/vnd.apple.mpegurl"))) {
            return true;
        }
        return isHlsUrl(url);
    }

    static boolean isPlaylist(String text) {
        return text != null && text.trim().startsWith("#EXTM3U");
    }

    static boolean isMaster(String text) {
        return text != null && text.contains("#EXT-X-STREAM-INF");
    }

    /** One variant stream of a master playlist, with its URI already resolved. */
    static final class Rendition {
        final long bandwidth;
        final String resolution;
        final String url;

        Rendition(long bandwidth, String resolution, String url) {
            this.bandwidth = bandwidth;
            this.resolution = resolution;
            this.url = url;
        }
    }

    /** The segments of a media playlist, with every URI already resolved. */
    static final class Media {
        final List<String> segmentUrls;
        /** An EXT-X-MAP init segment means fragmented MP4, which is not assembled here. */
        final boolean hasInitSegment;
        /** EXT-X-KEY with a method other than NONE; encrypted segments are not assembled. */
        final boolean encrypted;
        final boolean hasEndList;
        final double totalDurationSeconds;

        Media(
                List<String> segmentUrls,
                boolean hasInitSegment,
                boolean encrypted,
                boolean hasEndList,
                double totalDurationSeconds
        ) {
            this.segmentUrls = segmentUrls;
            this.hasInitSegment = hasInitSegment;
            this.encrypted = encrypted;
            this.hasEndList = hasEndList;
            this.totalDurationSeconds = totalDurationSeconds;
        }
    }

    static List<Rendition> parseMaster(String text, String baseUrl) {
        List<Rendition> renditions = new ArrayList<>();
        if (text == null) return renditions;

        String pendingAttributes = null;
        for (String rawLine : text.split("\n")) {
            String line = rawLine.trim();
            if (line.startsWith("#EXT-X-STREAM-INF:")) {
                pendingAttributes = line.substring("#EXT-X-STREAM-INF:".length());
            } else if (!line.isEmpty() && !line.startsWith("#") && pendingAttributes != null) {
                long bandwidth = parseLongAttribute(pendingAttributes, "BANDWIDTH");
                String resolution = attribute(pendingAttributes, "RESOLUTION");
                renditions.add(new Rendition(bandwidth, resolution, resolve(baseUrl, line)));
                pendingAttributes = null;
            }
        }
        return renditions;
    }

    /** The highest-bandwidth rendition; the first one wins a tie. Null when there are none. */
    static Rendition bestRendition(List<Rendition> renditions) {
        Rendition best = null;
        for (Rendition rendition : renditions) {
            if (best == null || rendition.bandwidth > best.bandwidth) {
                best = rendition;
            }
        }
        return best;
    }

    static Media parseMedia(String text, String baseUrl) {
        List<String> segments = new ArrayList<>();
        boolean hasInitSegment = false;
        boolean encrypted = false;
        boolean hasEndList = false;
        double totalDuration = 0;

        if (text != null) {
            for (String rawLine : text.split("\n")) {
                String line = rawLine.trim();
                if (line.startsWith("#EXT-X-MAP:")) {
                    hasInitSegment = true;
                } else if (line.startsWith("#EXT-X-KEY:")) {
                    String method = attribute(
                            line.substring("#EXT-X-KEY:".length()), "METHOD");
                    if (method != null && !"NONE".equalsIgnoreCase(method)) {
                        encrypted = true;
                    }
                } else if (line.startsWith("#EXT-X-ENDLIST")) {
                    hasEndList = true;
                } else if (line.startsWith("#EXTINF:")) {
                    String value = line.substring("#EXTINF:".length());
                    int comma = value.indexOf(',');
                    if (comma >= 0) value = value.substring(0, comma);
                    try {
                        totalDuration += Double.parseDouble(value.trim());
                    } catch (NumberFormatException ignored) {
                        // A malformed duration only loses the total, never a segment.
                    }
                } else if (!line.isEmpty() && !line.startsWith("#")) {
                    segments.add(resolve(baseUrl, line));
                }
            }
        }
        return new Media(segments, hasInitSegment, encrypted, hasEndList, totalDuration);
    }

    /** Resolves a possibly relative playlist URI against the playlist that contained it. */
    static String resolve(String baseUrl, String reference) {
        if (reference == null) return null;
        try {
            return new URL(new URL(baseUrl), reference).toString();
        } catch (MalformedURLException exception) {
            return reference;
        }
    }

    private static long parseLongAttribute(String attributes, String name) {
        String value = attribute(attributes, name);
        if (value == null) return 0;
        try {
            return Long.parseLong(value.trim());
        } catch (NumberFormatException ignored) {
            return 0;
        }
    }

    /**
     * Reads one attribute from an HLS attribute list. Values may be quoted and may contain
     * commas inside the quotes (CODECS does), so the split tracks quote state.
     */
    private static String attribute(String attributes, String name) {
        if (attributes == null) return null;

        StringBuilder token = new StringBuilder();
        boolean quoted = false;
        List<String> parts = new ArrayList<>();
        for (int index = 0; index <= attributes.length(); index++) {
            char character = index < attributes.length() ? attributes.charAt(index) : ',';
            if (character == '"') {
                quoted = !quoted;
                token.append(character);
            } else if (character == ',' && !quoted) {
                parts.add(token.toString());
                token.setLength(0);
            } else {
                token.append(character);
            }
        }
        for (String part : parts) {
            int equals = part.indexOf('=');
            if (equals < 0) continue;
            if (!part.substring(0, equals).trim().equalsIgnoreCase(name)) continue;
            String value = part.substring(equals + 1).trim();
            if (value.length() >= 2 && value.startsWith("\"") && value.endsWith("\"")) {
                value = value.substring(1, value.length() - 1);
            }
            return value;
        }
        return null;
    }
}
