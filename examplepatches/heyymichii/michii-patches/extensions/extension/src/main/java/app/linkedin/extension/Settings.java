package app.linkedin.extension;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

/**
 * Feature switches, stored in the app's own SharedPreferences.
 *
 * The isXIncluded() methods return false here. Each feature patch rewrites its method to
 * return true, so the settings screen only lists features that were actually patched in.
 */
@SuppressWarnings("unused")
public final class Settings {
    static final String TAG = "LinkedInPatches";
    private static final String PREFS = "morphe_linkedin_settings";

    static final String HIDE_ADS = "hide_ads";
    static final String HIDE_PROMOTED_JOBS = "hide_promoted_jobs";
    static final String HIDE_SUGGESTED = "hide_suggested";
    static final String HIDE_PREMIUM = "hide_premium";
    static final String DOWNLOAD_MEDIA = "download_media";
    static final String FOCUS_MODE = "focus_mode";
    static final String HIDE_CELEBRATIONS = "hide_celebrations";
    static final String HIDE_FEED_JOBS = "hide_feed_jobs";
    static final String HIDE_REPOSTS = "hide_reposts";
    static final String HIDE_VIDEO_POSTS = "hide_video_posts";
    static final String HIDE_NEW_POSTS_PILL = "hide_new_posts_pill";
    static final String HIDE_TRANSLATION = "hide_translation";
    static final String OPEN_LINKS_DIRECTLY = "open_links_directly";
    static final String HIDE_SPONSORED_MESSAGES = "hide_sponsored_messages";
    static final String GHOST_MODE = "ghost_mode";
    static final String BLOCK_TRACKING = "block_tracking";
    static final String DISABLE_DOUBLE_TAP_LIKE = "disable_double_tap_like";
    static final String SANITIZE_SHARE_LINKS = "sanitize_share_links";
    static final String RESOLVE_SHORT_LINKS = "resolve_short_links";
    static final String LAST_SEEN_VERSION = "last_seen_version";
    static final String DOWNLOAD_BASE_DIR = "download_base_dir";
    static final String DOWNLOAD_FOLDER = "download_folder";
    static final String DOWNLOAD_SPLIT_BY_TYPE = "download_split_by_type";

    /** Public directories DownloadManager may write to without storage permission (Android 10+). */
    static final String[] DOWNLOAD_BASE_DIRS = {"Download", "Pictures", "Movies", "DCIM"};
    static final String DEFAULT_DOWNLOAD_FOLDER = "LinkedIn";
    static final String DEBUG_LOGGING = "debug_logging";

    private static SharedPreferences prefs;

    private Settings() {
    }

    public static boolean isHideAdsIncluded() {
        return false;
    }

    public static boolean isHidePromotedJobsIncluded() {
        return false;
    }

    public static boolean isHideSuggestedIncluded() {
        return false;
    }

    public static boolean isHidePremiumIncluded() {
        return false;
    }

    public static boolean isDownloadMediaIncluded() {
        return false;
    }

    public static boolean isFeedFiltersIncluded() {
        return false;
    }

    public static boolean isOpenLinksDirectlyIncluded() {
        return false;
    }

    /** Replaced at patch time with the version of the patch bundle (from its manifest). */
    public static String patchesVersion() {
        return "dev";
    }

    public static boolean isSanitizeShareLinksIncluded() {
        return false;
    }

    static boolean sanitizeShareLinks() {
        return isSanitizeShareLinksIncluded() && get(SANITIZE_SHARE_LINKS, true);
    }

    /** Part of "Open links directly". */
    static boolean resolveShortLinks() {
        return isOpenLinksDirectlyIncluded() && get(RESOLVE_SHORT_LINKS, true);
    }

    public static boolean isDisableDoubleTapLikeIncluded() {
        return false;
    }

    static boolean disableDoubleTapLike() {
        return isDisableDoubleTapLikeIncluded() && get(DISABLE_DOUBLE_TAP_LIKE, true);
    }

    // region Backup

    /** All Michii Patches preferences as JSON, for export. */
    static String exportJson() throws org.json.JSONException {
        org.json.JSONObject json = new org.json.JSONObject();
        SharedPreferences p = prefs();
        if (p == null) return "{}";
        for (java.util.Map.Entry<String, ?> entry : p.getAll().entrySet()) {
            if (LAST_SEEN_VERSION.equals(entry.getKey())) continue;
            json.put(entry.getKey(), entry.getValue());
        }
        return json.toString(2);
    }

    /** Imports booleans and strings from exported JSON. Returns the number of values imported. */
    static int importJson(String text) throws org.json.JSONException {
        org.json.JSONObject json = new org.json.JSONObject(text.trim());
        SharedPreferences p = prefs();
        if (p == null) return 0;
        SharedPreferences.Editor editor = p.edit();
        int count = 0;
        java.util.Iterator<String> keys = json.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            Object value = json.get(key);
            if (value instanceof Boolean) {
                editor.putBoolean(key, (Boolean) value);
                count++;
            } else if (value instanceof String) {
                editor.putString(key, (String) value);
                count++;
            }
        }
        editor.apply();
        return count;
    }

    /** Restores every setting to its default, keeping the "what's new" state. */
    static void resetAll() {
        SharedPreferences p = prefs();
        if (p == null) return;
        String lastSeen = p.getString(LAST_SEEN_VERSION, null);
        SharedPreferences.Editor editor = p.edit().clear();
        if (lastSeen != null) editor.putString(LAST_SEEN_VERSION, lastSeen);
        editor.apply();
    }

    // endregion

    public static boolean isBlockTrackingIncluded() {
        return false;
    }

    /** Off by default. */
    static boolean blockTracking() {
        return isBlockTrackingIncluded() && get(BLOCK_TRACKING, false);
    }

    public static boolean isMessagingIncluded() {
        return false;
    }

    static boolean hideSponsoredMessages() {
        return isMessagingIncluded() && get(HIDE_SPONSORED_MESSAGES, true);
    }

    /** Off by default: it also stops chats being marked as read on this device. */
    static boolean ghostMode() {
        return isMessagingIncluded() && get(GHOST_MODE, false);
    }

    static boolean openLinksDirectly() {
        return isOpenLinksDirectlyIncluded() && get(OPEN_LINKS_DIRECTLY, true);
    }

    // Feed filters remove normal content, so they are off until the user turns them on.

    static boolean focusMode() {
        return isFeedFiltersIncluded() && get(FOCUS_MODE, false);
    }

    static boolean hideCelebrations() {
        return isFeedFiltersIncluded() && get(HIDE_CELEBRATIONS, false);
    }

    static boolean hideFeedJobs() {
        return isFeedFiltersIncluded() && get(HIDE_FEED_JOBS, false);
    }

    static boolean hideReposts() {
        return isFeedFiltersIncluded() && get(HIDE_REPOSTS, false);
    }

    static boolean hideVideoPosts() {
        return isFeedFiltersIncluded() && get(HIDE_VIDEO_POSTS, false);
    }

    static boolean hideNewPostsPill() {
        return isFeedFiltersIncluded() && get(HIDE_NEW_POSTS_PILL, false);
    }

    static boolean hideTranslation() {
        return isFeedFiltersIncluded() && get(HIDE_TRANSLATION, false);
    }

    static boolean hideAds() {
        return isHideAdsIncluded() && get(HIDE_ADS, true);
    }

    static boolean hidePromotedJobs() {
        return isHidePromotedJobsIncluded() && get(HIDE_PROMOTED_JOBS, true);
    }

    static boolean hideSuggested() {
        return isHideSuggestedIncluded() && get(HIDE_SUGGESTED, true);
    }

    static boolean hidePremium() {
        return isHidePremiumIncluded() && get(HIDE_PREMIUM, true);
    }

    /** Called from HomeNavPanelTransformer.toPremiumViewData (the "Me" panel upsell card). */
    public static boolean hideNavPanelUpsell() {
        return hidePremium();
    }

    static boolean downloadMedia() {
        return isDownloadMediaIncluded() && get(DOWNLOAD_MEDIA, true);
    }

    static boolean debug() {
        return get(DEBUG_LOGGING, false);
    }

    static String downloadBaseDir() {
        String value = getString(DOWNLOAD_BASE_DIR, DOWNLOAD_BASE_DIRS[0]);
        for (String dir : DOWNLOAD_BASE_DIRS) if (dir.equals(value)) return dir;
        return DOWNLOAD_BASE_DIRS[0];
    }

    static String downloadFolder() {
        return sanitizeFolder(getString(DOWNLOAD_FOLDER, DEFAULT_DOWNLOAD_FOLDER));
    }

    static boolean downloadSplitByType() {
        return get(DOWNLOAD_SPLIT_BY_TYPE, false);
    }

    /** Relative subfolder: letters, digits, space, - _ . and '/' between parts. No "..", no leading '/'. */
    static String sanitizeFolder(String folder) {
        if (folder == null) return "";
        StringBuilder out = new StringBuilder();
        for (String part : folder.split("/")) {
            String clean = part.replaceAll("[^\\p{L}\\p{N} _.-]", "").trim();
            if (clean.isEmpty() || clean.equals(".") || clean.equals("..")) continue;
            if (out.length() > 0) out.append('/');
            out.append(clean);
        }
        return out.toString();
    }

    static String getString(String key, String def) {
        SharedPreferences p = prefs();
        return p == null ? def : p.getString(key, def);
    }

    static void setString(String key, String value) {
        SharedPreferences p = prefs();
        if (p != null) p.edit().putString(key, value).apply();
    }

    static boolean get(String key, boolean def) {
        SharedPreferences p = prefs();
        return p == null ? def : p.getBoolean(key, def);
    }

    static void set(String key, boolean value) {
        SharedPreferences p = prefs();
        if (p != null) p.edit().putBoolean(key, value).apply();
    }

    private static SharedPreferences prefs() {
        if (prefs == null) {
            Context context = app();
            if (context != null) prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        }
        return prefs;
    }

    /** The running Application, without needing a hook in Application.onCreate. */
    @SuppressLint({"PrivateApi", "DiscouragedPrivateApi"})
    static Application app() {
        try {
            return (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            Log.e(TAG, "currentApplication failed", t);
            return null;
        }
    }

    static void debugLog(String message) {
        if (debug()) Log.d(TAG, message);
    }
}
