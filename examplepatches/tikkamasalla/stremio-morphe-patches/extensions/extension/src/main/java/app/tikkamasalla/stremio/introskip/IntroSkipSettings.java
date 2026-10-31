package app.tikkamasalla.stremio.introskip;

import android.content.Context;

import androidx.preference.ListPreference;
import androidx.preference.Preference;
import androidx.preference.PreferenceCategory;
import androidx.preference.PreferenceFragmentCompat;
import androidx.preference.PreferenceScreen;
import androidx.preference.SwitchPreference;

/**
 * Adds the "Intro skip" section to Stremio Settings. Called once from
 * PreferencesFragment.onCreatePreferences, for the root screen and for each
 * sub-screen. Everything is fail-soft: any problem leaves Settings unchanged
 * and the skip keeps working with defaults.
 */
public final class IntroSkipSettings {
    private IntroSkipSettings() {
    }

    public static void add(PreferenceFragmentCompat fragment) {
        try {
            addInternal(fragment);
        } catch (Throwable error) {
            // Settings rows are optional; defaults stay on.
            android.util.Log.w("IntroSkip", "settings rows not added", error);
        }
    }

    private static void addInternal(PreferenceFragmentCompat fragment) {
        if (fragment == null || fragment.getActivity() == null) return;
        if (fragment.findPreference(IntroSkipPrefs.KEY_ENABLED) != null) return;
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
        section.setKey("introskip_category");
        section.setTitle("Intro skip");
        // Attach first: a category only gets its PreferenceManager once it is in the screen.
        target.addPreference(section);

        addSwitch(section, context, IntroSkipPrefs.KEY_ENABLED, "Skip intros",
                "Skip intros and recaps during playback", IntroSkipPrefs.isEnabled(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_ANIME,
                "Skip anime openings (AniSkip)", "Look up anime openings online",
                IntroSkipPrefs.isAnimeEnabled(context));
        addMode(section, modeRow(context), IntroSkipPrefs.mode(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_RECAPS, "Skip recaps",
                "Skip recap segments too", IntroSkipPrefs.isRecapsEnabled(context));
        addCredits(section, creditsRow(context), IntroSkipPrefs.creditsMode(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_PREVIEWS, "Skip previews",
                "Skip preview segments too", IntroSkipPrefs.isPreviewsEnabled(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_BINGE_EXTERNAL,
                "Auto-play next episode in external player",
                "Start the next episode in the same external player when one finishes",
                IntroSkipPrefs.isBingeExternalEnabled(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_TRACKMEM,
                "Remember tracks per show",
                "Reuse the last audio and subtitle choice for other episodes",
                IntroSkipPrefs.isTrackMemEnabled(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_AUTOPICK,
                "Auto-pick best stream",
                "Play the top ranked stream without showing the list",
                IntroSkipPrefs.isAutoPickEnabled(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_SHOWLIST,
                "Always show stream list",
                "Never auto-pick, always show every stream",
                IntroSkipPrefs.isShowListEnabled(context));
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

    private static void addMode(PreferenceCategory section, ListPreference row, String stored) {
        section.addPreference(row);
        row.setValue(stored);
        row.setSummary(modeSummary(stored));
    }

    private static void addCredits(PreferenceCategory section, ListPreference row, String stored) {
        section.addPreference(row);
        row.setValue(stored);
        row.setSummary(creditsSummary(stored));
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
                    IntroSkipPrefs.prefs(preference.getContext()).edit()
                            .putBoolean(key, Boolean.TRUE.equals(newValue)).apply();
                } catch (Throwable ignored) {
                    return false;
                }
                return true;
            }
        });
        return row;
    }

    private static ListPreference modeRow(Context context) {
        final ListPreference row = new ListPreference(context);
        row.setKey(IntroSkipPrefs.KEY_MODE);
        row.setTitle("Skip mode");
        row.setEntries(new CharSequence[]{"Auto", "Manual"});
        row.setEntryValues(new CharSequence[]{IntroSkipPrefs.MODE_AUTO, IntroSkipPrefs.MODE_MANUAL});
        row.setPersistent(false);
        String value = IntroSkipPrefs.mode(context);
        row.setValue(value);
        row.setSummary(modeSummary(value));
        row.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener() {
            @Override
            public boolean onPreferenceChange(Preference preference, Object newValue) {
                String next = String.valueOf(newValue);
                try {
                    IntroSkipPrefs.prefs(preference.getContext()).edit()
                            .putString(IntroSkipPrefs.KEY_MODE, next).apply();
                } catch (Throwable ignored) {
                    return false;
                }
                preference.setSummary(modeSummary(next));
                return true;
            }
        });
        return row;
    }

    private static String modeSummary(String value) {
        return IntroSkipPrefs.MODE_MANUAL.equals(value)
                ? "Show the button, never skip alone"
                : "Skip automatically";
    }

    private static ListPreference creditsRow(Context context) {
        final ListPreference row = new ListPreference(context);
        row.setKey(IntroSkipPrefs.KEY_CREDITS);
        row.setTitle("Skip credits");
        row.setEntries(new CharSequence[]{"Auto", "Button", "Off"});
        row.setEntryValues(new CharSequence[]{IntroSkipPrefs.CREDITS_AUTO,
                IntroSkipPrefs.CREDITS_BUTTON, IntroSkipPrefs.CREDITS_OFF});
        row.setPersistent(false);
        String value = IntroSkipPrefs.creditsMode(context);
        row.setValue(value);
        row.setSummary(creditsSummary(value));
        row.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener() {
            @Override
            public boolean onPreferenceChange(Preference preference, Object newValue) {
                String next = String.valueOf(newValue);
                try {
                    IntroSkipPrefs.prefs(preference.getContext()).edit()
                            .putString(IntroSkipPrefs.KEY_CREDITS, next).apply();
                } catch (Throwable ignored) {
                    return false;
                }
                preference.setSummary(creditsSummary(next));
                return true;
            }
        });
        return row;
    }

    private static String creditsSummary(String value) {
        if (IntroSkipPrefs.CREDITS_AUTO.equals(value)) return "Skip automatically";
        if (IntroSkipPrefs.CREDITS_OFF.equals(value)) return "Never skip credits";
        return "Show the button";
    }
}
