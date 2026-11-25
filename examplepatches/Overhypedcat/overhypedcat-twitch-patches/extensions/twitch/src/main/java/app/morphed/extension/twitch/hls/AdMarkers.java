package app.morphed.extension.twitch.hls;

import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Ad markers Twitch places in HLS playlists. Based on vaft's AdSignifiers.
 */
public final class AdMarkers {
    private static final String[] SIGNIFIERS = {
            "stitched-ad",
            "EXT-X-CUE-OUT",
            "twitch-stitched",
            // vaft matches these only when CLASS is the first DATERANGE attribute; match any position.
            "CLASS=\"twitch-maf-ad\"",
            // (not twitch-trigger: every stream carries it from its start, ad or not, as Purple AdBlock found)
    };

    /** Always an ad. */
    private static final String[] AD_SEGMENT_URL_PATTERNS = {"/adsquared/"};
    /**
     * Placeholders Twitch serves for missing or still transcoding segments: ads during a stitched
     * ad, but also show up when a stream hiccups or the streamer reconnects.
     */
    private static final String[] PLACEHOLDER_URL_PATTERNS = {"/_404/", "/processing"};

    /**
     * DATERANGE classes that are not ads by themselves (from vaft's field observations). Quartile
     * markers are ad tracking beacons that can outlive the ad they belong to.
     */
    private static final Set<String> NON_AD_CLASSES = new HashSet<>(Arrays.asList(
            "twitch-session", "twitch-stream-source", "twitch-assignment", "twitch-ad-quartile", "twitch-trigger"));
    private static final Set<String> AD_WORDS = new HashSet<>(Arrays.asList(
            "ad", "ads", "advert", "stitched", "maf", "break", "midroll", "preroll", "sponsor", "cue",
            "scte35", "splice", "commercial", "quartile", "trigger"));
    private static final Pattern DATERANGE_CLASS = Pattern.compile("CLASS=\"([^\"]+)\"");
    private static final Pattern NON_WORD = Pattern.compile("[^a-z0-9]+");
    /**
     * Ad word check per tag or class name. A playlist repeats the same few names on every poll, so
     * each is only split into words once. Bounded, so unknown names cannot grow it without limit.
     */
    private static final Map<String, Boolean> AD_WORD_CACHE = new ConcurrentHashMap<>();
    private static final int AD_WORD_CACHE_MAX = 256;

    private AdMarkers() {
    }

    public static boolean hasAdTags(String text) {
        for (String signifier : SIGNIFIERS) {
            if (text.contains(signifier)) return true;
        }
        return false;
    }

    /**
     * Markers of an ad stitched into the stream itself. Only then are segments without a "live"
     * title ads; maf-ad and trigger markers alone show up on streams without any ad playing.
     */
    public static boolean hasStitchedAdTags(String text) {
        return text.contains("stitched-ad") || text.contains("twitch-stitched") || text.contains("EXT-X-CUE-OUT");
    }

    private static final java.util.regex.Pattern START_DATE = java.util.regex.Pattern.compile("START-DATE=\"([^\"]+)\"");

    /**
     * Whether a stitched ad break is announced to start after the newest segment (its start {@code newestMs}, epoch
     * ms): the prefetch hints then point at the break's first ad segments, so they go. A break announced without a
     * readable start, or one that has begun, doesn't count: its ad segments, once there, say so themselves.
     */
    public static boolean breakAhead(String text, long newestMs) {
        if (newestMs == MediaPlaylist.UNKNOWN_TIME || !hasStitchedAdTags(text)) return false;
        for (String line : Lines.of(text)) {
            if (!line.startsWith("#EXT-X-DATERANGE") || !hasStitchedAdTags(line)) continue;
            java.util.regex.Matcher start = START_DATE.matcher(line);
            if (!start.find()) continue;
            long at = MediaPlaylist.parseTime(start.group(1));
            if (at != MediaPlaylist.UNKNOWN_TIME && at > newestMs) return true;
        }
        return false;
    }

    /**
     * Twitch's playlist as it is, without the lines that tell the app an ad is on (it would start its own), and
     * without the prefetch hints when {@code dropPrefetch}. Everything else (numbering, low latency hints, parts)
     * stays exactly as Twitch sent it.
     */
    public static String withoutAdTags(String text, boolean dropPrefetch) {
        StringBuilder out = new StringBuilder(text.length());
        boolean changed = false;
        for (String line : Lines.of(text)) {
            // The trigger marker stays: it isn't an ad (it's there all stream long, from its start), and the
            // player is given its playlist as Twitch sent it outside ads, as Purple AdBlock does.
            boolean adLine = isAdTagLine(line) && !isTriggerLine(line);
            if (adLine || (dropPrefetch && MediaPlaylist.isPrefetchTag(line))) {
                changed = true;
                continue;
            }
            out.append(line).append('\n');
        }
        return changed ? out.toString() : text;
    }

    /** Twitch's trigger marker: a session marker every stream carries, not an ad. */
    static boolean isTriggerLine(String line) {
        return line.contains("CLASS=\"twitch-trigger\"") && !hasStitchedAdTags(line) && !line.contains("twitch-maf-ad");
    }

    /**
     * A tag line that tells the app an ad is playing. Dropped from rewritten playlists so the app
     * does not start its own (client side) ad.
     */
    public static boolean isAdTagLine(String line) {
        if (!line.startsWith("#")) return false;
        return hasAdTags(line) || line.startsWith("#EXT-X-CUE-IN") || line.contains("X-TV-TWITCH-AD");
    }

    /**
     * Tags and DATERANGE classes that look ad related. When a playlist has these but no known ad
     * marker, Twitch has most likely changed how ads are marked.
     */
    public static Set<String> suspiciousMarkers(String text) {
        Set<String> markers = new LinkedHashSet<>();
        for (String line : Lines.of(text)) {
            // CUE-IN closes a known CUE-OUT and can stay in the window after the CUE-OUT has left it.
            if (!line.startsWith("#EXT") || line.startsWith("#EXT-X-CUE-IN")) continue;
            int colon = line.indexOf(':');
            String tag = colon >= 0 ? line.substring(0, colon) : line;
            if (hasAdWord(tag.substring(1))) markers.add(tag);

            String dateRangeClass = null;
            if (tag.equals("#EXT-X-DATERANGE")) {
                Matcher matcher = DATERANGE_CLASS.matcher(line);
                if (matcher.find()) dateRangeClass = matcher.group(1);
            }
            if (dateRangeClass != null && NON_AD_CLASSES.contains(dateRangeClass)) continue;

            if (dateRangeClass != null && hasAdWord(dateRangeClass)) markers.add("CLASS=\"" + dateRangeClass + "\"");
            if (line.contains("X-TV-TWITCH-AD")) markers.add("X-TV-TWITCH-AD attribute");
        }
        return markers;
    }

    static boolean hasAdWord(String name) {
        Boolean cached = AD_WORD_CACHE.get(name);
        if (cached != null) return cached;
        boolean result = false;
        for (String word : NON_WORD.split(name.toLowerCase(Locale.ROOT))) {
            if (AD_WORDS.contains(word)) {
                result = true;
                break;
            }
        }
        if (AD_WORD_CACHE.size() < AD_WORD_CACHE_MAX) AD_WORD_CACHE.put(name, result);
        return result;
    }

    public static boolean isAdSegmentUrl(String url) {
        for (String pattern : AD_SEGMENT_URL_PATTERNS) {
            if (url.contains(pattern)) return true;
        }
        return false;
    }

    public static boolean isPlaceholderUrl(String url) {
        for (String pattern : PLACEHOLDER_URL_PATTERNS) {
            if (url.contains(pattern)) return true;
        }
        return false;
    }
}
