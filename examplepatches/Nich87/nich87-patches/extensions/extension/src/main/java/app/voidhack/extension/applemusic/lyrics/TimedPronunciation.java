package app.voidhack.extension.applemusic.lyrics;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.function.UnaryOperator;

final class TimedPronunciation {
    interface Romanizer extends UnaryOperator<String> {
        Reading read(String line, List<SourceSpan> spans);

        @Override
        default String apply(String line) {
            Reading reading = read(line, Collections.emptyList());
            return reading == null ? null : reading.text;
        }
    }

    static final class SourceSpan {
        final int start;
        final int end;
        final String beginTime;
        final String endTime;
        final long beginMs;
        final long endMs;

        SourceSpan(int start, int end, String beginTime, String endTime) {
            this.start = start;
            this.end = end;
            this.beginTime = beginTime;
            this.endTime = endTime;
            beginMs = LyricsEditTtml.timeToMillis(beginTime);
            endMs = LyricsEditTtml.timeToMillis(endTime);
        }
    }

    static final class Part {
        final int start;
        final int end;
        final String text;

        Part(int start, int end, String text) {
            this.start = start;
            this.end = end;
            this.text = text;
        }
    }

    static final class Word {
        final long beginMs;
        final long endMs;
        final String beginTime;
        final String endTime;
        final String text;

        Word(SourceSpan first, SourceSpan last, String text) {
            this(first.beginMs, last.endMs, first.beginTime, last.endTime, text);
        }

        private Word(long beginMs, long endMs, String beginTime, String endTime, String text) {
            this.beginMs = beginMs;
            this.endMs = endMs;
            this.beginTime = beginTime;
            this.endTime = endTime;
            this.text = text;
        }

        Word merge(Word next) {
            return new Word(beginMs, Math.max(endMs, next.endMs), beginTime,
                    endMs >= next.endMs ? endTime : next.endTime, text + " " + next.text);
        }
    }

    static final class Reading {
        final String text;
        final List<Word> words;

        Reading(String text, List<Word> words) {
            this.text = text;
            this.words = words;
        }
    }

    private TimedPronunciation() {}

    static Reading read(UnaryOperator<String> romanize, String line, List<SourceSpan> spans) {
        if (romanize instanceof Romanizer && !spans.isEmpty()) {
            return ((Romanizer) romanize).read(line, spans);
        }
        String text = romanize.apply(line.trim());
        return text == null ? null : new Reading(text, Collections.emptyList());
    }

    static List<Word> align(
            String original, List<Part> parts, List<SourceSpan> source,
            UnaryOperator<String> transliterate, String expected) {
        if (source.size() < 2) return Collections.emptyList();
        for (int i = 0; i < source.size(); i++) {
            SourceSpan span = source.get(i);
            if (span.beginMs < 0 || span.endMs <= span.beginMs
                    || (i > 0 && (span.start < source.get(i - 1).end
                    || span.beginMs < source.get(i - 1).beginMs))) {
                return Collections.emptyList();
            }
        }

        List<Word> result = new ArrayList<>();
        int firstSource = 0;
        for (Part part : splitWords(parts)) {
            while (firstSource < source.size() && source.get(firstSource).end <= part.start) firstSource++;
            SourceSpan first = null;
            SourceSpan last = null;
            int covered = part.start;
            for (int i = firstSource; i < source.size(); i++) {
                SourceSpan span = source.get(i);
                if (span.start >= part.end) break;
                if (hasUntimedLetters(original, covered, span.start)) return Collections.emptyList();
                covered = Math.max(covered, span.end);
                if (first == null) first = span;
                if (last == null || span.endMs > last.endMs) last = span;
            }
            if (hasUntimedLetters(original, covered, part.end)) return Collections.emptyList();

            String text = transliterate.apply(part.text).trim();
            if (text.isEmpty()) continue;
            if (first == null) {
                // Punctuation may be outside a timed span and belongs to the preceding word.
                if (result.isEmpty()) return Collections.emptyList();
                int previousIndex = result.size() - 1;
                Word previous = result.get(previousIndex);
                result.set(previousIndex, new Word(
                        previous.beginMs, previous.endMs, previous.beginTime, previous.endTime, previous.text + " " + text));
                continue;
            }
            Word current = new Word(first, last, text);
            int previousIndex = result.size() - 1;
            if (previousIndex >= 0 && result.get(previousIndex).endMs > current.beginMs) {
                result.set(previousIndex, result.get(previousIndex).merge(current));
            } else {
                result.add(current);
            }
        }
        List<String> texts = new ArrayList<>();
        for (Word word : result) texts.add(word.text);
        // Keep the contextual reading exactly as produced by whole-line transliteration.
        return result.size() >= 2 && String.join(" ", texts).equals(expected) ? result : Collections.emptyList();
    }

    private static boolean hasUntimedLetters(String text, int start, int end) {
        for (int i = start; i < end; ) {
            int cp = text.codePointAt(i);
            if (Character.isLetterOrDigit(cp)) return true;
            i += Character.charCount(cp);
        }
        return false;
    }

    private static List<Part> splitWords(List<Part> parts) {
        List<Part> words = new ArrayList<>();
        StringBuilder word = new StringBuilder();
        int start = 0;
        int end = 0;
        for (Part part : parts) {
            for (int offset = 0; offset < part.text.length();) {
                int codePoint = part.text.codePointAt(offset);
                offset += Character.charCount(codePoint);
                if (Character.isWhitespace(codePoint) || Character.isSpaceChar(codePoint)) {
                    if (word.length() != 0) {
                        words.add(new Part(start, end, word.toString()));
                        word.setLength(0);
                    }
                } else {
                    if (word.length() == 0) start = part.start;
                    end = part.end;
                    word.appendCodePoint(codePoint);
                }
            }
        }
        if (word.length() != 0) words.add(new Part(start, end, word.toString()));
        return words;
    }
}
