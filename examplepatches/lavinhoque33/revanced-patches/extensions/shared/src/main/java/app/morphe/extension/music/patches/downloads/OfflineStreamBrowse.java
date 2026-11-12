/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;

/**
 * What Android Auto may see of the stream copies: the albums and playlists that have songs with stored data, those
 * songs in queue order, and the normal/fully-offline command appropriate to connectivity. The stores and replay are
 * package-private, so this is the one public door; metadata reads belong on a worker thread.
 */
public final class OfflineStreamBrowse {
    /** The id of the list of the songs no downloaded list holds (No Playlist), next to the ids of the sources. */
    public static final String SONGS = OfflineReplay.SONGS;

    /** A downloaded list. {@code title} is empty for {@link #SONGS} and while the title is not known. */
    public record Source(String id, String title, int trackCount, @Nullable String coverVideoId) {}

    /** A song with stored data; {@code subtitle} is its artist and duration. */
    public record Track(String videoId, String title, String subtitle) {}

    private OfflineStreamBrowse() {}

    /** Whether stream copies play offline at all: the replay is installed and its setting is on. No disk access. */
    public static boolean enabled() {
        return OfflineReplayHooks.enabled();
    }

    /** Whether the song still has stored data. In memory. */
    public static boolean holds(String videoId) {
        return OfflineCopyStore.has(videoId);
    }

    /**
     * The lists that have at least one song with stored data: each downloaded album and playlist, the latest first,
     * then the list of the songs no downloaded list holds (No Playlist) when there are any. Reads the disk: for a
     * worker thread.
     */
    public static List<Source> sources() {
        List<Source> sources = new ArrayList<>();
        for (OfflineLibraryLogic.SourceRow row : OfflineLibraryLogic.sourceRows(
                OfflineCopyStore.sources(), OfflineCopyStore::tracksOf)) {
            if (row.availableCount() > 0) {
                sources.add(new Source(row.sourceId(), row.title(), row.availableCount(), row.coverVideoId()));
            }
        }
        List<OfflineWatchNext.Item> songs = OfflineReplay.queueOf(SONGS);
        if (!songs.isEmpty()) sources.add(new Source(SONGS, "", songs.size(), songs.get(0).videoId()));
        return sources;
    }

    /** The songs of a list that have stored data, in the order of its offline queue. A worker thread. */
    public static List<Track> tracksOf(String sourceId) {
        List<Track> tracks = new ArrayList<>();
        for (OfflineWatchNext.Item item : OfflineReplay.queueOf(sourceId)) {
            tracks.add(new Track(item.videoId(), item.title(),
                    OfflineLibraryLogic.songSubtitle(item.artist(), item.durationMs())));
        }
        return tracks;
    }

    /** Resolves the selected song in the same order as browse. Reads copy metadata: a worker thread only. */
    @Nullable
    public static byte[] playCommand(String sourceId, int index, boolean online) {
        return OfflineReplay.autoCommand(sourceId, index, online);
    }

    /** A new session selection cancels queued Play-next work from the previous one. No disk access. */
    public static void onPlaybackRequested() {
        OfflineReplay.cancelQueuedSongs();
        AndroidAutoQueue.cancel();
    }

    /** The cover stored with a song, or null. A worker thread. */
    @Nullable
    public static byte[] thumbnail(String videoId) {
        OfflineCopyFiles.Stored stored = OfflineCopyStore.find(videoId);
        return stored == null ? null : stored.thumbnail();
    }
}
