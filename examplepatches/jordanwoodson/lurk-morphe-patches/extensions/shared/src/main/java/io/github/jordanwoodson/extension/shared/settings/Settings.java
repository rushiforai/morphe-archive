package io.github.jordanwoodson.extension.shared.settings;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.drawable.Icon;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;

import java.lang.reflect.Proxy;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import io.github.jordanwoodson.extension.shared.Logger;

/**
 * Runtime switches for the patches in a patched app. A patch that can be switched off asks
 * {@link #isEnabled(String)} before it changes anything. The switches are on the Lurk settings screen
 * ({@link SettingsActivity}); each keeps its patch-time default until it is changed there.
 *
 * <p>Lurk fails closed: a key no included patch registered is off, and when the registry can't be read
 * every key is. "Pause Lurk" turns every switch off from the next start, except the ones a patch marked to
 * keep (lockout protection such as Block update prompts), without changing what is stored. Lurk pauses
 * itself when the app crashes within a minute of starting three times in a row.
 */
@SuppressWarnings("unused")
public final class Settings {
    private static final String PREFERENCES = "lurk_settings";
    /** Lurk's own state, apart from the settings so exports and resets of settings never carry it. */
    private static final String STATE = "lurk_state";
    static final String PAUSED = "paused";
    static final String AUTO_PAUSED = "auto_paused";
    static final String CRASH_STREAK = "crash_streak";
    private static final String SHORTCUT_STAMP = "shortcut";
    /** Never changes: launchers keep pinned shortcuts by ID. */
    private static final String SHORTCUT_ID = "lurk_settings";
    /**
     * The link a patched app's JavaScript passes to React Native's Linking.openURL for its Lurk row (Kick's account
     * menu). Only the app's own openURL looks for it ({@link #openLink(String)}); no activity declares it.
     */
    static final String LINK = "lurk://settings";
    /** A crash this soon after the process started counts towards pausing Lurk. */
    static final long EARLY_CRASH_MS = 60_000;
    /** Early crashes in a row that pause Lurk. */
    static final int CRASHES_TO_PAUSE = 3;

    private static volatile Context context;
    private static volatile Registry registry;
    /** {@link #openAction(Class)}'s proxies, by the function interface they implement. */
    private static final Map<Class<?>, Object> OPEN_ACTIONS = new HashMap<>();
    private static volatile Class<?> kotlinFunction0;
    private static boolean initialized;

    /** Whether this process runs paused, read once: pausing applies from the next start. Null until read. */
    private static volatile Boolean pausedAtStart;
    /** The values the restart-flagged settings had when this process started, or null until taken. */
    private static volatile Map<String, String> startValues;

    private static final AtomicLong CHANGES = new AtomicLong();
    /** SharedPreferences keeps its listeners weakly, so this one lives here. */
    private static final SharedPreferences.OnSharedPreferenceChangeListener WATCHER = (preferences, key) -> {
        CHANGES.incrementAndGet();
        Logger.refresh();
    };
    private static volatile SharedPreferences watched;
    private static volatile SharedPreferences unwatchable;

    private Settings() {
    }

    /** Injection point: the start of the app's Application.onCreate(). Once per process. */
    public static void init(Context appContext) {
        synchronized (Settings.class) {
            if (appContext == null || initialized) return;
            initialized = true;
            context = appContext;
        }
        if (appContext instanceof Application) {
            ((Application) appContext).registerActivityLifecycleCallbacks(new ResumedActivityTracker());
        }
        // Watch for changes from here on, so Debug logging and cached lists follow the screen.
        changes();
        // What this process starts with: pause, and the settings that are read once.
        pausedNow();
        startValues();
        guardCrashes();
        new Thread(Settings::publishShortcut, "lurk-shortcut").start();
    }

    /**
     * Injection point. Whether the switch {@code key} is on. A key no included patch registered counts as
     * off, and so does every key when the registry can't be read: Lurk fails closed, so a broken registry
     * turns every patch off instead of turning default-off ones on. While Lurk is paused every switch is off
     * except the ones marked to keep.
     */
    public static boolean isEnabled(String key) {
        Registry.Entry entry = registry().get(key);
        if (entry == null) return false;
        if (!entry.keepWhenPaused && pausedNow()) return false;
        return storedBoolean(entry);
    }

    /**
     * Whether a patch registered {@code key}, so it was included. {@link #isEnabled(String)} already counts an
     * unregistered key as off; a choice or text reads as its stub value ("", or 0 as a number) without one.
     */
    public static boolean isRegistered(String key) {
        return registry().get(key) != null;
    }

    /** The application context, or null before the app has one. */
    public static Context appContext() {
        return context();
    }

    /** Whether the settings can be read yet (the app has a context), without looking for one. */
    public static boolean hasContext() {
        return context != null;
    }

    /**
     * A number that changes whenever a Lurk setting changes in this process, so code that turns settings into
     * something costly (patterns, lists) can keep the result until then. -1 when changes can't be watched
     * (no context yet, or preferences that take no listeners): read the settings every time.
     */
    public static long changes() {
        SharedPreferences preferences = preferences();
        if (preferences == null) return -1;
        if (watched != preferences) {
            synchronized (CHANGES) {
                if (watched != preferences) {
                    if (unwatchable == preferences) return -1;
                    try {
                        preferences.registerOnSharedPreferenceChangeListener(WATCHER);
                    } catch (RuntimeException e) {
                        unwatchable = preferences;
                        return -1;
                    }
                    CHANGES.incrementAndGet();
                    watched = preferences;
                }
            }
        }
        return CHANGES.get();
    }

    /** Injection point. The value picked for the choice {@code key} as a number, or 0 if it isn't one. */
    public static int getInt(String key) {
        try {
            return Integer.parseInt(getString(key));
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    /** The text typed for the text setting {@code key}, or its patch-time default (usually empty). Never null. */
    public static String getText(String key) {
        String text = getString(key);
        return text == null ? "" : text;
    }

    /**
     * Injection point. A {@code kotlin.jvm.functions.Function0} that opens the settings screen, for use as
     * a Compose onClick. Made through a proxy, since the extension doesn't compile against Kotlin.
     */
    public static Object openAction() {
        Class<?> function0 = kotlinFunction0;
        if (function0 == null) {
            try {
                kotlinFunction0 = function0 = Class.forName("kotlin.jvm.functions.Function0", false,
                        Settings.class.getClassLoader());
            } catch (ClassNotFoundException e) {
                throw new IllegalStateException("Lurk: no Kotlin Function0 in this app", e);
            }
        }
        return openAction(function0);
    }

    /**
     * Injection point. Like {@link #openAction()}, for an app whose R8 renamed Kotlin's Function0: an object of
     * {@code function0}, an interface whose one method is {@code invoke()}, that opens the settings screen.
     */
    public static synchronized Object openAction(Class<?> function0) {
        Object action = OPEN_ACTIONS.get(function0);
        if (action == null) {
            action = Proxy.newProxyInstance(function0.getClassLoader(), new Class<?>[]{function0},
                    (proxy, method, args) -> {
                        switch (method.getName()) {
                            case "invoke":
                                openScreen();
                                return null;
                            case "equals":
                                return proxy == args[0];
                            case "hashCode":
                                return System.identityHashCode(proxy);
                            default:
                                return "Lurk settings";
                        }
                    });
            OPEN_ACTIONS.put(function0, action);
        }
        return action;
    }

    /**
     * Injection point. Opens the settings screen over the app's resumed activity, in its task, or in a task of
     * its own when no activity is resumed. For a row the patches add to the app's own screens.
     */
    public static void openScreen() {
        Activity activity = ResumedActivityTracker.current();
        open(activity != null ? activity : context());
    }

    /**
     * Injection point, at the start of React Native's Linking.openURL. Whether {@code url} is Lurk's own link
     * ({@link #LINK}), which the patched JavaScript opens from the app's menu; if so the settings screen opens
     * and the app's openURL does nothing else.
     */
    public static boolean openLink(String url) {
        if (!LINK.equals(url)) return false;
        openScreen();
        return true;
    }

    /** The value of the choice or text {@code key}: as changed on the screen, its patch-time default, or "". */
    static String getString(String key) {
        Registry.Entry entry = registry().get(key);
        if (entry == null) return "";
        String fallback = entry.defaultValue;
        SharedPreferences preferences = preferences();
        if (preferences == null) return fallback;
        try {
            return preferences.getString(key, fallback);
        } catch (ClassCastException e) {
            return fallback;
        }
    }

    /** The switch's own value, as changed on the screen or its default, whether or not Lurk is paused. */
    static boolean storedBoolean(Registry.Entry entry) {
        boolean fallback = Boolean.parseBoolean(entry.defaultValue);
        SharedPreferences preferences = preferences();
        if (preferences == null) return fallback;
        try {
            return preferences.getBoolean(entry.key, fallback);
        } catch (ClassCastException e) {
            return fallback;
        }
    }

    /** The entry's value as text: "true"/"false" for a switch (whether or not Lurk is paused), else its value. */
    static String value(Registry.Entry entry) {
        return Registry.SWITCH.equals(entry.type) ? String.valueOf(storedBoolean(entry)) : getString(entry.key);
    }

    /** Every registered setting's value as text, in screen order. */
    static Map<String, String> values() {
        Map<String, String> values = new LinkedHashMap<>();
        for (Registry.Entry entry : registry().entries) values.put(entry.key, value(entry));
        return values;
    }

    static void putBoolean(String key, boolean value) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().putBoolean(key, value).apply();
        Logger.refresh();
    }

    static void putString(String key, String value) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().putString(key, value).apply();
        Logger.refresh();
    }

    /** Sets several values at once (key to "true"/"false" for a switch, the value otherwise). */
    static void putAll(Map<String, String> values) {
        SharedPreferences preferences = preferences();
        if (preferences == null) return;
        SharedPreferences.Editor editor = preferences.edit();
        Registry current = registry();
        for (Map.Entry<String, String> value : values.entrySet()) {
            Registry.Entry entry = current.get(value.getKey());
            if (entry == null) continue;
            if (Registry.SWITCH.equals(entry.type)) editor.putBoolean(entry.key, Boolean.parseBoolean(value.getValue()));
            else editor.putString(entry.key, value.getValue());
        }
        editor.apply();
        Logger.refresh();
    }

    /** Forgets every change made on the screen, so each setting is back to its patch-time default, and unpauses. */
    static void reset() {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().clear().apply();
        setPaused(false);
        Logger.refresh();
    }

    // ---------------------------------------------------------------------------------------------
    // Pause Lurk

    /** Whether this process runs with Lurk paused. Read once per process, when the settings can first be read. */
    static boolean pausedNow() {
        Boolean paused = pausedAtStart;
        if (paused != null) return paused;
        SharedPreferences state = state();
        // No context yet: not known, and not kept, so the first read with a context decides.
        if (state == null) return false;
        boolean value;
        try {
            value = state.getBoolean(PAUSED, false);
        } catch (RuntimeException e) {
            value = false;
        }
        pausedAtStart = value;
        return value;
    }

    /** Whether Lurk is set to be paused from the next start. */
    static boolean pauseRequested() {
        return stateBoolean(PAUSED);
    }

    /** Whether Lurk paused itself after early crashes (and hasn't been unpaused since). */
    static boolean autoPaused() {
        return stateBoolean(AUTO_PAUSED) && pauseRequested();
    }

    /** Pauses or unpauses Lurk from the next start. Either way, a pause Lurk made itself is forgotten. */
    static void setPaused(boolean paused) {
        SharedPreferences state = state();
        if (state == null) return;
        state.edit().putBoolean(PAUSED, paused).putBoolean(AUTO_PAUSED, false).putInt(CRASH_STREAK, 0).apply();
    }

    private static boolean stateBoolean(String key) {
        SharedPreferences state = state();
        if (state == null) return false;
        try {
            return state.getBoolean(key, false);
        } catch (RuntimeException e) {
            return false;
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Restart

    /** The restart-flagged settings' values as this process started with them (taken on first use). */
    private static Map<String, String> startValues() {
        Map<String, String> values = startValues;
        if (values != null) return values;
        if (preferences() == null) return Collections.emptyMap();
        values = new HashMap<>();
        for (Registry.Entry entry : registry().entries) {
            if (entry.restart) values.put(entry.key, value(entry));
        }
        startValues = values;
        return values;
    }

    /** Whether a setting that is only read at startup, or Pause Lurk, changed since this process started. */
    static boolean restartNeeded() {
        if (preferences() == null) return false;
        if (pauseRequested() != pausedNow()) return true;
        Registry current = registry();
        for (Map.Entry<String, String> start : startValues().entrySet()) {
            Registry.Entry entry = current.get(start.getKey());
            if (entry != null && !start.getValue().equals(value(entry))) return true;
        }
        return false;
    }

    /** Starts the app again from its launcher activity, for settings that are read once at startup. */
    static void restart(Activity activity) {
        Intent launch = activity.getPackageManager().getLaunchIntentForPackage(activity.getPackageName());
        if (launch == null || launch.getComponent() == null) return;
        // Changes are saved with apply(), which writes in the background; exit() doesn't wait for it.
        // A commit is queued behind those writes and returns once they're on disk.
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().commit();
        SharedPreferences state = state();
        if (state != null) state.edit().commit();
        activity.startActivity(Intent.makeRestartActivityTask(launch.getComponent()));
        Runtime.getRuntime().exit(0);
    }

    // ---------------------------------------------------------------------------------------------
    // Crash pause

    /**
     * Records crashes that end the process within {@link #EARLY_CRASH_MS} of its start, and passes them on
     * to the handler that was there before (the app's crash reporter, then Android's), so the app still
     * crashes as it would. A run that lasts that long ends the streak.
     */
    private static void guardCrashes() {
        Thread.UncaughtExceptionHandler previous = Thread.getDefaultUncaughtExceptionHandler();
        if (previous instanceof CrashGuard) return;
        Thread.setDefaultUncaughtExceptionHandler(new CrashGuard(previous));
        long left = EARLY_CRASH_MS - (SystemClock.elapsedRealtime() - processStart());
        new Handler(Looper.getMainLooper()).postDelayed(Settings::survivedStart, Math.max(0, left));
    }

    static long processStart() {
        return Process.getStartElapsedRealtime();
    }

    /** The app ran past the first minute: the next early crash starts a new count. */
    static void survivedStart() {
        SharedPreferences state = state();
        if (state == null) return;
        try {
            if (state.getInt(CRASH_STREAK, 0) != 0) state.edit().putInt(CRASH_STREAK, 0).apply();
        } catch (RuntimeException e) {
            Logger.d("settings: crash count: " + e);
        }
    }

    /** An uncaught exception is about to end the process: count it if it came early. */
    static void onCrash() {
        if (SystemClock.elapsedRealtime() - processStart() >= EARLY_CRASH_MS) return;
        // Already running without the patches: pausing again would change nothing.
        if (pausedNow()) return;
        SharedPreferences state = state();
        if (state == null) return;
        int streak = state.getInt(CRASH_STREAK, 0) + 1;
        SharedPreferences.Editor editor = state.edit();
        if (streak >= CRASHES_TO_PAUSE) {
            editor.putBoolean(PAUSED, true).putBoolean(AUTO_PAUSED, true).putInt(CRASH_STREAK, 0);
            Logger.w("Lurk paused itself: the app stopped " + streak + " times in a row within a minute of starting");
        } else {
            editor.putInt(CRASH_STREAK, streak);
        }
        // The process ends right after this handler: write now.
        editor.commit();
    }

    static final class CrashGuard implements Thread.UncaughtExceptionHandler {
        private final Thread.UncaughtExceptionHandler previous;

        CrashGuard(Thread.UncaughtExceptionHandler previous) {
            this.previous = previous;
        }

        @Override
        public void uncaughtException(Thread thread, Throwable failure) {
            try {
                onCrash();
            } catch (Throwable ignored) {
                // Never stand in the way of the crash itself.
            }
            if (previous != null) {
                previous.uncaughtException(thread, failure);
            } else {
                Process.killProcess(Process.myPid());
                System.exit(10);
            }
        }
    }

    // ---------------------------------------------------------------------------------------------

    static Registry registry() {
        Registry current = registry;
        if (current == null) {
            synchronized (Settings.class) {
                current = registry;
                if (current == null) registry = current = Registry.parse(registryJson());
            }
        }
        return current;
    }

    static void open(Context from) {
        if (from == null) return;
        Intent intent = new Intent(from, SettingsActivity.class);
        if (!(from instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        from.startActivity(intent);
    }

    private static SharedPreferences preferences() {
        Context current = context();
        return current == null ? null : current.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    private static SharedPreferences state() {
        Context current = context();
        return current == null ? null : current.getSharedPreferences(STATE, Context.MODE_PRIVATE);
    }

    private static Context context() {
        Context current = context;
        if (current == null) {
            // Before Application.onCreate(), for instance in a content provider.
            try {
                current = (Context) Class.forName("android.app.ActivityThread")
                        .getMethod("currentApplication").invoke(null);
                context = current;
            } catch (ReflectiveOperationException | RuntimeException e) {
                Logger.d("settings: no application context yet");
            }
        }
        return current;
    }

    /**
     * A launcher shortcut (long-press the app icon) to the settings screen, always with the same ID so pinned
     * copies keep working. Launchers show only the first few of an app's shortcuts, by rank, and an app that
     * posts conversation shortcuts (Twitch, one per whisper) pushes each new one to the top. So on Android 11
     * and newer the shortcut is pushed to the top again on every start, which also updates it; on older
     * versions, where the apps don't push, it is added once and updated once per app or Lurk version, or when
     * its label changed, so it never keeps an old label or icon.
     */
    private static void publishShortcut() {
        Context current = context;
        if (current == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.N_MR1) return;
        try {
            ShortcutManager manager = current.getSystemService(ShortcutManager.class);
            if (manager == null) return;
            Registry registry = registry();
            String shortLabel = registry.name;
            String longLabel = registry.name + " settings";
            Intent intent = new Intent(Intent.ACTION_VIEW).setClassName(current, SettingsActivity.class.getName());
            ShortcutInfo shortcut = new ShortcutInfo.Builder(current, SHORTCUT_ID)
                    .setShortLabel(shortLabel)
                    .setLongLabel(longLabel)
                    .setIcon(Icon.createWithResource(current, current.getApplicationInfo().icon))
                    .setIntent(intent)
                    .setRank(0)
                    .build();
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                // Not rate-limited, unlike add and update: rank 0, the app's other shortcuts move down one.
                manager.pushDynamicShortcut(shortcut);
                return;
            }
            ShortcutInfo existing = null;
            for (ShortcutInfo published : manager.getDynamicShortcuts()) {
                if (SHORTCUT_ID.equals(published.getId())) existing = published;
            }
            if (existing == null) {
                manager.addDynamicShortcuts(Collections.singletonList(shortcut));
                rememberShortcut(current, registry);
                return;
            }
            boolean sameLabels = shortLabel.contentEquals(String.valueOf(existing.getShortLabel()))
                    && longLabel.contentEquals(String.valueOf(existing.getLongLabel()));
            if (!sameLabels || !shortcutStamp(current, registry).equals(state().getString(SHORTCUT_STAMP, ""))) {
                manager.updateShortcuts(Collections.singletonList(shortcut));
                rememberShortcut(current, registry);
            }
        } catch (RuntimeException e) {
            Logger.w("settings: no launcher shortcut: " + e);
        }
    }

    private static void rememberShortcut(Context current, Registry registry) {
        SharedPreferences state = state();
        if (state != null) state.edit().putString(SHORTCUT_STAMP, shortcutStamp(current, registry)).apply();
    }

    /** What the shortcut was made for: the app's version and Lurk's. */
    private static String shortcutStamp(Context current, Registry registry) {
        return appVersion(current) + "/" + registry.version;
    }

    /** The patched app's version name, or "" when it can't be read. */
    static String appVersion(Context current) {
        try {
            String name = current.getPackageManager().getPackageInfo(current.getPackageName(), 0).versionName;
            return name == null ? "" : name;
        } catch (Exception e) {
            return "";
        }
    }

    /** Replaced at patch time with the settings the included patches registered, as JSON. */
    private static String registryJson() {
        return null;
    }
}
