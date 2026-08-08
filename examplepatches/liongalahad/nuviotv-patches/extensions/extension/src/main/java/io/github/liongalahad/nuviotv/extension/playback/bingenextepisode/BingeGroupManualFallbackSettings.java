package io.github.liongalahad.nuviotv.extension.playback.bingenextepisode;

import android.content.Context;
import android.content.SharedPreferences;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime;

/** Preference state owned exclusively by Binge Group Manual Fallback. */
public final class BingeGroupManualFallbackSettings {
    public static final String KEY = "playback.binge_group_manual_fallback";
    public static final String TITLE = "Binge Group Manual Fallback";
    public static final String DESCRIPTION =
            "When Prefer Binge Group is enabled and no matching next-episode source is found, " +
            "open the source picker instead of selecting another source.";

    private BingeGroupManualFallbackSettings() {}

    public static boolean isEnabled() { return read(preferences()); }

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
        try { return preferences.getBoolean(KEY, false); }
        catch (ClassCastException ignored) { return false; }
    }
}
