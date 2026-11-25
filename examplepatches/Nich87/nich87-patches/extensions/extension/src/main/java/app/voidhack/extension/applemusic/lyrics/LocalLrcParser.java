package app.voidhack.extension.applemusic.lyrics;

import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.nio.charset.UnsupportedCharsetException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Pure Java decoder, metadata extractor, and synced/unsynced LRC parser for local LRC files.
 */
final class LocalLrcParser {
    static final int MAX_LRC_BYTES = 2 * 1024 * 1024;
    static final int HEADER_PREVIEW_BYTES = 4096;

    private static final Pattern META_TAG_LINE = Pattern.compile("^\\[([a-zA-Z#]{1,12})\\s*:(.*)\\]$");
    private static final Pattern LENGTH_VALUE = Pattern.compile("^(\\d{1,3}):(\\d{2})(?:[:.](\\d{1,3}))?$");
    private static final Pattern TIMESTAMP_TAG = Pattern.compile(
            "\\[\\d{1,3}:\\d{2}(?:[:.]\\d{1,3})?(?::\\d{2}(?:[:.]\\d{1,3})?)?\\]");
    private static final Pattern ENHANCED_TAG = Pattern.compile(
            "<\\d{1,3}:\\d{2}(?:[:.]\\d{1,3})?(?::\\d{2}(?:[:.]\\d{1,3})?)?>");

    private static final Set<String> KNOWN_META_KEYS = new HashSet<>(Arrays.asList(
            "ti", "ar", "al", "au", "lr", "length", "by", "offset",
            "re", "tool", "ve", "la", "lang", "id", "sign", "qq", "total", "hash", "#"
    ));

    private LocalLrcParser() {}

    static final class DecodedText {
        final String text;
        final String charsetName;

        DecodedText(String text, String charsetName) {
            this.text = text == null ? "" : text;
            this.charsetName = charsetName == null ? "UTF-8" : charsetName;
        }
    }

    static final class LrcMetadata {
        final String title;
        final String artist;
        final String album;
        final String language;
        final int durationSec;
        final boolean hasSyncedTimestamps;

        LrcMetadata(
                String title,
                String artist,
                String album,
                String language,
                int durationSec,
                boolean hasSyncedTimestamps) {
            this.title = title == null ? "" : title.trim();
            this.artist = artist == null ? "" : artist.trim();
            this.album = album == null ? "" : album.trim();
            this.language = language == null ? "" : language.trim();
            this.durationSec = Math.max(0, durationSec);
            this.hasSyncedTimestamps = hasSyncedTimestamps;
        }

        boolean hasAnyTag() {
            return !title.isEmpty() || !artist.isEmpty() || !album.isEmpty();
        }
    }

    static DecodedText decodeBytes(byte[] raw) {
        if (raw == null || raw.length == 0) return null;

        // 1. Check explicit BOMs first.
        if (raw.length >= 3
                && (raw[0] & 0xFF) == 0xEF
                && (raw[1] & 0xFF) == 0xBB
                && (raw[2] & 0xFF) == 0xBF) {
            String decoded = decodeStrict(raw, 3, raw.length - 3, StandardCharsets.UTF_8);
            if (decoded != null) {
                return validateText(decoded, "UTF-8");
            }
        }
        if (raw.length >= 2) {
            int b0 = raw[0] & 0xFF;
            int b1 = raw[1] & 0xFF;
            if (b0 == 0xFE && b1 == 0xFF) {
                String decoded = decodeStrict(raw, 2, raw.length - 2, StandardCharsets.UTF_16BE);
                if (decoded != null) return validateText(decoded, "UTF-16BE");
            } else if (b0 == 0xFF && b1 == 0xFE) {
                String decoded = decodeStrict(raw, 2, raw.length - 2, StandardCharsets.UTF_16LE);
                if (decoded != null) return validateText(decoded, "UTF-16LE");
            }
        }

        // Reject binary payloads containing NUL bytes when no UTF-16 BOM was present.
        if (containsNul(raw)) {
            return null;
        }

        // 2. Try strict UTF-8 (standard LRC encoding).
        String utf8 = decodeStrict(raw, 0, raw.length, StandardCharsets.UTF_8);
        if (utf8 != null) {
            return validateText(stripBom(utf8), "UTF-8");
        }

        // 3. Try Japanese Windows-31J / Shift_JIS and EUC-JP (common for local Japanese .lrc files).
        String[] fallbacks = {"windows-31j", "Shift_JIS", "EUC-JP", "GB18030"};
        for (String name : fallbacks) {
            try {
                Charset cs = Charset.forName(name);
                String candidate = decodeStrict(raw, 0, raw.length, cs);
                if (candidate != null) {
                    DecodedText valid = validateText(stripBom(candidate), cs.name());
                    if (valid != null) return valid;
                }
            } catch (UnsupportedCharsetException ignored) {
            }
        }

        // 4. Lenient UTF-8 fallback.
        String lenient = stripBom(new String(raw, StandardCharsets.UTF_8));
        return validateText(lenient, "UTF-8");
    }

    static LrcMetadata parseMetadata(String text) {
        if (text == null || text.isEmpty()) {
            return new LrcMetadata("", "", "", "", 0, false);
        }
        String title = "";
        String artist = "";
        String album = "";
        String language = "";
        int durationSec = 0;
        boolean hasSynced = false;

        String[] lines = text.split("\\r?\\n");
        for (String raw : lines) {
            String trimmed = raw.trim();
            if (trimmed.isEmpty()) continue;

            if (!hasSynced && TIMESTAMP_TAG.matcher(trimmed).find()) {
                String withoutTags = ENHANCED_TAG.matcher(TIMESTAMP_TAG.matcher(trimmed).replaceAll("")).replaceAll("").trim();
                if (!withoutTags.isEmpty()) {
                    hasSynced = true;
                }
            }

            Matcher meta = META_TAG_LINE.matcher(trimmed);
            if (!meta.matches()) continue;
            String key = meta.group(1).toLowerCase(Locale.ROOT);
            String val = meta.group(2).trim();
            if (val.isEmpty()) continue;

            switch (key) {
                case "ti":
                    if (title.isEmpty()) title = val;
                    break;
                case "ar":
                    if (artist.isEmpty()) artist = val;
                    break;
                case "al":
                    if (album.isEmpty()) album = val;
                    break;
                case "la":
                case "lang":
                    if (language.isEmpty()) language = val;
                    break;
                case "length":
                    if (durationSec <= 0) {
                        durationSec = parseLengthSeconds(val);
                    }
                    break;
                default:
                    break;
            }
        }

        return new LrcMetadata(title, artist, album, language, durationSec, hasSynced);
    }

    static boolean isKnownMetadataTagLine(String trimmed) {
        if (trimmed == null || trimmed.length() < 4) return false;
        if (trimmed.charAt(0) != '[' || trimmed.charAt(trimmed.length() - 1) != ']') return false;
        Matcher m = META_TAG_LINE.matcher(trimmed);
        if (!m.matches()) return false;
        String key = m.group(1).toLowerCase(Locale.ROOT);
        return KNOWN_META_KEYS.contains(key);
    }

    static LrclibParser.PreparedRecord prepareLocalLrc(
            String rawText,
            int trackDurationSec,
            boolean allowWordSync,
            boolean forceUnsynced) {
        if (rawText == null || rawText.trim().isEmpty()) {
            return new LrclibParser.PreparedRecord(null, 0, LrclibModels.LyricsSource.NONE);
        }

        LrcMetadata meta = parseMetadata(rawText);
        int effectiveSec = trackDurationSec > 0 ? trackDurationSec : meta.durationSec;
        int fallbackDurationMs = effectiveSec > 0 ? effectiveSec * 1000 : 0;
        String lang = meta.language.isEmpty() ? null : meta.language;

        if (!forceUnsynced) {
            LrclibParser.ParsedLyrics synced = LrclibParser.parseLrc(rawText, fallbackDurationMs, allowWordSync);
            if (synced != null && !synced.lines.isEmpty()) {
                LrclibParser.ParsedLyrics withLang = withLanguage(synced, lang);
                LrclibModels.LyricsSource source = withLang.timing == LrclibParser.TimingType.WORD
                        ? LrclibModels.LyricsSource.LOCAL_WORD
                        : LrclibModels.LyricsSource.LOCAL_LINE;
                return new LrclibParser.PreparedRecord(withLang, fallbackDurationMs, source);
            }
        }

        String unsyncedText = extractUnsyncedText(rawText, forceUnsynced);
        LrclibParser.ParsedLyrics plain = LrclibParser.parsePlain(unsyncedText, fallbackDurationMs);
        if (plain != null && !plain.lines.isEmpty()) {
            return new LrclibParser.PreparedRecord(
                    withLanguage(plain, lang),
                    fallbackDurationMs,
                    LrclibModels.LyricsSource.LOCAL_PLAIN
            );
        }

        return new LrclibParser.PreparedRecord(null, fallbackDurationMs, LrclibModels.LyricsSource.NONE);
    }

    static String extractUnsyncedText(String rawText, boolean expandSyncedOrder) {
        if (rawText == null || rawText.trim().isEmpty()) return "";

        if (expandSyncedOrder) {
            LrclibParser.ParsedLyrics synced = LrclibParser.parseLrc(rawText, 0, false);
            if (synced != null && !synced.lines.isEmpty()) {
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < synced.lines.size(); i++) {
                    if (i > 0) sb.append('\n');
                    sb.append(synced.lines.get(i).text);
                }
                return sb.toString();
            }
        }

        String[] rawLines = rawText.split("\\r?\\n", -1);
        StringBuilder out = new StringBuilder();
        boolean started = false;
        boolean lastWasBlank = false;

        for (String raw : rawLines) {
            String trimmed = raw.trim();
            if (trimmed.isEmpty()) {
                if (started && !lastWasBlank) {
                    out.append('\n');
                    lastWasBlank = true;
                }
                continue;
            }
            if (isKnownMetadataTagLine(trimmed)) {
                continue;
            }
            String cleaned = ENHANCED_TAG.matcher(TIMESTAMP_TAG.matcher(trimmed).replaceAll("")).replaceAll("").trim();
            if (cleaned.isEmpty()) {
                if (started && !lastWasBlank) {
                    out.append('\n');
                    lastWasBlank = true;
                }
                continue;
            }
            if (started) out.append('\n');
            out.append(cleaned);
            started = true;
            lastWasBlank = false;
        }
        return out.toString().trim();
    }

    static String formatPreviewText(String rawText, boolean forceUnsynced) {
        if (rawText == null || rawText.trim().isEmpty()) return "";
        if (!forceUnsynced) {
            LrclibParser.ParsedLyrics synced = LrclibParser.parseLrc(rawText, 0, false);
            if (synced != null && !synced.lines.isEmpty()) {
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < synced.lines.size(); i++) {
                    if (i > 0) sb.append('\n');
                    LrclibParser.LyricLine line = synced.lines.get(i);
                    sb.append('[').append(formatShortTime(line.startMs)).append("] ").append(line.text);
                }
                return sb.toString();
            }
        }
        return extractUnsyncedText(rawText, forceUnsynced);
    }

    private static LrclibParser.ParsedLyrics withLanguage(LrclibParser.ParsedLyrics parsed, String fallbackLang) {
        if (parsed == null) return null;
        if (parsed.language != null && !parsed.language.trim().isEmpty()) return parsed;
        if (fallbackLang == null || fallbackLang.trim().isEmpty()) return parsed;
        return new LrclibParser.ParsedLyrics(parsed.timing, fallbackLang.trim(), parsed.durationMs, parsed.lines);
    }

    private static String formatShortTime(int totalMs) {
        int clamped = Math.max(0, totalMs);
        int minutes = clamped / 60000;
        int seconds = (clamped % 60000) / 1000;
        int centis = (clamped % 1000) / 10;
        return String.format(Locale.ROOT, "%02d:%02d.%02d", minutes, seconds, centis);
    }

    private static int parseLengthSeconds(String value) {
        Matcher m = LENGTH_VALUE.matcher(value.trim());
        if (!m.matches()) return 0;
        try {
            int min = Integer.parseInt(m.group(1));
            int sec = Integer.parseInt(m.group(2));
            return Math.max(0, min * 60 + sec);
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private static String decodeStrict(byte[] bytes, int offset, int length, Charset charset) {
        try {
            CharsetDecoder decoder = charset.newDecoder()
                    .onMalformedInput(CodingErrorAction.REPORT)
                    .onUnmappableCharacter(CodingErrorAction.REPORT);
            CharBuffer out = decoder.decode(ByteBuffer.wrap(bytes, offset, length));
            return out.toString();
        } catch (CharacterCodingException e) {
            return null;
        }
    }

    private static boolean containsNul(byte[] bytes) {
        int checkLen = Math.min(bytes.length, 8192);
        for (int i = 0; i < checkLen; i++) {
            if (bytes[i] == 0) return true;
        }
        return false;
    }

    private static String stripBom(String text) {
        if (text != null && !text.isEmpty() && text.charAt(0) == '\uFEFF') {
            return text.substring(1);
        }
        return text;
    }

    private static DecodedText validateText(String text, String charsetName) {
        if (text == null || text.trim().isEmpty()) return null;
        int sample = Math.min(text.length(), 4096);
        int controlCount = 0;
        for (int i = 0; i < sample; i++) {
            char c = text.charAt(i);
            if (c == 0) return null;
            if (c < 0x20 && c != '\n' && c != '\r' && c != '\t') {
                controlCount++;
            }
        }
        if (sample > 0 && (double) controlCount / sample > 0.05) {
            return null;
        }
        return new DecodedText(text, charsetName);
    }
}
