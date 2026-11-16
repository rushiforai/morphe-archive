package app.morphed.extension.twitch.musicfilter;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import app.morphed.extension.twitch.net.JsonParser;
import app.morphed.extension.twitch.net.Web;

/**
 * Finds a song's clean copy on YouTube Music (album recordings), then YouTube (music videos, lyric uploads, game
 * soundtracks), and downloads its sound. Uses YouTube's own API with the client yt-dlp uses by default (no
 * puzzles to solve, direct links).
 */
public final class YouTubeClient {
    public static final int CANDIDATES = 3; // each search's top results tried, in order
    private static final String MUSIC_SEARCH = "https://music.youtube.com/youtubei/v1/search?prettyPrint=false";
    private static final String SEARCH = "https://www.youtube.com/youtubei/v1/search?prettyPrint=false";
    private static final String PLAYER = "https://www.youtube.com/youtubei/v1/player?prettyPrint=false";
    private static final String SONGS_ONLY = "EgWKAQIIAWoMEA4QChADEAQQCRAF";
    private static final String VISION_UA = "Mozilla/5.0 (Macintosh; Intel Mac OS X 15_7_3) AppleWebKit/605.1.15 "
            + "(KHTML, like Gecko) Version/26.0 Safari/605.1.15";
    private static final int CHUNK = 10 * 1024 * 1024; // YouTube slows down single requests for more
    static final long MAX_SECONDS = 10 * 60; // longer isn't one song (and wouldn't fit in memory)
    static final long MAX_BYTES = 40L * 1024 * 1024;

    /** Waits for YouTube's pre-roll time; replaced in tests. */
    public interface Sleeper {
        void sleep(long ms) throws InterruptedException;
    }

    private final Web web;
    private final Sleeper sleeper;
    /** The pre-roll wait of the last download, for the debug log's timings. */
    volatile long lastWaitMs;
    private volatile String visitorData;

    public YouTubeClient(Web web) {
        this(web, Thread::sleep);
    }

    YouTubeClient(Web web, Sleeper sleeper) {
        this.web = web;
        this.sleeper = sleeper;
    }

    /** A source's top results for a song (none when it hasn't got it); SongProblem when the search failed. */
    public List<String> search(Song song, boolean music) throws SongProblem {
        String words = (song.artist + " " + song.title).trim();
        String source = music ? "YouTube Music" : "YouTube";
        String body = "{\"context\":{\"client\":{\"clientName\":\"" + (music ? "WEB_REMIX" : "WEB")
                + "\",\"clientVersion\":\"" + (music ? "1.20251110.01.00" : "2.20251110.01.00")
                + "\",\"hl\":\"en\",\"gl\":\"US\"}},\"query\":" + JsonParser.quote(words)
                + (music ? ",\"params\":\"" + SONGS_ONLY + "\"" : "") + "}";
        Web.Response response;
        try {
            response = web.send(Web.Request.post(music ? MUSIC_SEARCH : SEARCH, body, "application/json")
                    .header("Origin", music ? "https://music.youtube.com" : "https://www.youtube.com")
                    .header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 "
                            + "(KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36")
                    .timeout(15_000));
        } catch (IOException error) {
            throw new SongProblem("Searching " + source + " for " + song + " failed: " + Reasons.of(error), error);
        }
        if (!response.ok()) {
            throw new SongProblem("Searching " + source + " for " + song + " failed: " + Reasons.status(response.status));
        }
        Object answer;
        try {
            answer = JsonParser.parse(response.text());
        } catch (IllegalArgumentException error) {
            throw new SongProblem("Searching " + source + " for " + song + " failed: its answer couldn't be read", error);
        }
        String visitor = JsonParser.string(answer, "responseContext", "visitorData");
        if (visitor != null) visitorData = visitor;
        return videoIds(answer, music ? "musicResponsiveListItemRenderer" : "videoRenderer");
    }

    /** The first video id inside each result of this kind, the first CANDIDATES. */
    static List<String> videoIds(Object answer, String renderer) {
        List<Object> results = new ArrayList<>();
        JsonParser.collect(answer, renderer, results);
        List<String> ids = new ArrayList<>();
        for (Object result : results) {
            List<Object> found = new ArrayList<>();
            JsonParser.collect(result, "videoId", found);
            for (Object id : found) {
                if (id instanceof String && !((String) id).isEmpty()) {
                    if (!ids.contains(id)) ids.add((String) id);
                    break;
                }
            }
            if (ids.size() >= CANDIDATES) break;
        }
        return ids;
    }

    /** An audio stream of a video: its address, size and file type. */
    static final class Stream {
        final String url;
        final long length;
        final String extension;
        final long waitMs;

        Stream(String url, long length, String extension, long waitMs) {
            this.url = url;
            this.length = length;
            this.extension = extension;
            this.waitMs = waitMs;
        }
    }

    Stream stream(String videoId) throws SongProblem {
        String body = "{\"context\":{\"client\":{\"clientName\":\"VISIONOS\",\"clientVersion\":\"1.02\","
                + "\"deviceMake\":\"Apple\",\"deviceModel\":\"RealityDevice17,1\",\"userAgent\":" + JsonParser.quote(VISION_UA)
                + ",\"osName\":\"visionOS\",\"osVersion\":\"26.5.23O471\",\"hl\":\"en\",\"timeZone\":\"UTC\","
                + "\"utcOffsetMinutes\":0}},\"videoId\":" + JsonParser.quote(videoId)
                + ",\"playbackContext\":{\"contentPlaybackContext\":{\"html5Preference\":\"HTML5_PREF_WANTS\"}},"
                + "\"contentCheckOk\":true,\"racyCheckOk\":true}";
        Web.Request request = Web.Request.post(PLAYER, body, "application/json")
                .header("User-Agent", VISION_UA)
                .header("X-YouTube-Client-Name", "101")
                .header("X-YouTube-Client-Version", "1.02")
                .header("Origin", "https://www.youtube.com")
                .timeout(15_000);
        if (visitorData != null) request.header("X-Goog-Visitor-Id", visitorData);
        Web.Response response;
        try {
            response = web.send(request);
        } catch (IOException error) {
            throw new SongProblem("YouTube couldn't be reached: " + Reasons.of(error), error);
        }
        if (!response.ok()) throw new SongProblem("YouTube " + Reasons.status(response.status));
        Object answer;
        try {
            answer = JsonParser.parse(response.text());
        } catch (IllegalArgumentException error) {
            throw new SongProblem("YouTube's answer couldn't be read", error);
        }
        return pick(answer);
    }

    /** The best audio stream in a player answer: Opus (48 kHz, no resampling) first, then the highest bitrate. */
    static Stream pick(Object answer) throws SongProblem {
        String status = JsonParser.string(answer, "playabilityStatus", "status");
        String seconds = JsonParser.string(answer, "videoDetails", "lengthSeconds");
        if (seconds != null && "OK".equals(status)) {
            try {
                long length = Long.parseLong(seconds);
                // A long mix or an hour-long upload is no song's copy, and too big for the phone to hold.
                if (length > MAX_SECONDS) throw new SongProblem((length / 60) + " minutes long, too long for a song's copy");
            } catch (NumberFormatException ignored) {
                // no length given: the download's own size is the limit
            }
        }
        if (!"OK".equals(status)) {
            String reason = JsonParser.string(answer, "playabilityStatus", "reason");
            String text = reason == null ? String.valueOf(status) : reason;
            String lowered = text.toLowerCase(java.util.Locale.ROOT);
            if (lowered.contains("sign in") || lowered.contains("login")) text = "YouTube wants a login for this one";
            throw new SongProblem(text.length() > 120 ? text.substring(0, 120) : text);
        }
        List<?> formats = JsonParser.list(answer, "streamingData", "adaptiveFormats");
        Map<?, ?> best = null;
        int bestRank = -1;
        if (formats != null) {
            for (Object format : formats) {
                if (!(format instanceof Map)) continue;
                Map<?, ?> f = (Map<?, ?>) format;
                String mime = JsonParser.string(f, "mimeType");
                String url = JsonParser.string(f, "url");
                if (mime == null || url == null || !mime.startsWith("audio/")) continue;
                Object bitrate = f.get("bitrate");
                int rank = (mime.contains("opus") ? 1_000_000_000 : 0)
                        + (bitrate instanceof Double ? ((Double) bitrate).intValue() / 1000 : 0);
                if (rank > bestRank) {
                    bestRank = rank;
                    best = f;
                }
            }
        }
        if (best == null) throw new SongProblem("YouTube gave no sound to download");
        String mime = JsonParser.string(best, "mimeType");
        String length = JsonParser.string(best, "contentLength");
        return new Stream(JsonParser.string(best, "url"), length == null ? -1 : Long.parseLong(length),
                mime.startsWith("audio/webm") ? "webm" : "m4a", preRollWaitMs(answer));
    }

    /** YouTube hands out the stream only after the pre-roll ad's time: that long, as yt-dlp waits. */
    static long preRollWaitMs(Object answer) {
        List<?> placements = JsonParser.list(answer, "adPlacements");
        if (placements == null) return 0;
        double seconds = 0;
        for (Object placement : placements) {
            if (!"AD_PLACEMENT_KIND_START".equals(JsonParser.string(placement, "adPlacementRenderer", "config",
                    "adPlacementConfig", "kind"))) continue;
            Object ad = JsonParser.at(placement, "adPlacementRenderer", "renderer", "instreamVideoAdRenderer");
            if (ad == null) continue;
            Object skip = JsonParser.at(ad, "skipOffsetMilliseconds");
            if (skip instanceof Double) {
                seconds += (Double) skip / 1000.0;
                continue;
            }
            String vars = JsonParser.string(ad, "playerVars");
            if (vars == null) continue;
            for (String part : vars.split("&")) {
                if (part.startsWith("length_seconds=")) {
                    try {
                        seconds += Double.parseDouble(part.substring("length_seconds=".length()));
                    } catch (NumberFormatException ignored) {
                        // not a length: nothing to wait for
                    }
                }
            }
        }
        return (long) Math.ceil(seconds * 1000);
    }

    /** Downloads a video's sound into folder as {videoId}.{webm|m4a}; SongProblem saying why when it can't. */
    public File download(String videoId, File folder) throws SongProblem {
        Stream stream = stream(videoId);
        if (stream.length > MAX_BYTES) throw new SongProblem("the download is too big for a song's copy");
        try {
            lastWaitMs = stream.waitMs;
            if (stream.waitMs > 0) sleeper.sleep(stream.waitMs);
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            throw new SongProblem("the download was stopped");
        }
        if (!folder.isDirectory() && !folder.mkdirs()) throw new SongProblem("the song folder couldn't be made");
        File part = new File(folder, videoId + ".part");
        File done = new File(folder, videoId + "." + stream.extension);
        try (OutputStream out = new FileOutputStream(part)) {
            long at = 0;
            while (stream.length < 0 || at < stream.length) {
                long end = stream.length < 0 ? at + CHUNK - 1 : Math.min(at + CHUNK, stream.length) - 1;
                Web.Response response = web.send(Web.Request.get(stream.url + "&range=" + at + "-" + end)
                        .header("User-Agent", VISION_UA).timeout(20_000));
                if (!response.ok()) throw new SongProblem("YouTube refused the download (" + response.status + ")");
                out.write(response.body);
                at += response.body.length;
                if (at > MAX_BYTES) throw new SongProblem("the download is too big for a song's copy");
                if (response.body.length == 0 || (stream.length < 0 && response.body.length < CHUNK)) break;
            }
        } catch (IOException error) {
            //noinspection ResultOfMethodCallIgnored
            part.delete();
            throw new SongProblem("the download failed: " + Reasons.of(error), error);
        } catch (SongProblem problem) {
            //noinspection ResultOfMethodCallIgnored
            part.delete();
            throw problem;
        }
        if (part.length() == 0) { // nothing came: never kept as a song's copy
            //noinspection ResultOfMethodCallIgnored
            part.delete();
            throw new SongProblem("YouTube sent nothing to download");
        }
        if (!part.renameTo(done)) throw new SongProblem("the download couldn't be saved");
        return done;
    }
}
