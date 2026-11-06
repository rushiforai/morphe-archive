package dev.twitchpatches.extension.settings;

public enum SettingSection {
    CHANNEL_POINTS("チャンネルポイント", "channel_points"),
    CHAT("チャット", "ic_emotes"),
    PLAYBACK("再生", "ic_play_arrow"),
    INTERFACE("インターフェース", "ic_settings"),
    ADS("広告", "ic_cancel_grey_9"),
    PROMOTIONS("プロモーション", "ic_subscribe"),
    PLAYER_CONTROLS("プレイヤー操作", "ic_settings"),
    CHANNEL_ACTIONS("チャンネル操作", "ic_subscribe"),
    CHAT_OVERLAYS("チャット上の表示", "ic_emotes"),
    DISPLAY("表示", "ic_fullscreen_enter"),
    AYUFA("Ayufa", "ic_settings");

    private final String title;
    private final String icon;

    SettingSection(String title, String icon) { this.title = title; this.icon = icon; }

    public String title() { return title; }
    public String icon() { return icon; }
}
