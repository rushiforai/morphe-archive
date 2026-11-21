/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.io.File;
import java.util.List;
import java.util.Map;

import app.morphe.extension.shared.utils.Utils;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class ColdPlaylistExportTest {
    @Rule public final TemporaryFolder folder = new TemporaryFolder();
    private File dbFile;
    private SharedPreferences prefs;
    private final Uri one = Uri.parse("content://media/external/audio/media/1");
    private final Uri two = Uri.parse("content://media/external/audio/media/2");
    private final Uri three = Uri.parse("content://media/external/audio/media/3");

    @Before
    public void setUp() {
        var app = RuntimeEnvironment.getApplication();
        PackageInfo info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.versionName = "9.45.51";
        info.applicationInfo = app.getApplicationInfo();
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);
        Utils.setContext(app);
        dbFile = new File(folder.getRoot(), "device-files.sqlite");
        prefs = app.getSharedPreferences("export-playlist-fixture", 0);
    }

    @Test
    public void looseDownloadsExportInOrderBeforeTheFirstNativeRepositoryOpens() {
        var choices = NativePlaylistStore.exportPlaylists(dbFile, prefs, Map.of(1L, one, 2L, two),
                List.of(99L, 2L, 1L));
        assertEquals(1, choices.size());
        assertEquals(List.of(two, one), choices.get(0).media());
        assertFalse(dbFile.exists()); // Export does not create or mutate Music's database.
    }

    @Test
    public void userPlaylistMembershipIsRespectedEvenWhenTheDerivedPlaylistIsStale() {
        try (SQLiteDatabase db = SQLiteDatabase.openOrCreateDatabase(dbFile, null)) {
            db.execSQL("CREATE TABLE music_sideloaded_playlist(id INTEGER, title TEXT)");
            db.execSQL("CREATE TABLE music_sideloaded_playlist_track(playlist_id INTEGER, audio_media_id INTEGER, position INTEGER)");
            db.execSQL("INSERT INTO music_sideloaded_playlist VALUES (7,'Saved'),(8,'Manual'),(9,'Loose')");
            db.execSQL("INSERT INTO music_sideloaded_playlist_track VALUES (7,2,0),(7,2,1),(8,3,0),(9,3,0)");
        }
        prefs.edit().putLong("saved", 7).putLong("rvx:not_in_playlist", 9).commit();
        var choices = NativePlaylistStore.exportPlaylists(dbFile, prefs, Map.of(1L, one, 2L, two, 3L, three),
                List.of(3L, 2L, 1L));
        assertEquals(2, choices.size());
        assertEquals("Saved", choices.get(0).title());
        assertEquals(List.of(two, two), choices.get(0).media());
        assertEquals(List.of(one), choices.get(1).media());
    }
}
