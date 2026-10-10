package app.nogoogle.gboard;

import android.content.Context;
import android.content.SharedPreferences;

import app.nogoogle.gboard.extras.PortedFeatures;

import java.io.File;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;

/**
 * Runtime switches for every patch that can be toggled after install (mod menu).
 * Stored in device-protected storage because the keyboard runs before first unlock.
 */
@SuppressWarnings("unused")
public final class NoGoogleSettings {
    private static final String PREFS = "nogoogle_mod";

    public static final String BLOCK_SERVICES = "block_services";
    public static final String BLOCK_BROADCASTS = "block_broadcasts";
    public static final String BLOCK_ACTIVITIES = "block_activities";
    public static final String BLOCK_PROVIDERS = "block_providers";
    public static final String BLOCK_SYSTEM_AI = "block_system_ai";
    public static final String REPORT_GMS_MISSING = "report_gms_missing";
    public static final String DISABLE_ONLINE_FEATURES = "disable_online_features";
    public static final String HIDE_STICKER_TAB = "hide_sticker_tab";
    // One switch per GIF source ("gif_" + id, see GifBridge.SOURCES), off by default
    public static final String GIF_SOURCE_PREFIX = "gif_";
    public static final String GIF_KEY_KLIPY = "gif_key_klipy";
    public static final String GIF_KEY_GIPHY = "gif_key_giphy";
    // Keyboard: right-to-left languages change only the letters (KeyboardDirection)
    public static final String KEEP_LTR = "keep_ltr";
    public static final String VOICE_ENGINE = "voice_engine";          // "whisper" | "stock"
    public static final String VOICE_MODEL = "voice_model";            // "auto" | file name
    public static final String VOICE_THREADS = "voice_threads";
    public static final String VOICE_AUTO_STOP = "voice_auto_stop";
    public static final String TRANSLATE_ENGINE = "translate_engine";  // "llm" | "firefox" | "stock"

    private static volatile SharedPreferences prefs;
    private static final ArrayDeque<String> BLOCK_LOG = new ArrayDeque<>();

    private NoGoogleSettings() {
    }

    /** The application context (for code outside this package). */
    public static Context context() {
        return ContextHolder.get();
    }

    public static SharedPreferences prefs() {
        SharedPreferences p = prefs;
        if (p != null) return p;
        Context c = ContextHolder.get();
        if (c == null) return null;
        try {
            Context dp = c.createDeviceProtectedStorageContext();
            p = dp.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            prefs = p;
        } catch (Throwable ignored) {
        }
        return p;
    }

    public static boolean bool(String key) {
        SharedPreferences p = prefs();
        boolean def = defaultBool(key);
        try {
            return p == null ? def : p.getBoolean(key, def);
        } catch (Throwable t) {
            return def;
        }
    }

    public static String str(String key) {
        SharedPreferences p = prefs();
        String def = defaultStr(key);
        try {
            return p == null ? def : p.getString(key, def);
        } catch (Throwable t) {
            return def;
        }
    }

    public static int integer(String key) {
        try {
            return Integer.parseInt(str(key));
        } catch (Throwable t) {
            return Integer.parseInt(defaultStr(key));
        }
    }

    public static void put(String key, Object value) {
        SharedPreferences p = prefs();
        if (p == null) return;
        SharedPreferences.Editor e = p.edit();
        if (value instanceof Boolean) e.putBoolean(key, (Boolean) value);
        else e.putString(key, String.valueOf(value));
        e.apply();
    }

    static boolean defaultBool(String key) {
        // Every blocking / hiding switch defaults to on, GIF sources (network) to off, and the ported
        // Gboard-patches features as in Gboard-patches.
        if (key.startsWith(PortedFeatures.PREF_PREFIX)) return PortedFeatures.defaultOn(key);
        return !key.startsWith(GIF_SOURCE_PREFIX);
    }

    static String defaultStr(String key) {
        switch (key) {
            case VOICE_ENGINE:
                return "whisper";
            case VOICE_MODEL:
                return "auto";
            case VOICE_THREADS:
                return "4";
            case TRANSLATE_ENGINE:
                return "llm";
            default:
                return "";
        }
    }

    /** Folder the user fills with model files (no network access is ever used to fetch them). */
    public static File modelsDir() {
        Context c = ContextHolder.get();
        if (c == null) return null;
        File base = c.getExternalFilesDir(null);
        if (base == null) base = c.getFilesDir();
        File dir = new File(base, "models");
        //noinspection ResultOfMethodCallIgnored
        dir.mkdirs();
        return dir;
    }

    static void logBlocked(String entry) {
        synchronized (BLOCK_LOG) {
            if (BLOCK_LOG.size() >= 100) BLOCK_LOG.removeFirst();
            BLOCK_LOG.addLast(System.currentTimeMillis() + " " + entry);
        }
    }

    public static List<String> blockedLog() {
        synchronized (BLOCK_LOG) {
            return new ArrayList<>(BLOCK_LOG);
        }
    }
}
