package app.morphe.extension.music.patches.pinplaylist;

import android.content.Context;
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
 * Standalone settings storage and UI materialization for Pin playlists.
 *
 * The single feature switch is attached directly to Morphe's Player screen.
 * Values use Android's default SharedPreferences; no Morphe Setting classes
 * or Morphe patch implementation classes are required.
 */
@SuppressWarnings("deprecation")
public final class PinPlaylistSettings {
    public static final String KEY_ENABLED =
            "morphe_music_replace_pin_to_speed_dial";

    private static final String LEGACY_KEY_SEPARATE_MENU_ITEM =
            "morphe_music_pin_playlist_separate_menu_item";
    private static final String LEGACY_LIBRARY_SCREEN_KEY =
            "morphe_music_pin_playlists_library";

    private static final String PLAYER_SCREEN_KEY =
            "morphe_settings_music_screen_3_player";
    private static final String PLAYER_SCREEN_SORTED_KEY =
            PLAYER_SCREEN_KEY + "_sort_by_title";

    private static final String PLAYER_TITLE = "Player";
    private static final String ENABLED_TITLE = "Enable Pin playlists";
    private static final String ENABLED_SUMMARY =
            "Enable persistent Library playlist pinning and visible pin indicators";

    private static final Object LOCK = new Object();

    private static volatile SharedPreferences preferences;
    private static volatile boolean enabled = true;

    private static final SharedPreferences.OnSharedPreferenceChangeListener
            PREFERENCE_LISTENER = (sharedPreferences, key) -> {
        if (KEY_ENABLED.equals(key)) {
            enabled = sharedPreferences.getBoolean(KEY_ENABLED, true);
        }
    };

    public static boolean isEnabled(Context context) {
        initialize(context);
        return enabled;
    }

    /**
     * Ensures Morphe > Player exists and places the one Pin playlists switch
     * directly inside it. Legacy Library screens and separate-menu switches
     * from earlier builds are removed from the live preference tree.
     */
    public static void installPreferencePath(Object fragmentObject) {
        if (!(fragmentObject instanceof PreferenceFragment)) return;

        PreferenceFragment fragment = (PreferenceFragment) fragmentObject;
        Context context = fragment.getActivity();
        PreferenceScreen root = fragment.getPreferenceScreen();

        if (context == null || root == null) return;

        initialize(context);

        PreferenceScreen player =
                ensurePlayerScreen(fragment, root, context);

        SwitchPreference enabledPreference = extractSwitch(
                root,
                context,
                KEY_ENABLED,
                ENABLED_TITLE,
                ENABLED_SUMMARY
        );

        removeExactPreferences(root, LEGACY_KEY_SEPARATE_MENU_ITEM);
        removeLegacyLibraryScreens(player);

        player.removePreference(enabledPreference);
        player.addPreference(enabledPreference);
    }

    private static void initialize(Context context) {
        if (preferences != null || context == null) return;

        Context appContext = context.getApplicationContext();
        Context safeContext = appContext != null ? appContext : context;

        synchronized (LOCK) {
            if (preferences != null) return;

            SharedPreferences loaded =
                    PreferenceManager.getDefaultSharedPreferences(safeContext);

            enabled = loaded.getBoolean(KEY_ENABLED, true);

            // This option no longer exists. Remove its persisted value so old
            // installations have the same one-setting state as clean installs.
            if (loaded.contains(LEGACY_KEY_SEPARATE_MENU_ITEM)) {
                loaded.edit()
                        .remove(LEGACY_KEY_SEPARATE_MENU_ITEM)
                        .apply();
            }

            loaded.registerOnSharedPreferenceChangeListener(
                    PREFERENCE_LISTENER
            );
            preferences = loaded;
        }
    }

    private static PreferenceScreen ensurePlayerScreen(
            PreferenceFragment fragment,
            PreferenceScreen root,
            Context context
    ) {
        List<PreferenceLocation> matches = new ArrayList<>();
        collectPlayerScreens(root, matches);

        PreferenceScreen player = chooseLargestScreen(matches);
        if (player == null) {
            player = fragment.getPreferenceManager()
                    .createPreferenceScreen(context);
            player.setKey(PLAYER_SCREEN_SORTED_KEY);
            root.addPreference(player);
        } else {
            moveToParent(matches, player, root);
            mergeDuplicateScreens(matches, player);
        }

        String key = player.getKey();
        if (key == null
                || (!PLAYER_SCREEN_KEY.equals(key)
                && !key.startsWith(PLAYER_SCREEN_KEY + "_sort_by_"))) {
            player.setKey(PLAYER_SCREEN_SORTED_KEY);
        }

        player.setTitle(PLAYER_TITLE);
        return player;
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
            if (result == null
                    && location.preference instanceof SwitchPreference) {
                result = (SwitchPreference) location.preference;
            }
        }

        // Detach every old copy before attaching exactly one to Player.
        for (PreferenceLocation location : matches) {
            location.parent.removePreference(location.preference);
        }

        if (result == null) {
            result = new SwitchPreference(context);
        }

        result.setKey(key);
        result.setTitle(title);
        result.setSummary(summary);
        result.setPersistent(true);
        result.setDefaultValue(Boolean.TRUE);
        return result;
    }

    private static void removeLegacyLibraryScreens(
            PreferenceScreen player
    ) {
        List<Preference> legacyScreens = new ArrayList<>();

        for (int index = 0;
             index < player.getPreferenceCount();
             index++) {
            Preference preference = player.getPreference(index);

            if (preference instanceof PreferenceScreen
                    && LEGACY_LIBRARY_SCREEN_KEY.equals(
                    preference.getKey()
            )) {
                legacyScreens.add(preference);
            }
        }

        for (Preference legacyScreen : legacyScreens) {
            player.removePreference(legacyScreen);
        }
    }

    private static void removeExactPreferences(
            PreferenceGroup group,
            String key
    ) {
        List<Preference> directMatches = new ArrayList<>();
        List<PreferenceGroup> childGroups = new ArrayList<>();

        for (int index = 0;
             index < group.getPreferenceCount();
             index++) {
            Preference preference = group.getPreference(index);

            if (key.equals(preference.getKey())) {
                directMatches.add(preference);
            }

            if (preference instanceof PreferenceGroup) {
                childGroups.add((PreferenceGroup) preference);
            }
        }

        for (Preference match : directMatches) {
            group.removePreference(match);
        }

        for (PreferenceGroup childGroup : childGroups) {
            removeExactPreferences(childGroup, key);
        }
    }

    private static void collectPlayerScreens(
            PreferenceGroup root,
            List<PreferenceLocation> result
    ) {
        for (int index = 0;
             index < root.getPreferenceCount();
             index++) {
            Preference preference = root.getPreference(index);
            String key = preference.getKey();

            if (preference instanceof PreferenceScreen
                    && key != null
                    && (PLAYER_SCREEN_KEY.equals(key)
                    || key.startsWith(
                    PLAYER_SCREEN_KEY + "_sort_by_"
            ))) {
                result.add(new PreferenceLocation(root, preference));
            }
        }
    }

    private static void collectExactPreferences(
            PreferenceGroup group,
            String key,
            List<PreferenceLocation> result
    ) {
        for (int index = 0;
             index < group.getPreferenceCount();
             index++) {
            Preference preference = group.getPreference(index);

            if (key.equals(preference.getKey())) {
                result.add(new PreferenceLocation(group, preference));
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

    private static PreferenceScreen chooseLargestScreen(
            List<PreferenceLocation> locations
    ) {
        PreferenceScreen result = null;

        for (PreferenceLocation location : locations) {
            PreferenceScreen candidate =
                    (PreferenceScreen) location.preference;

            if (result == null
                    || candidate.getPreferenceCount()
                    > result.getPreferenceCount()) {
                result = candidate;
            }
        }

        return result;
    }

    private static void moveToParent(
            List<PreferenceLocation> locations,
            PreferenceScreen screen,
            PreferenceGroup targetParent
    ) {
        for (PreferenceLocation location : locations) {
            if (location.preference == screen) {
                if (location.parent != targetParent) {
                    location.parent.removePreference(screen);
                    targetParent.addPreference(screen);
                }
                return;
            }
        }
    }

    private static void mergeDuplicateScreens(
            List<PreferenceLocation> locations,
            PreferenceScreen target
    ) {
        for (PreferenceLocation location : locations) {
            if (location.preference == target) continue;

            PreferenceScreen duplicate =
                    (PreferenceScreen) location.preference;

            mergePreferenceGroups(duplicate, target);
            location.parent.removePreference(duplicate);
        }
    }

    private static void mergePreferenceGroups(
            PreferenceGroup source,
            PreferenceGroup target
    ) {
        List<Preference> children = new ArrayList<>();

        for (int index = 0;
             index < source.getPreferenceCount();
             index++) {
            children.add(source.getPreference(index));
        }

        for (Preference child : children) {
            source.removePreference(child);

            String key = child.getKey();
            Preference existing = key == null
                    ? null
                    : findExactPreference(target, key);

            if (existing instanceof PreferenceGroup
                    && child instanceof PreferenceGroup) {
                mergePreferenceGroups(
                        (PreferenceGroup) child,
                        (PreferenceGroup) existing
                );
            } else if (existing == null) {
                target.addPreference(child);
            }
        }
    }

    private static Preference findExactPreference(
            PreferenceGroup group,
            String key
    ) {
        for (int index = 0;
             index < group.getPreferenceCount();
             index++) {
            Preference preference = group.getPreference(index);

            if (key.equals(preference.getKey())) {
                return preference;
            }

            if (preference instanceof PreferenceGroup) {
                Preference nested = findExactPreference(
                        (PreferenceGroup) preference,
                        key
                );
                if (nested != null) return nested;
            }
        }

        return null;
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

    private PinPlaylistSettings() {
    }
}
