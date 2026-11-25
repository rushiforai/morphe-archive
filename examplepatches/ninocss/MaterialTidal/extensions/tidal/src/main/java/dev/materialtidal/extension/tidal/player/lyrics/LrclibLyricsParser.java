package dev.materialtidal.extension.tidal.player.lyrics;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.LyricLineData;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.SyllableLyricsDocument;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.SyllableWordBuilder;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.WordGroup;

/**
 * Pure-Java parser for LRCLIB API records:
 * <ul>
 *   <li>Word-synced YAML {@code lyricsfile} ({@code hasWordSync == true})</li>
 *   <li>Standard line-synced LRC {@code syncedLyrics} (clean fallback when TIDAL lacks lyrics)</li>
 * </ul>
 */
public final class LrclibLyricsParser {

    private static final Pattern LRC_TAG_PATTERN =
            Pattern.compile("\\[(\\d{1,3}):(\\d{2})(?:[.:](\\d{1,3}))?\\]");
    private static final Pattern LRC_OFFSET_PATTERN =
            Pattern.compile("^\\[offset:([+-]?\\d+)\\]$", Pattern.CASE_INSENSITIVE);

    private LrclibLyricsParser() {
    }

    public static SyllableLyricsDocument parseWordSyncedFromJson(String jsonBody, String providerLabel) {
        Map<String, Object> root = SimpleJsonParser.asMap(SimpleJsonParser.parse(jsonBody));
        return parseWordSyncedFromRecord(root, providerLabel);
    }

    public static SyllableLyricsDocument parseWordSyncedFromRecord(
            Map<String, Object> record,
            String providerLabel
    ) {
        if (record == null) {
            return null;
        }
        if (SimpleJsonParser.asBool(record.get("instrumental"), false)) {
            return null;
        }
        if (!SimpleJsonParser.asBool(record.get("hasWordSync"), false)) {
            return null;
        }
        String lyricsFile = SimpleJsonParser.asString(record.get("lyricsfile"));
        if (lyricsFile == null || lyricsFile.trim().isEmpty()) {
            return null;
        }
        return parseLyricsFileYaml(lyricsFile, providerLabel != null ? providerLabel : "LRCLIB");
    }

    public static SyllableLyricsDocument parseLineSyncedFromJson(String jsonBody, String providerLabel) {
        Map<String, Object> root = SimpleJsonParser.asMap(SimpleJsonParser.parse(jsonBody));
        return parseLineSyncedFromRecord(root, providerLabel);
    }

    public static SyllableLyricsDocument parseLineSyncedFromRecord(
            Map<String, Object> record,
            String providerLabel
    ) {
        if (record == null) {
            return null;
        }
        if (SimpleJsonParser.asBool(record.get("instrumental"), false)) {
            return null;
        }
        String synced = SimpleJsonParser.asString(record.get("syncedLyrics"));
        if (synced == null || synced.trim().isEmpty()) {
            return null;
        }
        return parseLrcText(synced, providerLabel != null ? providerLabel : "LRCLIB");
    }

    public static SyllableLyricsDocument parseLyricsFileYaml(String yaml, String providerLabel) {
        if (yaml == null || yaml.trim().isEmpty()) {
            return null;
        }

        List<YamlLineBuilder> rawLines = new ArrayList<>();
        YamlLineBuilder curLine = null;
        YamlWordBuilder curWord = null;
        boolean inLines = false;
        boolean inWords = false;
        int linesItemIndent = -1;
        int wordsItemIndent = -1;

        String[] rows = yaml.split("\r?\n");
        for (String row : rows) {
            int len = row.length();
            int indent = 0;
            while (indent < len && row.charAt(indent) == ' ') {
                indent++;
            }
            if (indent >= len) {
                continue;
            }
            String trimmed = row.substring(indent);
            if (trimmed.startsWith("#")) {
                continue;
            }

            if (!inLines) {
                if ("lines:".equals(trimmed.trim())) {
                    inLines = true;
                }
                continue;
            }

            // Exit `lines:` once another top-level YAML key (like `plain:`) begins
            if (indent == 0 && !trimmed.startsWith("-")) {
                break;
            }

            if (trimmed.startsWith("- ") || "-".equals(trimmed.trim())) {
                boolean startsLineItem;
                if (!inWords) {
                    startsLineItem = true;
                } else if (linesItemIndent >= 0 && indent <= linesItemIndent) {
                    startsLineItem = true;
                } else {
                    startsLineItem = false;
                }

                if (startsLineItem) {
                    if (linesItemIndent < 0) {
                        linesItemIndent = indent;
                    }
                    curLine = new YamlLineBuilder();
                    rawLines.add(curLine);
                    curWord = null;
                    inWords = false;
                } else {
                    if (wordsItemIndent < 0) {
                        wordsItemIndent = indent;
                    }
                    if (curLine == null) {
                        curLine = new YamlLineBuilder();
                        rawLines.add(curLine);
                    }
                    curWord = new YamlWordBuilder();
                    curLine.words.add(curWord);
                }

                String afterDash = trimmed.length() > 1 ? trimmed.substring(1).trim() : "";
                if (!afterDash.isEmpty()) {
                    if (startsLineItem) {
                        applyLineField(curLine, afterDash);
                        if ("words:".equals(afterDash)) {
                            inWords = true;
                        }
                    } else if (curWord != null) {
                        applyWordField(curWord, afterDash);
                    }
                }
                continue;
            }

            if (curLine == null) {
                continue;
            }

            if (!inWords) {
                if ("words:".equals(trimmed.trim())) {
                    inWords = true;
                    curWord = null;
                } else {
                    applyLineField(curLine, trimmed);
                }
            } else {
                if ("words:".equals(trimmed.trim())) {
                    continue;
                }
                if (wordsItemIndent >= 0 && indent < wordsItemIndent) {
                    inWords = false;
                    curWord = null;
                    applyLineField(curLine, trimmed);
                } else if (curWord != null) {
                    applyWordField(curWord, trimmed);
                }
            }
        }

        if (rawLines.isEmpty()) {
            return null;
        }

        List<LyricLineData> parsedLines = new ArrayList<>(rawLines.size());
        boolean anyTimedWords = false;

        for (YamlLineBuilder lb : rawLines) {
            if (lb.words.isEmpty()) {
                continue;
            }
            List<WordGroup> leadWords = new ArrayList<>(lb.words.size());
            SyllableWordBuilder builder = new SyllableWordBuilder(false, leadWords);

            for (int i = 0; i < lb.words.size(); i++) {
                YamlWordBuilder wb = lb.words.get(i);
                if (wb.text == null || wb.startMs < 0L) {
                    continue;
                }
                long wStart = wb.startMs;
                long wEnd = wb.endMs;
                if (wEnd < 0L) {
                    if (i + 1 < lb.words.size() && lb.words.get(i + 1).startMs > wStart) {
                        wEnd = lb.words.get(i + 1).startMs;
                    } else if (lb.endMs > wStart) {
                        wEnd = lb.endMs;
                    } else {
                        wEnd = wStart + 250L;
                    }
                }
                if (wEnd < wStart + 40L) {
                    wEnd = wStart + 40L;
                }
                builder.append(wb.text, wStart, wEnd);
            }
            builder.flush(false);

            if (leadWords.isEmpty()) {
                continue;
            }
            anyTimedWords = true;

            long lineStart = lb.startMs >= 0L ? lb.startMs : Long.MAX_VALUE;
            long lineEnd = lb.endMs >= 0L ? lb.endMs : 0L;
            for (WordGroup w : leadWords) {
                if (w.startMs < lineStart) lineStart = w.startMs;
                if (w.endMs > lineEnd) lineEnd = w.endMs;
            }
            if (lineStart == Long.MAX_VALUE) {
                lineStart = 0L;
            }
            if (lineEnd <= lineStart) {
                lineEnd = lineStart + 250L;
            }

            String fullText = SyllableLyricsModels.buildLineText(leadWords);
            if (fullText.isEmpty() && lb.text != null) {
                fullText = lb.text.trim();
            }

            parsedLines.add(new LyricLineData(
                    fullText,
                    lineStart,
                    lineEnd,
                    leadWords,
                    Collections.emptyList(),
                    false,
                    false
            ));
        }

        if (!anyTimedWords || parsedLines.isEmpty()) {
            return null;
        }

        List<LyricLineData> withBreaks = SyllableLyricsModels.insertInstrumentalBreaks(parsedLines);
        return new SyllableLyricsDocument(providerLabel, true, true, false, withBreaks);
    }

    public static SyllableLyricsDocument parseLrcText(String lrcText, String providerLabel) {
        if (lrcText == null || lrcText.trim().isEmpty()) {
            return null;
        }

        long offsetMs = 0L;
        List<LrcLine> entries = new ArrayList<>();
        String[] rows = lrcText.split("\r?\n");

        for (String rawRow : rows) {
            if (rawRow == null) {
                continue;
            }
            String trimmedRow = rawRow.trim();
            if (trimmedRow.isEmpty()) {
                continue;
            }

            Matcher om = LRC_OFFSET_PATTERN.matcher(trimmedRow);
            if (om.matches()) {
                try {
                    offsetMs = Long.parseLong(om.group(1));
                } catch (NumberFormatException ignored) {
                }
                continue;
            }

            Matcher tm = LRC_TAG_PATTERN.matcher(trimmedRow);
            List<Long> timestamps = new ArrayList<>(2);
            int lastTagEnd = 0;
            while (tm.find()) {
                if (tm.start() > lastTagEnd && !trimmedRow.substring(lastTagEnd, tm.start()).trim().isEmpty()) {
                    break;
                }
                long mins = Long.parseLong(tm.group(1));
                long secs = Long.parseLong(tm.group(2));
                String frac = tm.group(3);
                long millis = 0L;
                if (frac != null) {
                    if (frac.length() == 1) millis = Long.parseLong(frac) * 100L;
                    else if (frac.length() == 2) millis = Long.parseLong(frac) * 10L;
                    else millis = Long.parseLong(frac.substring(0, 3));
                }
                timestamps.add(mins * 60_000L + secs * 1000L + millis);
                lastTagEnd = tm.end();
            }

            if (timestamps.isEmpty()) {
                continue;
            }

            String text = trimmedRow.substring(lastTagEnd).trim();
            if (text.isEmpty()) {
                continue;
            }

            for (long ts : timestamps) {
                long adjusted = Math.max(0L, ts - offsetMs);
                entries.add(new LrcLine(adjusted, text));
            }
        }

        if (entries.isEmpty()) {
            return null;
        }

        Collections.sort(entries, new Comparator<LrcLine>() {
            @Override
            public int compare(LrcLine a, LrcLine b) {
                return Long.compare(a.startMs, b.startMs);
            }
        });

        List<LyricLineData> out = new ArrayList<>(entries.size());
        for (int i = 0; i < entries.size(); i++) {
            LrcLine cur = entries.get(i);
            long endMs = (i + 1 < entries.size())
                    ? Math.max(cur.startMs + 400L, entries.get(i + 1).startMs)
                    : (cur.startMs + 4000L);
            out.add(new LyricLineData(
                    cur.text,
                    cur.startMs,
                    endMs,
                    Collections.emptyList(),
                    Collections.emptyList(),
                    false,
                    false
            ));
        }

        return new SyllableLyricsDocument(providerLabel, false, true, false, out);
    }

    private static void applyLineField(YamlLineBuilder line, String kv) {
        int colon = kv.indexOf(':');
        if (colon <= 0) {
            return;
        }
        String key = kv.substring(0, colon).trim().toLowerCase(Locale.ROOT);
        String rawVal = kv.substring(colon + 1);
        if ("text".equals(key)) {
            line.text = parseYamlScalar(rawVal);
        } else if ("start_ms".equals(key)) {
            line.startMs = parseLongSafe(rawVal);
        } else if ("end_ms".equals(key)) {
            line.endMs = parseLongSafe(rawVal);
        }
    }

    private static void applyWordField(YamlWordBuilder word, String kv) {
        int colon = kv.indexOf(':');
        if (colon <= 0) {
            return;
        }
        String key = kv.substring(0, colon).trim().toLowerCase(Locale.ROOT);
        String rawVal = kv.substring(colon + 1);
        if ("text".equals(key)) {
            word.text = parseYamlScalar(rawVal);
        } else if ("start_ms".equals(key)) {
            word.startMs = parseLongSafe(rawVal);
        } else if ("end_ms".equals(key)) {
            word.endMs = parseLongSafe(rawVal);
        }
    }

    private static long parseLongSafe(String rawVal) {
        String s = parseYamlScalar(rawVal).trim();
        if (s.isEmpty()) {
            return -1L;
        }
        try {
            return Math.round(Double.parseDouble(s));
        } catch (NumberFormatException ignored) {
            return -1L;
        }
    }

    private static String parseYamlScalar(String raw) {
        if (raw == null) {
            return "";
        }
        int len = raw.length();
        int start = 0;
        while (start < len && (raw.charAt(start) == ' ' || raw.charAt(start) == '\t')) {
            start++;
        }
        if (start >= len) {
            return "";
        }
        char first = raw.charAt(start);
        if (first == '"') {
            StringBuilder sb = new StringBuilder();
            for (int i = start + 1; i < len; i++) {
                char c = raw.charAt(i);
                if (c == '"') {
                    return sb.toString();
                }
                if (c == '\\' && i + 1 < len) {
                    char esc = raw.charAt(++i);
                    switch (esc) {
                        case '"': sb.append('"'); break;
                        case '\\': sb.append('\\'); break;
                        case 'n': sb.append('\n'); break;
                        case 'r': sb.append('\r'); break;
                        case 't': sb.append('\t'); break;
                        case 'u':
                            if (i + 4 < len) {
                                try {
                                    int cp = Integer.parseInt(raw.substring(i + 1, i + 5), 16);
                                    sb.append((char) cp);
                                    i += 4;
                                } catch (NumberFormatException e) {
                                    sb.append('u');
                                }
                            } else {
                                sb.append('u');
                            }
                            break;
                        default: sb.append(esc); break;
                    }
                } else {
                    sb.append(c);
                }
            }
            return sb.toString();
        }
        if (first == '\'') {
            StringBuilder sb = new StringBuilder();
            for (int i = start + 1; i < len; i++) {
                char c = raw.charAt(i);
                if (c == '\'') {
                    if (i + 1 < len && raw.charAt(i + 1) == '\'') {
                        sb.append('\'');
                        i++;
                    } else {
                        return sb.toString();
                    }
                } else {
                    sb.append(c);
                }
            }
            return sb.toString();
        }
        return raw.substring(start).trim();
    }

    private static final class YamlLineBuilder {
        String text;
        long startMs = -1L;
        long endMs = -1L;
        final List<YamlWordBuilder> words = new ArrayList<>();
    }

    private static final class YamlWordBuilder {
        String text;
        long startMs = -1L;
        long endMs = -1L;
    }

    private static final class LrcLine {
        final long startMs;
        final String text;

        LrcLine(long startMs, String text) {
            this.startMs = startMs;
            this.text = text;
        }
    }
}
