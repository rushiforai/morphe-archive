package dev.twitchpatches.extension.settings;

public enum SettingSection {
    CHANNEL_POINTS("Channel points", "channel_points"),
    CHAT("Chat", "ic_emotes"),
    PLAYBACK("Playback", "ic_play_arrow"),
    INTERFACE("Interface", "ic_settings"),
    ADS("Ads", "ic_cancel_grey_9"),
    PROMOTIONS("Promotions", "ic_subscribe"),
    PLAYER_CONTROLS("Player controls", "ic_settings"),
    CHANNEL_ACTIONS("Channel actions", "ic_subscribe"),
    CHAT_OVERLAYS("Chat overlays", "ic_emotes"),
    DISPLAY("Display", "ic_fullscreen_enter");

    private final String title;
    private final String icon;

    SettingSection(String title, String icon) { this.title = title; this.icon = icon; }

    public String title() { return title; }
    public String icon() { return icon; }
}
