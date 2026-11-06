package dev.twitchpatches.extension.settings;

public interface ToggleSetting extends SettingEntry {
    boolean isEnabled();
    void setEnabled(boolean enabled);
}
