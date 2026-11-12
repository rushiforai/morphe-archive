package io.github.bryceaspringfield.morphe.extension.youtube;

import static java.lang.Boolean.FALSE;

import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.StringSetting;

/**
 * The bundle's settings, stored in Morphe's own preferences (morphe_prefs) under keys starting with yx_, so Morphe's
 * import and export include them. Every feature is off, or empty, until the user sets it, except the two DeArrow options.
 */
public final class XSettings {

    // Channel filters: one rule a line, "CHANNEL: RULE" (see ChannelRules).
    public static final StringSetting CHANNEL_RULES = new StringSetting("yx_channel_rules", "");

    // Video length bounds, as m:ss, h:mm:ss, or minutes; blank is no bound.
    public static final StringSetting MIN_LENGTH = new StringSetting("yx_min_length", "");
    public static final StringSetting MAX_LENGTH = new StringSetting("yx_max_length", "");

    // Where the feed filters of this bundle apply.
    public static final BooleanSetting APPLY_HOME = new BooleanSetting("yx_apply_home", true);
    public static final BooleanSetting APPLY_SUBSCRIPTIONS = new BooleanSetting("yx_apply_subscriptions", true);
    public static final BooleanSetting APPLY_SEARCH = new BooleanSetting("yx_apply_search", true);
    public static final BooleanSetting APPLY_RELATED = new BooleanSetting("yx_apply_related", true);

    // Playlists (not mixes) in the home feed.
    public static final BooleanSetting HIDE_HOME_PLAYLISTS = new BooleanSetting("yx_hide_home_playlists", FALSE);
    /** Home suggestions of a never-opened video before it gets Not interested; "0" turns it off. */
    public static final StringSetting RESUGGESTED_LIMIT = new StringSetting("yx_resuggested_limit", "3");
    /** Seconds between two visits of Home which count a video's suggestion twice (not shown; tests shorten it). */
    public static final StringSetting RESUGGESTED_GAP = new StringSetting("yx_resuggested_gap_s", "600");
    public static final BooleanSetting HIDE_PAST_STREAMS = new BooleanSetting("yx_hide_past_streams", FALSE);

    // Topic presets (comma-separated keys of Topics.KEYS) and the user's own channels to hide.
    public static final StringSetting TOPICS = new StringSetting("yx_topics", "");
    public static final StringSetting HIDDEN_CHANNELS = new StringSetting("yx_hidden_channels", "");

    // YouTube categories to hide (comma-separated category names as YouTube states them, e.g. "News & Politics").
    public static final StringSetting HIDDEN_CATEGORIES = new StringSetting("yx_hidden_categories", "");

    // The panel reached by swiping in a comment section ("Community of <channel> ... Visit").
    public static final BooleanSetting HIDE_COMMENTS_COMMUNITY = new BooleanSetting("yx_hide_comments_community", FALSE);

    // The new-content dots on the avatars of the subscribed channels bar.
    public static final BooleanSetting HIDE_CHANNEL_BAR_DOTS = new BooleanSetting("yx_hide_channel_bar_dots", FALSE);

    // Live chat opens on Live chat (all messages) in place of Top chat.
    public static final BooleanSetting LIVE_CHAT_ALL_MESSAGES = new BooleanSetting("yx_live_chat_all_messages", FALSE);

    // Automatic feedback and likes.
    public static final BooleanSetting AUTO_DISLIKE_FILTERED = new BooleanSetting("yx_auto_dislike_filtered", FALSE);
    /** Off, partly (any progress bar), or fully (a progress bar of at least 90%). */
    public static final StringSetting AUTO_WATCHED = new StringSetting("yx_auto_watched", "off");
    public static final BooleanSetting AUTO_LIKE = new BooleanSetting("yx_auto_like", FALSE);

    // The Save button opens the playlist chooser.
    public static final BooleanSetting SAVE_OPENS_CHOOSER = new BooleanSetting("yx_save_opens_chooser", FALSE);

    // DeArrow: a tap on Morphe's title icon switches the title, and a pencil on the open video's title suggests one.
    public static final BooleanSetting DEARROW_TAP = new BooleanSetting("yx_dearrow_tap", true);
    public static final BooleanSetting DEARROW_SUGGEST = new BooleanSetting("yx_dearrow_suggest", true);
    /** A title the video's top comments correct ("... correct title") is shown in place of its own. */
    public static final BooleanSetting COMMENT_TITLE = new BooleanSetting("yx_comment_title", true);
    /** The private ID submissions are counted under when Morphe's SponsorBlock has none; never logged or shown. */
    public static final StringSetting DEARROW_USER_ID = new StringSetting("yx_dearrow_user_id_Do_Not_Share", "");

    // Live streams play faster while behind their live edge, until caught up.
    public static final BooleanSetting LIVE_CATCH_UP = new BooleanSetting("yx_live_catch_up", FALSE);
    public static final StringSetting LIVE_CATCH_UP_SPEED = new StringSetting("yx_live_catch_up_speed", "2");

    // Playback with the screen off: a pause right after the screen turns off is undone; the lowest quality while off.
    public static final BooleanSetting KEEP_PLAYING_SCREEN_OFF = new BooleanSetting("yx_keep_playing_screen_off", true);
    public static final BooleanSetting AUDIO_ONLY = new BooleanSetting("yx_audio_only", FALSE);
    public static final BooleanSetting AUDIO_ONLY_SCREEN_OFF = new BooleanSetting("yx_audio_only_screen_off", FALSE);

    /** Like and dislike counts: count, percent, or both. */
    public static final StringSetting VOTE_FORMAT = new StringSetting("yx_vote_format", "count");

    // A tap on a live chat message's profile picture opens the author's channel.
    public static final BooleanSetting CHAT_AVATAR_CHANNEL = new BooleanSetting("yx_chat_avatar_channel", true);

    // Fixes.
    public static final BooleanSetting FIX_NAVIGATION_TAPS = new BooleanSetting("yx_fix_navigation_taps", FALSE);
    public static final BooleanSetting FIX_NETWORK_RECOVERY = new BooleanSetting("yx_fix_network_recovery", FALSE);

    // Logs every feed item's channel, length, and type to logcat (tag morphe), for checking the filters.
    public static final BooleanSetting DEBUG = new BooleanSetting("yx_debug", FALSE);

    private XSettings() {
    }

    /** Loads the class, so every setting exists before Morphe's settings screen reads them. */
    public static void load() {
    }
}
