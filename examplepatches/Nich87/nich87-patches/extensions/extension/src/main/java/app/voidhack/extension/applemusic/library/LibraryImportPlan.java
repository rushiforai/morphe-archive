package app.voidhack.extension.applemusic.library;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

final class LibraryImportPlan {
    final List<LibraryBackup.Track> additions = new ArrayList<>();
    final List<LibraryBackup.Playlist> playlists = new ArrayList<>();
    int unresolvedLibraryTracks;

    LibraryImportPlan(LibraryBackup source, LibraryBackup destination) {
        Set<String> present = new HashSet<>();
        for (LibraryBackup.Track track : destination.library) present.add(track.key());
        for (LibraryBackup.Track track : source.library) {
            if (!present.add(track.key())) continue;
            if (track.catalogId.isEmpty()) unresolvedLibraryTracks++;
            else additions.add(track);
        }
        List<LibraryBackup.Playlist> existing = new ArrayList<>(destination.playlists);
        for (LibraryBackup.Playlist playlist : source.playlists) {
            boolean found = false;
            for (LibraryBackup.Playlist other : existing) {
                if (playlist.sameContents(other)) { found = true; break; }
            }
            if (!found) {
                playlists.add(playlist);
                existing.add(playlist);
            }
        }
    }
}
