/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-17.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.extension.music.patches;

import static org.junit.Assert.*;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.provider.MediaStore;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowContentResolver;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.utils.Utils;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class DeviceFilesSearchPatchTest {
    private final RecordingProvider provider = new RecordingProvider();

    public static final class RecordingProvider extends ContentProvider {
        final List<Uri> queries = new ArrayList<>();
        final List<String> selections = new ArrayList<>();
        final List<Cursor> cursors = new ArrayList<>();
        boolean empty;
        boolean nullCursor;
        boolean denyAccess;

        @Override public boolean onCreate() { return true; }
        @Override public String getType(Uri uri) { return null; }
        @Override public Uri insert(Uri uri, ContentValues values) { throw new UnsupportedOperationException(); }
        @Override public int delete(Uri uri, String where, String[] args) { throw new UnsupportedOperationException(); }
        @Override public int update(Uri uri, ContentValues values, String where, String[] args) {
            throw new UnsupportedOperationException();
        }

        @Override
        public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) {
            if (denyAccess) throw new SecurityException("Media permission denied");

            assertArrayEquals(new String[]{"_id"}, projection);
            assertNull(args);
            queries.add(uri);
            selections.add(selection);
            if (nullCursor) return null;

            MatrixCursor cursor = new MatrixCursor(projection);
            if (!empty) cursor.addRow(new Object[]{42L});
            cursors.add(cursor);
            return cursor;
        }
    }

    @Before
    public void setup() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        provider.attachInfo(RuntimeEnvironment.getApplication(), null);
        ShadowContentResolver.registerProviderInternal("media", provider);
    }

    @Test
    public void searchesAllDeviceFileTypesLazilyAndClosesCursors() throws Exception {
        String query = "Björk & live / 100%";
        var callable = DeviceFilesSearchPatch.search(query, new String[]{
                "internal.3p:MusicRecording", "internal.3p:MusicAlbum", "internal.3p:MusicGroup"});
        assertTrue(provider.queries.isEmpty());

        assertEquals(List.of(
                Uri.withAppendedPath(MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, "42"),
                Uri.withAppendedPath(MediaStore.Audio.Albums.EXTERNAL_CONTENT_URI, "42"),
                Uri.withAppendedPath(MediaStore.Audio.Artists.EXTERNAL_CONTENT_URI, "42")), callable.call());
        assertEquals(3, provider.queries.size());
        for (Uri uri : provider.queries) assertEquals(query, uri.getQueryParameter("filter"));
        assertEquals("is_music != 0 AND title IS NOT NULL", provider.selections.get(0));
        assertNull(provider.selections.get(1));
        assertNull(provider.selections.get(2));
        for (Cursor cursor : provider.cursors) assertTrue(cursor.isClosed());
    }

    @Test
    public void emptyAndNullMediaResultsStayEmpty() throws Exception {
        provider.empty = true;
        assertTrue(DeviceFilesSearchPatch.search(
                "missing", new String[]{"internal.3p:MusicRecording"}).call().isEmpty());
        assertTrue(provider.cursors.get(0).isClosed());
        provider.nullCursor = true;
        assertTrue(DeviceFilesSearchPatch.search("missing", new String[]{"internal.3p:MusicAlbum"}).call().isEmpty());
    }

    @Test
    public void unsupportedTypesAndPermissionErrorsPropagateToTheFuture() {
        assertThrows(IllegalArgumentException.class,
                () -> DeviceFilesSearchPatch.search("song", new String[]{"unknown"}).call());
        provider.denyAccess = true;
        assertThrows(SecurityException.class,
                () -> DeviceFilesSearchPatch.search("song", new String[]{"internal.3p:MusicRecording"}).call());
    }
}
