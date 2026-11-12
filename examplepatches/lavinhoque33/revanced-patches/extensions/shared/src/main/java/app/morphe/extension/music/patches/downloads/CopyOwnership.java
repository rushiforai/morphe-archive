/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 * Who a stream copy belongs to, and so what removing a download may delete. Contains no Android code.
 *
 * <p>The rule: a copy is held by every downloaded playlist or album that lists its song, and by the user's own
 * download of the song ({@code individual}). Removing a list deletes the copies of its songs that no other
 * downloaded list lists and that the user did not download on their own; every other copy stays, with the list's
 * remaining holders. The video copy of a song is held only by the downloaded lists that list the song: the user's
 * own download of a song saves audio only, so it never needs the video. Removing a single song deletes its copy
 * outright, with its video, whatever else lists it: the lists then simply lack that song.
 *
 * <p>A <em>loose</em> song is a copy that no downloaded list or album lists.
 */
final class CopyOwnership {
    private CopyOwnership() {}

    /** What removing one downloaded list deletes: audio copies (with their video copies) and video copies alone. */
    record Removal(List<String> deleteCopies, List<String> deleteVideos, List<String> kept) {}

    /**
     * @param sourceId   The downloaded list that is removed.
     * @param sources    The track list of every downloaded list, by id, including {@code sourceId}.
     * @param individual The songs the user downloaded on their own.
     * @param copyIds    The songs that have a stream copy.
     */
    static Removal removing(String sourceId, Map<String, List<String>> sources, Set<String> individual,
                            Collection<String> copyIds) {
        Set<String> others = tracksOfOthers(sourceId, sources);
        List<String> deleteCopies = new ArrayList<>();
        List<String> deleteVideos = new ArrayList<>();
        List<String> kept = new ArrayList<>();
        Set<String> seen = new HashSet<>();
        for (String videoId : sources.getOrDefault(sourceId, List.of())) {
            if (!seen.add(videoId) || !PlaylistPage.isAvailable(videoId) || !copyIds.contains(videoId)) continue;

            if (others.contains(videoId)) {
                kept.add(videoId);
            } else if (individual.contains(videoId)) {
                deleteVideos.add(videoId);
                kept.add(videoId);
            } else {
                deleteCopies.add(videoId);
            }
        }
        return new Removal(deleteCopies, deleteVideos, kept);
    }

    private static Set<String> tracksOfOthers(String sourceId, Map<String, List<String>> sources) {
        Set<String> others = new HashSet<>();
        for (Map.Entry<String, List<String>> source : sources.entrySet()) {
            if (!source.getKey().equals(sourceId)) others.addAll(source.getValue());
        }
        return others;
    }

    /** The songs with a stream copy that no downloaded list lists, sorted by id. */
    static Set<String> looseSongs(Collection<String> copyIds, Map<String, List<String>> sources) {
        Set<String> loose = new TreeSet<>(copyIds);
        for (List<String> tracks : sources.values()) loose.removeAll(tracks);
        return loose;
    }

    /** How many downloaded lists list the song. */
    static int listsHolding(String videoId, Map<String, List<String>> sources) {
        int count = 0;
        for (List<String> tracks : sources.values()) {
            if (tracks.contains(videoId)) count++;
        }
        return count;
    }
}
