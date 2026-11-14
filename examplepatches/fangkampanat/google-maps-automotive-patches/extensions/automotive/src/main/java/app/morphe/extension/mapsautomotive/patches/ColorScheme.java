package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.TimePickerDialog;
import android.content.ComponentCallbacks;
import android.content.Context;
import android.content.SharedPreferences;
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
import java.util.Calendar;
import java.util.Locale;
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
 * <p>
 * Auto (time) ignores the lights: night colors from the set night start to the set day start (default 18:00 to 06:00,
 * local time; the night may cross midnight). The clock is checked on the main thread just after each minute starts,
 * while Auto (time) is chosen, and a change applies the same way; that check also catches a clock set after a start.
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
    /** Auto (time): the minute of the day (local time) night colors start, and the one day colors start. */
    private static final String KEY_NIGHT_FROM = "night_from", KEY_DAY_FROM = "day_from";
    static final int DEFAULT_NIGHT_FROM = 18 * 60, DEFAULT_DAY_FROM = 6 * 60;
    static final int MINUTES_PER_DAY = 24 * 60;
    /** Auto (time) checks the clock this long after each minute starts. */
    static final long CLOCK_MARGIN_MS = 250;
    static final String AUTO = "auto", TIME = "time", DAY = "day", NIGHT = "night";
    /** In the chooser's order. */
    private static final String[] CHOICES = {AUTO, TIME, DAY, NIGHT};
    /** Where the night value comes from (report and log). */
    static final String FROM_LIGHTS = "lights", FROM_TIME = "time", FROM_WAITING = "waiting", FROM_MAPS = "maps",
            FROM_CHOICE = "choice", FROM_OFF = "off";
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
    /** Auto (time)'s night start and day start (minutes of the day), read once and kept current by the chooser. */
    private static volatile int[] times;
    /** Auto (time)'s clock check is scheduled (main thread). */
    private static boolean clockRunning;
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
            boolean timed = on && TIME.equals(chosen);
            if (auto) startLights();
            if (timed) startClock();
            // The wait flag first: the worker clears it only after it recorded the first reading.
            boolean awaiting = awaitingFirstRead;
            Boolean lights = auto ? lowBeamState.stable() : null;
            boolean waiting = auto && lights == null && awaiting;
            // While waiting: the colors given last, or at a start the low beam state of the last few hours.
            Boolean held = !waiting ? null : givenNight != null ? givenNight : lastLights();
            boolean value = decide(on, chosen, mapsValue, lights, held, timed && clockNight());
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
     * The night value: Maps' value when switched off; Day false, Night true; Auto (time) [clockNight]; Auto the low beam,
     * else [held] (the value given last, while waiting for the first reading), else Maps' value.
     */
    static boolean decide(boolean on, String choice, boolean mapsValue, Boolean lowBeamOn, Boolean held, boolean clockNight) {
        if (!on) return mapsValue;
        if (DAY.equals(choice)) return false;
        if (NIGHT.equals(choice)) return true;
        if (TIME.equals(choice)) return clockNight;
        if (lowBeamOn != null) return lowBeamOn;
        return held != null ? held : mapsValue;
    }

    /** Where {@link #decide}'s value comes from. */
    static String source(boolean on, String choice, Boolean lowBeamOn, boolean waiting) {
        if (!on) return FROM_OFF;
        if (DAY.equals(choice) || NIGHT.equals(choice)) return FROM_CHOICE;
        if (TIME.equals(choice)) return FROM_TIME;
        if (lowBeamOn != null) return FROM_LIGHTS;
        return waiting ? FROM_WAITING : FROM_MAPS;
    }

    /** Whether [minute] (of the day) is in the night from [nightFrom] to [dayFrom], which may cross midnight. */
    static boolean nightAt(int minute, int nightFrom, int dayFrom) {
        if (nightFrom == dayFrom) return false;
        if (nightFrom < dayFrom) return minute >= nightFrom && minute < dayFrom;
        return minute >= nightFrom || minute < dayFrom;
    }

    /** Milliseconds from [now] (wall clock) to {@link #CLOCK_MARGIN_MS} after the next minute starts. */
    static long untilNextMinute(long now) {
        return 60_000L - Math.floorMod(now, 60_000L) + CLOCK_MARGIN_MS;
    }

    /** Night start and day start that Auto (time) can use: each a minute of the day, and not the same. */
    static boolean validTimes(int nightFrom, int dayFrom) {
        return nightFrom >= 0 && nightFrom < MINUTES_PER_DAY && dayFrom >= 0 && dayFrom < MINUTES_PER_DAY && nightFrom != dayFrom;
    }

    /** A minute of the day as HH:MM (24-hour). */
    static String hhmm(int minute) {
        return String.format(Locale.US, "%02d:%02d", minute / 60, minute % 60);
    }

    /** Night start to day start, as the Settings row shows it. */
    static String span(int[] window) {
        return hhmm(window[0]) + "–" + hhmm(window[1]);
    }

    // Auto (time): the clock, checked on the main thread just after each minute starts while Auto (time) is chosen.

    private static int minuteNow() {
        Calendar now = Calendar.getInstance();
        return now.get(Calendar.HOUR_OF_DAY) * 60 + now.get(Calendar.MINUTE);
    }

    private static boolean clockNight() {
        int[] window = times();
        return nightAt(minuteNow(), window[0], window[1]);
    }

    // Main thread.
    private static void startClock() {
        if (clockRunning) return;
        clockRunning = true;
        ReportLog.i(TAG, "Clock check started: night " + span(times()) + ", now " + hhmm(minuteNow()));
        scheduleClock();
    }

    private static void scheduleClock() {
        mainHandler().postDelayed(ColorScheme::clockTick, untilNextMinute(System.currentTimeMillis()));
    }

    // Main thread. When the clock's value differs from the colors given, Maps' update runs again. Stops once Auto (time)
    // is no longer chosen or the switch is off.
    private static void clockTick() {
        try {
            if (!on() || !TIME.equals(choice())) {
                clockRunning = false;
                ReportLog.i(TAG, "Clock check stopped");
                return;
            }
            boolean night = clockNight();
            if (!Objects.equals(givenNight, night)) refresh("clock " + hhmm(minuteNow()));
        } catch (Throwable error) {
            ReportLog.w(TAG, "Clock check failed", error);
        }
        scheduleClock();
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

    private static int[] times() {
        int[] value = times;
        if (value != null) return value;
        if (!Utils.isContextSet()) return new int[]{DEFAULT_NIGHT_FROM, DEFAULT_DAY_FROM};
        value = storedTimes(Utils.getContext());
        times = value;
        return value;
    }

    /** Auto (time)'s stored night start and day start; the defaults when none or not {@link #validTimes}. */
    static int[] storedTimes(Context context) {
        try {
            SharedPreferences preferences = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
            int nightFrom = preferences.getInt(KEY_NIGHT_FROM, DEFAULT_NIGHT_FROM);
            int dayFrom = preferences.getInt(KEY_DAY_FROM, DEFAULT_DAY_FROM);
            if (validTimes(nightFrom, dayFrom)) return new int[]{nightFrom, dayFrom};
            ReportLog.w(TAG, "Ignoring stored color scheme times " + nightFrom + "/" + dayFrom);
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "Could not read the color scheme times", error);
        }
        return new int[]{DEFAULT_NIGHT_FROM, DEFAULT_DAY_FROM};
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

    /** For the problem report (main process): the choice, Auto (time)'s times, Maps' value, the value given and the lights. */
    static JSONObject report(Context context) throws JSONException {
        Boolean maps = mapsNight, given = givenNight;
        int[] window = storedTimes(context);
        return new JSONObject()
                .put("choice", orNull(storedOrNull(context)))
                .put("night_from", hhmm(window[0]))
                .put("day_from", hhmm(window[1]))
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
        int[] window = storedTimes(context);
        if (AUTO.equals(chosen) && lightsGivenUp) {
            return choiceLabel(AUTO, thai, window) + " · " + (thai ? "อ่านไฟหน้าไม่ได้ ใช้สีของ Maps" : "headlights unreadable, Maps' colors");
        }
        return choiceLabel(chosen, thai, window);
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
        int[] window = storedTimes(host);
        String[] labels = new String[CHOICES.length];
        int checked = 0;
        for (int index = 0; index < CHOICES.length; index++) {
            labels[index] = choiceLabel(CHOICES[index], thai, window);
            if (CHOICES[index].equals(current)) checked = index;
        }
        new AlertDialog.Builder(host)
                .setTitle(getSettingsTitle(host))
                .setSingleChoiceItems(labels, checked, (dialog, which) -> {
                    dialog.dismiss();
                    // Auto (time) opens its times, also when it is the current choice: that is where they change.
                    if (TIME.equals(CHOICES[which])) {
                        showTimes(host, container, shown, window[0], window[1]);
                        return;
                    }
                    if (CHOICES[which].equals(current)) return;
                    choose(host, CHOICES[which], null, container, shown);
                })
                .setNegativeButton(thai ? "ยกเลิก" : "Cancel", null)
                .show();
    }

    /**
     * Auto (time)'s times: a row for the night start and one for the day start, each opening Android's time picker,
     * then Save. Nothing is stored before Save; Cancel keeps the choice and times as they were.
     */
    private static void showTimes(Activity host, View container, String[] shown, int nightFrom, int dayFrom) {
        if (host.isFinishing() || host.isDestroyed()) return;
        boolean thai = UiDensityPatch.isThai(host);
        String[] rows = {
                (thai ? "สีกลางคืนตั้งแต่ " : "Night colors from ") + hhmm(nightFrom),
                (thai ? "สีกลางวันตั้งแต่ " : "Day colors from ") + hhmm(dayFrom),
        };
        new AlertDialog.Builder(host)
                .setTitle(thai ? "อัตโนมัติ (ตามเวลา)" : "Auto (time)")
                .setItems(rows, (dialog, which) -> pickTime(host, container, shown, nightFrom, dayFrom, which == 0))
                .setPositiveButton(thai ? "บันทึก" : "Save", (dialog, which) -> {
                    if (validTimes(nightFrom, dayFrom)) {
                        choose(host, TIME, new int[]{nightFrom, dayFrom}, container, shown);
                        return;
                    }
                    new AlertDialog.Builder(host)
                            .setMessage(thai ? "เวลาเริ่มสีกลางคืนกับสีกลางวันต้องไม่ตรงกัน"
                                    : "Night colors and day colors cannot start at the same time.")
                            .setPositiveButton(thai ? "ตกลง" : "OK", null)
                            .setOnDismissListener(message -> showTimes(host, container, shown, nightFrom, dayFrom))
                            .show();
                })
                .setNegativeButton(thai ? "ยกเลิก" : "Cancel", null)
                .show();
    }

    // Android's time picker (24-hour) for the night start ([night]) or the day start; back to the times either way.
    private static void pickTime(Activity host, View container, String[] shown, int nightFrom, int dayFrom, boolean night) {
        int current = night ? nightFrom : dayFrom;
        try {
            TimePickerDialog picker = new TimePickerDialog(host, (view, hour, minute) -> {
                int picked = hour * 60 + minute;
                showTimes(host, container, shown, night ? picked : nightFrom, night ? dayFrom : picked);
            }, current / 60, current % 60, true);
            picker.setOnCancelListener(dialog -> showTimes(host, container, shown, nightFrom, dayFrom));
            picker.show();
        } catch (Throwable error) {
            // A head unit whose theme the picker cannot use: whole hours from a list instead.
            ReportLog.w(TAG, "Time picker failed, hour list instead", error);
            pickHour(host, container, shown, nightFrom, dayFrom, night);
        }
    }

    private static void pickHour(Activity host, View container, String[] shown, int nightFrom, int dayFrom, boolean night) {
        boolean thai = UiDensityPatch.isThai(host);
        String[] hours = new String[24];
        for (int hour = 0; hour < hours.length; hour++) hours[hour] = hhmm(hour * 60);
        new AlertDialog.Builder(host)
                .setTitle(night ? (thai ? "สีกลางคืนตั้งแต่" : "Night colors from") : (thai ? "สีกลางวันตั้งแต่" : "Day colors from"))
                .setSingleChoiceItems(hours, (night ? nightFrom : dayFrom) / 60, (dialog, which) -> {
                    dialog.dismiss();
                    showTimes(host, container, shown, night ? which * 60 : nightFrom, night ? dayFrom : which * 60);
                })
                .setNegativeButton(thai ? "ยกเลิก" : "Cancel", (dialog, which) -> dialog.cancel())
                .setOnCancelListener(dialog -> showTimes(host, container, shown, nightFrom, dayFrom))
                .show();
    }

    // No restart: Maps' controller applies the new value at once. While the switch is off, the choice is
    // kept for when it is on again. [window]: Auto (time)'s times to store with it, else null.
    private static void choose(Activity activity, String chosen, int[] window, View container, String[] shown) {
        SharedPreferences.Editor editor = activity.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE)
                .edit().putString(KEY_CHOICE, chosen);
        if (window != null) editor.putInt(KEY_NIGHT_FROM, window[0]).putInt(KEY_DAY_FROM, window[1]);
        boolean saved = editor.commit();
        choice = chosen;
        if (window != null) times = window.clone();
        boolean on = SafeMode.on(activity, SafeMode.COLOR_SCHEME);
        ReportLog.i(TAG, "Color scheme set to " + chosen + (window != null ? ", night " + span(window) : "")
                + " (saved " + saved + ")" + (on ? "" : " while switched off"));
        ReportBuilder.saveSnapshot(activity.getApplicationContext(), true);
        // Maps keeps its Settings screen (no restart), so the row's subtitle is updated in place, and again after each
        // refresh of Maps' screens, which binds the row with the subtitle it was built with.
        TextView subtitle = updateSubtitle(activity, container, shown);
        subtitleRow = subtitle != null ? new SubtitleRow(activity, subtitle, shown) : null;
        if (on) {
            if (AUTO.equals(chosen)) startLights();
            if (TIME.equals(chosen)) startClock();
            refresh("choice " + chosen);
            return;
        }
        boolean thai = UiDensityPatch.isThai(activity);
        int[] shownTimes = storedTimes(activity);
        new AlertDialog.Builder(activity)
                .setTitle(getSettingsTitle(activity))
                .setMessage(thai
                        ? "บันทึกแล้ว จะใช้" + choiceLabel(chosen, true, shownTimes) + " เมื่อเปิด Color scheme อีกครั้งใน "
                        + ReportPatch.reportPlace(activity, true)
                        : "Saved. " + choiceLabel(chosen, false, shownTimes) + " is used once Color scheme is switched on again in "
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

    /** The chooser's and the row's name of a choice; Auto (time) with its times ([window]). */
    static String choiceLabel(String chosen, boolean thai, int[] window) {
        if (DAY.equals(chosen)) return thai ? "กลางวัน" : "Day";
        if (NIGHT.equals(chosen)) return thai ? "กลางคืน" : "Night";
        if (TIME.equals(chosen)) {
            return thai ? "อัตโนมัติ (ตามเวลา) · กลางคืน " + span(window) : "Auto (time) · night " + span(window);
        }
        return thai ? "อัตโนมัติ (ตามไฟหน้า)" : "Auto (headlights)";
    }
}
