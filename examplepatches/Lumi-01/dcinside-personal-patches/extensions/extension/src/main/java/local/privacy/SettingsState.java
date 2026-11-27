package local.privacy;

import android.content.Context;
import android.content.SharedPreferences;

/** Read frequently used options from one published in-memory snapshot. */
public final class SettingsState {
    private static final String[] KEYS = {
        "hide_home_search", "hide_home_recent", "hide_home_recommended_galleries",
        "hide_home_ranking", "hide_home_live_best", "hide_home_recommended_posts",
        "hide_page_indicator", "hide_author_auto_image", "show_author_id", "show_ip_info",
        "collapse_long_ip_info", "block_naver_web_tracking", "block_web_ad_requests",
        "reduce_config_refresh", "disable_update_notice", "block_app_ad_loaders"
    };
    private static final int DEFAULTS = (1 << 10) | (1 << 11) | (1 << 12) | (1 << 15);
    private static volatile int enabled;
    private static volatile int supportedFeatures;
    private static volatile SharedPreferences preferences;
    private static volatile Context applicationContext;
    // SharedPreferences holds weak listener references: keep this one for process lifetime.
    private static final SharedPreferences.OnSharedPreferenceChangeListener LISTENER =
            (prefs, key) -> reload(prefs);

    private SettingsState() { }

    public static synchronized void init(Context context) {
        if (preferences != null || context == null) return;
        applicationContext = context.getApplicationContext();
        SharedPreferences prefs = applicationContext
                .getSharedPreferences("lumi_morphe_settings", Context.MODE_PRIVATE);
        prefs.registerOnSharedPreferenceChangeListener(LISTENER);
        reload(prefs);
        preferences = prefs;
    }

    private static synchronized void reload(SharedPreferences prefs) {
        int snapshot = 0;
        for (int i = 0; i < KEYS.length; i++) {
            int bit = 1 << i;
            if (prefs.getBoolean(KEYS[i], (DEFAULTS & bit) != 0)) snapshot |= bit;
        }
        enabled = snapshot;
    }

    private static int bit(String key) {
        if (key == null) return 0;
        switch (key) {
            case "hide_home_search": return 1;
            case "hide_home_recent": return 1 << 1;
            case "hide_home_recommended_galleries": return 1 << 2;
            case "hide_home_ranking": return 1 << 3;
            case "hide_home_live_best": return 1 << 4;
            case "hide_home_recommended_posts": return 1 << 5;
            case "hide_page_indicator": return 1 << 6;
            case "hide_author_auto_image": return 1 << 7;
            case "show_author_id": return 1 << 8;
            case "show_ip_info": return 1 << 9;
            case "collapse_long_ip_info": return 1 << 10;
            case "block_naver_web_tracking": return 1 << 11;
            case "block_web_ad_requests": return 1 << 12;
            case "reduce_config_refresh": return 1 << 13;
            case "disable_update_notice": return 1 << 14;
            case "block_app_ad_loaders": return 1 << 15;
            default: return 0;
        }
    }

    public static Context context() { return applicationContext; }

    /** Called from only the patch adapters that are present in this APK. */
    public static void addSupportedFeatures(int features) {
        supportedFeatures |= features;
    }

    public static boolean supports(int feature) {
        return (supportedFeatures & feature) != 0;
    }

    public static boolean get(String key) {
        int mask = bit(key);
        if (mask != 0) return (enabled & mask) != 0;
        SharedPreferences prefs = preferences;
        return prefs != null && prefs.getBoolean(key, false);
    }

    public static synchronized void set(String key, boolean value) {
        SharedPreferences prefs = preferences;
        if (prefs == null) return;
        prefs.edit().putBoolean(key, value).apply();
        // Publish before returning even if Android dispatches the listener later.
        int mask = bit(key);
        enabled = value ? enabled | mask : enabled & ~mask;
    }

    public static int homeMask() { return enabled & 63; }
}
