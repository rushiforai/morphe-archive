/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

/**
 * Every switch Loki Patches owns, read from and written to one private preference file.
 *
 * The {@code is…Included()} answers start out as {@code false}. Each patch that gets applied flips the
 * one it owns to {@code true} while LinkedIn is being patched, so at runtime these methods say which
 * features this particular install actually has. The settings screen asks them before it lists a row,
 * and the feature's own reader (e.g. {@link #keepFeed()}) combines the answer with the user's choice.
 */
@SuppressWarnings("unused")
public final class Settings {
    static final String TAG = "LinkedInPatches";

    /** The one preference file; renaming it would orphan every setting users already have. */
    private static final String PREFS = "morphe_linkedin_settings";

    // Stored keys. These strings are on disk in users' installs: never rename or retype them.
    static final String HIDE_ADS = "hide_ads";
    static final String HIDE_PROMOTED_JOBS = "hide_promoted_jobs";
    static final String HIDE_SUGGESTED = "hide_suggested";
    static final String HIDE_PREMIUM = "hide_premium";
    static final String DOWNLOAD_MEDIA = "download_media";
    static final String DOWNLOAD_BASE_DIR = "download_base_dir";
    static final String DOWNLOAD_FOLDER = "download_folder";
    static final String DOWNLOAD_SPLIT_BY_TYPE = "download_split_by_type";
    static final String FOCUS_MODE = "focus_mode";
    static final String HIDE_CELEBRATIONS = "hide_celebrations";
    static final String HIDE_FEED_JOBS = "hide_feed_jobs";
    static final String HIDE_REPOSTS = "hide_reposts";
    static final String HIDE_ACTIVITY_POSTS = "hide_activity_posts";
    static final String HIDE_RECOMMENDATIONS = "hide_recommendations";
    static final String HIDE_VIDEO_POSTS = "hide_video_posts";
    static final String HIDE_GAMES = "hide_games";
    static final String HIDE_NEW_POSTS_PILL = "hide_new_posts_pill";
    static final String HIDE_TRANSLATION = "hide_translation";
    static final String HIDE_AI = "hide_ai";
    static final String MUTED_WORDS = "muted_words";
    static final String KEEP_FEED = "keep_feed";
    static final String POST_MENU = "post_menu";
    static final String VIEWER_TAP_TO_HIDE = "viewer_tap_to_hide";
    static final String SWIPE_FEEDS = "swipe_feeds";
    static final String HIDE_TAB_NETWORK = "hide_tab_network";
    static final String HIDE_TAB_JOBS = "hide_tab_jobs";
    static final String COPY_TEXT = "copy_text";
    static final String COPY_TEXT_LONG_SHEET = "copy_text_long_sheet";
    static final String DISABLE_DOUBLE_TAP_LIKE = "disable_double_tap_like";
    static final String REMOVE_GAPS_AND_DIVIDERS = "remove_gaps_and_dividers";
    static final String MATERIAL_YOU = "material_you";
    static final String AMOLED_BLACK = "amoled_black";
    static final String ANONYMOUS_PROFILE_VIEWING = "anonymous_profile_viewing";
    static final String OPEN_LINKS_DIRECTLY = "open_links_directly";
    static final String RESOLVE_SHORT_LINKS = "resolve_short_links";
    static final String SANITIZE_SHARE_LINKS = "sanitize_share_links";
    static final String BLOCK_TRACKING = "block_tracking";
    static final String HIDE_SPONSORED_MESSAGES = "hide_sponsored_messages";
    static final String GHOST_MODE = "ghost_mode";
    static final String DEBUG_LOGGING = "debug_logging";
    static final String LANGUAGE = "language";
    static final String LAST_SEEN_VERSION = "last_seen_version";

    /**
     * Root folders the DownloadManager can write to without a storage permission on Android 10 and up, in the
     * order the picker shows them.
     */
    static final String[] DOWNLOAD_BASE_DIRS = {"Download", "Pictures", "Movies", "DCIM"};
    static final String DEFAULT_DOWNLOAD_FOLDER = "LinkedIn";

    private static SharedPreferences prefs;

    private Settings() {
    }

    // region What this install was patched with

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

    public static boolean isSanitizeShareLinksIncluded() {
        return false;
    }

    public static boolean isCopyTextIncluded() {
        return false;
    }

    public static boolean isDisableDoubleTapLikeIncluded() {
        return false;
    }

    public static boolean isRemoveGapsAndDividersIncluded() {
        return false;
    }

    public static boolean isMaterialYouIncluded() {
        return false;
    }

    public static boolean isGmsCoreSupportIncluded() {
        return false;
    }

    public static boolean isBlockTrackingIncluded() {
        return false;
    }

    public static boolean isMessagingIncluded() {
        return false;
    }

    public static boolean isHideTabsIncluded() {
        return false;
    }

    public static boolean isSwipeFeedsIncluded() {
        return false;
    }

    public static boolean isViewerTapToHideIncluded() {
        return false;
    }

    public static boolean isPostMenuIncluded() {
        return false;
    }

    public static boolean isKeepFeedIncluded() {
        return false;
    }

    public static boolean isAnonymousProfileViewingIncluded() {
        return false;
    }

    /**
     * Overwritten while patching with the version of the bundle that did it; {@code dev} only shows for an
     * unpacked build.
     */
    public static String patchesVersion() {
        return "dev";
    }

    // endregion

    // region Ads and promotions

    static boolean hideAds() {
        return includedAnd(isHideAdsIncluded(), HIDE_ADS, true);
    }

    static boolean hidePromotedJobs() {
        return includedAnd(isHidePromotedJobsIncluded(), HIDE_PROMOTED_JOBS, true);
    }

    static boolean hideSuggested() {
        return includedAnd(isHideSuggestedIncluded(), HIDE_SUGGESTED, true);
    }

    static boolean hidePremium() {
        return includedAnd(isHidePremiumIncluded(), HIDE_PREMIUM, true);
    }

    /**
     * Me-panel hook: runs when the panel's Premium upsell slot has been built.
     *
     * @return the slot unchanged, or {@code null} to leave the upsell out of the panel.
     */
    public static Object navPanelUpsellSlot(Object slot) {
        return hidePremium() ? null : slot;
    }

    // endregion

    // region Feed

    static boolean disableDoubleTapLike() {
        return includedAnd(isDisableDoubleTapLikeIncluded(), DISABLE_DOUBLE_TAP_LIKE, true);
    }

    static boolean copyText() {
        return includedAnd(isCopyTextIncluded(), COPY_TEXT, true);
    }

    /** Long posts with Copy text included open in a sheet instead of being selected right in the feed. */
    static boolean copyTextLongInSheet() {
        return get(COPY_TEXT_LONG_SHEET, true);
    }

    /** Copy text, Download and Save as PDF in the ⋯ menu of posts. */
    static boolean postMenu() {
        return includedAnd(isPostMenuIncluded(), POST_MENU, true);
    }

    /** Swipe the home feed left and right to move between For you and Network. */
    static boolean swipeFeeds() {
        return includedAnd(isSwipeFeedsIncluded(), SWIPE_FEEDS, true);
    }

    static boolean viewerTapToHide() {
        return includedAnd(isViewerTapToHideIncluded(), VIEWER_TAP_TO_HIDE, true);
    }

    static boolean keepFeed() {
        return includedAnd(isKeepFeedIncluded(), KEEP_FEED, true);
    }

    /** Takes My Network out of the bottom bar. */
    static boolean hideTabNetwork() {
        return includedAnd(isHideTabsIncluded(), HIDE_TAB_NETWORK, false);
    }

    /** Takes Jobs out of the bottom bar. */
    static boolean hideTabJobs() {
        return includedAnd(isHideTabsIncluded(), HIDE_TAB_JOBS, false);
    }

    // Feed filters drop ordinary content, so every one of them waits for the user to switch it on.

    static boolean focusMode() {
        return includedAnd(isFeedFiltersIncluded(), FOCUS_MODE, false);
    }

    static boolean hideCelebrations() {
        return includedAnd(isFeedFiltersIncluded(), HIDE_CELEBRATIONS, false);
    }

    static boolean hideFeedJobs() {
        return includedAnd(isFeedFiltersIncluded(), HIDE_FEED_JOBS, false);
    }

    static boolean hideReposts() {
        return includedAnd(isFeedFiltersIncluded(), HIDE_REPOSTS, false);
    }

    static boolean hideActivityPosts() {
        return includedAnd(isFeedFiltersIncluded(), HIDE_ACTIVITY_POSTS, false);
    }

    static boolean hideRecommendations() {
        return includedAnd(isFeedFiltersIncluded(), HIDE_RECOMMENDATIONS, false);
    }

    static boolean hideVideoPosts() {
        return includedAnd(isFeedFiltersIncluded(), HIDE_VIDEO_POSTS, false);
    }

    static boolean hideGames() {
        return includedAnd(isFeedFiltersIncluded(), HIDE_GAMES, false);
    }

    static boolean hideNewPostsPill() {
        return includedAnd(isFeedFiltersIncluded(), HIDE_NEW_POSTS_PILL, false);
    }

    static boolean hideTranslation() {
        return includedAnd(isFeedFiltersIncluded(), HIDE_TRANSLATION, false);
    }

    static boolean hideAi() {
        return includedAnd(isFeedFiltersIncluded(), HIDE_AI, false);
    }

    /** The user's filter list, one word or phrase per line; empty when the patch is absent. */
    static String mutedWords() {
        return isFeedFiltersIncluded() ? getString(MUTED_WORDS, "") : "";
    }

    static void setMutedWords(String words) {
        setString(MUTED_WORDS, words);
    }

    // endregion

    // region Appearance
    //
    // The themes read these once while the app starts, so a change lands on the next launch.

    static boolean removeGapsAndDividers() {
        return includedAnd(isRemoveGapsAndDividersIncluded(), REMOVE_GAPS_AND_DIVIDERS, true);
    }

    static boolean materialYou() {
        return includedAnd(isMaterialYouIncluded(), MATERIAL_YOU, true);
    }

    /** Pure black instead of the tinted dark surfaces; drawn through the Material You color hooks. */
    static boolean amoledBlack() {
        return includedAnd(isMaterialYouIncluded(), AMOLED_BLACK, false);
    }

    // endregion

    // region Chat

    static boolean hideSponsoredMessages() {
        return includedAnd(isMessagingIncluded(), HIDE_SPONSORED_MESSAGES, true);
    }

    /** Off by default: it also stops chats from being marked read on this device. */
    static boolean ghostMode() {
        return includedAnd(isMessagingIncluded(), GHOST_MODE, false);
    }

    // endregion

    // region Privacy

    static boolean openLinksDirectly() {
        return includedAnd(isOpenLinksDirectlyIncluded(), OPEN_LINKS_DIRECTLY, true);
    }

    /** Part of "Open links directly". */
    static boolean resolveShortLinks() {
        return includedAnd(isOpenLinksDirectlyIncluded(), RESOLVE_SHORT_LINKS, true);
    }

    static boolean sanitizeShareLinks() {
        return includedAnd(isSanitizeShareLinksIncluded(), SANITIZE_SHARE_LINKS, true);
    }

    static boolean anonymousProfileViewing() {
        return includedAnd(isAnonymousProfileViewingIncluded(), ANONYMOUS_PROFILE_VIEWING, false);
    }

    /** Off by default; it is the blunt option, so a user has to ask for it. */
    static boolean blockTracking() {
        return includedAnd(isBlockTrackingIncluded(), BLOCK_TRACKING, false);
    }

    // endregion

    // region Downloads

    static boolean downloadMedia() {
        return includedAnd(isDownloadMediaIncluded(), DOWNLOAD_MEDIA, true);
    }

    /** One of {@link #DOWNLOAD_BASE_DIRS}; anything else stored falls back to the first entry. */
    static String downloadBaseDir() {
        int found = java.util.Arrays.asList(DOWNLOAD_BASE_DIRS).indexOf(getString(DOWNLOAD_BASE_DIR, DOWNLOAD_BASE_DIRS[0]));
        return DOWNLOAD_BASE_DIRS[Math.max(found, 0)];
    }

    /** The cleaned-up subfolder under the base directory, possibly empty. */
    static String downloadFolder() {
        return sanitizeFolder(getString(DOWNLOAD_FOLDER, DEFAULT_DOWNLOAD_FOLDER));
    }

    static boolean downloadSplitByType() {
        return get(DOWNLOAD_SPLIT_BY_TYPE, false);
    }

    /**
     * Makes a user-typed subfolder safe to hand to the DownloadManager: keeps letters, digits, spaces,
     * {@code - _ .} and single {@code /} separators, drops empty, "." and ".." parts, and never keeps a
     * leading separator.
     */
    static String sanitizeFolder(String folder) {
        if (folder == null) return "";
        StringBuilder kept = new StringBuilder();
        for (String part : folder.split("/")) {
            String name = part.replaceAll("[^\\p{L}\\p{N} _.-]", "").trim();
            if (name.isEmpty() || name.equals(".") || name.equals("..")) continue;
            if (kept.length() > 0) kept.append('/');
            kept.append(name);
        }
        return kept.toString();
    }

    // endregion

    // region Backup

    /**
     * Snapshot of the preferences as indented JSON, ready for the clipboard. The last-seen version stays out:
     * it belongs to this install's "What's new" state, not to the user's choices.
     *
     * @throws org.json.JSONException only if a stored value has a type JSON cannot hold.
     */
    static String exportJson() throws org.json.JSONException {
        SharedPreferences source = prefs();
        if (source == null) return "{}";
        org.json.JSONObject out = new org.json.JSONObject();
        for (java.util.Map.Entry<String, ?> entry : source.getAll().entrySet()) {
            if (!LAST_SEEN_VERSION.equals(entry.getKey())) out.put(entry.getKey(), entry.getValue());
        }
        return out.toString(2);
    }

    /**
     * Applies an exported snapshot: booleans and strings are written, other JSON types are ignored.
     *
     * @return how many preferences were written.
     * @throws org.json.JSONException if the text is not a JSON object.
     */
    static int importJson(String text) throws org.json.JSONException {
        org.json.JSONObject in = new org.json.JSONObject(text.trim());
        SharedPreferences target = prefs();
        if (target == null) return 0;
        SharedPreferences.Editor editor = target.edit();
        int written = 0;
        for (java.util.Iterator<String> keys = in.keys(); keys.hasNext(); ) {
            String key = keys.next();
            Object value = in.get(key);
            if (value instanceof Boolean) {
                editor.putBoolean(key, ((Boolean) value).booleanValue());
                written++;
            } else if (value instanceof String) {
                editor.putString(key, (String) value);
                written++;
            }
        }
        editor.apply();
        return written;
    }

    /** Drops every preference except the last-seen version, which the "What's new" screen needs intact. */
    static void resetAll() {
        SharedPreferences current = prefs();
        if (current == null) return;
        String seen = current.getString(LAST_SEEN_VERSION, null);
        SharedPreferences.Editor editor = current.edit().clear();
        if (seen != null) editor.putString(LAST_SEEN_VERSION, seen);
        editor.apply();
    }

    // endregion

    // region Storage plumbing

    /** I18n.LANGUAGE_AUTO, or a language code that has a translation file. */
    static String language() {
        return getString(LANGUAGE, I18n.LANGUAGE_AUTO);
    }

    static boolean debug() {
        return get(DEBUG_LOGGING, false);
    }

    /** Feature switch: only true when the patch is in this install and the user left the row on. */
    private static boolean includedAnd(boolean patchedIn, String key, boolean fallback) {
        return patchedIn && get(key, fallback);
    }

    static boolean get(String key, boolean fallback) {
        SharedPreferences store = prefs();
        return store == null ? fallback : store.getBoolean(key, fallback);
    }

    static void set(String key, boolean value) {
        SharedPreferences store = prefs();
        if (store != null) store.edit().putBoolean(key, value).apply();
    }

    static String getString(String key, String fallback) {
        SharedPreferences store = prefs();
        return store == null ? fallback : store.getString(key, fallback);
    }

    static void setString(String key, String value) {
        SharedPreferences store = prefs();
        if (store != null) store.edit().putString(key, value).apply();
    }

    static SharedPreferences prefs() {
        if (prefs == null) {
            Context context = context();
            if (context != null) prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        }
        return prefs;
    }

    // endregion

    // region Application access

    /**
     * LinkedIn's base context. It is the only context that exists while the Compose themes initialise, which is
     * before FlagshipApplication.onCreate has run.
     */
    private static Context baseContext;

    /** Called at the start of FlagshipApplication.attachBaseContext. */
    public static void attachBaseContext(Context context) {
        baseContext = context;
    }

    /** The running Application, or the base context until that Application exists. */
    static Context context() {
        Application application = app();
        return application != null ? application : baseContext;
    }

    /**
     * The current Application, read straight from ActivityThread so no Application.onCreate hook is needed.
     * Returns {@code null} before one exists (early startup, unit tests) instead of throwing.
     */
    @SuppressLint({"PrivateApi", "DiscouragedPrivateApi"})
    static Application app() {
        try {
            return (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Throwable failure) {
            Log.e(TAG, "currentApplication failed", failure);
            return null;
        }
    }

    static void debugLog(String message) {
        Diagnostics.debug(message);
    }

    // endregion
}
