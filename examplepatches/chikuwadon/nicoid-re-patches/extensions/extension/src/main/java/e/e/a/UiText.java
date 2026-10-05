package e.e.a;

import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceGroup;

/** XML preference titles, summaries and entries need localization after inflation. */
public final class UiText {
    private UiText() { }
    private static CharSequence text(CharSequence source) {
        return source == null ? null : UiStrings.translate(source.toString());
    }
    public static void preferences(Preference preference) {
        if (preference == null) return;
        preference.setTitle(text(preference.getTitle()));
        // ListPreference summaries may contain %s. Preserve the template.
        String key = preference.getKey();
        boolean selectedEntry = "default_playback_speed".equals(key) || "app_switch_playback".equals(key)
            || "back_playback".equals(key) || "quality_mode".equals(key);
        preference.setSummary(selectedEntry && preference instanceof ListPreference ? "%s" : text(preference.getSummary()));
        if (preference instanceof ListPreference) {
            ListPreference list = (ListPreference) preference;
            CharSequence[] entries = list.getEntries();
            if (entries != null) {
                CharSequence[] translated = new CharSequence[entries.length];
                for (int n = 0; n < entries.length; n++) translated[n] = text(entries[n]);
                list.setEntries(translated);
                // Entry values, defaults and saved settings deliberately stay untouched.
            }
        }
        if (preference instanceof PreferenceGroup) {
            PreferenceGroup group = (PreferenceGroup) preference;
            for (int n = 0; n < group.getPreferenceCount(); n++) preferences(group.getPreference(n));
        }
    }
}
