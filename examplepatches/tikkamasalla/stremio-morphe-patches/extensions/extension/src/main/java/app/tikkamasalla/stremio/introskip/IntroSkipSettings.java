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
    // Row texts shared with the Mod settings screen (compile-time constants: inlined, no class load).
    public static final String T_ENABLED = "Skip intros";
    public static final String S_ENABLED = "Skip intros and recaps during playback";
    public static final String T_ANIME = "Skip anime openings (AniSkip)";
    public static final String S_ANIME = "Look up anime openings online";
    public static final String T_MODE = "Skip mode";
    public static final String S_MODE_AUTO = "Skip automatically";
    public static final String S_MODE_MANUAL = "Show the button, never skip alone";
    public static final String T_RECAPS = "Skip recaps";
    public static final String S_RECAPS = "Skip recap segments too";
    public static final String T_CREDITS = "Skip credits";
    public static final String S_CREDITS_AUTO = "Skip automatically";
    public static final String S_CREDITS_BUTTON = "Show the button";
    public static final String S_CREDITS_OFF = "Never skip credits";
    public static final String T_PREVIEWS = "Skip previews";
    public static final String S_PREVIEWS = "Skip preview segments too";
    public static final String T_SEEKMARKS = "Show skip marks";
    public static final String S_SEEKMARKS = "Coloured marks on the progress bar where a skip is offered";
    public static final String T_BINGE = "Auto-play next episode in external player";
    public static final String S_BINGE = "Start the next episode in the same external player when one finishes";
    public static final String T_FORGET = "Forget remembered player";
    public static final String S_FORGET = "Ask again which external player to use";
    public static final String M_FORGET_DONE = "Remembered player forgotten";
    public static final String M_FORGET_NONE = "No remembered player";
    public static final String T_TRACKMEM = "Remember tracks per show";
    public static final String S_TRACKMEM = "Reuse the last audio and subtitle choice for other episodes";
    public static final String T_AUTOPICK = "Auto-pick best stream";
    public static final String S_AUTOPICK = "Play the top ranked stream without showing the list";
    public static final String T_DIARY = "Keep playback diary";
    public static final String S_DIARY = "A small log of lookups, skips and stalls that a PC can read over adb (no links or accounts)";
    public static final String T_SHOWLIST = "Always show stream list";
    public static final String S_SHOWLIST = "Never auto-pick, always show every stream";
    public static final String T_PREPARE = "Prepare next episode";
    public static final String S_PREPARE = "Near the end, find the next episode's stream and skip times so Next starts at once";
    public static final String T_ONEAHEAD = "Work out missing skip times";
    public static final String S_ONEAHEAD = "Works out missing skip times from upcoming episodes in the background and uses them like any other source";
    public static final String T_BORROW = "Borrow chapters from other releases";
    public static final String S_BORROW = "Copies intro and credits marks from another release of the same episode when the audio lines up";

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

        addSwitch(section, context, IntroSkipPrefs.KEY_ENABLED, T_ENABLED,
                S_ENABLED, IntroSkipPrefs.isEnabled(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_ANIME,
                T_ANIME, S_ANIME,
                IntroSkipPrefs.isAnimeEnabled(context));
        addMode(section, modeRow(context), IntroSkipPrefs.mode(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_RECAPS, T_RECAPS,
                S_RECAPS, IntroSkipPrefs.isRecapsEnabled(context));
        addCredits(section, creditsRow(context), IntroSkipPrefs.creditsMode(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_PREVIEWS, T_PREVIEWS,
                S_PREVIEWS, IntroSkipPrefs.isPreviewsEnabled(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_SEEKMARKS, T_SEEKMARKS,
                S_SEEKMARKS, IntroSkipPrefs.isSeekMarksEnabled(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_BINGE_EXTERNAL,
                T_BINGE,
                S_BINGE,
                IntroSkipPrefs.isBingeExternalEnabled(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_TRACKMEM,
                T_TRACKMEM,
                S_TRACKMEM,
                IntroSkipPrefs.isTrackMemEnabled(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_AUTOPICK,
                T_AUTOPICK,
                S_AUTOPICK,
                IntroSkipPrefs.isAutoPickEnabled(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_SHOWLIST,
                T_SHOWLIST,
                S_SHOWLIST,
                IntroSkipPrefs.isShowListEnabled(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_PREPARE_NEXT, T_PREPARE, S_PREPARE,
                IntroSkipPrefs.isPrepareNextEnabled(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_ONEAHEAD, T_ONEAHEAD, S_ONEAHEAD,
                IntroSkipPrefs.isOneAheadEnabled(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_BORROW, T_BORROW, S_BORROW,
                IntroSkipPrefs.isBorrowEnabled(context));
        addSwitch(section, context, IntroSkipPrefs.KEY_DIARY, T_DIARY, S_DIARY,
                IntroSkipPrefs.isDiaryEnabled(context));
        addForgetPlayer(section, context);
    }

    private static void addForgetPlayer(PreferenceCategory section, Context context) {
        Preference row = new Preference(context);
        row.setKey("introskip_forget_player");
        row.setTitle(T_FORGET);
        row.setSummary(S_FORGET);
        row.setPersistent(false);
        row.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() {
            @Override
            public boolean onPreferenceClick(Preference preference) {
                try {
                    Context c = preference.getContext();
                    boolean had = IntroSkipPrefs.forgetExternalPlayer(c);
                    android.widget.Toast.makeText(c, had ? M_FORGET_DONE : M_FORGET_NONE,
                            android.widget.Toast.LENGTH_SHORT).show();
                } catch (Throwable ignored) {
                    return false;
                }
                return true;
            }
        });
        section.addPreference(row);
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
        row.setTitle(T_MODE);
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
                ? S_MODE_MANUAL
                : S_MODE_AUTO;
    }

    private static ListPreference creditsRow(Context context) {
        final ListPreference row = new ListPreference(context);
        row.setKey(IntroSkipPrefs.KEY_CREDITS);
        row.setTitle(T_CREDITS);
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
        if (IntroSkipPrefs.CREDITS_AUTO.equals(value)) return S_CREDITS_AUTO;
        if (IntroSkipPrefs.CREDITS_OFF.equals(value)) return S_CREDITS_OFF;
        return S_CREDITS_BUTTON;
    }
}
