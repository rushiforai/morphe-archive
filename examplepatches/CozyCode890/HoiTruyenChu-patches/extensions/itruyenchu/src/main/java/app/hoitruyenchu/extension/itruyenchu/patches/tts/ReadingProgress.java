package app.hoitruyenchu.extension.itruyenchu.patches.tts;

import android.os.SystemClock;

import java.util.ArrayList;
import java.util.LinkedList;

/**
 * Estimates where the TTS reading is inside the current chapter, for the media widget.
 * <p>
 * The app reads a chapter line by line (the lines of its text split on new lines, trimmed, empty
 * ones dropped). The chapter texts downloaded by the app are captured (see
 * {@code ChapterTextInterceptor}), so each spoken line can be found in its chapter. Time is
 * estimated from the number of characters, at a speed measured on the lines already read.
 */
public final class ReadingProgress {
    /** Placeholder for an unknown duration (media3 C.TIME_UNSET). */
    public static final long TIME_UNSET = Long.MIN_VALUE + 1;

    private static final int MAX_CHAPTERS = 4;
    private static final double DEFAULT_MS_PER_CHAR = 75; // Vietnamese voice at speed 1.0

    private static final class Chapter {
        final String[] keys;
        final int[] lengths;
        /** cumulative[i] = characters before line i, cumulative[n] = total. */
        final long[] cumulative;

        Chapter(ArrayList<String> lines) {
            int n = lines.size();
            keys = new String[n];
            lengths = new int[n];
            cumulative = new long[n + 1];
            for (int i = 0; i < n; i++) {
                String line = lines.get(i);
                keys[i] = key(line);
                lengths[i] = Math.max(1, line.length());
                cumulative[i + 1] = cumulative[i] + lengths[i];
            }
        }

        int find(String key, int from) {
            int n = keys.length;
            if (n == 0) return -1;
            int start = Math.max(0, Math.min(from, n - 1));
            for (int i = start; i < n; i++) if (keys[i].equals(key)) return i;
            for (int i = 0; i < start; i++) if (keys[i].equals(key)) return i;
            return -1;
        }
    }

    private static final Object lock = new Object();
    private static final LinkedList<Chapter> recent = new LinkedList<>();

    private static Chapter chapter;
    /** Index of the current line in chapter, chapter length for "end of chapter", -1 if unknown. */
    private static int index = -1;
    private static boolean lineDone;
    private static long lineStartedAt;
    private static float rate = 1f;
    private static double msPerCharAt1x = DEFAULT_MS_PER_CHAR;
    /** Fallback when the chapter text is unknown: reading time since the first line. */
    private static long unknownStartedAt;
    private static long unknownElapsed;
    private static int serial;

    private ReadingProgress() {
    }

    // ---------------------------------------------------------------------------------------------
    // Input

    /** A text downloaded by the app that may be a chapter. */
    public static void onChapterText(String text) {
        if (text == null || text.length() < 50) return;
        ArrayList<String> lines = splitLines(text);
        if (lines.size() < 2) return;
        Chapter parsed = new Chapter(lines);
        synchronized (lock) {
            recent.addFirst(parsed);
            while (recent.size() > MAX_CHAPTERS) recent.removeLast();
        }
    }

    /** The engine started speaking a line. */
    static void onLineStarted(String text, Float speechRate) {
        if (text == null) return;
        synchronized (lock) {
            if (speechRate != null && speechRate > 0) rate = speechRate;
            String key = key(text);
            int found = chapter != null ? chapter.find(key, index) : -1;
            if (found < 0) {
                for (Chapter c : recent) {
                    int i = c.find(key, 0);
                    if (i >= 0) {
                        if (c != chapter) unknownElapsed = 0;
                        chapter = c;
                        found = i;
                        break;
                    }
                }
            }
            if (found >= 0) {
                index = found;
            } else if (chapter != null && index >= 0 && index >= chapter.keys.length - 1) {
                index = chapter.keys.length; // "Hết chương" after the last line
            } else if (chapter != null && index >= 0) {
                // Unknown line inside a known chapter: keep the position.
            } else {
                chapter = null;
                index = -1;
            }
            lineDone = false;
            lineStartedAt = SystemClock.elapsedRealtime();
            if (unknownStartedAt == 0) unknownStartedAt = lineStartedAt;
            serial++;
        }
    }

    /** The engine finished a line normally. */
    static void onLineDone() {
        synchronized (lock) {
            long now = SystemClock.elapsedRealtime();
            if (lineStartedAt > 0 && chapter != null && index >= 0 && index < chapter.lengths.length) {
                int length = chapter.lengths[index];
                long elapsed = now - lineStartedAt;
                if (length >= 15 && elapsed > 0) {
                    double measured = elapsed * (double) rate / length;
                    if (measured > 10 && measured < 600) {
                        msPerCharAt1x = 0.75 * msPerCharAt1x + 0.25 * measured;
                    }
                }
            }
            stopClockLocked(now);
            lineDone = true;
        }
    }

    /** The current line was stopped before its end (pause, stop, call): it is read again later. */
    static void onLineInterrupted() {
        synchronized (lock) {
            stopClockLocked(SystemClock.elapsedRealtime());
            lineDone = false;
        }
    }

    private static void stopClockLocked(long now) {
        if (lineStartedAt > 0 && unknownStartedAt > 0) unknownElapsed += now - lineStartedAt;
        unknownStartedAt = 0;
        lineStartedAt = 0;
    }

    // ---------------------------------------------------------------------------------------------
    // Output

    /** Estimated chapter duration in ms, or TIME_UNSET. */
    public static long durationMs() {
        synchronized (lock) {
            if (chapter == null) return TIME_UNSET;
            return (long) (chapter.cumulative[chapter.keys.length] * msPerCharLocked());
        }
    }

    /** Estimated position in the chapter in ms. */
    public static long positionMs() {
        synchronized (lock) {
            long now = SystemClock.elapsedRealtime();
            if (chapter == null || index < 0) {
                long running = lineStartedAt > 0 ? now - lineStartedAt : 0;
                return Math.max(0, unknownElapsed + running);
            }
            double msPerChar = msPerCharLocked();
            int n = chapter.keys.length;
            if (index >= n) return (long) (chapter.cumulative[n] * msPerChar);
            double chars = chapter.cumulative[index];
            if (lineDone) {
                chars += chapter.lengths[index];
            } else if (lineStartedAt > 0) {
                chars += Math.min(chapter.lengths[index], (now - lineStartedAt) / msPerChar);
            }
            return (long) (chars * msPerChar);
        }
    }

    /** Line number (1-based) and line count, or null when unknown. */
    public static int[] lineInfo() {
        synchronized (lock) {
            if (chapter == null || index < 0) return null;
            int n = chapter.keys.length;
            return new int[]{Math.min(index + 1, n), n};
        }
    }

    /** Changes every time a new line starts. */
    public static int serial() {
        synchronized (lock) {
            return serial;
        }
    }

    private static double msPerCharLocked() {
        return msPerCharAt1x / (rate > 0 ? rate : 1f);
    }

    // ---------------------------------------------------------------------------------------------
    // Text helpers (same rules as the app's parseLines: split on new lines, trim, drop empty lines)

    static ArrayList<String> splitLines(String text) {
        ArrayList<String> lines = new ArrayList<>();
        for (String part : text.split("\\r?\\n+")) {
            String line = trim(part);
            if (!line.isEmpty()) lines.add(line);
        }
        return lines;
    }

    private static boolean isSpace(char c) {
        return Character.isWhitespace(c) || Character.isSpaceChar(c) || c == '﻿';
    }

    private static String trim(String s) {
        int start = 0;
        int end = s.length();
        while (start < end && isSpace(s.charAt(start))) start++;
        while (end > start && isSpace(s.charAt(end - 1))) end--;
        return s.substring(start, end);
    }

    /** Comparison key: the text without any white space. */
    private static String key(String s) {
        StringBuilder sb = new StringBuilder(s.length());
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (!isSpace(c)) sb.append(c);
        }
        return sb.toString();
    }
}
