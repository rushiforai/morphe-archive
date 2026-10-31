package app.morphed.extension.twitch.hls;

import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.Set;
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
            "CLASS=\"twitch-trigger\"",
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
            "twitch-session", "twitch-stream-source", "twitch-assignment", "twitch-ad-quartile"));
    private static final Set<String> AD_WORDS = new HashSet<>(Arrays.asList(
            "ad", "ads", "advert", "stitched", "maf", "break", "midroll", "preroll", "sponsor", "cue",
            "scte35", "splice", "commercial", "quartile", "trigger"));
    private static final Pattern DATERANGE_CLASS = Pattern.compile("CLASS=\"([^\"]+)\"");

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
        for (String line : text.split("\r?\n")) {
            if (!line.startsWith("#EXT")) continue;
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

    private static boolean hasAdWord(String name) {
        for (String word : name.toLowerCase(Locale.ROOT).split("[^a-z0-9]+")) {
            if (AD_WORDS.contains(word)) return true;
        }
        return false;
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
