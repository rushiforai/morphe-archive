package app.twrailway.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Runtime settings of the patches, stored in the app's own SharedPreferences file
 * {@value #PREFERENCES_NAME}. Every hook reads its setting here, so a patch can be turned off
 * or adjusted from the patch settings page without patching the app again.
 */
@SuppressWarnings("unused")
public final class PatchSettings {
    static final String TAG = "TWRailwayPatches";
    static final String PREFERENCES_NAME = "twrailway_patches";

    // Keys of the patches, also used as the keys of their on/off settings.
    public static final String HIDE_ADS = "hide_ads";
    public static final String HIDE_REVIEW_PROMPT = "hide_review_prompt";
    public static final String FIX_RECENT_APPS_TITLE = "fix_recent_apps_title";
    public static final String EXPAND_SEARCH_HISTORY = "expand_search_history";
    public static final String HIDE_UPGRADE_BUTTON = "hide_upgrade_button";
    public static final String HIDE_PROMOTIONS = "hide_promotions";
    public static final String FIX_SEARCH_HISTORY_COUNT = "fix_search_history_count";

    static final String SEARCH_HISTORY_LIMIT = "search_history_limit";
    /** The search history keeps at most 20 searches, so more cannot be shown. */
    static final int SEARCH_HISTORY_MAX = 20;
    static final int SEARCH_HISTORY_MIN = 1;

    private static volatile Context context;
    private static volatile Set<String> appliedPatches;

    private PatchSettings() {
    }

    /** Called when the Flutter engine is initialized, before any hook needs a setting. */
    public static void init(Context context) {
        if (context == null || PatchSettings.context != null) return;
        PatchSettings.context = context.getApplicationContext();
        try {
            PatchSettingsEntry.init(PatchSettings.context);
        } catch (Throwable t) {
            Log.e(TAG, "Could not set up the patch settings entry", t);
        }
    }

    static Context context() {
        return context;
    }

    private static SharedPreferences preferences() {
        Context context = PatchSettings.context;
        if (context == null) return null;
        return context.getSharedPreferences(PREFERENCES_NAME, Context.MODE_PRIVATE);
    }

    static SharedPreferences preferences(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFERENCES_NAME, Context.MODE_PRIVATE);
    }

    private static boolean isEnabled(String key) {
        try {
            SharedPreferences preferences = preferences();
            return preferences == null || preferences.getBoolean(key, true);
        } catch (Throwable t) {
            Log.e(TAG, "Could not read " + key, t);
            return true;
        }
    }

    public static boolean hideAds() {
        return isEnabled(HIDE_ADS);
    }

    public static boolean hideReviewPrompt() {
        return isEnabled(HIDE_REVIEW_PROMPT);
    }

    public static boolean fixRecentAppsTitle() {
        return isEnabled(FIX_RECENT_APPS_TITLE);
    }

    public static boolean hidePromotions() {
        return isEnabled(HIDE_PROMOTIONS);
    }

    static boolean expandSearchHistory(Context context) {
        return preferences(context).getBoolean(EXPAND_SEARCH_HISTORY, true);
    }

    static boolean hideReviewPrompt(Context context) {
        return preferences(context).getBoolean(HIDE_REVIEW_PROMPT, true);
    }

    static boolean hideUpgradeButton(Context context) {
        return preferences(context).getBoolean(HIDE_UPGRADE_BUTTON, true);
    }

    /**
     * For the home screen widgets: their provider can run in a process started only to update
     * them, where the Flutter engine (and so {@link #init(Context)}) never runs.
     */
    static boolean hidePromotions(Context context) {
        return preferences(context).getBoolean(HIDE_PROMOTIONS, true);
    }

    static boolean fixSearchHistoryCount(Context context) {
        return preferences(context).getBoolean(FIX_SEARCH_HISTORY_COUNT, true);
    }

    static int searchHistoryLimit(Context context) {
        int limit = preferences(context).getInt(SEARCH_HISTORY_LIMIT, SEARCH_HISTORY_MAX);
        return Math.max(SEARCH_HISTORY_MIN, Math.min(SEARCH_HISTORY_MAX, limit));
    }

    /** The patches that were applied to this app, so the settings page only shows those. */
    static synchronized Set<String> appliedPatches() {
        if (appliedPatches == null) {
            appliedPatches = new LinkedHashSet<>();
            registerAppliedPatches();
        }
        return appliedPatches;
    }

    /**
     * Each patch inserts a call to {@link #markApplied(String)} with its key at the start of this
     * method.
     */
    public static void registerAppliedPatches() {
        markApplied(null);
    }

    public static void markApplied(String key) {
        if (key != null) appliedPatches.add(key);
    }
}
