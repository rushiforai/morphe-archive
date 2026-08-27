package app.morphe.extension.music.patches.pinplaylist;

import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;


import java.util.ArrayList;
import java.util.List;

/**
 * SharedPreferences-backed settings storage and optional Morphe UI bridge.
 *
 * The UI bridge only attaches the feature switch to Morphe's existing
 * top-level Player screen. It never creates, renames, moves, merges, titles,
 * or assigns an icon to a Player screen.
 */
@SuppressWarnings("deprecation")
public final class PinPlaylistSettings {
    public static final String KEY_ENABLED =
            "morphe_music_replace_pin_to_speed_dial";

    private static final String LEGACY_KEY_SEPARATE_MENU_ITEM =
            "morphe_music_pin_playlist_separate_menu_item";

    private static final String LEGACY_LIBRARY_SCREEN_KEY =
            "morphe_music_pin_playlists_library";

    private static final String PLAYER_SCREEN_KEY_PREFIX =
            "morphe_settings_music_screen_";

    private static final String PLAYER_SCREEN_KEY_MARKER =
            "_player";

    private static final String ENABLED_TITLE =
            "Enable Pin playlists";

    private static final String ENABLED_SUMMARY =
            "Enable persistent Library playlist pinning and visible pin indicators";

    private static final Object LOCK = new Object();

    private static volatile SharedPreferences preferences;
    private static volatile boolean enabled = false;


    public static boolean isEnabled(Context context) {
        initialize(context);
        return enabled;
    }

    /**
     * Adds the Pin playlists switch to Morphe's existing top-level Player
     * screen. If that screen is absent, no settings UI is created.
     */
    public static void installPreferencePath(Object fragmentObject) {
        if (!(fragmentObject instanceof PreferenceFragment)) return;

        PreferenceFragment fragment =
                (PreferenceFragment) fragmentObject;

        Context context = fragment.getActivity();
        PreferenceScreen root = fragment.getPreferenceScreen();

        if (context == null || root == null) return;

        PreferenceScreen player =
                findExistingPlayerScreen(root);

        if (player == null) return;

        initialize(context);

        SwitchPreference enabledPreference = extractSwitch(
                root,
                context,
                KEY_ENABLED,
                ENABLED_TITLE,
                ENABLED_SUMMARY
        );

        removeExactPreferences(
                root,
                LEGACY_KEY_SEPARATE_MENU_ITEM
        );

        removeLegacyLibraryScreens(player);

        player.addPreference(enabledPreference);
        enabledPreference.setChecked(
                preferences != null
                        && preferences.getBoolean(
                                KEY_ENABLED,
                                false
                        )
        );
    }

    private static void initialize(Context context) {
        if (preferences != null || context == null) return;

        Context appContext = context.getApplicationContext();
        Context safeContext =
                appContext != null ? appContext : context;

        synchronized (LOCK) {
            if (preferences != null) return;

            SharedPreferences loaded =
                    PreferenceManager.getDefaultSharedPreferences(
                            safeContext
                    );

            enabled = loaded.getBoolean(KEY_ENABLED, false);

            if (loaded.contains(LEGACY_KEY_SEPARATE_MENU_ITEM)) {
                loaded.edit()
                        .remove(LEGACY_KEY_SEPARATE_MENU_ITEM)
                        .apply();
            }


            preferences = loaded;
        }
    }

    /**
     * Finds only an already-existing direct child whose key follows Morphe's
     * numbered Player-screen key convention. Numbering changes do not require
     * creating or modifying a screen.
     */
    private static PreferenceScreen findExistingPlayerScreen(
            PreferenceScreen root
    ) {
        for (
                int index = 0;
                index < root.getPreferenceCount();
                index++
        ) {
            Preference preference = root.getPreference(index);

            if (!(preference instanceof PreferenceScreen)) {
                continue;
            }

            if (isPlayerScreenKey(preference.getKey())) {
                return (PreferenceScreen) preference;
            }
        }

        return null;
    }

    private static boolean isPlayerScreenKey(String key) {
        if (
                key == null ||
                !key.startsWith(PLAYER_SCREEN_KEY_PREFIX)
        ) {
            return false;
        }

        int markerIndex = key.indexOf(
                PLAYER_SCREEN_KEY_MARKER,
                PLAYER_SCREEN_KEY_PREFIX.length()
        );

        if (markerIndex < 0) return false;

        String ordinal = key.substring(
                PLAYER_SCREEN_KEY_PREFIX.length(),
                markerIndex
        );

        if (ordinal.isEmpty()) return false;

        for (int index = 0; index < ordinal.length(); index++) {
            if (!Character.isDigit(ordinal.charAt(index))) {
                return false;
            }
        }

        String suffix = key.substring(
                markerIndex + PLAYER_SCREEN_KEY_MARKER.length()
        );

        return suffix.isEmpty() ||
                suffix.startsWith("_sort_by_");
    }

    private static SwitchPreference extractSwitch(
            PreferenceScreen root,
            Context context,
            String key,
            String title,
            String summary
    ) {
        List<PreferenceLocation> matches = new ArrayList<>();

        collectExactPreferences(root, key, matches);

        SwitchPreference result = null;

        for (PreferenceLocation location : matches) {
            if (
                    result == null &&
                    location.preference instanceof SwitchPreference
            ) {
                result =
                        (SwitchPreference) location.preference;
            }
        }

        for (PreferenceLocation location : matches) {
            location.parent.removePreference(
                    location.preference
            );
        }

        if (result == null) {
            result = new SwitchPreference(context);
        }

        result.setKey(key);
        result.setTitle(title);
        result.setSummary(summary);
        result.setPersistent(false);
        result.setDefaultValue(Boolean.FALSE);
        result.setOnPreferenceChangeListener((preference, newValue) -> {
            if (!(newValue instanceof Boolean)) return false;

            SharedPreferences target = preferences;

            if (target == null) {
                Context appContext = context.getApplicationContext();
                Context safeContext =
                        appContext != null ? appContext : context;

                target = PreferenceManager.getDefaultSharedPreferences(
                        safeContext
                );
            }

            target.edit()
                    .putBoolean(key, (Boolean) newValue)
                    .apply();

            showRestartDialog(context);

            // Runtime remains cached until the app process restarts.
            return true;
        });

        return result;
    }

    private static void removeLegacyLibraryScreens(
            PreferenceScreen player
    ) {
        List<Preference> matches = new ArrayList<>();

        for (
                int index = 0;
                index < player.getPreferenceCount();
                index++
        ) {
            Preference preference =
                    player.getPreference(index);

            if (
                    preference instanceof PreferenceScreen &&
                    LEGACY_LIBRARY_SCREEN_KEY.equals(
                            preference.getKey()
                    )
            ) {
                matches.add(preference);
            }
        }

        for (Preference match : matches) {
            player.removePreference(match);
        }
    }

    private static void removeExactPreferences(
            PreferenceGroup group,
            String key
    ) {
        List<Preference> directMatches = new ArrayList<>();
        List<PreferenceGroup> childGroups = new ArrayList<>();

        for (
                int index = 0;
                index < group.getPreferenceCount();
                index++
        ) {
            Preference preference =
                    group.getPreference(index);

            if (key.equals(preference.getKey())) {
                directMatches.add(preference);
            }

            if (preference instanceof PreferenceGroup) {
                childGroups.add(
                        (PreferenceGroup) preference
                );
            }
        }

        for (Preference match : directMatches) {
            group.removePreference(match);
        }

        for (PreferenceGroup childGroup : childGroups) {
            removeExactPreferences(childGroup, key);
        }
    }

    private static void collectExactPreferences(
            PreferenceGroup group,
            String key,
            List<PreferenceLocation> result
    ) {
        for (
                int index = 0;
                index < group.getPreferenceCount();
                index++
        ) {
            Preference preference =
                    group.getPreference(index);

            if (key.equals(preference.getKey())) {
                result.add(
                        new PreferenceLocation(
                                group,
                                preference
                        )
                );
            }

            if (preference instanceof PreferenceGroup) {
                collectExactPreferences(
                        (PreferenceGroup) preference,
                        key,
                        result
                );
            }
        }
    }

    private static final class PreferenceLocation {
        final PreferenceGroup parent;
        final Preference preference;

        PreferenceLocation(
                PreferenceGroup parent,
                Preference preference
        ) {
            this.parent = parent;
            this.preference = preference;
        }
    }

    /**
     * Shows the restart prompt required after changing the process-cached
     * Pin playlists feature state.
     *
     * Kept local so Pin playlists does not depend on Morphe's complete shared
     * settings framework merely for restart UI.
     */
    private static void showRestartDialog(Context context) {
        if (context == null) return;

        new AlertDialog.Builder(context)
                .setTitle("Restart required")
                .setMessage("Restart YouTube Music to apply this change.")
                .setNegativeButton("Later", null)
                .setPositiveButton(
                        "Restart",
                        (dialog, which) -> restartApp(context)
                )
                .show();
    }

    private static void restartApp(Context context) {
        Intent launchIntent =
                context.getPackageManager()
                        .getLaunchIntentForPackage(context.getPackageName());

        if (launchIntent != null) {
            launchIntent.addFlags(
                    Intent.FLAG_ACTIVITY_NEW_TASK |
                    Intent.FLAG_ACTIVITY_CLEAR_TASK
            );
            context.startActivity(launchIntent);
        }

        android.os.Process.killProcess(android.os.Process.myPid());
    }
    private PinPlaylistSettings() {
    }
}
