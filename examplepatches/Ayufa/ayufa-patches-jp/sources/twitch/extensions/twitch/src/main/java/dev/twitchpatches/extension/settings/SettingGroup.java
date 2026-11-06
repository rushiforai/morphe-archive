package dev.twitchpatches.extension.settings;

import java.util.List;

public interface SettingGroup extends SettingEntry {
    List<? extends SettingEntry> children();
    default String emptyMessage() { return ""; }
}
