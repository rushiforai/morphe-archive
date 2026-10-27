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
        entries.add(playerButton(registry, "clip", "Clip button", "ic_clip"));
        entries.add(playerButton(registry, "cast", "Cast button", "chromecast"));
        entries.add(playerButton(registry, "share", "Share button", "ic_share"));
        entries.add(channelButton(registry, "subscribe", "Subscribe button", "ic_subscribe", true));
        entries.add(channelButton(registry, "gift", "Gift buttons", "ic_gift", true));
        entries.add(channelButton(registry, "bits", "Bits button", "ic_bits", false));
        entries.add(registry.register("hide_channel_extensions", "Hide channel extensions",
                "Hide extension buttons above chat.", SettingSection.CHANNEL_ACTIONS, "ic_extensions"));
        entries.add(registry.register("hide_hype_trains", "Hide Hype Trains",
                "Hide Hype Train banners and player overlays.", SettingSection.CHAT_OVERLAYS, "ic_settings"));
        List<ToggleSetting> leaderboards = new ArrayList<>();
        leaderboards.add(registry.register("hide_leaderboards", "Hide rankings",
                "Hide channel rankings and their chat entry point.", SettingSection.CHAT_OVERLAYS, "ic_trophy"));
        if (hasLeaderboard)
            leaderboards.add(registry.register("vertical_header_hide_leaderboard", "Hide player button",
                    "Hide the leaderboard button above the video.", SettingSection.CHAT_OVERLAYS, "ic_trophy"));
        entries.add(group(registry, "leaderboards", "Leaderboards", SettingSection.CHAT_OVERLAYS, "ic_trophy",
                "", "Hide everywhere", leaderboards));
        List<ToggleSetting> bars = Arrays.asList(
                registry.register("fullscreen_hide_status_bar", "Hide status bar",
                        "Use the camera cutout area during fullscreen playback.", SettingSection.DISPLAY, "ic_fullscreen_enter"),
                registry.register("fullscreen_hide_navigation_bar", "Hide navigation bar",
                        "Hide Android's navigation controls during fullscreen playback.", SettingSection.DISPLAY, "ic_fullscreen_enter"));
        entries.add(group(registry, "system_bars", "System bars", SettingSection.DISPLAY, "ic_fullscreen_enter",
                "Landscape fullscreen playback.", "Hide both bars", bars));
        return entries;
    }

    private static SettingGroup playerButton(UiFeatureRegistry registry, String part, String title, String icon) {
        SettingSection section = SettingSection.PLAYER_CONTROLS;
        List<ToggleSetting> locations = Arrays.asList(
                registry.register("classic_controls_hide_" + part, "Hide in Classic Split",
                        "Includes fullscreen playback.", section, icon),
                registry.register("vertical_controls_hide_" + part, "Hide in Vertical View",
                        part.equals("cast") ? "Applies when casting is available." : "", section, icon));
        return group(registry, part, title, section, icon, "", "Hide everywhere", locations);
    }

    private static SettingGroup channelButton(UiFeatureRegistry registry, String part, String title, String icon, boolean header) {
        SettingSection section = SettingSection.CHANNEL_ACTIONS;
        List<ToggleSetting> locations = new ArrayList<>();
        locations.add(registry.register("classic_support_hide_" + part, "Hide in Classic Split",
                "Includes fullscreen playback.", section, icon));
        locations.add(registry.register("vertical_support_hide_" + part, "Hide in Vertical View",
                part.equals("bits") ? "Chat input button." : "Channel actions below the video.", section, icon));
        if (header)
            locations.add(registry.register("vertical_header_hide_" + part, "Hide in Vertical View header",
                    "Channel actions above the video.", section, icon));
        return group(registry, part, title, section, icon, "", "Hide everywhere", locations);
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
