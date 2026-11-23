/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-22.
 */

package app.morphe.extension.youtube.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

import android.content.pm.PackageInfo;

import org.json.JSONObject;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.preference.SharedPrefCategory;
import app.morphe.extension.shared.utils.Utils;

@RunWith(RobolectricTestRunner.class)
// Run startup migration in its own sandbox before any test in this class initializes Settings.
@Config(manifest = Config.NONE, sdk = 28,
        instrumentedPackages = "app.morphe.extension.youtube.settings.PlayerControlOpacityMigrationTest")
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PlayerControlOpacityMigrationTest {
    private static final String LEGACY_KEY = "morphe_player_control_buttons_background_opacity";
    private static final String SHORT_LEGACY_KEY = "player_control_buttons_background_opacity";
    private static final String TRANSPORT_KEY = "player_transport_background_opacity";
    private static final String OVERLAY_KEY = "player_other_overlay_background_opacity";

    @Before
    public void setUp() throws ReflectiveOperationException {
        var app = RuntimeEnvironment.getApplication();
        var info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.applicationInfo = app.getApplicationInfo();
        info.versionName = "21.45.90";
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);
        // Avoid touching any settings before the startup test writes the old preference.
        var contextField = Utils.class.getDeclaredField("context");
        contextField.setAccessible(true);
        contextField.set(null, app);
    }

    @Test
    public void aStoredV146OpacityMigratesOnceOnStartup() {
        var app = RuntimeEnvironment.getApplication();
        var prefs = app.getSharedPreferences("revanced", 0);
        prefs.edit().putString(LEGACY_KEY, "0").apply();

        assertEquals(0, Settings.PLAYER_TRANSPORT_BACKGROUND_OPACITY.get().intValue());
        assertEquals(0, Settings.PLAYER_OTHER_OVERLAY_BACKGROUND_OPACITY.get().intValue());
        assertFalse(prefs.contains(LEGACY_KEY));

        Settings.PLAYER_TRANSPORT_BACKGROUND_OPACITY.resetToDefault();
        Settings.PLAYER_OTHER_OVERLAY_BACKGROUND_OPACITY.save(87);
        Settings.migratePlayerControlBackgroundOpacity(new SharedPrefCategory("youtube"));

        assertEquals(30, Settings.PLAYER_TRANSPORT_BACKGROUND_OPACITY.get().intValue());
        assertEquals(87, Settings.PLAYER_OTHER_OVERLAY_BACKGROUND_OPACITY.get().intValue());
    }

    @Test
    public void oldYouTubePreferenceFillsOnlyMissingValues() {
        Settings.PLAYER_TRANSPORT_BACKGROUND_OPACITY.resetToDefault();
        Settings.PLAYER_OTHER_OVERLAY_BACKGROUND_OPACITY.resetToDefault();
        // An explicit stock value in storage also counts as an independent choice.
        Setting.preferences.saveIntegerString(Settings.PLAYER_TRANSPORT_BACKGROUND_OPACITY.key, 30);
        var oldPrefs = new SharedPrefCategory("youtube");
        oldPrefs.saveIntegerString(LEGACY_KEY, 64);

        Settings.migratePlayerControlBackgroundOpacity(oldPrefs);

        assertEquals(30, Settings.PLAYER_TRANSPORT_BACKGROUND_OPACITY.get().intValue());
        assertEquals(64, Settings.PLAYER_OTHER_OVERLAY_BACKGROUND_OPACITY.get().intValue());
        assertFalse(oldPrefs.preferences.contains(LEGACY_KEY));
    }

    @Test
    public void oldExportsInEitherKeyFormPopulateBothSliders() throws Exception {
        for (String key : new String[] { LEGACY_KEY, SHORT_LEGACY_KEY }) {
            var migrated = migrateImport(new JSONObject().put(key, 72));

            assertEquals(72, migrated.getInt(TRANSPORT_KEY));
            assertEquals(72, migrated.getInt(OVERLAY_KEY));
            assertFalse(migrated.has(key));
        }
    }

    @Test
    public void explicitNewExportValuesWinEvenWhenOneIsStock() throws Exception {
        var migrated = migrateImport(new JSONObject()
                .put(LEGACY_KEY, 72)
                .put(TRANSPORT_KEY, 30)
                .put("morphe_" + OVERLAY_KEY, 9));

        assertEquals(30, migrated.getInt(TRANSPORT_KEY));
        assertEquals(9, migrated.getInt("morphe_" + OVERLAY_KEY));
        assertFalse(migrated.has(OVERLAY_KEY));
        assertFalse(migrated.has(LEGACY_KEY));
    }

    private static JSONObject migrateImport(JSONObject json) throws Exception {
        var field = Settings.class.getDeclaredField("LEGACY_SETTINGS_IMPORT_MIGRATION_CALLBACK");
        field.setAccessible(true);
        var callback = (Setting.ImportExportCallback) field.get(null);
        callback.settingsImporting(json);
        return json;
    }
}
