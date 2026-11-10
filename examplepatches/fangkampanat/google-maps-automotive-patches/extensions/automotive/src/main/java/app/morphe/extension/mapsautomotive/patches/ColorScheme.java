package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ComponentCallbacks;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import org.json.JSONException;
import org.json.JSONObject;

import java.lang.ref.WeakReference;
import java.util.Objects;

import app.morphe.extension.shared.Utils;

/**
 * Color scheme, chosen in Maps' Settings (row "Color scheme").
 * <p>
 * Maps for Android Automotive takes its day or night colors, for its screens and for the map, from its
 * night mode controller. Its own Day/Night preferences are not stored in this build, so the controller
 * follows the system: night colors while the system configuration is in night mode. Some BYD head units
 * (the Dolphin's) keep the system in night mode all day; on others the car's day/night setting switches it.
 * <p>
 * The patch passes the controller's night value through {@link #night}: Day gives day colors, Night
 * night colors, and Auto night colors while the car's low beam is on (the reading has to hold for
 * {@link #HOLD_MS} before a change) and day colors while it is off. When the light cannot be read (no
 * BYD SDK, DiLink 5, the service refusing), Auto keeps Maps' own value. A change applies at once: the
 * patch makes the controller a {@link Controller}, which runs its update again on the main thread and,
 * when the value changed, refreshes Maps' screens (its cards take their colors when they are bound). Until
 * the first reading after Auto starts, Auto keeps the colors Maps has (no flash of night colors when
 * switching from Day).
 * <p>
 * While Auto shows Maps' own value, a change of the system night flag is applied the same way as soon as
 * Maps' process sees it: a head unit that switches day and night by itself may give Maps' activity the new
 * configuration only when it comes back to the front.
 */
@SuppressWarnings("unused")
public final class ColorScheme {
    /**
     * Maps' night mode controller, which the patch makes implement this: runs its own configuration update again
     * and, when its night value changed, refreshes Maps' screens. Returns whether the value changed. Main thread.
     */
    public interface Controller {
        boolean morpheRefreshNight(Configuration configuration);
    }

    private static final String TAG = "MorpheColorScheme";
    private static final String PREFERENCES = "morphe_color_scheme";
    private static final String KEY_CHOICE = "choice";
    /** The last low beam state Auto used and when (wall clock), for the first colors after a start. */
    private static final String KEY_LAST_NIGHT = "last_lights_night", KEY_LAST_AT = "last_lights_at";
    /** How old that state may be to count at a start. */
    static final long LAST_LIGHTS_MAX_AGE_MS = 2 * 60 * 60 * 1000;
    /** While the state holds it is stored again this often, so its age counts from the last reading. */
    private static final long LAST_LIGHTS_STORE_EVERY_MS = 10 * 60 * 1000;
    static final String AUTO = "auto", DAY = "day", NIGHT = "night";
    private static final String[] CHOICES = {AUTO, DAY, NIGHT};
    /** Where the night value comes from (report and log). */
    static final String FROM_LIGHTS = "lights", FROM_WAITING = "waiting", FROM_MAPS = "maps", FROM_CHOICE = "choice",
            FROM_OFF = "off";
    /**
     * How long a new low beam reading has to hold before Auto follows it. A first new reading only marks it pending,
     * so Auto follows the second known reading in a row, about {@link #POLL_MS} later; half the poll interval leaves a
     * margin for a poll that runs a little early. A single odd reading does not switch the colors.
     */
    static final long HOLD_MS = 500;
    /** Unknown readings for this long make the low beam unknown: Auto then keeps Maps' value. */
    static final long UNKNOWN_AFTER_MS = 10000;
    private static final long POLL_MS = 1000, INIT_RETRY_MS = 30000;
    /** Failed starts of the light reader before Auto stops trying in this process (Maps' value then). */
    private static final int MAX_INIT_TRIES = 5;
    /** The side lights, for the report only, every this many low beam reads. */
    private static final int SIDE_LIGHTS_EVERY = 10;

    private static volatile WeakReference<Controller> controller;
    /** Maps' own night value at its last update, null before. */
    private static volatile Boolean mapsNight;
    /** The value given to Maps last and where it came from, null before Maps asked. */
    private static volatile Boolean givenNight;
    private static volatile String givenSource;
    /** The stored choice, read once and kept current by the chooser. */
    private static volatile String choice;
    private static volatile Boolean switchOn;
    private static Handler main;
    private static Handler worker;
    private static BydLightReader reader;
    private static volatile String lightStatus = "not_started";
    private static long nextInitAt;
    private static int initFailures, polls;
    private static long lastStoredAt;
    /** No light reading in this process (not a BYD, no BYD SDK, or it failed to start): Auto keeps Maps' value. */
    private static volatile boolean lightsGivenUp;
    /** Auto started its light reader and has not finished a first read yet: Auto keeps the colors given last. */
    private static volatile boolean awaitingFirstRead;
    private static volatile int lowBeam = BydLightReader.UNKNOWN, sideLights = BydLightReader.UNKNOWN;
    /** The values as the SDK returned them, for the report; NO_VALUE before a read. */
    private static volatile int lowBeamRaw = BydLightReader.NO_VALUE, sideLightsRaw = BydLightReader.NO_VALUE;
    private static final LowBeam lowBeamState = new LowBeam();
    private static volatile String loggedLine;
    /** The stored last low beam state, read once (main thread); null when none or too old. */
    private static Boolean lastLights;
    private static boolean lastLightsRead;
    /** The system night flag of the last configuration Maps' process saw; null before the watch starts (main thread). */
    private static Boolean systemNight;
    private static boolean systemWatchStarted;
    /** The Settings row whose subtitle the chooser set in place, null before a choice (main thread). */
    private static SubtitleRow subtitleRow;

    private ColorScheme() {
    }

    /**
     * Injection point: the night value of Maps' night mode controller in its configuration update (the
     * system night flag), on the main thread. Returns the value for the chosen color scheme.
     */
    public static boolean night(Controller maps, boolean mapsValue) {
        try {
            if (maps != null) {
                WeakReference<Controller> current = controller;
                if (current == null || current.get() != maps) controller = new WeakReference<>(maps);
            }
            mapsNight = mapsValue;
            watchSystemNight();
            boolean on = on();
            String chosen = on ? choice() : AUTO;
            boolean auto = on && AUTO.equals(chosen);
            if (auto) startLights();
            // The wait flag first: the worker clears it only after it recorded the first reading.
            boolean awaiting = awaitingFirstRead;
            Boolean lights = auto ? lowBeamState.stable() : null;
            boolean waiting = auto && lights == null && awaiting;
            // While waiting: the colors given last, or at a start the low beam state of the last few hours.
            Boolean held = !waiting ? null : givenNight != null ? givenNight : lastLights();
            boolean value = decide(on, chosen, mapsValue, lights, held);
            String source = source(on, chosen, lights, waiting);
            boolean changed = !Objects.equals(givenNight, value) || !source.equals(givenSource);
            givenNight = value;
            givenSource = source;
            String line = (value ? "night" : "day") + " (" + source + ", choice " + chosen + ", Maps " + (mapsValue ? "night" : "day") + ")";
            if (!line.equals(loggedLine)) {
                loggedLine = line;
                ReportLog.i(TAG, "Colors " + line);
            }
            if (changed) saveSnapshot();
            return value;
        } catch (Throwable error) {
            ReportLog.w(TAG, "Color scheme failed, Maps' value", error);
            return mapsValue;
        }
    }

    /** The stored last low beam state when it is recent enough ({@link #fresh}); read once per process. */
    private static Boolean lastLights() {
        if (lastLightsRead) return lastLights;
        lastLightsRead = true;
        try {
            if (!Utils.isContextSet()) return null;
            android.content.SharedPreferences preferences =
                    Utils.getContext().getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
            if (!preferences.contains(KEY_LAST_NIGHT)) return null;
            long at = preferences.getLong(KEY_LAST_AT, 0);
            if (fresh(at, System.currentTimeMillis())) lastLights = preferences.getBoolean(KEY_LAST_NIGHT, false);
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "Could not read the last low beam state", error);
        }
        return lastLights;
    }

    // The decision itself has no Android dependency.

    /** Whether a low beam state stored at [at] (wall clock ms) still counts at [now]. */
    static boolean fresh(long at, long now) {
        return at > 0 && now >= at && now - at <= LAST_LIGHTS_MAX_AGE_MS;
    }

    /**
     * The night value: Maps' value when switched off; Day false, Night true; Auto the low beam, else [held] (the value
     * given last, while waiting for the first reading), else Maps' value.
     */
    static boolean decide(boolean on, String choice, boolean mapsValue, Boolean lowBeamOn, Boolean held) {
        if (!on) return mapsValue;
        if (DAY.equals(choice)) return false;
        if (NIGHT.equals(choice)) return true;
        if (lowBeamOn != null) return lowBeamOn;
        return held != null ? held : mapsValue;
    }

    /** Where {@link #decide}'s value comes from. */
    static String source(boolean on, String choice, Boolean lowBeamOn, boolean waiting) {
        if (!on) return FROM_OFF;
        if (DAY.equals(choice) || NIGHT.equals(choice)) return FROM_CHOICE;
        if (lowBeamOn != null) return FROM_LIGHTS;
        return waiting ? FROM_WAITING : FROM_MAPS;
    }

    /**
     * The low beam as Auto uses it: the first known reading at once, then a new state only after it held for
     * {@link #HOLD_MS}; unknown again after {@link #UNKNOWN_AFTER_MS} of unknown readings. Thread-safe.
     */
    static final class LowBeam {
        private Boolean stable;
        private Boolean pending;
        private long pendingSince, unknownSince = -1;

        /** Records a reading at [now] (ms, monotonic); returns true when the stable state changed. */
        synchronized boolean observe(int reading, long now) {
            Boolean before = stable;
            if (reading != BydLightReader.ON && reading != BydLightReader.OFF) {
                if (unknownSince < 0) unknownSince = now;
                if (stable != null && now - unknownSince >= UNKNOWN_AFTER_MS) {
                    stable = null;
                    pending = null;
                }
                return !Objects.equals(before, stable);
            }
            unknownSince = -1;
            boolean on = reading == BydLightReader.ON;
            if (stable == null) {
                stable = on;
                pending = null;
            } else if (stable == on) {
                pending = null;
            } else if (pending == null || pending != on) {
                pending = on;
                pendingSince = now;
            } else if (now - pendingSince >= HOLD_MS) {
                stable = on;
                pending = null;
            }
            return !Objects.equals(before, stable);
        }

        synchronized Boolean stable() {
            return stable;
        }

        synchronized void reset() {
            stable = null;
            pending = null;
            unknownSince = -1;
        }
    }

    // The low beam reader: a background thread that reads every second while Auto is in use.

    private static synchronized void startLights() {
        if (worker != null || lightsGivenUp) return;
        if (!Utils.isContextSet()) return;
        HandlerThread thread = new HandlerThread(TAG, Process.THREAD_PRIORITY_BACKGROUND);
        thread.start();
        awaitingFirstRead = true;
        worker = new Handler(thread.getLooper());
        worker.post(ColorScheme::pollLights);
    }

    // Worker thread only.
    private static void pollLights() {
        try {
            // Decided under the lock startLights takes, so a choice of Auto made meanwhile keeps this worker.
            synchronized (ColorScheme.class) {
                if (!on() || !AUTO.equals(choice())) {
                    lowBeamState.reset();
                    lowBeam = sideLights = BydLightReader.UNKNOWN;
                    lowBeamRaw = sideLightsRaw = BydLightReader.NO_VALUE;
                    awaitingFirstRead = false;
                    worker.getLooper().quitSafely();
                    worker = null;
                    return;
                }
            }
            long now = SystemClock.elapsedRealtime();
            if (reader == null || !reader.ready()) {
                if (now < nextInitAt) {
                    // No reading before the next start attempt: Auto shows Maps' colors meanwhile.
                    if (awaitingFirstRead) {
                        awaitingFirstRead = false;
                        refresh("no low beam reading yet");
                    }
                    worker.postDelayed(ColorScheme::pollLights, POLL_MS);
                    return;
                }
                if (reader == null) reader = new BydLightReader();
                boolean byd = BydBatteryPatch.isByd();
                String status = byd ? reader.init(Utils.getContext()) : "not_byd";
                boolean statusChanged = !status.equals(lightStatus);
                if (statusChanged) ReportLog.i(TAG, "BYD light " + status);
                lightStatus = status;
                if (!reader.ready()) {
                    // The first attempt ends the wait: Auto then shows Maps' colors until a reading.
                    boolean firstAttempt = awaitingFirstRead;
                    awaitingFirstRead = false;
                    if (!byd || ++initFailures >= MAX_INIT_TRIES) {
                        ReportLog.i(TAG, "No low beam reading in this process: Auto keeps Maps' colors");
                        synchronized (ColorScheme.class) {
                            lightsGivenUp = true;
                            worker.getLooper().quitSafely();
                            worker = null;
                        }
                        refresh("no low beam reading");
                        saveSnapshot();
                        return;
                    }
                    if (firstAttempt) refresh("light reader not ready");
                    if (statusChanged) saveSnapshot();
                    nextInitAt = now + INIT_RETRY_MS;
                    worker.postDelayed(ColorScheme::pollLights, POLL_MS);
                    return;
                }
                if (statusChanged) saveSnapshot();
            }
            int lowRaw = reader.lowBeamRaw();
            int low = reader.state(lowRaw);
            boolean rawChanged = lowRaw != lowBeamRaw;
            lowBeamRaw = lowRaw;
            lowBeam = low;
            if (polls++ % SIDE_LIGHTS_EVERY == 0) {
                int sideRaw = reader.sideLightsRaw();
                rawChanged |= sideRaw != sideLightsRaw;
                sideLightsRaw = sideRaw;
                sideLights = reader.state(sideRaw);
            }
            if (rawChanged) ReportLog.i(TAG, "Light raw: low beam " + rawText(lowBeamRaw) + ", side lights " + rawText(sideLightsRaw));
            // Recorded before the wait ends, so Maps' update never sees neither.
            boolean stableChanged = lowBeamState.observe(low, now);
            boolean firstRead = awaitingFirstRead;
            awaitingFirstRead = false;
            Boolean stable = lowBeamState.stable();
            if (stableChanged) {
                ReportLog.i(TAG, "Low beam " + describe(stable) + " (side lights " + describeReading(sideLights) + ")");
            }
            if (stable != null && (stableChanged || now - lastStoredAt >= LAST_LIGHTS_STORE_EVERY_MS)) {
                storeLastLights(stable);
                lastStoredAt = now;
            }
            if (stableChanged || firstRead) refresh(stableChanged ? "low beam " + describe(stable) : "first low beam reading");
            if (stableChanged || rawChanged) saveSnapshot();
        } catch (Throwable error) {
            ReportLog.w(TAG, "Low beam read failed", error);
        }
        Handler current = worker;
        if (current != null) current.postDelayed(ColorScheme::pollLights, POLL_MS);
    }

    private static void storeLastLights(boolean night) {
        try {
            Utils.getContext().getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit()
                    .putBoolean(KEY_LAST_NIGHT, night).putLong(KEY_LAST_AT, System.currentTimeMillis()).apply();
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "Could not store the low beam state", error);
        }
    }

    private static String describe(Boolean on) {
        return on == null ? "unknown" : on ? "on" : "off";
    }

    private static String rawText(int raw) {
        return raw == BydLightReader.NO_VALUE ? "none" : String.valueOf(raw);
    }

    /** The report screen reads the main process's snapshot: saved again when the colors or the lights change. */
    private static void saveSnapshot() {
        try {
            if (Utils.isContextSet()) ReportBuilder.saveSnapshot(Utils.getContext(), true);
        } catch (Throwable error) {
            ReportLog.w(TAG, "Color scheme snapshot not saved", error);
        }
    }

    private static String describeReading(int reading) {
        return reading == BydLightReader.ON ? "on" : reading == BydLightReader.OFF ? "off" : "unknown";
    }

    private static Handler mainHandler() {
        synchronized (ColorScheme.class) {
            if (main == null) main = new Handler(Looper.getMainLooper());
            return main;
        }
    }

    /**
     * Runs Maps' night mode update again on the main thread, so a new value applies at once; when the value
     * changed, Maps' screens are refreshed with it. [reason] is for the log.
     */
    private static void refresh(String reason) {
        mainHandler().post(() -> {
            try {
                WeakReference<Controller> current = controller;
                Controller maps = current != null ? current.get() : null;
                if (maps == null || !Utils.isContextSet()) return;
                if (maps.morpheRefreshNight(liveConfiguration())) {
                    ReportLog.i(TAG, "Maps' screens refreshed for " + (Boolean.TRUE.equals(givenNight) ? "night" : "day")
                            + " colors (" + reason + ")");
                    // The refresh binds a Settings row again with the subtitle it was built with.
                    subtitleAfterRefresh();
                }
            } catch (Throwable error) {
                ReportLog.w(TAG, "Color refresh failed", error);
            }
        });
    }

    /**
     * The process's current configuration, from the application: Utils may hold a copy of the configuration made at the
     * start (for a language setting), whose night flag never changes.
     */
    private static Context application() {
        Context context = Utils.getContext();
        Context application = context.getApplicationContext();
        return application != null ? application : context;
    }

    private static Configuration liveConfiguration() {
        return application().getResources().getConfiguration();
    }

    // The system night flag, for Auto while it shows Maps' own value.

    /** Starts the watch once, from Maps' first night update (main thread). */
    private static void watchSystemNight() {
        if (systemWatchStarted || !Utils.isContextSet()) return;
        systemWatchStarted = true;
        try {
            Context application = application();
            systemNight = nightFlag(application.getResources().getConfiguration().uiMode);
            application.registerComponentCallbacks(new ComponentCallbacks() {
                @Override
                public void onConfigurationChanged(Configuration configuration) {
                    systemConfigurationChanged(configuration);
                }

                @Override
                public void onLowMemory() {
                }
            });
        } catch (Throwable error) {
            ReportLog.w(TAG, "System night watch not started", error);
        }
    }

    // Main thread (the application's configuration callbacks).
    private static void systemConfigurationChanged(Configuration configuration) {
        try {
            if (configuration == null) return;
            boolean night = nightFlag(configuration.uiMode);
            Boolean before = systemNight;
            systemNight = night;
            if (before == null || before == night) return;
            boolean on = on();
            String chosen = on ? choice() : AUTO;
            boolean auto = on && AUTO.equals(chosen);
            String source = source(on, chosen, auto ? lowBeamState.stable() : null, auto && awaitingFirstRead);
            boolean follow = followsSystem(source);
            ReportLog.i(TAG, "System night mode " + (night ? "on" : "off")
                    + (follow ? ": Maps' colors follow it now" : " (colors from " + source + ")"));
            if (follow) refresh("system night mode " + (night ? "on" : "off"));
        } catch (Throwable error) {
            ReportLog.w(TAG, "System night change not handled", error);
        }
    }

    /** Whether a change of the system night flag changes the colors given: only while they are Maps' own value. */
    static boolean followsSystem(String source) {
        return FROM_MAPS.equals(source);
    }

    /** The night flag of a Configuration.uiMode value. */
    static boolean nightFlag(int uiMode) {
        return (uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }

    // The choice and the switch.

    private static boolean on() {
        Boolean value = switchOn;
        if (value != null) return value;
        if (!Utils.isContextSet()) return false;
        boolean on = SafeMode.on(SafeMode.COLOR_SCHEME);
        switchOn = on;
        return on;
    }

    private static String choice() {
        String value = choice;
        if (value != null) return value;
        if (!Utils.isContextSet()) return AUTO;
        value = stored(Utils.getContext());
        choice = value;
        return value;
    }

    /** The stored choice, Auto when none or unknown. */
    static String stored(Context context) {
        String value = storedOrNull(context);
        return value == null ? AUTO : value;
    }

    private static String storedOrNull(Context context) {
        try {
            String value = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).getString(KEY_CHOICE, null);
            if (value == null) return null;
            for (String each : CHOICES) if (each.equals(value)) return value;
            ReportLog.w(TAG, "Ignoring unknown stored color scheme " + value);
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "Could not read the color scheme choice", error);
        }
        return null;
    }

    /** For the problem report (main process): the choice, Maps' value, the value given and the lights. */
    static JSONObject report(Context context) throws JSONException {
        Boolean maps = mapsNight, given = givenNight;
        return new JSONObject()
                .put("choice", orNull(storedOrNull(context)))
                .put("maps_night", orNull(maps))
                .put("night", orNull(given))
                .put("source", orNull(givenSource))
                .put("low_beam", orNull(readingName(lowBeam)))
                .put("low_beam_raw", rawOrNull(lowBeamRaw))
                .put("low_beam_stable", orNull(lowBeamState.stable()))
                .put("side_lights", orNull(readingName(sideLights)))
                .put("side_lights_raw", rawOrNull(sideLightsRaw))
                .put("light_status", lightStatus);
    }

    private static String readingName(int reading) {
        return reading == BydLightReader.ON ? "on" : reading == BydLightReader.OFF ? "off" : null;
    }

    private static Object rawOrNull(int raw) {
        return raw == BydLightReader.NO_VALUE ? JSONObject.NULL : raw;
    }

    private static Object orNull(Object value) {
        return value != null ? value : JSONObject.NULL;
    }

    // Settings row. The patch adds it to Maps' Settings list, after Driver side.

    /** Injection point: the row title. */
    public static String getSettingsTitle(Context context) {
        return UiDensityPatch.isThai(context) ? "รูปแบบสี (Color scheme)" : "Color scheme";
    }

    /** Injection point: the row subtitle, the current choice. */
    public static String getSettingsSummary(Context context) {
        boolean thai = UiDensityPatch.isThai(context);
        if (!SafeMode.on(context, SafeMode.COLOR_SCHEME)) {
            return (thai ? "ใช้สีของ Maps ชั่วคราว · สวิตช์ใน " : "Maps' colors for now · switch in ")
                    + ReportPatch.reportPlace(context, thai);
        }
        // The row is built once per Settings screen, so it names the choice, not the colors at that moment.
        String chosen = stored(context);
        if (AUTO.equals(chosen) && lightsGivenUp) {
            return choiceLabel(AUTO, thai) + " · " + (thai ? "อ่านไฟหน้าไม่ได้ ใช้สีของ Maps" : "headlights unreadable, Maps' colors");
        }
        return choiceLabel(chosen, thai);
    }

    /**
     * Injection point: the row's click action. The container view of the Settings screen, if the
     * patch found one, gives the activity when the given context is not one.
     */
    public static Runnable getSettingsAction(Context context, View container) {
        // Built right after the subtitle: [0] the text the row shows, updated after each live choice; [1] the text the
        // row was built with, which it shows again after Maps' screens refresh.
        String summary = getSettingsSummary(context);
        String[] shown = {summary, summary};
        return () -> showChooser(context, container, shown);
    }

    private static void showChooser(Context context, View container, String[] shown) {
        Activity activity = UiDensityPatch.findActivity(context);
        if (activity == null && container != null) activity = UiDensityPatch.findActivity(container.getContext());
        if (activity == null || activity.isFinishing()) {
            ReportLog.w(TAG, "No activity for the color scheme chooser: " + context);
            return;
        }
        Activity host = activity;
        boolean thai = UiDensityPatch.isThai(host);
        String current = stored(host);
        String[] labels = new String[CHOICES.length];
        int checked = 0;
        for (int index = 0; index < CHOICES.length; index++) {
            labels[index] = choiceLabel(CHOICES[index], thai);
            if (CHOICES[index].equals(current)) checked = index;
        }
        new AlertDialog.Builder(host)
                .setTitle(getSettingsTitle(host))
                .setSingleChoiceItems(labels, checked, (dialog, which) -> {
                    dialog.dismiss();
                    if (CHOICES[which].equals(current)) return;
                    choose(host, CHOICES[which], container, shown);
                })
                .setNegativeButton(thai ? "ยกเลิก" : "Cancel", null)
                .show();
    }

    // No restart: Maps' controller applies the new value at once. While the switch is off, the choice is
    // kept for when it is on again.
    private static void choose(Activity activity, String chosen, View container, String[] shown) {
        boolean saved = activity.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE)
                .edit().putString(KEY_CHOICE, chosen).commit();
        choice = chosen;
        boolean on = SafeMode.on(activity, SafeMode.COLOR_SCHEME);
        ReportLog.i(TAG, "Color scheme set to " + chosen + " (saved " + saved + ")" + (on ? "" : " while switched off"));
        ReportBuilder.saveSnapshot(activity.getApplicationContext(), true);
        // Maps keeps its Settings screen (no restart), so the row's subtitle is updated in place, and again after each
        // refresh of Maps' screens, which binds the row with the subtitle it was built with.
        TextView subtitle = updateSubtitle(activity, container, shown);
        subtitleRow = subtitle != null ? new SubtitleRow(activity, subtitle, shown) : null;
        if (on) {
            if (AUTO.equals(chosen)) startLights();
            refresh("choice " + chosen);
            return;
        }
        boolean thai = UiDensityPatch.isThai(activity);
        new AlertDialog.Builder(activity)
                .setTitle(getSettingsTitle(activity))
                .setMessage(thai
                        ? "บันทึกแล้ว จะใช้" + choiceLabel(chosen, true) + " เมื่อเปิด Color scheme อีกครั้งใน "
                        + ReportPatch.reportPlace(activity, true)
                        : "Saved. " + choiceLabel(chosen, false) + " is used once Color scheme is switched on again in "
                        + ReportPatch.reportPlace(activity, false) + ".")
                .setPositiveButton(thai ? "ตกลง" : "OK", null)
                .show();
    }

    /** The row subtitle the chooser set last, while it is on screen (weak references; main thread). */
    private static final class SubtitleRow {
        final WeakReference<Activity> activity;
        final WeakReference<TextView> view;
        final String[] shown;

        SubtitleRow(Activity activity, TextView view, String[] shown) {
            this.activity = new WeakReference<>(activity);
            this.view = new WeakReference<>(view);
            this.shown = shown;
        }
    }

    // Main thread, after a refresh that changed Maps' value (its screens were bound again). Only the subtitle view the
    // chooser changed, only while it is attached and shows the text the row was built with ([shown] 1) again.
    private static void subtitleAfterRefresh() {
        SubtitleRow row = subtitleRow;
        if (row == null) return;
        Activity activity = row.activity.get();
        TextView view = row.view.get();
        if (activity == null || activity.isFinishing() || activity.isDestroyed() || view == null || !view.isAttachedToWindow()) {
            subtitleRow = null;
            return;
        }
        try {
            String now = getSettingsSummary(activity);
            CharSequence text = view.getText();
            if (text != null && row.shown[1].contentEquals(text) && !now.equals(row.shown[1])) {
                view.setText(now);
                row.shown[0] = now;
            }
        } catch (Throwable error) {
            ReportLog.w(TAG, "Settings row subtitle not updated", error);
        }
    }

    /**
     * Shows the current choice in the row's subtitle, the TextView showing [shown] 0 (what the row shows) or, when the
     * row was bound again meanwhile, [shown] 1 (the text it was built with), and returns that view; null when neither
     * is found.
     */
    private static TextView updateSubtitle(Activity activity, View container, String[] shown) {
        try {
            String now = getSettingsSummary(activity);
            View root = container != null ? container : activity.getWindow().getDecorView();
            TextView view = findText(root, shown[0]);
            if (view == null && !shown[1].equals(shown[0])) view = findText(root, shown[1]);
            if (view == null) {
                if (!now.equals(shown[0])) ReportLog.i(TAG, "Settings row subtitle not found");
                return null;
            }
            CharSequence text = view.getText();
            if (text == null || !now.contentEquals(text)) view.setText(now);
            shown[0] = now;
            return view;
        } catch (Throwable error) {
            ReportLog.w(TAG, "Settings row subtitle not updated", error);
            return null;
        }
    }

    /** The first TextView under [view] showing exactly [text]. */
    private static TextView findText(View view, String text) {
        if (view instanceof TextView) {
            CharSequence shown = ((TextView) view).getText();
            return shown != null && text.contentEquals(shown) ? (TextView) view : null;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                TextView found = findText(group.getChildAt(index), text);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static String choiceLabel(String chosen, boolean thai) {
        if (DAY.equals(chosen)) return thai ? "กลางวัน" : "Day";
        if (NIGHT.equals(chosen)) return thai ? "กลางคืน" : "Night";
        return thai ? "อัตโนมัติ (ตามไฟหน้า)" : "Auto (headlights)";
    }
}
