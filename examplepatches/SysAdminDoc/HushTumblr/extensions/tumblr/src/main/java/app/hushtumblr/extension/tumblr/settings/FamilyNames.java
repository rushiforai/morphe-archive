/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at debdac4 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.hushtumblr.extension.tumblr.settings;

/**
 * The name each patch goes by in Morphe Manager, which is also the family its hooks report
 * under in Hook status.
 *
 * <p>Compile-time constants, so a hook that names its family inlines the text and loads no
 * class. That matters for the hooks that can run before HushTumblr has a context, such as one in
 * code Tumblr runs while its startup providers run: touching {@link PatchFamily}
 * there would load the settings with no context to read them from.
 */
public final class FamilyNames {
    public static final String SHOW_MUTUAL_MARKERS = "Show mutual markers";
    public static final String REVEAL_ALLOWED_MATURE_CONTENT = "Reveal allowed mature content";
    public static final String MUTE_ROOT_POSTS = "Mute posts locally";
    public static final String VISIBLE_ALT_TEXT = "Visible image descriptions";
    public static final String SHOW_POST_TIMESTAMPS = "Show post timestamps";
    public static final String HIDE_ADS = "Hide ads";
    public static final String DISABLE_ANALYTICS = "Disable analytics";
    public static final String HIDE_ADVERTISING_ID = "Hide advertising ID";
    public static final String REMOVE_AD_TRACKING_PERMISSIONS = "Remove ad tracking permissions";
    public static final String SPOOF_SIGNATURE = "Spoof signature for Google sign-in";
    public static final String HIDE_AD_FREE_BANNER = "Hide the ad-free banner";
    public static final String HIDE_TUMBLR_TV = "Hide Tumblr TV";
    public static final String HIDE_COMMUNITIES_TAB = "Hide the Communities tab";
    public static final String HIDE_BLAZE_PROMPTS = "Hide Blaze prompts";
    public static final String SKIP_REVIEW_PROMPTS = "Skip review prompts";
    public static final String HIDE_BLOG_NOTIFICATION_REMINDERS = "Hide blog notification reminders";
    public static final String HIDE_GIFT_MESSAGE_POPUPS = "Hide gift purchase popups";
    public static final String TURN_OFF_SCREENSHOT_SHARING = "Turn off screenshot sharing";
    public static final String DISABLE_UPDATE_PROMPTS = "Disable update prompts";
    public static final String HIDE_SUGGESTED_BLOGS = "Hide suggested blogs";
    public static final String HIDE_SUGGESTED_COMMUNITIES = "Hide suggested communities";
    public static final String HIDE_SUGGESTED_TAGS = "Hide suggested tags";
    public static final String HIDE_WATCH_IT_ROWS = "Hide Watch it rows";
    public static final String HIDE_HASHTAGS = "Hide hashtags";
    public static final String HIDE_FOLLOW_BUTTON = "Hide the Follow button";
    public static final String HIDE_TUMBLRMART = "Hide the diamond and TumblrMart";
    public static final String HIDE_NOTE_COUNTS = "Hide note counts";
    public static final String HIDE_LIKE_BUTTON = "Hide the like button";
    public static final String HIDE_REBLOG_BUTTON = "Hide the reblog button";
    public static final String HIDE_COMMENT_BUTTON = "Hide the comment button";
    public static final String HIDE_SHARE_BUTTON = "Hide the share button";
    public static final String HIDE_SAVE_BUTTON = "Hide the Save button";
    public static final String HIDE_UNREAD_DOTS = "Hide unread dots";
    public static final String HIDE_REBLOGS = "Hide reblogs";
    public static final String HIDE_VIDEO_POSTS = "Hide video posts";
    public static final String HIDE_PHOTO_POSTS = "Hide photo posts";
    public static final String HIDE_TEXT_POSTS = "Hide text posts";
    public static final String HIDE_POSTS_WITH_WORDS = "Hide posts with these words";
    public static final String HIDE_FILTERED_POSTS = "Hide filtered posts";
    public static final String DARK_BACKGROUND = "Dark background color";
    public static final String HIDE_EXPLORE_TAB = "Hide the Explore tab";
    public static final String HIDE_NOTIFICATIONS_TAB = "Hide the Notifications tab";
    public static final String REORDER_TABS = "Reorder the bottom bar";
    public static final String FIX_PUSH_NOTIFICATIONS = "Fix push notifications";
    public static final String FILTER_ACTIVITY_NOTIFICATIONS = "Filter activity notifications";

    private FamilyNames() {
    }
}
