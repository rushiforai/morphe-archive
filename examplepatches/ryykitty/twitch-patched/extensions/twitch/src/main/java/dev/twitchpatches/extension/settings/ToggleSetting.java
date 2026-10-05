package dev.twitchpatches.extension.settings;

public interface ToggleSetting {
    String key();
    String title();
    String summary();
    SettingSection section();
    boolean isEnabled();
    void setEnabled(boolean enabled);
}
