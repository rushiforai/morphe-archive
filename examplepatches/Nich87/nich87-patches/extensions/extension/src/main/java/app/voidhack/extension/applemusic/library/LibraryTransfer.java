package app.voidhack.extension.applemusic.library;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

import static app.voidhack.extension.applemusic.library.MusicReflection.call;
import static app.voidhack.extension.applemusic.library.MusicReflection.text;

final class LibraryTransfer {
    private final MusicLibrary music;
    private final Map<String, Object> knownTracks = new HashMap<>();

    LibraryTransfer(AtomicBoolean cancelled) throws ReflectiveOperationException, IOException {
        music = new MusicLibrary(cancelled);
    }

    LibraryBackup export(boolean includeLibrary) throws ReflectiveOperationException, IOException {
        int revision = (Integer) call(music.nativeLibrary, "libraryRevisionNumber");
        List<LibraryBackup.Track> songs = includeLibrary ? tracks(music.songs()) : Collections.emptyList();
        List<LibraryBackup.Playlist> playlists = new ArrayList<>();
        for (Object playlist : music.playlists()) {
            music.checkCancelled();
            playlists.add(new LibraryBackup.Playlist(text(playlist, "getTitle"), text(playlist, "getDescription"),
                    tracks(music.playlistSongs(playlist))));
        }
        if (revision != (Integer) call(music.nativeLibrary, "libraryRevisionNumber")) {
            throw new LibraryFailure("library_changed");
        }
        return new LibraryBackup(songs, playlists);
    }

    static final class Result {
        final int added, created, existing, skipped, unresolvedPlaylists;
        Result(int added, int created, int existing, int skipped, int unresolvedPlaylists) {
            this.added = added;
            this.created = created;
            this.existing = existing;
            this.skipped = skipped;
            this.unresolvedPlaylists = unresolvedPlaylists;
        }
    }

    Result restore(LibraryBackup backup) throws ReflectiveOperationException, IOException {
        LibraryImportPlan plan = new LibraryImportPlan(backup, export(true));
        int skipped = plan.unresolvedLibraryTracks;
        music.addLibraryTracks(plan.additions);
        int created = 0;
        int unresolvedPlaylists = 0;
        for (LibraryBackup.Playlist playlist : plan.playlists) {
            music.checkCancelled();
            List<Object> tracks = new ArrayList<>();
            boolean complete = true;
            for (LibraryBackup.Track track : playlist.tracks) {
                Object item = knownTracks.get(track.key());
                if (item != null) tracks.add(item);
                else if (!track.catalogId.isEmpty()) tracks.add(MusicLibrary.catalogSong(track));
                else { skipped++; complete = false; }
            }
            if (!complete) { unresolvedPlaylists++; continue; }
            long id = music.createPlaylist(playlist, tracks);
            LibraryBackup.Playlist saved = new LibraryBackup.Playlist(playlist.name, playlist.description,
                    tracks(music.playlistSongs(id)));
            if (!playlist.sameContents(saved)) {
                throw new LibraryFailure("playlist_mismatch");
            }
            created++;
        }
        return new Result(plan.additions.size(), created, backup.playlists.size() - plan.playlists.size(), skipped, unresolvedPlaylists);
    }

    private List<LibraryBackup.Track> tracks(List<Object> items) throws ReflectiveOperationException {
        List<LibraryBackup.Track> result = new ArrayList<>(items.size());
        for (Object item : items) {
            music.checkCancelled();
            String catalogId = text(item, "getSubscriptionStoreId");
            if (!catalogId.matches("[1-9][0-9]{0,18}")) catalogId = "";
            LibraryBackup.Track track = new LibraryBackup.Track(catalogId, text(item, "getTitle"),
                    text(item, "getArtistName"), text(item, "getCollectionName"), (Integer) call(item, "getContentType") == 2);
            result.add(track);
            knownTracks.put(track.key(), item);
        }
        return result;
    }
}
