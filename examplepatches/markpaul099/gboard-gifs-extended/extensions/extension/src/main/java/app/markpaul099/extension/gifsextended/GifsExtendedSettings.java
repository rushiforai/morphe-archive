package app.markpaul099.extension.gifsextended;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.UserManager;

/**
 * Settings shown on the GIFs Extended screen.
 * <p>
 * Gboard runs before the device is first unlocked (Direct Boot), when its regular storage
 * is unavailable. Reads then return the defaults, and writes are skipped.
 */
public final class GifsExtendedSettings {
    private static final String PREF_FILE = "gifs_extended_settings";

    public static final String KEY_GOOGLE_IMAGES = "google_images_enabled";
    public static final String KEY_SAFE_SEARCH = "safe_search_enabled";
    public static final boolean DEFAULT_GOOGLE_IMAGES = true;
    public static final boolean DEFAULT_SAFE_SEARCH = true;

    private GifsExtendedSettings() {
    }

    public static boolean googleImages(Context context) {
        return read(context, KEY_GOOGLE_IMAGES, DEFAULT_GOOGLE_IMAGES);
    }

    public static boolean safeSearch(Context context) {
        return read(context, KEY_SAFE_SEARCH, DEFAULT_SAFE_SEARCH);
    }

    public static boolean setGoogleImages(Context context, boolean enabled) {
        return write(context, KEY_GOOGLE_IMAGES, enabled);
    }

    public static boolean setSafeSearch(Context context, boolean enabled) {
        return write(context, KEY_SAFE_SEARCH, enabled);
    }

    private static boolean read(Context context, String key, boolean defaultValue) {
        SharedPreferences preferences = preferencesOrNull(context);
        if (preferences == null) {
            return defaultValue;
        }
        try {
            return preferences.getBoolean(key, defaultValue);
        } catch (RuntimeException unavailable) {
            return defaultValue;
        }
    }

    private static boolean write(Context context, String key, boolean enabled) {
        SharedPreferences preferences = preferencesOrNull(context);
        if (preferences == null) {
            return false;
        }
        try {
            return preferences.edit().putBoolean(key, enabled).commit();
        } catch (RuntimeException unavailable) {
            return false;
        }
    }

    private static SharedPreferences preferencesOrNull(Context context) {
        if (context == null) {
            return null;
        }
        Context appContext = context.getApplicationContext() != null
                ? context.getApplicationContext() : context;
        UserManager userManager = appContext.getSystemService(UserManager.class);
        if (userManager != null && !userManager.isUserUnlocked()) {
            return null;
        }
        try {
            return appContext.getSharedPreferences(PREF_FILE, Context.MODE_PRIVATE);
        } catch (RuntimeException unavailable) {
            return null;
        }
    }
}
