/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.androidauto;

import static app.morphe.extension.music.patches.androidauto.AndroidAutoDownloadsArtworkData.Entry;
import static org.junit.Assert.*;

import org.junit.Test;

import java.util.List;
import java.util.Set;

public class AndroidAutoStreamArtworkDataTest {
    private static final String AUTHORITY = "com.google.android.apps.youtube.music.fileprovider";
    private static final String ROOT = "image_share_files";

    @Test public void coverIsNamedAfterTheVideoId() {
        assertEquals("s1-dQw4w9WgXcQ.jpg", AndroidAutoStreamArtworkData.fileName("dQw4w9WgXcQ"));
        assertEquals("dQw4w9WgXcQ", AndroidAutoStreamArtworkData.parseFileName("s1-dQw4w9WgXcQ.jpg"));
        assertEquals("a_-B", AndroidAutoStreamArtworkData.parseFileName("s1-a_-B.jpg"));
    }

    @Test public void otherNamesAreNotStreamCovers() {
        for (String name : new String[]{null, "", "v1-42-100-2000.jpg", "s1-.jpg", "s1-a.png", "s1-a/b.jpg",
                "s1-../x.jpg", "s2-abc.jpg", "s1-abc.jpg.part", "x-s1-abc.jpg", "s1-" + "a".repeat(21) + ".jpg"}) {
            assertNull(name, AndroidAutoStreamArtworkData.parseFileName(name));
        }
        assertThrows(IllegalArgumentException.class, () -> AndroidAutoStreamArtworkData.fileName("../etc"));
        assertThrows(IllegalArgumentException.class, () -> AndroidAutoStreamArtworkData.fileName(""));
    }

    @Test public void deviceFileCoverNamesAreNotStreamNamesAndTheOtherWayAround() {
        assertNull(AndroidAutoDownloadsArtworkData.parseFileName("s1-dQw4w9WgXcQ.jpg"));
        assertNull(AndroidAutoStreamArtworkData.parseFileName(
                new AndroidAutoDownloadsArtworkData.Key(42, 100, 2000).fileName()));
    }

    @Test public void uriUsesTheSharedCacheNamespaceAndRoundTrips() {
        String uri = AndroidAutoStreamArtworkData.uri(AUTHORITY, ROOT, "dQw4w9WgXcQ");
        assertEquals("content://" + AUTHORITY + "/image_share_files/rvx-aa-art/s1-dQw4w9WgXcQ.jpg", uri);
        assertEquals("dQw4w9WgXcQ", AndroidAutoStreamArtworkData.parseUri(AUTHORITY, ROOT, uri));
        assertNull(AndroidAutoStreamArtworkData.parseUri(AUTHORITY, "files", uri));
        assertNull(AndroidAutoStreamArtworkData.parseUri("other.fileprovider", ROOT, uri));
        assertNull(AndroidAutoDownloadsArtworkData.parseUri(AUTHORITY, ROOT, uri));
    }

    @Test public void traversalAndNoncanonicalAddressesAreRejected() {
        String prefix = AndroidAutoDownloadsArtworkData.uriPrefix(AUTHORITY, ROOT);
        for (String suffix : new String[]{"../s1-abc.jpg", "%2e%2e/s1-abc.jpg", "s1-abc.jpg/../x",
                "s1-abc.jpg?read=1", "s1-abc.jpg#f", "s1-abc.jpg%00", "s1-a%2Fb.jpg"}) {
            assertNull(suffix, AndroidAutoStreamArtworkData.parseUri(AUTHORITY, ROOT, prefix + suffix));
        }
        assertNull(AndroidAutoStreamArtworkData.parseUri(AUTHORITY, ROOT, null));
        assertNull(AndroidAutoStreamArtworkData.parseUri(AUTHORITY, ROOT, "file:///cache/rvx-aa-art/s1-abc.jpg"));
    }

    @Test public void evictionDropsCoversOfSongsThatAreGone() {
        List<Entry> entries = List.of(new Entry("s1-a.jpg", 10, 1), new Entry("s1-gone.jpg", 10, 2));
        assertEquals(List.of("s1-gone.jpg"),
                AndroidAutoStreamArtworkData.evictions(entries, Set.of("a")::contains, null, 1000, 10));
    }

    @Test public void evictionNeverListsOtherFilesNorTheDeviceFileCovers() {
        List<Entry> entries = List.of(new Entry("v1-42-100-2000.jpg", 5_000_000, 1),
                new Entry("cover-1.part", 99, 1), new Entry("s1-a.jpg", 10, 1));
        assertEquals(List.of(), AndroidAutoStreamArtworkData.evictions(entries, id -> true, null, 100, 1));
    }

    @Test public void evictionTrimsTheLeastRecentlyUsedToTheByteLimit() {
        List<Entry> entries = List.of(new Entry("s1-a.jpg", 40, 30), new Entry("s1-b.jpg", 40, 10),
                new Entry("s1-c.jpg", 40, 20));
        assertEquals(List.of("s1-b.jpg"),
                AndroidAutoStreamArtworkData.evictions(entries, id -> true, null, 100, 10));
    }

    @Test public void evictionTrimsToTheEntryLimit() {
        List<Entry> entries = List.of(new Entry("s1-a.jpg", 1, 30), new Entry("s1-b.jpg", 1, 10),
                new Entry("s1-c.jpg", 1, 20));
        assertEquals(List.of("s1-b.jpg", "s1-c.jpg"),
                AndroidAutoStreamArtworkData.evictions(entries, id -> true, null, 100, 1));
    }

    @Test public void evictionKeepsTheCoverBeingOpened() {
        List<Entry> entries = List.of(new Entry("s1-a.jpg", 60, 10), new Entry("s1-b.jpg", 60, 20));
        assertEquals(List.of("s1-b.jpg"),
                AndroidAutoStreamArtworkData.evictions(entries, id -> true, "s1-a.jpg", 100, 10));
    }
}
