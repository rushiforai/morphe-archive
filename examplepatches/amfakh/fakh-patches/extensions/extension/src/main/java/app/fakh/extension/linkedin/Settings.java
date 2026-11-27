/*
 * Portions based on Michii Patches by heyymichii, GPLv3:
 * https://github.com/heyymichii/michii-patches
 *
 * Modifications copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.linkedin;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.fakh.extension.shared.Features;

/**
 * The switches of the LinkedIn patches. Which ones are in the app, and their defaults, come from {@link Features}, which
 * the patches fill in at patch time; the switches stay in the app's own SharedPreferences, as do the list settings
 * (tabs, their order, the More items, the download folder). Post menu and GmsCore support have no switch, so their
 * patches still mark them included.
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
    static final String HIDE_POST_FOLLOW = "hide_post_follow";
    static final String HIDE_DEGREE = "hide_degree";
    static final String EXACT_POST_TIME = "exact_post_time";
    static final String NEWEST_COMMENTS = "newest_comments";
    /** Words and phrases, one per line: posts whose text has one are hidden. */
    static final String MUTED_WORDS = "muted_words";
    /** Names of people and pages, one per line: their posts are hidden. */
    static final String MUTED_AUTHORS = "muted_authors";
    // Registered when the muted lists are patched in; not switches.
    static final String MUTED_WORDS_LIST = "muted_words_list";
    static final String MUTED_AUTHORS_LIST = "muted_authors_list";
    static final String OPEN_LINKS_DIRECTLY = "open_links_directly";
    static final String HIDE_SPONSORED_MESSAGES = "hide_sponsored_messages";
    static final String GHOST_MODE = "ghost_mode";
    static final String MARK_READ_AFTER_REPLY = "mark_read_after_reply";
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
    /** Registered when the Navigation bar tabs sheet is patched in; not a switch. */
    static final String NAVIGATION_TABS = "navigation_tabs";
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
    static final String FEED_SORT_BUTTON = "feed_sort_button";
    /** The app's own answer on showing the feed sort button, which the switch follows until the user changes it. */
    static final String FEED_SORT_STOCK = "feed_sort_button_stock";
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
    /** Registered when the Items in the More tab sheet is patched in; not a switch. */
    static final String MORE_TAB_ITEMS = "more_tab_items";
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
        return Features.has(HIDE_ADS);
    }

    public static boolean isHidePromotedJobsIncluded() {
        return Features.has(HIDE_PROMOTED_JOBS);
    }

    public static boolean isHideSuggestedIncluded() {
        return Features.has(HIDE_SUGGESTED);
    }

    public static boolean isHidePremiumIncluded() {
        return Features.has(HIDE_PREMIUM);
    }

    public static boolean isDownloadMediaIncluded() {
        return Features.has(DOWNLOAD_MEDIA);
    }

    public static boolean isExpandPostsIncluded() {
        return Features.has(EXPAND_POSTS);
    }

    public static boolean isOpenLinksDirectlyIncluded() {
        return Features.has(OPEN_LINKS_DIRECTLY);
    }

    /** Replaced at patch time with the version of the patch bundle (from its manifest). */
    public static String patchesVersion() {
        return "dev";
    }

    public static boolean isSanitizeShareLinksIncluded() {
        return Features.has(SANITIZE_SHARE_LINKS);
    }

    static boolean sanitizeShareLinks() {
        return Features.on(SANITIZE_SHARE_LINKS);
    }

    static boolean resolveShortLinks() {
        return Features.on(RESOLVE_SHORT_LINKS);
    }

    public static boolean isDisableDoubleTapLikeIncluded() {
        return Features.has(DISABLE_DOUBLE_TAP_LIKE);
    }

    public static boolean isRemoveGapsAndDividersIncluded() {
        return Features.has(REMOVE_GAPS_AND_DIVIDERS);
    }

    public static boolean isGlassNavigationBarIncluded() {
        return Features.has(GLASS_NAVIGATION_BAR);
    }

    public static boolean isMaterialYouIncluded() {
        return Features.has(MATERIAL_YOU);
    }

    // Read once by the Compose themes, so these apply after LinkedIn restarts.

    static boolean removeGapsAndDividers() {
        return Features.on(REMOVE_GAPS_AND_DIVIDERS);
    }

    static boolean glassNavigationBar() {
        return Features.on(GLASS_NAVIGATION_BAR);
    }

    static boolean liquidGlass() {
        return Features.on(LIQUID_GLASS);
    }

    public static boolean isAlwaysShowNavigationBarIncluded() {
        return Features.has(ALWAYS_SHOW_NAVIGATION_BAR);
    }

    /** Whether the navigation bar stays put while a screen scrolls, instead of sliding away. Called from the app. */
    public static boolean alwaysShowNavigationBar() {
        return Features.on(ALWAYS_SHOW_NAVIGATION_BAR);
    }

    public static boolean isNavigationBarIncluded() {
        return Features.has(NAVIGATION_TABS);
    }

    static boolean hideTabLabels() {
        return Features.on(HIDE_TAB_LABELS);
    }

    static boolean hideTabBadges() {
        return Features.on(HIDE_TAB_BADGES);
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
        return Features.has(NO_SCREENSHOT_SHARE);
    }

    /** Called by UpdateScreenCaptureManagerImpl.register: true when the Share sheet must not open on a screenshot. */
    public static boolean blockScreenshotShare() {
        return Features.on(NO_SCREENSHOT_SHARE);
    }

    public static boolean isTopBarButtonsIncluded() {
        return Features.has(SHOW_TOP_BAR_POST);
    }

    /** Called by the patched app: whether the home top bar gets the feed sort button, {@code stock} being the app's own answer. */
    public static boolean showFeedSortButton(boolean stock) {
        set(FEED_SORT_STOCK, stock);
        return get(FEED_SORT_BUTTON, stock);
    }

    static boolean hideTopBarPost() {
        return isTopBarButtonsIncluded() && !get(SHOW_TOP_BAR_POST, true);
    }

    static boolean hideTopBarMessaging() {
        return isTopBarButtonsIncluded() && !get(SHOW_TOP_BAR_MESSAGING, true);
    }

    static boolean materialYou() {
        return Features.on(MATERIAL_YOU);
    }

    public static boolean isAmoledBlackIncluded() {
        return Features.has(PITCH_BLACK);
    }

    static boolean pitchBlack() {
        return Features.on(PITCH_BLACK);
    }

    public static boolean isMaterialTabIconsIncluded() {
        return Features.has(MATERIAL_TAB_ICONS);
    }

    static boolean materialTabIcons() {
        return Features.on(MATERIAL_TAB_ICONS);
    }

    /** Whether the video time or the Video tab's auto-scroll is patched in; both follow the playing video. */
    public static boolean isVideoTabIncluded() {
        return Features.has(VIDEO_TAB_TIME) || Features.has(VIDEO_TAB_AUTO_SCROLL);
    }

    static boolean videoTabTime() {
        return Features.on(VIDEO_TAB_TIME);
    }

    static boolean videoTabAutoScroll() {
        return Features.on(VIDEO_TAB_AUTO_SCROLL);
    }

    public static boolean isDarkAppIconIncluded() {
        return Features.has(DARK_APP_ICON);
    }

    static boolean darkAppIcon() {
        return Features.on(DARK_APP_ICON);
    }

    public static boolean isMoreMenuIncluded() {
        return Features.has(MORE_TAB_ITEMS);
    }

    static boolean moreMenu() {
        return isMoreMenuIncluded();
    }

    static boolean gamesShortcut() {
        return Features.on(GAMES_SHORTCUT);
    }

    /** Whether the single switch that both hid the More tab and moved its items was on: the default of the two that follow it. */
    private static boolean moreHiddenAndMoved() {
        return get(HIDE_MORE_TAB, true);
    }

    static boolean showMoreTab() {
        return get(SHOW_TAB_MORE, !moreHiddenAndMoved());
    }

    static boolean moveMoreItems() {
        return Features.has(MOVE_MORE_ITEMS) && get(MOVE_MORE_ITEMS, moreHiddenAndMoved());
    }

    public static boolean isGmsCoreSupportIncluded() {
        return false;
    }

    static boolean disableDoubleTapLike() {
        return Features.on(DISABLE_DOUBLE_TAP_LIKE);
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
        return Features.has(BLOCK_TRACKING);
    }

    /** Off by default. */
    static boolean blockTracking() {
        return Features.on(BLOCK_TRACKING);
    }

    public static boolean isAnonymousProfileViewingIncluded() {
        return Features.has(ANONYMOUS_PROFILE_VIEWING);
    }

    /** Off by default. */
    static boolean anonymousProfileViewing() {
        return Features.on(ANONYMOUS_PROFILE_VIEWING);
    }

    public static boolean isSwipeTabsIncluded() {
        return Features.has(SWIPE_TABS);
    }

    static boolean swipeTabs() {
        return Features.on(SWIPE_TABS);
    }

    public static boolean isKeepFeedIncluded() {
        return Features.has(KEEP_FEED);
    }

    static boolean keepFeed() {
        return Features.on(KEEP_FEED);
    }

    public static boolean isViewerTapToHideIncluded() {
        return Features.has(VIEWER_TAP_TO_HIDE);
    }

    static boolean viewerTapToHide() {
        return Features.on(VIEWER_TAP_TO_HIDE);
    }

    public static boolean isPostMenuIncluded() {
        return false;
    }

    /** Whether any item is added to the ⋯ menus: the shared hooks are in, and Copy text or Download media is on. */
    static boolean postMenu() {
        return isPostMenuIncluded() && (copyText() || downloadMedia());
    }

    public static boolean isCopyTextIncluded() {
        return Features.has(COPY_TEXT);
    }

    static boolean copyText() {
        return Features.on(COPY_TEXT);
    }

    static boolean hideSponsoredMessages() {
        return Features.on(HIDE_SPONSORED_MESSAGES);
    }

    /** Off by default: it also stops chats being marked as read on this device. */
    static boolean ghostMode() {
        return Features.on(GHOST_MODE);
    }

    /** Part of Ghost mode: a chat you reply to is marked as read. */
    static boolean markReadAfterReply() {
        return Features.on(MARK_READ_AFTER_REPLY);
    }

    static boolean openLinksDirectly() {
        return Features.on(OPEN_LINKS_DIRECTLY);
    }

    // Feed filters remove normal content, so they are off until the user turns them on.

    static boolean expandPosts() {
        return Features.on(EXPAND_POSTS);
    }

    static boolean focusMode() {
        return Features.on(FOCUS_MODE);
    }

    static boolean hideCelebrations() {
        return Features.on(HIDE_CELEBRATIONS);
    }

    static boolean hideFeedJobs() {
        return Features.on(HIDE_FEED_JOBS);
    }

    static boolean hideReposts() {
        return Features.on(HIDE_REPOSTS);
    }

    static boolean hideVideoPosts() {
        return Features.on(HIDE_VIDEO_POSTS);
    }

    static boolean hideRecommendations() {
        return Features.on(HIDE_RECOMMENDATIONS);
    }

    static boolean hideGames() {
        return Features.on(HIDE_GAMES);
    }

    static boolean hideNewPostsPill() {
        return Features.on(HIDE_NEW_POSTS_PILL);
    }

    static boolean hideTranslation() {
        return Features.on(HIDE_TRANSLATION);
    }

    static boolean hidePostFollow() {
        return Features.on(HIDE_POST_FOLLOW);
    }

    static boolean hideDegree() {
        return Features.on(HIDE_DEGREE);
    }

    static boolean exactPostTime() {
        return Features.on(EXACT_POST_TIME);
    }

    static boolean newestComments() {
        return Features.on(NEWEST_COMMENTS);
    }

    /**
     * A muted list as typed ({@link #MUTED_WORDS} or {@link #MUTED_AUTHORS}), or an empty string; only with that
     * list patched in.
     */
    static String muted(String key) {
        return Features.has(MUTED_WORDS.equals(key) ? MUTED_WORDS_LIST : MUTED_AUTHORS_LIST) ? getString(key, "") : "";
    }

    static boolean hideAds() {
        return Features.on(HIDE_ADS);
    }

    static boolean hidePromotedJobs() {
        return Features.on(HIDE_PROMOTED_JOBS);
    }

    static boolean hideSuggested() {
        return Features.on(HIDE_SUGGESTED);
    }

    static boolean hidePremium() {
        return Features.on(HIDE_PREMIUM);
    }

    /** Called on the "Me" panel upsell slot as HomeNavPanelFeature reads it: null removes the card. */
    public static Object navPanelUpsell(Object slot) {
        return hidePremium() ? null : slot;
    }

    static boolean downloadMedia() {
        return Features.on(DOWNLOAD_MEDIA);
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
        Features.attachBaseContext(context);
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
