/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.extension.yandexmusic.lyrics;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.Normalizer;
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
 * Pure Java part of the LRCLIB lyrics: no Android classes, so it is unit tested on the JVM.
 */
public final class LrcLibCore {
    public static final String BASE_URL = "https://lrclib.net/api/";

    /** Format names of the app's lyrics format enum (TEXT, LRC, RICH_JSON). */
    public static final String FORMAT_LRC = "LRC";
    public static final String FORMAT_TEXT = "TEXT";

    /** Maximum duration difference, in seconds, accepted for a search result. */
    static final int SEARCH_DURATION_TOLERANCE = 3;

    private static final Pattern TIMESTAMP =
            Pattern.compile("\\[(\\d{1,3}):(\\d{1,2})(?:[.:](\\d{1,3}))?]");

    /** A timestamp at the start of a normalized LRC line: {@code [mm:ss.xx]}. */
    private static final Pattern NORMALIZED_TIMESTAMP = Pattern.compile("^\\[(\\d{2,}):(\\d{2})\\.(\\d{2})]");

    /** Words that start a credit inside brackets or at the end of a title: "(feat. X)", "ft. X". */
    private static final Set<String> CREDIT_WORDS = new HashSet<>(Arrays.asList(
            "feat", "ft", "featuring", "with", "prod", "при", "уч"));

    /**
     * Words that mark a release variant rather than different lyrics: "(Remastered 2011)",
     * "- Radio Edit", "[Live]". Remixes are kept: their timing usually differs.
     */
    private static final Set<String> VARIANT_WORDS = new HashSet<>(Arrays.asList(
            "remaster", "remastered", "live", "edit", "version", "mono", "stereo", "deluxe", "bonus",
            "explicit", "clean", "single", "anniversary", "ремастер", "версия"));

    /** Prefix of a lyrics cache entry; see {@link #encodeCacheEntry}. */
    static final String CACHE_MAGIC = "nyandex-lyrics-1";
    static final String CACHE_NONE = "NONE";

    private LrcLibCore() {
    }

    // region URLs

    public static String encode(String value) {
        try {
            // URLEncoder produces form encoding; LRCLIB expects %20 for spaces.
            return URLEncoder.encode(value, "UTF-8").replace("+", "%20");
        } catch (UnsupportedEncodingException e) {
            throw new IllegalStateException(e);
        }
    }

    /** /api/get with exact artist, title and duration (LRCLIB matches duration within ±2 s). */
    public static String buildGetUrl(String artist, String title, long durationSeconds) {
        StringBuilder url = new StringBuilder(BASE_URL)
                .append("get?artist_name=").append(encode(artist))
                .append("&track_name=").append(encode(title));
        if (durationSeconds > 0) {
            url.append("&duration=").append(durationSeconds);
        }
        return url.toString();
    }

    public static String buildSearchUrl(String artist, String title) {
        StringBuilder url = new StringBuilder(BASE_URL)
                .append("search?track_name=").append(encode(title));
        if (artist != null && !artist.isEmpty()) {
            url.append("&artist_name=").append(encode(artist));
        }
        return url.toString();
    }

    /** Duration in whole seconds, rounded, from the app's duration in milliseconds. */
    public static long secondsFromMillis(long durationMs) {
        return durationMs <= 0 ? 0 : (durationMs + 500) / 1000;
    }

    /** Free-text search over artist, title and album: /api/search?q=. */
    public static String buildQuerySearchUrl(String query) {
        return BASE_URL + "search?q=" + encode(query);
    }

    /**
     * Artist queries to try: all artists joined as LRCLIB usually stores them ("A, B", then
     * "A & B"), then the first artist. The first artist is always last.
     */
    public static List<String> artistCandidates(List<String> artists) {
        List<String> result = new ArrayList<>();
        if (artists == null || artists.isEmpty()) {
            return result;
        }
        String joined = join(artists, ", ");
        if (!joined.isEmpty()) {
            result.add(joined);
        }
        String ampersand = join(artists, " & ");
        if (!ampersand.isEmpty() && !result.contains(ampersand)) {
            result.add(ampersand);
        }
        String first = artists.get(0) == null ? "" : artists.get(0).trim();
        if (!first.isEmpty() && !result.contains(first)) {
            result.add(first);
        }
        return result;
    }

    static String join(List<String> values, String separator) {
        StringBuilder builder = new StringBuilder();
        for (String value : values) {
            if (value == null) continue;
            String trimmed = value.trim();
            if (trimmed.isEmpty()) continue;
            if (builder.length() > 0) builder.append(separator);
            builder.append(trimmed);
        }
        return builder.toString();
    }

    /** Titles to try: the title as the app has it, then {@link #cleanTitle} if it differs. */
    public static List<String> titleCandidates(String title) {
        List<String> result = new ArrayList<>();
        if (title == null || title.trim().isEmpty()) return result;
        result.add(title.trim());
        String clean = cleanTitle(title);
        if (!clean.isEmpty() && !result.contains(clean)) result.add(clean);
        return result;
    }

    /**
     * Remove what LRCLIB titles usually do not have: credits ("(feat. X)", "[ft. X]",
     * " feat. X" at the end) and release variants ("(Remastered 2011)", " - Radio Edit",
     * "[Live]"). Other brackets such as "(Acoustic)" or "(Remix)" stay. Returns the trimmed
     * title unchanged when nothing would be left.
     */
    public static String cleanTitle(String title) {
        if (title == null) return "";
        String original = title.trim();
        StringBuilder result = new StringBuilder();
        int position = 0;
        while (position < original.length()) {
            char c = original.charAt(position);
            int close = c == '(' ? original.indexOf(')', position) : c == '[' ? original.indexOf(']', position) : -1;
            if (close > position) {
                List<String> words = words(original.substring(position + 1, close));
                if (!words.isEmpty() && (CREDIT_WORDS.contains(words.get(0)) || containsAny(words, VARIANT_WORDS))) {
                    position = close + 1;
                    continue;
                }
            }
            result.append(c);
            position++;
        }
        String clean = result.toString().replaceAll("\\s+", " ").trim();

        // " - Remastered 2011", " – Live at Wembley": the part after the last dash.
        int dash = Math.max(clean.lastIndexOf(" - "), Math.max(clean.lastIndexOf(" \u2013 "), clean.lastIndexOf(" \u2014 ")));
        if (dash > 0 && containsAny(words(clean.substring(dash + 3)), VARIANT_WORDS)) {
            clean = clean.substring(0, dash).trim();
        }

        // " feat. X" without brackets, to the end of the title.
        List<String> tokens = new ArrayList<>(Arrays.asList(clean.split(" ")));
        for (int i = 1; i < tokens.size(); i++) {
            String word = tokens.get(i).toLowerCase(Locale.ROOT);
            if (word.equals("feat.") || word.equals("feat") || word.equals("ft.") || word.equals("featuring")) {
                clean = join(tokens.subList(0, i), " ");
                break;
            }
        }
        return clean.isEmpty() ? original : clean;
    }

    /** Lowercase letter-and-digit words of a text. */
    static List<String> words(String text) {
        List<String> result = new ArrayList<>();
        for (String word : text.toLowerCase(Locale.ROOT).split("[^\\p{L}\\p{N}]+")) {
            if (!word.isEmpty()) result.add(word);
        }
        return result;
    }

    private static boolean containsAny(List<String> words, Set<String> set) {
        for (String word : words) {
            if (set.contains(word)) return true;
        }
        return false;
    }

    /**
     * Name for comparison: lowercase, without accents and punctuation, ё as е.
     * "Beyoncé" and "BEYONCE" compare equal, as do "AC/DC" and "ACDC".
     */
    static String normalizeName(String name) {
        if (name == null) return "";
        String decomposed = Normalizer.normalize(name.toLowerCase(Locale.ROOT).replace('ё', 'е'), Normalizer.Form.NFKD);
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < decomposed.length(); i++) {
            char c = decomposed.charAt(i);
            if (Character.isLetterOrDigit(c)) result.append(c);
        }
        return result.toString();
    }

    /**
     * Whether a search result's artist belongs to the track: one of the track's artists is part
     * of the result's artist ("Imagine Dragons" in "Imagine Dragons & JID") or the other way round.
     */
    public static boolean artistMatches(List<String> artists, String recordArtist) {
        String record = normalizeName(recordArtist);
        if (record.isEmpty() || artists == null) return false;
        for (String artist : artists) {
            String normalized = normalizeName(artist);
            if (normalized.length() < 2) continue;
            if (record.contains(normalized) || normalized.contains(record)) return true;
        }
        return false;
    }

    // endregion

    // region Retries

    /** Attempts per request: the first one and two retries. */
    public static final int MAX_ATTEMPTS = 3;
    /**
     * Pause before the first retry when LRCLIB gave no Retry-After; it doubles for each
     * further retry (1 s, then 2 s).
     */
    static final long RETRY_DELAY_MS = 1000;
    /** Longest Retry-After waited for; LRCLIB asking for a longer pause is not retried. */
    static final long MAX_RETRY_AFTER_MS = 5000;

    /**
     * A Retry-After header in milliseconds. Only the delay-seconds form is read; an HTTP date
     * or a malformed value gives -1, as does a missing header.
     */
    public static long parseRetryAfterMs(String header) {
        if (header == null) return -1;
        String value = header.trim();
        if (value.isEmpty() || value.length() > 9) return -1;
        for (int i = 0; i < value.length(); i++) {
            if (value.charAt(i) < '0' || value.charAt(i) > '9') return -1;
        }
        return Long.parseLong(value) * 1000;
    }

    /**
     * How long to wait before retrying a failed request, or -1 to not retry.
     *
     * Network errors (status 0), 408, 429 and temporary server errors (5xx, including
     * Cloudflare's 52x, but not 501/505) are retried until {@link #MAX_ATTEMPTS} attempts were
     * made. Other statuses mean the request itself is wrong and would fail again. LRCLIB's
     * Retry-After is honored: the retry waits that long, and a pause longer than
     * {@link #MAX_RETRY_AFTER_MS} is not retried at all.
     *
     * @param attempt      The attempt that just failed, from 1.
     * @param status       The HTTP status, or 0 when no response arrived.
     * @param retryAfterMs {@link #parseRetryAfterMs} of the response, or -1.
     */
    public static long retryDelayMs(int attempt, int status, long retryAfterMs) {
        if (attempt < 1 || attempt >= MAX_ATTEMPTS) return -1;
        boolean temporary = status <= 0 || status == 408 || status == 429
                || (status >= 500 && status <= 599 && status != 501 && status != 505);
        if (!temporary) return -1;
        if (retryAfterMs < 0) return RETRY_DELAY_MS << (attempt - 1);
        return retryAfterMs <= MAX_RETRY_AFTER_MS ? retryAfterMs : -1;
    }

    // endregion

    // region Lyrics selection

    /**
     * Choose the lyrics for the requested format from one LRCLIB record.
     *
     * Synced lyrics are preferred and returned as LRC. If only plain lyrics exist they are
     * returned as TEXT. When the app asked for TEXT, synced lyrics are stripped of timestamps
     * if no plain lyrics are available.
     *
     * @return {formatName, content}, or null if the record has no usable lyrics.
     */
    public static String[] chooseLyrics(Map<String, Object> record, String requestedFormat) {
        if (record == null) return null;
        if (Boolean.TRUE.equals(record.get("instrumental"))) return null;

        String synced = stringValue(record.get("syncedLyrics"));
        String plain = stringValue(record.get("plainLyrics"));

        if (FORMAT_TEXT.equals(requestedFormat)) {
            if (!isBlank(plain)) return new String[]{FORMAT_TEXT, plain.trim()};
            if (!isBlank(synced)) {
                String stripped = stripTimestamps(synced);
                if (!isBlank(stripped)) return new String[]{FORMAT_TEXT, stripped};
            }
            return null;
        }

        if (!isBlank(synced)) {
            String normalized = normalizeLrc(synced);
            if (!normalized.isEmpty()) return new String[]{FORMAT_LRC, normalized};
        }
        if (!isBlank(plain)) return new String[]{FORMAT_TEXT, plain.trim()};
        return null;
    }

    /**
     * Pick the best record from an /api/search result: closest duration within the tolerance,
     * synced lyrics first.
     */
    public static Map<String, Object> pickSearchResult(List<Object> results, long durationSeconds) {
        return pickSearchResult(results, durationSeconds, null);
    }

    /**
     * Like {@link #pickSearchResult(List, long)}, and when {@code artists} is not null the
     * result's artist must match one of them ({@link #artistMatches}). Used for searches that
     * LRCLIB does not filter by artist.
     */
    public static Map<String, Object> pickSearchResult(List<Object> results, long durationSeconds, List<String> artists) {
        if (results == null) return null;
        Map<String, Object> best = null;
        long bestScore = Long.MAX_VALUE;
        for (Object item : results) {
            if (!(item instanceof Map)) continue;
            @SuppressWarnings("unchecked")
            Map<String, Object> record = (Map<String, Object>) item;
            if (Boolean.TRUE.equals(record.get("instrumental"))) continue;
            if (artists != null && !artistMatches(artists, stringValue(record.get("artistName")))) continue;

            boolean hasSynced = !isBlank(stringValue(record.get("syncedLyrics")));
            boolean hasPlain = !isBlank(stringValue(record.get("plainLyrics")));
            if (!hasSynced && !hasPlain) continue;

            long difference = 0;
            if (durationSeconds > 0) {
                Object duration = record.get("duration");
                if (!(duration instanceof Number)) continue;
                difference = Math.abs(Math.round(((Number) duration).doubleValue()) - durationSeconds);
                if (difference > SEARCH_DURATION_TOLERANCE) continue;
            }

            long score = difference * 2 + (hasSynced ? 0 : 1);
            if (score < bestScore) {
                bestScore = score;
                best = record;
            }
        }
        return best;
    }

    // endregion

    // region LRC

    /**
     * Normalize LRC for the app's parser, which only accepts {@code [mm:ss.xx]text}:
     * minutes are padded to two digits, milliseconds are truncated to hundredths, missing
     * fractions become {@code .00}, a line with several timestamps is split into one line per
     * timestamp, metadata tags and untimed lines are dropped, and lines are sorted by time.
     */
    public static String normalizeLrc(String lrc) {
        if (lrc == null) return "";
        List<long[]> order = new ArrayList<>();
        List<String> lines = new ArrayList<>();

        for (String rawLine : lrc.replace("\r\n", "\n").replace('\r', '\n').split("\n")) {
            Matcher matcher = TIMESTAMP.matcher(rawLine);
            List<Long> times = new ArrayList<>();
            int textStart = 0;
            while (matcher.find() && matcher.start() == textStart) {
                long minutes = Long.parseLong(matcher.group(1));
                long seconds = Long.parseLong(matcher.group(2));
                String fraction = matcher.group(3);
                long hundredths = 0;
                if (fraction != null) {
                    if (fraction.length() == 1) hundredths = Long.parseLong(fraction) * 10;
                    else hundredths = Long.parseLong(fraction.substring(0, 2));
                }
                times.add((minutes * 60 + seconds) * 100 + hundredths);
                textStart = matcher.end();
            }
            if (times.isEmpty()) continue;

            String text = rawLine.substring(textStart).trim();
            for (long time : times) {
                order.add(new long[]{time, lines.size()});
                lines.add(formatTimestamp(time) + text);
            }
        }

        Collections.sort(order, (a, b) -> {
            int byTime = Long.compare(a[0], b[0]);
            return byTime != 0 ? byTime : Long.compare(a[1], b[1]);
        });

        StringBuilder result = new StringBuilder();
        for (long[] entry : order) {
            if (result.length() > 0) result.append('\n');
            result.append(lines.get((int) entry[1]));
        }
        return result.toString();
    }

    static String formatTimestamp(long hundredthsTotal) {
        long minutes = hundredthsTotal / 6000;
        long seconds = (hundredthsTotal / 100) % 60;
        long hundredths = hundredthsTotal % 100;
        return String.format(Locale.US, "[%02d:%02d.%02d]", minutes, seconds, hundredths);
    }

    public static String stripTimestamps(String lrc) {
        String normalized = normalizeLrc(lrc);
        StringBuilder result = new StringBuilder();
        for (String line : normalized.split("\n")) {
            if (line.isEmpty()) continue;
            if (result.length() > 0) result.append('\n');
            result.append(line.substring(line.indexOf(']') + 1));
        }
        return result.toString().trim();
    }

    /**
     * Shift normalized LRC by {@code offsetMs}: a positive offset shows every line earlier, a
     * negative one later. Times are clamped at zero, so the line order is kept.
     */
    public static String shiftLrc(String lrc, long offsetMs) {
        if (lrc == null || offsetMs == 0) return lrc;
        long shift = Math.round(offsetMs / 10.0);
        StringBuilder result = new StringBuilder();
        for (String line : lrc.split("\n", -1)) {
            if (result.length() > 0) result.append('\n');
            Matcher matcher = NORMALIZED_TIMESTAMP.matcher(line);
            if (!matcher.find()) {
                result.append(line);
                continue;
            }
            long time = (Long.parseLong(matcher.group(1)) * 60 + Long.parseLong(matcher.group(2))) * 100
                    + Long.parseLong(matcher.group(3));
            result.append(formatTimestamp(Math.max(0, time - shift))).append(line.substring(matcher.end()));
        }
        return result.toString();
    }

    // endregion

    // region Cache entries

    /**
     * The track id of a track cache row as the track model has it: without an album part
     * ("id:album") and without the smart preview suffix ("id_sm").
     */
    public static String normalizeTrackId(String trackId) {
        if (trackId == null) return null;
        String id = trackId.trim();
        int separator = id.indexOf(':');
        if (separator >= 0) id = id.substring(0, separator);
        if (id.endsWith("_sm")) id = id.substring(0, id.length() - 3);
        return id.isEmpty() ? null : id;
    }

    /**
     * Whether a track cache row of this type (the app's cache type enum name) is a download the
     * user keeps offline: everything but the temporary playback cache.
     */
    public static boolean isDownloadedCacheType(String type) {
        return type != null && !type.isEmpty() && !"TemporaryCache".equals(type);
    }

    /**
     * File name of a cached answer: the track id with anything but letters, digits, dot, dash
     * and underscore replaced, and the requested format.
     */
    public static String cacheFileName(String trackId, String format) {
        return trackId.replaceAll("[^A-Za-z0-9._-]", "_") + "." + format + ".txt";
    }

    /**
     * A cached answer: magic line, time saved (ms since the epoch), format or NONE, then the
     * lyrics content.
     */
    public static String encodeCacheEntry(String[] lyrics, long savedAt) {
        return CACHE_MAGIC + "\n" + savedAt + "\n"
                + (lyrics == null ? CACHE_NONE : lyrics[0]) + "\n"
                + (lyrics == null ? "" : lyrics[1]);
    }

    /**
     * @return The cached lyrics; an empty array for a cached "no lyrics" younger than
     *         {@code missTtlMs}; null when the entry is invalid or an expired "no lyrics".
     */
    public static String[] decodeCacheEntry(String entry, long now, long missTtlMs) {
        if (entry == null) return null;
        int first = entry.indexOf('\n');
        int second = first < 0 ? -1 : entry.indexOf('\n', first + 1);
        int third = second < 0 ? -1 : entry.indexOf('\n', second + 1);
        if (third < 0 || !CACHE_MAGIC.equals(entry.substring(0, first))) return null;

        long savedAt;
        try {
            savedAt = Long.parseLong(entry.substring(first + 1, second));
        } catch (NumberFormatException e) {
            return null;
        }
        String format = entry.substring(second + 1, third);
        String content = entry.substring(third + 1);

        if (CACHE_NONE.equals(format)) {
            boolean fresh = savedAt <= now && now - savedAt < missTtlMs;
            return fresh ? new String[0] : null;
        }
        if (!FORMAT_LRC.equals(format) && !FORMAT_TEXT.equals(format)) return null;
        if (isBlank(content)) return null;
        return new String[]{format, content};
    }

    // endregion

    // region Minimal JSON reader (LRCLIB responses only; avoids org.json and extra dependencies)

    public static Object parseJson(String json) {
        JsonReader reader = new JsonReader(json);
        Object value = reader.readValue();
        reader.skipWhitespace();
        if (!reader.atEnd()) throw new IllegalArgumentException("Trailing JSON content");
        return value;
    }

    private static final class JsonReader {
        private final String text;
        private int position;

        JsonReader(String text) {
            this.text = text;
        }

        boolean atEnd() {
            return position >= text.length();
        }

        void skipWhitespace() {
            while (!atEnd() && Character.isWhitespace(text.charAt(position))) position++;
        }

        Object readValue() {
            skipWhitespace();
            if (atEnd()) throw new IllegalArgumentException("Unexpected end of JSON");
            char c = text.charAt(position);
            switch (c) {
                case '{':
                    return readObject();
                case '[':
                    return readArray();
                case '"':
                    return readString();
                case 't':
                    expect("true");
                    return Boolean.TRUE;
                case 'f':
                    expect("false");
                    return Boolean.FALSE;
                case 'n':
                    expect("null");
                    return null;
                default:
                    return readNumber();
            }
        }

        private void expect(String literal) {
            if (!text.startsWith(literal, position)) {
                throw new IllegalArgumentException("Invalid JSON literal at " + position);
            }
            position += literal.length();
        }

        private Map<String, Object> readObject() {
            Map<String, Object> map = new LinkedHashMap<>();
            position++; // {
            skipWhitespace();
            if (!atEnd() && text.charAt(position) == '}') {
                position++;
                return map;
            }
            while (true) {
                skipWhitespace();
                String key = readString();
                skipWhitespace();
                if (atEnd() || text.charAt(position) != ':') throw new IllegalArgumentException("Expected ':'");
                position++;
                map.put(key, readValue());
                skipWhitespace();
                if (atEnd()) throw new IllegalArgumentException("Unterminated object");
                char c = text.charAt(position++);
                if (c == '}') return map;
                if (c != ',') throw new IllegalArgumentException("Expected ',' in object");
            }
        }

        private List<Object> readArray() {
            List<Object> list = new ArrayList<>();
            position++; // [
            skipWhitespace();
            if (!atEnd() && text.charAt(position) == ']') {
                position++;
                return list;
            }
            while (true) {
                list.add(readValue());
                skipWhitespace();
                if (atEnd()) throw new IllegalArgumentException("Unterminated array");
                char c = text.charAt(position++);
                if (c == ']') return list;
                if (c != ',') throw new IllegalArgumentException("Expected ',' in array");
            }
        }

        private String readString() {
            if (atEnd() || text.charAt(position) != '"') throw new IllegalArgumentException("Expected string");
            position++;
            StringBuilder builder = new StringBuilder();
            while (true) {
                if (atEnd()) throw new IllegalArgumentException("Unterminated string");
                char c = text.charAt(position++);
                if (c == '"') return builder.toString();
                if (c != '\\') {
                    builder.append(c);
                    continue;
                }
                if (atEnd()) throw new IllegalArgumentException("Unterminated escape");
                char escaped = text.charAt(position++);
                switch (escaped) {
                    case '"': builder.append('"'); break;
                    case '\\': builder.append('\\'); break;
                    case '/': builder.append('/'); break;
                    case 'b': builder.append('\b'); break;
                    case 'f': builder.append('\f'); break;
                    case 'n': builder.append('\n'); break;
                    case 'r': builder.append('\r'); break;
                    case 't': builder.append('\t'); break;
                    case 'u':
                        if (position + 4 > text.length()) throw new IllegalArgumentException("Bad unicode escape");
                        builder.append((char) Integer.parseInt(text.substring(position, position + 4), 16));
                        position += 4;
                        break;
                    default:
                        throw new IllegalArgumentException("Bad escape \\" + escaped);
                }
            }
        }

        private Number readNumber() {
            int start = position;
            while (!atEnd() && "+-0123456789.eE".indexOf(text.charAt(position)) >= 0) position++;
            String number = text.substring(start, position);
            if (number.isEmpty()) throw new IllegalArgumentException("Unexpected JSON character at " + start);
            if (number.indexOf('.') >= 0 || number.indexOf('e') >= 0 || number.indexOf('E') >= 0) {
                return Double.parseDouble(number);
            }
            return Long.parseLong(number);
        }
    }

    // endregion

    static String stringValue(Object value) {
        return value instanceof String ? (String) value : null;
    }

    static boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
