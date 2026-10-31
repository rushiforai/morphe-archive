package app.tikkamasalla.stremio.subs;

import android.content.Context;

import androidx.preference.Preference;
import androidx.preference.PreferenceCategory;
import androidx.preference.PreferenceFragmentCompat;
import androidx.preference.PreferenceScreen;
import androidx.preference.SwitchPreference;

/**
 * Adds the "Subtitles" section to Stremio Settings. Called once from
 * PreferencesFragment.onCreatePreferences, for the root screen and for each
 * sub-screen. Everything is fail-soft: any problem leaves Settings unchanged
 * and avoidance keeps working with defaults.
 */
public final class SdhSettings {
    private SdhSettings() {
    }

    public static void add(PreferenceFragmentCompat fragment) {
        try {
            addInternal(fragment);
        } catch (Throwable error) {
            android.util.Log.w("SdhAvoid", "settings rows not added", error);
        }
    }

    private static void addInternal(PreferenceFragmentCompat fragment) {
        if (fragment == null || fragment.getActivity() == null) return;
        if (fragment.findPreference(SdhPrefs.KEY_AVOID) != null) return;
        PreferenceScreen root = fragment.getPreferenceScreen();
        if (root == null) return;
        // Only the Playback screen gets the rows: on any other sub-screen (Server, About, ...)
        // "prefs_playback" is not found and the root has a key, so nothing is added there.
        PreferenceScreen target;
        Preference playback = fragment.findPreference("prefs_playback");
        if (playback instanceof PreferenceScreen) target = (PreferenceScreen) playback;
        else if (root.getKey() == null) target = root;
        else return;
        Context context = fragment.getPreferenceManager().getContext();
        if (context == null) return;

        PreferenceCategory section = new PreferenceCategory(context);
        section.setKey("sdh_category");
        section.setTitle("Subtitles");
        // Attach first: a category only gets its PreferenceManager once it is in the screen.
        target.addPreference(section);

        addSwitch(section, context, SdhPrefs.KEY_AVOID, "Avoid SDH/CC subtitles",
                "Pick full dialogue subtitles instead of hearing-impaired tracks",
                SdhPrefs.isAvoidEnabled(context));
        addSwitch(section, context, SdhPrefs.KEY_CLEAN,
                "Clean SDH text when no other subtitles",
                "Strip sound notes and speaker labels from the shown cues",
                SdhPrefs.isCleanEnabled(context));
    }

    /**
     * The rows are not persistent (the listener writes the value), so a default value would be
     * applied to the row on attach and hide the stored one. No default is set, and the stored
     * value is set again after the row is attached.
     */
    private static void addSwitch(PreferenceCategory section, Context context, String key,
                                  String title, String summary, boolean stored) {
        SwitchPreference row = switchRow(context, key, title, summary, stored);
        section.addPreference(row);
        row.setChecked(stored);
    }

    private static SwitchPreference switchRow(Context context, final String key,
                                              String title, String summary, boolean checked) {
        final SwitchPreference row = new SwitchPreference(context);
        row.setKey(key);
        row.setTitle(title);
        row.setSummary(summary);
        row.setPersistent(false);
        row.setChecked(checked);
        row.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener() {
            @Override
            public boolean onPreferenceChange(Preference preference, Object newValue) {
                try {
                    SdhPrefs.prefs(preference.getContext()).edit()
                            .putBoolean(key, Boolean.TRUE.equals(newValue)).apply();
                } catch (Throwable ignored) {
                    return false;
                }
                return true;
            }
        });
        return row;
    }
}
