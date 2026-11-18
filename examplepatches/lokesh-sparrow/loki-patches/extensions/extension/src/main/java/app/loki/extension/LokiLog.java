/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.extension;

import android.content.Context;
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
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;

/**
 * The on-device log and the bug report made from it. Errors are always recorded; detail lines only
 * while "Diagnostic logging" is on. A report is text the user is about to post in public, so links,
 * e-mail addresses and long ids are stripped from it. The log is capped: past the limit the oldest
 * half is dropped, which keeps the part a report needs.
 */
public final class LokiLog {
    private static final String FILE_NAME = "loki_log.txt";
    private static final String STAMP_PATTERN = "MM-dd HH:mm:ss";
    private static final int MAX_BYTES = 300 * 1024;
    private static final int REPORT_LINES = 200;
    private static final int TRACE_LINES = 12;

    private static final Pattern LINK_PATTERN = Pattern.compile("https?://\\S+");
    private static final Pattern MAIL_PATTERN = Pattern.compile("[\\w.+-]+@[\\w-]+\\.[\\w.]+");
    private static final Pattern ID_PATTERN =
            Pattern.compile("\\b(?=[A-Za-z0-9_-]*\\d)(?=[A-Za-z0-9_-]*[A-Za-z])[A-Za-z0-9_-]{16,}\\b");
    private static final Pattern LONG_NUMBER_PATTERN = Pattern.compile("\\b\\d{6,}\\b");

    private static final SimpleDateFormat STAMP = new SimpleDateFormat(STAMP_PATTERN, Locale.ROOT);

    private LokiLog() {
    }

    /**
     * Always written, whatever the logging switch says, with no context needed: the patch hooks run deep in the
     * host app where none is at hand. Used for the few events a report must show to be useful.
     */
    public static void note(String detail) {
        Log.i(LokiPrefs.TAG, detail);
        Context context = application();
        if (context != null) write(context, "I", detail);
    }

    /**
     * A routine event: written only while diagnostic logging is on. Success paths use this, so a report stays
     * readable - note() is for the few lines that explain a failure whatever the switch says.
     */
    public static void debug(String detail) {
        Context context = application();
        if (context == null || !LokiPrefs.debug(context)) return;
        Log.d(LokiPrefs.TAG, detail);
        write(context, "D", detail);
    }

    public static Context application() {
        try {
            return (Context) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
        } catch (Throwable error) {
            return null;
        }
    }

    /** Calls a no-argument boolean getter on a new instance of type: shows whether the patch reached the dex. */
    private static String probe(String type, String getter) {
        try {
            Class<?> cls = Class.forName(type, true, LokiLog.class.getClassLoader());
            Object instance = cls.getConstructor().newInstance();
            return String.valueOf(cls.getMethod(getter).invoke(instance));
        } catch (Throwable error) {
            return "error: " + error.getClass().getSimpleName();
        }
    }

    /**
     * Asks Splitwise's own FeatureAvailability (Injector.get().featureAvailability().getAdFeature(name)), the same
     * call the scan button makes. With the premium patch working this reads true/true even before sign-in.
     */
    private static String appFeature(String name) {
        try {
            ClassLoader loader = LokiLog.class.getClassLoader();
            Object component = Class.forName("com.Splitwise.SplitwiseMobile.di.Injector", true, loader)
                    .getMethod("get").invoke(null);
            Object availability = component.getClass().getMethod("featureAvailability").invoke(component);
            Object status = availability.getClass().getMethod("getAdFeature", String.class).invoke(availability, name);
            return status.getClass().getMethod("getVisible").invoke(status) + "/"
                    + status.getClass().getMethod("getEnabled").invoke(status);
        } catch (Throwable error) {
            Throwable cause = error.getCause() != null ? error.getCause() : error;
            return "error: " + cause.getClass().getSimpleName() + " " + cause.getMessage();
        }
    }

    static void debug(Context context, String detail) {
        if (!LokiPrefs.debug(context)) return;
        Log.d(LokiPrefs.TAG, detail);
        write(context, "D", detail);
    }

    /** An error, always recorded, so a report shows what failed even with logging off. */
    static void error(Context context, String message, Throwable failure) {
        Log.e(LokiPrefs.TAG, message, failure);
        write(context, "E", failure == null ? message : message + "\n" + trace(failure));
    }

    private static synchronized void write(Context context, String level, String message) {
        try {
            File target = logFile(context);
            String line = STAMP.format(new Date()) + " " + level + " " + message + "\n";
            try (FileOutputStream stream = new FileOutputStream(target, true)) {
                stream.write(line.getBytes(StandardCharsets.UTF_8));
            }
            if (target.length() > MAX_BYTES) keepNewestHalf(target);
        } catch (Throwable harmless) {
            // A logging problem must never become the app's problem.
        }
    }

    private static void keepNewestHalf(File file) throws Exception {
        byte[] whole = Files.readAllBytes(file.toPath());
        int cut = whole.length / 2;
        while (cut < whole.length && whole[cut] != '\n') cut++;
        byte[] newest = new byte[whole.length - cut - 1];
        System.arraycopy(whole, cut + 1, newest, 0, newest.length);
        Files.write(file.toPath(), newest);
    }

    public static synchronized void clear(Context context) {
        File target = logFile(context);
        if (target != null) target.delete();
    }

    /** The bug report: versions, patch list, saved settings and the newest log lines, redacted. */
    public static String report(Context context) {
        StringBuilder sb = new StringBuilder();
        sb.append("### Loki Patches diagnostic report\n")
                .append("Links, ids and e-mail addresses were removed. Please check it before posting.\n\n")
                .append("```\n");
        sb.append("Loki Patches ").append(MenuInfo.patchesVersion())
                .append(" • ").append(appLabel(context)).append(' ').append(appVersion(context)).append('\n');
        sb.append("Android ").append(Build.VERSION.RELEASE).append(" (API ").append(Build.VERSION.SDK_INT)
                .append(") • ").append(Build.MANUFACTURER).append(' ').append(Build.MODEL).append('\n');
        sb.append("Package: ").append(context.getPackageName()).append('\n');
        sb.append("Diagnostic logging: ").append(LokiPrefs.debug(context) ? "on" : "off").append("\n\n");

        sb.append("Patches:\n");
        for (String[] patch : MenuInfo.patches(context)) {
            sb.append("  ").append("true".equals(patch[1]) ? "[x] " : "[ ] ").append(patch[0]).append('\n');
        }

        if (context.getPackageName().startsWith("com.Splitwise.SplitwiseMobile")) {
            sb.append("\nPremium checks answered: ").append(SplitwiseFeatures.premiumGrants).append('\n');
            String seen = SplitwiseFeatures.summary();
            sb.append("Features the app asked about:\n")
                    .append(seen.isEmpty() ? "  (none yet - open a group or tap scan first)\n" : seen);
            sb.append("Account tab row: ").append(SplitwiseAccount.selfCheck()).append('\n');
            sb.append("Hook check (fresh objects, true = bytecode patched):\n");
            sb.append("  Person.isPro = ")
                    .append(probe("com.Splitwise.SplitwiseMobile.data.Person", "isPro")).append('\n');
            sb.append("  ReceiptScanning.getScanFabVisible = ")
                    .append(probe("com.Splitwise.SplitwiseMobile.data.ReceiptScanningFeatureStatus",
                            "getScanFabVisible")).append('\n');
            sb.append("  App's own check, receipt_scanning (visible/enabled) = ").append(appFeature("receipt_scanning"))
                    .append('\n');
            sb.append("  App's own check, add_expense (visible/enabled) = ").append(appFeature("add_expense"))
                    .append('\n');
            sb.append("  App's own check, pro_settings (visible/enabled) = ").append(appFeature("pro_settings"))
                    .append('\n');
        }

        sb.append("\nSettings:\n");
        String exported;
        try {
            StringBuilder lines = new StringBuilder();
            org.json.JSONObject all = LokiPrefs.toJson(context);
            for (java.util.Iterator<String> keys = all.keys(); keys.hasNext(); ) {
                String key = keys.next();
                lines.append(key).append('=').append(all.get(key)).append("\n");
            }
            exported = lines.toString().trim();
        } catch (Exception e) {
            exported = "";
        }
        sb.append(exported.isEmpty() ? "  (none)\n" : "  " + exported.replace("\n", "\n  ") + "\n");

        sb.append("\nLog (newest ").append(REPORT_LINES).append(" lines):\n");
        List<String> tail = newestLines(context);
        if (tail.isEmpty()) sb.append("  (empty)\n");
        for (String line : tail) sb.append(line).append('\n');
        return redact(sb.append("```\n").toString());
    }

    static String redact(String raw) {
        return LONG_NUMBER_PATTERN.matcher(
                ID_PATTERN.matcher(
                        MAIL_PATTERN.matcher(
                                LINK_PATTERN.matcher(raw).replaceAll("[link]")
                        ).replaceAll("[email]")
                ).replaceAll("[id]")
        ).replaceAll("[number]");
    }

    private static List<String> newestLines(Context context) {
        List<String> tail = new ArrayList<>();
        try {
            File source = logFile(context);
            if (!source.exists()) return tail;
            List<String> whole = Files.readAllLines(source.toPath(), StandardCharsets.UTF_8);
            tail.addAll(whole.subList(Math.max(0, whole.size() - REPORT_LINES), whole.size()));
        } catch (Throwable harmless) {
            // An unreadable log just means the report has no log section.
        }
        return tail;
    }

    private static File logFile(Context context) {
        return new File(context.getFilesDir(), FILE_NAME);
    }

    private static String trace(Throwable failure) {
        StringWriter buffer = new StringWriter();
        failure.printStackTrace(new PrintWriter(buffer));
        String[] frames = buffer.toString().split("\n");
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < Math.min(frames.length, TRACE_LINES); i++) {
            sb.append("    ").append(frames[i].trim()).append('\n');
        }
        return sb.toString().trim();
    }

    public static String appLabel(Context context) {
        try {
            return context.getPackageManager().getApplicationLabel(context.getApplicationInfo()).toString();
        } catch (Exception unknown) {
            return context.getPackageName();
        }
    }

    public static String appVersion(Context context) {
        try {
            PackageInfo installed = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            return installed.versionName != null ? installed.versionName : "?";
        } catch (Exception unknown) {
            return "?";
        }
    }
}
