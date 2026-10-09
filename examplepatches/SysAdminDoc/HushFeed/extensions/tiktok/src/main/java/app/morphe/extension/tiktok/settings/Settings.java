/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/Settings.java
 * Mirror, since GitHub blocks the original: https://gitlab.com/ReVanced/revanced-patches/-/blob/main/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/Settings.java
 */

package app.morphe.extension.tiktok.settings;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;

import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.FloatSetting;
import app.morphe.extension.shared.settings.IntegerSetting;
import app.morphe.extension.shared.settings.Setting;

import app.morphe.extension.tiktok.offline.CustomOfflineVideosLimitPatch;
import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.tiktok.feedfilter.FeedRuleLimits;
import app.morphe.extension.tiktok.interaction.GestureActions;
import app.morphe.extension.tiktok.navigation.BottomNavigationTabOptions;
import app.morphe.extension.tiktok.navigation.NavigationTabOptions;

import java.util.Collections;

public class Settings extends BaseSettings {
    /** Backstop for direct writes and both settings-import formats. */
    private static final class FeedRuleStringSetting extends StringSetting {
        private final boolean creatorList;

        FeedRuleStringSetting(String key, boolean creatorList) {
            super(key, "");
            this.creatorList = creatorList;
        }

        @Override
        protected String coerce(String newValue) {
            return creatorList ? FeedRuleLimits.requireCreators(newValue)
                    : FeedRuleLimits.requireCaption(newValue);
        }
    }

    public static final BooleanSetting REGION_SPOOF = new BooleanSetting(
            "region_spoof",
            FALSE,
            true,
            // Not Setting.parent(SIM_SPOOF): that switch is declared further down this file and
            // a static initializer cannot read it yet. Naming it inside the methods is the same
            // dependency, read when it is asked for rather than when this line runs. The order
            // of the declarations is what a settings backup writes its keys in, so it stays.
            new Setting.Availability() {
                @Override public boolean isAvailable() {
                    return SIM_SPOOF.savedValue();
                }

                @Override public java.util.List<Setting<?>> getParentSettings() {
                    return java.util.Collections.singletonList(SIM_SPOOF);
                }
            }
    );
    public static final BooleanSetting REGION_STORE_SPOOF = new BooleanSetting(
            "region_store_spoof",
            FALSE,
            true,
            // Both switches, and the row names the one to turn on: Match locale while it is off,
            // which is itself greyed until Override SIM details is on, so a reader is never sent
            // two steps back; Override SIM details when Match locale is on and SIM is the one
            // off. Naming Match locale then sent the reader to a switch that was already on.
            new Setting.Availability() {
                @Override public boolean isAvailable() {
                    return SIM_SPOOF.savedValue() && REGION_SPOOF.savedValue();
                }

                @Override public java.util.List<Setting<?>> getParentSettings() {
                    return java.util.Collections.singletonList(REGION_SPOOF.savedValue() ? SIM_SPOOF : REGION_SPOOF);
                }
            }
    );
    // The same two switches as the store row, and the row names the one to turn on the same way.
    public static final BooleanSetting REGION_REQUEST_SPOOF = new BooleanSetting(
            "region_request_spoof",
            FALSE,
            true,
            new Setting.Availability() {
                @Override public boolean isAvailable() {
                    return SIM_SPOOF.savedValue() && REGION_SPOOF.savedValue();
                }

                @Override public java.util.List<Setting<?>> getParentSettings() {
                    return java.util.Collections.singletonList(REGION_SPOOF.savedValue() ? SIM_SPOOF : REGION_SPOOF);
                }
            }
    );
    public static final BooleanSetting FOLDABLE_SPLIT_VIEW = new BooleanSetting("foldable_split_view", FALSE, true);
    public static final IntegerSetting FOLDABLE_SPLIT_VIEW_MIN_WIDTH_DP = new IntegerSetting("foldable_split_view_min_width_dp", 600, true).withRange(320, 1600);
    public static final BooleanSetting DOWNLOAD_SUBTITLES = new BooleanSetting("download_subtitles", FALSE);
    // Each value below is read only while the switch above it is on, so its row greys with it
    // and says which switch to turn on, instead of taking a choice that does nothing.
    public static final StringSetting SUBTITLE_LANGUAGE = new StringSetting(
            "subtitle_language", "original", false, Setting.parent(DOWNLOAD_SUBTITLES));
    public static final IntegerSetting CAPTION_TEXT_SIZE =
            new IntegerSetting("caption_text_size", 0).withRange(0, 48);
    public static final StringSetting CAPTION_BACKGROUND = new StringSetting("caption_background", "default");
    public static final BooleanSetting KEEP_CAPTIONS_CLEAR_DISPLAY = new BooleanSetting("keep_captions_clear_display", FALSE);
    public static final BooleanSetting ALLOW_SCREEN_CAPTURE = new BooleanSetting("allow_screen_capture", FALSE, true);
    public static final BooleanSetting SYSTEM_FONT = new BooleanSetting("system_font", FALSE, true);
    public static final BooleanSetting SYSTEM_EMOJI = new BooleanSetting("system_emoji", FALSE, true);
    // On once the patch is picked: it's out of the default selection, so picking it is the ask.
    public static final BooleanSetting TURN_OFF_HAPTICS = new BooleanSetting("turn_off_haptics", TRUE);
    public static final BooleanSetting TURN_OFF_SCREEN_TRANSITIONS =
            new BooleanSetting("turn_off_screen_transitions", TRUE);
    public static final BooleanSetting AUTOMATIC_CLEAR_DISPLAY = new BooleanSetting("automatic_clear_display", FALSE);
    public static final IntegerSetting AUTOMATIC_CLEAR_DISPLAY_DELAY =
            new IntegerSetting("automatic_clear_display_delay", 1000, false,
                    Setting.parent(AUTOMATIC_CLEAR_DISPLAY)).withRange(0, 30000);
    public static final StringSetting PLAYBACK_QUALITY = new StringSetting("playback_quality", "auto");
    public static final StringSetting PLAYBACK_QUALITY_METERED = new StringSetting("playback_quality_metered", "off");
    public static final BooleanSetting PLAY_SDR = new BooleanSetting("play_sdr", FALSE);
    public static final BooleanSetting PREFER_H264 = new BooleanSetting("prefer_h264", FALSE);
    public static final StringSetting DOWNLOAD_VIDEO_QUALITY = new StringSetting("download_video_quality", "auto");
    public static final BooleanSetting DOWNLOAD_ORIGINAL_PHOTOS = new BooleanSetting("download_original_photos", FALSE);
    public static final BooleanSetting DOWNLOAD_PHOTOS_AS_VIDEO = new BooleanSetting("download_photos_as_video", FALSE);
    public static final IntegerSetting PHOTO_VIDEO_SECONDS = new IntegerSetting("photo_video_seconds", 3, false,
            Setting.parent(DOWNLOAD_PHOTOS_AS_VIDEO)).withRange(1, 10);
    public static final BooleanSetting DOWNLOAD_AUDIO_TRACK = new BooleanSetting("download_audio_track", FALSE);
    /** TikTok's watermarked copy saved when the clean file can't be fetched, instead of nothing. */
    public static final BooleanSetting DOWNLOAD_WATERMARK_FALLBACK = new BooleanSetting("download_watermark_fallback", FALSE);
    /** The video's cover, at the largest size it comes in, saved with each Download. */
    public static final BooleanSetting DOWNLOAD_COVER = new BooleanSetting("download_cover", FALSE);
    public static final BooleanSetting DOWNLOAD_WITHOUT_SOUND =
            new BooleanSetting("download_without_sound", FALSE);
    public static final BooleanSetting DOWNLOAD_PROGRESS = new BooleanSetting("download_progress", false);
    public static final BooleanSetting DOWNLOAD_DETAILS = new BooleanSetting("download_details", FALSE);
    /** The details file as JSON rather than plain text. */
    public static final BooleanSetting DOWNLOAD_DETAILS_JSON = new BooleanSetting(
            "download_details_json", FALSE, false, Setting.parent(DOWNLOAD_DETAILS));
    /** The caption, creator, date and link written into the saved MP4 as tags players read. */
    public static final BooleanSetting DOWNLOAD_TAGS = new BooleanSetting("download_tags", FALSE);
    public static final BooleanSetting CHECK_SAVED_VIDEOS = new BooleanSetting("check_saved_videos", FALSE);
    /** A check mark on profile grids for videos in the record the check above keeps. */
    public static final BooleanSetting MARK_SAVED_VIDEOS = new BooleanSetting(
            "mark_saved_videos", FALSE, false, Setting.parent(CHECK_SAVED_VIDEOS));
    public static final StringSetting EXTERNAL_DOWNLOADER_PACKAGE =
            new StringSetting("external_downloader_package", "");
    /** The only package whose documented intent extras Hushfeed knows how to request. */
    public static final String YTDLNIS_PACKAGE_NAME = "com.deniscerri.ytdl";
    private static final Setting.Availability YTDLNIS_ONLY = new Setting.Availability() {
        @Override
        public boolean isAvailable() {
            return YTDLNIS_PACKAGE_NAME.equals(EXTERNAL_DOWNLOADER_PACKAGE.savedValue().trim());
        }

        @Override
        public java.util.List<Setting<?>> getParentSettings() {
            return Collections.singletonList(EXTERNAL_DOWNLOADER_PACKAGE);
        }
    };
    public static final StringSetting YTDLNIS_DOWNLOAD_TYPE = new StringSetting(
            "ytdlnis_download_type", "video", false, YTDLNIS_ONLY);
    public static final BooleanSetting YTDLNIS_BACKGROUND = new BooleanSetting(
            "ytdlnis_background", FALSE, false, YTDLNIS_ONLY);
    public static final StringSetting DOWNLOAD_STICKER_FORMAT = new StringSetting("download_sticker_format", "mp4");
    public static final BooleanSetting SAVE_PROFILE_PICTURE = new BooleanSetting("save_profile_picture", FALSE);
    public static final BooleanSetting SAVE_STORY = new BooleanSetting("save_story", FALSE);
    public static final StringSetting DOUBLE_TAP_ACTION = new StringSetting("double_tap_action", "default");
    public static final StringSetting LONG_PRESS_ACTION = new StringSetting("long_press_action", "default");
    /**
     * A long press on a side button plays at the hold speed only while TikTok's hold can start
     * there: the Long press row leaves the press to TikTok, and Seek from the edges isn't seeking
     * the right third, where the buttons sit. GestureActions.allowNativeEdgeSpeedup decides each
     * press the same way.
     */
    private static final Setting.Availability RAIL_HOLD_POSSIBLE = new Setting.Availability() {
        @Override
        public boolean isAvailable() {
            return !GestureActions.takesLongPress(LONG_PRESS_ACTION.savedValue())
                    && !(EDGE_SEEK.savedValue() && EDGE_SEEK_SECONDS.savedValue() > 0);
        }
    };
    /** A long press on Comment plays at the hold speed instead of opening the emoji row. */
    public static final BooleanSetting RAIL_HOLD_COMMENT =
            new BooleanSetting("rail_hold_comment", FALSE, RAIL_HOLD_POSSIBLE);
    /** A long press on Share plays at the hold speed instead of opening the quick share row. */
    public static final BooleanSetting RAIL_HOLD_SHARE =
            new BooleanSetting("rail_hold_share", FALSE, RAIL_HOLD_POSSIBLE);
    /** A long press on Favorites plays at the hold speed instead of offering a new collection. */
    public static final BooleanSetting RAIL_HOLD_FAVORITES =
            new BooleanSetting("rail_hold_favorites", FALSE, RAIL_HOLD_POSSIBLE);
    /** What a left swipe on a feed video does: TikTok's creator profile, nothing, or the comments. */
    public static final StringSetting SWIPE_LEFT_ACTION = new StringSetting("swipe_left_action", "default");
    public static final BooleanSetting EDGE_SEEK = new BooleanSetting("edge_seek", FALSE);
    /**
     * A vertical drag along the left edge of a feed video changes the window's brightness and along
     * the right edge the music volume. Off by default; a drag starting anywhere else is untouched.
     */
    public static final BooleanSetting SWIPE_LEVELS = new BooleanSetting("swipe_levels", FALSE);
    /** How wide each edge strip is, as a percent of the screen width. */
    public static final IntegerSetting SWIPE_LEVELS_STRIP_PERCENT =
            new IntegerSetting("swipe_levels_strip_percent", 15, false, Setting.parent(SWIPE_LEVELS)).withRange(5, 30);
    /**
     * What a drag along each edge strip changes: "brightness", "volume" or "speed" (the playing
     * video's speed, which needs the Playback speed patch). The left strip starts on brightness and
     * the right on volume, which is what the switch did before the strips could be chosen.
     */
    public static final StringSetting SWIPE_LEVELS_LEFT =
            new StringSetting("swipe_levels_left", "brightness", false, Setting.parent(SWIPE_LEVELS));
    public static final StringSetting SWIPE_LEVELS_RIGHT =
            new StringSetting("swipe_levels_right", "volume", false, Setting.parent(SWIPE_LEVELS));
    public static final BooleanSetting FIT_VIDEO_TO_SCREEN =
            new BooleanSetting("fit_video_to_screen", FALSE);
    /** The opposite: crop the video until it covers the window (issue #29). Fit wins when both are on. */
    public static final BooleanSetting FILL_VIDEO_TO_SCREEN =
            new BooleanSetting("fill_video_to_screen", FALSE);
    public static final BooleanSetting UNCAP_REFRESH_RATE =
            new BooleanSetting("uncap_refresh_rate", FALSE);
    /** Keep playing in the background (#52). TikTok reads its gate once a process, so a restart applies it. */
    public static final BooleanSetting BACKGROUND_PLAY = new BooleanSetting("background_play", FALSE, true);
    public static final BooleanSetting HIDE_LAUNCHER_SHORTCUTS =
            new BooleanSetting("hide_launcher_shortcuts", FALSE);
    /**
     * On by default: the setup runs before anyone can reach this switch, so picking the patch is
     * the choice. Off brings the screens back the next time TikTok runs its setup.
     */
    public static final BooleanSetting SKIP_FIRST_LAUNCH_SETUP =
            new BooleanSetting("skip_first_launch_setup", TRUE);
    /**
     * Whether {@link #HIDE_LAUNCHER_SHORTCUTS} has taken the launcher shortcuts away and not yet
     * put them back. No row of its own: it is how turning that switch back off knows there is
     * something to ask TikTok to rebuild, rather than asking on behalf of somebody who never
     * turned it on. Kept out of import and export for the same reason. It describes what happened
     * on one phone, and restoring it onto another would have that phone ask TikTok to rebuild
     * shortcuts nothing had removed.
     */
    public static final BooleanSetting LAUNCHER_SHORTCUTS_REMOVED =
            new BooleanSetting("launcher_shortcuts_removed", FALSE, false, false);
    public static final BooleanSetting ALLOW_DUET_AND_STITCH =
            new BooleanSetting("allow_duet_and_stitch", FALSE);
    public static final BooleanSetting HIDE_FOLLOWER_NOTIFICATIONS =
            new BooleanSetting("hide_follower_notifications", FALSE);
    /**
     * Notification controls' push switch: no push setup at launch, nothing in the drawer but
     * ongoing notifications, and no wake locks but the kept ones. Push setup is a startup task,
     * so a change waits for the next launch. See PushShutoff.
     */
    public static final BooleanSetting TURN_OFF_PUSH_NOTIFICATIONS =
            new BooleanSetting("turn_off_push_notifications", FALSE, true);
    /** TikTok's "Videos you might like" pushes. On by default: they're promotion, not people. */
    public static final BooleanSetting BLOCK_SUGGESTED_VIDEO_NOTIFICATIONS =
            new BooleanSetting("block_suggested_video_notifications", TRUE);
    public static final BooleanSetting HIDE_MESSAGE_STREAKS =
            new BooleanSetting("hide_message_streaks", FALSE);
    /**
     * Dispatches one message per selected chat a day at {@link #AUTO_STREAK_MINUTE},
     * so a streak with them keeps going on a day nobody opens the app. Off by default. See
     * AutoStreak.
     */
    public static final BooleanSetting AUTO_STREAK = new BooleanSetting("auto_streak", FALSE);
    /** Handles or profile links, separated by commas or lines. */
    public static final StringSetting AUTO_STREAK_RECIPIENT =
            new StringSetting("auto_streak_recipient", "", false, Setting.parent(AUTO_STREAK));
    /** The time of day to send, in minutes after midnight. Noon leaves room for retries. */
    public static final IntegerSetting AUTO_STREAK_MINUTE = new IntegerSetting(
            "auto_streak_minute", 12 * 60, false, Setting.parent(AUTO_STREAK)).withRange(0, 24 * 60 - 1);
    public static final StringSetting AUTO_STREAK_MESSAGE = new StringSetting(
            "auto_streak_message", "🔥", false, Setting.parent(AUTO_STREAK));
    /**
     * Per-account recipient dispatch reservations and retries. Kept out
     * of backups: it describes one phone's sends, and a restore that carried it could stop
     * today's message on another phone or send a second one.
     */
    public static final StringSetting AUTO_STREAK_STATE =
            new StringSetting("auto_streak_state", "", false, false);
        // Zero is meaningful, and the dialog takes it: it turns edge seeking off on its own.
    public static final IntegerSetting EDGE_SEEK_SECONDS =
            new IntegerSetting("edge_seek_seconds", 5, false, Setting.parent(EDGE_SEEK)).withRange(0, 60);
    public static final BooleanSetting CONFIRM_FOLLOW = new BooleanSetting("confirm_follow", FALSE);
    public static final BooleanSetting CONFIRM_LIKE = new BooleanSetting("confirm_like", FALSE);
    public static final BooleanSetting CONFIRM_COMMENT_LIKE = new BooleanSetting("confirm_comment_like", FALSE);
    public static final BooleanSetting CONFIRM_STORY_LIKE = new BooleanSetting("confirm_story_like", FALSE);
    public static final BooleanSetting CONFIRM_QUICK_REPOST = new BooleanSetting("confirm_quick_repost", FALSE);
    public static final StringSetting BLOCKED_CAPTION_WORDS =
            new FeedRuleStringSetting("blocked_caption_words", false);
    public static final BooleanSetting BLOCKED_WORDS_IN_STICKERS = new BooleanSetting("blocked_words_in_stickers", FALSE);
    public static final StringSetting BLOCKED_CREATORS =
            new FeedRuleStringSetting("blocked_creators", true);
    public static final StringSetting LOCAL_HIDDEN_CREATORS =
            new FeedRuleStringSetting("local_hidden_creators", true);
    public static final StringSetting CREATOR_FILTER_EXCEPTIONS =
            new FeedRuleStringSetting("creator_filter_exceptions", true);
    public static final StringSetting REGION_ONLY_FROM = new StringSetting("region_only_from", "", true);
    /** Caption languages to keep, by the video's original caption track; empty keeps every language. */
    public static final StringSetting CAPTION_LANGUAGES = new StringSetting("caption_languages", "");
    public static final StringSetting REGION_NEVER_FROM = new StringSetting("region_never_from", "", true);
    public static final IntegerSetting MAX_VIDEO_SECONDS =
            new IntegerSetting("max_video_seconds", 0).withRange(0, 86400);
    public static final IntegerSetting MAX_PUBLICATION_AGE_DAYS =
            new IntegerSetting("max_publication_age_days", 0).withRange(0, 3650);
    public static final IntegerSetting MAX_VIEWS_PER_LIKE =
            new IntegerSetting("max_views_per_like", 0).withRange(0, 1000000);
    public static final IntegerSetting MAX_VIEWS_PER_COMMENT =
            new IntegerSetting("max_views_per_comment", 0).withRange(0, 1000000);
    public static final BooleanSetting HIDE_PROMOTIONAL_MUSIC = new BooleanSetting("hide_promotional_music", FALSE);
    public static final BooleanSetting HIDE_LIVE_REPLAYS = new BooleanSetting("hide_live_replays", FALSE);
    public static final BooleanSetting HIDE_UNPERSONALIZED_FOR_YOU = new BooleanSetting("hide_unpersonalized_for_you", FALSE);
    /** Read on every Friends tab response, so it applies from the next page on. */
    public static final BooleanSetting FRIENDS_MUTUALS_ONLY = new BooleanSetting("friends_mutuals_only", FALSE);
    public static final BooleanSetting HIDE_SHARE_CHANNELS = new BooleanSetting("hide_share_channels", FALSE);
    public static final BooleanSetting HIDE_SHARE_ACTIONS = new BooleanSetting("hide_share_actions", FALSE);
    public static final BooleanSetting REMOVE_ADS = new BooleanSetting("remove_ads", TRUE, true);
    public static final BooleanSetting HIDE_LIVE = new BooleanSetting("hide_live", FALSE, true);
    public static final BooleanSetting HIDE_SHOP = new BooleanSetting("hide_shop", FALSE, true);
    /** TikTok Shop cards in search results: the Products block and single product cards (issue #21). */
    public static final BooleanSetting HIDE_SEARCH_SHOP = new BooleanSetting("hide_search_shop", FALSE);
    public static final BooleanSetting HIDE_STORY = new BooleanSetting("hide_story", FALSE, true);
    public static final BooleanSetting HIDE_IMAGE = new BooleanSetting("hide_image", FALSE, true);
    public static final BooleanSetting HIDE_CAPTCHA_POPUPS = new BooleanSetting("hide_captcha_popups", FALSE, true);
    public static final BooleanSetting HIDE_HOMEPAGE_COIN = new BooleanSetting("hide_homepage_coin", FALSE, true);
    public static final BooleanSetting HIDE_PROFILE_REWARDS_SHORTCUT =
            new BooleanSetting("hide_profile_rewards_shortcut", FALSE);
    public static final StringSetting MIN_MAX_VIEWS = new StringSetting("min_max_views", "0-" + Long.MAX_VALUE, true);
    public static final StringSetting MIN_MAX_LIKES = new StringSetting("min_max_likes", "0-" + Long.MAX_VALUE, true);
    public static final StringSetting MIN_MAX_COMMENTS = new StringSetting("min_max_comments", "0-" + Long.MAX_VALUE, true);
    public static final StringSetting MIN_MAX_FAVOURITES = new StringSetting("min_max_favourites", "0-" + Long.MAX_VALUE, true);
    public static final StringSetting MIN_MAX_SHARES = new StringSetting("min_max_shares", "0-" + Long.MAX_VALUE, true);
    public static final BooleanSetting HIDE_OFFLINE_VIDEOS = new BooleanSetting("hide_offline_videos", FALSE);
    /** Moot while the switch above takes every offline video out. */
    public static final BooleanSetting FILTER_OFFLINE_FALLBACK_VIDEOS = new BooleanSetting(
            "filter_cached_offline_videos",
            TRUE,
            true,
            Setting.parentNot(HIDE_OFFLINE_VIDEOS)
    );
    public static final BooleanSetting FILTERED_COUNT_PILL = new BooleanSetting("feed_filter_count_pill", FALSE);
    public static final BooleanSetting FEED_NAVIGATION = new BooleanSetting("feed_navigation", FALSE, true);
    public static final StringSetting FEED_NAVIGATION_TABS = new StringSetting(
            "feed_navigation_tabs",
            NavigationTabOptions.defaultEnabledKeys(),
            true,
            Setting.parent(FEED_NAVIGATION)
    );
    public static final BooleanSetting FEED_NAVIGATION_BLOCK_NEW_TABS = new BooleanSetting(
            "feed_navigation_block_new_tabs",
            FALSE,
            true,
            Setting.parent(FEED_NAVIGATION)
    );
    public static final StringSetting FEED_NAVIGATION_OBSERVED_TABS = new StringSetting(
            "feed_navigation_observed_tabs",
            NavigationTabOptions.HOT,
            false,
            false
    );
    public static final BooleanSetting BOTTOM_NAVIGATION = new BooleanSetting("bottom_navigation", FALSE, true);
    public static final StringSetting BOTTOM_NAVIGATION_TABS = new StringSetting(
            "bottom_navigation_tabs",
            BottomNavigationTabOptions.defaultEnabledKeys(),
            true,
            Setting.parent(BOTTOM_NAVIGATION)
    );
    public static final BooleanSetting BOTTOM_NAVIGATION_BLOCK_NEW_TABS = new BooleanSetting(
            "bottom_navigation_block_new_tabs",
            FALSE,
            true,
            Setting.parent(BOTTOM_NAVIGATION)
    );
    public static final StringSetting BOTTOM_NAVIGATION_OBSERVED_TABS = new StringSetting(
            "bottom_navigation_observed_tabs",
            BottomNavigationTabOptions.HOME,
            false,
            false
    );
    /** The red count on Inbox and the dot on Profile, the pull that reopens the app. */
    public static final BooleanSetting HIDE_TAB_BADGES = new BooleanSetting("hide_tab_badges", FALSE, true);
    /** The names under the bottom tab icons, and a name of the user's own for each; empty keeps TikTok's. Read before each frame. */
    public static final BooleanSetting HIDE_BOTTOM_TAB_LABELS = new BooleanSetting("hide_bottom_tab_labels", FALSE);
    public static final StringSetting BOTTOM_TAB_NAME_HOME = new StringSetting("bottom_tab_name_home", "");
    public static final StringSetting BOTTOM_TAB_NAME_FRIENDS = new StringSetting("bottom_tab_name_friends", "");
    public static final StringSetting BOTTOM_TAB_NAME_INBOX = new StringSetting("bottom_tab_name_inbox", "");
    public static final StringSetting BOTTOM_TAB_NAME_PROFILE = new StringSetting("bottom_tab_name_profile", "");
    public static final StringSetting BOTTOM_TAB_NAME_SHOP = new StringSetting("bottom_tab_name_shop", "");
    public static final BooleanSetting KEEP_FOR_YOU_ON_TAB_TAP = new BooleanSetting("keep_for_you_on_tab_tap", FALSE);
    public static final BooleanSetting KEEP_FOR_YOU_ON_PULL_DOWN = new BooleanSetting("keep_for_you_on_pull_down", FALSE);
    /** A long press on the Home tab opens Hushfeed's settings (#45). TikTok gives that press nothing of its own. */
    public static final BooleanSetting HOME_TAB_OPENS_SETTINGS = new BooleanSetting("home_tab_opens_settings", TRUE);
    /** The tab TikTok opens on from its icon: tiktok (its own pick), for_you, following, friends, inbox or profile. */
    public static final StringSetting START_PAGE = new StringSetting("start_page", "tiktok");
    /** TikTok's previous, pause and next buttons on the feed, shown without a screen reader. Off by default. */
    public static final BooleanSetting SHOW_FEED_BUTTONS = new BooleanSetting("show_feed_buttons", FALSE);
    public static final BooleanSetting HIDE_TAKO_AI = new BooleanSetting("hide_tako_ai", FALSE, true);
    public static final BooleanSetting HIDE_BOTTOM_SEARCH_BAR = new BooleanSetting("hide_bottom_search_bar", FALSE, true);
    public static final BooleanSetting COMMENT_BATCH_TRANSLATION = new BooleanSetting("comment_batch_translation", FALSE);
    // Restart-gated: the comment keyboard builds its slot tree once per session, and the
    // trigger that adds the emoji row is asked at that moment only.
    public static final BooleanSetting HIDE_COMMENT_QUICK_REACTIONS =
            new BooleanSetting("hide_comment_quick_reactions", FALSE, true);
    public static final StringSetting DOWNLOAD_PATH = new StringSetting("down_path", "DCIM/TikTok");
    public static final StringSetting DOWNLOAD_VIDEO_PATH = new StringSetting("download_video_path", "DCIM/TikTok");
    public static final StringSetting DOWNLOAD_PHOTO_PATH = new StringSetting("download_photo_path", "DCIM/TikTok");
    public static final StringSetting DOWNLOAD_STICKER_PATH = new StringSetting("download_sticker_path", "DCIM/TikTok");
    private static final BooleanSetting DOWNLOAD_PATHS_MIGRATED = new BooleanSetting(
            "download_paths_migrated",
            FALSE,
            false,
            false
    );
    public static final StringSetting DOWNLOAD_VIDEO_FILENAME_TEMPLATE = new StringSetting(
            "download_video_filename_template",
            "{creator}_{date}_{video_id}"
    );
    public static final StringSetting DOWNLOAD_PHOTO_FILENAME_TEMPLATE = new StringSetting(
            "download_photo_filename_template",
            "{creator}_{date}_{video_id}_{index}"
    );
    public static final StringSetting DOWNLOAD_COMMENT_MEDIA_FILENAME_TEMPLATE = new StringSetting(
            "download_comment_media_filename_template",
            "comment_{date}_{media_id}"
    );
    public static final BooleanSetting REMOVE_DOWNLOAD_WATERMARK = new BooleanSetting("down_watermark", TRUE);
    public static final BooleanSetting CUSTOM_OFFLINE_VIDEOS = new BooleanSetting("custom_offline_videos", FALSE, true);
    public static final IntegerSetting CUSTOM_OFFLINE_VIDEO_LIMIT = new IntegerSetting(
            "custom_offline_video_limit",
            500,
            true,
            Setting.parent(CUSTOM_OFFLINE_VIDEOS)
    ).withRange(CustomOfflineVideosLimitPatch.MIN_LIMIT, CustomOfflineVideosLimitPatch.MAX_LIMIT);
    /** Offline videos stay until you clear them, instead of expiring after TikTok's lifetime (#123). */
    public static final BooleanSetting KEEP_OFFLINE_VIDEOS = new BooleanSetting("keep_offline_videos", FALSE, true);
    public static final BooleanSetting SHOW_SEEKBAR = new BooleanSetting("show_seekbar", TRUE);
    public static final BooleanSetting SHOW_SEEKBAR_THUMBNAIL = new BooleanSetting(
            "show_seekbar_thumbnail",
            TRUE
    );
    public static final BooleanSetting STOP_VIDEO_LOOPING = new BooleanSetting("stop_video_looping", FALSE, true);
    /** Keeps the full-screen viewer on a video when it ends; the Stay on the video in full screen patch. */
    public static final BooleanSetting FULL_SCREEN_HOLD = new BooleanSetting("full_screen_hold", FALSE, true);
    /** Replays a story instead of moving on when it ends; the Story controls patch. */
    public static final BooleanSetting STORY_LOOP = new BooleanSetting("story_loop", FALSE, true);
    /** Keeps a photo story on screen until you tap or swipe; the Story controls patch. */
    public static final BooleanSetting STORY_PHOTO_HOLD = new BooleanSetting("story_photo_hold", FALSE, true);
    /**
     * Keeps a LIVE preview in the feed from counting down into the room; the LIVE controls patch.
     * Read each time a preview would start its countdown, so no restart.
     */
    public static final BooleanSetting STOP_LIVE_AUTO_ENTER = new BooleanSetting("stop_live_auto_enter", FALSE);
    /**
     * Shows a LIVE's exact viewer count in its room instead of TikTok's rounded one; the LIVE
     * controls patch. Read each time the count is drawn, so no restart.
     */
    public static final BooleanSetting SHOW_EXACT_LIVE_VIEWERS = new BooleanSetting("show_exact_live_viewers", FALSE);
    /**
     * Plays the audio TikTok mutes on a post whose sound was pulled; the Keep pulled sounds
     * patch. Read as each video starts, so no restart.
     */
    public static final BooleanSetting KEEP_PULLED_SOUNDS = new BooleanSetting("keep_pulled_sounds", FALSE);
    /**
     * Keeps the playing video going in a small window when the reader leaves TikTok; the
     * Picture-in-picture patch. Read as the reader leaves, so no restart.
     */
    public static final BooleanSetting PICTURE_IN_PICTURE = new BooleanSetting("picture_in_picture", FALSE);
    public static final BooleanSetting RESUME_VIDEO_AFTER_SCROLL = new BooleanSetting(
            "resume_video_after_scroll",
            TRUE,
            true
    );
    public static final BooleanSetting OPEN_EXTERNAL_LINKS = new BooleanSetting("open_external_links", TRUE);
    public static final BooleanSetting ALWAYS_SHOW_PUBLISH_DATE = new BooleanSetting("always_show_publish_date", TRUE, true);
    public static final BooleanSetting PUBLISH_DATE_EXACT_TIME = new BooleanSetting("publish_date_exact_time", FALSE);
    public static final BooleanSetting PUBLISH_DATE_ON_GRID = new BooleanSetting("publish_date_on_grid", FALSE);
    public static final BooleanSetting SHOW_EXACT_COUNTS = new BooleanSetting("show_exact_counts", FALSE);
    public static final BooleanSetting CLEAR_DISPLAY = new BooleanSetting("clear_display", FALSE);
    public static final BooleanSetting COPY_COMMENTS_WITHOUT_USERNAME = new BooleanSetting("copy_comments_without_username", TRUE);
    public static final FloatSetting REMEMBERED_SPEED = new FloatSetting("remembered_speed_v2", 1.0f);
    public static final BooleanSetting REMEMBER_SPEED = new BooleanSetting("remember_playback_speed", TRUE);
    public static final BooleanSetting DEFAULT_SPEED_ENABLED = new BooleanSetting("default_speed_enabled", FALSE);
    public static final StringSetting DEFAULT_SPEED = new StringSetting(
            "default_speed", "1.5", false, Setting.parent(DEFAULT_SPEED_ENABLED));
    public static final StringSetting CUSTOM_SPEEDS = new StringSetting("custom_speeds", "", true);
    /** The speed the hold gesture plays at and its pull-down lock keeps; TikTok's own is 2x (upstream #52). */
    public static final StringSetting HOLD_SPEED = new StringSetting("hold_speed", "2");
    public static final BooleanSetting AUTO_ADVANCE = new BooleanSetting("auto_advance", FALSE, true);
    public static final IntegerSetting AUTO_ADVANCE_LIMIT = new IntegerSetting(
            "auto_advance_limit", 0, false, Setting.parent(AUTO_ADVANCE)).withRange(0, 1000);
    /**
     * Takes TikTok's own Auto scroll action out of the video panel (upstream #116). The patch
     * surfaces that action for accounts outside its rollout; a reader who only wants advance on
     * end has no use for it, and it read as a second, unexplained switch.
     */
    public static final BooleanSetting AUTO_ADVANCE_HIDE_PANEL_ACTION = new BooleanSetting(
            "auto_advance_hide_panel_action", FALSE, false, Setting.parent(AUTO_ADVANCE));
    /**
     * Answers yes to TikTok's search_auto_scroll flag. Search results get auto scroll from that
     * flag rather than the For You one, and their feed runs the same component Auto-advance starts.
     */
    public static final BooleanSetting AUTO_ADVANCE_SEARCH = new BooleanSetting(
            "auto_advance_search", FALSE, true, Setting.parent(AUTO_ADVANCE));
    /**
     * Quietens the feed while a comment sheet is open, and gives the sound back when it closes.
     * Off by default.
     */
    public static final BooleanSetting PAUSE_ON_COMMENTS = new BooleanSetting(
            "pause_on_comments", FALSE, true);
    /**
     * Holds the feed on returning to the app until the reader taps. Off by default. TikTok
     * starts playing again by itself on every return, which is the one moment nobody has asked
     * for anything.
     */
    public static final BooleanSetting NO_RESUME_ON_FOREGROUND = new BooleanSetting(
            "no_resume_on_foreground", FALSE, true);
    /**
     * Holds the first feed video of a start from the launcher until the reader taps, once per
     * start (#83). Off by default. A link, a notification or a shortcut opens what it was for.
     */
    public static final BooleanSetting PAUSE_FIRST_VIDEO = new BooleanSetting(
            "pause_first_video", FALSE, true);
    /**
     * Keep a paused video paused. It reads the player in the pre-pause callback, which arrived in
     * Android 10, so older versions have nothing to read it by and the row is greyed there.
     */
    public static final BooleanSetting KEEP_PAUSED_ON_RETURN = new BooleanSetting("keep_paused_on_return", FALSE,
            new Setting.Availability() {
                @Override public boolean isAvailable() {
                    return android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.Q;
                }
            });
    /**
     * Sends TikTok to the background when TikTok's own daily screen-time reminder comes up,
     * instead of leaving the reminder there to be dismissed. Off by default, read at show
     * time, and it needs a daily limit set under TikTok's own Time and well-being settings
     * to have anything to react to.
     */
    public static final BooleanSetting LEAVE_ON_REST_REMINDER = new BooleanSetting(
            "leave_on_rest_reminder", FALSE);
    /**
     * A daily budget for the feed, off at zero. The two counts are independent of
     * {@link #AUTO_ADVANCE_LIMIT}, which only ever counted videos Hushfeed itself advanced past.
     */
    public static final IntegerSetting SESSION_BUDGET_VIDEOS = new IntegerSetting(
            "session_budget_videos", 0).withRange(0, 2000);
    public static final IntegerSetting SESSION_BUDGET_MINUTES = new IntegerSetting(
            "session_budget_minutes", 0).withRange(0, 600);
    public static final IntegerSetting SESSION_BUDGET_LOCK_MINUTES = new IntegerSetting(
            "session_budget_lock_minutes", 0).withRange(0, 720);
    public static final IntegerSetting SESSION_BUDGET_RESET_HOUR = new IntegerSetting(
            "session_budget_reset_hour", 4).withRange(0, 23);
    /**
     * Turns the budget from advice into a commitment. Off by default, and while it is off
     * nothing about the budget changes. Switched on, the hold that starts when today's budget
     * runs out lasts until the reset hour, the way out of it is gone, and the budget, the reset
     * hour and this switch itself cannot be changed again until the day turns over. It can be
     * switched off freely at any time before the budget is spent.
     */
    public static final BooleanSetting SESSION_BUDGET_LOCK = new BooleanSetting(
            "session_budget_lock", FALSE, true);
    /**
     * How many times the hold may be opened in one day. Zero means no cap, which is what the
     * hold has always done, and the setting sits between that and {@link #SESSION_BUDGET_LOCK},
     * which takes the way out away entirely. Ignored while the lock is on, because there is then
     * nothing to cap.
     */
    public static final IntegerSetting SESSION_BUDGET_PASSES_PER_DAY = new IntegerSetting(
            "session_budget_passes_per_day", 0).withRange(0, 20);
    /**
     * Makes a change that loosens the budget wait until the day starts over, while one that
     * tightens it applies at once. Off by default. What counts as loosening, and how a restore is
     * held to it, is in BudgetChanges.
     */
    public static final BooleanSetting SESSION_BUDGET_WAIT_TO_LOOSEN = new BooleanSetting(
            "session_budget_wait_to_loosen", FALSE);
    /**
     * The loosening changes waiting for the next day and when they apply. Kept out of backups,
     * since a backup that carried them would be a way to set tomorrow's budget today.
     */
    public static final StringSetting SESSION_BUDGET_PENDING =
            new StringSetting("session_budget_pending", "", false, false);
    /**
     * Brings the hold in gradually instead of dropping it on the feed. Off by default, and it
     * only has anything to follow when {@link #SESSION_BUDGET_MINUTES} is set: a budget counted
     * in videos has no "how long is left" to draw a ramp from.
     */
    public static final BooleanSetting SESSION_BUDGET_RAMP = new BooleanSetting(
            "session_budget_ramp", FALSE, true);
    /**
     * Lets the video on screen finish before the hold covers the feed, with the feed's swipe
     * turned off until it does. Off by default, read when the budget runs out, and it only has
     * anything to do when a hold follows the budget. See FinishLastVideo.
     */
    public static final BooleanSetting SESSION_BUDGET_FINISH_VIDEO = new BooleanSetting(
            "session_budget_finish_video", FALSE);
    /**
     * Keeps the feed (For You, Following and the other feed tabs) behind a calm panel with its
     * swipe turned off, and leaves Inbox, profiles and search alone. Off by default. Paused,
     * every setting answers its unpatched value, so this is off then like the rest. See FeedLock.
     */
    public static final BooleanSetting FEED_LOCK = new BooleanSetting("feed_lock", FALSE);
    /**
     * A link to one video plays that video alone: the feed's swipe is turned down while it is the
     * one playing, and Auto-advance doesn't move on from it. Off by default, and off while
     * paused like the rest. See FeedLock#linkVideoAlone.
     */
    public static final BooleanSetting SHARED_VIDEO_ALONE = new BooleanSetting("shared_video_alone", FALSE);
    /**
     * A small label on the feed saying what is left of today's budget. Off by default, and it
     * has nothing to report unless {@link #SESSION_BUDGET_VIDEOS} or {@link #SESSION_BUDGET_MINUTES}
     * is set. No restart: it is drawn from the same callback that measures the budget.
     */
    public static final BooleanSetting SESSION_BUDGET_CUE = new BooleanSetting(
            "session_budget_cue", FALSE);
    /**
     * Minutes of watching between the quiet reminders, or zero for none.
     *
     * <p>The hold only ever fires once the day's budget has gone. This is the earlier check the
     * wellbeing tools that measured anything all have, and it is measured in watched minutes
     * rather than wall clock so time on messages or a profile does not count towards it.
     */
    public static final IntegerSetting SESSION_BUDGET_NOTICE_MINUTES = new IntegerSetting(
            "session_budget_notice_minutes", 0).withRange(0, 120);
    /**
     * Today's counts and any running hold, so both survive the process being killed. Kept out
     * of backups: it is a record of one day, and restoring last week's would either hand back a
     * day or take one away, neither of which anyone asked for.
     */
    public static final StringSetting SESSION_BUDGET_STATE =
            new StringSetting("session_budget_state", "", false, false);

    public static final BooleanSetting ENABLE_LONG_PRESS_SPEED_LOCK = new BooleanSetting("enable_long_press_speed_lock", FALSE, true);
    public static final BooleanSetting NOT_INTERESTED_BUTTON = new BooleanSetting("not_interested_button", FALSE);
    /**
     * Mute feed videos. Whether the feed is muted right now is the phone's state, like the volume,
     * so a backup doesn't carry it; paused, Hushfeed plays the feed with sound as TikTok would.
     */
    public static final BooleanSetting FEED_MUTED = new BooleanSetting("feed_muted", FALSE, false, false);
    public static final BooleanSetting FEED_MUTE_BUTTON = new BooleanSetting("feed_mute_button", FALSE);
    public static final BooleanSetting HIDE_FEED_CAPTION = new BooleanSetting("hide_feed_caption", FALSE);
    /** Native description and creator name, independently of spoken subtitles. Zero keeps TikTok's size. */
    public static final IntegerSetting FEED_DESCRIPTION_TEXT_SIZE =
            new IntegerSetting("feed_description_text_size", 0).withRange(0, 48);
    public static final IntegerSetting FEED_AUTHOR_TEXT_SIZE =
            new IntegerSetting("feed_author_text_size", 0).withRange(0, 48);
    public static final BooleanSetting HIDE_FEED_MUSIC = new BooleanSetting("hide_feed_music", FALSE);
    public static final BooleanSetting HIDE_FEED_ACTION_BAR = new BooleanSetting("hide_feed_action_bar", FALSE);
    public static final BooleanSetting HIDE_FEED_SURVEYS = new BooleanSetting("hide_feed_surveys", FALSE);
    /** The Footnotes banner TikTok lays over a video that carries a note. */
    public static final BooleanSetting HIDE_FOOTNOTES = new BooleanSetting("hide_footnotes", FALSE);
    /** The Add comment bar under a video opened from a profile, a hashtag or a sound, and the strip kept for it (#50). */
    public static final BooleanSetting HIDE_DETAIL_COMMENT_BAR = new BooleanSetting("hide_detail_comment_bar", FALSE);
    /** The progress bar, close button and pause/speed pill TikTok draws while Clear display is on (#97). */
    public static final BooleanSetting HIDE_CLEAR_DISPLAY_CONTROLS = new BooleanSetting("hide_clear_display_controls", FALSE);
    /**
     * How see-through the controls over the video are drawn, as a percentage: 100 leaves them as
     * TikTok draws them, lower fades the rail, caption, music row and tabs while they keep taking
     * taps, and 0 hides the rail and caption the way Clear display does (#84).
     */
    public static final IntegerSetting FADE_CONTROLS_OPACITY =
            new IntegerSetting("fade_controls_opacity", 100).withRange(0, 100);
    public static final BooleanSetting HIDE_SHARE_GUIDE = new BooleanSetting("hide_share_guide", FALSE);
    public static final BooleanSetting HIDE_RAIL_FOLLOW = new BooleanSetting("hide_rail_follow", FALSE);
    public static final BooleanSetting HIDE_RAIL_LIKE = new BooleanSetting("hide_rail_like", FALSE);
    public static final BooleanSetting HIDE_RAIL_COMMENTS = new BooleanSetting("hide_rail_comments", FALSE);
    public static final BooleanSetting HIDE_RAIL_FAVOURITE = new BooleanSetting("hide_rail_favourite", FALSE);
    public static final BooleanSetting HIDE_RAIL_MUSIC = new BooleanSetting("hide_rail_music", FALSE);
    public static final BooleanSetting HIDE_RAIL_SHARE = new BooleanSetting("hide_rail_share", FALSE);
    public static final BooleanSetting HIDE_RAIL_COUNTS = new BooleanSetting("hide_rail_counts", FALSE);
    public static final BooleanSetting HIDE_STATUS_BAR = new BooleanSetting("hide_status_bar", FALSE);
    /** LIVE rooms are an activity of their own, which Hide the status bar never reached (#38). */
    public static final BooleanSetting HIDE_STATUS_BAR_IN_LIVE = new BooleanSetting("hide_status_bar_in_live", FALSE);
    public static final StringSetting TOUCH_TARGET_SCALE = new StringSetting("touch_target_scale", "1");
    public static final BooleanSetting HIDE_SENSITIVE_WARNINGS = new BooleanSetting("hide_sensitive_warnings", FALSE);
    /** The Check sources banner on a video TikTok flags as unverified, and the share warnings that read it. */
    public static final BooleanSetting HIDE_UNVERIFIED_NOTICES = new BooleanSetting("hide_unverified_notices", FALSE);
    public static final BooleanSetting SHOW_AUTHOR_REGION = new BooleanSetting("show_author_region", FALSE);
    public static final BooleanSetting SHOW_AUTHOR_HANDLE = new BooleanSetting("show_author_handle", FALSE);
    public static final BooleanSetting SHOW_ENGAGEMENT_RATE = new BooleanSetting("show_engagement_rate", FALSE);
    public static final BooleanSetting BLOCK_AUTHOR_BUTTON =
            new BooleanSetting("block_author_button", FALSE, true);
    public static final BooleanSetting LOCAL_HIDE_BUTTON =
            new BooleanSetting("local_hide_button", FALSE);
    public static final BooleanSetting BLOCK_SOUND_BUTTON =
            new BooleanSetting("block_sound_button", FALSE);
    public static final StringSetting BLOCK_AUTHOR_BUTTON_POSITION =
            new StringSetting("block_author_button_position", "");
    public static final StringSetting LOCAL_HIDE_BUTTON_POSITION =
            new StringSetting("local_hide_button_position", "");
    public static final StringSetting BLOCK_SOUND_BUTTON_POSITION =
            new StringSetting("block_sound_button_position", "");
    public static final StringSetting NOT_INTERESTED_BUTTON_POSITION =
            new StringSetting("not_interested_button_position", "");
    public static final StringSetting FEED_MUTE_BUTTON_POSITION =
            new StringSetting("feed_mute_button_position", "");
    public static final BooleanSetting HIDE_INBOX_STORIES = new BooleanSetting("hide_inbox_stories", FALSE);
    public static final BooleanSetting HIDE_INBOX_NEW_FOLLOWERS = new BooleanSetting("hide_inbox_new_followers", FALSE);
    public static final BooleanSetting HIDE_INBOX_ACTIVITY = new BooleanSetting("hide_inbox_activity", FALSE);
    public static final BooleanSetting HIDE_INBOX_ARCHIVE = new BooleanSetting("hide_inbox_archive", FALSE);
    public static final BooleanSetting HIDE_INBOX_TAKO = new BooleanSetting("hide_inbox_tako", FALSE);
    public static final BooleanSetting HIDE_INBOX_SHOP = new BooleanSetting("hide_inbox_shop", FALSE);
    public static final BooleanSetting HIDE_INBOX_BULLETIN_BOARDS =
            new BooleanSetting("hide_inbox_bulletin_boards", FALSE);
    public static final BooleanSetting HIDE_INBOX_SUGGESTED_ACCOUNTS =
            new BooleanSetting("hide_inbox_suggested_accounts", FALSE);
    public static final BooleanSetting HIDE_INBOX_MESSAGE_REQUESTS =
            new BooleanSetting("hide_inbox_message_requests", FALSE);
    public static final BooleanSetting HIDE_INBOX_CONVERSATIONS =
            new BooleanSetting("hide_inbox_conversations", FALSE);
    public static final BooleanSetting HIDE_INBOX_ADD_PEOPLE = new BooleanSetting("hide_inbox_add_people", FALSE);
    public static final BooleanSetting HIDE_INBOX_SEARCH = new BooleanSetting("hide_inbox_search", FALSE);
    public static final BooleanSetting HIDE_INBOX_ACTIVITY_STATUS =
            new BooleanSetting("hide_inbox_activity_status", FALSE);
    /** The banner at the top of the Inbox that invites you to start a group chat. */
    public static final BooleanSetting HIDE_INBOX_GROUP_CHAT_BANNER =
            new BooleanSetting("hide_inbox_group_chat_banner", FALSE);
    public static final BooleanSetting EXPAND_ACTIVITY_LIST = new BooleanSetting("expand_activity_list", FALSE);
    /** Chat screen clutter. Each is off by default and read live when a chat opens. */
    public static final BooleanSetting HIDE_CHAT_CALL_BUTTONS =
            new BooleanSetting("hide_chat_call_buttons", FALSE);
    public static final BooleanSetting HIDE_CHAT_STICKER_BANNER =
            new BooleanSetting("hide_chat_sticker_banner", FALSE);
    public static final BooleanSetting HIDE_CHAT_AI_REPLIES =
            new BooleanSetting("hide_chat_ai_replies", FALSE);
    /** A message's double tap and sideways swipe in a chat, read at each gesture. */
    public static final BooleanSetting TURN_OFF_CHAT_DOUBLE_TAP =
            new BooleanSetting("turn_off_chat_double_tap", FALSE);
    public static final BooleanSetting TURN_OFF_CHAT_SWIPE_REPLY =
            new BooleanSetting("turn_off_chat_swipe_reply", FALSE);
    public static final StringSetting HIDE_INBOX_CUSTOM_TITLES =
            new StringSetting("hide_inbox_custom_titles", "");
    // Feed filter additions. The list based ones are read live, so a sound blocked from
    // the player takes effect on the next feed page without a restart.
    public static final BooleanSetting HIDE_BLOCKED_SOUNDS = new BooleanSetting("hide_blocked_sounds", TRUE);
    public static final StringSetting BLOCKED_SOUND_IDS = new StringSetting("blocked_sound_ids", "");
    public static final StringSetting BLOCKED_SOUND_NAMES = new StringSetting("blocked_sound_names", "");
    public static final BooleanSetting HIDE_PAID_PARTNERSHIP = new BooleanSetting("hide_paid_partnership", FALSE, true);
    public static final BooleanSetting FILTER_LOCATION_VIDEOS = new BooleanSetting("filter_location_videos", FALSE, true);
    public static final BooleanSetting HIDE_AI_GENERATED = new BooleanSetting("hide_ai_generated", FALSE, true);
    public static final BooleanSetting HIDE_VERIFIED = new BooleanSetting("hide_verified", FALSE, true);
    public static final BooleanSetting HIDE_SERIES = new BooleanSetting("hide_series", FALSE, true);
    /** TikTok's short dramas and the cards that promote them (upstream #155). */
    public static final BooleanSetting HIDE_MINI_DRAMAS = new BooleanSetting("hide_mini_dramas", FALSE, true);
    public static final BooleanSetting HIDE_SEEN_VIDEOS = new BooleanSetting("hide_seen_videos", FALSE, true);
    public static final IntegerSetting SEEN_VIDEO_RETENTION_DAYS =
            new IntegerSetting("seen_video_retention_days", 30).withRange(0, 3650);
    /**
     * How much of a video, in percent, has to play before it counts as seen. Zero keeps the
     * original rule (a tenth of the video, one to five seconds). 90 is the top because the
     * last progress report before a loop can land anywhere in the final second.
     */
    public static final IntegerSetting SEEN_VIDEO_MARK_PERCENT =
            new IntegerSetting("seen_video_mark_percent", 0).withRange(0, 90);
    public static final BooleanSetting HIDE_PLAYLIST_BAR = new BooleanSetting("hide_playlist_bar", FALSE, true);
    public static final BooleanSetting HIDE_EVENT_BADGE = new BooleanSetting("hide_event_badge", FALSE, true);
    public static final BooleanSetting HIDE_INSERTED_CARDS = new BooleanSetting("hide_inserted_cards", FALSE, true);
    public static final BooleanSetting HIDE_PLAYLIST_VIDEOS = new BooleanSetting("hide_playlist_videos", FALSE, true);
    // The LIVE feed you swipe through (issue #57). Read on every page TikTok sends, so a change
    // reaches the next page without a restart.
    public static final BooleanSetting LIVE_FEED_FILTER = new BooleanSetting("live_feed_filter", FALSE);
    public static final BooleanSetting LIVE_HIDE_GAMING =
            new BooleanSetting("live_hide_gaming", FALSE, false, Setting.parent(LIVE_FEED_FILTER));
    public static final BooleanSetting LIVE_HIDE_SHOPPING =
            new BooleanSetting("live_hide_shopping", FALSE, false, Setting.parent(LIVE_FEED_FILTER));
    public static final BooleanSetting LIVE_HIDE_SPONSORED =
            new BooleanSetting("live_hide_sponsored", FALSE, false, Setting.parent(LIVE_FEED_FILTER));
    public static final BooleanSetting LIVE_HIDE_VERIFIED =
            new BooleanSetting("live_hide_verified", FALSE, false, Setting.parent(LIVE_FEED_FILTER));
    public static final StringSetting LIVE_HIDDEN_CATEGORIES =
            new StringSetting("live_hidden_categories", "", false, Setting.parent(LIVE_FEED_FILTER));
    public static final StringSetting LIVE_MIN_MAX_VIEWERS = new StringSetting(
            "live_min_max_viewers", "0-" + Long.MAX_VALUE, false, Setting.parent(LIVE_FEED_FILTER));
    public static final StringSetting LIVE_MIN_MAX_FOLLOWERS = new StringSetting(
            "live_min_max_followers", "0-" + Long.MAX_VALUE, false, Setting.parent(LIVE_FEED_FILTER));

    // Privacy.
    public static final BooleanSetting GHOST_MODE = new BooleanSetting("ghost_mode", FALSE);
    // Stops the client's own activity status report. Off by default, and only meaningful while
    // Ghost mode is on, so it sits under that switch.
    public static final BooleanSetting GHOST_HIDE_ONLINE_STATUS =
            new BooleanSetting("ghost_hide_online_status", FALSE, false, Setting.parent(GHOST_MODE));
    public static final BooleanSetting DISABLE_ANALYTICS = new BooleanSetting("disable_analytics", FALSE);
    // One switch per device-access patch, on by default: the patch was chosen to block, so it
    // blocks until the reader says otherwise. Each is read at the intercepted call, so none
    // needs a restart.
    public static final BooleanSetting BLOCK_CONTACT_LIST = new BooleanSetting("block_contact_list", TRUE);
    public static final BooleanSetting BLOCK_INSTALLED_APPS = new BooleanSetting("block_installed_apps", TRUE);
    public static final BooleanSetting BLOCK_LOCATION = new BooleanSetting("block_location", TRUE);
    public static final BooleanSetting BLOCK_CLIPBOARD_READS = new BooleanSetting("block_clipboard_reads", TRUE);
    // Off by default, unlike the blocks above. Hiding a VPN changes what TikTok reads your
    // connection as, and a blank advertising id can affect attribution the reader may want kept,
    // so each is a switch to turn on rather than a default. Both are read at the intercepted call,
    // so neither needs a restart, and a paused build answers TikTok's real value.
    public static final BooleanSetting HIDE_VPN = new BooleanSetting("hide_vpn", FALSE);
    public static final BooleanSetting BLOCK_ADVERTISING_ID = new BooleanSetting("block_advertising_id", FALSE);
    public static final BooleanSetting BLOCK_MOTION_SENSORS = new BooleanSetting("block_motion_sensors", TRUE);
    // On by default for the same reason, and read at each history write, so no restart.
    public static final BooleanSetting STOP_SEARCH_HISTORY = new BooleanSetting("stop_search_history", TRUE);
    // Off even with its patch picked, unlike the one above: people use Watch history to find a
    // video again, and the report it holds back also counts views and feeds For You.
    public static final BooleanSetting STOP_WATCH_HISTORY = new BooleanSetting("stop_watch_history", FALSE);
    // Off by default, unlike the blocks above: it rides on the sensor patch, so picking that
    // patch is not a choice about the benchmark (#64). Put into effect by BenchmarkRuns.
    public static final BooleanSetting STOP_BENCHMARK_RUNS = new BooleanSetting("stop_benchmark_runs", FALSE);
    // Off by default: TikTok's own hybrid pages, the shop checkout and the CAPTCHA page among
    // them, are built on that bridge and stop working without it.
    public static final BooleanSetting BLOCK_WEBVIEW_JS_INTERFACES = new BooleanSetting("block_webview_js_interfaces", FALSE);
    public static final BooleanSetting CAMERA_MIC_INDICATOR = new BooleanSetting("camera_mic_indicator", TRUE);
    // On once the patch is picked, which is the opt-in. A restart, because TikTok works its
    // signature hash out once and keeps it.
    public static final BooleanSetting STORE_IDENTITY = new BooleanSetting("store_identity", TRUE, true);
    // The store those installer reads name, by package. A restart for the same reason (#112).
    public static final StringSetting STORE_IDENTITY_INSTALLER =
            new StringSetting("store_identity_installer", "com.android.vending", true);
    // App lock. Off until the reader turns it on, and read as each screen starts, so no restart.
    // The delay is whole minutes TikTok may spend in the background before it asks again.
    public static final BooleanSetting APP_LOCK = new BooleanSetting("app_lock", FALSE);
    public static final StringSetting APP_LOCK_TIMEOUT =
            new StringSetting("app_lock_timeout", "0", false, Setting.parent(APP_LOCK));
    // Feed toolbar controls. The LIVE button shares HIDE_LIVE_ENTRANCE with the overlay hider.
    public static final BooleanSetting HIDE_FEED_FOLLOW_BUTTON =
            new BooleanSetting("hide_feed_follow_button", FALSE, true);
    public static final BooleanSetting HIDE_FEED_SAVE_BUTTON =
            new BooleanSetting("hide_feed_save_button", FALSE, true);
    // Remove avatar rings: the story ring and the LIVE ring, each on its own switch.
    public static final BooleanSetting HIDE_STORY_RINGS = new BooleanSetting("hide_story_rings", FALSE);
    public static final BooleanSetting HIDE_LIVE_RING = new BooleanSetting("hide_live_ring", FALSE);
    // Lift text length limits: comments, repost notes and the bio.
    public static final BooleanSetting LIFT_LENGTH_LIMITS = new BooleanSetting("lift_length_limits", FALSE);
    public static final BooleanSetting KEEP_FAVORITES_TAB =
            new BooleanSetting("keep_favorites_tab", TRUE, true);
    /** The Following and For You names above the feed; the pager under them keeps swiping (issue #32). */
    public static final BooleanSetting HIDE_FEED_TAB_STRIP = new BooleanSetting("hide_feed_tab_strip", FALSE);
    public static final BooleanSetting HIDE_FEED_SEARCH_BUTTON =
            new BooleanSetting("hide_feed_search_button", FALSE, true);
    public static final BooleanSetting HIDE_VISUAL_SEARCH = new BooleanSetting("hide_visual_search", FALSE);
    public static final BooleanSetting HIDE_FULLSCREEN_BUTTON = new BooleanSetting("hide_fullscreen_button", FALSE, true);
    // Read each time TikTok asks, so it doesn't need a restart.
    public static final BooleanSetting HIDE_FEED_REPORT_BUTTON = new BooleanSetting("hide_feed_report_button", FALSE);
    // Each rewards service getter keeps its first answer until TikTok restarts (#21).
    public static final BooleanSetting HIDE_SEARCH_REWARDS = new BooleanSetting("hide_search_rewards", FALSE, true);
    public static final BooleanSetting HIDE_LOCATION_LABELS = new BooleanSetting("hide_location_labels", FALSE, true);
    // Read each time TikTok builds a video's caption strips, so no restart.
    public static final BooleanSetting HIDE_CREATION_TAGS = new BooleanSetting("hide_creation_tags", FALSE);
    public static final BooleanSetting HIDE_SEARCH_SUGGESTIONS = new BooleanSetting("hide_search_suggestions", FALSE);
    public static final BooleanSetting STOP_SEARCH_AUTOPLAY = new BooleanSetting("stop_search_autoplay", FALSE);
    /**
     * Has TikTok read its own HD upload choice as on; the Always upload in HD patch. Read as each
     * post is prepared, so no restart.
     */
    public static final BooleanSetting ALWAYS_UPLOAD_HD = new BooleanSetting("always_upload_hd", FALSE);
    public static final StringSetting CUSTOM_SHARE_DOMAIN = new StringSetting("custom_share_domain", "");
    // Opens a short vt/vm.tiktok.com share link once to swap the full link onto the clipboard.
    public static final BooleanSetting EXPAND_SHORT_SHARE_LINKS = new BooleanSetting("expand_short_share_links", FALSE);
    public static final BooleanSetting HIDE_LIVE_ENTRANCE = new BooleanSetting("hide_live_entrance", FALSE);
    // Comment tools.
    public static final BooleanSetting COMMENT_KEYWORD_FILTER = new BooleanSetting("comment_keyword_filter", FALSE);
    public static final StringSetting COMMENT_BLOCKED_KEYWORDS = new StringSetting("comment_blocked_keywords", "");
    public static final StringSetting COMMENT_BLOCKED_USERS = new StringSetting("comment_blocked_users", "");
    public static final BooleanSetting BLOCK_FROM_COMMENT = new BooleanSetting("block_from_comment", TRUE);
    public static final BooleanSetting COMMENT_SEARCH = new BooleanSetting("comment_search", FALSE);
    /** Adds Export CSV and Export JSON under the comment search box. */
    public static final BooleanSetting COMMENT_EXPORT = new BooleanSetting("comment_export", FALSE);
    public static final BooleanSetting COMMENT_LINKS = new BooleanSetting("comment_links", TRUE);
    public static final BooleanSetting HIDE_COMMENT_MEDIA = new BooleanSetting("hide_comment_media", FALSE);
    public static final BooleanSetting HIDE_COMMENT_POLLS = new BooleanSetting("hide_comment_polls", FALSE);
    /** Answers no survey from TikTok's comment survey config, so a comment list carries none. */
    public static final BooleanSetting HIDE_COMMENT_SURVEYS = new BooleanSetting("hide_comment_surveys", FALSE);
    /** Keeps the photo, @ and gift buttons in the comment box gone. Emoji and sending stay. */
    public static final BooleanSetting HIDE_COMMENT_BOX_BUTTONS = new BooleanSetting("hide_comment_box_buttons", FALSE);
    /** Draws a comment poll's results before the reader votes, from the counts TikTok already sends. */
    public static final BooleanSetting SHOW_POLL_RESULTS = new BooleanSetting("show_poll_results", FALSE);
    /** Tapping "more" under a video opens its comments with the caption at the top (upstream #156). */
    public static final BooleanSetting CAPTION_OPENS_COMMENTS = new BooleanSetting("caption_opens_comments", FALSE);
    /** Every video's comments open with its caption at the top. */
    public static final BooleanSetting CAPTION_ABOVE_COMMENTS = new BooleanSetting("caption_above_comments", FALSE);
    public static final BooleanSetting HIDE_COMMENT_SEARCH_SUGGESTIONS =
            new BooleanSetting("hide_comment_search_suggestions", FALSE, true);
    public static final BooleanSetting COMPACT_COMMENT_HEADER =
            new BooleanSetting("compact_comment_header", FALSE, true);
    public static final BooleanSetting LARGER_COMMENT_LIKE_TARGET =
            new BooleanSetting("larger_comment_like_target", FALSE, true);
    public static final BooleanSetting HIDE_COMMENT_EGGS = new BooleanSetting("hide_comment_eggs", TRUE);
    public static final BooleanSetting COMMENT_SORT_CONTROLS = new BooleanSetting("comment_sort_controls", FALSE);
    // Share sheet tools.
    public static final BooleanSetting HIDE_SHARE_CONTACTS = new BooleanSetting("hide_share_contacts", FALSE);
    public static final StringSetting SHARE_HIDDEN_ITEMS = new StringSetting("share_hidden_items", "");
    // The profile and LIVE sheets keep lists of their own. Until one is saved it holds this
    // marker and follows SHARE_HIDDEN_ITEMS, so a list chosen before the split keeps working on
    // every sheet, unknown identifiers included.
    public static final String SHARE_HIDDEN_ITEMS_FOLLOW_VIDEO = "@video";
    public static final StringSetting SHARE_HIDDEN_ITEMS_PROFILE =
            new StringSetting("share_hidden_items_profile", SHARE_HIDDEN_ITEMS_FOLLOW_VIDEO);
    public static final StringSetting SHARE_HIDDEN_ITEMS_LIVE =
            new StringSetting("share_hidden_items_live", SHARE_HIDDEN_ITEMS_FOLLOW_VIDEO);
    public static final StringSetting SHARE_ACTION_CATALOG = new StringSetting("share_action_catalog", "");
    // Profile shortcuts (#49): the pills under a profile's bio. Names typed to hide, comma separated;
    // the keys picked in the checklist, kept apart so neither rewrites the other; and the ones
    // TikTok has sent to this phone, which the checklist offers.
    public static final StringSetting HIDDEN_PROFILE_SHORTCUTS = new StringSetting("hidden_profile_shortcuts", "");
    public static final StringSetting PROFILE_SHORTCUT_PICKS = new StringSetting("profile_shortcut_picks", "");
    public static final StringSetting PROFILE_SHORTCUT_CATALOG = new StringSetting("profile_shortcut_catalog", "");
    /** The Thoughts bubble above a profile picture (#122). Read when a profile's picture is built. */
    public static final BooleanSetting HIDE_PROFILE_THOUGHTS = new BooleanSetting("hide_profile_thoughts", FALSE, true);
    // Popup labels (TikTok's own popup layer): the labels ticked in the checklist, and the ones
    // TikTok has tried to show on this phone, which the checklist offers.
    public static final StringSetting POPUP_LABEL_PICKS = new StringSetting("popup_label_picks", "");
    public static final BooleanSetting HIDE_LIVE_BUBBLE = new BooleanSetting("hide_live_bubble", FALSE);
    // TikTok's bedtime wind-down, breathing exercise and daily-limit screens over the feed, kept
    // back only on an account TikTok treats as an adult's (WindDownScreens).
    public static final BooleanSetting HIDE_WIND_DOWN_SCREENS = new BooleanSetting("hide_wind_down_screens", FALSE);
    public static final StringSetting POPUP_LABEL_CATALOG = new StringSetting("popup_label_catalog", "");
    // "Follows you" under the @username on a profile, and a mark on the follow list accounts that don't follow back.
    public static final BooleanSetting SHOW_FOLLOW_STATUS = new BooleanSetting("show_follow_status", TRUE);
    // Long-press a bio to copy it, and copy buttons for a profile's or a video's IDs on the share sheet.
    public static final BooleanSetting COPY_IDS = new BooleanSetting("copy_ids", TRUE);
    // An Account facts button on a profile's share sheet, from what TikTok already sent about the account.
    public static final BooleanSetting ACCOUNT_FACTS = new BooleanSetting("account_facts", FALSE);
    // Package names of the apps added to the Share via row, comma separated, in the order picked.
    public static final StringSetting SHARE_ADDED_APPS = new StringSetting("share_added_apps", "");
    public static final BooleanSetting DISABLE_LONG_PRESS_QUICK_SHARE =
            new BooleanSetting("disable_long_press_quick_share", FALSE);
    public static final BooleanSetting DISABLE_LONG_PRESS_REPOST =
            new BooleanSetting("disable_long_press_repost", FALSE);
    public static final BooleanSetting ENABLE_NON_PERSONALIZED_SEARCH =
            new BooleanSetting("enable_non_personalized_search", FALSE, true);
    public static final BooleanSetting ENABLE_LIVE_SEARCH =
            new BooleanSetting("enable_live_search", FALSE, true);
    public static final BooleanSetting SIM_SPOOF = new BooleanSetting("simspoof", FALSE, true);
    public static final StringSetting SIM_SPOOF_ISO = new StringSetting("simspoof_iso", "us");
    public static final StringSetting SIMSPOOF_MCCMNC = new StringSetting("simspoof_mccmnc", "310260");
    public static final StringSetting SIMSPOOF_OP_NAME = new StringSetting("simspoof_op_name", "T-Mobile");
    // Network proxy. Off by default, and every value is read once as TikTok starts, before its
    // network stack is built, so each one takes a restart. The user name and password stay out
    // of backups: a backup file is easy to pass around.
    public static final BooleanSetting NETWORK_PROXY = new BooleanSetting("network_proxy", FALSE, true);
    public static final StringSetting NETWORK_PROXY_TYPE = new StringSetting(
            "network_proxy_type", "http", true, Setting.parent(NETWORK_PROXY));
    public static final StringSetting NETWORK_PROXY_HOST = new StringSetting(
            "network_proxy_host", "", true, Setting.parent(NETWORK_PROXY));
    public static final StringSetting NETWORK_PROXY_PORT = new StringSetting(
            "network_proxy_port", "", true, Setting.parent(NETWORK_PROXY));
    public static final StringSetting NETWORK_PROXY_USER = new StringSetting(
            "network_proxy_user", "", true, false, null, Setting.parent(NETWORK_PROXY));
    public static final StringSetting NETWORK_PROXY_PASSWORD = new StringSetting(
            "network_proxy_password", "", true, false, null, Setting.parent(NETWORK_PROXY));

    /**
     * Made once per install so a hashed account id in a diagnostic report cannot be checked
     * against a guess. Never shown, never exported: it is excluded from the backup for the
     * same reason the installation bookkeeping is.
     */
    public static final StringSetting DIAGNOSTIC_REPORT_SALT = new StringSetting(
            "diagnostic_report_salt",
            "",
            false,
            false
    );

    static {
        // Hushfeed's own state: remembered positions and choices, lists it observed, counters.
        // They keep their values while Hushfeed is paused; every other setting answers its
        // unpatched value then (Setting#get).
        Setting.keepWhenPaused(LAUNCHER_SHORTCUTS_REMOVED, FEED_NAVIGATION_OBSERVED_TABS,
                BOTTOM_NAVIGATION_OBSERVED_TABS, DOWNLOAD_PATH, DOWNLOAD_PATHS_MIGRATED,
                REMEMBERED_SPEED, SESSION_BUDGET_STATE, BLOCK_AUTHOR_BUTTON_POSITION,
                LOCAL_HIDE_BUTTON_POSITION, BLOCK_SOUND_BUTTON_POSITION, NOT_INTERESTED_BUTTON_POSITION,
                FEED_MUTE_BUTTON_POSITION,
                SHARE_ACTION_CATALOG, PROFILE_SHORTCUT_CATALOG, POPUP_LABEL_CATALOG, DIAGNOSTIC_REPORT_SALT, AUTO_STREAK_STATE,
                // The budget's day is worked out from this hour. Paused, the budget counts
                // nothing and holds nothing, but its record still has to name the right day.
                SESSION_BUDGET_RESET_HOUR);
        // Guests cannot use Profile to reach settings. Keep their chosen Home shortcut so
        // they can reopen settings and resume Hushfeed after leaving the Pause screen.
        Setting.keepWhenPaused(HOME_TAB_OPENS_SETTINGS);
        // A lock that Pause turned off would open to anyone who can make the safe-mode file,
        // which any file manager can. The lock stays what the owner set.
        Setting.keepWhenPaused(APP_LOCK, APP_LOCK_TIMEOUT);
        // Downloads rewrite TikTok's own save folder and file name with no switch in front, so
        // pausing cannot give TikTok its own back. They keep the reader's choice instead of
        // falling back to Hushfeed's defaults. The README lists them as not paused.
        Setting.keepWhenPaused(DOWNLOAD_VIDEO_PATH, DOWNLOAD_PHOTO_PATH, DOWNLOAD_STICKER_PATH,
                DOWNLOAD_STICKER_FORMAT, DOWNLOAD_VIDEO_FILENAME_TEMPLATE, DOWNLOAD_PHOTO_FILENAME_TEMPLATE,
                DOWNLOAD_COMMENT_MEDIA_FILENAME_TEMPLATE);

        if (!DOWNLOAD_PATHS_MIGRATED.savedValue()) {
            String legacyPath = DOWNLOAD_PATH.savedValue();
            DOWNLOAD_VIDEO_PATH.save(legacyPath);
            DOWNLOAD_PHOTO_PATH.save(legacyPath);
            DOWNLOAD_STICKER_PATH.save(legacyPath);
            DOWNLOAD_PATHS_MIGRATED.save(TRUE);
        }
    }

    /**
     * Called from the patched share guide method. Returning true stops the share prompt that
     * pops up after a like. Upstream #22.
     */
    public static boolean shouldHideShareGuide() {
        return HIDE_SHARE_GUIDE.get();
    }
}
