package dev.twitchpatches.extension.ads;

import android.app.Application;
import android.content.SharedPreferences;
import dev.twitchpatches.extension.settings.PatchSettings;
import dev.twitchpatches.extension.settings.ToggleSetting;
import dev.twitchpatches.extension.settings.SettingSection;
import dev.twitchpatches.extension.shared.ReactNativeRuntime;

public final class AdSettings {
    private static volatile AdSettings instance;
    private final SharedPreferences preferences;
    private final boolean[] selected = new boolean[3];
    private final boolean[] enabled = new boolean[3];
    private static final String[] KEYS = {"client_ads", "display_ads", "stitched_ads"};
    private static final String[] TITLES = {"Block client-requested ads", "Hide feed and display ads",
            "Block stream ads"};
    private static final String[] SUMMARIES = {"Suppress native ad requests. Restart Twitch after changing this setting.",
            "Remove sponsored feed cards and display ads.",
            "Replace detected ads with alternate direct Twitch playback."};

    private AdSettings(Application application) {
        preferences = application.getSharedPreferences("twitch_patches_ads", 0);
    }

    public static void initialize(Application application, int feature) {
        synchronized (AdSettings.class) {
            if (instance == null) instance = new AdSettings(application);
            if (feature < 0 || feature >= KEYS.length || instance.selected[feature]) return;
            instance.selected[feature] = true;
            instance.enabled[feature] = instance.preferences.getBoolean(KEYS[feature], true);
        }
        if (feature == 1) ReactNativeRuntime.select(3);
        if (feature == 2) ReactNativeRuntime.select(5);
        PatchSettings.register(new ToggleSetting() {
            @Override public String key() { return KEYS[feature]; }
            @Override public String title() { return TITLES[feature]; }
            @Override public String summary() { return SUMMARIES[feature]; }
            @Override public SettingSection section() { return SettingSection.ADS; }
            @Override public boolean isEnabled() { return enabled(feature); }
            @Override public void setEnabled(boolean checked) { set(feature, checked); }
        });
    }

    public static synchronized boolean enabled(int feature) {
        return instance != null && instance.selected[feature] && instance.enabled[feature];
    }

    private static void set(int feature, boolean checked) {
        synchronized (AdSettings.class) {
            if (instance == null) return;
            instance.enabled[feature] = checked;
            instance.preferences.edit().putBoolean(KEYS[feature], checked).apply();
        }
        if (feature == 2) AdRuntime.policyChanged();
        if (feature == 1 || feature == 2) ReactNativeRuntime.refresh();
    }

    public static boolean allowClientAds(boolean original) { return !enabled(0) && original; }
    public static boolean displayAdsBlocked() { return enabled(1); }
}
