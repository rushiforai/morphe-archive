package app.voidhack.extension.applemusic.lyrics;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Pure Java parser for LRCLIB Lyricsfile (YAML v1.0), standard/enhanced LRC, and plain lyrics,
 * plus serializer to Apple Music TTML XML compatible with libandroidappmusic.so TTMLParser.
 */
final class LrclibParser {
    private static final Pattern LRC_LINE_TAGS = Pattern.compile(
            "\\[(\\d{1,2}):(\\d{2})(?:[:.](\\d{1,3}))?(?::(\\d{2})(?:[:.](\\d{1,3}))?)?\\]");
    private static final Pattern LRC_OFFSET_TAG = Pattern.compile("(?i)^\\[offset\\s*:\\s*([+-]?\\d+)\\s*\\]$");
    private static final Pattern LRC_META_TAG = Pattern.compile("^\\[[a-zA-Z]{2,12}\\s*:.*\\]$");
    private static final Pattern ENHANCED_WORD_TAG = Pattern.compile(
            "<(\\d{1,2}):(\\d{2})(?:[:.](\\d{1,3}))?(?::(\\d{2})(?:[:.](\\d{1,3}))?)?>");

    private LrclibParser() {}

    enum TimingType {
        WORD,
        LINE,
        NONE
    }

    static final class WordSpan {
        final String text;
        final int startMs;
        final int endMs;

        WordSpan(String text, int startMs, int endMs) {
            this.text = text == null ? "" : text;
            this.startMs = startMs;
            this.endMs = endMs;
        }
    }

    static final class LyricLine {
        final String text;
        final int startMs;
        final int endMs;
        final List<WordSpan> words;
        final int sectionIndex;

        LyricLine(String text, int startMs, int endMs, List<WordSpan> words, int sectionIndex) {
            this.text = text == null ? "" : text;
            this.startMs = startMs;
            this.endMs = endMs;
            this.words = words == null ? Collections.emptyList() : words;
            this.sectionIndex = sectionIndex;
        }
    }

    static final class ParsedLyrics {
        final TimingType timing;
        final String language;
        final int durationMs;
        final List<LyricLine> lines;

        ParsedLyrics(TimingType timing, String language, int durationMs, List<LyricLine> lines) {
            this.timing = timing;
            this.language = language;
            this.durationMs = durationMs;
            this.lines = lines == null ? Collections.emptyList() : lines;
        }
    }

    static final class TtmlResult {
        final String ttml;
        final LrclibModels.LyricsSource sourceType;
        final int lineCount;
        final boolean hasWordTiming;

        TtmlResult(String ttml, LrclibModels.LyricsSource sourceType, int lineCount, boolean hasWordTiming) {
            this.ttml = ttml;
            this.sourceType = sourceType;
            this.lineCount = lineCount;
            this.hasWordTiming = hasWordTiming;
        }

        static TtmlResult none() {
            return new TtmlResult(null, LrclibModels.LyricsSource.NONE, 0, false);
        }
    }

    static TtmlResult buildTtml(
            LrclibModels.LyricsRecord record,
            int trackDurationSec,
            boolean allowWordSync,
            boolean allowPlain,
            int offsetMs,
            String fallbackLang) {
        if (record == null) return TtmlResult.none();
        if (record.instrumental) {
            return new TtmlResult(null, LrclibModels.LyricsSource.LRCLIB_INSTRUMENTAL, 0, false);
        }

        int fallbackDurationMs = trackDurationSec > 0
                ? trackDurationSec * 1000
                : (record.duration > 0.5 ? (int) Math.round(record.duration * 1000.0) : 0);

        ParsedLyrics parsed = null;
        ParsedLyrics lyricsfileParsed = null;

        if (record.lyricsfile != null) {
            lyricsfileParsed = parseLyricsfile(record.lyricsfile, fallbackDurationMs);
            if (lyricsfileParsed != null && !lyricsfileParsed.lines.isEmpty()) {
                if (lyricsfileParsed.timing == TimingType.WORD && allowWordSync) {
                    parsed = lyricsfileParsed;
                } else if (lyricsfileParsed.timing == TimingType.WORD && !allowWordSync) {
                    parsed = downgradeToLine(lyricsfileParsed);
                } else if (lyricsfileParsed.timing == TimingType.LINE) {
                    parsed = lyricsfileParsed;
                }
            }
        }

        if (parsed == null && record.syncedLyrics != null) {
            ParsedLyrics lrcParsed = parseLrc(record.syncedLyrics, fallbackDurationMs, allowWordSync);
            if (lrcParsed != null && !lrcParsed.lines.isEmpty()) {
                parsed = lrcParsed;
            }
        }

        if (parsed == null && allowPlain) {
            if (record.plainLyrics != null) {
                ParsedLyrics plain = parsePlain(record.plainLyrics, fallbackDurationMs);
                if (plain != null && !plain.lines.isEmpty()) {
                    parsed = plain;
                }
            }
            if (parsed == null && lyricsfileParsed != null && !lyricsfileParsed.lines.isEmpty()) {
                parsed = lyricsfileParsed;
            }
        }

        if (parsed == null || parsed.lines.isEmpty()) {
            return TtmlResult.none();
        }

        return renderTtml(parsed, fallbackDurationMs, offsetMs, fallbackLang);
    }

    static String formatPreviewText(LrclibModels.LyricsRecord record) {
        if (record == null) return "";
        if (record.instrumental) return "";
        if (record.plainLyrics != null && !record.plainLyrics.trim().isEmpty()) {
            return record.plainLyrics.trim();
        }
        if (record.syncedLyrics != null) {
            ParsedLyrics lrc = parseLrc(record.syncedLyrics, 0, false);
            if (lrc != null && !lrc.lines.isEmpty()) {
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < lrc.lines.size(); i++) {
                    if (i > 0) sb.append('\n');
                    sb.append(lrc.lines.get(i).text);
                }
                return sb.toString();
            }
        }
        if (record.lyricsfile != null) {
            ParsedLyrics lf = parseLyricsfile(record.lyricsfile, 0);
            if (lf != null && !lf.lines.isEmpty()) {
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < lf.lines.size(); i++) {
                    if (i > 0) sb.append('\n');
                    sb.append(lf.lines.get(i).text);
                }
                return sb.toString();
            }
        }
        return "";
    }

    static ParsedLyrics parseLyricsfile(String yaml, int fallbackDurationMs) {
        if (yaml == null || yaml.trim().isEmpty()) return null;

        String[] rawLines = yaml.split("\\r?\\n", -1);
        String section = "";
        String language = null;
        int durationMs = fallbackDurationMs;
        List<MutableLine> mutableLines = new ArrayList<>();
        MutableLine currentLine = null;
        MutableWord currentWord = null;
        int lineIndent = -1;
        boolean inWords = false;
        boolean inPlainBlock = false;
        int plainBlockIndent = -1;
        StringBuilder plainBlock = new StringBuilder();

        for (String raw : rawLines) {
            if (inPlainBlock) {
                int indent = countLeadingSpaces(raw);
                boolean blank = raw.trim().isEmpty();
                if (!blank && indent == 0) {
                    inPlainBlock = false;
                } else {
                    if (plainBlockIndent < 0 && !blank) {
                        plainBlockIndent = indent;
                    }
                    if (plainBlock.length() > 0) plainBlock.append('\n');
                    if (!blank && plainBlockIndent > 0 && raw.length() >= plainBlockIndent) {
                        plainBlock.append(raw.substring(plainBlockIndent));
                    } else if (!blank) {
                        plainBlock.append(raw.trim());
                    }
                    continue;
                }
            }

            if (raw.trim().isEmpty() || raw.trim().startsWith("#")) {
                continue;
            }

            int indent = countLeadingSpaces(raw);
            String trimmed = raw.trim();
            boolean sequenceItem = trimmed.startsWith("- ") || trimmed.equals("-");
            boolean inLines = "lines".equals(section);

            if (indent == 0 && !(inLines && sequenceItem)) {
                currentLine = null;
                currentWord = null;
                lineIndent = -1;
                inWords = false;
                if (trimmed.equals("metadata:")) {
                    section = "metadata";
                } else if (trimmed.startsWith("lines:")) {
                    section = "lines";
                } else if (trimmed.startsWith("plain:")) {
                    section = "plain";
                    String rest = trimmed.substring("plain:".length()).trim();
                    if (rest.startsWith("|") || rest.startsWith(">")) {
                        inPlainBlock = true;
                        plainBlockIndent = -1;
                    } else if (!rest.isEmpty() && !rest.equals("null") && !rest.equals("~")) {
                        plainBlock.append(unquoteYaml(rest));
                    }
                } else {
                    section = "";
                }
                continue;
            }

            if ("metadata".equals(section)) {
                int colon = trimmed.indexOf(':');
                if (colon > 0) {
                    String key = trimmed.substring(0, colon).trim();
                    String val = unquoteYaml(trimmed.substring(colon + 1).trim());
                    if ("duration_ms".equals(key)) {
                        int parsed = parseIntSafe(val, -1);
                        if (parsed > 0) durationMs = parsed;
                    } else if ("language".equals(key) && !val.isEmpty()) {
                        language = val;
                    }
                }
                continue;
            }

            if (inLines) {
                int lineFieldIndent = lineIndent + 2;
                if (sequenceItem && (lineIndent < 0 || indent == lineIndent)) {
                    lineIndent = indent;
                    currentLine = new MutableLine();
                    mutableLines.add(currentLine);
                    currentWord = null;
                    inWords = false;
                    String afterDash = trimmed.length() > 1 ? trimmed.substring(1).trim() : "";
                    if (!afterDash.isEmpty()) {
                        applyLineField(currentLine, afterDash);
                    }
                } else if (inWords && sequenceItem && indent >= lineFieldIndent) {
                    currentWord = new MutableWord();
                    currentLine.words.add(currentWord);
                    String afterDash = trimmed.substring(1).trim();
                    if (!afterDash.isEmpty()) {
                        applyWordField(currentWord, afterDash);
                    }
                } else if (currentLine != null && indent == lineFieldIndent) {
                    if (trimmed.startsWith("words:")) {
                        String rest = trimmed.substring("words:".length()).trim();
                        inWords = rest.isEmpty();
                        currentWord = null;
                    } else {
                        inWords = false;
                        currentWord = null;
                        applyLineField(currentLine, trimmed);
                    }
                } else if (currentWord != null && indent > lineFieldIndent) {
                    applyWordField(currentWord, trimmed);
                }
            }
        }

        if (!mutableLines.isEmpty()) {
            boolean anyWords = false;
            List<LyricLine> finalLines = new ArrayList<>(mutableLines.size());
            for (int i = 0; i < mutableLines.size(); i++) {
                MutableLine ml = mutableLines.get(i);
                String text = ml.text == null ? "" : ml.text;
                if (text.trim().isEmpty() && ml.words.isEmpty()) {
                    continue;
                }
                int startMs = ml.startMs >= 0 ? ml.startMs : 0;
                int endMs = ml.endMs;
                if (endMs <= startMs) {
                    // Infer from next line start or fallback duration
                    int nextStart = -1;
                    for (int j = i + 1; j < mutableLines.size(); j++) {
                        if (mutableLines.get(j).startMs > startMs) {
                            nextStart = mutableLines.get(j).startMs;
                            break;
                        }
                    }
                    if (nextStart > startMs) {
                        endMs = nextStart;
                    } else if (durationMs > startMs) {
                        endMs = durationMs;
                    } else {
                        endMs = startMs + 4000;
                    }
                }
                List<WordSpan> spans = new ArrayList<>(ml.words.size());
                for (int w = 0; w < ml.words.size(); w++) {
                    MutableWord mw = ml.words.get(w);
                    if (mw.text == null || mw.text.isEmpty()) continue;
                    int wStart = mw.startMs >= 0 ? mw.startMs : startMs;
                    int wEnd = mw.endMs;
                    if (wEnd <= wStart) {
                        if (w + 1 < ml.words.size() && ml.words.get(w + 1).startMs > wStart) {
                            wEnd = ml.words.get(w + 1).startMs;
                        } else if (endMs > wStart) {
                            wEnd = endMs;
                        } else {
                            wEnd = wStart + 250;
                        }
                    }
                    spans.add(new WordSpan(mw.text, wStart, wEnd));
                }
                if (!spans.isEmpty()) {
                    anyWords = true;
                    if (text.isEmpty()) {
                        StringBuilder rebuilt = new StringBuilder();
                        for (WordSpan ws : spans) rebuilt.append(ws.text);
                        text = rebuilt.toString();
                    }
                }
                finalLines.add(new LyricLine(text, startMs, endMs, spans, 0));
            }

            if (!finalLines.isEmpty()) {
                return new ParsedLyrics(
                        anyWords ? TimingType.WORD : TimingType.LINE,
                        language,
                        durationMs,
                        finalLines
                );
            }
        }

        if (plainBlock.length() > 0) {
            ParsedLyrics plain = parsePlain(plainBlock.toString(), durationMs);
            if (plain != null) {
                return new ParsedLyrics(TimingType.NONE, language, durationMs, plain.lines);
            }
        }
        return null;
    }

    static ParsedLyrics parseLrc(String lrc, int fallbackDurationMs, boolean allowEnhancedWords) {
        if (lrc == null || lrc.trim().isEmpty()) return null;

        int lrcOffsetMs = 0;
        List<RawLrcEntry> entries = new ArrayList<>();
        String[] rawLines = lrc.split("\\r?\\n");
        int order = 0;

        for (String raw : rawLines) {
            String trimmed = raw.trim();
            if (trimmed.isEmpty()) continue;

            Matcher offsetMatcher = LRC_OFFSET_TAG.matcher(trimmed);
            if (offsetMatcher.matches()) {
                lrcOffsetMs = parseIntSafe(offsetMatcher.group(1), 0);
                continue;
            }

            Matcher lineMatcher = LRC_LINE_TAGS.matcher(trimmed);
            List<Integer> timestamps = new ArrayList<>();
            int lastEnd = 0;
            while (lineMatcher.find()) {
                if (lineMatcher.start() != lastEnd && !trimmed.substring(lastEnd, lineMatcher.start()).trim().isEmpty()) {
                    // Only treat leading timestamps as line timestamps.
                    break;
                }
                int ts = parseLrcTimestamp(lineMatcher);
                if (ts >= 0) timestamps.add(ts);
                lastEnd = lineMatcher.end();
            }

            if (timestamps.isEmpty()) {
                if (LRC_META_TAG.matcher(trimmed).matches()) {
                    continue;
                }
                continue;
            }

            String body = trimmed.substring(lastEnd);
            // Strip a single leading space right after the closing bracket if present.
            if (body.startsWith(" ")) body = body.substring(1);

            for (int ts : timestamps) {
                int adjustedTs = Math.max(0, ts - lrcOffsetMs);
                entries.add(new RawLrcEntry(adjustedTs, order++, body));
            }
        }

        if (entries.isEmpty()) return null;

        Collections.sort(entries, new Comparator<RawLrcEntry>() {
            @Override
            public int compare(RawLrcEntry a, RawLrcEntry b) {
                int cmp = Integer.compare(a.startMs, b.startMs);
                return cmp != 0 ? cmp : Integer.compare(a.order, b.order);
            }
        });

        boolean anyWordTiming = false;
        List<LyricLine> lines = new ArrayList<>();
        for (int i = 0; i < entries.size(); i++) {
            RawLrcEntry entry = entries.get(i);
            String stripped = stripEnhancedTags(entry.rawText).trim();
            if (stripped.isEmpty()) {
                // Empty timestamped line serves purely as the end boundary for the preceding line.
                continue;
            }

            int endMs = -1;
            for (int j = i + 1; j < entries.size(); j++) {
                if (entries.get(j).startMs > entry.startMs) {
                    endMs = entries.get(j).startMs;
                    break;
                }
            }
            if (endMs <= entry.startMs) {
                if (fallbackDurationMs > entry.startMs) {
                    endMs = fallbackDurationMs;
                } else {
                    endMs = entry.startMs + 4000;
                }
            }

            List<WordSpan> words = Collections.emptyList();
            if (allowEnhancedWords && ENHANCED_WORD_TAG.matcher(entry.rawText).find()) {
                words = parseEnhancedWords(entry.rawText, entry.startMs, endMs, lrcOffsetMs);
                if (!words.isEmpty()) anyWordTiming = true;
            }

            lines.add(new LyricLine(stripped, entry.startMs, endMs, words, 0));
        }

        if (lines.isEmpty()) return null;
        return new ParsedLyrics(anyWordTiming ? TimingType.WORD : TimingType.LINE, null, fallbackDurationMs, lines);
    }

    static ParsedLyrics parsePlain(String plain, int fallbackDurationMs) {
        if (plain == null || plain.trim().isEmpty()) return null;
        String[] rawLines = plain.split("\\r?\\n");
        List<LyricLine> lines = new ArrayList<>();
        int section = 0;
        boolean seenLineInSection = false;
        for (String raw : rawLines) {
            String trimmed = raw.trim();
            if (trimmed.isEmpty()) {
                if (seenLineInSection) {
                    section++;
                    seenLineInSection = false;
                }
                continue;
            }
            seenLineInSection = true;
            lines.add(new LyricLine(trimmed, 0, 0, Collections.emptyList(), section));
        }
        if (lines.isEmpty()) return null;
        return new ParsedLyrics(TimingType.NONE, null, fallbackDurationMs, lines);
    }

    private static ParsedLyrics downgradeToLine(ParsedLyrics wordLyrics) {
        List<LyricLine> downgraded = new ArrayList<>(wordLyrics.lines.size());
        for (LyricLine line : wordLyrics.lines) {
            downgraded.add(new LyricLine(line.text, line.startMs, line.endMs, Collections.emptyList(), line.sectionIndex));
        }
        return new ParsedLyrics(TimingType.LINE, wordLyrics.language, wordLyrics.durationMs, downgraded);
    }

    private static TtmlResult renderTtml(
            ParsedLyrics parsed,
            int fallbackDurationMs,
            int offsetMs,
            String fallbackLang) {
        String lang = parsed.language != null && !parsed.language.trim().isEmpty()
                ? parsed.language.trim()
                : (fallbackLang != null && !fallbackLang.trim().isEmpty() ? fallbackLang.trim() : "und");

        if (parsed.timing == TimingType.NONE) {
            int durMs = Math.max(1000, Math.max(fallbackDurationMs, parsed.durationMs));
            StringBuilder sb = new StringBuilder(Math.max(512, parsed.lines.size() * 64));
            appendTtmlHeader(sb, "None", lang, durMs);
            int currentSection = -1;
            int keyIndex = 1;
            for (LyricLine line : parsed.lines) {
                String cleanText = sanitizeXmlText(line.text);
                if (cleanText.trim().isEmpty()) continue;
                if (line.sectionIndex != currentSection) {
                    if (currentSection >= 0) sb.append("</div>");
                    sb.append("<div>");
                    currentSection = line.sectionIndex;
                }
                sb.append("<p ttm:agent=\"v1\" itunes:key=\"L").append(keyIndex++).append("\">")
                        .append(escapeXml(cleanText))
                        .append("</p>");
            }
            if (currentSection >= 0) sb.append("</div>");
            sb.append("</body></tt>");
            if (keyIndex == 1) return TtmlResult.none();
            return new TtmlResult(sb.toString(), LrclibModels.LyricsSource.LRCLIB_PLAIN, keyIndex - 1, false);
        }

        // Shift timestamps by offsetMs and enforce strict monotonic invariants for TTMLParser.
        List<LyricLine> shifted = new ArrayList<>(parsed.lines.size());
        int maxEndMs = Math.max(fallbackDurationMs, parsed.durationMs);
        for (LyricLine line : parsed.lines) {
            int lStart = Math.max(0, line.startMs + offsetMs);
            int lEnd = Math.max(lStart + 100, line.endMs + offsetMs);
            List<WordSpan> normalizedWords = Collections.emptyList();
            if (parsed.timing == TimingType.WORD) {
                normalizedWords = normalizeWordSpans(line, lStart, lEnd, offsetMs);
                for (WordSpan ws : normalizedWords) {
                    if (ws.endMs > lEnd) lEnd = ws.endMs;
                }
            }
            if (lEnd > maxEndMs) maxEndMs = lEnd;
            shifted.add(new LyricLine(line.text, lStart, lEnd, normalizedWords, line.sectionIndex));
        }

        if (shifted.isEmpty()) return TtmlResult.none();
        int bodyDurMs = Math.max(1000, maxEndMs);
        int divBegin = shifted.get(0).startMs;
        int divEnd = shifted.get(shifted.size() - 1).endMs;
        if (divEnd <= divBegin) divEnd = divBegin + 1000;
        if (divEnd > bodyDurMs) bodyDurMs = divEnd;

        boolean isWord = parsed.timing == TimingType.WORD;
        StringBuilder sb = new StringBuilder(Math.max(1024, shifted.size() * (isWord ? 220 : 96)));
        appendTtmlHeader(sb, isWord ? "Word" : "Line", lang, bodyDurMs);
        sb.append("<div begin=\"").append(formatTtmlTime(divBegin))
                .append("\" end=\"").append(formatTtmlTime(divEnd)).append("\">");

        int emitted = 0;
        for (LyricLine line : shifted) {
            if (isWord) {
                String spansXml = renderWordSpansXml(line);
                if (spansXml.isEmpty()) continue;
                emitted++;
                sb.append("<p begin=\"").append(formatTtmlTime(line.startMs))
                        .append("\" end=\"").append(formatTtmlTime(line.endMs))
                        .append("\" ttm:agent=\"v1\" itunes:key=\"L").append(emitted).append("\">")
                        .append(spansXml)
                        .append("</p>");
            } else {
                String cleanText = sanitizeXmlText(line.text).trim();
                if (cleanText.isEmpty()) continue;
                emitted++;
                sb.append("<p begin=\"").append(formatTtmlTime(line.startMs))
                        .append("\" end=\"").append(formatTtmlTime(line.endMs))
                        .append("\" ttm:agent=\"v1\" itunes:key=\"L").append(emitted).append("\">")
                        .append(escapeXml(cleanText))
                        .append("</p>");
            }
        }

        sb.append("</div></body></tt>");
        if (emitted == 0) return TtmlResult.none();
        return new TtmlResult(
                sb.toString(),
                isWord ? LrclibModels.LyricsSource.LRCLIB_WORD : LrclibModels.LyricsSource.LRCLIB_LINE,
                emitted,
                isWord
        );
    }

    private static List<WordSpan> normalizeWordSpans(LyricLine line, int lineStart, int lineEnd, int offsetMs) {
        if (line.words.isEmpty()) {
            String clean = sanitizeXmlText(line.text).trim();
            if (clean.isEmpty()) return Collections.emptyList();
            return Collections.singletonList(new WordSpan(clean, lineStart, Math.max(lineStart + 50, lineEnd)));
        }

        List<WordSpan> out = new ArrayList<>(line.words.size());
        int effectiveLineEnd = Math.max(lineStart + 50, lineEnd);
        for (int i = 0; i < line.words.size(); i++) {
            WordSpan raw = line.words.get(i);
            String text = sanitizeXmlText(raw.text);
            if (text.isEmpty()) continue;
            int ws = Math.max(lineStart, raw.startMs + offsetMs);
            int we = raw.endMs + offsetMs;
            if (we > effectiveLineEnd) {
                we = effectiveLineEnd;
            }
            if (ws >= effectiveLineEnd) {
                ws = Math.max(lineStart, effectiveLineEnd - 50);
                we = effectiveLineEnd;
            }
            if (we <= ws) {
                we = Math.min(effectiveLineEnd, ws + 50);
                if (we <= ws) {
                    effectiveLineEnd = ws + 50;
                    we = effectiveLineEnd;
                }
            }
            out.add(new WordSpan(text, ws, we));
        }
        return out;
    }

    /**
     * Renders word spans keeping leading/trailing spaces OUTSIDE {@code <span>} elements
     * so Apple Music's native LyricsLineParser preserves word spacing and never sees whitespace-only spans.
     */
    private static String renderWordSpansXml(LyricLine line) {
        StringBuilder sb = new StringBuilder();
        boolean emittedAnySpan = false;
        StringBuilder pendingSpace = new StringBuilder();

        for (WordSpan span : line.words) {
            String text = span.text;
            int len = text.length();
            int firstNonSpace = 0;
            while (firstNonSpace < len && Character.isWhitespace(text.charAt(firstNonSpace))) {
                firstNonSpace++;
            }
            int lastNonSpace = len - 1;
            while (lastNonSpace >= firstNonSpace && Character.isWhitespace(text.charAt(lastNonSpace))) {
                lastNonSpace--;
            }

            if (firstNonSpace > lastNonSpace) {
                // Whitespace-only token: preserve space between words.
                if (emittedAnySpan && pendingSpace.length() == 0) {
                    pendingSpace.append(' ');
                }
                continue;
            }

            if (emittedAnySpan && (firstNonSpace > 0 || pendingSpace.length() > 0)) {
                sb.append(' ');
            }
            pendingSpace.setLength(0);

            String core = text.substring(firstNonSpace, lastNonSpace + 1);
            sb.append("<span begin=\"").append(formatTtmlTime(span.startMs))
                    .append("\" end=\"").append(formatTtmlTime(span.endMs))
                    .append("\">")
                    .append(escapeXml(core))
                    .append("</span>");
            emittedAnySpan = true;

            if (lastNonSpace < len - 1) {
                pendingSpace.append(' ');
            }
        }
        return sb.toString();
    }

    private static void appendTtmlHeader(StringBuilder sb, String timing, String lang, int durationMs) {
        sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        sb.append("<tt xmlns=\"http://www.w3.org/ns/ttml\"");
        sb.append(" xmlns:ttm=\"http://www.w3.org/ns/ttml#metadata\"");
        sb.append(" xmlns:itunes=\"http://music.apple.com/lyric-ttml-internal\"");
        sb.append(" itunes:timing=\"").append(timing).append("\"");
        sb.append(" xml:lang=\"").append(escapeXml(lang)).append("\">");
        sb.append("<head><metadata><ttm:agent type=\"person\" xml:id=\"v1\"/></metadata></head>");
        sb.append("<body dur=\"").append(formatTtmlTime(durationMs)).append("\">");
    }

    static String formatTtmlTime(int totalMs) {
        int clamped = Math.max(0, totalMs);
        int hours = clamped / 3600000;
        int rem = clamped % 3600000;
        int minutes = rem / 60000;
        rem %= 60000;
        int seconds = rem / 1000;
        int millis = rem % 1000;
        if (hours > 0) {
            return String.format(Locale.ROOT, "%d:%02d:%02d.%03d", hours, minutes, seconds, millis);
        }
        return String.format(Locale.ROOT, "%02d:%02d.%03d", minutes, seconds, millis);
    }

    private static List<WordSpan> parseEnhancedWords(String rawText, int lineStartMs, int lineEndMs, int lrcOffsetMs) {
        Matcher m = ENHANCED_WORD_TAG.matcher(rawText);
        List<int[]> tagRanges = new ArrayList<>();
        List<Integer> tagTimes = new ArrayList<>();
        while (m.find()) {
            int ts = parseLrcTimestamp(m);
            if (ts >= 0) {
                tagRanges.add(new int[]{m.start(), m.end()});
                tagTimes.add(Math.max(0, ts - lrcOffsetMs));
            }
        }
        if (tagRanges.isEmpty()) return Collections.emptyList();

        List<WordSpan> spans = new ArrayList<>();
        String prefix = rawText.substring(0, tagRanges.get(0)[0]);
        if (!prefix.trim().isEmpty()) {
            int firstTagTime = tagTimes.get(0);
            spans.add(new WordSpan(prefix, lineStartMs, Math.max(lineStartMs + 50, firstTagTime)));
        }
        for (int i = 0; i < tagRanges.size(); i++) {
            int textStart = tagRanges.get(i)[1];
            int textEnd = (i + 1 < tagRanges.size()) ? tagRanges.get(i + 1)[0] : rawText.length();
            String piece = rawText.substring(textStart, textEnd);
            if (piece.isEmpty()) continue;
            int ws = tagTimes.get(i);
            int we = (i + 1 < tagRanges.size()) ? tagTimes.get(i + 1) : lineEndMs;
            if (we <= ws) we = Math.max(ws + 50, lineEndMs);
            spans.add(new WordSpan(piece, ws, we));
        }
        return spans;
    }

    private static String stripEnhancedTags(String text) {
        if (text == null || text.indexOf('<') < 0) return text == null ? "" : text;
        return ENHANCED_WORD_TAG.matcher(text).replaceAll("");
    }

    private static int parseLrcTimestamp(Matcher m) {
        try {
            if (m.group(4) != null) {
                // hh:mm:ss.xxx
                int h = Integer.parseInt(m.group(1));
                int min = Integer.parseInt(m.group(2));
                int sec = Integer.parseInt(m.group(4));
                int ms = parseFractionalMs(m.group(5));
                return h * 3600000 + min * 60000 + sec * 1000 + ms;
            }
            int min = Integer.parseInt(m.group(1));
            int sec = Integer.parseInt(m.group(2));
            int ms = parseFractionalMs(m.group(3));
            return min * 60000 + sec * 1000 + ms;
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    private static int parseFractionalMs(String frac) {
        if (frac == null || frac.isEmpty()) return 0;
        if (frac.length() == 1) return Integer.parseInt(frac) * 100;
        if (frac.length() == 2) return Integer.parseInt(frac) * 10;
        return Integer.parseInt(frac.substring(0, 3));
    }

    private static void applyLineField(MutableLine line, String entry) {
        int colon = entry.indexOf(':');
        if (colon <= 0) return;
        String key = entry.substring(0, colon).trim();
        String val = entry.substring(colon + 1).trim();
        if ("text".equals(key)) {
            line.text = unquoteYaml(val);
        } else if ("start_ms".equals(key)) {
            line.startMs = parseIntSafe(unquoteYaml(val), -1);
        } else if ("end_ms".equals(key)) {
            line.endMs = parseIntSafe(unquoteYaml(val), -1);
        }
    }

    private static void applyWordField(MutableWord word, String entry) {
        int colon = entry.indexOf(':');
        if (colon <= 0) return;
        String key = entry.substring(0, colon).trim();
        String val = entry.substring(colon + 1).trim();
        if ("text".equals(key)) {
            word.text = unquoteYaml(val);
        } else if ("start_ms".equals(key)) {
            word.startMs = parseIntSafe(unquoteYaml(val), -1);
        } else if ("end_ms".equals(key)) {
            word.endMs = parseIntSafe(unquoteYaml(val), -1);
        }
    }

    static String unquoteYaml(String raw) {
        if (raw == null) return "";
        String s = raw.trim();
        if (s.isEmpty() || "null".equals(s) || "~".equals(s)) return "";
        if (s.length() >= 2 && s.charAt(0) == '\'' && s.charAt(s.length() - 1) == '\'') {
            return s.substring(1, s.length() - 1).replace("''", "'");
        }
        if (s.length() >= 2 && s.charAt(0) == '"' && s.charAt(s.length() - 1) == '"') {
            String inner = s.substring(1, s.length() - 1);
            StringBuilder out = new StringBuilder(inner.length());
            for (int i = 0; i < inner.length(); i++) {
                char c = inner.charAt(i);
                if (c == '\\' && i + 1 < inner.length()) {
                    char next = inner.charAt(++i);
                    switch (next) {
                        case 'n': out.append('\n'); break;
                        case 'r': out.append('\r'); break;
                        case 't': out.append('\t'); break;
                        case '"': out.append('"'); break;
                        case '\\': out.append('\\'); break;
                        case 'u':
                            if (i + 4 < inner.length()) {
                                try {
                                    out.append((char) Integer.parseInt(inner.substring(i + 1, i + 5), 16));
                                    i += 4;
                                } catch (NumberFormatException ignored) {
                                    out.append("\\u");
                                }
                            } else {
                                out.append("\\u");
                            }
                            break;
                        default:
                            out.append(next);
                            break;
                    }
                } else {
                    out.append(c);
                }
            }
            return out.toString();
        }
        return s;
    }

    private static int countLeadingSpaces(String line) {
        int i = 0;
        while (i < line.length() && line.charAt(i) == ' ') i++;
        return i;
    }

    private static int parseIntSafe(String s, int fallback) {
        if (s == null || s.isEmpty()) return fallback;
        try {
            return Integer.parseInt(s.trim());
        } catch (NumberFormatException e) {
            return fallback;
        }
    }

    private static String sanitizeXmlText(String text) {
        if (text == null || text.isEmpty()) return "";
        StringBuilder sb = new StringBuilder(text.length());
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (c == '\t' || c == '\n' || c == '\r' || (c >= 0x20 && c <= 0xD7FF) || (c >= 0xE000 && c <= 0xFFFD)) {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    private static String escapeXml(String text) {
        if (text == null || text.isEmpty()) return "";
        StringBuilder sb = new StringBuilder(text.length() + 16);
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            switch (c) {
                case '&': sb.append("&amp;"); break;
                case '<': sb.append("&lt;"); break;
                case '>': sb.append("&gt;"); break;
                case '"': sb.append("&quot;"); break;
                case '\'': sb.append("&apos;"); break;
                default: sb.append(c); break;
            }
        }
        return sb.toString();
    }

    private static final class MutableLine {
        String text = "";
        int startMs = -1;
        int endMs = -1;
        final List<MutableWord> words = new ArrayList<>();
    }

    private static final class MutableWord {
        String text = "";
        int startMs = -1;
        int endMs = -1;
    }

    private static final class RawLrcEntry {
        final int startMs;
        final int order;
        final String rawText;

        RawLrcEntry(int startMs, int order, String rawText) {
            this.startMs = startMs;
            this.order = order;
            this.rawText = rawText;
        }
    }
}
