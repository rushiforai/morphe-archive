package io.github.liongalahad.nuviotv.extension.playback.sourceselectionrestore;

import android.content.Context;
import android.content.SharedPreferences;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime;

/** Preference state owned exclusively by Restore Source Selection. */
public final class SourceSelectionRestoreSettings {
    public static final String KEY = "playback.restore_source_selection";
    public static final String TITLE = "Restore source selection";
    public static final String DESCRIPTION =
            "Return focus and scroll to the source you played after leaving the player.";

    private SourceSelectionRestoreSettings() {}

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
        return context.getSharedPreferences(
                MorpheSettingsRuntime.PREFERENCES_NAME,
                Context.MODE_PRIVATE
        );
    }

    private static boolean read(SharedPreferences preferences) {
        try {
            return preferences.getBoolean(KEY, false);
        } catch (ClassCastException ignored) {
            return false;
        }
    }
}
