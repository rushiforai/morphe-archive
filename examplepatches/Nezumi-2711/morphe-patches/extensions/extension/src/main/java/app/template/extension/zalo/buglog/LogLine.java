package app.template.extension.zalo.buglog;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * The bug-log line format, {@code yyyy-MM-dd HH:mm:ss.SSS L/<patch-id>/<Tag> [thread] message},
 * where continuation lines (stack traces, traces) follow without a timestamp. Android-free so the
 * format and its parser can be unit tested.
 */
final class LogLine {
    private LogLine() { }

    /** Matches the first line of an entry: time, level, patch id, tag, thread, message. */
    static final Pattern ENTRY = Pattern.compile(
        "^(\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}\\.\\d{3}) ([DIWE])/([a-z0-9-]+)/(\\S+) \\[([^\\]]*)\\] ?(.*)$");

    /** Tag and message of the hook breadcrumb written by {@code NezumiLog.hit}. */
    static final String HOOK_TAG = "Hook";
    static final String HOOK_FIRED = "hook fired";

    /**
     * Whether a line goes straight to the file rather than the in-memory ring: errors always, hook
     * breadcrumbs always (one per patch per process), everything else only with detailed logging.
     */
    static boolean goesToFile(char level, String tag, boolean detailed) {
        return level == 'E' || detailed || HOOK_TAG.equals(tag);
    }

    private static final ThreadLocal<SimpleDateFormat> FORMAT =
        ThreadLocal.withInitial(() -> new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US));

    /** Everything after the timestamp. {@code detail} (a stack trace) goes on the following lines. */
    static String body(char level, String patchId, String tag, String thread, String message, String detail) {
        StringBuilder out = new StringBuilder();
        out.append(level).append('/').append(patchId).append('/').append(tag)
            .append(" [").append(thread).append("] ").append(message);
        if (detail != null && !detail.isEmpty()) out.append('\n').append(detail);
        return out.toString();
    }

    static String timestamp(long time) {
        return FORMAT.get().format(new Date(time));
    }

    static String full(long time, String body) {
        return timestamp(time) + ' ' + body;
    }

    /** One parsed entry line, or null when {@code line} is not the first line of an entry. */
    static Parsed parse(String line) {
        if (line == null) return null;
        Matcher matcher = ENTRY.matcher(line);
        if (!matcher.matches()) return null;
        return new Parsed(matcher.group(1), matcher.group(2).charAt(0), matcher.group(3),
            matcher.group(4), matcher.group(5), matcher.group(6));
    }

    static final class Parsed {
        final String time;
        final char level;
        final String patchId;
        final String tag;
        final String thread;
        final String message;

        Parsed(String time, char level, String patchId, String tag, String thread, String message) {
            this.time = time;
            this.level = level;
            this.patchId = patchId;
            this.tag = tag;
            this.thread = thread;
            this.message = message;
        }
    }
}
