package app.smartlife.extension;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;

/**
 * Runtime, in-app settings for the SmartLife patches, backed by SharedPreferences.
 *
 * The context is captured from {@link SignatureSpoof#attachBaseContext} by passing the
 * Application itself: during attachBaseContext, Context.getApplicationContext() is still null
 * (the framework has not registered the Application yet), so it must not be relied on.
 * As a fallback the settings screen also passes its Activity, and the current Application is
 * looked up through ActivityThread.
 */
@SuppressWarnings("unused")
public final class SmartLifeSettings {
    private static final String PREFS = "smartlife_patches";
    static final String KEY_HIDE_AI = "hide_ai_assistant";
    static final String KEY_HIDE_HOME_RECOMMENDATIONS = "hide_home_recommendations";

    private static Context appContext;

    private SmartLifeSettings() {}

    static void init(Context context) {
        if (context == null || appContext != null) return;
        Context application = context.getApplicationContext();
        appContext = application != null ? application : context;
    }

    private static Context context() {
        if (appContext == null) {
            try {
                Object app = Class.forName("android.app.ActivityThread")
                        .getMethod("currentApplication").invoke(null);
                if (app instanceof Application) {
                    appContext = (Application) app;
                }
            } catch (Throwable ignored) {
            }
        }
        return appContext;
    }

    private static SharedPreferences prefs() {
        Context context = context();
        if (context == null) return null;
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    static boolean getBoolean(String key, boolean defaultValue) {
        try {
            SharedPreferences p = prefs();
            return p == null ? defaultValue : p.getBoolean(key, defaultValue);
        } catch (Throwable t) {
            return defaultValue;
        }
    }

    static boolean setBoolean(String key, boolean value) {
        try {
            SharedPreferences p = prefs();
            // commit() so the value is on disk before the user restarts the app.
            return p != null && p.edit().putBoolean(key, value).commit();
        } catch (Throwable t) {
            return false;
        }
    }

    /** Called from the patched AI-enabled check (usk.c). Default: hidden. */
    public static boolean hideAiAssistant() {
        return getBoolean(KEY_HIDE_AI, true);
    }

    /** Called from the patched home "おすすめ" (FindMore) card builder. Default: hidden. */
    public static boolean hideHomeRecommendations() {
        return getBoolean(KEY_HIDE_HOME_RECOMMENDATIONS, true);
    }
}
