/*
 * Copyright (C) 2026 lavinhoque33.
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25.
 */

package app.morphe.extension.youtube.patches.ghostplay;

import androidx.annotation.Nullable;

import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

/** Tracks a pending explicit launch, the current playback, and bounded late stats. */
final class GhostPlaybackState {
    private static final long LAUNCH_WINDOW_MS = 15_000;
    private static final int MAX_RETAINED_IDS = 64;

    private final Set<String> recentGhostIds = new LinkedHashSet<>();
    private final Map<String, Long> autoCandidates = new LinkedHashMap<>();
    @Nullable private String pendingId;
    private long pendingUntil;
    @Nullable private String playingId;
    private boolean protectedPlayback;
    private boolean optedOut;

    synchronized void request(String id, long now) {
        pendingId = id;
        pendingUntil = now + LAUNCH_WINDOW_MS;
    }

    synchronized boolean pendingMatches(String id, long now) {
        return id.equals(pendingId) && now < pendingUntil;
    }

    synchronized void autoCandidate(String id, long now) {
        if (id.equals(playingId)) return;
        if (autoCandidates.size() >= MAX_RETAINED_IDS && !autoCandidates.containsKey(id)) {
            var iterator = autoCandidates.keySet().iterator();
            iterator.next();
            iterator.remove();
        }
        autoCandidates.put(id, now + LAUNCH_WINDOW_MS);
    }

    /** Only actual playback, not a prefetched player response, consumes the one-shot launch. */
    synchronized boolean started(String id, long now) {
        boolean explicit = pendingMatches(id, now);
        if (explicit || !id.equals(playingId) || now >= pendingUntil) {
            pendingId = null;
        }
        Long candidateUntil = autoCandidates.remove(id);
        boolean auto = candidateUntil != null && now < candidateUntil;
        if (!id.equals(playingId)) {
            playingId = id;
            protectedPlayback = auto;
            optedOut = false;
        } else if (explicit) {
            optedOut = false;
        }
        protectedPlayback |= !optedOut && explicit;
        if (protectedPlayback) {
            remember(recentGhostIds, id);
        } else {
            recentGhostIds.remove(id);
        }
        return explicit;
    }

    synchronized void protectCurrent(String id) {
        if (id.equals(playingId) && !optedOut) {
            protectedPlayback = true;
            remember(recentGhostIds, id);
        }
    }

    synchronized void optOut() {
        pendingId = null;
        protectedPlayback = false;
        optedOut = true;
        recentGhostIds.remove(playingId);
    }

    synchronized void dismissed() {
        playingId = null;
        protectedPlayback = false;
        optedOut = false;
    }

    synchronized boolean currentIsProtected(@Nullable String id) {
        return id != null && id.equals(playingId) && protectedPlayback;
    }

    synchronized boolean protectsRequest(String id, long now) {
        Long candidateUntil = autoCandidates.get(id);
        return currentIsProtected(id) || pendingMatches(id, now) || candidateUntil != null && now < candidateUntil;
    }

    synchronized boolean blocksStats(@Nullable String id, long now) {
        return id != null && (protectsRequest(id, now) || recentGhostIds.contains(id));
    }

    private static void remember(Set<String> ids, String id) {
        ids.remove(id);
        ids.add(id);
        if (ids.size() > MAX_RETAINED_IDS) {
            var iterator = ids.iterator();
            iterator.next();
            iterator.remove();
        }
    }
}
