package dev.alastorkaneki.morphe.extension.suno;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;

/** Parses Suno's aligned lyric payload and emits common synchronized-lyric formats. */
final class SunoLyricsFormatter {
    enum Format {
        LRC("Line-synced LRC", "lrc", "text/plain"),
        ENHANCED_LRC("Word-synced enhanced LRC", "lrc", "text/plain"),
        SRT("SRT subtitles", "srt", "application/x-subrip"),
        WEBVTT("WebVTT captions", "vtt", "text/vtt"),
        JSON("Raw timing JSON", "json", "application/json");

        final String label;
        final String extension;
        final String mimeType;

        Format(String label, String extension, String mimeType) {
            this.label = label;
            this.extension = extension;
            this.mimeType = mimeType;
        }

        @Override
        public String toString() {
            return label;
        }
    }

    static final class Word {
        final String text;
        double start;
        double end;

        Word(String text, double start, double end) {
            this.text = cleanText(text);
            this.start = start;
            this.end = end;
        }
    }

    static final class Line {
        final String text;
        double start;
        double end;
        final List<Word> words;

        Line(String text, double start, double end, List<Word> words) {
            this.text = cleanText(text);
            this.start = start;
            this.end = end;
            this.words = words == null ? new ArrayList<>() : words;
        }
    }

    static final class ParsedLyrics {
        final String rawJson;
        final List<Line> lines;

        ParsedLyrics(String rawJson, List<Line> lines) {
            this.rawJson = rawJson;
            this.lines = lines;
        }
    }

    private SunoLyricsFormatter() {
    }

    static ParsedLyrics parse(String rawJson) throws JSONException {
        JSONObject root = new JSONObject(rawJson);
        List<Line> lines = parseAlignedLines(root.optJSONArray("aligned_lyrics"));
        if (lines.isEmpty()) {
            lines = groupAlignedWords(parseWords(root.optJSONArray("aligned_words")));
        }
        if (lines.isEmpty()) {
            throw new JSONException("Suno returned no usable aligned lyric timing data.");
        }
        normalize(lines);
        return new ParsedLyrics(root.toString(2), lines);
    }

    static String render(ParsedLyrics lyrics, Format format, String title) {
        switch (format) {
            case ENHANCED_LRC:
                return renderEnhancedLrc(lyrics.lines, title);
            case SRT:
                return renderSrt(lyrics.lines);
            case WEBVTT:
                return renderWebVtt(lyrics.lines);
            case JSON:
                return lyrics.rawJson + "\n";
            case LRC:
            default:
                return renderLrc(lyrics.lines, title);
        }
    }

    private static List<Line> parseAlignedLines(JSONArray array) {
        if (array == null) {
            return new ArrayList<>();
        }
        List<Line> lines = new ArrayList<>();
        for (int index = 0; index < array.length(); index++) {
            JSONObject object = array.optJSONObject(index);
            if (object == null) {
                continue;
            }

            List<Word> words = parseWords(object.optJSONArray("words"));
            String text = firstNonEmpty(object.optString("text", ""), object.optString("word", ""));
            if (cleanText(text).isEmpty() && !words.isEmpty()) {
                text = joinWords(words);
            }

            double start = readNumber(object, "start_s");
            double end = readNumber(object, "end_s");
            if (!words.isEmpty()) {
                double wordStart = minimumStart(words);
                double wordEnd = maximumEnd(words);
                if (isFinite(wordStart)) {
                    start = wordStart;
                }
                if (isFinite(wordEnd)) {
                    end = wordEnd;
                }
            }

            if (!cleanText(text).isEmpty()) {
                lines.add(new Line(text, start, end, words));
            }
        }
        return lines;
    }

    private static List<Word> parseWords(JSONArray array) {
        if (array == null) {
            return new ArrayList<>();
        }
        List<Word> words = new ArrayList<>();
        for (int index = 0; index < array.length(); index++) {
            JSONObject object = array.optJSONObject(index);
            if (object == null) {
                continue;
            }
            String text = firstNonEmpty(object.optString("text", ""), object.optString("word", ""));
            if (text.isEmpty()) {
                continue;
            }
            words.add(new Word(
                    text,
                    readNumber(object, "start_s"),
                    readNumber(object, "end_s")
            ));
        }
        return words;
    }

    private static List<Line> groupAlignedWords(List<Word> words) {
        if (words.isEmpty()) {
            return new ArrayList<>();
        }

        List<Line> lines = new ArrayList<>();
        List<Word> current = new ArrayList<>();
        double previousEnd = Double.NaN;

        for (Word original : words) {
            String raw = original.text;
            boolean startsNewLine = raw.startsWith("\n") || raw.startsWith("\r");
            boolean endsLine = raw.contains("\n") || raw.contains("\r");
            double gap = isFinite(previousEnd) && isFinite(original.start)
                    ? original.start - previousEnd
                    : 0;

            if (!current.isEmpty() && (startsNewLine || (gap > 1.35 && current.size() >= 2))) {
                addGroupedLine(lines, current);
                current = new ArrayList<>();
            }

            String cleaned = cleanText(raw);
            if (!cleaned.isEmpty()) {
                current.add(new Word(cleaned, original.start, original.end));
            }

            boolean punctuationBreak = cleaned.matches(".*[.!?。！？…]$") && current.size() >= 5;
            if (!current.isEmpty() && (endsLine || punctuationBreak)) {
                addGroupedLine(lines, current);
                current = new ArrayList<>();
            }
            if (isFinite(original.end)) {
                previousEnd = original.end;
            }
        }

        addGroupedLine(lines, current);
        return lines;
    }

    private static void addGroupedLine(List<Line> output, List<Word> words) {
        if (words == null || words.isEmpty()) {
            return;
        }
        output.add(new Line(
                joinWords(words),
                minimumStart(words),
                maximumEnd(words),
                new ArrayList<>(words)
        ));
    }

    private static void normalize(List<Line> lines) {
        double previousStart = 0;
        double previousEnd = 0;

        for (int index = 0; index < lines.size(); index++) {
            Line line = lines.get(index);
            if (!isFinite(line.start)) {
                line.start = previousEnd;
            }
            line.start = Math.max(0, Math.max(line.start, previousStart));

            if (!isFinite(line.end) || line.end <= line.start) {
                double nextStart = findNextStart(lines, index + 1, line.start);
                line.end = isFinite(nextStart) ? nextStart : line.start + 2.0;
            }
            line.end = Math.max(line.start + 0.05, line.end);

            normalizeWords(line);
            previousStart = line.start;
            previousEnd = line.end;
        }
    }

    private static void normalizeWords(Line line) {
        if (line.words.isEmpty()) {
            return;
        }

        double span = Math.max(0.05, line.end - line.start);
        double slice = span / line.words.size();
        double cursor = line.start;
        for (int index = 0; index < line.words.size(); index++) {
            Word word = line.words.get(index);
            if (!isFinite(word.start)) {
                word.start = cursor;
            }
            word.start = Math.max(line.start, Math.max(cursor, word.start));

            if (!isFinite(word.end) || word.end <= word.start) {
                word.end = index + 1 < line.words.size()
                        ? findNextWordStart(line.words, index + 1, word.start)
                        : line.end;
                if (!isFinite(word.end) || word.end <= word.start) {
                    word.end = Math.min(line.end, word.start + slice);
                }
            }
            word.end = Math.min(line.end, Math.max(word.start + 0.01, word.end));
            cursor = word.end;
        }
    }

    private static double findNextStart(List<Line> lines, int from, double after) {
        for (int index = from; index < lines.size(); index++) {
            double candidate = lines.get(index).start;
            if (isFinite(candidate) && candidate > after) {
                return candidate;
            }
        }
        return Double.NaN;
    }

    private static double findNextWordStart(List<Word> words, int from, double after) {
        for (int index = from; index < words.size(); index++) {
            double candidate = words.get(index).start;
            if (isFinite(candidate) && candidate > after) {
                return candidate;
            }
        }
        return Double.NaN;
    }

    private static String renderLrc(List<Line> lines, String title) {
        StringBuilder output = new StringBuilder();
        appendLrcMetadata(output, title);
        for (Line line : lines) {
            output.append('[').append(formatLrcTime(line.start)).append(']')
                    .append(line.text).append('\n');
        }
        return output.toString();
    }

    private static String renderEnhancedLrc(List<Line> lines, String title) {
        StringBuilder output = new StringBuilder();
        appendLrcMetadata(output, title);
        for (Line line : lines) {
            output.append('[').append(formatLrcTime(line.start)).append(']');
            if (line.words.isEmpty()) {
                output.append(line.text);
            } else {
                for (int index = 0; index < line.words.size(); index++) {
                    Word word = line.words.get(index);
                    output.append('<').append(formatLrcTime(word.start)).append('>');
                    appendWord(output, word.text, index > 0);
                }
            }
            output.append('\n');
        }
        return output.toString();
    }

    private static void appendLrcMetadata(StringBuilder output, String title) {
        if (title != null && !title.trim().isEmpty()) {
            output.append("[ti:").append(title.trim().replace(']', ')')).append("]\n");
        }
        output.append("[by:Alastor Kaneki Morphe Patch]\n");
    }

    private static String renderSrt(List<Line> lines) {
        StringBuilder output = new StringBuilder();
        int cue = 1;
        for (Line line : lines) {
            output.append(cue++).append('\n')
                    .append(formatSubtitleTime(line.start, ','))
                    .append(" --> ")
                    .append(formatSubtitleTime(line.end, ','))
                    .append('\n')
                    .append(line.text)
                    .append("\n\n");
        }
        return output.toString();
    }

    private static String renderWebVtt(List<Line> lines) {
        StringBuilder output = new StringBuilder("WEBVTT\n\n");
        for (Line line : lines) {
            output.append(formatSubtitleTime(line.start, '.'))
                    .append(" --> ")
                    .append(formatSubtitleTime(line.end, '.'))
                    .append('\n')
                    .append(line.text)
                    .append("\n\n");
        }
        return output.toString();
    }

    private static String formatLrcTime(double seconds) {
        long centiseconds = Math.max(0, Math.round(seconds * 100));
        long minutes = centiseconds / 6000;
        long remainder = centiseconds % 6000;
        long wholeSeconds = remainder / 100;
        long fraction = remainder % 100;
        return String.format(Locale.US, "%02d:%02d.%02d", minutes, wholeSeconds, fraction);
    }

    private static String formatSubtitleTime(double seconds, char decimalSeparator) {
        long millis = Math.max(0, Math.round(seconds * 1000));
        long hours = millis / 3_600_000;
        millis %= 3_600_000;
        long minutes = millis / 60_000;
        millis %= 60_000;
        long wholeSeconds = millis / 1000;
        long fraction = millis % 1000;
        return String.format(
                Locale.US,
                "%02d:%02d:%02d%c%03d",
                hours,
                minutes,
                wholeSeconds,
                decimalSeparator,
                fraction
        );
    }

    private static String joinWords(List<Word> words) {
        StringBuilder output = new StringBuilder();
        for (int index = 0; index < words.size(); index++) {
            appendWord(output, words.get(index).text, index > 0);
        }
        return cleanText(output.toString());
    }

    private static void appendWord(StringBuilder output, String text, boolean hasPrevious) {
        String cleaned = cleanText(text);
        if (cleaned.isEmpty()) {
            return;
        }
        boolean punctuation = cleaned.matches("^[,.;:!?%)}\\]’'。！？，、…].*");
        boolean previousOpens = output.length() > 0 && "([{“\"".indexOf(output.charAt(output.length() - 1)) >= 0;
        if (hasPrevious && output.length() > 0 && !punctuation && !previousOpens) {
            output.append(' ');
        }
        output.append(cleaned);
    }

    private static double minimumStart(List<Word> words) {
        return words.stream()
                .map(word -> word.start)
                .filter(SunoLyricsFormatter::isFinite)
                .min(Comparator.naturalOrder())
                .orElse(Double.NaN);
    }

    private static double maximumEnd(List<Word> words) {
        return words.stream()
                .map(word -> word.end)
                .filter(SunoLyricsFormatter::isFinite)
                .max(Comparator.naturalOrder())
                .orElse(Double.NaN);
    }

    private static double readNumber(JSONObject object, String key) {
        Object value = object.opt(key);
        if (value instanceof Number) {
            double number = ((Number) value).doubleValue();
            return isFinite(number) ? number : Double.NaN;
        }
        if (value instanceof String) {
            try {
                double number = Double.parseDouble((String) value);
                return isFinite(number) ? number : Double.NaN;
            } catch (NumberFormatException ignored) {
                return Double.NaN;
            }
        }
        return Double.NaN;
    }

    private static String firstNonEmpty(String first, String second) {
        return cleanText(first).isEmpty() ? second : first;
    }

    private static String cleanText(String text) {
        if (text == null) {
            return "";
        }
        return text
                .replace("\r", "")
                .replaceAll("[\\u200B-\\u200D\\u2060\\uFEFF]", "")
                .replaceAll("[\\t ]+", " ")
                .trim();
    }

    private static boolean isFinite(double value) {
        return !Double.isNaN(value) && !Double.isInfinite(value);
    }
}
