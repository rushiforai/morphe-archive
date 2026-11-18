package app.fakh.extension.linkedin;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

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
    static final String EXPAND_POSTS = "expand_posts";
    static final String HIDE_CELEBRATIONS = "hide_celebrations";
    static final String HIDE_FEED_JOBS = "hide_feed_jobs";
    static final String HIDE_REPOSTS = "hide_reposts";
    static final String HIDE_VIDEO_POSTS = "hide_video_posts";
    static final String HIDE_RECOMMENDATIONS = "hide_recommendations";
    static final String HIDE_GAMES = "hide_games";
    static final String HIDE_NEW_POSTS_PILL = "hide_new_posts_pill";
    static final String HIDE_TRANSLATION = "hide_translation";
    static final String OPEN_LINKS_DIRECTLY = "open_links_directly";
    static final String HIDE_SPONSORED_MESSAGES = "hide_sponsored_messages";
    static final String GHOST_MODE = "ghost_mode";
    static final String BLOCK_TRACKING = "block_tracking";
    static final String ANONYMOUS_PROFILE_VIEWING = "anonymous_profile_viewing";
    static final String DISABLE_DOUBLE_TAP_LIKE = "disable_double_tap_like";
    static final String SWIPE_TABS = "swipe_tabs";
    static final String KEEP_FEED = "keep_feed";
    static final String VIEWER_TAP_TO_HIDE = "viewer_tap_to_hide";
    static final String COPY_TEXT = "copy_text";
    static final String GLASS_NAVIGATION_BAR = "glass_navigation_bar";
    static final String LIQUID_GLASS = "liquid_glass";
    static final String ALWAYS_SHOW_NAVIGATION_BAR = "always_show_navigation_bar";
    static final String HIDE_TAB_LABELS = "hide_tab_labels";
    static final String HIDE_TAB_BADGES = "hide_tab_badges";
    static final String SHOW_TAB_JOBS = "show_tab_jobs";
    static final String SHOW_TAB_NETWORK = "show_tab_network";
    static final String SHOW_TAB_NOTIFICATIONS = "show_tab_notifications";
    static final String SHOW_TAB_POST = "show_tab_post";
    static final String SHOW_TAB_VIDEO = "show_tab_video";
    static final String SHOW_TAB_NEWS = "show_tab_news";
    static final String SHOW_TAB_MESSAGING = "show_tab_messaging";
    static final String NO_SCREENSHOT_SHARE = "no_screenshot_share";
    static final String SHOW_TOP_BAR_POST = "show_top_bar_post";
    static final String SHOW_TOP_BAR_MESSAGING = "show_top_bar_messaging";
    /** HomeTabInfo constants of the tabs after Home, in the order the user sorted them; empty for LinkedIn's order. */
    static final String TAB_ORDER = "tab_order";
    /** The optional tabs (Post, Video, News) LinkedIn last offered, each followed by a comma (NavigationBar). */
    static final String OFFERED_TABS = "offered_tabs";
    static final String REMOVE_GAPS_AND_DIVIDERS = "remove_gaps_and_dividers";
    static final String MATERIAL_YOU = "material_you";
    static final String PITCH_BLACK = "pitch_black";
    static final String MATERIAL_TAB_ICONS = "material_tab_icons";
    static final String DARK_APP_ICON = "dark_app_icon";
    static final String VIDEO_TAB_TIME = "video_tab_time";
    static final String VIDEO_TAB_AUTO_SCROLL = "video_tab_auto_scroll";
    static final String HIDE_MORE_TAB = "hide_more_tab";
    static final String SHOW_TAB_MORE = "show_tab_more";
    static final String MOVE_MORE_ITEMS = "move_more_items";
    static final String GAMES_SHORTCUT = "games_shortcut";
    /** Items of the More tab last seen, as JSON (MoreMenu). */
    static final String MORE_ITEMS = "more_items";
    /** Followed by an item id: whether that More item shows in the Me panel. */
    static final String MORE_ITEM_PREFIX = "more_item_";
    static final String SANITIZE_SHARE_LINKS = "sanitize_share_links";
    static final String RESOLVE_SHORT_LINKS = "resolve_short_links";
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

    public static boolean isExpandPostsIncluded() {
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

    public static boolean isRemoveGapsAndDividersIncluded() {
        return false;
    }

    public static boolean isGlassNavigationBarIncluded() {
        return false;
    }

    public static boolean isMaterialYouIncluded() {
        return false;
    }

    // Read once by the Compose themes, so these apply after LinkedIn restarts.

    static boolean removeGapsAndDividers() {
        return isRemoveGapsAndDividersIncluded() && get(REMOVE_GAPS_AND_DIVIDERS, true);
    }

    static boolean glassNavigationBar() {
        return isGlassNavigationBarIncluded() && get(GLASS_NAVIGATION_BAR, true);
    }

    static boolean liquidGlass() {
        return glassNavigationBar() && get(LIQUID_GLASS, false);
    }

    public static boolean isAlwaysShowNavigationBarIncluded() {
        return false;
    }

    /** Whether the navigation bar stays put while a screen scrolls, instead of sliding away. Called from the app. */
    public static boolean alwaysShowNavigationBar() {
        return isAlwaysShowNavigationBarIncluded() && get(ALWAYS_SHOW_NAVIGATION_BAR, false);
    }

    public static boolean isNavigationBarIncluded() {
        return false;
    }

    static boolean hideTabLabels() {
        return isNavigationBarIncluded() && get(HIDE_TAB_LABELS, false);
    }

    static boolean hideTabBadges() {
        return isNavigationBarIncluded() && get(HIDE_TAB_BADGES, false);
    }

    /** Whether the bottom bar leaves out the tab, named by its constant in HomeTabInfo. */
    static boolean tabHidden(String tab) {
        switch (tab) {
            case "MORE":
                return isNavigationBarIncluded() && !showMoreTab();
            case "JOBS":
                return isNavigationBarIncluded() && !get(SHOW_TAB_JOBS, true);
            case "RELATIONSHIPS":
                return isNavigationBarIncluded() && !get(SHOW_TAB_NETWORK, true);
            case "NOTIFICATIONS":
                return isNavigationBarIncluded() && !get(SHOW_TAB_NOTIFICATIONS, true);
            case "POST":
            case "VIDEO":
            case "NEWS":
            case "MESSAGING":
                return isNavigationBarIncluded() && !optionalTabShown(tab);
            default:
                return false;
        }
    }

    /**
     * Whether the bar shows Post, Video or News. LinkedIn gives these only to some accounts; one it did not give is
     * off until it is turned on, and is then added to the bar.
     */
    static boolean optionalTabShown(String tab) {
        return get(optionalTabKey(tab), tabOffered(tab));
    }

    private static String optionalTabKey(String tab) {
        switch (tab) {
            case "POST":
                return SHOW_TAB_POST;
            case "VIDEO":
                return SHOW_TAB_VIDEO;
            case "MESSAGING":
                return SHOW_TAB_MESSAGING;
            default:
                return SHOW_TAB_NEWS;
        }
    }

    /** The tab order the user picked, as HomeTabInfo constants, or an empty list for LinkedIn's own order. */
    static List<String> tabOrder() {
        String order = getString(TAB_ORDER, "");
        return order.isEmpty() ? Collections.emptyList() : Arrays.asList(order.split(","));
    }

    /** Whether LinkedIn offered the optional tab, named by its constant in HomeTabInfo, the last time it built the bar. */
    static boolean tabOffered(String tab) {
        return getString(OFFERED_TABS, "").contains(tab + ",");
    }

    public static boolean isScreenshotShareIncluded() {
        return false;
    }

    /** Called by UpdateScreenCaptureManagerImpl.register: true when the Share sheet must not open on a screenshot. */
    public static boolean blockScreenshotShare() {
        return isScreenshotShareIncluded() && get(NO_SCREENSHOT_SHARE, true);
    }

    public static boolean isTopBarButtonsIncluded() {
        return false;
    }

    static boolean hideTopBarPost() {
        return isTopBarButtonsIncluded() && !get(SHOW_TOP_BAR_POST, true);
    }

    static boolean hideTopBarMessaging() {
        return isTopBarButtonsIncluded() && !get(SHOW_TOP_BAR_MESSAGING, true);
    }

    static boolean materialYou() {
        return isMaterialYouIncluded() && get(MATERIAL_YOU, true);
    }

    public static boolean isAmoledBlackIncluded() {
        return false;
    }

    static boolean pitchBlack() {
        return isAmoledBlackIncluded() && get(PITCH_BLACK, false);
    }

    public static boolean isMaterialTabIconsIncluded() {
        return false;
    }

    static boolean materialTabIcons() {
        return isMaterialTabIconsIncluded() && get(MATERIAL_TAB_ICONS, false);
    }

    public static boolean isVideoTabIncluded() {
        return false;
    }

    static boolean videoTabTime() {
        return isVideoTabIncluded() && get(VIDEO_TAB_TIME, true);
    }

    static boolean videoTabAutoScroll() {
        return isVideoTabIncluded() && get(VIDEO_TAB_AUTO_SCROLL, false);
    }

    public static boolean isDarkAppIconIncluded() {
        return false;
    }

    static boolean darkAppIcon() {
        return isDarkAppIconIncluded() && get(DARK_APP_ICON, false);
    }

    public static boolean isMoreMenuIncluded() {
        return false;
    }

    static boolean moreMenu() {
        return isMoreMenuIncluded();
    }

    static boolean gamesShortcut() {
        return isMoreMenuIncluded() && get(GAMES_SHORTCUT, true);
    }

    /** Whether the single switch that both hid the More tab and moved its items was on: the default of the two that follow it. */
    private static boolean moreHiddenAndMoved() {
        return get(HIDE_MORE_TAB, true);
    }

    static boolean showMoreTab() {
        return get(SHOW_TAB_MORE, !moreHiddenAndMoved());
    }

    static boolean moveMoreItems() {
        return isMoreMenuIncluded() && get(MOVE_MORE_ITEMS, moreHiddenAndMoved());
    }

    public static boolean isGmsCoreSupportIncluded() {
        return false;
    }

    static boolean disableDoubleTapLike() {
        return isDisableDoubleTapLikeIncluded() && get(DISABLE_DOUBLE_TAP_LIKE, true);
    }

    // region Backup

    /** All Fakh Patches preferences as JSON, for export. */
    static String exportJson() throws org.json.JSONException {
        org.json.JSONObject json = new org.json.JSONObject();
        SharedPreferences p = prefs();
        if (p == null) return "{}";
        for (java.util.Map.Entry<String, ?> entry : p.getAll().entrySet()) {
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

    /** Restores every setting to its default. */
    static void resetAll() {
        SharedPreferences p = prefs();
        if (p != null) p.edit().clear().apply();
    }

    // endregion

    public static boolean isBlockTrackingIncluded() {
        return false;
    }

    /** Off by default. */
    static boolean blockTracking() {
        return isBlockTrackingIncluded() && get(BLOCK_TRACKING, true);
    }

    public static boolean isAnonymousProfileViewingIncluded() {
        return false;
    }

    /** Off by default. */
    static boolean anonymousProfileViewing() {
        return isAnonymousProfileViewingIncluded() && get(ANONYMOUS_PROFILE_VIEWING, true);
    }

    public static boolean isSwipeTabsIncluded() {
        return false;
    }

    static boolean swipeTabs() {
        return isSwipeTabsIncluded() && get(SWIPE_TABS, true);
    }

    public static boolean isKeepFeedIncluded() {
        return false;
    }

    static boolean keepFeed() {
        return isKeepFeedIncluded() && get(KEEP_FEED, true);
    }

    public static boolean isViewerTapToHideIncluded() {
        return false;
    }

    static boolean viewerTapToHide() {
        return isViewerTapToHideIncluded() && get(VIEWER_TAP_TO_HIDE, true);
    }

    public static boolean isPostMenuIncluded() {
        return false;
    }

    /** Whether any item is added to the ⋯ menus: the shared hooks are in, and Copy text or Download media is on. */
    static boolean postMenu() {
        return isPostMenuIncluded() && (copyText() || downloadMedia());
    }

    public static boolean isCopyTextIncluded() {
        return false;
    }

    static boolean copyText() {
        return isCopyTextIncluded() && get(COPY_TEXT, true);
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

    static boolean expandPosts() {
        return isExpandPostsIncluded() && get(EXPAND_POSTS, false);
    }

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

    static boolean hideRecommendations() {
        return isFeedFiltersIncluded() && get(HIDE_RECOMMENDATIONS, false);
    }

    static boolean hideGames() {
        return isFeedFiltersIncluded() && get(HIDE_GAMES, false);
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

    /** Called on the "Me" panel upsell slot as HomeNavPanelFeature reads it: null removes the card. */
    public static Object navPanelUpsell(Object slot) {
        return hidePremium() ? null : slot;
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

    static SharedPreferences prefs() {
        if (prefs == null) {
            Context context = context();
            if (context != null) prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        }
        return prefs;
    }

    /** LinkedIn's base context, set before its Application exists: the Compose themes load that early. */
    private static Context baseContext;

    /** Injected at the start of FlagshipApplication.attachBaseContext. */
    public static void attachBaseContext(Context context) {
        baseContext = context;
    }

    /** The running Application, or LinkedIn's base context while the Application is not there yet. */
    static Context context() {
        Application app = app();
        return app != null ? app : baseContext;
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
        Diagnostics.debug(message);
    }
}
