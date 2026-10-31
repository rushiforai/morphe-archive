package app.tikkamasalla.stremio.introskip;

import android.content.Context;
import android.content.SharedPreferences;

import androidx.preference.Preference;
import androidx.preference.PreferenceCategory;
import androidx.preference.PreferenceFragmentCompat;
import androidx.preference.PreferenceManager;
import androidx.preference.PreferenceScreen;
import androidx.preference.SwitchPreference;

/**
 * Adds the Hide spoilers switch to Stremio Settings under Interface.
 * Same runtime approach as IntroSkipSettings: attach the category first,
 * then its children. Everything is fail soft and default OFF.
 */
public final class SpoilerSettings {
    private SpoilerSettings() {
    }

    public static void add(PreferenceFragmentCompat fragment) {
        try {
            addInternal(fragment);
        } catch (Throwable error) {
            android.util.Log.w("SpoilerHide", "settings row not added", error);
        }
    }

    private static void addInternal(PreferenceFragmentCompat fragment) {
        if (fragment == null || fragment.getActivity() == null) return;
        if (fragment.findPreference(SpoilerHide.KEY) != null) return;
        PreferenceScreen root = fragment.getPreferenceScreen();
        if (root == null) return;
        PreferenceScreen target;
        Preference sectionScreen = fragment.findPreference("prefs_interface");
        if (sectionScreen instanceof PreferenceScreen) {
            target = (PreferenceScreen) sectionScreen;
        } else if (root.getKey() == null) {
            target = root;
        } else {
            return;
        }
        Context context = fragment.getPreferenceManager().getContext();
        if (context == null) return;

        PreferenceCategory section = new PreferenceCategory(context);
        section.setKey("spoilerhide_category");
        section.setTitle("Spoilers");
        target.addPreference(section);

        final SwitchPreference row = new SwitchPreference(context);
        row.setKey(SpoilerHide.KEY);
        row.setTitle("Hide unwatched spoilers");
        row.setSummary("Hide thumbnails and synopses for unwatched episodes");
        row.setPersistent(false);
        row.setChecked(SpoilerHide.isEnabled());
        row.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener() {
            @Override
            public boolean onPreferenceChange(Preference preference, Object newValue) {
                try {
                    SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(
                            preference.getContext());
                    prefs.edit().putBoolean(SpoilerHide.KEY,
                            Boolean.TRUE.equals(newValue)).apply();
                } catch (Throwable ignored) {
                    return false;
                }
                return true;
            }
        });
        section.addPreference(row);
        // Set again after attach so the stored value is what the switch shows.
        row.setChecked(SpoilerHide.isEnabled());
    }
}
