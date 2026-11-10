/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.os.Build;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;
import java.util.regex.Pattern;

/**
 * The on-device log and the bug report made from it.
 *
 * <p>A user can copy the report from the settings screen without a computer, so the file lives in
 * the app's private storage. Errors are always recorded; detail lines only while "Diagnostic
 * logging" is on. A report is text the user is about to post in public, so links, member ids and
 * addresses are stripped from it.
 *
 * <p>The log is capped: past {@link #MAX_BYTES} the oldest half is dropped, which keeps the end of
 * the log — the part a bug report needs — intact.
 */
final class Diagnostics {
    private static final String FILE_NAME = "loki_log.txt";
    /** Log line shape: "MM-dd HH:mm:ss D message". */
    private static final String STAMP_PATTERN = "MM-dd HH:mm:ss";

    private static final int MAX_BYTES = 300 * 1024;
    private static final int REPORT_LINES = 200;
    /** Identical detail lines inside this window are counted instead of written. */
    private static final long REPEAT_WINDOW_MS = 5000;
    /** Drop the repeat bookkeeping once it gets this big rather than tracking it forever. */
    private static final int REPEAT_ENTRIES = 200;
    /** Stack frames kept per error: the top ones are what locates the failure. */
    private static final int TRACE_LINES = 12;

    private static final Pattern LINK_PATTERN = Pattern.compile("https?://\\S+");
    private static final Pattern URN_PATTERN = Pattern.compile("urn:li:[A-Za-z_]+:[^\\s,)\\]]+");
    private static final Pattern MAIL_PATTERN = Pattern.compile("[\\w.+-]+@[\\w-]+\\.[\\w.]+");
    /** Member and media ids: long, and always mixing letters with digits. */
    private static final Pattern ID_PATTERN =
            Pattern.compile("\\b(?=[A-Za-z0-9_-]*\\d)(?=[A-Za-z0-9_-]*[A-Za-z])[A-Za-z0-9_-]{16,}\\b");
    private static final Pattern LONG_NUMBER_PATTERN = Pattern.compile("\\b\\d{6,}\\b");

    private static final SimpleDateFormat STAMP = new SimpleDateFormat(STAMP_PATTERN, Locale.ROOT);
    private static final Map<String, Long> LAST_WRITTEN_AT = new HashMap<>();
    private static final Map<String, Integer> SUPPRESSED = new HashMap<>();

    private Diagnostics() {
    }

    /**
     * A detail line, written only while "Diagnostic logging" is on.
     *
     * <p>Patches call this per feed item or per view, so the same line can arrive dozens of times a
     * second; repeats inside a short window are counted and reported once as "(+N more)" instead of
     * pushing the rest of the log out of the report.
     */
    static void debug(String detail) {
        if (!Settings.debug()) return;
        Log.d(Settings.TAG, detail);
        String line = detail;
        synchronized (SUPPRESSED) {
            long at = System.currentTimeMillis();
            Long writtenBefore = LAST_WRITTEN_AT.get(detail);
            if (writtenBefore != null && at - writtenBefore < REPEAT_WINDOW_MS) {
                Integer repeats = SUPPRESSED.get(detail);
                SUPPRESSED.put(detail, repeats == null ? 1 : repeats + 1);
                return;
            }
            Integer suppressed = SUPPRESSED.remove(detail);
            if (suppressed != null) line = detail + " (+" + suppressed + " more)";
            LAST_WRITTEN_AT.put(detail, at);
            if (LAST_WRITTEN_AT.size() > REPEAT_ENTRIES) LAST_WRITTEN_AT.clear();
        }
        write("D", line);
    }

    /** An error, always recorded — also when logging is off, so a report shows what failed. */
    static void error(String message, Throwable failure) {
        Log.e(Settings.TAG, message, failure);
        if (failure == null) {
            write("E", message);
            return;
        }
        write("E", message + "\n" + trace(failure));
    }

    private static synchronized void write(String level, String message) {
        try {
            File target = logFile();
            if (target == null) return;
            String line = STAMP.format(new Date()) + " " + level + " " + message + "\n";
            byte[] encoded = line.getBytes(StandardCharsets.UTF_8);
            try (FileOutputStream stream = new FileOutputStream(target, true)) {
                stream.write(encoded);
            }
            if (target.length() > MAX_BYTES) keepNewestHalf(target);
        } catch (Throwable harmless) {
            // A logging problem must never become the app's problem.
        }
    }

    /**
     * Rewrites the file with everything after the first line break past the halfway point. On a
     * file without any later line break this throws, and the caller leaves the file alone.
     */
    private static void keepNewestHalf(File file) throws Exception {
        byte[] whole = Files.readAllBytes(file.toPath());
        int cut = whole.length / 2;
        while (cut < whole.length && whole[cut] != '\n') cut++;
        byte[] newest = new byte[whole.length - cut - 1];
        System.arraycopy(whole, cut + 1, newest, 0, newest.length);
        Files.write(file.toPath(), newest);
    }

    static synchronized void clear() {
        File target = logFile();
        if (target != null) target.delete();
    }

    /**
     * The bug report: versions, patch list, saved settings and the newest log lines, with anything
     * identifying removed so it can be pasted into an issue.
     */
    static String report(Context context) {
        StringBuilder sb = new StringBuilder();
        sb.append("### Loki Patches diagnostic report\n")
                .append("Links, IDs, and e-mail addresses were removed. Please check it before posting.\n\n")
                .append("```\n");
        sb.append("Loki Patches ").append(Settings.patchesVersion())
                .append(" • LinkedIn ").append(linkedInVersion(context)).append('\n');
        sb.append("Android ").append(Build.VERSION.RELEASE).append(" (API ").append(Build.VERSION.SDK_INT)
                .append(") • ").append(Build.MANUFACTURER).append(' ').append(Build.MODEL)
                .append('\n');
        sb.append("Language: ").append(I18n.language()).append(" (device ")
                .append(Locale.getDefault().toLanguageTag()).append(")\n");
        sb.append("Diagnostic logging: ").append(Settings.debug() ? "on" : "off").append("\n\n");

        sb.append("Patches:\n");
        for (Object[] patch : SettingsActivity.patches()) {
            boolean enabled = (Boolean) patch[1];
            sb.append("  ").append(enabled ? "[x] " : "[ ] ").append(patch[0]).append('\n');
        }

        sb.append("\nSettings:\n");
        SharedPreferences preferences = Settings.prefs();
        if (preferences != null) {
            TreeMap<String, ?> saved = new TreeMap<>(preferences.getAll());
            for (Map.Entry<String, ?> entry : saved.entrySet()) {
                sb.append("  ").append(entry.getKey()).append(" = ").append(entry.getValue()).append('\n');
            }
        }

        sb.append("\nLog (newest ").append(REPORT_LINES).append(" lines):\n");
        List<String> tail = newestLines(REPORT_LINES);
        if (tail.isEmpty()) sb.append("  (empty)\n");
        for (String line : tail) sb.append(line).append('\n');
        sb.append("```\n");
        return redact(sb.toString());
    }

    /** Removes links, LinkedIn URNs, e-mail addresses, member ids and long numbers, in that order. */
    static String redact(String raw) {
        String withoutLinks = LINK_PATTERN.matcher(raw).replaceAll("[link]");
        String withoutUrns = URN_PATTERN.matcher(withoutLinks).replaceAll("urn:li:[id]");
        String withoutMails = MAIL_PATTERN.matcher(withoutUrns).replaceAll("[email]");
        String withoutIds = ID_PATTERN.matcher(withoutMails).replaceAll("[id]");
        return LONG_NUMBER_PATTERN.matcher(withoutIds).replaceAll("[number]");
    }

    /** The last {@code count} lines of the log, or nothing when there is no readable log. */
    private static List<String> newestLines(int count) {
        List<String> tail = new ArrayList<>();
        try {
            File source = logFile();
            if (source == null || !source.exists()) return tail;
            List<String> whole = Files.readAllLines(source.toPath(), StandardCharsets.UTF_8);
            int from = Math.max(0, whole.size() - count);
            tail.addAll(whole.subList(from, whole.size()));
        } catch (Throwable harmless) {
            // An unreadable log just means the report has no log section.
        }
        return tail;
    }

    private static File logFile() {
        Context appContext = Settings.app();
        if (appContext == null) return null;
        File storage = appContext.getFilesDir();
        return new File(storage, FILE_NAME);
    }

    /** The first frames of a throwable, indented and trimmed for the log. */
    private static String trace(Throwable failure) {
        StringWriter buffer = new StringWriter();
        failure.printStackTrace(new PrintWriter(buffer));
        String[] frames = buffer.toString().split("\n");
        StringBuilder sb = new StringBuilder();
        int keep = Math.min(frames.length, TRACE_LINES);
        for (int i = 0; i < keep; i++) {
            sb.append("    ").append(frames[i].trim()).append('\n');
        }
        return sb.toString().trim();
    }

    private static String linkedInVersion(Context appContext) {
        try {
            PackageInfo installed = appContext.getPackageManager()
                    .getPackageInfo(appContext.getPackageName(), 0);
            return installed.versionName;
        } catch (Exception unknown) {
            return "?";
        }
    }
}
