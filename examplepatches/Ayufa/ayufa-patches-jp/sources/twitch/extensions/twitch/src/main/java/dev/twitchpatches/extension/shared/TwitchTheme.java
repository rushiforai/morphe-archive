package dev.twitchpatches.extension.shared;

import android.app.Application;
import android.content.ComponentCallbacks;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.preference.PreferenceManager;

@SuppressWarnings("deprecation")
final class TwitchTheme implements ComponentCallbacks, SharedPreferences.OnSharedPreferenceChangeListener {
    private static TwitchTheme instance;
    private final Application application;
    private final SharedPreferences preferences;

    private TwitchTheme(Application application) {
        this.application = application;
        preferences = PreferenceManager.getDefaultSharedPreferences(application);
        preferences.registerOnSharedPreferenceChangeListener(this);
        application.registerComponentCallbacks(this);
    }

    static void initialize(Application application) { instance = new TwitchTheme(application); }

    static boolean light() {
        if (instance == null) return false;
        return ThemeChoice.light(instance.preferences.getString("user_theme", "SYSTEM_DEFAULT"),
                (instance.application.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                        == Configuration.UI_MODE_NIGHT_YES);
    }

    @Override public void onSharedPreferenceChanged(SharedPreferences preferences, String key) {
        if ("user_theme".equals(key)) ReactNativeRuntime.refresh();
    }

    @Override public void onConfigurationChanged(Configuration configuration) { ReactNativeRuntime.refresh(); }
    @Override public void onLowMemory() { }
}
