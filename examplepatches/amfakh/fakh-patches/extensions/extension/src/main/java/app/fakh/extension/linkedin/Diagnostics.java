package app.fakh.extension.linkedin;

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
 * Fakh Patches log, kept in a file in the app's private storage so that users can copy it into a bug report
 * from the settings, without a computer. Errors are always kept; details only while "Diagnostic logging" is on.
 * The report removes links, IDs, and e-mail addresses.
 */
final class Diagnostics {
    private static final String FILE_NAME = "fakh_log.txt";
    /** The file is cut to the newest half when it grows past this size. */
    private static final int MAX_BYTES = 300 * 1024;
    private static final int REPORT_LINES = 200;

    private static final long REPEAT_WINDOW_MS = 5000;
    private static final Map<String, Long> LAST_WRITTEN = new HashMap<>();
    private static final Map<String, Integer> REPEATS = new HashMap<>();

    private static final SimpleDateFormat TIME = new SimpleDateFormat("MM-dd HH:mm:ss", Locale.ROOT);

    private static final Pattern URL = Pattern.compile("https?://\\S+");
    private static final Pattern URN = Pattern.compile("urn:li:[A-Za-z_]+:[^\\s,)\\]]+");
    private static final Pattern EMAIL = Pattern.compile("[\\w.+-]+@[\\w-]+\\.[\\w.]+");
    /** LinkedIn member and media IDs, such as ACoAAB1x2y... or D4E22AQH.... */
    private static final Pattern TOKEN = Pattern.compile("\\b(?=[A-Za-z0-9_-]*\\d)(?=[A-Za-z0-9_-]*[A-Za-z])[A-Za-z0-9_-]{16,}\\b");
    private static final Pattern NUMBER = Pattern.compile("\\b\\d{6,}\\b");

    private Diagnostics() {
    }

    /** Details, only kept while "Diagnostic logging" is on. */
    static void debug(String message) {
        if (!Settings.debug()) return;
        Log.d(Settings.TAG, message);
        String line = message;
        // Patches can log the same detail for every feed item. Keep one line per message every few seconds so
        // repeats don't push the rest of the log out of the report.
        synchronized (REPEATS) {
            long now = System.currentTimeMillis();
            Long last = LAST_WRITTEN.get(message);
            if (last != null && now - last < REPEAT_WINDOW_MS) {
                Integer count = REPEATS.get(message);
                REPEATS.put(message, count == null ? 1 : count + 1);
                return;
            }
            Integer skipped = REPEATS.remove(message);
            if (skipped != null) line = message + " (+" + skipped + " more)";
            LAST_WRITTEN.put(message, now);
            if (LAST_WRITTEN.size() > 200) LAST_WRITTEN.clear();
        }
        append("D", line);
    }

    /** Errors are always kept, so that a report can show what failed even if logging was off. */
    static void error(String message, Throwable t) {
        Log.e(Settings.TAG, message, t);
        append("E", t == null ? message : message + "\n" + stackTrace(t));
    }

    private static synchronized void append(String level, String message) {
        try {
            File file = file();
            if (file == null) return;
            String line = TIME.format(new Date()) + " " + level + " " + message + "\n";
            try (FileOutputStream out = new FileOutputStream(file, true)) {
                out.write(line.getBytes(StandardCharsets.UTF_8));
            }
            if (file.length() > MAX_BYTES) {
                byte[] all = Files.readAllBytes(file.toPath());
                int from = all.length / 2;
                while (from < all.length && all[from] != '\n') from++;
                byte[] kept = new byte[all.length - from - 1];
                System.arraycopy(all, from + 1, kept, 0, kept.length);
                Files.write(file.toPath(), kept);
            }
        } catch (Throwable ignored) {
            // Logging must never break the app.
        }
    }

    static synchronized void clear() {
        File file = file();
        if (file != null) file.delete();
    }

    /** The report to paste into a bug report: app, device, patches, settings, and the newest log lines. */
    static String report(Context context) {
        StringBuilder out = new StringBuilder();
        out.append("### Fakh Patches diagnostic report\n");
        out.append("Links, IDs, and e-mail addresses were removed. Please check it before posting.\n\n");
        out.append("```\n");
        out.append("Fakh Patches ").append(Settings.patchesVersion())
                .append(" • LinkedIn ").append(appVersion(context)).append('\n');
        out.append("Android ").append(Build.VERSION.RELEASE).append(" (API ").append(Build.VERSION.SDK_INT)
                .append(") • ").append(Build.MANUFACTURER).append(' ').append(Build.MODEL).append('\n');
        out.append("Language: ").append(I18n.language()).append(" (device ")
                .append(Locale.getDefault().toLanguageTag()).append(")\n");
        out.append("Diagnostic logging: ").append(Settings.debug() ? "on" : "off").append("\n\n");

        out.append("Patches:\n");
        for (Object[] patch : SettingsActivity.patches()) {
            out.append("  ").append((Boolean) patch[1] ? "[x] " : "[ ] ").append(patch[0]).append('\n');
        }

        out.append("\nSettings:\n");
        SharedPreferences prefs = Settings.prefs();
        if (prefs != null) {
            for (Map.Entry<String, ?> entry : new TreeMap<>(prefs.getAll()).entrySet()) {
                out.append("  ").append(entry.getKey()).append(" = ").append(entry.getValue()).append('\n');
            }
        }

        out.append("\nLog (newest ").append(REPORT_LINES).append(" lines):\n");
        List<String> lines = lastLines(REPORT_LINES);
        if (lines.isEmpty()) out.append("  (empty)\n");
        for (String line : lines) out.append(line).append('\n');
        out.append("```\n");
        return redact(out.toString());
    }

    /** Removes links, LinkedIn IDs, e-mail addresses, and long numbers. */
    static String redact(String text) {
        text = URL.matcher(text).replaceAll("[link]");
        text = URN.matcher(text).replaceAll("urn:li:[id]");
        text = EMAIL.matcher(text).replaceAll("[email]");
        text = TOKEN.matcher(text).replaceAll("[id]");
        return NUMBER.matcher(text).replaceAll("[number]");
    }

    private static List<String> lastLines(int count) {
        List<String> lines = new ArrayList<>();
        try {
            File file = file();
            if (file == null || !file.exists()) return lines;
            List<String> all = Files.readAllLines(file.toPath(), StandardCharsets.UTF_8);
            lines.addAll(all.subList(Math.max(0, all.size() - count), all.size()));
        } catch (Throwable ignored) {
        }
        return lines;
    }

    private static File file() {
        Context context = Settings.app();
        return context == null ? null : new File(context.getFilesDir(), FILE_NAME);
    }

    private static String stackTrace(Throwable t) {
        StringWriter writer = new StringWriter();
        t.printStackTrace(new PrintWriter(writer));
        // The top of the trace is enough to find the failing patch.
        String[] lines = writer.toString().split("\n");
        StringBuilder out = new StringBuilder();
        for (int i = 0; i < Math.min(lines.length, 12); i++) out.append("    ").append(lines[i].trim()).append('\n');
        return out.toString().trim();
    }

    private static String appVersion(Context context) {
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            return info.versionName;
        } catch (Exception e) {
            return "?";
        }
    }
}
