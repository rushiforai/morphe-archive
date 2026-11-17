/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Session-local mixing decisions. The caller serializes access; no Android, network or queue mutations here. */
final class SmartShufflePolicy {
    interface Occurrence {
        long occurrenceId();
        String videoId();
    }

    record Suggestion(long occurrenceId, String videoId, long anchorId, Object attachment) { }

    static final int LOOKAHEAD_ORIGINALS = 8;
    static final int MAX_UPCOMING_SUGGESTIONS = 3;
    static final long NO_ANCHOR = Long.MIN_VALUE;

    private final Set<String> originals;
    private final Set<String> seenVideos = new HashSet<>();
    private final Set<Long> originalOccurrences = new HashSet<>();
    private final Set<Long> filledAnchors = new HashSet<>();
    private final Map<Long, Suggestion> suggestions = new HashMap<>();

    SmartShufflePolicy(Set<String> originals) {
        this.originals = originals;
    }

    static boolean accepts(long expectedEpoch, long currentEpoch, long expectedQueue,
                           long actualQueue, boolean online) {
        return online && expectedEpoch == currentEpoch && expectedQueue == actualQueue;
    }

    /** Reserve before asynchronous resolution, so duplicates cannot race into this session. */
    boolean reserve(String videoId) {
        return videoId != null && !videoId.isEmpty() && !originals.contains(videoId) && seenVideos.add(videoId);
    }

    boolean isSuggested(long occurrenceId) {
        return suggestions.containsKey(occurrenceId);
    }

    Suggestion suggestion(long occurrenceId) {
        return suggestions.get(occurrenceId);
    }

    void committed(long anchorId, Occurrence item, Object attachment) {
        filledAnchors.add(anchorId);
        seenVideos.add(item.videoId());
        suggestions.put(item.occurrenceId(),
                new Suggestion(item.occurrenceId(), item.videoId(), anchorId, attachment));
    }

    /** Keep confirmation clears presentation only; Dismiss leaves its slot empty, never immediately replaced. */
    boolean clear(long occurrenceId) {
        return suggestions.remove(occurrenceId) != null;
    }

    /** Alternating gaps of two and three originals, bounded to eight upcoming originals and three suggestions. */
    long nextAnchor(Occurrence[] queue, int currentIndex) {
        if (currentIndex < 0 || currentIndex >= queue.length) return NO_ANCHOR;
        int upcomingSuggestions = 0;
        for (int index = currentIndex + 1; index < queue.length; index++) {
            if (suggestions.containsKey(queue[index].occurrenceId())) upcomingSuggestions++;
        }
        if (upcomingSuggestions >= MAX_UPCOMING_SUGGESTIONS) return NO_ANCHOR;

        int originalNumber = 0;
        int nextSlot = 2;
        int gap = 3;
        int lookahead = 0;
        for (int index = 0; index < queue.length; index++) {
            Occurrence item = queue[index];
            if (suggestions.containsKey(item.occurrenceId())) continue;
            if (originals.contains(item.videoId())) originalOccurrences.add(item.occurrenceId());
            if (!originalOccurrences.contains(item.occurrenceId())) continue;
            originalNumber++;
            if (index >= currentIndex && ++lookahead > LOOKAHEAD_ORIGINALS) break;
            if (originalNumber != nextSlot) continue;
            nextSlot += gap;
            gap = gap == 3 ? 2 : 3;
            if (index >= currentIndex && !filledAnchors.contains(item.occurrenceId())) return item.occurrenceId();
        }
        return NO_ANCHOR;
    }

    /** Offline/toggle-off preserves history and the currently playing occurrence; only future rows are removed. */
    List<Long> unplayed(Occurrence[] queue, int currentIndex) {
        List<Long> future = new ArrayList<>();
        if (currentIndex < 0 || currentIndex >= queue.length) return future;
        for (int index = currentIndex + 1; index < queue.length; index++) {
            long id = queue[index].occurrenceId();
            if (suggestions.containsKey(id)) future.add(id);
        }
        return future;
    }

    boolean removedOffline(long occurrenceId) {
        Suggestion suggestion = suggestions.remove(occurrenceId);
        if (suggestion == null) return false;
        filledAnchors.remove(suggestion.anchorId());
        return true;
    }

    /** Forget presentation for genuine removals; occurrences with the same video remain independent. */
    boolean retain(Occurrence[] queue) {
        boolean changed = false;
        Iterator<Long> iterator = suggestions.keySet().iterator();
        while (iterator.hasNext()) {
            long id = iterator.next();
            boolean present = false;
            for (Occurrence item : queue) {
                if (item.occurrenceId() == id) {
                    present = true;
                    break;
                }
            }
            if (!present) {
                iterator.remove();
                changed = true;
            }
        }
        return changed;
    }
}
