package app.morphe.extension.mapsautomotive.patches;

import android.app.ActivityManager;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Point;
import android.os.Build;
import android.os.Process;
import android.os.SystemClock;
import android.system.Os;
import android.system.OsConstants;
import android.view.Display;
import android.view.WindowManager;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Builds a problem report, schema 1: the app, MicroG-RE, the device (with its page size and car
 * platform from 0.1.2), the BYD model, BYD battery and window state (from the main process), safe mode
 * and the feature switches, Maps Car's own logs of the last 3 days with the main process's logcat
 * warnings and errors ({@link StartLogcat}, from 0.1.2), up to three different crash files (with their
 * process's logcat warnings and errors from 0.1.1), an index of all crashes, on Android 11 and newer
 * the processes' last exits ({@link ExitReasons}), and, at Send, the comment and the consent. Every
 * string is redacted ({@link ReportRedactor}) before the preview, and
 * the body is cut to the size limit before the preview too, so the preview shows what is sent. Runs
 * off the main thread; reads only state the extension already holds, never the car again.
 */
final class ReportBuilder {
    static final int SCHEMA = 1, CONSENT_TEXT_VERSION = 5, MAX_COMMENT_CHARS = 2000;
    /** The main process's last battery and window state is saved at most this often, except on a window change. */
    private static final long SNAPSHOT_EVERY_MS = 60 * 1000;
    private static long snapshotAt;
    private static final int MAX_LOG_LINES = 2000, LOG_BUDGET_BYTES = 320 * 1024, PROCESS_BUDGET_BYTES = 16 * 1024,
            MAX_LINE_CHARS = 1024, SHORT = 256, MAX_LIBRARIES = 80;
    // A cut crash file: its start and end with "\n…\n" between, 49,152 characters in all.
    private static final int CRASH_MAX_CHARS = 48 * 1024, CRASH_HEAD_CHARS = 40 * 1024,
            CRASH_TAIL_CHARS = CRASH_MAX_CHARS - CRASH_HEAD_CHARS - 3;
    /** Room kept for the comment (2,000 characters, about 6 KB in Thai) and the consent. */
    private static final int COMMENT_RESERVE_BYTES = 8 * 1024;
    private static final long LOG_WINDOW_MS = 3 * ReportStore.DAY_MS;
    private static final String PROVIDER_PACKAGE = "app.revanced.android.gms";
    /**
     * Apps that may get in the way: stock Maps, phone Patched Maps, the prior-art AAOS build and Google
     * Play services. Android 11+ hides them unless declared, so null means not installed or not visible.
     * Google Play services' name is joined at run time: the patch rewrites that exact string everywhere
     * in the APK to MicroG-RE's package (a literal would report MicroG-RE under this name).
     */
    private static final String[] OTHER_PACKAGES = {"com.google.android.apps.maps", "app.morphe.android.apps.maps",
            "com.google.android.apps.maps.automotive", String.join(".", "com", "google", "android", "gms")};

    private ReportBuilder() {
    }

    /** What the screen showing the Settings has, read on the main thread. */
    static final class Screen {
        int densityDpi;
        Boolean multiWindow;
    }

    /** A report before Send: the redacted report the preview shows, and the redactor that keeps counting. */
    static final class Draft {
        final JSONObject report;
        final ReportRedactor redactor;
        /** The newest crash file in the report when it was not in an earlier one, else null. */
        final String crash;
        final int maxBytes;

        Draft(JSONObject report, ReportRedactor redactor, String crash, int maxBytes) {
            this.report = report;
            this.redactor = redactor;
            this.crash = crash;
            this.maxBytes = maxBytes;
        }

        JSONObject logs() {
            return report.optJSONObject("logs");
        }

        JSONArray crashes() {
            return report.optJSONArray("crashes");
        }
    }

    static Draft build(Context context, Screen screen) throws JSONException {
        // A native crash since the last check becomes a crash copy first.
        NativeCrashes.check(context, false);
        SafeMode.refresh(context);
        String crash = ReportStore.pendingCrash(context);
        // The report screen's process holds no battery or window state; the main process's last one is used.
        boolean reportProcess = SafeMode.isReportProcess();
        JSONObject snapshot = reportProcess ? ReportStore.snapshot(context) : null;
        JSONObject report = new JSONObject();
        report.put("schema", SCHEMA)
                .put("created_at", formatUtc(System.currentTimeMillis()))
                .put("install_id", ReportStore.installId(context))
                .put("trigger", crash != null ? "after_crash" : "user")
                .put("app", app(context))
                .put("provider", provider(context))
                .put("device", device(context))
                .put("setup", setup(context))
                .put("byd", orNull(BydBatteryPatch.reportByd(context)))
                .put("battery", !SafeMode.included(SafeMode.BYD_BATTERY) ? JSONObject.NULL
                        : reportProcess ? fromSnapshot(snapshot, "battery") : BydBatteryPatch.reportBattery(context))
                .put("ui", reportProcess ? fromSnapshot(snapshot, "ui") : ui(context, screen))
                .put("safe_mode", SafeMode.report(context))
                .put("logs", logs(context))
                .put("crashes", crashes(context))
                .put("crash_index", ReportStore.crashIndex(context))
                .put("exits", orNull(ExitReasons.report(context)))
                .put("comment", JSONObject.NULL);
        ReportRedactor redactor = new ReportRedactor();
        redact(report, redactor);
        int maxBytes = ReportStore.maxBytes(context);
        fit(report, maxBytes - COMMENT_RESERVE_BYTES, false);
        return new Draft(report, redactor, crash, maxBytes);
    }

    /**
     * The body to queue: the draft with the redacted comment, the consent (now) and the redaction
     * counts. Null when it cannot fit without the comment or every crash.
     */
    static byte[] finish(Draft draft, String comment, boolean thai) throws JSONException {
        JSONObject report = draft.report;
        String text = comment == null ? "" : comment.trim();
        if (text.codePointCount(0, text.length()) > MAX_COMMENT_CHARS) {
            text = text.substring(0, text.offsetByCodePoints(0, MAX_COMMENT_CHARS));
        }
        report.put("comment", text.isEmpty() ? JSONObject.NULL : draft.redactor.redact(text));
        report.put("consent", new JSONObject()
                .put("text_version", CONSENT_TEXT_VERSION)
                .put("language", thai ? "th" : "en")
                .put("accepted_at", formatUtc(System.currentTimeMillis())));
        JSONObject counts = new JSONObject();
        for (Map.Entry<String, Integer> count : draft.redactor.counts().entrySet()) {
            counts.put(count.getKey(), (int) count.getValue());
        }
        report.put("redaction", new JSONObject().put("rules_version", ReportRedactor.RULES_VERSION).put("counts", counts));
        return fit(report, draft.maxBytes, true) ? utf8(report.toString()) : null;
    }

    /** After a 413: the queued body cut to the server's limit, or null when only the comment or every crash is left. */
    static byte[] shrink(byte[] body, int maxBytes) {
        try {
            JSONObject report = new JSONObject(new String(body, StandardCharsets.UTF_8));
            return fit(report, maxBytes, true) ? utf8(report.toString()) : null;
        } catch (JSONException error) {
            return null;
        }
    }

    /**
     * Drops the oldest log entries, then the oldest crash, until the body fits. With keepCrash the
     * last crash stays (the user is asked again instead). False when it still does not fit.
     */
    private static boolean fit(JSONObject report, int limit, boolean keepCrash) throws JSONException {
        JSONObject logs = report.getJSONObject("logs");
        while (true) {
            int excess = utf8(report.toString()).length - limit;
            if (excess <= 0) return true;
            JSONArray lines = logs.getJSONArray("lines");
            if (lines.length() > 0) {
                int index = 0, freed = 0;
                while (index < lines.length() && (freed < excess || !ReportLog.isEntry(lines.getString(index)))) {
                    freed += utf8(lines.getString(index)).length + 3;
                    index++;
                }
                JSONArray kept = new JSONArray();
                for (int i = index; i < lines.length(); i++) kept.put(lines.getString(i));
                logs.put("lines", kept);
                logs.put("dropped", logs.optInt("dropped") + index);
                logs.put("from", kept.length() > 0 ? kept.getString(0).substring(0, 24) : JSONObject.NULL);
                if (kept.length() == 0) logs.put("to", JSONObject.NULL);
                continue;
            }
            JSONArray crashes = report.getJSONArray("crashes");
            if (crashes.length() == 0 || keepCrash && crashes.length() == 1) return false;
            // Newest first, so the oldest is last.
            crashes.remove(crashes.length() - 1);
        }
    }

    /**
     * From the main process: its BYD battery and window state for reports built in the report screen's
     * process. At most once a minute, unless [now] (a window change); written off the calling thread.
     */
    static void saveSnapshot(Context context, boolean now) {
        long time = SystemClock.elapsedRealtime();
        synchronized (ReportBuilder.class) {
            if (!now && snapshotAt != 0 && time - snapshotAt < SNAPSHOT_EVERY_MS) return;
            snapshotAt = time;
        }
        Utils.runOnBackgroundThread(() -> {
            try {
                Screen screen = new Screen();
                screen.densityDpi = WindowRefreshPatch.densityDpi;
                JSONObject snapshot = new JSONObject()
                        .put("at", System.currentTimeMillis())
                        .put("battery", SafeMode.included(SafeMode.BYD_BATTERY) ? BydBatteryPatch.reportBattery(context) : JSONObject.NULL)
                        .put("ui", ui(context, screen));
                ReportStore.saveSnapshot(context, snapshot);
            } catch (JSONException | RuntimeException error) {
                ReportLog.w(ReportPatch.TAG, "state for the report not saved", error);
            }
        });
    }

    // A section of the main process's snapshot with its age, or null.
    private static Object fromSnapshot(JSONObject snapshot, String name) throws JSONException {
        JSONObject section = snapshot != null ? snapshot.optJSONObject(name) : null;
        if (section == null) return JSONObject.NULL;
        return section.put("snapshot_age_s", Math.max(0, (System.currentTimeMillis() - snapshot.optLong("at")) / 1000));
    }

    // Sections.

    private static JSONObject app(Context context) throws JSONException {
        JSONObject app = new JSONObject().put("package", context.getPackageName());
        PackageInfo info = packageInfo(context, context.getPackageName());
        app.put("version_name", info != null && info.versionName != null ? info.versionName : "unknown")
                .put("version_code", info != null ? info.getLongVersionCode() : 0)
                .put("patches_version", Utils.getPatchesReleaseVersion())
                .put("signer_sha256_16", orNull(info != null ? CrashLogPatch.getSignatureHash(info.signatures) : null))
                .put("patches", new JSONArray(SafeMode.patchNames()))
                .put("process", SafeMode.isReportProcess() ? "report" : "main")
                .put("process_uptime_s", Math.max(0, (SystemClock.elapsedRealtime() - Process.getStartElapsedRealtime()) / 1000));
        return app;
    }

    private static JSONObject provider(Context context) throws JSONException {
        PackageInfo info = packageInfo(context, PROVIDER_PACKAGE);
        JSONObject provider = new JSONObject().put("package", PROVIDER_PACKAGE).put("installed", info != null);
        if (info != null) {
            provider.put("version_name", orNull(info.versionName))
                    .put("version_code", info.getLongVersionCode())
                    .put("signer_sha256_16", orNull(CrashLogPatch.getSignatureHash(info.signatures)));
        }
        return provider;
    }

    @SuppressWarnings("deprecation")
    private static PackageInfo packageInfo(Context context, String name) {
        try {
            return context.getPackageManager().getPackageInfo(name, PackageManager.GET_SIGNATURES);
        } catch (PackageManager.NameNotFoundException | RuntimeException error) {
            return null;
        }
    }

    private static JSONObject device(Context context) throws JSONException {
        JSONArray abis = new JSONArray();
        for (String abi : Build.SUPPORTED_ABIS) abis.put(abi);
        JSONObject device = new JSONObject()
                .put("manufacturer", Build.MANUFACTURER)
                .put("brand", orNull(Build.BRAND))
                .put("model", Build.MODEL)
                .put("device", orNull(Build.DEVICE))
                .put("build_display", orNull(Build.DISPLAY))
                .put("android_release", Build.VERSION.RELEASE)
                .put("sdk", Build.VERSION.SDK_INT)
                .put("abis", abis)
                .put("system_density_dpi", Resources.getSystem().getConfiguration().densityDpi);
        try {
            WindowManager windows = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
            Display display = windows == null ? null : windows.getDefaultDisplay();
            if (display != null) {
                Point size = new Point();
                display.getRealSize(size);
                device.put("display_px", size.x + "x" + size.y);
            }
        } catch (RuntimeException ignored) {
            // Left out.
        }
        ActivityManager activities = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        if (activities != null) {
            ActivityManager.MemoryInfo memory = new ActivityManager.MemoryInfo();
            activities.getMemoryInfo(memory);
            device.put("ram_total_mb", memory.totalMem / (1024 * 1024)).put("ram_available_mb", memory.availMem / (1024 * 1024));
        }
        try {
            device.put("locale", context.getResources().getConfiguration().getLocales().get(0).toLanguageTag());
        } catch (RuntimeException ignored) {
            // Left out.
        }
        // The system's configuration; this app's own density is UI density's choice.
        Configuration system = Resources.getSystem().getConfiguration();
        device.put("screen", new JSONObject()
                .put("orientation", system.orientation == Configuration.ORIENTATION_PORTRAIT ? "portrait" : "landscape")
                .put("smallest_width_dp", system.smallestScreenWidthDp)
                .put("ui_mode_type", uiModeType(system))
                .put("night", night(system)));
        device.put("page_size", pageSize()).put("platform", platform(context));
        return device;
    }

    // 4096 on the tested head units; 16 KiB pages are not supported.
    private static Object pageSize() {
        try {
            return Os.sysconf(OsConstants._SC_PAGESIZE);
        } catch (RuntimeException error) {
            return JSONObject.NULL;
        }
    }

    /**
     * The car platform, for head units other than the tested BYD: the automotive feature (Android
     * Automotive), whether Android Automotive's car library and the TS car adapter (the vehicle SDK of
     * DiLink 5) load in this app, and the system's shared libraries by name.
     */
    private static JSONObject platform(Context context) throws JSONException {
        PackageManager packages = context.getPackageManager();
        JSONArray libraries = new JSONArray();
        try {
            String[] names = packages.getSystemSharedLibraryNames();
            if (names != null) {
                Arrays.sort(names);
                for (int i = 0; i < names.length && i < MAX_LIBRARIES; i++) libraries.put(names[i]);
            }
        } catch (RuntimeException ignored) {
            // Left empty.
        }
        return new JSONObject()
                .put("automotive", packages.hasSystemFeature("android.hardware.type.automotive"))
                .put("android_car", loads(context, "android.car.Car"))
                .put("ts_car_adapter", loads(context, "com.ts.lib.caradapter.CarAdapterManager"))
                .put("shared_libraries", libraries);
    }

    private static boolean loads(Context context, String className) {
        try {
            Class.forName(className, false, context.getClassLoader());
            return true;
        } catch (ClassNotFoundException | LinkageError | RuntimeException error) {
            return false;
        }
    }

    static String uiModeType(Configuration configuration) {
        switch (configuration.uiMode & Configuration.UI_MODE_TYPE_MASK) {
            case Configuration.UI_MODE_TYPE_CAR: return "car";
            case Configuration.UI_MODE_TYPE_NORMAL: return "normal";
            case Configuration.UI_MODE_TYPE_TELEVISION: return "television";
            case Configuration.UI_MODE_TYPE_DESK: return "desk";
            default: return "other";
        }
    }

    static boolean night(Configuration configuration) {
        return (configuration.uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }

    // Other installed apps that may get in the way: version name, or null when absent or hidden.
    private static JSONObject setup(Context context) throws JSONException {
        JSONObject packages = new JSONObject();
        for (String name : OTHER_PACKAGES) {
            Object version = JSONObject.NULL;
            try {
                PackageInfo info = context.getPackageManager().getPackageInfo(name, 0);
                version = info.versionName != null ? info.versionName : "installed";
            } catch (PackageManager.NameNotFoundException | RuntimeException ignored) {
                // Not installed, or not visible.
            }
            packages.put(name, version);
        }
        return new JSONObject().put("packages", packages);
    }

    private static JSONObject ui(Context context, Screen screen) throws JSONException {
        int width = WindowRefreshPatch.decorWidth, height = WindowRefreshPatch.decorHeight, measured = ApiCompat.lastWindowBoundsWidth;
        Boolean multiWindow = screen.multiWindow != null ? screen.multiWindow : WindowRefreshPatch.multiWindow;
        JSONObject window = new JSONObject()
                .put("decor_width_px", width > 0 ? width : JSONObject.NULL)
                .put("decor_height_px", height > 0 ? height : JSONObject.NULL)
                .put("maps_measured_width_px", measured > 0 ? measured : JSONObject.NULL)
                .put("multi_window", orNull(multiWindow));
        return new JSONObject()
                .put("density_choice_dpi", orNull(UiDensityPatch.storedDensityDpi(context)))
                .put("density_default_dpi", UiDensityPatch.defaultDensityDpi(context))
                .put("density_applied_dpi", screen.densityDpi > 0 ? screen.densityDpi : JSONObject.NULL)
                .put("window", window);
    }

    private static JSONObject logs(Context context) throws JSONException {
        ReportLog.Recent recent = ReportLog.recent(System.currentTimeMillis() - LOG_WINDOW_MS, MAX_LOG_LINES, LOG_BUDGET_BYTES);
        JSONArray tags = new JSONArray(), lines = new JSONArray();
        for (String tag : ReportLog.TAGS) tags.put(tag);
        for (String line : recent.lines) lines.put(line);
        return new JSONObject()
                .put("tags", tags)
                .put("from", orNull(recent.from))
                .put("to", orNull(recent.to))
                .put("lines", lines)
                .put("dropped", recent.dropped)
                .put("process_lines", processLines())
                .put("main_logcat", orNull(StartLogcat.forReport(context)));
    }

    // The Morphe Logger's buffer of this process (MicroG checks and the crash handler), newest kept.
    private static JSONArray processLines() {
        List<String> lines = new ArrayList<>();
        try {
            String text = Logger.getFilteredLogs();
            String[] all = text == null || text.isEmpty() ? new String[0] : text.split("\n");
            int bytes = 0;
            for (int i = all.length - 1; i >= 0; i--) {
                String line = all[i].length() <= MAX_LINE_CHARS ? all[i] : all[i].substring(0, MAX_LINE_CHARS - 1) + "…";
                bytes += utf8(line).length + 3;
                if (bytes > PROCESS_BUDGET_BYTES) break;
                lines.add(0, line);
            }
        } catch (RuntimeException ignored) {
            // Left empty.
        }
        JSONArray array = new JSONArray();
        for (String line : lines) array.put(line);
        return array;
    }

    // A private copy is the crash text, then, after ReportLogcat.MARKER, its process's logcat lines.
    private static JSONArray crashes(Context context) throws JSONException {
        JSONArray crashes = new JSONArray();
        for (File file : ReportStore.crashes(context)) {
            String text;
            try {
                text = new String(ReportStore.readFile(file), StandardCharsets.UTF_8);
            } catch (IOException error) {
                continue;
            }
            JSONArray logcat = new JSONArray();
            int marker = text.indexOf(ReportLogcat.MARKER);
            if (marker >= 0) {
                for (String line : text.substring(marker + ReportLogcat.MARKER.length()).split("\n")) {
                    if (!line.isEmpty()) logcat.put(line);
                }
                text = text.substring(0, marker);
            }
            boolean truncated = text.length() > CRASH_MAX_CHARS;
            if (truncated) {
                text = text.substring(0, CRASH_HEAD_CHARS) + "\n…\n" + text.substring(text.length() - CRASH_TAIL_CHARS);
            }
            crashes.put(new JSONObject()
                    .put("file_name", file.getName())
                    .put("kind", file.getName().endsWith("_native.txt") ? "native" : "java")
                    .put("created_at", formatUtc(file.lastModified()))
                    .put("bytes_original", file.length())
                    .put("truncated", truncated)
                    .put("text", text)
                    .put("logcat", logcat));
        }
        return crashes;
    }

    // Every string value of the report, at any depth; short fields are also capped.
    private static void redact(JSONObject object, ReportRedactor redactor) throws JSONException {
        Iterator<String> keys = object.keys();
        List<String> names = new ArrayList<>();
        while (keys.hasNext()) names.add(keys.next());
        for (String name : names) {
            Object value = object.get(name);
            if (value instanceof String) object.put(name, redactField(name, (String) value, redactor));
            else if (value instanceof JSONObject) redact((JSONObject) value, redactor);
            else if (value instanceof JSONArray) redact((JSONArray) value, name, redactor);
        }
    }

    private static void redact(JSONArray array, String name, ReportRedactor redactor) throws JSONException {
        for (int i = 0; i < array.length(); i++) {
            Object value = array.get(i);
            if (value instanceof String) array.put(i, redactField(name, (String) value, redactor));
            else if (value instanceof JSONObject) redact((JSONObject) value, redactor);
        }
    }

    private static String redactField(String name, String value, ReportRedactor redactor) {
        String redacted = redactor.redact(value);
        boolean unlimited = name.equals("text") || name.equals("lines") || name.equals("process_lines") || name.equals("logcat")
                || name.equals("comment");
        return unlimited || redacted.length() <= SHORT ? redacted : redacted.substring(0, SHORT - 1) + "…";
    }

    // Helpers.

    private static Object orNull(Object value) {
        return value == null ? JSONObject.NULL : value;
    }

    static byte[] utf8(String text) {
        return text.getBytes(StandardCharsets.UTF_8);
    }

    static String formatUtc(long millis) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.US);
        format.setTimeZone(TimeZone.getTimeZone("UTC"));
        return format.format(new Date(millis));
    }

    /** A server time such as 2026-11-12T10:15:03Z (milliseconds optional); far future when unreadable. */
    static long parseUtc(String text) {
        if (text == null) return Long.MAX_VALUE;
        for (String pattern : new String[]{"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", "yyyy-MM-dd'T'HH:mm:ss'Z'"}) {
            SimpleDateFormat format = new SimpleDateFormat(pattern, Locale.US);
            format.setTimeZone(TimeZone.getTimeZone("UTC"));
            try {
                return format.parse(text).getTime();
            } catch (ParseException | RuntimeException ignored) {
                // Next pattern.
            }
        }
        return Long.MAX_VALUE;
    }
}
