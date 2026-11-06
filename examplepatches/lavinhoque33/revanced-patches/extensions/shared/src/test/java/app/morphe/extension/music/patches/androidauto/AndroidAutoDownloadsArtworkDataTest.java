/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-01.
 */
package app.morphe.extension.music.patches.androidauto;

import static app.morphe.extension.music.patches.androidauto.AndroidAutoDownloadsArtworkData.*;
import static app.morphe.extension.music.patches.androidauto.AndroidAutoDownloadsData.*;
import static org.junit.Assert.*;

import org.junit.Test;

import java.util.List;
import java.util.Set;

public class AndroidAutoDownloadsArtworkDataTest {
    private static final String AUTHORITY = "com.google.android.apps.youtube.music.fileprovider";
    private static final String ROOT = "image_share_files";

    @Test
    public void cacheKeyTracksMediaIdentityModificationAndSize() {
        Key key = new Key(42, 1700000012, 900000);
        assertEquals("v1-42-1700000012-900000.jpg", key.fileName());
        assertEquals(key, parseFileName(key.fileName()));
        assertNotEquals(key.fileName(), new Key(43, 1700000012, 900000).fileName());
        assertNotEquals(key.fileName(), new Key(42, 1700000013, 900000).fileName());
        assertNotEquals(key.fileName(), new Key(42, 1700000012, 900001).fileName());
    }

    @Test
    public void canonicalUriUsesOnlyTheManagedCacheNamespace() {
        Key key = new Key(42, 100, 2000);
        String uri = uri(AUTHORITY, ROOT, key);
        assertEquals("content://" + AUTHORITY + "/image_share_files/rvx-aa-art/v1-42-100-2000.jpg", uri);
        assertEquals(key, parseUri(AUTHORITY, ROOT, uri));
        assertNull(parseUri(AUTHORITY, "files", uri));
        assertNull(parseUri("other.fileprovider", ROOT, uri));
    }

    @Test
    public void traversalEncodedSlashesQueriesAndNoncanonicalKeysAreRejected() {
        String prefix = uriPrefix(AUTHORITY, ROOT);
        for (String suffix : new String[]{"../secret.jpg", "%2e%2e/secret.jpg", "%2Fetc%2Fpasswd",
                "v1-42-100-2000.jpg/../secret", "v1-42-100-2000.jpg?read=secret",
                "v1-42-100-2000.jpg#fragment", "v1-042-100-2000.jpg", "v1-42--1-2000.jpg",
                "v1-42-100-0.jpg", "v1-9223372036854775808-100-2000.jpg", "v1-42-100-2000.jpg%00"}) {
            assertNull(suffix, parseUri(AUTHORITY, ROOT, prefix + suffix));
        }
        assertNull(parseUri(AUTHORITY, ROOT, "file:///data/cache/rvx-aa-art/v1-42-100-2000.jpg"));
    }

    @Test(expected = IllegalArgumentException.class)
    public void providerRootCannotEscapeItsSinglePathSegment() {
        uriPrefix(AUTHORITY, "../cache");
    }

    @Test
    public void evictionRemovesDeletedDownloadsAndSupersededRevisionsFirst() {
        Key current = new Key(1, 20, 2000);
        Key old = new Key(1, 10, 2000);
        Key deleted = new Key(9, 10, 2000);
        Key retained = new Key(2, 10, 2000);
        var entries = List.of(new Entry(current.fileName(), 100, 5), new Entry(old.fileName(), 100, 2),
                new Entry(deleted.fileName(), 100, 3), new Entry(retained.fileName(), 100, 1));
        assertEquals(List.of(old.fileName(), deleted.fileName()),
                evictions(entries, Set.of(1L, 2L), current, 200, 2));
        assertEquals(List.of(current.fileName(), old.fileName(), deleted.fileName()),
                evictions(entries, Set.of(2L), null, MAX_CACHE_BYTES, MAX_CACHE_ENTRIES));
    }

    @Test
    public void byteAndEntryCapsEvictLeastRecentlyUsedWithoutDeletingTheOpenedImage() {
        Key current = new Key(1, 1, 2000);
        Key old = new Key(2, 1, 2000);
        Key recent = new Key(3, 1, 2000);
        var entries = List.of(new Entry(current.fileName(), 100, 0), new Entry(recent.fileName(), 100, 9),
                new Entry(old.fileName(), 100, 2));
        assertEquals(List.of(old.fileName()), evictions(entries, Set.of(1L, 2L, 3L), current, 200, 3));
        assertEquals(List.of(old.fileName(), recent.fileName()),
                evictions(entries, Set.of(1L, 2L, 3L), current, 300, 1));
    }

    @Test
    public void playlistAndSinglesCoversUseTheirFirstOrderedTrack() {
        var first = new Track(7, 0, "First", "", "", 1000, 100, 2000);
        var second = new Track(2, 1, "Second", "", "", 1000, 100, 2000);
        assertEquals(first, coverTrack(playlist(1, "PL", "Saved", "Singles", List.of(second, first))));
        assertEquals(first, coverTrack(playlist(2, UNSORTED_KEY, "Old", "Singles", List.of(first, second))));
        assertNull(coverTrack(playlist(3, "PLempty", "Empty", "Singles", List.of())));
    }
}
