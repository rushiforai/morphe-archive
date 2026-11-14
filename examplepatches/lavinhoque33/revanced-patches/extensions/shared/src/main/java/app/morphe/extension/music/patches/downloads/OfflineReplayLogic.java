/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-12
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import com.google.protobuf.CodedInputStream;
import com.google.protobuf.WireFormat;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ConcurrentMap;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.UnaryOperator;

/**
 * The decisions of {@link OfflineReplay} that need no Android: which playlist id stands for a list, whether a hook
 * acts or says why not, what a command names, and how the tracks of a list become the items of its queue.
 */
final class OfflineReplayLogic {
    static final String REASON_SETTING_OFF = "setting off";
    static final String REASON_ONLINE_REQUEST = "online request";
    static final String REASON_NOT_OURS = "not ours";
    static final String REASON_STOCK_ANSWERED = "stock answered";

    private static final int OFFLINE_WATCH_ENDPOINT = OfflineWatchCommand.ENDPOINT_FIELD;
    private static final int BROWSE_ENDPOINT = 48687626;
    /** The extension of the command that asks the app to remember a page as the Library tab's launch page. */
    private static final int VIDEO_ID_FIELD = OfflineWatchCommand.VIDEO_ID_FIELD;
    private static final int PLAYLIST_ID_FIELD = OfflineWatchCommand.PLAYLIST_ID_FIELD;
    private static final int INDEX_FIELD = OfflineWatchCommand.INDEX_FIELD;
    /** Prefix of the synthetic playlist id of a list; it starts with the stock prefix of a queue ("PPSV"). */
    private static final String QUEUE_PLAYLIST_PREFIX = "PPSVrvx:";
    /** An album page's browse id: not a playlist id, so an online watch command must not carry it. */
    private static final String ALBUM_BROWSE_PREFIX = "MPREb_";
    /** The playlist id of an album's audio playlist, which the watch of a song on an album page carries. */
    private static final String AUDIO_PLAYLIST_PREFIX = "OLAK5uy_";
    private static final long SKIP_LOG_INTERVAL_MS = 60_000L;
    private static final int OFFLINE_RESPONSE_FIELD = OfflineReplayResponse.OFFLINE_MARKER_FIELD;

    private OfflineReplayLogic() {}

    /** The video, playlist and index an offline watch command names. */
    record WatchTarget(String videoId, String playlistId, int index) {}

    /**
     * Whether the "No connection" sheet the app shows by itself is dismissed: only while offline, and only while the
     * video that plays is the one whose copy was replayed offline.
     */
    static boolean dismissesSheetShownLater(@Nullable String replayedVideoId, @Nullable String playingVideoId,
                                            boolean networkAvailable) {
        return !networkAvailable && replayedVideoId != null && replayedVideoId.equals(playingVideoId);
    }

    /** The synthetic playlist id the offline queue of a list carries. */
    static String playlistId(String sourceId) {
        return QUEUE_PLAYLIST_PREFIX + sourceId;
    }

    /** The list a synthetic playlist id stands for, or null when the id is not one of ours. */
    @Nullable
    static String sourceOf(@Nullable String playlistId) {
        if (playlistId == null || !playlistId.startsWith(QUEUE_PLAYLIST_PREFIX)) return null;

        String sourceId = playlistId.substring(QUEUE_PLAYLIST_PREFIX.length());
        return sourceId.isEmpty() ? null : sourceId;
    }

    /**
     * The playlist id the normal online watch command of a list's track carries, or null when the track plays on
     * its own: the songs list has no playlist, and an album page's browse id is not a playlist.
     */
    @Nullable
    static String onlinePlaylistId(String sourceId, String songsId) {
        if (songsId.equals(sourceId) || sourceId.startsWith(ALBUM_BROWSE_PREFIX)) return null;
        return sourceId;
    }

    /**
     * Whether the seek snap of the player must be dropped. Both progress-bar and MediaSession seeks use this
     * lookup. A copy played from a file has no stream-cache span: audio answers 0 (restart), video -1 (cancel).
     * Preserve the target for a current local source even online, and retain the existing offline behavior.
     * Online streams without a current local-source decision keep the stock answer.
     */
    static boolean dropsSeekSnap(boolean enabled, boolean online, boolean localPlayback, long snappedMillis) {
        return enabled && (!online || localPlayback) && snappedMillis <= 0;
    }

    /**
     * Why a hook leaves the stock behavior alone, or null when it acts. The first reason that applies wins, so a log
     * line names the outermost one: a disabled setting before an online request before a request for something
     * else before a stock answer.
     */
    @Nullable
    static String skipReason(boolean enabled, boolean offlineRequest, boolean ours, boolean stockFailed) {
        if (!enabled) return REASON_SETTING_OFF;
        if (!offlineRequest) return REASON_ONLINE_REQUEST;
        if (!ours) return REASON_NOT_OURS;
        if (!stockFailed) return REASON_STOCK_ANSWERED;
        return null;
    }

    /** True once per minute for each key: a skipped request is common, its line must not flood the log. */
    static boolean shouldLogSkip(ConcurrentMap<String, Long> lastLogged, String key, long nowMs) {
        boolean[] due = {false};
        lastLogged.compute(key, (ignored, last) -> {
            if (last != null && nowMs - last < SKIP_LOG_INTERVAL_MS) return last;
            due[0] = true;
            return nowMs;
        });
        return due[0];
    }

    /** What an offline watch command names, or null when the command is any other command. */
    @Nullable
    static WatchTarget offlineWatchOf(byte[] command) {
        try {
            byte[] payload = lengthDelimitedField(command, OFFLINE_WATCH_ENDPOINT);
            if (payload == null) return null;

            String videoId = "";
            String playlistId = "";
            int index = 0;
            CodedInputStream input = CodedInputStream.newInstance(payload);
            while (!input.isAtEnd()) {
                int tag = input.readTag();
                int field = WireFormat.getTagFieldNumber(tag);
                int wireType = WireFormat.getTagWireType(tag);
                if (field == VIDEO_ID_FIELD && wireType == WireFormat.WIRETYPE_LENGTH_DELIMITED) {
                    videoId = input.readStringRequireUtf8();
                } else if (field == PLAYLIST_ID_FIELD && wireType == WireFormat.WIRETYPE_LENGTH_DELIMITED) {
                    playlistId = input.readStringRequireUtf8();
                } else if (field == INDEX_FIELD && wireType == WireFormat.WIRETYPE_VARINT) {
                    index = input.readInt32();
                } else if (!input.skipField(tag)) {
                    break;
                }
            }
            return videoId.isEmpty() ? null : new WatchTarget(videoId, playlistId, index);
        } catch (IOException ex) {
            return null;
        }
    }

    /** The browse id of a browse command, or null when the command is any other command. */
    @Nullable
    static String browseIdOf(byte[] command) {
        try {
            byte[] endpoint = lengthDelimitedField(command, BROWSE_ENDPOINT);
            if (endpoint == null) return null;

            CodedInputStream input = CodedInputStream.newInstance(endpoint);
            while (!input.isAtEnd()) {
                int tag = input.readTag();
                int field = WireFormat.getTagFieldNumber(tag);
                // The page id is field 2 of the endpoint; field 1 is accepted too, as the Downloads rewrite does.
                boolean idField = field == 1 || field == 2;
                if (idField && WireFormat.getTagWireType(tag) == WireFormat.WIRETYPE_LENGTH_DELIMITED) {
                    return new String(input.readByteArray(), StandardCharsets.UTF_8);
                }
                if (!input.skipField(tag)) break;
            }
        } catch (IOException ignored) {
            // Not a message this decision knows: it is some other command.
        }
        return null;
    }

    /**
     * What the app's watch endpoint of a command names: the video, and the playlist and position when it has them
     * (the playlist id is empty for a song that plays on its own). Null when the command has no watch endpoint.
     */
    @Nullable
    static WatchTarget onlineWatchOf(byte[] command) {
        try {
            byte[] endpoint = lengthDelimitedField(command, CommandRewrite.WATCH_ENDPOINT_FIELD);
            if (endpoint == null) return null;

            String videoId = "";
            String playlistId = "";
            int index = 0;
            CodedInputStream input = CodedInputStream.newInstance(endpoint);
            while (!input.isAtEnd()) {
                int tag = input.readTag();
                int field = WireFormat.getTagFieldNumber(tag);
                int wireType = WireFormat.getTagWireType(tag);
                if (field == VIDEO_ID_FIELD && wireType == WireFormat.WIRETYPE_LENGTH_DELIMITED) {
                    videoId = input.readStringRequireUtf8();
                } else if (field == OnlineWatchCommand.PLAYLIST_ID_FIELD
                        && wireType == WireFormat.WIRETYPE_LENGTH_DELIMITED) {
                    playlistId = input.readStringRequireUtf8();
                } else if (field == OnlineWatchCommand.INDEX_FIELD && wireType == WireFormat.WIRETYPE_VARINT) {
                    index = input.readInt32();
                } else if (!input.skipField(tag)) {
                    break;
                }
            }
            return videoId.isEmpty() ? null : new WatchTarget(videoId, playlistId, index);
        } catch (IOException ex) {
            return null;
        }
    }

    /**
     * The watch target with the id of the song instead of the id of its music video. A song that has a video copy
     * starts as its music video (the app's tap is retargeted before it is dispatched), which is not an id of the
     * downloaded list: the list, the copy and the place of the song in it are all known by the song's id.
     */
    @Nullable
    static WatchTarget songTargetOf(@Nullable WatchTarget watch, Map<String, String> videoToSong) {
        if (watch == null) return null;

        String songId = songOf(watch.videoId(), videoToSong);
        return songId.equals(watch.videoId()) ? watch : new WatchTarget(songId, watch.playlistId(), watch.index());
    }

    /**
     * The watch target with the id of the song a music video was saved as ({@code canonical} maps an id to the id its
     * copy is stored under: the id itself for any other).
     */
    @Nullable
    static WatchTarget canonicalTargetOf(@Nullable WatchTarget watch, UnaryOperator<String> canonical) {
        if (watch == null) return null;

        String songId = canonical.apply(watch.videoId());
        return songId.equals(watch.videoId()) ? watch : new WatchTarget(songId, watch.playlistId(), watch.index());
    }

    /** What the app's own command of a tap in the Downloads page, or of a recorded page, becomes when it runs. */
    enum Route {
        /** The app runs the command as it is. */
        STOCK,
        /** The command is dropped and the downloaded list plays from its first song, with no network. */
        PLAY_SOURCE,
        /** The command is dropped and the song plays from its copy as a track of the list, with no network. */
        PLAY_TRACK,
        /** The command is dropped and the list of the songs no downloaded list holds opens, online or offline. */
        OPEN_SONGS
    }

    /** A decision: what to do, and for which list and song (null where the route does not use them). */
    record Decision(Route route, @Nullable String sourceId, @Nullable String videoId) {
        static final Decision STOCK = new Decision(Route.STOCK, null, null);
    }

    /**
     * Decides a command when it is dispatched, never before: a row of the page carries the app's own command, and
     * only the network of this moment says whether the app can run it. The browse of the songs list (No Playlist)
     * opens that list on any network: it has no online page. Otherwise online every command stays the app's.
     * Offline, the browse of a downloaded list plays its songs unless a page was recorded for it (then the app opens
     * that page); the watch of a song of a downloaded list, from the recorded page or a row, plays that song as a
     * track of the list; the watch of any other downloaded song plays its copy as a track of the first downloaded
     * list that holds it, or of the songs list when none does.
     *
     * @param online         The device reaches the internet now.
     * @param browseId       The page a browse command opens, or null for any other command.
     * @param watch          What a watch command names, or null for any other command.
     * @param songsId        The id of the list of the songs no downloaded list holds.
     * @param isSource       Whether a page id names a downloaded list, the {@code VL} prefix of a playlist included.
     * @param hasPage        Whether a page was recorded for the downloaded list.
     * @param hasCopy        Whether the song has a copy with stored data.
     * @param sourceOfWatch  The downloaded list a watch of a list's song belongs to, or null.
     * @param holdingList    The first downloaded list that holds the song, or null when none does.
     */
    static Decision routeOf(boolean online, @Nullable String browseId, @Nullable WatchTarget watch, String songsId,
                            Predicate<String> isSource, Predicate<String> hasPage, Predicate<String> hasCopy,
                            Function<WatchTarget, String> sourceOfWatch, Function<String, String> holdingList) {
        if (browseId != null && songsId.equals(sourceOfBrowseId(browseId))) {
            return new Decision(Route.OPEN_SONGS, songsId, null);
        }
        if (online) return Decision.STOCK;

        if (browseId != null) {
            String sourceId = sourceOfBrowseId(browseId);
            boolean plays = isSource.test(sourceId) && !hasPage.test(sourceId);
            return plays ? new Decision(Route.PLAY_SOURCE, sourceId, null) : Decision.STOCK;
        }

        if (watch == null) return Decision.STOCK;

        String listOfWatch = sourceOfWatch.apply(watch);
        if (!hasCopy.test(watch.videoId())) {
            // A song with no copy has nothing to play here; it may still start the downloaded list it is a track of.
            return listOfWatch == null ? Decision.STOCK : new Decision(Route.PLAY_SOURCE, listOfWatch, null);
        }

        if (listOfWatch != null) return new Decision(Route.PLAY_TRACK, listOfWatch, watch.videoId());

        String holding = holdingList.apply(watch.videoId());
        return new Decision(Route.PLAY_TRACK, holding != null ? holding : songsId, watch.videoId());
    }

    /**
     * The first downloaded list, by id, that lists the song, or null when none does: where a song tapped outside any
     * list plays when it belongs to one.
     */
    @Nullable
    static String sourceHolding(String videoId, Map<String, List<String>> tracksBySource) {
        String found = null;
        for (Map.Entry<String, List<String>> source : tracksBySource.entrySet()) {
            boolean holds = source.getValue().contains(videoId);
            if (holds && (found == null || source.getKey().compareTo(found) < 0)) found = source.getKey();
        }
        return found;
    }

    /**
     * The downloaded list a watch of a playlist song belongs to: the list with the playlist's id, or for an album
     * page (its browse id is not the playlist id of the album's audio playlist) the downloaded album that holds the
     * song. Null when no downloaded list does.
     *
     * @param tracksBySource The song ids of every downloaded list, by list id.
     */
    @Nullable
    static String sourceOfPlaylist(String playlistId, String videoId, Map<String, List<String>> tracksBySource) {
        if (tracksBySource.containsKey(playlistId)) return playlistId;
        if (!playlistId.startsWith(AUDIO_PLAYLIST_PREFIX)) return null;

        for (Map.Entry<String, List<String>> source : tracksBySource.entrySet()) {
            if (source.getKey().startsWith(ALBUM_BROWSE_PREFIX) && source.getValue().contains(videoId)) {
                return source.getKey();
            }
        }
        return null;
    }

    /** The id of the downloaded list a browse id opens: a playlist page is {@code VL} and the playlist id. */
    static String sourceOfBrowseId(String browseId) {
        return browseId.startsWith("VL") ? browseId.substring(2) : browseId;
    }

    /** Whether the message has the field, of any wire type. */
    static boolean hasField(byte[] message, int number) {
        try {
            CodedInputStream input = CodedInputStream.newInstance(message);
            while (!input.isAtEnd()) {
                int tag = input.readTag();
                if (WireFormat.getTagFieldNumber(tag) == number) return true;
                if (!input.skipField(tag)) return false;
            }
        } catch (IOException ignored) {
            // A message that does not parse has no field to speak of.
        }
        return false;
    }

    /** Whether a player response carries the marker the app sets on a response it read from its offline store. */
    static boolean hasOfflineMarker(byte[] response) {
        return hasField(response, OFFLINE_RESPONSE_FIELD);
    }

    /** The queue items of a list's tracks that have stored data, in the list's order. */
    static List<OfflineWatchNext.Item> itemsOfTracks(List<OfflineSourceStore.Track> tracks) {
        List<OfflineWatchNext.Item> items = new ArrayList<>();
        for (OfflineSourceStore.Track track : tracks) {
            if (track.availableOffline()) items.add(itemOf(track.stored()));
        }
        return items;
    }

    /**
     * The queue items of the songs list (No Playlist): the loose songs that have stored data, sorted by title
     * ignoring case, then by id. That is the order the list shows and the order it plays.
     */
    static List<OfflineWatchNext.Item> itemsOfSongs(List<OfflineCopyMetadata> copies, Set<String> loose) {
        List<OfflineCopyMetadata> sorted = new ArrayList<>();
        for (OfflineCopyMetadata copy : copies) {
            if (loose.contains(copy.videoId())) sorted.add(copy);
        }
        sorted.sort(Comparator.comparing(OfflineCopyMetadata::title, String.CASE_INSENSITIVE_ORDER)
                .thenComparing(OfflineCopyMetadata::videoId));
        List<OfflineWatchNext.Item> items = new ArrayList<>(sorted.size());
        for (OfflineCopyMetadata copy : sorted) items.add(itemOf(copy));
        return items;
    }

    /**
     * The items as a video mode shows them: every song that has a video copy is its music video, with its own id.
     * The others stay the songs.
     *
     * @param videoToSong The committed video copies, music video id to the id of the song they belong to.
     */
    static List<OfflineWatchNext.Item> showingVideos(List<OfflineWatchNext.Item> items,
                                                     Map<String, String> videoToSong) {
        if (videoToSong.isEmpty()) return items;

        Map<String, String> videoOfSong = new HashMap<>();
        for (Map.Entry<String, String> pair : videoToSong.entrySet()) videoOfSong.put(pair.getValue(), pair.getKey());

        List<OfflineWatchNext.Item> shown = new ArrayList<>(items.size());
        for (OfflineWatchNext.Item item : items) {
            String video = videoOfSong.get(item.videoId());
            shown.add(video == null || video.equals(item.videoId()) ? item : item.showingVideo(video));
        }
        return shown;
    }

    /** The music video of a song that has a video copy, or null: the committed pairs read the other way. */
    @Nullable
    static String videoOf(String songId, Map<String, String> videoToSong) {
        for (Map.Entry<String, String> pair : videoToSong.entrySet()) {
            if (pair.getValue().equals(songId) && !pair.getKey().equals(songId)) return pair.getKey();
        }
        return null;
    }

    /**
     * The music video type of the command that starts a song: its music video (OMV) when it has a video copy, which
     * answers in every mode, else the song (ATV).
     */
    static int startTypeOf(String songId, Map<String, String> videoToSong) {
        return videoOf(songId, videoToSong) == null ? CommandRewrite.TYPE_ATV : CommandRewrite.TYPE_OMV;
    }

    /**
     * Whether a queue request is for the music video of a song that has a copy: only then the queue shows the videos
     * of the songs that have one. A request for the song itself (a song without a video, or a start of another
     * client, as Android Auto) keeps the songs.
     */
    static boolean showsVideos(String requestedId, Map<String, String> videoToSong) {
        return !songOf(requestedId, videoToSong).equals(requestedId);
    }

    /**
     * The song a request names: the id itself, or the song of the video copy when the id is a music video that has
     * one. The queue of a list holds songs, so a request for a song's video is the request for that song's item.
     */
    static String songOf(String videoId, Map<String, String> videoToSong) {
        String song = videoToSong.get(videoId);
        return song == null ? videoId : song;
    }

    static OfflineWatchNext.Item itemOf(OfflineCopyMetadata copy) {
        return new OfflineWatchNext.Item(copy.videoId(), copy.title(), copy.artist(),
                copy.album() == null ? "" : copy.album(), copy.durationMs(), copy.thumbnailUrl());
    }

    /**
     * The index of the video in the queue: the requested index when it holds the video, else its first place, else
     * -1. A request names the position the list had when it was tapped, which a changed list may have moved.
     */
    static int currentIndex(List<OfflineWatchNext.Item> items, String videoId, int requestedIndex) {
        if (requestedIndex >= 0 && requestedIndex < items.size()
                && items.get(requestedIndex).videoId().equals(videoId)) {
            return requestedIndex;
        }
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).videoId().equals(videoId)) return i;
        }
        return -1;
    }

    /** The payload of the first length-delimited field with the number, or null when the message has none. */
    @Nullable
    private static byte[] lengthDelimitedField(byte[] message, int number) throws IOException {
        CodedInputStream input = CodedInputStream.newInstance(message);
        while (!input.isAtEnd()) {
            int tag = input.readTag();
            if (WireFormat.getTagFieldNumber(tag) == number
                    && WireFormat.getTagWireType(tag) == WireFormat.WIRETYPE_LENGTH_DELIMITED) {
                return input.readByteArray();
            }
            if (!input.skipField(tag)) return null;
        }
        return null;
    }
}
