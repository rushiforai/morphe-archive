package dev.twitchpatches.extension.chat;

import android.app.Application;
import android.content.SharedPreferences;
import dev.twitchpatches.extension.settings.PatchSettings;
import dev.twitchpatches.extension.settings.SettingSection;
import dev.twitchpatches.extension.settings.ToggleSetting;
import dev.twitchpatches.extension.shared.ReactNativeRuntime;

public final class DeletedMessageSettings {
    private static volatile boolean enabled;
    private static SharedPreferences preferences;

    public static synchronized void initialize(Application application) {
        if (preferences != null) return;
        preferences = application.getSharedPreferences("twitch_patches_deleted_messages", 0);
        enabled = preferences.getBoolean("show_deleted_messages", true);
        ReactNativeRuntime.select(8);
        PatchSettings.register(new ToggleSetting() {
            @Override public String key() { return "show_deleted_messages"; }
            @Override public String title() { return "Show deleted messages"; }
            @Override public String summary() { return "Tap a deleted or moderated message to reveal its text."; }
            @Override public SettingSection section() { return SettingSection.CHAT; }
            @Override public boolean isEnabled() { return enabled(); }
            @Override public void setEnabled(boolean checked) {
                enabled = checked;
                preferences.edit().putBoolean(key(), checked).apply();
                ReactNativeRuntime.refresh();
            }
        });
    }

    public static boolean enabled() { return enabled; }
}
