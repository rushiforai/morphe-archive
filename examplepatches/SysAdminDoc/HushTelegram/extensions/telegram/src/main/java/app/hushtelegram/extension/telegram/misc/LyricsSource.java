/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ScheduledFuture;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Song lyrics from lrclib.net, a free lyrics library that needs no key or account. A search by
 * title and artist returns candidates, each with its length, and the one as long as the song wins,
 * timed lyrics first. Timed lyrics are LRC text: each line starts with when it's sung, [mm:ss.xx].
 *
 * <p>Only the song's title and artist leave the phone. The fetch blocks, so it runs on a worker
 * thread only, with the same timeouts and deadline as {@link GoogleTranslate}.
 */
final class LyricsSource {
    private LyricsSource() {}

    static final String SEARCH = "https://lrclib.net/api/search";
    static final int CONNECT_MS = 6000;
    static final int READ_MS = 8000;
    /** The most one search may take. */
    static long totalMs = 20_000L;
    private static final int MAX_ANSWER = 2 * 1024 * 1024;
    /** How far a candidate's length may be from the song's, in seconds. */
    static final double SLACK = 4;

    private static final Pattern TIME = Pattern.compile("\\[(\\d{1,3}):(\\d{1,2})(?:[.:](\\d{1,3}))?]");
    private static final Pattern OFFSET = Pattern.compile("^\\s*\\[offset:\\s*([+-]?\\d+)\\s*]\\s*$", Pattern.CASE_INSENSITIVE);
    private static final Pattern WORD_TIME = Pattern.compile("<\\d{1,3}:\\d{1,2}(?:[.:]\\d{1,3})?>");
    private static final Pattern FILE_TYPE = Pattern.compile("\\.(mp3|m4a|aac|flac|ogg|oga|opus|wav|wma|alac)$", Pattern.CASE_INSENSITIVE);
    private static final Pattern NOISE = Pattern.compile(
            "\\s*[(\\[][^)\\]]*(official|video|audio|lyric|visuali[sz]er|\\bhd\\b|\\bhq\\b|\\bmv\\b)[^)\\]]*[)\\]]",
            Pattern.CASE_INSENSITIVE);

    /** One timed line: when it starts, in milliseconds from the song's start, and its words. */
    static final class Line {
        final long ms;
        final String text;

        Line(long ms, String text) {
            this.ms = ms;
            this.text = text;
        }
    }

    /** What the search found. */
    static final class Found {
        /** The timed lines, earliest first, or null when the lyrics have no times. */
        final List<Line> lines;
        /** The lyrics without times, or null when they have them. */
        final String plain;
        /** True when the song is listed as having no words. */
        final boolean instrumental;

        Found(List<Line> lines, String plain, boolean instrumental) {
            this.lines = lines;
            this.plain = plain;
            this.instrumental = instrumental;
        }
    }

    /** The title and artist to search for, cleaned of a file ending and video words like (Official Video). */
    static String[] terms(String title, String artist) {
        String song = title == null ? "" : FILE_TYPE.matcher(title.trim()).replaceFirst("");
        String singer = artist == null ? "" : artist.trim();
        if (singer.isEmpty()) {
            // A file with no tags is usually named "Artist - Title".
            int dash = song.indexOf(" - ");
            if (dash > 0) {
                singer = song.substring(0, dash).trim();
                song = song.substring(dash + 3).trim();
            }
        }
        song = NOISE.matcher(song).replaceAll("").trim();
        return new String[] {song, singer};
    }

    static String address(String title, String artist) {
        if (artist.isEmpty()) return SEARCH + "?q=" + GoogleTranslate.encode(title);
        return SEARCH + "?track_name=" + GoogleTranslate.encode(title) + "&artist_name=" + GoogleTranslate.encode(artist);
    }

    /** A looser search over every field, for when the exact one finds nothing. */
    static String looseAddress(String title, String artist) {
        String words = artist.isEmpty() ? title : title + " " + artist;
        return SEARCH + "?q=" + GoogleTranslate.encode(words);
    }

    /**
     * The best of the candidates for a song {@code seconds} long, or null. Timed lyrics win over
     * plain ones; a candidate whose length is off by more than {@link #SLACK} is skipped unless
     * the song's own length is unknown.
     */
    static Found choose(JSONArray results, double seconds) {
        Found plain = null;
        Found instrumental = null;
        for (int i = 0; i < results.length(); i++) {
            JSONObject entry = results.optJSONObject(i);
            if (entry == null) continue;
            double length = entry.optDouble("duration", 0);
            if (seconds > 0 && length > 0 && Math.abs(length - seconds) > SLACK) continue;
            String synced = text(entry, "syncedLyrics");
            if (synced != null) {
                List<Line> lines = parse(synced);
                if (!lines.isEmpty()) return new Found(lines, null, false);
            }
            String words = text(entry, "plainLyrics");
            if (plain == null && words != null) plain = new Found(null, words.trim(), false);
            if (instrumental == null && entry.optBoolean("instrumental", false)) instrumental = new Found(null, null, true);
        }
        return plain != null ? plain : instrumental;
    }

    private static String text(JSONObject entry, String name) {
        if (entry.isNull(name)) return null;
        String value = entry.optString(name, "");
        return value.trim().isEmpty() ? null : value;
    }

    /**
     * The timed lines of LRC text, earliest first. A line can carry several times when it's sung
     * more than once; tags like [ar:...] and word times like {@code <00:12.30>} are dropped, and an
     * [offset:ms] tag moves every line earlier by that much.
     */
    static List<Line> parse(String lrc) {
        List<Line> lines = new ArrayList<>();
        long offset = 0;
        for (String raw : lrc.split("\r\n|\r|\n")) {
            Matcher shift = OFFSET.matcher(raw);
            if (shift.matches()) {
                try {
                    offset = Long.parseLong(shift.group(1).replace("+", ""));
                } catch (NumberFormatException ignored) {
                    // A broken offset tag changes nothing.
                }
                continue;
            }
            Matcher time = TIME.matcher(raw);
            List<Long> times = new ArrayList<>();
            int end = 0;
            while (time.find() && time.start() == end) {
                times.add(ms(time));
                end = time.end();
            }
            if (times.isEmpty()) continue;
            String text = WORD_TIME.matcher(raw.substring(end)).replaceAll("").trim();
            for (long at : times) lines.add(new Line(at, text));
        }
        if (offset != 0) {
            List<Line> shifted = new ArrayList<>(lines.size());
            for (Line line : lines) shifted.add(new Line(Math.max(0, line.ms - offset), line.text));
            lines = shifted;
        }
        Collections.sort(lines, (a, b) -> Long.compare(a.ms, b.ms));
        return lines;
    }

    private static long ms(Matcher time) {
        long minutes = Long.parseLong(time.group(1));
        long seconds = Long.parseLong(time.group(2));
        String part = time.group(3);
        long fraction = 0;
        if (part != null) {
            // .5 is half a second, .05 is 50 ms and .005 is 5 ms.
            fraction = Long.parseLong(part);
            for (int digits = part.length(); digits < 3; digits++) fraction *= 10;
        }
        return (minutes * 60 + seconds) * 1000 + fraction;
    }

    /** The line sung at {@code ms}: the last one that started by then, or -1 before the first. */
    static int at(List<Line> lines, long ms) {
        int low = 0;
        int high = lines.size() - 1;
        int found = -1;
        while (low <= high) {
            int middle = (low + high) >>> 1;
            if (lines.get(middle).ms <= ms) {
                found = middle;
                low = middle + 1;
            } else {
                high = middle - 1;
            }
        }
        return found;
    }

    /**
     * Searches for the song, then searches more loosely when that finds nothing.
     *
     * @return the lyrics, or null when lrclib.net has none for it
     */
    static Found fetch(String title, String artist, double seconds) throws IOException, JSONException {
        String[] terms = terms(title, artist);
        if (terms[0].isEmpty()) return null;
        Found found = choose(new JSONArray(get(address(terms[0], terms[1]))), seconds);
        if (found != null || terms[1].isEmpty()) return found;
        return choose(new JSONArray(get(looseAddress(terms[0], terms[1]))), seconds);
    }

    private static String get(String address) throws IOException {
        long deadline = GoogleTranslate.deadline(totalMs);
        HttpURLConnection connection = (HttpURLConnection) new URL(address).openConnection();
        ScheduledFuture<?> watchdog = GoogleTranslate.closeAt(connection, deadline);
        try {
            connection.setConnectTimeout(CONNECT_MS);
            connection.setReadTimeout(READ_MS);
            connection.setInstanceFollowRedirects(false);
            // lrclib.net asks apps to name themselves.
            connection.setRequestProperty("User-Agent", "HushTelegram (https://github.com/SysAdminDoc/HushTelegram)");
            int code = connection.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) throw new IOException("lrclib answered " + code);
            return GoogleTranslate.read(connection.getInputStream(), MAX_ANSWER, "lyrics answer too large", deadline);
        } finally {
            watchdog.cancel(false);
            connection.disconnect();
        }
    }
}
