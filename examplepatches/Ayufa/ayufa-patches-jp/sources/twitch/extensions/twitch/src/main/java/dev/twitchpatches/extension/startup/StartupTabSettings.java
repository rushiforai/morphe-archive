package dev.twitchpatches.extension.startup;

import android.app.Application;
import android.content.SharedPreferences;
import dev.twitchpatches.extension.settings.PatchSettings;
import dev.twitchpatches.extension.settings.SettingGroup;
import dev.twitchpatches.extension.settings.SettingSection;
import dev.twitchpatches.extension.settings.ToggleSetting;
import java.util.Arrays;
import java.util.List;

/**
 * Runtime policy for the Ayufa startup tab patch: remembers which home tab
 * Twitch opens on a cold start. The injected bridge wraps Twitch's default
 * home page provider and reads {@link #selectedTab()}; deep links and push
 * notifications carry their own page and never consult that provider, so
 * they keep their explicit page.
 */
public final class StartupTabSettings {
    private static volatile int selected = StartupTab.LIVE;
    private static SharedPreferences preferences;

    public static synchronized void initialize(Application application) {
        if (preferences != null) return;
        preferences = application.getSharedPreferences("twitch_patches_startup_tab", 0);
        selected = StartupTab.parse(preferences.getString("startup_tab", null));
        PatchSettings.register(new StartupTabGroup());
    }

    /**
     * The tab chosen in Patch settings, or -1 while the user has never
     * chosen one, in which case the bridge keeps Twitch's own default.
     */
    public static int selectedTab() {
        SharedPreferences prefs = preferences;
        return prefs != null && prefs.contains("startup_tab") ? selected : -1;
    }

    private static void select(int tab) {
        selected = tab;
        if (preferences != null)
            preferences.edit().putString("startup_tab", StartupTab.serialize(tab)).apply();
    }

    private static final class StartupTabGroup implements SettingGroup {
        @Override public String key() { return "startup_tab"; }
        @Override public String title() { return "起動時に開くタブ"; }
        @Override public String summary() { return "現在：" + StartupTab.label(selected); }
        @Override public SettingSection section() { return SettingSection.AYUFA; }
        @Override public List<ToggleSetting> children() {
            return Arrays.asList(
                    new TabSetting(StartupTab.FOLLOWING),
                    new TabSetting(StartupTab.LIVE),
                    new TabSetting(StartupTab.CLIPS));
        }
    }

    private static final class TabSetting implements ToggleSetting {
        private final int tab;

        TabSetting(int tab) { this.tab = tab; }

        @Override public String key() { return "startup_tab_" + StartupTab.serialize(tab); }
        @Override public String title() { return StartupTab.label(tab); }
        @Override public String summary() {
            return "アプリ起動時に" + StartupTab.label(tab) + "のタブで開きます。";
        }
        @Override public SettingSection section() { return SettingSection.AYUFA; }
        @Override public boolean isEnabled() { return selected == tab; }
        @Override public void setEnabled(boolean enabled) { if (enabled) select(tab); }
    }
}
