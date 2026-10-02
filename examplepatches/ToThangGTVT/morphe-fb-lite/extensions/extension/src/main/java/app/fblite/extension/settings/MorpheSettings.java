package app.fblite.extension.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;

/**
 * Settings of the "Morphe settings" patch, stored in the app's own shared preferences.
 *
 * Facebook Lite reports the font scale of its application context to the server when it connects
 * (X.0JR), and the server lays the feed out for it. So the font size is changed by giving the
 * application a base context with a scaled font scale, before the app reads it.
 */
public final class MorpheSettings {
    static final String PREFERENCES = "morphe_fblite_settings";
    static final String FONT_SCALE_PERCENT = "font_scale_percent";
    static final int MIN_PERCENT = 80;
    static final int MAX_PERCENT = 150;
    static final int STEP_PERCENT = 1;
    static final int DEFAULT_PERCENT = 100;

    /**
     * Switches read by other extensions straight from these preferences (by name, so the extensions do
     * not depend on each other). They apply without restarting the app.
     */
    public static final String VIDEO_DOWNLOAD = "video_download";
    public static final String AUTO_NEXT_REEL = "auto_next_reel";

    private MorpheSettings() {
    }

    static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    static int fontScalePercent(Context context) {
        int percent = preferences(context).getInt(FONT_SCALE_PERCENT, DEFAULT_PERCENT);
        return Math.max(MIN_PERCENT, Math.min(MAX_PERCENT, percent));
    }

    static boolean defaultValue(String key) {
        return VIDEO_DOWNLOAD.equals(key);
    }

    public static boolean isEnabled(Context context, String key) {
        return preferences(context).getBoolean(key, defaultValue(key));
    }

    /** Called at the start of Application.attachBaseContext. Returns the base context to use. */
    @SuppressWarnings("unused")
    public static Context wrapBaseContext(Context base) {
        try {
            int percent = fontScalePercent(base);
            if (percent == DEFAULT_PERCENT) return base;
            Configuration configuration = new Configuration(base.getResources().getConfiguration());
            configuration.fontScale = configuration.fontScale * percent / 100f;
            return base.createConfigurationContext(configuration);
        } catch (Throwable t) {
            // Never break app startup.
            return base;
        }
    }
}
