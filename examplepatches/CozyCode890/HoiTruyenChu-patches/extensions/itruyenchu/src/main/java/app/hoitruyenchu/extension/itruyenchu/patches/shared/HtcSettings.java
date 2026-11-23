package app.hoitruyenchu.extension.itruyenchu.patches.shared;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import com.facebook.react.bridge.ReadableArray;

import org.json.JSONObject;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * The settings of all patches, kept in the SharedPreferences file {@code htc_settings}.
 * <p>
 * Java code reads them directly; the JS scripts get them as {@code globalThis.__htcS}
 * (see {@link JsScripts}) and the {@link JsBridge#EVENT_SETTINGS} event after every change.
 * The scripts send commands back by writing the AsyncStorage key {@code htc_cmd}
 * ({@link #onStorageSet}).
 */
@SuppressWarnings("unused")
public final class HtcSettings {
    private static final String TAG = "HTC-Settings";
    private static final String PREFS = "htc_settings";
    private static final String KEY_COMMAND = "htc_cmd";

    // General
    public static final String DEBUG = "debug";
    // TTS reliability
    public static final String TTS_ENABLED = "tts.enabled";
    public static final String TTS_CALL = "tts.call";
    public static final String TTS_NOISY = "tts.noisy";
    public static final String TTS_RETRIES = "tts.retries";
    public static final String TTS_APPLY_SPEED = "tts.applySpeed";
    public static final String TTS_ENGINE = "tts.engine";
    public static final String TTS_VOICE = "tts.voice";
    // Background reading
    public static final String BG_ENABLED = "bg.enabled";
    public static final String BG_SLEEP_BUTTON = "bg.sleepButton";
    // Remember listening speed
    public static final String SPEED_ENABLED = "speed.enabled";
    public static final String SPEED_EXTRA_LEVELS = "speed.extraLevels";
    // TTS media controls
    public static final String MEDIA_ENABLED = "media.enabled";
    public static final String MEDIA_SKIP = "media.skip";
    // Resume listening position
    public static final String RESUME_ENABLED = "resume.enabled";
    public static final String RESUME_MODE = "resume.mode";
    // Tap a line to listen from it
    public static final String TAP_ENABLED = "tap.enabled";
    public static final String TAP_GESTURE = "tap.gesture";
    public static final String TAP_RETURN_BUTTON = "tap.returnButton";
    public static final String TAP_AUTO_RETURN = "tap.autoReturn";
    public static final String TAP_CLOSED_BAR = "tap.closedBar";
    // Show chapter titles
    public static final String TITLES_ENABLED = "titles.enabled";
    public static final String TITLES_WIFI_ONLY = "titles.wifiOnly";
    public static final String TITLES_SKIP_HEADER = "titles.skipHeader";
    // Auto sync reading history
    public static final String SYNC_ENABLED = "sync.enabled";
    public static final String SYNC_ON_START = "sync.onStart";
    public static final String SYNC_ON_LOGIN = "sync.onLogin";
    public static final String SYNC_ON_RESUME = "sync.onResume";
    public static final String SYNC_RECORD_FREE = "sync.recordFree";
    public static final String SYNC_TOASTS = "sync.toasts";

    /** Not a setting: result of the last Google login, shown in the menu (time in "login.statusAt"). */
    public static final String LOGIN_STATUS = "login.status";

    private static final Map<String, Object> DEFAULTS = new LinkedHashMap<>();

    static {
        DEFAULTS.put(DEBUG, true);
        DEFAULTS.put(TTS_ENABLED, true);
        DEFAULTS.put(TTS_CALL, "resume");
        DEFAULTS.put(TTS_NOISY, true);
        DEFAULTS.put(TTS_RETRIES, 2);
        DEFAULTS.put(TTS_APPLY_SPEED, true);
        DEFAULTS.put(TTS_ENGINE, "");
        DEFAULTS.put(TTS_VOICE, "");
        DEFAULTS.put(BG_ENABLED, true);
        DEFAULTS.put(BG_SLEEP_BUTTON, true);
        DEFAULTS.put(SPEED_ENABLED, true);
        DEFAULTS.put(SPEED_EXTRA_LEVELS, true);
        DEFAULTS.put(MEDIA_ENABLED, true);
        DEFAULTS.put(MEDIA_SKIP, "chapter");
        DEFAULTS.put(RESUME_ENABLED, true);
        DEFAULTS.put(RESUME_MODE, "highlight");
        DEFAULTS.put(TAP_ENABLED, true);
        DEFAULTS.put(TAP_GESTURE, "tap");
        DEFAULTS.put(TAP_RETURN_BUTTON, true);
        DEFAULTS.put(TAP_AUTO_RETURN, 0);
        DEFAULTS.put(TAP_CLOSED_BAR, "mark");
        DEFAULTS.put(TITLES_ENABLED, true);
        DEFAULTS.put(TITLES_WIFI_ONLY, false);
        DEFAULTS.put(TITLES_SKIP_HEADER, false);
        DEFAULTS.put(SYNC_ENABLED, true);
        DEFAULTS.put(SYNC_ON_START, true);
        DEFAULTS.put(SYNC_ON_LOGIN, true);
        DEFAULTS.put(SYNC_ON_RESUME, true);
        DEFAULTS.put(SYNC_RECORD_FREE, true);
        DEFAULTS.put(SYNC_TOASTS, "all");
    }

    /** Called after a change, on the thread that made it. */
    public interface Listener {
        void onSettingsChanged();
    }

    private static final List<Listener> listeners = new ArrayList<>();
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static SharedPreferences prefs;

    private HtcSettings() {
    }

    // ---------------------------------------------------------------------------------------------
    // Values

    private static synchronized SharedPreferences prefs() {
        if (prefs == null) {
            Context context = context();
            if (context == null) return null;
            prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        }
        return prefs;
    }

    public static Object defaultOf(String key) {
        return DEFAULTS.get(key);
    }

    public static boolean bool(String key) {
        Object d = DEFAULTS.get(key);
        boolean def = d instanceof Boolean && (Boolean) d;
        SharedPreferences p = prefs();
        try {
            return p == null ? def : p.getBoolean(key, def);
        } catch (ClassCastException e) {
            return def;
        }
    }

    public static int integer(String key) {
        Object d = DEFAULTS.get(key);
        int def = d instanceof Integer ? (Integer) d : 0;
        SharedPreferences p = prefs();
        try {
            return p == null ? def : p.getInt(key, def);
        } catch (ClassCastException e) {
            return def;
        }
    }

    public static String string(String key) {
        Object d = DEFAULTS.get(key);
        String def = d instanceof String ? (String) d : "";
        SharedPreferences p = prefs();
        try {
            String value = p == null ? def : p.getString(key, def);
            return value != null ? value : def;
        } catch (ClassCastException e) {
            return def;
        }
    }

    /** A sub-option of a patch: false when the patch's master switch is off. */
    public static boolean on(String master, String key) {
        return bool(master) && bool(key);
    }

    public static void put(String key, Object value) {
        SharedPreferences p = prefs();
        if (p == null) return;
        SharedPreferences.Editor editor = p.edit();
        putValue(editor, key, value);
        editor.apply();
        changed();
    }

    private static void putValue(SharedPreferences.Editor editor, String key, Object value) {
        if (value instanceof Boolean) editor.putBoolean(key, (Boolean) value);
        else if (value instanceof Integer) editor.putInt(key, (Integer) value);
        else if (value instanceof Number) editor.putInt(key, ((Number) value).intValue());
        else if (value != null) editor.putString(key, value.toString());
        else editor.remove(key);
    }

    /** Puts the defaults back for the keys starting with prefix ("" = all settings). */
    public static void reset(String prefix) {
        SharedPreferences p = prefs();
        if (p == null) return;
        SharedPreferences.Editor editor = p.edit();
        for (String key : DEFAULTS.keySet()) {
            if (key.startsWith(prefix)) editor.remove(key);
        }
        editor.apply();
        changed();
    }

    /** All settings with their current value (defaults included). */
    public static JSONObject toJson() {
        JSONObject json = new JSONObject();
        for (String key : DEFAULTS.keySet()) {
            try {
                Object d = DEFAULTS.get(key);
                if (d instanceof Boolean) json.put(key, bool(key));
                else if (d instanceof Integer) json.put(key, integer(key));
                else json.put(key, string(key));
            } catch (Throwable ignored) {
            }
        }
        try {
            // Which patches are in the app (for the scripts).
            json.put("applied.tts", HtcPatches.ttsReliability());
            json.put("applied.bg", HtcPatches.backgroundReading());
            json.put("applied.speed", HtcPatches.rememberSpeed());
            json.put("applied.media", HtcPatches.mediaControls());
            json.put("applied.resume", HtcPatches.resumeListening());
            json.put("applied.tap", HtcPatches.tapToSeek());
            json.put("applied.titles", HtcPatches.chapterTitles());
            json.put("applied.sync", HtcPatches.autoSync());
        } catch (Throwable ignored) {
        }
        return json;
    }

    /** Asks the scripts to set the voice bar speed (settings screen). @return false if the app is not running. */
    public static boolean sendSpeed(float speed) {
        try {
            JSONObject command = new JSONObject().put("cmd", "speed").put("value", (double) speed);
            return JsBridge.emit(JsBridge.EVENT_COMMAND, command.toString());
        } catch (Throwable t) {
            return false;
        }
    }

    /** Speed saved by the voice bar (AsyncStorage tts_voice_state, "spead" sic), or 1. */
    public static float savedSpeed() {
        try {
            String value = readStorage("tts_voice_state");
            if (value == null) return 1f;
            JSONObject state = new JSONObject(value).optJSONObject("state");
            if (state == null) return 1f;
            double speed = state.has("speed") ? state.optDouble("speed", 1) : state.optDouble("spead", 1);
            return speed > 0 ? (float) speed : 1f;
        } catch (Throwable t) {
            return 1f;
        }
    }

    /** Sets the settings found in json (an export). @return number of settings read. */
    public static int fromJson(JSONObject json) {
        SharedPreferences p = prefs();
        if (p == null || json == null) return 0;
        SharedPreferences.Editor editor = p.edit();
        int count = 0;
        for (Iterator<String> it = json.keys(); it.hasNext(); ) {
            String key = it.next();
            Object d = DEFAULTS.get(key);
            Object value = json.opt(key);
            if (d == null || value == null) continue;
            if (d instanceof Boolean && value instanceof Boolean) putValue(editor, key, value);
            else if (d instanceof Integer && value instanceof Number) putValue(editor, key, ((Number) value).intValue());
            else if (d instanceof String && value instanceof String) putValue(editor, key, value);
            else continue;
            count++;
        }
        editor.apply();
        changed();
        return count;
    }

    /** Status values that are not settings (login status). */
    public static void putStatus(String key, String value) {
        SharedPreferences p = prefs();
        if (p == null) return;
        p.edit().putString(key, value).putLong(key + "At", System.currentTimeMillis()).apply();
    }

    public static String status(String key) {
        SharedPreferences p = prefs();
        return p == null ? null : p.getString(key, null);
    }

    public static long statusTime(String key) {
        SharedPreferences p = prefs();
        try {
            return p == null ? 0 : p.getLong(key + "At", 0);
        } catch (ClassCastException e) {
            return 0;
        }
    }

    public static void addListener(Listener listener) {
        synchronized (listeners) {
            if (!listeners.contains(listener)) listeners.add(listener);
        }
    }

    private static void changed() {
        ArrayList<Listener> copy;
        synchronized (listeners) {
            copy = new ArrayList<>(listeners);
        }
        for (Listener l : copy) {
            try {
                l.onSettingsChanged();
            } catch (Throwable t) {
                Log.w(TAG, "listener failed", t);
            }
        }
        JsBridge.emit(JsBridge.EVENT_SETTINGS, toJson().toString());
    }

    // ---------------------------------------------------------------------------------------------
    // Hooks

    /** End of ReactInstance.loadJSBundle(loader): queue the settings script after the app bundle. */
    public static void afterMainBundle(Object reactInstance) {
        JsScripts.load(reactInstance, SettingsScript.FILE_NAME, SettingsScript.SCRIPT, TAG);
    }

    /** Start of AsyncStorageModule.multiSet: commands of the scripts ({"cmd": .., "t": ..}). */
    public static void onStorageSet(ReadableArray pairs) {
        try {
            if (pairs == null) return;
            for (int i = 0; i < pairs.size(); i++) {
                ReadableArray pair = pairs.getArray(i);
                if (pair == null || pair.size() < 2 || pair.isNull(0) || pair.isNull(1)) continue;
                if (!KEY_COMMAND.equals(pair.getString(0))) continue;
                final JSONObject command = new JSONObject(pair.getString(1));
                main.post(() -> runCommand(command));
            }
        } catch (Throwable t) {
            Log.w(TAG, "onStorageSet failed", t);
        }
    }

    private static void runCommand(JSONObject command) {
        String cmd = command.optString("cmd");
        try {
            switch (cmd) {
                case "open":
                    openSettings();
                    break;
                case "sleep":
                    app.hoitruyenchu.extension.itruyenchu.patches.tts.SleepTimer.cycle();
                    break;
                case "sleepState":
                    app.hoitruyenchu.extension.itruyenchu.patches.tts.SleepTimer.publish();
                    break;
                default:
                    Log.w(TAG, "unknown command " + cmd);
            }
        } catch (Throwable t) {
            Log.w(TAG, "command " + cmd + " failed", t);
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Helpers

    public static void openSettings() {
        Context context = context();
        if (context == null) return;
        Intent intent = new Intent();
        intent.setClassName(context, "app.hoitruyenchu.extension.itruyenchu.patches.settings.SettingsActivity");
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }

    public static void toast(final String text) {
        main.post(() -> {
            try {
                Context context = context();
                if (context != null) Toast.makeText(context, text, Toast.LENGTH_SHORT).show();
            } catch (Throwable ignored) {
            }
        });
    }

    @SuppressLint("PrivateApi")
    public static Context context() {
        try {
            return (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }

    /** Reads a key of the app's AsyncStorage (RKStorage / catalystLocalStorage). */
    public static String readStorage(String key) {
        Context context = context();
        if (context == null) return null;
        try {
            File file = context.getDatabasePath("RKStorage");
            if (!file.exists()) return null;
            SQLiteDatabase db = SQLiteDatabase.openDatabase(file.getPath(), null, SQLiteDatabase.OPEN_READONLY);
            try (Cursor cursor = db.rawQuery("SELECT value FROM catalystLocalStorage WHERE key = ?", new String[]{key})) {
                return cursor.moveToFirst() ? cursor.getString(0) : null;
            } finally {
                db.close();
            }
        } catch (Throwable t) {
            Log.w(TAG, "reading " + key + " failed: " + t);
            return null;
        }
    }
}
