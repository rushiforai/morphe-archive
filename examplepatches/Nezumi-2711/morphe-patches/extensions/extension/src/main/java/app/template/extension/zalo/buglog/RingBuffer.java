package app.template.extension.zalo.buglog;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;

/**
 * The last I/W lines of this process, kept in memory while detailed logging is off and written to
 * the file only when they can explain something: on a crash and on export. Entries hold the raw
 * message; redaction happens when they are written, so a line that never reaches the file costs
 * no regex work. Android-free so it can be unit tested.
 */
final class RingBuffer {
    static final int CAPACITY = 200;
    /** Per-line cap (message plus stack trace), in characters. */
    static final int MAX_LINE_CHARS = 2048;
    static final String TRUNCATED = " ... [truncated]";

    static final class Entry {
        final long time;
        final char level;
        final String patchId;
        final String tag;
        final String thread;
        final String message;
        /** Stack trace or other continuation lines, or null. */
        final String detail;

        Entry(long time, char level, String patchId, String tag, String thread, String message, String detail) {
            this.time = time;
            this.level = level;
            this.patchId = patchId;
            this.tag = tag;
            this.thread = thread;
            this.message = message;
            this.detail = detail;
        }
    }

    private final int capacity;
    private final int maxChars;
    private final ArrayDeque<Entry> entries;

    RingBuffer() {
        this(CAPACITY, MAX_LINE_CHARS);
    }

    RingBuffer(int capacity, int maxChars) {
        this.capacity = capacity;
        this.maxChars = maxChars;
        this.entries = new ArrayDeque<>(capacity);
    }

    /** Adds an entry, evicting the oldest when full. Message and detail share the per-line cap. */
    void add(long time, char level, String patchId, String tag, String thread, String message, String detail) {
        String text = message == null ? "null" : message;
        String trace = detail;
        if (text.length() > maxChars) {
            text = truncate(text, maxChars);
            trace = null;
        } else if (trace != null && text.length() + 1 + trace.length() > maxChars) {
            int room = maxChars - text.length() - 1;
            trace = room > TRUNCATED.length() ? truncate(trace, room) : null;
        }
        Entry entry = new Entry(time, level, patchId, tag, thread, text, trace);
        synchronized (this) {
            if (entries.size() >= capacity) entries.pollFirst();
            entries.addLast(entry);
        }
    }

    /** Removes and returns everything buffered, oldest first. */
    synchronized List<Entry> drain() {
        List<Entry> result = new ArrayList<>(entries);
        entries.clear();
        return result;
    }

    synchronized int size() {
        return entries.size();
    }

    /**
     * Cuts {@code text} to at most {@code max} characters including the marker. A word cut in half
     * (part of a token or a number) is dropped entirely, so redaction never sees a fragment too
     * short to recognise.
     */
    static String truncate(String text, int max) {
        if (text.length() <= max) return text;
        int end = Math.max(0, max - TRUNCATED.length());
        while (end > 0 && isWordChar(text.charAt(end - 1)) && isWordChar(text.charAt(end))) end--;
        return text.substring(0, end) + TRUNCATED;
    }

    private static boolean isWordChar(char value) {
        return Character.isLetterOrDigit(value) || value == '_' || value == '-' || value == '.'
            || value == '+' || value == '/' || value == '=' || value == '@' || value == '%';
    }
}
