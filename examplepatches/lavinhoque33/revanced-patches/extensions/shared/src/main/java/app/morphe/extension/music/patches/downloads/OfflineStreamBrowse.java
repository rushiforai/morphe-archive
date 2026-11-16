/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-14
 * Modified by lavinhoque33, 2026-11-13
 * Written by lavinhoque33, 2026-11-08.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * What Android Auto may see of the stream copies: the albums and playlists that have songs with stored data, those
 * songs in queue order, and the normal/fully-offline command appropriate to connectivity. The stores and replay are
 * package-private, so this is the one public door; metadata reads belong on a worker thread.
 */
public final class OfflineStreamBrowse {
    /** The id of the list of the songs no downloaded list holds (No Playlist), next to the ids of the sources. */
    public static final String SONGS = OfflineReplay.SONGS;

    /** A downloaded list. {@code title} is empty for {@link #SONGS} and while the title is not known. */
    public record Source(String id, String title, int trackCount, @Nullable String coverVideoId,
                         int totalCount, boolean album, String canonicalId) {}

    /** All remembered source tracks, including tracks whose stream copy is not ready. */
    public record Track(String videoId, String title, String artist, String artwork, boolean ready) {}

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
        List<OfflineSourceStore.Source> stored = OfflineCopyStore.sources();
        Map<String, OfflineSourceStore.Source> byId = new HashMap<>();
        for (OfflineSourceStore.Source source : stored) byId.put(source.id(), source);
        OfflineBrowsePages.load();
        for (OfflineLibraryLogic.SourceRow row : OfflineLibraryLogic.sourceRows(stored, OfflineCopyStore::tracksOf)) {
            if (row.availableCount() <= 0) continue;

            OfflineSourceStore.Source source = byId.get(row.sourceId());
            sources.add(new Source(row.sourceId(), row.title(), row.availableCount(), row.coverVideoId(),
                    source.videoIds().size(), source.kind() == OfflineSourceStore.Kind.ALBUM,
                    OfflineBrowsePages.sourceOf(row.sourceId())));
        }
        List<OfflineWatchNext.Item> songs = OfflineReplay.queueOf(SONGS);
        if (!songs.isEmpty()) {
            sources.add(new Source(SONGS, "", songs.size(), songs.get(0).videoId(), songs.size(), false, SONGS));
        }
        return sources;
    }

    /** Full source order; unlike the replay queue this includes missing and not-yet-ready copies. */
    public static List<Track> tracksOf(String sourceId) {
        List<Track> tracks = new ArrayList<>();
        if (SONGS.equals(sourceId)) {
            for (OfflineWatchNext.Item item : OfflineReplay.queueOf(sourceId)) {
                tracks.add(new Track(item.videoId(), item.title(), item.artist(),
                        item.thumbnailUrl() == null ? "" : item.thumbnailUrl(), true));
            }
            return tracks;
        }
        var copyIds = RawAudioStore.copyIds();
        for (String id : OfflineCopyStore.allTrackLists().getOrDefault(sourceId, List.of())) {
            OfflineCopyMetadata metadata = OfflineCopyStore.metadataOf(id);
            tracks.add(new Track(id, metadata == null ? "" : metadata.title(),
                    metadata == null ? "" : metadata.artist(),
                    metadata == null || metadata.thumbnailUrl() == null ? "" : metadata.thumbnailUrl(),
                    copyIds.contains(id) && metadata != null));
        }
        return tracks;
    }

    public static String sourceId(String canonicalId) {
        Map<String, List<String>> lists = OfflineCopyStore.allTrackLists();
        if (SONGS.equals(canonicalId) || lists.containsKey(canonicalId)) return canonicalId;
        OfflineBrowsePages.load();
        for (String id : lists.keySet()) {
            if (canonicalId.equals(OfflineBrowsePages.sourceOf(id))) return id;
        }
        return canonicalId;
    }

    public static Map<String, String> aliases() {
        Map<String, String> aliases = new HashMap<>(RawAudioStore.aliases());
        aliases.putAll(VideoCopyStore.pairs());
        return aliases;
    }

    public static List<String> readyIds(String sourceId) {
        List<String> ids = new ArrayList<>();
        for (OfflineWatchNext.Item item : OfflineReplay.queueOf(sourceId)) ids.add(item.videoId());
        return ids;
    }

    @Nullable
    public static byte[] savedPage(String sourceId) {
        return OfflineBrowsePages.readSource(sourceId);
    }

    public static byte[] onlineCommand(String videoId, String playlistId, int index) {
        return OnlineWatchCommand.build(videoId, playlistId, index);
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
