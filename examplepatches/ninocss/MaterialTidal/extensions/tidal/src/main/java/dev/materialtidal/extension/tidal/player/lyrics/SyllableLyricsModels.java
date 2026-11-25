package dev.materialtidal.extension.tidal.player.lyrics;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Pure-Java immutable models for syllable- and word-synced lyrics.
 * Zero Android dependencies so JVM unit tests can verify parsers directly.
 */
public final class SyllableLyricsModels {

    private SyllableLyricsModels() {
    }

    public static final class SyllableSpan {
        public final String text;
        public final long startMs;
        public final long endMs;

        public SyllableSpan(String text, long startMs, long endMs) {
            this.text = text != null ? text : "";
            this.startMs = Math.max(0L, startMs);
            this.endMs = Math.max(this.startMs + 1L, endMs);
        }
    }

    public static final class WordGroup {
        public final String text;
        public final boolean trailingSpace;
        public final List<SyllableSpan> syllables;
        public final long startMs;
        public final long endMs;
        public final boolean isBackground;
        public final boolean isLongSwell;

        public WordGroup(
                String text,
                boolean trailingSpace,
                List<SyllableSpan> syllables,
                long startMs,
                long endMs,
                boolean isBackground
        ) {
            this.text = text != null ? text : "";
            this.trailingSpace = trailingSpace;
            this.syllables = syllables != null
                    ? Collections.unmodifiableList(new ArrayList<>(syllables))
                    : Collections.emptyList();
            this.startMs = Math.max(0L, startMs);
            this.endMs = Math.max(this.startMs + 1L, endMs);
            this.isBackground = isBackground;
            this.isLongSwell = !isBackground && (this.endMs - this.startMs) >= 1000L && this.text.length() <= 10;
        }
    }

    public static final class LyricLineData {
        public final String fullText;
        public final long startMs;
        public final long endMs;
        public final List<WordGroup> words;
        public final List<WordGroup> bgWords;
        public final boolean isOppositeSide;
        public final boolean isInstrumentalBreak;

        public LyricLineData(
                String fullText,
                long startMs,
                long endMs,
                List<WordGroup> words,
                List<WordGroup> bgWords,
                boolean isOppositeSide,
                boolean isInstrumentalBreak
        ) {
            this.fullText = fullText != null ? fullText : "";
            this.startMs = Math.max(0L, startMs);
            this.endMs = Math.max(this.startMs + 1L, endMs);
            this.words = words != null
                    ? Collections.unmodifiableList(new ArrayList<>(words))
                    : Collections.emptyList();
            this.bgWords = bgWords != null
                    ? Collections.unmodifiableList(new ArrayList<>(bgWords))
                    : Collections.emptyList();
            this.isOppositeSide = isOppositeSide;
            this.isInstrumentalBreak = isInstrumentalBreak;
        }
    }

    public static final class SyllableLyricsDocument {
        public final String providerName;
        public final boolean hasWordOrSyllableTiming;
        public final boolean isLineSynced;
        public final boolean isAiAligned;
        public final List<LyricLineData> lines;

        public SyllableLyricsDocument(
                String providerName,
                boolean hasWordOrSyllableTiming,
                boolean isAiAligned,
                List<LyricLineData> lines
        ) {
            this(providerName, hasWordOrSyllableTiming, hasWordOrSyllableTiming, isAiAligned, lines);
        }

        public SyllableLyricsDocument(
                String providerName,
                boolean hasWordOrSyllableTiming,
                boolean isLineSynced,
                boolean isAiAligned,
                List<LyricLineData> lines
        ) {
            this.providerName = providerName != null ? providerName : "";
            this.hasWordOrSyllableTiming = hasWordOrSyllableTiming;
            this.isLineSynced = isLineSynced;
            this.isAiAligned = isAiAligned;
            this.lines = lines != null
                    ? Collections.unmodifiableList(new ArrayList<>(lines))
                    : Collections.emptyList();
        }
    }

    /**
     * Stateful builder that merges adjacent syllable/word spans without intervening
     * whitespace into a single {@link WordGroup} while splitting whitespace-delimited
     * and CJK tokens cleanly.
     */
    public static final class SyllableWordBuilder {
        private final boolean isBackground;
        private final List<WordGroup> out;
        private final StringBuilder textBuf = new StringBuilder();
        private final List<SyllableSpan> sylBuf = new ArrayList<>();
        private long wordStartMs = Long.MAX_VALUE;
        private long wordEndMs = 0L;
        private boolean open = false;

        public SyllableWordBuilder(boolean isBackground, List<WordGroup> out) {
            this.isBackground = isBackground;
            this.out = out;
        }

        public void append(String rawText, long startMs, long endMs) {
            if (rawText == null || rawText.isEmpty()) {
                return;
            }
            boolean leadingSpace = Character.isWhitespace(rawText.charAt(0));
            boolean trailingSpace = Character.isWhitespace(rawText.charAt(rawText.length() - 1));
            String trimmed = rawText.trim();
            if (trimmed.isEmpty()) {
                flush(true);
                return;
            }

            if (containsCjk(trimmed)) {
                flush(true);
                long safeStart = Math.max(0L, startMs);
                long safeEnd = Math.max(safeStart + 40L, endMs);
                List<SyllableSpan> one = new ArrayList<>(1);
                one.add(new SyllableSpan(trimmed, safeStart, safeEnd));
                out.add(new WordGroup(trimmed, trailingSpace, one, safeStart, safeEnd, isBackground));
                return;
            }

            if (leadingSpace && open) {
                flush(true);
            }

            long safeStart = Math.max(0L, startMs);
            long safeEnd = Math.max(safeStart + 40L, endMs);
            textBuf.append(trimmed);
            sylBuf.add(new SyllableSpan(trimmed, safeStart, safeEnd));
            if (safeStart < wordStartMs) wordStartMs = safeStart;
            if (safeEnd > wordEndMs) wordEndMs = safeEnd;
            open = true;

            if (trailingSpace) {
                flush(true);
            }
        }

        public void flush(boolean trailingSpace) {
            if (!open || sylBuf.isEmpty()) {
                if (trailingSpace && !out.isEmpty()) {
                    int idx = out.size() - 1;
                    WordGroup prev = out.get(idx);
                    if (!prev.trailingSpace) {
                        out.set(idx, new WordGroup(
                                prev.text, true, prev.syllables, prev.startMs, prev.endMs, prev.isBackground
                        ));
                    }
                }
                open = false;
                return;
            }
            out.add(new WordGroup(
                    textBuf.toString(),
                    trailingSpace,
                    sylBuf,
                    wordStartMs,
                    Math.max(wordStartMs + 40L, wordEndMs),
                    isBackground
            ));
            textBuf.setLength(0);
            sylBuf.clear();
            wordStartMs = Long.MAX_VALUE;
            wordEndMs = 0L;
            open = false;
        }
    }

    private static final long MIN_INSTRUMENTAL_GAP_MS = 6500L;
    private static final long BREAK_PAD_MS = 400L;
    private static final long INTRO_BREAK_START_MS = 1500L;

    /**
     * Sorts lyric lines stably by start time and inserts instrumental break markers
     * before a long intro (>= 6.5s) and between lines with >= 6.5s silence.
     */
    public static List<LyricLineData> insertInstrumentalBreaks(List<LyricLineData> rawLines) {
        if (rawLines == null || rawLines.isEmpty()) {
            return Collections.emptyList();
        }
        List<LyricLineData> sorted = new ArrayList<>(rawLines.size());
        for (LyricLineData line : rawLines) {
            if (line != null && (!line.words.isEmpty() || !line.bgWords.isEmpty())) {
                sorted.add(line);
            }
        }
        if (sorted.isEmpty()) {
            return Collections.emptyList();
        }

        Collections.sort(sorted, new Comparator<LyricLineData>() {
            @Override
            public int compare(LyricLineData a, LyricLineData b) {
                return Long.compare(a.startMs, b.startMs);
            }
        });

        List<LyricLineData> out = new ArrayList<>(sorted.size() + 4);
        LyricLineData first = sorted.get(0);
        if (first.startMs >= MIN_INSTRUMENTAL_GAP_MS) {
            long breakEnd = Math.max(INTRO_BREAK_START_MS + 1000L, first.startMs - BREAK_PAD_MS);
            out.add(new LyricLineData("", INTRO_BREAK_START_MS, breakEnd, null, null, false, true));
        }

        long maxEndSoFar = first.endMs;
        out.add(first);
        for (int i = 1; i < sorted.size(); i++) {
            LyricLineData next = sorted.get(i);
            long gap = next.startMs - maxEndSoFar;
            if (gap >= MIN_INSTRUMENTAL_GAP_MS) {
                long bStart = maxEndSoFar + BREAK_PAD_MS;
                long bEnd = next.startMs - BREAK_PAD_MS;
                if (bEnd > bStart + 800L) {
                    out.add(new LyricLineData("", bStart, bEnd, null, null, false, true));
                }
            }
            out.add(next);
            if (next.endMs > maxEndSoFar) {
                maxEndSoFar = next.endMs;
            }
        }
        return Collections.unmodifiableList(out);
    }

    public static boolean isCjkCodePoint(int cp) {
        return (cp >= 0x3040 && cp <= 0x309F) // Hiragana
                || (cp >= 0x30A0 && cp <= 0x30FF) // Katakana
                || (cp >= 0x31F0 && cp <= 0x31FF) // Katakana Phonetic Extensions
                || (cp >= 0x3400 && cp <= 0x4DBF) // CJK Ext A
                || (cp >= 0x4E00 && cp <= 0x9FFF) // CJK Unified Ideographs
                || (cp >= 0xAC00 && cp <= 0xD7AF) // Hangul Syllables
                || (cp >= 0x1100 && cp <= 0x11FF) // Hangul Jamo
                || (cp >= 0xF900 && cp <= 0xFAFF); // CJK Compatibility Ideographs
    }

    public static boolean containsCjk(String s) {
        if (s == null || s.isEmpty()) {
            return false;
        }
        int i = 0;
        while (i < s.length()) {
            int cp = s.codePointAt(i);
            if (isCjkCodePoint(cp)) {
                return true;
            }
            i += Character.charCount(cp);
        }
        return false;
    }

    public static String buildLineText(List<WordGroup> words) {
        if (words == null || words.isEmpty()) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < words.size(); i++) {
            WordGroup w = words.get(i);
            sb.append(w.text);
            if (w.trailingSpace && i + 1 < words.size()) {
                sb.append(' ');
            }
        }
        return sb.toString();
    }
}
