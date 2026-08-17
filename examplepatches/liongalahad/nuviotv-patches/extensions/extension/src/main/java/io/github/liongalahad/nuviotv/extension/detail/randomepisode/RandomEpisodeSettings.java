package io.github.liongalahad.nuviotv.extension.detail.randomepisode;

import android.content.Context;
import android.content.SharedPreferences;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime;

/** Preference state owned exclusively by the Random Episode patch. */
public final class RandomEpisodeSettings {
    public static final String KEY = "detail.random_episode_button";
    public static final String TITLE = "Show Random Episode Button";
    public static final String DESCRIPTION = "Show a shuffle button on series detail pages.";

    private RandomEpisodeSettings() {}

    public static boolean isEnabled() {
        return read(preferences());
    }

    public static boolean toggle() {
        SharedPreferences preferences = preferences();
        boolean enabled = !read(preferences);
        preferences.edit().putBoolean(KEY, enabled).commit();
        return enabled;
    }

    public static void setEnabled(Context context, boolean enabled) {
        MorpheSettingsRuntime.initialize(context);
        context.getApplicationContext()
                .getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, Context.MODE_PRIVATE)
                .edit().putBoolean(KEY, enabled).commit();
    }

    private static SharedPreferences preferences() {
        Context context = MorpheSettingsRuntime.applicationContext();
        if (context == null) throw new IllegalStateException("Morphe settings were not initialized");
        return context.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, Context.MODE_PRIVATE);
    }

    private static boolean read(SharedPreferences preferences) {
        try { return preferences.getBoolean(KEY, true); }
        catch (ClassCastException ignored) { return false; }
    }
}
