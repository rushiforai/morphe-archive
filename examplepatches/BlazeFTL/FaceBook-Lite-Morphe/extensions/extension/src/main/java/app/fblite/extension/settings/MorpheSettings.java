package app.fblite.extension.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;

/**
 * Settings of the "Morphe settings" patch, stored in the app's own shared preferences.
 *
 * Facebook Lite reports the font scale of its application context to the server when it connects
 * (X.0JW), and the server lays the feed out for it. So the font size is changed by giving the
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
    public static final String ASK_DOWNLOAD_QUALITY = "ask_download_quality";
    public static final String DEBUG_LOG = "debug_log";
    public static final String REELS_HIDE_ADS = "reels_hide_ads";
    public static final String STORIES_HIDE_ADS = "stories_hide_ads";
    public static final String PROFILE_WHEN_NO_REELS = "profile_when_no_reels";
    public static final String SHORT_VIDEO_CONTROLS = "short_video_controls";
    public static final String PROFILE_ALWAYS = "profile_always";
    public static final String HIDE_OVER_COMMENTS = "hide_over_comments";
    public static final String DOUBLE_TAP_SEEK = "double_tap_seek";
    public static final String DEBUG_ADS = "debug_log_ads";
    public static final String DEBUG_VIEWS = "debug_log_views";
    public static final String DEBUG_PLAYER = "debug_log_player";
    public static final String DEBUG_VIDEO = "debug_log_video";
    public static final String DEBUG_STORIES = "debug_log_stories";
    public static final String DEBUG_APP = "debug_log_app";

    static final String[] SWITCHES = {
            VIDEO_DOWNLOAD, ASK_DOWNLOAD_QUALITY, AUTO_NEXT_REEL, SHORT_VIDEO_CONTROLS, DOUBLE_TAP_SEEK, HIDE_OVER_COMMENTS,
            REELS_HIDE_ADS, STORIES_HIDE_ADS, PROFILE_WHEN_NO_REELS, PROFILE_ALWAYS
    };

    private static volatile String patchVersion = "";

    private MorpheSettings() {
    }

    /** Called by the patch at the start of Application.attachBaseContext, with the version of the patches that made this app. */
    @SuppressWarnings("unused")
    public static void setPatchVersion(String version) {
        patchVersion = version == null ? "" : version;
    }

    /** Version of the patches, like "v1.6.11". Empty when unknown. */
    static String patchVersionLabel() {
        String version = patchVersion.trim();
        if (version.isEmpty()) return "";
        return version.startsWith("v") ? version : "v" + version;
    }

    static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    static int fontScalePercent(Context context) {
        int percent = preferences(context).getInt(FONT_SCALE_PERCENT, DEFAULT_PERCENT);
        return Math.max(MIN_PERCENT, Math.min(MAX_PERCENT, percent));
    }

    static boolean defaultValue(String key) {
        return VIDEO_DOWNLOAD.equals(key) || ASK_DOWNLOAD_QUALITY.equals(key) || STORIES_HIDE_ADS.equals(key) || REELS_HIDE_ADS.equals(key)
                || PROFILE_WHEN_NO_REELS.equals(key) || SHORT_VIDEO_CONTROLS.equals(key) || PROFILE_ALWAYS.equals(key)
                || HIDE_OVER_COMMENTS.equals(key) || key.startsWith("debug_log_");
    }

    public static boolean isEnabled(Context context, String key) {
        if (!PatchedFeatures.allowed(key)) return false;
        return preferences(context).getBoolean(key, defaultValue(key));
    }

    /** Called at the start of Application.attachBaseContext. Returns the base context to use. */
    @SuppressWarnings("unused")
    public static Context wrapBaseContext(Context base) {
        MorpheLog.init(base);
        Context result = base;
        try {
            int percent = fontScalePercent(base);
            if (percent != DEFAULT_PERCENT) {
                Configuration configuration = new Configuration(base.getResources().getConfiguration());
                configuration.fontScale = configuration.fontScale * percent / 100f;
                result = base.createConfigurationContext(configuration);
            }
        } catch (Throwable t) {
            // Never break app startup.
            result = base;
        }
        // Does nothing unless the app is a clone made by the "Clone install" patch.
        return app.fblite.extension.clone.CloneSupport.wrap(result);
    }
}
