package dev.twitchpatches.extension.promotions;

import android.app.Application;
import android.content.SharedPreferences;
import dev.twitchpatches.extension.settings.PatchSettings;
import dev.twitchpatches.extension.settings.ToggleSetting;
import dev.twitchpatches.extension.settings.SettingSection;
import dev.twitchpatches.extension.shared.ReactNativeRuntime;

public final class SubscriptionBannerSettings {
    private static volatile boolean enabled;
    private static SharedPreferences preferences;

    public static synchronized void initialize(Application application) {
        if (preferences != null) return;
        preferences = application.getSharedPreferences("twitch_patches_subscription_banners", 0);
        enabled = preferences.getBoolean("hide_subscription_banners", true);
        ReactNativeRuntime.select(2);
        PatchSettings.register(new ToggleSetting() {
            @Override public String key() { return "hide_subscription_banners"; }
            @Override public String title() { return "Hide subscription discount banners"; }
            @Override public String summary() { return "Hide subscription offer banners, highlight cards and promotional labels. Keep train announcements."; }
            @Override public SettingSection section() { return SettingSection.PROMOTIONS; }
            @Override public boolean isEnabled() { return blocked(); }
            @Override public void setEnabled(boolean checked) {
                enabled = checked;
                preferences.edit().putBoolean(key(), checked).apply();
                ReactNativeRuntime.refresh();
            }
        });
    }

    public static boolean blocked() { return enabled; }
}
