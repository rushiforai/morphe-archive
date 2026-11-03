package app.voidhack.extension.applemusic.library;

import org.junit.Test;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class LibraryImportPlanTest {
    private final LibraryBackup.Track first = new LibraryBackup.Track("11", "One", "Artist", "Album", false);
    private final LibraryBackup.Track second = new LibraryBackup.Track("22", "Two", "Artist", "Album", false);

    @Test public void onlyMissingCatalogSongsAreAddedOnce() {
        LibraryBackup.Track upload = new LibraryBackup.Track("", "Upload", "Me", "Local", false);
        LibraryBackup source = new LibraryBackup(List.of(first, second, second, upload, upload), List.of());
        LibraryBackup destination = new LibraryBackup(List.of(first), List.of());

        LibraryImportPlan plan = new LibraryImportPlan(source, destination);

        assertEquals(List.of(second), plan.additions);
        assertEquals(1, plan.unresolvedLibraryTracks);
    }

    @Test public void matchingPlaylistsAreSkippedButReorderedTracksCreateCopy() {
        LibraryBackup.Playlist original = new LibraryBackup.Playlist("Mix", "Description", List.of(first, second, first));
        LibraryBackup.Playlist reordered = new LibraryBackup.Playlist("Mix", "Description", List.of(first, first, second));
        LibraryBackup source = new LibraryBackup(List.of(), List.of(original, reordered, reordered));
        LibraryBackup destination = new LibraryBackup(List.of(), List.of(original));

        LibraryImportPlan plan = new LibraryImportPlan(source, destination);

        assertEquals(List.of(reordered), plan.playlists);
    }

    @Test public void playlistDescriptionsAndRepeatedTracksRemainSignificant() {
        LibraryBackup.Playlist original = new LibraryBackup.Playlist("Mix", "Old", List.of(first));
        LibraryBackup.Playlist described = new LibraryBackup.Playlist("Mix", "New", List.of(first));
        LibraryBackup.Playlist repeated = new LibraryBackup.Playlist("Mix", "Old", List.of(first, first));

        LibraryImportPlan plan = new LibraryImportPlan(new LibraryBackup(List.of(), List.of(described, repeated)),
                new LibraryBackup(List.of(), List.of(original)));

        assertEquals(List.of(described, repeated), plan.playlists);
    }

    @Test public void existingUploadsAreReusedByExactMetadata() {
        LibraryBackup.Track upload = new LibraryBackup.Track("", "Upload", "Me", "Local", false);
        LibraryBackup source = new LibraryBackup(List.of(upload), List.of());
        LibraryBackup destination = new LibraryBackup(List.of(new LibraryBackup.Track("", "Upload", "Me", "Local", false)), List.of());

        LibraryImportPlan plan = new LibraryImportPlan(source, destination);

        assertTrue(plan.additions.isEmpty());
        assertEquals(0, plan.unresolvedLibraryTracks);
    }
}
