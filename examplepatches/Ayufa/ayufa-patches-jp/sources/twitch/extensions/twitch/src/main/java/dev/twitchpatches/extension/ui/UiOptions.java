package dev.twitchpatches.extension.ui;

import dev.twitchpatches.extension.settings.SettingEntry;
import dev.twitchpatches.extension.settings.SettingGroup;
import dev.twitchpatches.extension.settings.SettingSection;
import dev.twitchpatches.extension.settings.ToggleSetting;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

final class UiOptions {
    static List<SettingEntry> create(UiFeatureRegistry registry, boolean hasLeaderboard) {
        List<SettingEntry> entries = new ArrayList<>();
        entries.add(playerButton(registry, "clip", "クリップボタン", "ic_clip"));
        entries.add(playerButton(registry, "cast", "キャストボタン", "chromecast"));
        entries.add(playerButton(registry, "share", "共有ボタン", "ic_share"));
        entries.add(channelButton(registry, "subscribe", "サブスクボタン", "ic_subscribe", true));
        entries.add(channelButton(registry, "gift", "ギフトボタン", "ic_gift", true));
        entries.add(channelButton(registry, "bits", "ビッツボタン", "ic_bits", false));
        entries.add(registry.register("hide_channel_extensions", "チャンネル拡張機能を非表示",
                "チャットの上にある拡張機能ボタンを非表示にします。", SettingSection.CHANNEL_ACTIONS, "ic_extensions"));
        entries.add(registry.register("hide_hype_trains", "ハイプトレインを非表示",
                "ハイプトレインのバナーとプレイヤー上の表示を非表示にします。", SettingSection.CHAT_OVERLAYS, "ic_settings"));
        List<ToggleSetting> leaderboards = new ArrayList<>();
        leaderboards.add(registry.register("hide_leaderboards", "ランキングを非表示",
                "チャンネルランキングと、チャット内のランキング入口を非表示にします。", SettingSection.CHAT_OVERLAYS, "ic_trophy"));
        if (hasLeaderboard)
            leaderboards.add(registry.register("vertical_header_hide_leaderboard", "プレイヤーボタンを非表示",
                    "動画の上にあるランキングボタンを非表示にします。", SettingSection.CHAT_OVERLAYS, "ic_trophy"));
        entries.add(group(registry, "leaderboards", "ランキング", SettingSection.CHAT_OVERLAYS, "ic_trophy",
                "", "すべての場所で非表示", leaderboards));
        List<ToggleSetting> bars = Arrays.asList(
                registry.register("fullscreen_hide_status_bar", "ステータスバーを非表示",
                        "全画面再生中はカメラの切り欠き部分まで使います。", SettingSection.DISPLAY, "ic_fullscreen_enter"),
                registry.register("fullscreen_hide_navigation_bar", "ナビゲーションバーを非表示",
                        "全画面再生中はAndroidのナビゲーション操作を非表示にします。", SettingSection.DISPLAY, "ic_fullscreen_enter"));
        entries.add(group(registry, "system_bars", "システムバー", SettingSection.DISPLAY, "ic_fullscreen_enter",
                "横向きの全画面再生が対象です。", "両方のバーを非表示", bars));
        return entries;
    }

    private static SettingGroup playerButton(UiFeatureRegistry registry, String part, String title, String icon) {
        SettingSection section = SettingSection.PLAYER_CONTROLS;
        List<ToggleSetting> locations = Arrays.asList(
                registry.register("classic_controls_hide_" + part, "クラシック分割表示で非表示",
                        "全画面再生も含まれます。", section, icon),
                registry.register("vertical_controls_hide_" + part, "縦型表示で非表示",
                        part.equals("cast") ? "キャストが使える場合に適用されます。" : "", section, icon));
        return group(registry, part, title, section, icon, "", "すべての場所で非表示", locations);
    }

    private static SettingGroup channelButton(UiFeatureRegistry registry, String part, String title, String icon, boolean header) {
        SettingSection section = SettingSection.CHANNEL_ACTIONS;
        List<ToggleSetting> locations = new ArrayList<>();
        locations.add(registry.register("classic_support_hide_" + part, "クラシック分割表示で非表示",
                "全画面再生も含まれます。", section, icon));
        locations.add(registry.register("vertical_support_hide_" + part, "縦型表示で非表示",
                part.equals("bits") ? "チャット入力ボタンです。" : "動画の下にあるチャンネル操作です。", section, icon));
        if (header)
            locations.add(registry.register("vertical_header_hide_" + part, "縦型表示のヘッダーで非表示",
                    "動画の上にあるチャンネル操作です。", section, icon));
        return group(registry, part, title, section, icon, "", "すべての場所で非表示", locations);
    }

    private static SettingGroup group(UiFeatureRegistry registry, String key, String title, SettingSection section,
            String icon, String description, String masterTitle, List<ToggleSetting> toggles) {
        ToggleSetting master = registry.master("ui_" + key + "_all", toggles, masterTitle, section);
        List<SettingEntry> entries = new ArrayList<>();
        entries.add(master);
        entries.addAll(toggles);
        return new SettingGroup() {
            @Override public String key() { return "ui_" + key; }
            @Override public String title() { return title; }
            @Override public String summary() { return description.isEmpty() ? master.summary() : description + " " + master.summary(); }
            @Override public SettingSection section() { return section; }
            @Override public String icon() { return icon; }
            @Override public List<? extends SettingEntry> children() { return entries; }
        };
    }
}
