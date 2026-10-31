package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.provider.Settings;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.shared.Utils;

/**
 * Safe mode and Maps Car's feature switches.
 * <p>
 * Each optional feature asks {@link #on} before it does anything. A feature runs when its patch is in
 * this APK, its switch is on (in the report screen; all on by default) and automatic safe mode is off.
 * Automatic safe mode starts when the main process crashes twice within 10 minutes and turns every
 * feature off. It ends when the user restarts Maps Car from the report screen, or with an app update.
 * The core (MicroG-RE, Android 10 compatibility, the crash log and the problem report) is never
 * switched off.
 * <p>
 * The state is read once per process, at the start of the Application's attachBaseContext before any
 * feature, and kept for the process lifetime, so a change applies after a restart. It lives in plain
 * files (files/morphe_safe_mode), not SharedPreferences: the main process, the report screen's process
 * and Maps' other processes all read it, and SharedPreferences keeps a copy per process. Anything
 * unreadable counts as every feature on, as before safe mode existed.
 */
@SuppressWarnings("unused")
public final class SafeMode {
    static final String TAG = "MorpheSafeMode";
    static final String UI_DENSITY = "ui_density", BYD_BATTERY = "byd_battery", SEND_TO_CAR = "send_to_car",
            LOCATION_LOCKOUT_DELAY = "location_lockout_delay", TTS_WARMUP = "tts_warmup",
            WINDOW_REFRESH = "window_refresh", SETTINGS_ROWS = "settings_rows";
    /** Every switchable feature, in the report screen's order. */
    static final String[] FEATURES = {UI_DENSITY, BYD_BATTERY, SEND_TO_CAR, LOCATION_LOCKOUT_DELAY, TTS_WARMUP,
            WINDOW_REFRESH, SETTINGS_ROWS};
    /** In the core patch; the others are in the APK only when their own patch was included. */
    private static final List<String> CORE = Arrays.asList(UI_DENSITY, TTS_WARMUP, WINDOW_REFRESH, SETTINGS_ROWS);
    /** Must match the activity's process in the patch. */
    static final String REPORT_PROCESS_SUFFIX = ":morphe_report";
    static final int CRASH_LIMIT = 2;
    static final long CRASH_WINDOW_MS = 10 * 60 * 1000;
    private static final int MAX_CRASH_RECORDS = 10;
    private static final long RESTART_DELAY_MS = 500;
    private static final String MAPS_ACTIVITY = "com.google.android.maps.MapsActivity";
    private static final String DIR = "morphe_safe_mode", STATE = "state.json", CRASHES = "crashes.txt", LOCK = "lock";

    private static final Object fileLock = new Object();
    private static volatile State state;
    private static Boolean reportProcess;

    private SafeMode() {
    }

    /** The state read at process start. */
    private static final class State {
        final Map<String, Boolean> switches = new LinkedHashMap<>();
        boolean automatic;
        long since, updateTime, clearedByUpdate;
        String reason;
        int bootCount = -1;

        boolean switchOn(String feature) {
            Boolean on = switches.get(feature);
            return on == null || on;
        }

        JSONObject toJson() throws JSONException {
            JSONObject json = new JSONObject();
            JSONObject switchesJson = new JSONObject();
            for (Map.Entry<String, Boolean> entry : switches.entrySet()) switchesJson.put(entry.getKey(), entry.getValue());
            json.put("switches", switchesJson);
            if (automatic) json.put("automatic", true).put("since", since).put("reason", reason).put("update_time", updateTime);
            if (clearedByUpdate != 0) json.put("cleared_by_update", clearedByUpdate);
            return json;
        }

        static State of(JSONObject json) {
            State state = new State();
            JSONObject switches = json.optJSONObject("switches");
            if (switches != null) {
                for (String feature : FEATURES) if (switches.has(feature)) state.switches.put(feature, switches.optBoolean(feature, true));
            }
            state.automatic = json.optBoolean("automatic");
            state.since = json.optLong("since");
            state.reason = json.optString("reason", null);
            state.updateTime = json.optLong("update_time");
            state.clearedByUpdate = json.optLong("cleared_by_update");
            return state;
        }
    }

    /** One recorded crash of the main process. */
    static final class Crash {
        final long wall, elapsed;
        final int boot;
        final String features;

        Crash(long wall, long elapsed, int boot, String features) {
            this.wall = wall;
            this.elapsed = elapsed;
            this.boot = boot;
            this.features = features;
        }

        String line() {
            return wall + " " + elapsed + " " + boot + " " + features;
        }

        static Crash parse(String line) {
            String[] parts = line.trim().split(" ");
            if (parts.length != 4) return null;
            try {
                return new Crash(Long.parseLong(parts[0]), Long.parseLong(parts[1]), Integer.parseInt(parts[2]), parts[3]);
            } catch (NumberFormatException error) {
                return null;
            }
        }

        /** Whether this crash came within the window after [earlier]: by uptime in the same boot, else by the clock. */
        boolean closeAfter(Crash earlier) {
            if (boot >= 0 && boot == earlier.boot) {
                long gap = elapsed - earlier.elapsed;
                return gap >= 0 && gap <= CRASH_WINDOW_MS;
            }
            return Math.abs(wall - earlier.wall) <= CRASH_WINDOW_MS;
        }
    }

    /** Written by the patch: the features of the separate patches in this APK, comma separated. */
    private static String includedFeatures() {
        return "";
    }

    /**
     * Injection point: start of the Application's attachBaseContext, before BYD battery and the UI
     * density, in every process. Installs the crash handler and reads the state.
     */
    public static void attachBaseContext(Context base) {
        try {
            CrashLogPatch.installHandler(base);
        } catch (Throwable error) {
            ReportLog.w(TAG, "crash handler not installed early", error);
        }
        load(base);
    }

    /** Injection point: whether this is the report screen's process, where Maps' own start is skipped. */
    public static boolean isReportProcess() {
        if (reportProcess == null) {
            String name = Application.getProcessName();
            reportProcess = name != null && name.endsWith(REPORT_PROCESS_SUFFIX);
        }
        return reportProcess;
    }

    /** Injection point: whether Maps Car's rows are added to Maps' Settings. */
    public static boolean settingsRows(Context context) {
        return on(context, SETTINGS_ROWS);
    }

    /** The patches in this APK, by their names in the bundle (the report's app.patches). */
    static List<String> patchNames() {
        List<String> names = new ArrayList<>();
        names.add("Google Maps Automotive for MicroG-RE");
        if (included(BYD_BATTERY)) names.add("BYD battery (EV)");
        if (included(SEND_TO_CAR)) names.add("Send to car");
        if (included(LOCATION_LOCKOUT_DELAY)) names.add("BYD location flicker fix");
        return names;
    }

    /**
     * From the report screen, before it shows the state or builds a report: its process lives on while
     * Maps Car crashes and restarts (it would show the state of when it opened), so it reads
     * the files again. Nothing runs in that process, so this changes no feature.
     */
    static void refresh(Context context) {
        if (!isReportProcess()) return;
        synchronized (SafeMode.class) {
            state = null;
        }
        load(context);
    }

    /** Whether [feature]'s patch is in this APK. */
    static boolean included(String feature) {
        if (CORE.contains(feature)) return true;
        for (String name : includedFeatures().split(",")) if (name.equals(feature)) return true;
        return false;
    }

    /** Whether [feature] runs in this process. */
    static boolean on(Context context, String feature) {
        if (state == null && context != null) load(context);
        return on(feature);
    }

    static boolean on(String feature) {
        if (isReportProcess() || !included(feature)) return false;
        State current = state;
        if (current == null) {
            if (!Utils.isContextSet()) return true;
            load(Utils.getContext());
            current = state;
            if (current == null) return true;
        }
        return current.switchOn(feature) && !current.automatic;
    }

    /** The stored switch (what the user chose), regardless of safe mode. */
    static boolean switchOn(String feature) {
        State current = state;
        return current == null || current.switchOn(feature);
    }

    static boolean automatic() {
        State current = state;
        return current != null && current.automatic;
    }

    static long automaticSince() {
        State current = state;
        return current != null ? current.since : 0;
    }

    /** Included features whose switch is off. */
    static int switchedOff() {
        int off = 0;
        for (String feature : FEATURES) if (included(feature) && !switchOn(feature)) off++;
        return off;
    }

    private static boolean isMainProcess(Context context) {
        return context.getPackageName().equals(Application.getProcessName());
    }

    private static File dir(Context context) {
        return new File(context.getFilesDir(), DIR);
    }

    private static synchronized void load(Context context) {
        if (state != null) return;
        State loaded;
        try {
            boolean main = isMainProcess(context);
            loaded = read(context);
            // Only main-process crashes are recorded.
            if (main) loaded.bootCount = bootCount(context);
            if (loaded.automatic && main) {
                // An update (a new build, perhaps with a fix) ends automatic safe mode.
                long updated = lastUpdateTime(context);
                if (updated != 0 && loaded.updateTime != 0 && updated != loaded.updateTime) {
                    synchronized (fileLock) {
                        try (Locked ignored = new Locked(context)) {
                            loaded = read(context);
                            loaded.bootCount = bootCount(context);
                            if (loaded.automatic) {
                                loaded.automatic = false;
                                loaded.clearedByUpdate = System.currentTimeMillis();
                                writeState(context, loaded);
                                writeCrashes(context, new ArrayList<>());
                                ReportLog.i(TAG, "safe mode ended by an app update");
                            }
                        }
                    }
                }
            }
        } catch (Throwable error) {
            ReportLog.w(TAG, "safe mode state unreadable, every feature on", error);
            loaded = new State();
        }
        state = loaded;
        if (!isReportProcess() && (loaded.automatic || switchedOff() > 0)) ReportLog.i(TAG, describe());
    }

    private static State read(Context context) {
        File file = new File(dir(context), STATE);
        if (!file.isFile()) return new State();
        try {
            return State.of(new JSONObject(new String(ReportStore.readFile(file), StandardCharsets.UTF_8)));
        } catch (IOException | JSONException error) {
            ReportLog.w(TAG, "safe mode state unreadable, every feature on", error);
            return new State();
        }
    }

    private static List<Crash> readCrashes(Context context) {
        List<Crash> crashes = new ArrayList<>();
        File file = new File(dir(context), CRASHES);
        if (!file.isFile()) return crashes;
        try {
            for (String line : new String(ReportStore.readFile(file), StandardCharsets.UTF_8).split("\n")) {
                Crash crash = Crash.parse(line);
                if (crash != null) crashes.add(crash);
            }
        } catch (IOException ignored) {
            // No records: no safe mode from them.
        }
        return crashes;
    }

    private static void writeState(Context context, State value) throws IOException, JSONException {
        write(context, STATE, value.toJson().toString().getBytes(StandardCharsets.UTF_8));
    }

    private static void writeCrashes(Context context, List<Crash> crashes) throws IOException {
        StringBuilder text = new StringBuilder();
        for (Crash crash : crashes) text.append(crash.line()).append('\n');
        write(context, CRASHES, text.toString().getBytes(StandardCharsets.UTF_8));
    }

    // Written whole, then renamed over the old file, so a reader never sees half of it.
    private static void write(Context context, String name, byte[] contents) throws IOException {
        File dir = dir(context);
        if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("no safe mode folder");
        File temporary = new File(dir, name + ".tmp");
        try (OutputStream out = new FileOutputStream(temporary, false)) {
            out.write(contents);
        }
        if (!temporary.renameTo(new File(dir, name))) throw new IOException(name + " not replaced");
    }

    /** Holds the cross-process lock of the state files; callers also hold {@link #fileLock}. */
    private static final class Locked implements AutoCloseable {
        private RandomAccessFile file;
        private FileLock lock;

        Locked(Context context) {
            try {
                File dir = dir(context);
                if (!dir.isDirectory() && !dir.mkdirs()) return;
                file = new RandomAccessFile(new File(dir, LOCK), "rw");
                lock = file.getChannel().lock();
            } catch (IOException | RuntimeException error) {
                // Unlocked: the other process rarely writes at the same moment.
            }
        }

        @Override
        public void close() {
            try {
                if (lock != null) lock.release();
                if (file != null) file.close();
            } catch (IOException ignored) {
                // Released with the file.
            }
        }
    }

    private static int bootCount(Context context) {
        try {
            return Settings.Global.getInt(context.getContentResolver(), Settings.Global.BOOT_COUNT, -1);
        } catch (RuntimeException error) {
            return -1;
        }
    }

    private static long lastUpdateTime(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).lastUpdateTime;
        } catch (Exception error) {
            return 0;
        }
    }

    /** The features running in this process, comma separated, or "-". */
    private static String runningFeatures() {
        StringBuilder text = new StringBuilder();
        for (String feature : FEATURES) {
            if (!on(feature)) continue;
            if (text.length() > 0) text.append(',');
            text.append(feature);
        }
        return text.length() == 0 ? "-" : text.toString();
    }

    /** What the main process runs by the stored state, comma separated, or "-": for crashes found later. */
    private static String mainFeatures(Context context) {
        if (state == null) load(context);
        State current = state;
        StringBuilder text = new StringBuilder();
        for (String feature : FEATURES) {
            if (!included(feature) || current != null && (!current.switchOn(feature) || current.automatic)) continue;
            if (text.length() > 0) text.append(',');
            text.append(feature);
        }
        return text.length() == 0 ? "-" : text.toString();
    }

    /**
     * From the crash handler, in the crashing process before it dies: records a main-process crash and
     * starts automatic safe mode when it is the second within 10 minutes. Returns whether it started now.
     */
    static boolean recordCrash(Context context) {
        if (isReportProcess() || !isMainProcess(context)) return false;
        State current = state;
        return record(context, new Crash(System.currentTimeMillis(), SystemClock.elapsedRealtime(),
                current != null ? current.bootCount : bootCount(context), runningFeatures()));
    }

    /**
     * From the native crash check (NativeCrashes), in any process: a main-process crash found in the
     * crash log at a later start, recorded at its own time. The crash log does not survive a restart of
     * the head unit, so the crash was in this boot.
     */
    static boolean recordCrashAt(Context context, long wallMillis) {
        long elapsed = SystemClock.elapsedRealtime() - Math.max(0, System.currentTimeMillis() - wallMillis);
        return record(context, new Crash(wallMillis, Math.max(0, elapsed), bootCount(context), mainFeatures(context)));
    }

    /**
     * Adds [crash] to the records, kept by time and at most 10, and returns the time of the later of a
     * close pair it forms with a neighbour (safe mode then starts), else 0. Records may arrive out of
     * order: a native crash is found after a later crash. Plain Java, so it can be checked off the device.
     */
    static long add(List<Crash> crashes, Crash crash) {
        crashes.add(crash);
        crashes.sort((a, b) -> Long.compare(a.wall, b.wall));
        while (crashes.size() > MAX_CRASH_RECORDS) crashes.remove(0);
        int index = crashes.indexOf(crash);
        if (index < 0) return 0;
        if (index + 1 < crashes.size() && crashes.get(index + 1).closeAfter(crash)) return crashes.get(index + 1).wall;
        if (index > 0 && crash.closeAfter(crashes.get(index - 1))) return crash.wall;
        return 0;
    }

    private static boolean record(Context context, Crash crash) {
        synchronized (fileLock) {
            try (Locked ignored = new Locked(context)) {
                List<Crash> crashes = readCrashes(context);
                long since = add(crashes, crash);
                writeCrashes(context, crashes);
                State stored = read(context);
                if (stored.automatic || since == 0) return false;
                stored.automatic = true;
                stored.since = since;
                stored.reason = CRASH_LIMIT + " crashes in " + CRASH_WINDOW_MS / 60000 + " min";
                stored.updateTime = lastUpdateTime(context);
                stored.clearedByUpdate = 0;
                writeState(context, stored);
                ReportLog.w(TAG, "safe mode starts at the next start: " + stored.reason);
                return true;
            } catch (IOException | JSONException | RuntimeException error) {
                ReportLog.w(TAG, "crash not recorded", error);
                return false;
            }
        }
    }

    /**
     * From the report screen: stores the switches, ends automatic safe mode and forgets the recorded
     * crashes. Applies at the next start.
     */
    static boolean apply(Context context, Map<String, Boolean> switches) {
        synchronized (fileLock) {
            try (Locked ignored = new Locked(context)) {
                State stored = read(context);
                stored.switches.clear();
                for (String feature : FEATURES) {
                    Boolean on = switches.get(feature);
                    stored.switches.put(feature, on == null ? stored.switchOn(feature) : on);
                }
                stored.automatic = false;
                stored.clearedByUpdate = 0;
                writeState(context, stored);
                writeCrashes(context, new ArrayList<>());
                ReportLog.i(TAG, "switches set: " + stored.switches);
                return true;
            } catch (IOException | JSONException | RuntimeException error) {
                ReportLog.w(TAG, "switches not saved", error);
                return false;
            }
        }
    }

    /** True once after an update ended automatic safe mode: whether the start shows it. */
    static boolean takeClearedByUpdate(Context context) {
        State current = state;
        if (current == null || current.clearedByUpdate == 0) return false;
        synchronized (fileLock) {
            try (Locked ignored = new Locked(context)) {
                State stored = read(context);
                if (stored.clearedByUpdate == 0) return false;
                stored.clearedByUpdate = 0;
                writeState(context, stored);
                return true;
            } catch (IOException | JSONException | RuntimeException error) {
                return false;
            }
        }
    }

    /**
     * From the report screen: ends Maps Car's other processes (they read the switches only when they
     * start) and opens Maps again.
     */
    static void restartMaps(Activity host) {
        Context app = host.getApplicationContext();
        try {
            ActivityManager manager = (ActivityManager) app.getSystemService(Context.ACTIVITY_SERVICE);
            List<ActivityManager.RunningAppProcessInfo> processes = manager != null ? manager.getRunningAppProcesses() : null;
            if (processes != null) {
                for (ActivityManager.RunningAppProcessInfo process : processes) {
                    if (process.uid == Process.myUid() && process.pid != Process.myPid()) Process.killProcess(process.pid);
                }
            }
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "Maps Car's processes not ended", error);
        }
        // MapsActivity itself: the report screen's launcher entry is a launcher activity of this app too.
        Intent launch = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
                .setClassName(app.getPackageName(), MAPS_ACTIVITY)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        // Gives the ended processes a moment to go.
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            try {
                app.startActivity(launch);
            } catch (RuntimeException error) {
                ReportLog.w(TAG, "Maps Car not opened again", error);
            }
        }, RESTART_DELAY_MS);
        host.finishAndRemoveTask();
    }

    /** One line for logs and crash files: what runs, what is off and why. */
    static String describe() {
        try {
            StringBuilder on = new StringBuilder(), off = new StringBuilder();
            for (String feature : FEATURES) {
                if (!included(feature)) continue;
                StringBuilder target = on(feature) ? on : off;
                if (target.length() > 0) target.append(", ");
                target.append(feature);
            }
            String text = "on: " + (on.length() == 0 ? "none" : on) + "; off: " + (off.length() == 0 ? "none" : off);
            if (isReportProcess()) return text + " (report process)";
            if (automatic()) text += "; safe mode since " + ReportBuilder.formatUtc(automaticSince());
            return text;
        } catch (RuntimeException error) {
            return "unknown";
        }
    }

    /** The problem report's safe_mode section. */
    static JSONObject report(Context context) throws JSONException {
        if (state == null) load(context);
        State current = state;
        JSONObject features = new JSONObject(), switches = new JSONObject();
        for (String feature : FEATURES) {
            if (!included(feature)) continue;
            switches.put(feature, switchOn(feature));
            // In the report screen's process nothing runs; what the main process runs follows the stored state.
            features.put(feature, current != null ? current.switchOn(feature) && !current.automatic : true);
        }
        JSONArray recent = new JSONArray();
        List<Crash> crashes = readCrashes(context);
        for (int i = Math.max(0, crashes.size() - 5); i < crashes.size(); i++) {
            Crash crash = crashes.get(i);
            JSONArray running = new JSONArray();
            if (!crash.features.equals("-")) for (String feature : crash.features.split(",")) running.put(feature);
            recent.put(new JSONObject().put("at", ReportBuilder.formatUtc(crash.wall)).put("features", running));
        }
        boolean automatic = current != null && current.automatic;
        return new JSONObject()
                .put("automatic", automatic)
                .put("since", automatic ? ReportBuilder.formatUtc(current.since) : JSONObject.NULL)
                .put("reason", automatic && current.reason != null ? current.reason : JSONObject.NULL)
                .put("features", features)
                .put("switches", switches)
                .put("recent_crashes", recent);
    }
}
