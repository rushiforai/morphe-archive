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

        for (String rawLine : Lines.of(text)) {
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

    static long parseTime(String value) {
        String text = value.trim();
        long fast = parseUtcTime(text);
        if (fast != UNKNOWN_TIME) return fast;
        try {
            return OffsetDateTime.parse(text).toInstant().toEpochMilli();
        } catch (DateTimeParseException e) {
            return UNKNOWN_TIME;
        }
    }

    /**
     * Twitch's own format, {@code 2026-11-09T09:25:59.434Z}, read without java.time: every segment of
     * every poll has one, and the general parser is the slowest part of reading a playlist. Anything
     * else (other offsets, odd digits) gives {@link #UNKNOWN_TIME} and goes to the general parser.
     */
    static long parseUtcTime(String text) {
        int length = text.length();
        if (length < 20 || text.charAt(length - 1) != 'Z' || text.charAt(4) != '-' || text.charAt(7) != '-'
                || text.charAt(10) != 'T' || text.charAt(13) != ':' || text.charAt(16) != ':') {
            return UNKNOWN_TIME;
        }
        int year = digits(text, 0, 4);
        int month = digits(text, 5, 7);
        int day = digits(text, 8, 10);
        int hour = digits(text, 11, 13);
        int minute = digits(text, 14, 16);
        int second = digits(text, 17, 19);
        if (year < 0 || month < 1 || month > 12 || day < 1 || day > 31 || hour < 0 || hour > 23
                || minute < 0 || minute > 59 || second < 0 || second > 59) {
            return UNKNOWN_TIME;
        }
        int millis = 0;
        if (length > 20) {
            // ".fraction": only milliseconds count, further digits are dropped like toEpochMilli does.
            // java.time takes 1 to 9 fraction digits.
            if (text.charAt(19) != '.' || length == 21 || length > 30) return UNKNOWN_TIME;
            int scale = 100;
            for (int i = 20; i < length - 1; i++) {
                int digit = text.charAt(i) - '0';
                if (digit < 0 || digit > 9) return UNKNOWN_TIME;
                millis += digit * scale;
                scale /= 10;
            }
        }
        if (day > daysInMonth(year, month)) return UNKNOWN_TIME;
        long days = daysSinceEpoch(year, month, day);
        return ((days * 24 + hour) * 60 + minute) * 60_000L + second * 1_000L + millis;
    }

    /** The number in {@code text[from, to)}, or -1 if it is not all digits. */
    private static int digits(String text, int from, int to) {
        int value = 0;
        for (int i = from; i < to; i++) {
            int digit = text.charAt(i) - '0';
            if (digit < 0 || digit > 9) return -1;
            value = value * 10 + digit;
        }
        return value;
    }

    private static int daysInMonth(int year, int month) {
        if (month == 2) return (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) ? 29 : 28;
        return month == 4 || month == 6 || month == 9 || month == 11 ? 30 : 31;
    }

    /** Days from 1970-01-01 to the given date (proleptic Gregorian), as in java.time's LocalDate.toEpochDay. */
    private static long daysSinceEpoch(int year, int month, int day) {
        long y = month <= 2 ? year - 1 : year;
        long era = Math.floorDiv(y, 400);
        long yearOfEra = y - era * 400;
        long dayOfYear = (153L * (month + (month > 2 ? -3 : 9)) + 2) / 5 + day - 1;
        long dayOfEra = yearOfEra * 365 + yearOfEra / 4 - yearOfEra / 100 + dayOfYear;
        return era * 146_097 + dayOfEra - 719_468;
    }

    private static long parseLong(String value, long fallback) {
        try {
            return Long.parseLong(value.trim());
        } catch (NumberFormatException e) {
            return fallback;
        }
    }
}
