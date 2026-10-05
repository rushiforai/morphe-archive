package dev.twitchpatches.extension.settings;

public enum SettingSection {
    CHANNEL_POINTS("Channel points"),
    CHAT("Chat"),
    PLAYBACK("Playback"),
    ADS("Ads"),
    PROMOTIONS("Promotions");

    private final String title;

    SettingSection(String title) { this.title = title; }

    public String title() { return title; }
}
