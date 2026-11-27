package io.github.bryceaspringfield.morphe.extension.youtube;

import static java.lang.Boolean.FALSE;

import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.StringSetting;

public final class XSettings {

    public static final StringSetting CHANNEL_RULES = new StringSetting("yx_channel_rules", "");

    public static final StringSetting MIN_LENGTH = new StringSetting("yx_min_length", "");
    public static final StringSetting MAX_LENGTH = new StringSetting("yx_max_length", "");

    public static final StringSetting MIN_VIEWS = new StringSetting("yx_min_views", "");
    public static final StringSetting MAX_AGE = new StringSetting("yx_max_age", "");
    public static final BooleanSetting VIEWS_KEEP_NEW = new BooleanSetting("yx_views_keep_new", FALSE);
    public static final BooleanSetting HIDE_MEMBERS_ONLY = new BooleanSetting("yx_hide_members_only", FALSE);
    public static final BooleanSetting HIDE_UPCOMING = new BooleanSetting("yx_hide_upcoming", FALSE);

    public static final BooleanSetting APPLY_HOME = new BooleanSetting("yx_apply_home", true);
    public static final BooleanSetting APPLY_SUBSCRIPTIONS = new BooleanSetting("yx_apply_subscriptions", true);
    public static final BooleanSetting APPLY_SEARCH = new BooleanSetting("yx_apply_search", true);
    public static final BooleanSetting APPLY_RELATED = new BooleanSetting("yx_apply_related", true);

    public static final BooleanSetting WATCHED_HOME = new BooleanSetting("yx_watched_home", true);
    public static final BooleanSetting WATCHED_SUBSCRIPTIONS = new BooleanSetting("yx_watched_subscriptions", false);
    public static final BooleanSetting WATCHED_CHANNEL = new BooleanSetting("yx_watched_channel", false);
    public static final BooleanSetting WATCHED_SEARCH = new BooleanSetting("yx_watched_search", false);
    public static final BooleanSetting WATCHED_RELATED = new BooleanSetting("yx_watched_related", true);

    public static final BooleanSetting HIDE_HOME_LIVE = new BooleanSetting("yx_hide_home_live", FALSE);
    public static final BooleanSetting HIDE_HOME_PLAYLISTS = new BooleanSetting("yx_hide_home_playlists", FALSE);
    public static final StringSetting RESUGGESTED_LIMIT = new StringSetting("yx_resuggested_limit", "3");
    public static final StringSetting RESUGGESTED_GAP = new StringSetting("yx_resuggested_gap_s", "600");
    public static final BooleanSetting HIDE_PAST_STREAMS = new BooleanSetting("yx_hide_past_streams", FALSE);

    public static final StringSetting TOPICS = new StringSetting("yx_topics", "");
    public static final StringSetting HIDDEN_CHANNELS = new StringSetting("yx_hidden_channels", "");

    public static final StringSetting HIDDEN_CATEGORIES = new StringSetting("yx_hidden_categories", "");

    public static final BooleanSetting HIDE_COMMENTS_COMMUNITY = new BooleanSetting("yx_hide_comments_community", FALSE);

    public static final BooleanSetting HIDE_CHANNEL_BAR_DOTS = new BooleanSetting("yx_hide_channel_bar_dots", FALSE);

    public static final BooleanSetting LIVE_CHAT_ALL_MESSAGES = new BooleanSetting("yx_live_chat_all_messages", FALSE);

    public static final BooleanSetting AUTO_DISLIKE_FILTERED = new BooleanSetting("yx_auto_dislike_filtered", FALSE);
    public static final BooleanSetting AUTO_REASON = new BooleanSetting("yx_auto_reason", FALSE);
    public static final StringSetting AUTO_WATCHED = new StringSetting("yx_auto_watched", "off");
    public static final BooleanSetting AUTO_LIKE = new BooleanSetting("yx_auto_like", FALSE);
    public static final StringSetting DISLIKE_CHANNELS = new StringSetting("yx_dislike_channels", "");
    public static final BooleanSetting RESUGGESTED_RELATED = new BooleanSetting("yx_resuggested_related", true);

    public static final BooleanSetting SAVE_OPENS_CHOOSER = new BooleanSetting("yx_save_opens_chooser", FALSE);
    public static final StringSetting SAVE_STYLE = new StringSetting("yx_save_style", "sheet");

    public static final BooleanSetting DEARROW_TAP = new BooleanSetting("yx_dearrow_tap", true);
    public static final BooleanSetting DEARROW_SUGGEST = new BooleanSetting("yx_dearrow_suggest", true);
    public static final BooleanSetting COMMENT_TITLE = new BooleanSetting("yx_comment_title", true);
    public static final StringSetting DEARROW_USER_ID = new StringSetting("yx_dearrow_user_id_Do_Not_Share", "");

    public static final BooleanSetting LIVE_CATCH_UP = new BooleanSetting("yx_live_catch_up", FALSE);
    public static final StringSetting LIVE_CATCH_UP_SPEED = new StringSetting("yx_live_catch_up_speed", "2");
    public static final StringSetting LIVE_CATCH_UP_DELAY = new StringSetting("yx_live_catch_up_delay", "5");

    public static final StringSetting SLEEP_MINUTES = new StringSetting("yx_sleep_minutes", "");

    public static final BooleanSetting KEEP_PLAYING_SCREEN_OFF = new BooleanSetting("yx_keep_playing_screen_off", true);
    public static final BooleanSetting AUDIO_ONLY = new BooleanSetting("yx_audio_only", FALSE);
    public static final BooleanSetting AUDIO_ONLY_ROW = new BooleanSetting("yx_audio_only_row", true);
    public static final BooleanSetting AUDIO_ONLY_LOW_DATA = new BooleanSetting("yx_audio_only_low_data", true);
    public static final BooleanSetting AUTO_PIP = new BooleanSetting("yx_auto_pip", FALSE);
    public static final BooleanSetting AUDIO_ONLY_SCREEN_OFF = new BooleanSetting("yx_audio_only_screen_off", FALSE);

    public static final StringSetting VOTE_FORMAT = new StringSetting("yx_vote_format", "count");

    public static final BooleanSetting CHAT_AVATAR_CHANNEL = new BooleanSetting("yx_chat_avatar_channel", true);

    public static final BooleanSetting FIX_NAVIGATION_TAPS = new BooleanSetting("yx_fix_navigation_taps", FALSE);
    public static final BooleanSetting FIX_NETWORK_RECOVERY = new BooleanSetting("yx_fix_network_recovery", FALSE);

    public static final BooleanSetting DEBUG = new BooleanSetting("yx_debug", FALSE);

    private XSettings() {
    }

    public static void load() {
    }
}
