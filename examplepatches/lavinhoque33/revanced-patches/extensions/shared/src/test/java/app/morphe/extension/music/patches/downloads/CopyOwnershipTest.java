/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.List;
import java.util.Map;
import java.util.Set;

public class CopyOwnershipTest {
    private static final Map<String, List<String>> SOURCES = Map.of(
            "listA", List.of("a", "b", "c"),
            "listB", List.of("c", "d"),
            "listC", List.of("d", PlaylistPage.UNAVAILABLE, "e"));
    private static final Set<String> COPIES = Set.of("a", "b", "c", "d", "e", "x");

    @Test public void aListRemovalDeletesOnlyWhatNoOtherListNeeds() {
        CopyOwnership.Removal removal = CopyOwnership.removing("listA", SOURCES, Set.of(), COPIES);
        assertEquals(List.of("a", "b"), removal.deleteCopies());
        assertEquals(List.of("c"), removal.kept());
        assertTrue(removal.deleteVideos().isEmpty());
    }

    @Test public void aSongTheUserDownloadedOnItsOwnKeepsItsAudioButLosesTheVideo() {
        CopyOwnership.Removal removal = CopyOwnership.removing("listA", SOURCES, Set.of("b", "c"), COPIES);
        assertEquals(List.of("a"), removal.deleteCopies());
        assertEquals(List.of("b"), removal.deleteVideos());
        assertEquals(List.of("b", "c"), removal.kept());
    }

    @Test public void aSongOfAnotherListKeepsBothItsAudioAndItsVideo() {
        CopyOwnership.Removal removal = CopyOwnership.removing("listB", SOURCES, Set.of("c", "d"), COPIES);
        assertTrue(removal.deleteCopies().isEmpty());
        assertTrue(removal.deleteVideos().isEmpty());
        assertEquals(List.of("c", "d"), removal.kept());
    }

    @Test public void removingTheLastHolderDeletesTheSongAndTheReferencesCountDown() {
        Map<String, List<String>> afterA = Map.of("listB", SOURCES.get("listB"), "listC", SOURCES.get("listC"));
        assertEquals(2, CopyOwnership.listsHolding("c", SOURCES));
        assertEquals(1, CopyOwnership.listsHolding("c", afterA));
        assertEquals(2, CopyOwnership.listsHolding("d", afterA));
        assertEquals(0, CopyOwnership.listsHolding("x", SOURCES));

        // With listA gone, listB is the last holder of "c" and "d" is still held by listC.
        CopyOwnership.Removal removal = CopyOwnership.removing("listB", afterA, Set.of(), COPIES);
        assertEquals(List.of("c"), removal.deleteCopies());
        assertEquals(List.of("d"), removal.kept());
    }

    @Test public void tracksWithoutACopyUnavailableTracksAndRepeatsAreIgnored() {
        CopyOwnership.Removal removal = CopyOwnership.removing("listC", SOURCES, Set.of(), Set.of("e", "d"));
        assertEquals(List.of("e"), removal.deleteCopies());
        assertEquals(List.of("d"), removal.kept());

        Map<String, List<String>> repeated = Map.of("only", List.of("a", "a", "b"));
        assertEquals(List.of("a", "b"), CopyOwnership.removing("only", repeated, Set.of(), COPIES).deleteCopies());
    }

    @Test public void anUnknownListRemovesNothing() {
        CopyOwnership.Removal removal = CopyOwnership.removing("nope", SOURCES, Set.of(), COPIES);
        assertTrue(removal.deleteCopies().isEmpty());
        assertTrue(removal.kept().isEmpty());
    }

    @Test public void looseSongsAreTheCopiesNoListLists() {
        assertEquals(Set.of("x"), CopyOwnership.looseSongs(COPIES, SOURCES));
        assertEquals(Set.of("x", "a"), CopyOwnership.looseSongs(COPIES,
                Map.of("listB", SOURCES.get("listB"), "listC", SOURCES.get("listC"), "other", List.of("b", "c"))));
        assertTrue(CopyOwnership.looseSongs(Set.of(), SOURCES).isEmpty());
    }

    @Test public void aSongInAListAndDownloadedOnItsOwnIsNotLoose() {
        // "c" is listed by two lists; the individual download changes nothing about being loose.
        assertFalse(CopyOwnership.looseSongs(COPIES, SOURCES).contains("c"));
    }

    @Test public void theSongsOfAListThatIsStillDownloadingAreNotLoose() {
        // The list is recorded with all its tracks when its download starts, so the copies made so far are its own.
        Map<String, List<String>> sources = Map.of("OLAK5uy_cut_off", List.of("a", "b", "c", "d"));

        assertEquals(Set.of("x"), CopyOwnership.looseSongs(Set.of("a", "b", "x"), sources));
    }
}
