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

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;

import android.os.Build;

import app.hushtumblr.extension.shared.settings.BaseSettings;
import app.hushtumblr.extension.shared.settings.BooleanSetting;

/**
 * The switches behind the hooks that ask before they act.
 *
 * <p>A switch's default is the second argument of its {@link BooleanSetting}. Hide ads, Disable
 * analytics, Hide advertising ID and Fix push notifications keep their switches on: they're what
 * most people patch for, and a patched build gets no push notifications without the last one. A
 * patch added later joins the default selection with its switches off, so a build patched with
 * the defaults acts like Tumblr until one is turned on. While HushTumblr is paused, safe mode included
 * ({@link app.hushtumblr.extension.shared.settings.HushTumblrPause}), a switch answers off unless
 * {@link app.hushtumblr.extension.shared.settings.Setting#keepWhenPaused} marks it, and the hook behind
 * it takes Tumblr's own path.
 *
 * <p>A switch that only answers Tumblr's feature flags passes {@code true} as its third argument:
 * Tumblr keeps each flag's first answer until it restarts, so changing one owes a restart, and
 * the settings screen says so with its shared restart line and toast.
 */
@SuppressWarnings("unused")
public class Settings extends BaseSettings {
    public static final BooleanSetting SHOW_MUTUAL_MARKERS = new BooleanSetting("hushtumblr_show_mutual_markers", FALSE);
    public static final BooleanSetting REVEAL_ALLOWED_MATURE_CONTENT =
            new BooleanSetting("hushtumblr_reveal_allowed_mature_content", FALSE);
    public static final BooleanSetting MUTE_ROOT_POSTS = new BooleanSetting("hushtumblr_mute_root_posts", FALSE);
    public static final BooleanSetting SHOW_IMAGE_DESCRIPTIONS = new BooleanSetting("hushtumblr_show_image_descriptions", FALSE);
    public static final BooleanSetting SHOW_POST_TIMESTAMPS = new BooleanSetting("hushtumblr_show_post_timestamps", FALSE);
    public static final BooleanSetting WORDS_CURRENT_TEXT = new BooleanSetting("hushtumblr_words_current_text", TRUE);
    public static final BooleanSetting WORDS_REBLOG_TRAIL = new BooleanSetting("hushtumblr_words_reblog_trail", TRUE);
    public static final BooleanSetting WORDS_TAGS = new BooleanSetting("hushtumblr_words_tags", TRUE);
    public static final BooleanSetting WORDS_SUMMARY = new BooleanSetting("hushtumblr_words_summary", TRUE);
    public static final BooleanSetting HIDE_NOTIFICATION_LIKES = new BooleanSetting("hushtumblr_hide_notification_likes", FALSE);
    public static final BooleanSetting HIDE_NOTIFICATION_REBLOGS = new BooleanSetting("hushtumblr_hide_notification_reblogs", FALSE);
    public static final BooleanSetting HIDE_NOTIFICATION_REPLIES = new BooleanSetting("hushtumblr_hide_notification_replies", FALSE);
    public static final BooleanSetting HIDE_NOTIFICATION_FOLLOWS = new BooleanSetting("hushtumblr_hide_notification_follows", FALSE);
    public static final BooleanSetting HIDE_NOTIFICATION_MENTIONS = new BooleanSetting("hushtumblr_hide_notification_mentions", FALSE);
    public static final BooleanSetting HIDE_NOTIFICATION_ASKS = new BooleanSetting("hushtumblr_hide_notification_asks", FALSE);
    public static final BooleanSetting HIDE_NOTIFICATION_BOOPS = new BooleanSetting("hushtumblr_hide_notification_boops", FALSE);
    /**
     * Ads and paid Blaze posts leave each page of posts Tumblr loads, and Tumblr's own requests to
     * its ad networks are turned off ({@link app.hushtumblr.extension.tumblr.timeline.TimelineFilter},
     * {@link app.hushtumblr.extension.tumblr.flags.FeatureSwitches}). On to start, like the patch.
     * Restart-gated: the feed filter reads it per page, but the ad network switches are only read
     * when Tumblr starts, which is what the row's summary promises.
     */
    public static final BooleanSetting HIDE_ADS =
            new BooleanSetting("hushtumblr_hide_ads", TRUE, true);

    /**
     * Google's advertising ID getters answer an empty ID with ad tracking limited
     * ({@link app.hushtumblr.extension.tumblr.privacy.AdvertisingId}).
     */
    public static final BooleanSetting HIDE_ADVERTISING_ID =
            new BooleanSetting("hushtumblr_hide_ad_id", TRUE);

    /**
     * Firebase gets Tumblr's own certificate fingerprint when it signs this install up for push
     * notifications ({@link app.hushtumblr.extension.tumblr.notifications.PushNotifications}). On to
     * start: a patched build can get no push notifications at all without it.
     */
    public static final BooleanSetting FIX_PUSH_NOTIFICATIONS =
            new BooleanSetting("hushtumblr_fix_push_notifications", TRUE, true);

    /**
     * Tumblr's own tracking and ad measurement flags answer off
     * ({@link app.hushtumblr.extension.tumblr.flags.FeatureSwitches}). The manifest half of Disable
     * analytics was set when patching and stays whatever this says. On to start, like the patch.
     */
    public static final BooleanSetting DISABLE_ANALYTICS =
            new BooleanSetting("hushtumblr_disable_analytics", TRUE, true);

    /**
     * The dashboard's banner selling Ad-Free Browsing stays hidden
     * ({@link app.hushtumblr.extension.tumblr.flags.FeatureSwitches}). Off to start.
     */
    public static final BooleanSetting HIDE_AD_FREE_BANNER =
            new BooleanSetting("hushtumblr_hide_ad_free_banner", FALSE, true);

    /**
     * The Tumblr TV tab leaves the bottom bar, and sign-up no longer ends in Tumblr TV
     * ({@link app.hushtumblr.extension.tumblr.flags.FeatureSwitches}). Off to start.
     */
    public static final BooleanSetting HIDE_TUMBLR_TV =
            new BooleanSetting("hushtumblr_hide_tumblr_tv", FALSE, true);

    /**
     * The bottom bar doesn't show the Communities tab's button; the tab itself stays in Tumblr's
     * list ({@link app.hushtumblr.extension.tumblr.ui.BottomBarTabs}). The post editor stops
     * showing Communities tips ({@link app.hushtumblr.extension.tumblr.flags.FeatureSwitches}).
     * Off to start.
     */
    public static final BooleanSetting HIDE_COMMUNITIES_TAB =
            new BooleanSetting("hushtumblr_hide_communities_tab", FALSE, true);

    /**
     * Tumblr's buttons, banners and nudges selling Blaze stay hidden
     * ({@link app.hushtumblr.extension.tumblr.flags.FeatureSwitches}). Off to start.
     */
    public static final BooleanSetting HIDE_BLAZE_PROMPTS =
            new BooleanSetting("hushtumblr_hide_blaze_prompts", FALSE, true);

    /**
     * Tumblr's pop-up asking you to rate it doesn't open
     * ({@link app.hushtumblr.extension.tumblr.ui.ReviewPrompts}). Off to start.
     */
    public static final BooleanSetting SKIP_REVIEW_PROMPTS =
            new BooleanSetting("hushtumblr_skip_review_prompts", FALSE);

    /** Only optional reminders are hidden. Blog subscriptions and push preferences stay intact. */
    public static final BooleanSetting HIDE_BLOG_NOTIFICATION_REMINDERS =
            new BooleanSetting("hushtumblr_hide_blog_notification_reminders", FALSE);

    /** Only the unsolicited gift popup is hidden. Deliberate gifting and crab tips stay intact. */
    public static final BooleanSetting HIDE_GIFT_MESSAGE_POPUPS =
            new BooleanSetting("hushtumblr_hide_gift_message_popups", FALSE);
    /** Draws a line in the gap above each timeline post. Read at every draw, so it needs no restart. */
    public static final BooleanSetting LINE_BETWEEN_POSTS =
            new BooleanSetting("hushtumblr_line_between_posts", FALSE);
    /** Swaps Tumblr's own font as fonts load. Tumblr keeps what it loaded for as long as it runs. */
    public static final BooleanSetting APP_FONT = new BooleanSetting("hushtumblr_app_font", FALSE, true);

    /**
     * Tumblr stops watching for screenshots and offering to save the post as an image
     * ({@link app.hushtumblr.extension.tumblr.flags.FeatureSwitches}). Off to start.
     */
    public static final BooleanSetting TURN_OFF_SCREENSHOT_SHARING =
            new BooleanSetting("hushtumblr_turn_off_screenshot_sharing", FALSE, true);

    /**
     * Tumblr doesn't ask Google Play for a newer version or show Play's update prompt
     * ({@link app.hushtumblr.extension.tumblr.flags.FeatureSwitches}). Off to start.
     */
    public static final BooleanSetting DISABLE_UPDATE_PROMPTS =
            new BooleanSetting("hushtumblr_disable_update_prompts", FALSE, true);

    /**
     * The "Check out these blogs" cards and carousels, and their headings, come out of each page
     * ({@link app.hushtumblr.extension.tumblr.timeline.TimelineFilter}). Off to start.
     */
    public static final BooleanSetting HIDE_SUGGESTED_BLOGS =
            new BooleanSetting("hushtumblr_hide_suggested_blogs", FALSE);

    /**
     * The "Check out these communities" cards and carousels, and their headings, come out of each
     * page ({@link app.hushtumblr.extension.tumblr.timeline.TimelineFilter}). Off to start.
     */
    public static final BooleanSetting HIDE_SUGGESTED_COMMUNITIES =
            new BooleanSetting("hushtumblr_hide_suggested_communities", FALSE);

    /**
     * The carousels of tags Tumblr suggests you follow, and their headings, and the prompts to share
     * a tag between its posts, come out of each page
     * ({@link app.hushtumblr.extension.tumblr.timeline.TimelineFilter}). Off to start.
     */
    public static final BooleanSetting HIDE_SUGGESTED_TAGS =
            new BooleanSetting("hushtumblr_hide_suggested_tags", FALSE);

    /**
     * Tumblr TV's "Watch it" rows and video hub cards, and their headings, come out of each page
     * ({@link app.hushtumblr.extension.tumblr.timeline.TimelineFilter}). Off to start.
     */
    public static final BooleanSetting HIDE_WATCH_IT_ROWS =
            new BooleanSetting("hushtumblr_hide_watch_it_rows", FALSE);

    /**
     * Posts in your feeds don't show their tags
     * ({@link app.hushtumblr.extension.tumblr.ui.PostParts}). Off to start.
     */
    public static final BooleanSetting HIDE_HASHTAGS =
            new BooleanSetting("hushtumblr_hide_hashtags", FALSE);

    /**
     * Post headers don't show the Follow button
     * ({@link app.hushtumblr.extension.tumblr.ui.PostParts}). Off to start.
     */
    public static final BooleanSetting HIDE_FOLLOW_BUTTON =
            new BooleanSetting("hushtumblr_hide_follow_button", FALSE);

    /**
     * The Premium diamond and the TumblrMart button stay out of Tumblr's top bars
     * ({@link app.hushtumblr.extension.tumblr.ui.StoreButtons}). Off to start.
     */
    public static final BooleanSetting HIDE_TUMBLRMART =
            new BooleanSetting("hushtumblr_hide_tumblrmart", FALSE, true);

    /**
     * The footer under posts doesn't show the like, reblog and comment counts
     * ({@link app.hushtumblr.extension.tumblr.ui.PostFooter}). Off to start.
     */
    public static final BooleanSetting HIDE_NOTE_COUNTS =
            new BooleanSetting("hushtumblr_hide_note_counts", FALSE);

    /**
     * The footer under posts doesn't show the like button
     * ({@link app.hushtumblr.extension.tumblr.ui.PostFooter}). Off to start.
     */
    public static final BooleanSetting HIDE_LIKE_BUTTON =
            new BooleanSetting("hushtumblr_hide_like_button", FALSE, true);

    /**
     * The footer under posts doesn't show the reblog button
     * ({@link app.hushtumblr.extension.tumblr.ui.PostFooter}). Off to start.
     */
    public static final BooleanSetting HIDE_REBLOG_BUTTON =
            new BooleanSetting("hushtumblr_hide_reblog_button", FALSE, true);

    /**
     * The footer under posts doesn't show the comment button
     * ({@link app.hushtumblr.extension.tumblr.ui.PostFooter}). Off to start.
     */
    public static final BooleanSetting HIDE_COMMENT_BUTTON =
            new BooleanSetting("hushtumblr_hide_comment_button", FALSE, true);

    /**
     * The footer under posts doesn't show the share button
     * ({@link app.hushtumblr.extension.tumblr.ui.PostFooter}). Off to start.
     */
    public static final BooleanSetting HIDE_SHARE_BUTTON =
            new BooleanSetting("hushtumblr_hide_share_button", FALSE, true);

    /**
     * The footer under posts doesn't show the Save button, which Tumblr draws only while its
     * POST_STASH flag is on ({@link app.hushtumblr.extension.tumblr.ui.PostFooter}). Off to start.
     */
    public static final BooleanSetting HIDE_SAVE_BUTTON =
            new BooleanSetting("hushtumblr_hide_save_button", FALSE, true);

    /**
     * The bottom bar's Dashboard tab doesn't show its unread count
     * ({@link app.hushtumblr.extension.tumblr.ui.BottomBar}). Off to start.
     */
    public static final BooleanSetting HIDE_DASHBOARD_COUNT =
            new BooleanSetting("hushtumblr_hide_dashboard_count", FALSE);

    /**
     * The bottom bar's Communities tab doesn't show its unread count
     * ({@link app.hushtumblr.extension.tumblr.ui.BottomBar}). Off to start.
     */
    public static final BooleanSetting HIDE_COMMUNITIES_COUNT =
            new BooleanSetting("hushtumblr_hide_communities_count", FALSE);

    /**
     * The bottom bar's Notifications tab doesn't show its unread count
     * ({@link app.hushtumblr.extension.tumblr.ui.BottomBar}). Off to start.
     */
    public static final BooleanSetting HIDE_NOTIFICATIONS_COUNT =
            new BooleanSetting("hushtumblr_hide_notifications_count", FALSE);

    /**
     * Reblogs leave each page of posts Tumblr loads: a post that names the post it reblogs or
     * carries a reblog trail ({@link app.hushtumblr.extension.tumblr.timeline.PostRules}).
     */
    public static final BooleanSetting HIDE_REBLOGS =
            new BooleanSetting("hushtumblr_hide_reblogs", FALSE);

    /** Keep tagged reblogs, while leaving the other enabled post rules in force. */
    public static final BooleanSetting KEEP_TAGGED_REBLOGS =
            new BooleanSetting("hushtumblr_keep_tagged_reblogs", FALSE);

    /** Keep reblogs whose own content isn't empty, while leaving the other enabled post rules in force. */
    public static final BooleanSetting KEEP_REBLOGS_WITH_CONTENT =
            new BooleanSetting("hushtumblr_keep_reblogs_with_content", FALSE);

    /**
     * Posts with a video anywhere in them, the reblog trail included, leave each page of posts
     * Tumblr loads ({@link app.hushtumblr.extension.tumblr.timeline.PostRules}).
     */
    public static final BooleanSetting HIDE_VIDEO_POSTS =
            new BooleanSetting("hushtumblr_hide_video_posts", FALSE);

    /**
     * Posts with pictures and no video, the reblog trail included, leave each page of posts Tumblr
     * loads ({@link app.hushtumblr.extension.tumblr.timeline.PostRules}).
     */
    public static final BooleanSetting HIDE_PHOTO_POSTS =
            new BooleanSetting("hushtumblr_hide_photo_posts", FALSE);

    /**
     * Posts with neither pictures nor video, the reblog trail included, leave each page of posts
     * Tumblr loads ({@link app.hushtumblr.extension.tumblr.timeline.PostRules}).
     */
    public static final BooleanSetting HIDE_TEXT_POSTS =
            new BooleanSetting("hushtumblr_hide_text_posts", FALSE);

    /**
     * Posts holding a word or phrase from {@link TextSettings#HIDDEN_WORDS} in their text, reblog
     * trail, tags or summary leave each page of posts Tumblr loads
     * ({@link app.hushtumblr.extension.tumblr.timeline.PostRules}).
     */
    public static final BooleanSetting HIDE_POSTS_WITH_WORDS =
            new BooleanSetting("hushtumblr_hide_posts_with_words", FALSE);

    /**
     * Posts Tumblr covers with "This post contains filtered content", because of a tag or word in
     * your own filters, leave each page of posts Tumblr loads
     * ({@link app.hushtumblr.extension.tumblr.timeline.PostRules}).
     */
    public static final BooleanSetting HIDE_FILTERED_POSTS =
            new BooleanSetting("hushtumblr_hide_filtered_posts", FALSE);

    /**
     * Tumblr's Dark palette paints its backgrounds in the color picked when patching, black unless
     * another was picked ({@link app.hushtumblr.extension.tumblr.ui.DarkBackground}). Off to start.
     */
    public static final BooleanSetting DARK_BACKGROUND =
            new BooleanSetting("hushtumblr_dark_background", FALSE, true);
    /** Takes that background from the wallpaper's colors. Android 11 and older don't make any, so the row greys out there. */
    public static final BooleanSetting DARK_BACKGROUND_WALLPAPER =
            new BooleanSetting("hushtumblr_dark_background_wallpaper", FALSE, true,
                    () -> Build.VERSION.SDK_INT >= Build.VERSION_CODES.S);

    /**
     * The bottom bar doesn't show the Explore tab's button; the tab itself stays in Tumblr's list
     * ({@link app.hushtumblr.extension.tumblr.ui.BottomBarTabs}). Off to start.
     */
    public static final BooleanSetting HIDE_EXPLORE_TAB =
            new BooleanSetting("hushtumblr_hide_explore_tab", FALSE, true);

    /**
     * The bottom bar doesn't show the Notifications tab's button; the tab itself stays in Tumblr's
     * list ({@link app.hushtumblr.extension.tumblr.ui.BottomBarTabs}). Off to start.
     */
    public static final BooleanSetting HIDE_NOTIFICATIONS_TAB =
            new BooleanSetting("hushtumblr_hide_notifications_tab", FALSE, true);

    /**
     * Tumblr's tab list, and so the bottom bar, goes in the order saved in
     * {@link TextSettings#TAB_ORDER} ({@link app.hushtumblr.extension.tumblr.ui.BottomBarTabs}).
     * Off to start.
     */
    public static final BooleanSetting REORDER_TABS =
            new BooleanSetting("hushtumblr_reorder_tabs", FALSE, true);

    /**
     * Once a day, when Tumblr starts, ask api.github.com whether a newer HushTumblr release is
     * out, and say so on the settings screen ({@link ReleaseCheck}). It's the settings entry's own
     * switch rather than a patch's, so every build has it ({@link PatchFamily#ENTRY_SWITCHES}). Off
     * by default, and a settings file never carries it: a file shouldn't be able to put a phone
     * online.
     */
    public static final BooleanSetting CHECK_FOR_RELEASES =
            new BooleanSetting("hushtumblr_check_releases", FALSE);
}
