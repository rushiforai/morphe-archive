/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Modified by lavinhoque33, 2026-11-17.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.extension.youtube.settings;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.pm.PackageInfo;

import org.json.JSONObject;
import org.junit.Before;
import org.junit.Test;
import org.junit.FixMethodOrder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.junit.runners.MethodSorters;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.lang.reflect.Field;

import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.utils.Utils;

@RunWith(RobolectricTestRunner.class)
// Startup migration must run in a fresh Settings class loader, before the import tests initialize it.
@Config(manifest = Config.NONE, sdk = 28,
        instrumentedPackages = "app.morphe.extension.youtube.settings.PlaylistSettingsMigrationTest")
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PlaylistSettingsMigrationTest {
    @Before
    public void setUp() throws Exception {
        var context = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = context.getPackageName();
        packageInfo.versionName = "21.45.90";
        packageInfo.applicationInfo = context.getApplicationInfo();
        Shadows.shadowOf(context.getPackageManager()).installPackage(packageInfo);

        Field contextField = Utils.class.getDeclaredField("context");
        contextField.setAccessible(true);
        contextField.set(null, context);
    }

    @Test
    public void aStoredWatchLaterPreferencesMigrateOnStartup() {
        RuntimeEnvironment.getApplication().getSharedPreferences("revanced", 0).edit()
                .putBoolean("morphe_watch_later_wide_drag_handles", false)
                .putBoolean("morphe_watch_later_hide_removal_snackbar", true)
                .commit();

        assertFalse(Settings.PLAYLIST_WIDE_DRAG_HANDLES.get());
        assertTrue(Settings.PLAYLIST_HIDE_REMOVAL_SNACKBAR.get());
        assertFalse(Settings.PLAYLIST_LONG_PRESS_DRAG.get());
    }

    private static JSONObject migrateImport(String json) throws Exception {
        Field field = Settings.class.getDeclaredField("LEGACY_SETTINGS_IMPORT_MIGRATION_CALLBACK");
        field.setAccessible(true);
        var callback = (Setting.ImportExportCallback) field.get(null);
        JSONObject settings = new JSONObject(json);
        callback.settingsImporting(settings);
        return settings;
    }

    @Test
    public void oldImportsAcceptBothKeyFormsAndRemoveLegacyKeys() throws Exception {
        var settings = migrateImport("{\"watch_later_wide_drag_handles\":false,"
                + "\"morphe_watch_later_hide_removal_snackbar\":true}");

        assertFalse(settings.getBoolean("playlist_wide_drag_handles"));
        assertTrue(settings.getBoolean("playlist_hide_removal_snackbar"));
        assertFalse(settings.has("watch_later_wide_drag_handles"));
        assertFalse(settings.has("morphe_watch_later_hide_removal_snackbar"));
    }

    @Test
    public void explicitNewKeysWinOverLegacyImportsEvenAtDefault() throws Exception {
        var settings = migrateImport("{\"watch_later_wide_drag_handles\":false,"
                + "\"playlist_wide_drag_handles\":true,"
                + "\"morphe_watch_later_hide_removal_snackbar\":true,"
                + "\"morphe_playlist_hide_removal_snackbar\":false}");

        assertTrue(settings.getBoolean("playlist_wide_drag_handles"));
        assertFalse(settings.getBoolean("morphe_playlist_hide_removal_snackbar"));
        assertFalse(settings.has("playlist_hide_removal_snackbar"));
        assertFalse(settings.has("watch_later_wide_drag_handles"));
        assertFalse(settings.has("morphe_watch_later_hide_removal_snackbar"));
    }
}
