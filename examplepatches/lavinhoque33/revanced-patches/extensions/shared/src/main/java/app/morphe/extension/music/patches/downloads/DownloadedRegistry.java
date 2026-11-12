/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * The stream copies of Play downloads locally, held in memory so that a row or a header can be checked without any
 * disk or MediaStore access: the video ids that have a valid stream copy (the only thing a check means; a song
 * that is only a local file is not in it), and the track list of every playlist or album downloaded with stream
 * copies. Thread safe; contains no Android code.
 */
final class DownloadedRegistry {
    private static final int VIDEO_ID_LENGTH = 11;

    private final Set<String> tracks = ConcurrentHashMap.newKeySet();
    private final Map<String, List<String>> sources = new ConcurrentHashMap<>();
    /** The lists whose download started and has not finished: they are remembered, but never saved yet. */
    private final Set<String> pending = ConcurrentHashMap.newKeySet();
    /** The music video ids that name a song with a stream copy, by video id: a song saved from its video. */
    private final Map<String, String> aliases = new ConcurrentHashMap<>();

    boolean hasTracks() {
        return !tracks.isEmpty();
    }

    /** Whether the id, or the song it is an alias of, has a stream copy: what a check or the audio start means. */
    boolean isDownloaded(String videoId) {
        return tracks.contains(canonicalId(videoId));
    }

    /** Whether the id itself is the one a stream copy is stored under; an alias is not. */
    boolean hasOwnCopy(String videoId) {
        return tracks.contains(videoId);
    }

    /** The song id a copy is stored under for this id: the id itself unless it is the alias of a song with a copy. */
    String canonicalId(String videoId) {
        String song = aliases.get(videoId);
        return song != null && tracks.contains(song) ? song : videoId;
    }

    void addAlias(String alias, String songId) {
        aliases.put(alias, songId);
    }

    void setAliases(Map<String, String> known) {
        aliases.keySet().retainAll(known.keySet());
        aliases.putAll(known);
    }

    void add(String videoId) {
        tracks.add(videoId);
    }

    void remove(String videoId) {
        tracks.remove(videoId);
        aliases.values().removeIf(songId -> songId.equals(videoId));
    }

    void addAll(Collection<String> videoIds) {
        tracks.addAll(videoIds);
    }

    void clear() {
        tracks.clear();
        aliases.clear();
    }

    Set<String> snapshot() {
        return new HashSet<>(tracks);
    }

    /**
     * Forgets the tracks that were known before a check of the store and are absent from its result.
     * A track that was added while the check ran was not known before it and is never forgotten.
     */
    void prune(Set<String> knownBefore, Set<String> stillPresent) {
        Set<String> gone = new HashSet<>(knownBefore);
        gone.removeAll(stillPresent);
        tracks.removeAll(gone);
        aliases.values().removeAll(gone);
    }

    void putSource(String sourceId, List<String> videoIds) {
        sources.put(sourceId, Collections.unmodifiableList(new ArrayList<>(videoIds)));
    }

    /** The ordered video ids of a remembered playlist or album, or null. */
    @Nullable
    List<String> sourceTracks(@Nullable String sourceId) {
        return sourceId == null ? null : sources.get(sourceId);
    }

    /**
     * The remembered playlist or album whose id is a whole string of the serialized command, or null. A playlist id
     * is a protobuf string, so it is preceded by its length; that keeps a radio id that merely contains it apart.
     */
    @Nullable
    String findSource(byte[] message) {
        for (String sourceId : sources.keySet()) {
            byte[] id = sourceId.getBytes(StandardCharsets.ISO_8859_1);
            if (id.length == 0 || id.length > 127) continue;
            for (int start = 1; start + id.length <= message.length; start++) {
                if (message[start - 1] != id.length || !matches(message, start, id)) continue;
                return sourceId;
            }
        }
        return null;
    }

    private static boolean matches(byte[] message, int start, byte[] id) {
        for (int index = 0; index < id.length; index++) {
            if (message[start + index] != id[index]) return false;
        }
        return true;
    }

    void removeSource(String sourceId) {
        sources.remove(sourceId);
        pending.remove(sourceId);
    }

    /** A list whose download started: it counts as not saved until {@link #finish} says it was. */
    void start(String sourceId, List<String> videoIds) {
        putSource(sourceId, videoIds);
        pending.add(sourceId);
    }

    void finish(String sourceId) {
        pending.remove(sourceId);
    }

    void setPending(Collection<String> sourceIds) {
        pending.clear();
        pending.addAll(sourceIds);
    }

    boolean isPending(@Nullable String sourceId) {
        return sourceId != null && pending.contains(sourceId);
    }

    boolean hasSource(String sourceId) {
        return sources.containsKey(sourceId);
    }

    /**
     * True when every available track of a remembered playlist or album still has a stream copy: an unavailable
     * track has none to have. A list whose download has not finished (it was interrupted or still runs) is not.
     */
    boolean isSourceDownloaded(@Nullable String sourceId) {
        List<String> videoIds = sourceId == null ? null : sources.get(sourceId);
        if (videoIds == null || pending.contains(sourceId)) return false;

        List<String> available = PlaylistPage.available(videoIds);
        return !available.isEmpty() && tracks.containsAll(available);
    }

    /**
     * Finds a downloaded video id in the serialized model of a row. A video id is a protobuf string of
     * exactly 11 characters, so it is always preceded by the length byte 11; that prefix keeps the scan
     * cheap and makes a match by chance practically impossible, because the id must also be a download.
     */
    @Nullable
    String findDownloaded(byte[] message) {
        if (tracks.isEmpty()) return null;
        for (int start = 0; start + VIDEO_ID_LENGTH < message.length; start++) {
            if (message[start] != VIDEO_ID_LENGTH || !isVideoId(message, start + 1)) continue;
            String candidate = new String(message, start + 1, VIDEO_ID_LENGTH, StandardCharsets.ISO_8859_1);
            if (tracks.contains(candidate)) return candidate;
            if (aliases.containsKey(candidate) && isDownloaded(candidate)) return canonicalId(candidate);
        }
        return null;
    }

    /**
     * Finds a downloaded video id that sits as a stand-alone word in a model: exactly 11 id characters with
     * a non-id character (or the edge of the model) on both sides, as in a URL or a plain text field.
     * The fallback of {@link #findDownloaded} for ids that are not whole protobuf strings.
     */
    @Nullable
    String findDownloadedLoose(byte[] message) {
        if (tracks.isEmpty()) return null;
        int runStart = 0;
        for (int index = 0; index <= message.length; index++) {
            if (index < message.length && isIdCharacter(message[index])) continue;

            if (index - runStart == VIDEO_ID_LENGTH) {
                String candidate = new String(message, runStart, VIDEO_ID_LENGTH, StandardCharsets.ISO_8859_1);
                if (isDownloaded(candidate)) return canonicalId(candidate);
            }
            runStart = index + 1;
        }
        return null;
    }

    /** The video-id-shaped strings of a model, at most {@code limit}: what {@link #findDownloaded} looks at. */
    static List<String> candidateIds(byte[] message, int limit) {
        List<String> candidates = new ArrayList<>();
        for (int start = 0; start + VIDEO_ID_LENGTH < message.length && candidates.size() < limit; start++) {
            if (message[start] == VIDEO_ID_LENGTH && isVideoId(message, start + 1)) {
                String candidate = new String(message, start + 1, VIDEO_ID_LENGTH, StandardCharsets.ISO_8859_1);
                if (!candidates.contains(candidate)) candidates.add(candidate);
            }
        }
        return candidates;
    }

    private static boolean isVideoId(byte[] message, int from) {
        for (int index = from; index < from + VIDEO_ID_LENGTH; index++) {
            if (!isIdCharacter(message[index])) return false;
        }
        return true;
    }

    private static boolean isIdCharacter(byte character) {
        return (character >= 'a' && character <= 'z') || (character >= 'A' && character <= 'Z')
                || (character >= '0' && character <= '9') || character == '-' || character == '_';
    }

    /**
     * The video ids of a native playlist, or null when any of its tracks is not a download of the app.
     * Recovers the tracks of playlists that were saved before the track lists were remembered.
     */
    @Nullable
    static List<String> resolveTracks(List<Long> mediaIds, Map<Long, String> videoIdByMediaId) {
        if (mediaIds.isEmpty()) return null;
        List<String> videoIds = new ArrayList<>(mediaIds.size());
        for (long mediaId : mediaIds) {
            String videoId = videoIdByMediaId.get(mediaId);
            if (videoId == null) return null;
            videoIds.add(videoId);
        }
        return videoIds;
    }

    static String encode(List<String> videoIds) {
        return String.join("\n", videoIds);
    }

    static List<String> decode(String encoded) {
        List<String> videoIds = new ArrayList<>();
        for (String videoId : encoded.split("\n")) if (!videoId.isEmpty()) videoIds.add(videoId);
        return videoIds;
    }
}
