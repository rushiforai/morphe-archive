package io.github.bakwudo.uyu.extension.settings;

/**
 * Runtime settings for the custom Twitch Morphe bundle.
 *
 * The original uyu settings that are still referenced by uyu's built-in patches are retained
 * for binary/source compatibility. Features that are not part of this custom bundle default to
 * off so the visible settings surface only reflects the selected feature set.
 */
public final class Settings {
    // Original uyu compatibility settings.
    public static final BooleanSetting AUTO_CLAIM_CHANNEL_POINTS =
            new BooleanSetting("auto_claim_channel_points", false);

    public static final BooleanSetting HIDE_SUBSCRIBE_BUTTONS =
            new BooleanSetting("hide_subscribe_buttons", false);
    /** Selected for this bundle and exposed under Chat. */
    public static final BooleanSetting HIDE_CHAT_BITS_BUTTON =
            new BooleanSetting("hide_chat_bits_button", true);
    public static final BooleanSetting HIDE_GIFT_LEADERBOARD =
            new BooleanSetting("hide_gift_leaderboard", false);
    public static final BooleanSetting HIDE_SUBSCRIPTION_PROMOTIONS =
            new BooleanSetting("hide_subscription_promotions", false);

    public static final BooleanSetting DANMAKU_ENABLED =
            new BooleanSetting("danmaku_enabled", false);
    public static final BooleanSetting DANMAKU_PORTRAIT =
            new BooleanSetting("danmaku_portrait", false);
    public static final BooleanSetting DANMAKU_MINI_PLAYER =
            new BooleanSetting("danmaku_mini_player", false);
    public static final BooleanSetting DANMAKU_PICTURE_IN_PICTURE =
            new BooleanSetting("danmaku_picture_in_picture", false);
    public static final BooleanSetting DANMAKU_HIDE_LANDSCAPE_CHAT =
            new BooleanSetting("danmaku_hide_landscape_chat", false);
    public static final IntSetting DANMAKU_ROWS =
            new IntSetting("danmaku_rows", 13, 5, 30);
    public static final IntSetting DANMAKU_AREA =
            new IntSetting("danmaku_area", 100, 10, 100);
    public static final IntSetting DANMAKU_DURATION =
            new IntSetting("danmaku_duration", 4000, 2000, 10000);
    public static final IntSetting DANMAKU_MAX_COMMENTS =
            new IntSetting("danmaku_max_comments", 40, 10, 200);
    public static final StringSetting DANMAKU_FONT =
            new StringSetting("danmaku_font", "");
    public static final IntSetting DANMAKU_FONT_WEIGHT =
            new IntSetting("danmaku_font_weight", 700, 100, 900);
    public static final IntSetting DANMAKU_TEXT_COLOR =
            new IntSetting("danmaku_text_color", 0xFFFFFFFF);
    public static final IntSetting DANMAKU_OUTLINE_COLOR =
            new IntSetting("danmaku_outline_color", 0x66000000);
    public static final IntSetting DANMAKU_OUTLINE_WIDTH =
            new IntSetting("danmaku_outline_width", 10, 0, 30);
    public static final IntSetting DANMAKU_OPACITY =
            new IntSetting("danmaku_opacity", 100, 0, 100);

    // Ads.
    public static final BooleanSetting BLOCK_ADS =
            new BooleanSetting("block_ads", true);
    /** Empty means device-side blocking only. {channel} is replaced by the channel name. */
    public static final StringSetting ADS_PROXY_URL =
            new StringSetting("ads_proxy_url", "");

    // Emotes.
    public static final BooleanSetting EMOTES_7TV =
            new BooleanSetting("emotes_7tv", true);
    public static final BooleanSetting EMOTES_BTTV =
            new BooleanSetting("emotes_bttv", true);
    public static final BooleanSetting EMOTES_FFZ =
            new BooleanSetting("emotes_ffz", true);
    public static final BooleanSetting EMOTES_ANIMATED =
            new BooleanSetting("emotes_animated", true);
    public static final BooleanSetting EMOTES_PICKER =
            new BooleanSetting("emotes_picker", true);
    public static final BooleanSetting EMOTES_AUTOCOMPLETE =
            new BooleanSetting("emotes_autocomplete", true);
    public static final BooleanSetting EMOTES_ZERO_WIDTH =
            new BooleanSetting("emotes_zero_width", true);

    // Chat.
    public static final BooleanSetting CHAT_DELETED_MESSAGES =
            new BooleanSetting("chat_deleted_messages", true);
    public static final StringSetting CHAT_DELETED_MESSAGES_STYLE =
            new StringSetting("chat_deleted_messages_style", "strikethrough");
    public static final BooleanSetting CHAT_TIMESTAMPS =
            new BooleanSetting("chat_timestamps", true);
    public static final StringSetting CHAT_TIMESTAMP_FORMAT =
            new StringSetting("chat_timestamp_format", "h24");
    public static final BooleanSetting LANDSCAPE_CHAT_SIZE_ENABLED =
            new BooleanSetting("landscape_chat_size_enabled", true);
    public static final IntSetting LANDSCAPE_CHAT_SIZE =
            new IntSetting("landscape_chat_size", 30, 10, 70);
    public static final BooleanSetting LANDSCAPE_CHAT_OPACITY_ENABLED =
            new BooleanSetting("landscape_chat_opacity_enabled", true);
    public static final IntSetting LANDSCAPE_CHAT_OPACITY =
            new IntSetting("landscape_chat_opacity", 30, 0, 100);

    // Player.
    public static final BooleanSetting SHOW_REFRESH_BUTTON =
            new BooleanSetting("show_refresh_button", true);
    public static final BooleanSetting VOLUME_GESTURE =
            new BooleanSetting("volume_gesture", true);
    public static final BooleanSetting BRIGHTNESS_GESTURE =
            new BooleanSetting("brightness_gesture", true);
    public static final BooleanSetting GESTURE_OSD =
            new BooleanSetting("gesture_osd", true);
    public static final BooleanSetting CUSTOM_FORWARD_SEEK =
            new BooleanSetting("custom_forward_seek", true);
    public static final IntSetting FORWARD_SEEK_SECONDS =
            new IntSetting("forward_seek_seconds", 30, 5, 120);
    public static final BooleanSetting CUSTOM_REWIND_SEEK =
            new BooleanSetting("custom_rewind_seek", true);
    public static final IntSetting REWIND_SEEK_SECONDS =
            new IntSetting("rewind_seek_seconds", 10, 5, 120);
    /** Controls whether the sleep-timer entry/button is exposed. */
    public static final BooleanSetting SHOW_SLEEP_TIMER =
            new BooleanSetting("show_sleep_timer", true);

    // Interface / Feed.
    public static final BooleanSetting HIDE_STORIES =
            new BooleanSetting("hide_stories", true);
    public static final BooleanSetting HIDE_RECOMMENDATIONS =
            new BooleanSetting("hide_recommendations", true);
    public static final BooleanSetting HIDE_FEATURED_CLIPS =
            new BooleanSetting("hide_featured_clips", true);
    public static final BooleanSetting FORCE_SEARCH_BUTTON =
            new BooleanSetting("force_search_button", true);

    // Privacy.
    public static final BooleanSetting DISABLE_COMSCORE =
            new BooleanSetting("disable_comscore", true);
    public static final BooleanSetting DISABLE_BUGSNAG =
            new BooleanSetting("disable_bugsnag", true);

    private Settings() {
    }
}
