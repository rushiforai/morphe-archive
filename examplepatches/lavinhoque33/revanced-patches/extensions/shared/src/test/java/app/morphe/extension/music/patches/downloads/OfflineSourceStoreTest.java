/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.json.JSONObject;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class OfflineSourceStoreTest {
    @Rule public TemporaryFolder temporary = new TemporaryFolder();

    private OfflineSourceStore store() {
        return new OfflineSourceStore(new File(temporary.getRoot(), "sources.json"));
    }

    private static OfflineCopyMetadata metadata(String id) {
        return new OfflineCopyMetadata(id, "Title " + id, "Artist", null, 1000, null, 1, "online");
    }

    @Test public void remembersTheHeaderAndTheTracksInOrder() throws Exception {
        OfflineSourceStore store = store();
        store.remember("OLAK5uy_abc", new SourceHeader("Album", "Artist", "https://cover"),
                List.of("c", "a", "b"), 10);
        OfflineSourceStore.Source source = store.get("OLAK5uy_abc");
        assertEquals("Album", source.title());
        assertEquals("Artist", source.subtitle());
        assertEquals("https://cover", source.thumbnailUrl());
        assertEquals(List.of("c", "a", "b"), source.videoIds());
        assertEquals(10, source.updatedAt());
    }

    @Test public void persistsAcrossInstances() throws Exception {
        store().remember("PLxyz", new SourceHeader("Mix", "", ""), List.of("a", "b"), 5);
        OfflineSourceStore reloaded = store();
        reloaded.ensureLoaded();
        assertEquals("Mix", reloaded.get("PLxyz").title());
        assertEquals(List.of("a", "b"), reloaded.get("PLxyz").videoIds());
        assertFalse(new File(temporary.getRoot(), "sources.json.part").exists());
    }

    @Test public void guessesTheKindFromThePrefix() {
        assertEquals(OfflineSourceStore.Kind.ALBUM, source("OLAK5uy_x").kind());
        assertEquals(OfflineSourceStore.Kind.ALBUM, source("MPREb_x").kind());
        assertEquals(OfflineSourceStore.Kind.PLAYLIST, source("PLx").kind());
        assertEquals(OfflineSourceStore.Kind.PLAYLIST, source("VLPLx").kind());
        assertEquals(OfflineSourceStore.Kind.PLAYLIST, source("RDAMPLx").kind());
    }

    private static OfflineSourceStore.Source source(String id) {
        return new OfflineSourceStore.Source(id, "", "", "", List.of(), 0);
    }

    @Test public void listsTheLatestSourceFirst() throws Exception {
        OfflineSourceStore store = store();
        store.remember("old", null, List.of("a"), 1);
        store.remember("new", null, List.of("b"), 3);
        store.remember("mid", null, List.of("c"), 2);
        assertEquals(List.of("new", "mid", "old"),
                store.sources().stream().map(OfflineSourceStore.Source::id).toList());
    }

    @Test public void tracksKeepTheSourceOrderAndFlagCopiesWithoutStoredData() {
        OfflineSourceStore.Source source = new OfflineSourceStore.Source("PLx", "T", "", "",
                List.of("c", "a", "b", "d"), 1);
        Map<String, OfflineCopyMetadata> stored = Map.of("c", metadata("c"), "b", metadata("b"));
        // "d" has no copy any more: it is left out; "a" has a copy but no stored data.
        List<OfflineSourceStore.Track> tracks = OfflineSourceStore.tracksOf(source, Set.of("a", "b", "c"), stored::get);
        assertEquals(List.of("c", "a", "b"), tracks.stream().map(OfflineSourceStore.Track::videoId).toList());
        assertTrue(tracks.get(0).availableOffline());
        assertEquals("Title c", tracks.get(0).stored().title());
        assertFalse(tracks.get(1).availableOffline());
        assertNull(tracks.get(1).stored());
        assertTrue(tracks.get(2).availableOffline());
    }

    @Test public void aSourceWithoutATitleNeedsItsHeaderUntilOneIsFilledIn() throws Exception {
        OfflineSourceStore store = store();
        assertFalse(store.needsHeader("PLx"));
        store.remember("PLx", null, List.of("a"), 1);
        assertTrue(store.needsHeader("PLx"));
        store.updateHeader("PLx", SourceHeader.EMPTY, 2);
        assertTrue(store.needsHeader("PLx"));
        store.updateHeader("PLx", new SourceHeader("Late title", "Sub", "https://c"), 3);
        assertFalse(store.needsHeader("PLx"));
        assertEquals(List.of("a"), store.get("PLx").videoIds());
        assertEquals("Sub", store.get("PLx").subtitle());
    }

    @Test public void updatingAnUnknownSourceDoesNothing() throws Exception {
        OfflineSourceStore store = store();
        store.updateHeader("PLx", new SourceHeader("T", "", ""), 1);
        assertNull(store.get("PLx"));
        assertFalse(new File(temporary.getRoot(), "sources.json").exists());
    }

    @Test public void rememberingAgainKeepsAKnownTitleWhenTheNewHeaderHasNone() throws Exception {
        OfflineSourceStore store = store();
        store.remember("PLx", new SourceHeader("Known", "Sub", "u"), List.of("a"), 1);
        store.remember("PLx", null, List.of("a", "b"), 2);
        store.remember("PLx", SourceHeader.EMPTY, List.of("a", "b", "c"), 3);
        assertEquals("Known", store.get("PLx").title());
        assertEquals(List.of("a", "b", "c"), store.get("PLx").videoIds());
    }

    @Test public void dropsASourceWhenNoCopyOfItRemains() throws Exception {
        OfflineSourceStore store = store();
        store.remember("one", null, List.of("a", "b"), 1);
        store.remember("two", null, List.of("c"), 2);
        store.retainWithCopies(Set.of("b"));
        assertNotNull(store.get("one"));
        assertNull(store.get("two"));
        OfflineSourceStore reloaded = store();
        reloaded.ensureLoaded();
        assertNull(reloaded.get("two"));
    }

    @Test public void removingASourceForgetsOnlyThatSourceAndPersists() throws Exception {
        OfflineSourceStore store = store();
        store.remember("one", null, List.of("a", "b"), 1);
        store.remember("two", null, List.of("c"), 2);
        store.remove("one");
        store.remove("never-remembered");
        assertNull(store.get("one"));
        assertNotNull(store.get("two"));
        OfflineSourceStore reloaded = store();
        reloaded.ensureLoaded();
        assertNull(reloaded.get("one"));
        assertEquals(List.of("c"), reloaded.get("two").videoIds());
    }

    @Test public void clearForgetsEverythingAndTheFile() throws Exception {
        OfflineSourceStore store = store();
        store.remember("one", null, List.of("a"), 1);
        store.clear();
        assertTrue(store.sources().isEmpty());
        assertFalse(new File(temporary.getRoot(), "sources.json").exists());
    }

    @Test public void aBrokenFileLoadsAsEmpty() throws Exception {
        Files.write(new File(temporary.getRoot(), "sources.json").toPath(), "{\"x\":".getBytes(StandardCharsets.UTF_8));
        OfflineSourceStore store = store();
        store.ensureLoaded();
        assertTrue(store.sources().isEmpty());
        store.remember("one", null, List.of("a"), 1);
        assertEquals(1, new JSONObject(new String(Files.readAllBytes(
                new File(temporary.getRoot(), "sources.json").toPath()), StandardCharsets.UTF_8)).length());
    }

    @Test public void earlierSavedListsAreAdoptedInIdOrderWithTheirTrackOrder() {
        Map<String, List<String>> saved = Map.of(
                "PLb", List.of("v3", "v1"),
                "PLa", List.of("v2"),
                "PLempty", List.of(),
                "PLknown", List.of("v9"));

        Map<String, List<String>> adopted = OfflineSourceStore.adoptable(saved, java.util.Set.of("PLknown"));

        assertEquals(List.of("PLa", "PLb"), List.copyOf(adopted.keySet()));
        assertEquals(List.of("v3", "v1"), adopted.get("PLb"));
    }

    @Test public void nothingIsAdoptedWhenEverySavedListIsKnown() {
        assertTrue(OfflineSourceStore.adoptable(Map.of("PLa", List.of("v1")), java.util.Set.of("PLa")).isEmpty());
    }
}
