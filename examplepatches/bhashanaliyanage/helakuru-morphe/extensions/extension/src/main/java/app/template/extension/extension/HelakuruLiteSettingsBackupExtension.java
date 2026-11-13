package app.template.extension.extension;

import android.app.AlertDialog;
import android.content.Intent;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import java.lang.ref.WeakReference;

/** Import/export entry point for the Morphe settings added to Helakuru Lite. */
public final class HelakuruLiteSettingsBackupExtension {
    public static final String PREFERENCE_KEY = "morphe_settings_backup";
    static final String EXTRA_MODE = "morphe_settings_backup_mode";
    static final String MODE_EXPORT = "export";
    static final String MODE_IMPORT = "import";
    private static WeakReference<PreferenceActivity> settingsActivity = new WeakReference<>(null);

    private HelakuruLiteSettingsBackupExtension() { }

    public static void bindSettings(Object activityObject) {
        if (!(activityObject instanceof PreferenceActivity)) return;
        PreferenceActivity activity = (PreferenceActivity) activityObject;
        try {
            Preference preference = activity.findPreference(PREFERENCE_KEY);
            if (preference == null) return;
            settingsActivity = new WeakReference<>(activity);
            preference.setOnPreferenceClickListener(clicked -> {
                new AlertDialog.Builder(activity)
                        .setTitle("Keyboard settings")
                        .setItems(new String[]{"Export settings", "Import settings"}, (dialog, which) ->
                                launch(activity, which == 0 ? MODE_EXPORT : MODE_IMPORT))
                        .setNegativeButton("Cancel", null)
                        .show();
                return true;
            });
            HelakuruLiteSettingsExtension.applySettingsWindow(activity);
        } catch (Throwable ignored) { }
    }

    private static void launch(PreferenceActivity activity, String mode) {
        try {
            Intent intent = new Intent(activity, HelakuruLiteSettingsBackupActivity.class);
            intent.putExtra(EXTRA_MODE, mode);
            activity.startActivity(intent);
        } catch (Throwable ignored) { }
    }

    static void refreshSettingsScreen() {
        PreferenceActivity activity = settingsActivity.get();
        if (activity == null || activity.isFinishing()) return;
        activity.runOnUiThread(activity::recreate);
    }
}
