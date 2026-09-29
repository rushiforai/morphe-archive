package io.github.bakwudo.uyu.extension.settings;

/**
 * All uyu settings. Defaults follow docs/design.md.
 */
public final class Settings {
    public static final BooleanSetting AUTO_CLAIM_CHANNEL_POINTS =
            new BooleanSetting("auto_claim_channel_points", true);

    /** The row above chat with the Bits, gift a sub and subscribe buttons. */
    public static final BooleanSetting HIDE_SUBSCRIBE_BUTTONS =
            new BooleanSetting("hide_subscribe_buttons", true);
    /** The Bits button in the chat box. */
    public static final BooleanSetting HIDE_CHAT_BITS_BUTTON =
            new BooleanSetting("hide_chat_bits_button", true);
    /** The ranking of top gifters and cheerers above chat. */
    public static final BooleanSetting HIDE_GIFT_LEADERBOARD =
            new BooleanSetting("hide_gift_leaderboard", true);
    /** Banners that advertise subscription discounts, SUBtember and Turbo. */
    public static final BooleanSetting HIDE_SUBSCRIPTION_PROMOTIONS =
            new BooleanSetting("hide_subscription_promotions", true);

    public static final BooleanSetting DANMAKU_ENABLED =
            new BooleanSetting("danmaku_enabled", true);
    /** Shows comments in portrait, on the video above chat. */
    public static final BooleanSetting DANMAKU_PORTRAIT =
            new BooleanSetting("danmaku_portrait", true);
    /** Shows comments in Twitch's mini player, the small player kept while browsing the app. */
    public static final BooleanSetting DANMAKU_MINI_PLAYER =
            new BooleanSetting("danmaku_mini_player", true);
    /** Shows comments in picture in picture. */
    public static final BooleanSetting DANMAKU_PICTURE_IN_PICTURE =
            new BooleanSetting("danmaku_picture_in_picture", true);
    /** Hides Twitch's chat mode button in landscape and keeps the landscape chat off. */
    public static final BooleanSetting DANMAKU_HIDE_LANDSCAPE_CHAT =
            new BooleanSetting("danmaku_hide_landscape_chat", false);
    /** Number of rows the video height is divided into. */
    public static final IntSetting DANMAKU_ROWS =
            new IntSetting("danmaku_rows", 13, 5, 30);
    /** How far down from the top comments may flow, in percent of the video height. */
    public static final IntSetting DANMAKU_AREA =
            new IntSetting("danmaku_area", 100, 10, 100);
    /** Time a comment takes to cross the video, in milliseconds. */
    public static final IntSetting DANMAKU_DURATION =
            new IntSetting("danmaku_duration", 4000, 2000, 10000);
    /** Comments shown at once. Messages beyond this are not shown. */
    public static final IntSetting DANMAKU_MAX_COMMENTS =
            new IntSetting("danmaku_max_comments", 40, 10, 200);
    /** Empty for the system default, a family name, or {@code file:<path>#<ttc index>}. */
    public static final StringSetting DANMAKU_FONT =
            new StringSetting("danmaku_font", "");
    public static final IntSetting DANMAKU_FONT_WEIGHT =
            new IntSetting("danmaku_font_weight", 700, 100, 900);
    public static final IntSetting DANMAKU_TEXT_COLOR =
            new IntSetting("danmaku_text_color", 0xFFFFFFFF);
    public static final IntSetting DANMAKU_OUTLINE_COLOR =
            new IntSetting("danmaku_outline_color", 0x66000000);
    /** Outline stroke width, in percent of the text size. */
    public static final IntSetting DANMAKU_OUTLINE_WIDTH =
            new IntSetting("danmaku_outline_width", 10, 0, 30);
    /** Opacity of the whole overlay, in percent. */
    public static final IntSetting DANMAKU_OPACITY =
            new IntSetting("danmaku_opacity", 100, 0, 100);

    public static final BooleanSetting BLOCK_ADS =
            new BooleanSetting("block_ads", true);
    /**
     * Empty to block ads on the device only. Otherwise live streams are loaded from this proxy,
     * with {@code {channel}} replaced by the channel name or the name appended.
     */
    public static final StringSetting ADS_PROXY_URL =
            new StringSetting("ads_proxy_url", "");

    private Settings() {
    }
}
