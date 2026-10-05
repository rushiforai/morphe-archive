package dev.twitchpatches.extension.ads.hls;

import java.net.URI;
import java.time.Instant;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public final class HlsPlaylist {
    public final List<Variant> variants;
    public final List<Segment> segments;
    public final List<Hint> hints;
    public final boolean ads;
    public final boolean ended;
    public final int targetDuration;
    public final int version;
    public final long mediaSequence;
    public final boolean supported;

    private HlsPlaylist(List<Variant> variants, List<Segment> segments, List<Hint> hints, boolean ads, boolean ended,
            int targetDuration, int version, long mediaSequence, boolean supported) {
        this.variants = Collections.unmodifiableList(variants);
        this.segments = Collections.unmodifiableList(segments);
        this.hints = Collections.unmodifiableList(hints);
        this.ads = ads; this.ended = ended; this.targetDuration = targetDuration; this.supported = supported;
        this.version = version; this.mediaSequence = mediaSequence;
    }

    public static HlsPlaylist parse(String text, String base) {
        List<Variant> variants = new ArrayList<>();
        List<Segment> segments = new ArrayList<>();
        List<Hint> hints = new ArrayList<>();
        boolean valid = text.startsWith("#EXTM3U"), ads = false, ended = false, discontinuity = false;
        Long sequence = null;
        long date = -1;
        double duration = 0;
        int target = 2, version = 3;
        long mediaSequence = -1;
        String map = null;
        Map<String, String> variant = null;
        if (text.length() > 512 * 1024) return new HlsPlaylist(variants, segments, hints, false, false, target, version, mediaSequence, false);
        try {
            for (String raw : text.split("\n")) {
                String line = raw.trim();
                if (line.isEmpty()) continue;
                if (line.startsWith("#EXT-X-STREAM-INF:")) variant = attributes(value(line));
                else if (line.startsWith("#EXT-X-VERSION:")) version = Integer.parseInt(value(line));
                else if (line.startsWith("#EXT-X-MEDIA-SEQUENCE:")) {
                    mediaSequence = Long.parseLong(value(line));
                    if (mediaSequence < 0 || mediaSequence > Long.MAX_VALUE - 256) valid = false;
                }
                else if (line.startsWith("#EXT-X-TWITCH-LIVE-SEQUENCE:")) {
                    sequence = Long.valueOf(value(line));
                    if (sequence < 0 || sequence > Long.MAX_VALUE - 256) valid = false;
                }
                else if (line.equals("#EXT-X-DISCONTINUITY")) { sequence = null; discontinuity = true; }
                else if (line.startsWith("#EXT-X-TWITCH-PREFETCH:")) {
                    hints.add(new Hint(sequence, resolve(base, value(line)), map));
                    if (sequence != null) sequence++;
                }
                else if (line.startsWith("#EXT-X-PROGRAM-DATE-TIME:")) date = Instant.parse(value(line)).toEpochMilli();
                else if (line.startsWith("#EXT-X-TARGETDURATION:")) target = Integer.parseInt(value(line));
                else if (line.startsWith("#EXTINF:")) {
                    String body = value(line);
                    int comma = body.indexOf(',');
                    duration = Double.parseDouble(comma < 0 ? body : body.substring(0, comma));
                } else if (line.startsWith("#EXT-X-MAP:")) {
                    Map<String, String> parts = attributes(value(line));
                    String uri = parts.get("URI");
                    if (uri == null || parts.containsKey("BYTERANGE")) valid = false;
                    else map = resolve(base, uri);
                } else if (line.startsWith("#EXT-X-KEY:") && !"NONE".equals(attributes(value(line)).get("METHOD"))) valid = false;
                else if (line.startsWith("#EXT-X-BYTERANGE:") || line.startsWith("#EXT-X-PART:") ||
                        line.startsWith("#EXT-X-SKIP:")) valid = false;
                else if (line.equals("#EXT-X-ENDLIST")) ended = true;
                else if (line.startsWith("#EXT-X-DATERANGE:")) {
                    attributes(value(line));
                    if (line.contains("stitched-ad") || line.contains("X-TV-TWITCH-AD")) ads = true;
                }
                else if (!line.startsWith("#")) {
                    String uri = resolve(base, line);
                    if (variant != null) {
                        variants.add(Variant.from(uri, variant));
                        variant = null;
                    } else {
                        if (!(duration > 0 && duration <= 60) || !Double.isFinite(duration)) valid = false;
                        segments.add(new Segment(sequence, uri, duration, map, date, discontinuity));
                        if (sequence != null) sequence++;
                        duration = 0; date = -1; discontinuity = false;
                    }
                }
            }
        } catch (IllegalArgumentException | DateTimeParseException exception) { valid = false; }
        if (target < 1 || target > 60 || version < 1 || version > 20 || variants.size() > 64 ||
                segments.size() > 256 || hints.size() > 8 || variant != null || duration != 0) valid = false;
        return new HlsPlaylist(variants, segments, hints, ads, ended, target, version, mediaSequence, valid);
    }

    private static String value(String line) { return line.substring(line.indexOf(':') + 1); }

    public static String resolve(String base, String relative) {
        URI uri = URI.create(base).resolve(relative);
        if (!twitchUri(uri)) throw new IllegalArgumentException("Unsupported media host");
        return uri.toString();
    }

    public static boolean twitchUri(URI uri) {
        String host = uri.getHost();
        if (!"https".equalsIgnoreCase(uri.getScheme()) || host == null || uri.getUserInfo() != null ||
                (uri.getPort() != -1 && uri.getPort() != 443)) return false;
        host = host.toLowerCase(java.util.Locale.ROOT);
        return host.equals("ttvnw.net") || host.endsWith(".ttvnw.net") ||
                host.equals("jtvnw.net") || host.endsWith(".jtvnw.net") ||
                host.equals("twitch.tv") || host.endsWith(".twitch.tv");
    }

    public static Map<String, String> attributes(String input) {
        Map<String, String> result = new LinkedHashMap<>();
        int start = 0;
        boolean quoted = false;
        for (int i = 0; i <= input.length(); i++) {
            if (i < input.length() && input.charAt(i) == '"') quoted = !quoted;
            if (i == input.length() || (input.charAt(i) == ',' && !quoted)) {
                String part = input.substring(start, i).trim();
                int equals = part.indexOf('=');
                if (equals <= 0) throw new IllegalArgumentException("Malformed HLS attributes");
                String key = part.substring(0, equals), value = part.substring(equals + 1);
                if (value.startsWith("\"")) {
                    if (!value.endsWith("\"") || value.length() < 2) throw new IllegalArgumentException("Unclosed HLS string");
                    value = value.substring(1, value.length() - 1);
                }
                if (result.put(key, value) != null) throw new IllegalArgumentException("Duplicate HLS attribute");
                start = i + 1;
            }
        }
        if (quoted) throw new IllegalArgumentException("Unclosed HLS attributes");
        return result;
    }

    public static final class Segment {
        public final Long liveSequence;
        public final String uri;
        public final double duration;
        public final String map;
        public final long date;
        public final boolean discontinuity;
        public Segment(Long sequence, String uri, double duration, String map, long date, boolean discontinuity) {
            this.liveSequence = sequence; this.uri = uri; this.duration = duration;
            this.map = map; this.date = date; this.discontinuity = discontinuity;
        }
    }

    public static final class Hint {
        public final Long liveSequence;
        public final String uri;
        public final String map;
        Hint(Long sequence, String uri, String map) { this.liveSequence = sequence; this.uri = uri; this.map = map; }
    }
}
