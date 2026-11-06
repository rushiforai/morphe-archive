package dev.twitchpatches.extension.settings;

public interface SettingEntry {
    String key();
    String title();
    String summary();
    SettingSection section();
    default String icon() { return section().icon(); }
}
