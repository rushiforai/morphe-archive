package io.github.sabopura.morphe.extension.twitch.ads;

import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Reads and rewrites Twitch's HLS playlists. Pure Java so the tests can use real playlists.
 *
 * <p>In a normal live media playlist, {@code EXT-X-MEDIA-SEQUENCE} equals
 * {@code EXT-X-TWITCH-LIVE-SEQUENCE}: the number of the stream's segment, shared by every
 * viewer session. Answering with another session's playlist therefore keeps the numbering the
 * player already knows, which is what lets a stitched ad be replaced without a visible seam.
 */
public final class Playlists {
    private static final Pattern ATTRIBUTE = Pattern.compile("([A-Z0-9-]+)=(\"[^\"]*\"|[^,]*)");
    private static final Pattern MEDIA_SEQUENCE = Pattern.compile("(?m)^#EXT-X-MEDIA-SEQUENCE:(\\d+)\\s*$");
    private static final Pattern LIVE_SEQUENCE = Pattern.compile("(?m)^#EXT-X-TWITCH-LIVE-SEQUENCE:(\\d+)\\s*$");
    private static final Pattern CHANNEL = Pattern.compile("^/api/(?:v2/)?channel/hls/([A-Za-z0-9_]{1,25})\\.m3u8$");
    private static final Pattern TOKEN = Pattern.compile("[?&]token=([^&]+)");
    private static final Pattern PLAYER_TYPE = Pattern.compile("\"player_type\"\\s*:\\s*\"([^\"]+)\"");
    private static final Pattern DATERANGE_CLASS = Pattern.compile("CLASS=\"([^\"]+)\"");

    private static final String DATERANGE = "#EXT-X-DATERANGE:";
    private static final String EXTINF = "#EXTINF:";
    private static final String AD_ATTRIBUTE = "X-TV-TWITCH-AD";
    private static final String STITCHED_CUE = "CLASS=\"twitch-stitched-ad\"";
    /** Player types of home feed previews and other players that are not the stream being watched. */
    private static final Set<String> PREVIEW_TYPES = new HashSet<>(Arrays.asList(
            "autoplay", "preview_theatre_mode", "creator_mode_preview", "clips", "creator_stories"));
    /** Daterange classes that carry ad attributes but do not mean an ad is in the playlist. */
    private static final Set<String> NOT_STITCHED_CLASSES = new HashSet<>(Arrays.asList(
            "twitch-ad-quartile", "twitch-maf-ad", "twitch-stream-source", "twitch-session", "twitch-assignment"));

    /** Cues the player turns into requests for ads it plays itself. Removed whenever blocking. */
    private static final String[] CLIENT_AD_CUES = {
            "CLASS=\"twitch-maf-ad\"",
    };
    private static final String[] PICTURE_BY_PICTURE_CUES = {
            "pbyp-preflight",
    };
    /** Cues that describe a stitched ad. Only removed when no ad segment is left. */
    private static final String[] STITCHED_AD_CUES = {
            STITCHED_CUE,
            "CLASS=\"twitch-ad-quartile\"",
    };

    private Playlists() {
    }

    public static boolean isMaster(String text) {
        return text.contains("#EXT-X-STREAM-INF");
    }

    /**
     * True when the playlist carries a stitched ad: its cue, an ad attribute on a cue that is not
     * merely informational, or a segment not titled as live. Twitch names ad segments after the
     * ad server ("Amazon|..."), so this keeps working when another ad server appears.
     */
    public static boolean hasStitchedAd(String text) {
        if (text.contains(STITCHED_CUE)) return true;
        int length = text.length();
        for (int start = 0, end; start < length; start = end + 1) {
            end = text.indexOf('\n', start);
            if (end < 0) end = length;
            if (text.startsWith(EXTINF, start)) {
                if (isAdTitle(segmentTitle(text, start, end))) return true;
            } else if (text.startsWith(DATERANGE, start)) {
                String line = text.substring(start, end);
                if (line.contains(AD_ATTRIBUTE) && !line.contains("pbyp-preflight")
                        && !NOT_STITCHED_CLASSES.contains(dateRangeClass(line))) return true;
            }
        }
        return false;
    }

    private static String segmentTitle(String text, int start, int end) {
        int comma = text.indexOf(',', start);
        return comma < 0 || comma >= end ? "" : text.substring(comma + 1, end).trim();
    }

    private static boolean isAdTitle(String title) {
        return !title.isEmpty() && !title.startsWith("live");
    }

    private static String dateRangeClass(String line) {
        Matcher m = DATERANGE_CLASS.matcher(line);
        return m.find() ? m.group(1) : "";
    }

    /**
     * Describes an ad marker this code was not written for, or null. The ad is still handled;
     * this only says that Twitch changed something the patch should learn about.
     */
    public static String unknownAdMarker(String text) {
        int length = text.length();
        for (int start = 0, end; start < length; start = end + 1) {
            end = text.indexOf('\n', start);
            if (end < 0) end = length;
            if (text.startsWith(EXTINF, start)) {
                String title = segmentTitle(text, start, end);
                if (isAdTitle(title) && !title.startsWith("Amazon")) return "segment title " + title;
            } else if (text.startsWith("#EXT-X-CUE-OUT", start)) {
                return "EXT-X-CUE-OUT";
            } else if (text.startsWith(DATERANGE, start)) {
                String line = text.substring(start, end);
                String cue = dateRangeClass(line);
                if (line.contains(AD_ATTRIBUTE) && !NOT_STITCHED_CLASSES.contains(cue)
                        && !line.contains(STITCHED_CUE) && !line.contains("pbyp-preflight")) return "cue " + cue;
            }
        }
        return null;
    }

    /** The live sequence number of the first segment, or -1 if the playlist has none. */
    public static long liveSequence(String text) {
        Matcher m = LIVE_SEQUENCE.matcher(text);
        return m.find() ? Long.parseLong(m.group(1)) : -1;
    }

    /** True for a playlist with live sequence numbers and segments. */
    static boolean isLive(String text) {
        return liveSequence(text) >= 0 && text.contains(EXTINF);
    }

    /** True for a live playlist that can be served as is: no ad and a live sequence number. */
    public static boolean isCleanLive(String text) {
        return isLive(text) && !hasStitchedAd(text);
    }

    /** True for a media playlist in the shape this code understands; anything else is left alone. */
    public static boolean isMediaPlaylist(String text) {
        return text.startsWith("#EXTM3U") && text.contains(EXTINF) && text.contains("#EXT-X-MEDIA-SEQUENCE:");
    }

    /**
     * Prepares a live media playlist for the player: numbers it by live sequence, so that
     * playlists of different sessions line up, and drops the cues of client-requested ads.
     * Stitched-ad cues stay while an ad segment is present, so the fallback can still see it.
     */
    public static String prepare(String text) {
        long live = liveSequence(text);
        String out = text;
        if (live >= 0) {
            Matcher m = MEDIA_SEQUENCE.matcher(out);
            if (m.find() && Long.parseLong(m.group(1)) != live) {
                out = out.substring(0, m.start(1)) + live + out.substring(m.end(1));
            }
        }
        if (!out.contains(DATERANGE)) return out;
        boolean stripStitched = !hasStitchedAd(out);
        StringBuilder b = new StringBuilder(out.length());
        for (String line : out.split("\n", -1)) {
            if (line.startsWith(DATERANGE)
                    && (Features.has(Feature.ADS_CLIENT) && containsAny(line, CLIENT_AD_CUES)
                    || Features.has(Feature.ADS_PBYP) && containsAny(line, PICTURE_BY_PICTURE_CUES)
                    || stripStitched && containsAny(line, STITCHED_AD_CUES))) {
                continue;
            }
            if (b.length() > 0) b.append('\n');
            b.append(line);
        }
        return b.toString();
    }

    private static boolean containsAny(String line, String[] needles) {
        for (String needle : needles) if (line.contains(needle)) return true;
        return false;
    }

    /** True when two media playlists list a common segment, so they are the same stream. */
    public static boolean shareSegment(String a, String b) {
        for (String line : b.split("\n")) {
            if (!line.isEmpty() && !line.startsWith("#") && a.contains(line.trim())) return true;
        }
        return false;
    }

    /** The channel login of a usher master playlist URL, or null for anything else (VODs, clips). */
    public static String channel(String url) {
        try {
            URI uri = URI.create(url);
            if (!"usher.ttvnw.net".equalsIgnoreCase(uri.getHost()) || uri.getPath() == null) return null;
            Matcher m = CHANNEL.matcher(uri.getPath());
            return m.matches() ? m.group(1).toLowerCase(Locale.ROOT) : null;
        } catch (IllegalArgumentException e) {
            return null;
        }
    }

    /** The player type inside a usher URL's access token, or null. */
    public static String playerType(String usherUrl) {
        Matcher token = TOKEN.matcher(usherUrl);
        if (!token.find()) return null;
        try {
            Matcher type = PLAYER_TYPE.matcher(URLDecoder.decode(token.group(1), "UTF-8"));
            return type.find() ? type.group(1) : null;
        } catch (UnsupportedEncodingException | IllegalArgumentException e) {
            return null;
        }
    }

    /** True when a usher URL opens a preview such as the home feed's, not the stream being watched. */
    public static boolean isPreview(String usherUrl) {
        String type = playerType(usherUrl);
        return type != null && (type.contains("feed") || PREVIEW_TYPES.contains(type));
    }

    /** The path of a URL, which identifies a Twitch playlist even when the query changes. */
    public static String path(String url) {
        try {
            String path = URI.create(url).getPath();
            return path == null || path.length() < 8 ? null : path;
        } catch (IllegalArgumentException e) {
            return null;
        }
    }

    /** Host and the start of the path, for logs; never the query with its tokens. */
    public static String describe(String url) {
        try {
            URI uri = URI.create(url);
            String path = uri.getPath() == null ? "" : uri.getPath();
            return uri.getHost() + (path.length() > 32 ? path.substring(0, 32) + "…" : path);
        } catch (IllegalArgumentException e) {
            return "?";
        }
    }

    /** Copies a usher URL with another access token. Everything else, such as codecs, stays. */
    public static String withToken(String masterUrl, String token, String signature) {
        URI uri = URI.create(masterUrl);
        String raw = uri.getRawQuery();
        Map<String, String> query = new LinkedHashMap<>();
        if (raw != null) {
            for (String pair : raw.split("&")) {
                if (pair.isEmpty()) continue;
                int eq = pair.indexOf('=');
                query.put(eq < 0 ? pair : pair.substring(0, eq), eq < 0 ? "" : pair.substring(eq + 1));
            }
        }
        query.put("token", encode(token));
        query.put("sig", encode(signature));
        query.remove("play_session_id");
        query.put("cache_buster", Long.toString(System.currentTimeMillis()));
        StringBuilder b = new StringBuilder();
        for (Map.Entry<String, String> e : query.entrySet()) {
            if (b.length() > 0) b.append('&');
            b.append(e.getKey()).append('=').append(e.getValue());
        }
        return uri.getScheme() + "://" + uri.getRawAuthority() + uri.getRawPath() + "?" + b;
    }

    private static String encode(String value) {
        try {
            return java.net.URLEncoder.encode(value, "UTF-8").replace("+", "%20");
        } catch (java.io.UnsupportedEncodingException e) {
            throw new IllegalStateException(e);
        }
    }

    /** One rendition of a master playlist. */
    public static final class Variant {
        public final String uri;
        public final String group;
        public final String resolution;
        /** The video codec, or the audio codec of an audio-only rendition; "" when not listed. */
        public final String codec;
        public final double frameRate;
        public final long bandwidth;

        Variant(String uri, Map<String, String> attributes) {
            this.uri = uri;
            this.group = unquote(attributes.get("VIDEO"));
            this.resolution = unquote(attributes.get("RESOLUTION"));
            this.codec = primaryCodec(unquote(attributes.get("CODECS")));
            this.frameRate = parseDouble(attributes.get("FRAME-RATE"));
            this.bandwidth = parseLong(attributes.get("BANDWIDTH"));
        }

        boolean audioOnly() {
            return "audio_only".equals(group) || resolution == null;
        }

        /**
         * The bitstream differs across codecs, so a backup must not switch the decoder mid-stream.
         * Profiles of one codec differ between renditions anyway (source is avc1.64…, the rest avc1.4D…).
         */
        boolean playableInPlaceOf(Variant other) {
            return codec.isEmpty() || other.codec.isEmpty() || family(codec).equals(family(other.codec));
        }

        private static String family(String codec) {
            int dot = codec.indexOf('.');
            return dot < 0 ? codec : codec.substring(0, dot);
        }
    }

    public static List<Variant> variants(String master, String masterUrl) {
        List<Variant> found = new ArrayList<>();
        Map<String, String> pending = null;
        for (String raw : master.split("\n")) {
            String line = raw.trim();
            if (line.startsWith("#EXT-X-STREAM-INF:")) {
                pending = attributes(line.substring("#EXT-X-STREAM-INF:".length()));
            } else if (pending != null && !line.isEmpty() && !line.startsWith("#")) {
                found.add(new Variant(resolve(masterUrl, line), pending));
                pending = null;
            }
        }
        return Collections.unmodifiableList(found);
    }

    /** The backup rendition that best matches what the player chose from the primary session. */
    public static Variant match(List<Variant> all, Variant wanted) {
        List<Variant> candidates = new ArrayList<>(all.size());
        for (Variant v : all) if (v.playableInPlaceOf(wanted)) candidates.add(v);
        if (candidates.isEmpty()) return null;
        for (Variant v : candidates) if (wanted.group != null && wanted.group.equals(v.group)) return v;
        for (Variant v : candidates) {
            if (wanted.resolution != null && wanted.resolution.equals(v.resolution)
                    && Math.abs(wanted.frameRate - v.frameRate) < 1) return v;
        }
        if (wanted.audioOnly()) {
            for (Variant v : candidates) if (v.audioOnly()) return v;
        }
        Variant best = null;
        for (Variant v : candidates) {
            if (v.audioOnly()) continue;
            boolean fits = v.bandwidth <= wanted.bandwidth;
            if (best == null) {
                best = v;
            } else if (fits && (best.bandwidth > wanted.bandwidth || v.bandwidth > best.bandwidth)) {
                best = v;
            } else if (!fits && best.bandwidth > wanted.bandwidth && v.bandwidth < best.bandwidth) {
                best = v;
            }
        }
        return best;
    }

    static Map<String, String> attributes(String list) {
        Map<String, String> map = new LinkedHashMap<>();
        Matcher m = ATTRIBUTE.matcher(list);
        while (m.find()) map.put(m.group(1), m.group(2));
        return map;
    }

    private static String primaryCodec(String codecs) {
        if (codecs == null) return "";
        String[] parts = codecs.toLowerCase(Locale.ROOT).split(",");
        for (String part : parts) if (!part.trim().startsWith("mp4a.")) return part.trim();
        return parts[0].trim();
    }

    private static String unquote(String value) {
        if (value == null) return null;
        return value.length() >= 2 && value.startsWith("\"") && value.endsWith("\"")
                ? value.substring(1, value.length() - 1) : value;
    }

    private static double parseDouble(String value) {
        try {
            return value == null ? 0 : Double.parseDouble(unquote(value));
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private static long parseLong(String value) {
        try {
            return value == null ? 0 : Long.parseLong(unquote(value));
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private static String resolve(String base, String uri) {
        try {
            return URI.create(base).resolve(uri).toString();
        } catch (IllegalArgumentException e) {
            return uri;
        }
    }
}
