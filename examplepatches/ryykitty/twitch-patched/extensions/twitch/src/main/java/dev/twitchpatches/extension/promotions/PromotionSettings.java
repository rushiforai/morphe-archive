package dev.twitchpatches.extension.promotions;

import android.app.Application;
import android.content.SharedPreferences;
import dev.twitchpatches.extension.settings.PatchSettings;
import dev.twitchpatches.extension.settings.ToggleSetting;
import dev.twitchpatches.extension.settings.SettingSection;
import dev.twitchpatches.extension.shared.ReactNativeRuntime;

public final class PromotionSettings {
    private static volatile boolean enabled;
    private static SharedPreferences preferences;

    public static synchronized void initialize(Application application) {
        if (preferences != null) return;
        preferences = application.getSharedPreferences("twitch_patches_promotions", 0);
        enabled = preferences.getBoolean("hide_turbo", true);
        ReactNativeRuntime.select(1);
        PatchSettings.register(new ToggleSetting() {
            @Override public String key() { return "hide_turbo"; }
            @Override public String title() { return "Hide Turbo promotions"; }
            @Override public String summary() { return "Hide Turbo entries, player upsells and Turbo purchase buttons in Drops cards."; }
            @Override public SettingSection section() { return SettingSection.PROMOTIONS; }
            @Override public boolean isEnabled() { return blocked(); }
            @Override public void setEnabled(boolean checked) {
                enabled = checked;
                preferences.edit().putBoolean("hide_turbo", checked).apply();
                ReactNativeRuntime.refresh();
            }
        });
    }

    public static boolean blocked() { return enabled; }

    public static boolean allowTurboTab(boolean original) { return original && !blocked(); }
}
