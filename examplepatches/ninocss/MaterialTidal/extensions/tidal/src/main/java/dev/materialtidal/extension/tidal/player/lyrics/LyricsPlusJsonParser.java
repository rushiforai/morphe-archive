package dev.materialtidal.extension.tidal.player.lyrics;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.LyricLineData;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.SyllableLyricsDocument;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.SyllableWordBuilder;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.WordGroup;

/**
 * Parses LyricsPlus ({@code /v2/lyrics/get}) and BetterLyrics ({@code /getLyrics}) JSON payloads.
 * Strictly returns {@code null} when LyricsPlus only provides {@code "Line"} timing
 * so playback cleanly falls back to TIDAL's native synced lyrics.
 */
public final class LyricsPlusJsonParser {

    private LyricsPlusJsonParser() {
    }

    public static SyllableLyricsDocument parseLyricsPlus(String jsonBody, String providerLabel) {
        Map<String, Object> root = SimpleJsonParser.asMap(SimpleJsonParser.parse(jsonBody));
        if (root == null) {
            return null;
        }
        String type = SimpleJsonParser.asString(root.get("type"));
        if (type == null || (!"Word".equalsIgnoreCase(type) && !"Syllable".equalsIgnoreCase(type))) {
            return null;
        }

        String finalProvider = providerLabel != null ? providerLabel : "LyricsPlus";
        Map<String, Object> metadata = SimpleJsonParser.asMap(root.get("metadata"));
        if (metadata != null) {
            String source = SimpleJsonParser.asString(metadata.get("source"));
            if (source != null && !source.trim().isEmpty()) {
                finalProvider = finalProvider + " (" + source.trim() + ")";
            }
        }

        List<Object> lyricsArr = SimpleJsonParser.asList(root.get("lyrics"));
        if (lyricsArr == null || lyricsArr.isEmpty()) {
            return null;
        }

        String primarySinger = null;
        List<LyricLineData> parsedLines = new ArrayList<>(lyricsArr.size());
        boolean anyTimedWords = false;

        for (Object lineObj : lyricsArr) {
            Map<String, Object> lineMap = SimpleJsonParser.asMap(lineObj);
            if (lineMap == null) {
                continue;
            }
            List<Object> syllabusArr = SimpleJsonParser.asList(lineMap.get("syllabus"));
            if (syllabusArr == null || syllabusArr.isEmpty()) {
                continue;
            }

            boolean isOppositeSide = false;
            Map<String, Object> elementMap = SimpleJsonParser.asMap(lineMap.get("element"));
            if (elementMap != null) {
                String singer = SimpleJsonParser.asString(elementMap.get("singer"));
                if (singer != null && !singer.trim().isEmpty()) {
                    String s = singer.trim();
                    if (primarySinger == null) {
                        primarySinger = s;
                    } else if (!primarySinger.equals(s) && !"v1000".equalsIgnoreCase(s)) {
                        isOppositeSide = true;
                    }
                }
            }

            List<WordGroup> leadWords = new ArrayList<>();
            List<WordGroup> bgWords = new ArrayList<>();

            SyllableWordBuilder leadBuilder = new SyllableWordBuilder(false, leadWords);
            SyllableWordBuilder bgBuilder = new SyllableWordBuilder(true, bgWords);

            for (Object sylObj : syllabusArr) {
                Map<String, Object> sylMap = SimpleJsonParser.asMap(sylObj);
                if (sylMap == null) {
                    continue;
                }
                String rawText = SimpleJsonParser.asString(sylMap.get("text"));
                Long timeMs = SimpleJsonParser.asLong(sylMap.get("time"));
                Long durMs = SimpleJsonParser.asLong(sylMap.get("duration"));
                if (rawText == null || timeMs == null) {
                    continue;
                }

                long startMs = Math.max(0L, timeMs);
                long d = durMs != null ? Math.max(40L, durMs) : 200L;
                long endMs = startMs + d;
                boolean isBg = SimpleJsonParser.asBool(sylMap.get("isBackground"), false);

                SyllableWordBuilder target = isBg ? bgBuilder : leadBuilder;
                target.append(rawText, startMs, endMs);
            }

            leadBuilder.flush(false);
            bgBuilder.flush(false);

            if (leadWords.isEmpty() && bgWords.isEmpty()) {
                continue;
            }
            anyTimedWords = true;

            Long lineTime = SimpleJsonParser.asLong(lineMap.get("time"));
            Long lineDur = SimpleJsonParser.asLong(lineMap.get("duration"));
            long lineStart = lineTime != null && lineTime >= 0 ? lineTime : Long.MAX_VALUE;
            long lineEnd = (lineTime != null && lineDur != null && lineDur > 0) ? (lineTime + lineDur) : 0L;

            for (WordGroup w : leadWords) {
                if (w.startMs < lineStart) lineStart = w.startMs;
                if (w.endMs > lineEnd) lineEnd = w.endMs;
            }
            for (WordGroup w : bgWords) {
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
            if (fullText.isEmpty() && !bgWords.isEmpty()) {
                fullText = SyllableLyricsModels.buildLineText(bgWords);
            }

            parsedLines.add(new LyricLineData(
                    fullText,
                    lineStart,
                    lineEnd,
                    leadWords,
                    bgWords,
                    isOppositeSide,
                    false
            ));
        }

        if (!anyTimedWords || parsedLines.isEmpty()) {
            return null;
        }

        List<LyricLineData> withBreaks = SyllableLyricsModels.insertInstrumentalBreaks(parsedLines);
        return new SyllableLyricsDocument(finalProvider, true, false, withBreaks);
    }

    public static String extractBetterLyricsTtml(String jsonBody) {
        Map<String, Object> root = SimpleJsonParser.asMap(SimpleJsonParser.parse(jsonBody));
        if (root == null) {
            return null;
        }
        String ttml = SimpleJsonParser.asString(root.get("ttml"));
        if (ttml == null || ttml.trim().isEmpty()) {
            return null;
        }
        return ttml;
    }
}
