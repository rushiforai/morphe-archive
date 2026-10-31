package app.morphed.extension.twitch.hls;

import java.net.URI;
import java.time.OffsetDateTime;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * A live media playlist split into header, segments and trailing tags.
 */
public final class MediaPlaylist {
    public static final long UNKNOWN_TIME = Long.MIN_VALUE;

    public static final class Segment {
        /** Tag lines that belong to this segment, in order, including EXTINF. */
        public final List<String> tags;
        public final String uri;
        /** The EXT-X-MAP (init segment) line in effect for this segment, or null. */
        public final String map;
        public final long sequence;
        public final boolean live;
        public final boolean discontinuity;
        /** EXT-X-PROGRAM-DATE-TIME in epoch milliseconds, or {@link #UNKNOWN_TIME}. */
        public final long programDateTime;

        private final boolean ad;

        Segment(List<String> tags, String uri, String map, long sequence, boolean liveTitlesInUse) {
            this.tags = Collections.unmodifiableList(tags);
            this.uri = uri;
            this.map = map;
            this.sequence = sequence;

            boolean live = false;
            boolean discontinuity = false;
            long programDateTime = UNKNOWN_TIME;
            for (String tag : tags) {
                if (tag.startsWith("#EXTINF")) {
                    // Twitch titles content segments "live"; stitched ads carry an ad title instead.
                    live = tag.contains(",live");
                } else if (tag.startsWith("#EXT-X-DISCONTINUITY") && !tag.startsWith("#EXT-X-DISCONTINUITY-SEQUENCE")) {
                    discontinuity = true;
                } else if (tag.startsWith("#EXT-X-PROGRAM-DATE-TIME:")) {
                    programDateTime = parseTime(tag.substring("#EXT-X-PROGRAM-DATE-TIME:".length()));
                }
            }
            this.live = live;
            this.discontinuity = discontinuity;
            this.programDateTime = programDateTime;
            // Only trust the title, and the placeholder URLs Twitch also uses when a stream hiccups,
            // while a stitched ad is announced, so neither a format change at Twitch, an unrelated
            // marker nor a reconnecting streamer can turn ordinary segments into "ads".
            this.ad = (liveTitlesInUse && (!live || AdMarkers.isPlaceholderUrl(uri))) || AdMarkers.isAdSegmentUrl(uri);
        }

        public boolean isAd() {
            return ad;
        }
    }

    /** Lines before the first segment, without MEDIA-SEQUENCE and DISCONTINUITY-SEQUENCE. */
    public final List<String> header;
    public final List<Segment> segments;
    /** Tags after the last segment, such as prefetch hints and ENDLIST. */
    public final List<String> trailer;
    public final long mediaSequence;
    public final long discontinuitySequence;
    public final boolean hasAdTags;
    /** A stitched ad is announced; see {@link AdMarkers#hasStitchedAdTags}. */
    public final boolean hasStitchedAdTags;

    private MediaPlaylist(List<String> header, List<Segment> segments, List<String> trailer,
                          long mediaSequence, long discontinuitySequence, boolean hasAdTags, boolean hasStitchedAdTags) {
        this.header = Collections.unmodifiableList(header);
        this.segments = Collections.unmodifiableList(segments);
        this.trailer = Collections.unmodifiableList(trailer);
        this.mediaSequence = mediaSequence;
        this.discontinuitySequence = discontinuitySequence;
        this.hasAdTags = hasAdTags;
        this.hasStitchedAdTags = hasStitchedAdTags;
    }

    public boolean hasAdSegments() {
        for (Segment segment : segments) {
            if (segment.isAd()) return true;
        }
        return false;
    }

    public boolean hasAds() {
        return hasAdTags || hasAdSegments();
    }

    public static MediaPlaylist parse(String text) {
        return parse(text, null);
    }

    /**
     * @param baseUrl URL the playlist was downloaded from; relative URIs are made absolute against
     *                it so the playlist can be served from another URL. Null keeps URIs as they are.
     */
    public static MediaPlaylist parse(String text, String baseUrl) {
        List<String> header = new ArrayList<>();
        List<List<String>> segmentTags = new ArrayList<>();
        List<String> segmentUris = new ArrayList<>();
        List<String> segmentMaps = new ArrayList<>();
        List<String> trailer = new ArrayList<>();
        List<String> pending = new ArrayList<>();
        long mediaSequence = 0;
        long discontinuitySequence = 0;
        boolean inSegments = false;
        String map = null;

        for (String rawLine : text.split("\r?\n")) {
            String line = rawLine.trim();
            if (line.isEmpty()) continue;

            if (line.startsWith("#EXT-X-MEDIA-SEQUENCE:")) {
                mediaSequence = parseLong(line.substring("#EXT-X-MEDIA-SEQUENCE:".length()), 0);
            } else if (line.startsWith("#EXT-X-DISCONTINUITY-SEQUENCE:")) {
                discontinuitySequence = parseLong(line.substring("#EXT-X-DISCONTINUITY-SEQUENCE:".length()), 0);
            } else if (line.startsWith("#EXT-X-MAP")) {
                // Applies to every following segment, so it is tracked per segment instead of as a tag.
                map = resolveUriAttribute(line, baseUrl);
            } else if (line.startsWith("#")) {
                if (isTrailerTag(line)) {
                    trailer.add(line.startsWith("#EXT-X-TWITCH-PREFETCH:")
                            ? "#EXT-X-TWITCH-PREFETCH:" + resolve(baseUrl, line.substring("#EXT-X-TWITCH-PREFETCH:".length()))
                            : resolveUriAttribute(line, baseUrl));
                } else if (inSegments || isSegmentTag(line)) {
                    inSegments = true;
                    pending.add(line);
                } else {
                    header.add(line);
                }
            } else {
                segmentTags.add(new ArrayList<>(pending));
                segmentUris.add(resolve(baseUrl, line));
                segmentMaps.add(map);
                pending.clear();
                inSegments = true;
            }
        }
        // Tags left after the last URI (for example a DATERANGE for the next segment) stay with the trailer.
        trailer.addAll(0, pending);

        boolean hasAdTags = AdMarkers.hasAdTags(text);
        // A segment without a "live" title is only an ad while a stitched ad is announced.
        boolean liveTitlesInUse = AdMarkers.hasStitchedAdTags(text);
        List<Segment> segments = new ArrayList<>(segmentUris.size());
        for (int i = 0; i < segmentUris.size(); i++) {
            segments.add(new Segment(segmentTags.get(i), segmentUris.get(i), segmentMaps.get(i),
                    mediaSequence + i, liveTitlesInUse));
        }

        return new MediaPlaylist(header, segments, trailer, mediaSequence, discontinuitySequence, hasAdTags, liveTitlesInUse);
    }

    private static final Pattern URI_ATTRIBUTE = Pattern.compile("URI=\"([^\"]*)\"");

    private static String resolveUriAttribute(String line, String baseUrl) {
        if (baseUrl == null) return line;
        Matcher matcher = URI_ATTRIBUTE.matcher(line);
        if (!matcher.find()) return line;
        return line.substring(0, matcher.start(1)) + resolve(baseUrl, matcher.group(1)) + line.substring(matcher.end(1));
    }

    private static String resolve(String baseUrl, String uri) {
        if (baseUrl == null || uri.startsWith("http://") || uri.startsWith("https://")) return uri;
        try {
            return URI.create(baseUrl).resolve(uri).toString();
        } catch (IllegalArgumentException e) {
            return uri;
        }
    }

    private static boolean isSegmentTag(String line) {
        return line.startsWith("#EXTINF")
                || line.startsWith("#EXT-X-PROGRAM-DATE-TIME")
                || line.startsWith("#EXT-X-DISCONTINUITY")
                || line.startsWith("#EXT-X-DATERANGE")
                || line.startsWith("#EXT-X-BYTERANGE")
                || line.startsWith("#EXT-X-KEY")
                || line.startsWith("#EXT-X-CUE")
                || line.startsWith("#EXT-X-SCTE35")
                || line.startsWith("#EXT-X-PART:")
                || line.startsWith("#EXT-X-GAP")
                || line.startsWith("#EXT-X-BITRATE");
    }

    static boolean isTrailerTag(String line) {
        return line.startsWith("#EXT-X-TWITCH-PREFETCH:")
                || line.startsWith("#EXT-X-PRELOAD-HINT:")
                || line.startsWith("#EXT-X-RENDITION-REPORT")
                || line.startsWith("#EXT-X-ENDLIST");
    }

    static boolean isPrefetchTag(String line) {
        return line.startsWith("#EXT-X-TWITCH-PREFETCH:") || line.startsWith("#EXT-X-PRELOAD-HINT:");
    }

    private static long parseTime(String value) {
        try {
            return OffsetDateTime.parse(value.trim()).toInstant().toEpochMilli();
        } catch (DateTimeParseException e) {
            return UNKNOWN_TIME;
        }
    }

    private static long parseLong(String value, long fallback) {
        try {
            return Long.parseLong(value.trim());
        } catch (NumberFormatException e) {
            return fallback;
        }
    }
}
