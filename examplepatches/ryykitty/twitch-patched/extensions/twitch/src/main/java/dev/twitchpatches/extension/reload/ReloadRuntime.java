package dev.twitchpatches.extension.reload;

import android.app.Application;
import android.content.SharedPreferences;
import android.widget.Toast;
import dev.twitchpatches.extension.settings.PatchSettings;
import dev.twitchpatches.extension.settings.SettingSection;
import dev.twitchpatches.extension.settings.ToggleSetting;
import dev.twitchpatches.extension.shared.ReactNativeRuntime;

public final class ReloadRuntime implements ToggleSetting {
    private static volatile ReloadRuntime instance;
    private final SharedPreferences preferences;
    private final Application application;
    private volatile boolean enabled;

    private ReloadRuntime(Application application) {
        this.application = application;
        preferences = application.getSharedPreferences("twitch_patches_reload", 0);
        enabled = preferences.getBoolean("enabled", true);
    }

    public static synchronized void initialize(Application application) {
        if (instance != null) return;
        instance = new ReloadRuntime(application);
        NativeReloadBridge.update(instance.enabled);
        ReactNativeRuntime.select(6);
        PatchSettings.register(instance);
    }

    public static boolean enabled() { return instance != null && instance.enabled; }
    static void showHint() {
        ReloadRuntime current = instance;
        if (current != null) Toast.makeText(current.application, "Double-tap to reload stream", Toast.LENGTH_SHORT).show();
    }
    @Override public String key() { return "reload_stream"; }
    @Override public String title() { return "Reload stream"; }
    @Override public String summary() { return "Enable double-tap reloading for live streams."; }
    @Override public SettingSection section() { return SettingSection.PLAYBACK; }
    @Override public boolean isEnabled() { return enabled; }
    @Override public void setEnabled(boolean value) {
        enabled = value;
        preferences.edit().putBoolean("enabled", value).apply();
        NativeReloadAction.resetGestures();
        NativeReloadViews.refreshPreferences();
        NativeReloadBridge.update(value);
        ReactNativeRuntime.refresh();
    }
}
