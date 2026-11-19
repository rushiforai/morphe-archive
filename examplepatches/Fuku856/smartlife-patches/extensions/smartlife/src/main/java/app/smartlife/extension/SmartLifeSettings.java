package app.smartlife.extension;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

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
    static final String KEY_HIDE_SMART_APP_TAB = "hide_smart_app_tab";
    static final String KEY_HIDE_SCENE_RECOMMENDATIONS = "hide_scene_recommendations";

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

    /**
     * Toggle values read by patched app code, cached after the first successful read. These
     * getters sit on hot paths (the flag getter runs for every feature-flag read, and some of
     * them happen while lists bind/scroll), so SharedPreferences is not consulted every time.
     * Changes still take effect after an app restart, as the settings screen says.
     */
    private static final Map<String, Boolean> toggleCache = new ConcurrentHashMap<>();

    private static boolean cachedToggle(String key, boolean defaultValue) {
        Boolean cached = toggleCache.get(key);
        if (cached != null) return cached;
        boolean value = getBoolean(key, defaultValue);
        // Only cache a real read; a read before the context is captured returns the default.
        if (context() != null) toggleCache.put(key, value);
        return value;
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

    /**
     * Called from the patched AI-enabled check(s) and from {@link ConfigOverrides} for the AI
     * flags. Default: hidden.
     */
    public static boolean hideAiAssistant() {
        return cachedToggle(KEY_HIDE_AI, true);
    }

    /** Called from the patched home "おすすめ" (FindMore) card builder. Default: hidden. */
    public static boolean hideHomeRecommendations() {
        return cachedToggle(KEY_HIDE_HOME_RECOMMENDATIONS, true);
    }

    /** Smart tab: hide the "Smart App" (AI app builder) tab. Default: hidden. */
    public static boolean hideSmartAppTab() {
        return cachedToggle(KEY_HIDE_SMART_APP_TAB, true);
    }

    /**
     * Smart tab: hide the recommended scenes ("お勧め") under the automation / tap-to-run lists.
     * Called from the patched SceneRecommendServiceImpl factory. Default: hidden.
     */
    public static boolean hideSceneRecommendations() {
        return cachedToggle(KEY_HIDE_SCENE_RECOMMENDATIONS, true);
    }

    /**
     * Called just before the scene tab container returns its tab map (tab type -> tab config).
     * Removes the Smart App tab when the toggle is on. Returns a copy so an immutable map from
     * the app is never mutated; iteration order (the tab order) is kept.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static Map filterSceneTabs(Map tabs, int smartAppTabType) {
        try {
            if (tabs == null || !hideSmartAppTab()) return tabs;
            Integer key = smartAppTabType;
            if (!tabs.containsKey(key)) return tabs;
            Map copy = new LinkedHashMap(tabs);
            copy.remove(key);
            return copy;
        } catch (Throwable t) {
            return tabs;
        }
    }
}
