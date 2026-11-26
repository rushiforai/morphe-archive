/*
 * Copyright (C) 2026 lavinhoque33.
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25.
 */

package app.morphe.extension.youtube.patches.ghostplay;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class GhostPlaybackStateTest {
    private static final String SELECTED = "selected001";
    private static final String OTHER = "different01";

    @Test
    public void oneShotDoesNotFollowNextPlaybackOrReturnToSameId() {
        GhostPlaybackState state = new GhostPlaybackState();
        state.request(SELECTED, 100);
        assertTrue(state.protectsRequest(SELECTED, 101));
        assertFalse(state.protectsRequest(OTHER, 101));
        assertTrue(state.started(SELECTED, 200));
        assertTrue(state.currentIsProtected(SELECTED));
        assertFalse(state.started(OTHER, 300));
        assertFalse(state.currentIsProtected(OTHER));
        assertTrue(state.blocksStats(SELECTED, 301)); // A late ping still belongs to the ghost playback.
        assertFalse(state.blocksStats(OTHER, 301));
        assertFalse(state.protectsRequest(SELECTED, 350)); // A new request is not a late ping.
        assertFalse(state.started(SELECTED, 400));
        assertFalse(state.blocksStats(SELECTED, 401));
    }

    @Test
    public void duplicateCurrentCallbackDoesNotConsumeQueuedLaunch() {
        GhostPlaybackState state = new GhostPlaybackState();
        state.started(OTHER, 100);
        state.request(SELECTED, 101);
        assertFalse(state.started(OTHER, 102));
        assertTrue(state.started(SELECTED, 103));
    }

    @Test
    public void expiredPendingAndPrefetchDoNotBecomeProtectedPlayback() {
        GhostPlaybackState state = new GhostPlaybackState();
        state.request(SELECTED, 100);
        state.autoCandidate(OTHER, 100);
        assertFalse(state.blocksStats(SELECTED, 15_100));
        assertFalse(state.blocksStats(OTHER, 15_100));
        assertFalse(state.started(SELECTED, 15_100));
        state.started(OTHER, 15_200);
        assertFalse(state.currentIsProtected(OTHER));
    }

    @Test
    public void manualOptOutPersistsUntilNextPlaybackOrExplicitAction() {
        GhostPlaybackState state = new GhostPlaybackState();
        state.autoCandidate(SELECTED, 10);
        state.started(SELECTED, 20);
        assertTrue(state.currentIsProtected(SELECTED));
        state.optOut();
        state.protectCurrent(SELECTED);
        assertFalse(state.blocksStats(SELECTED, 30));
        state.request(SELECTED, 31);
        assertTrue(state.started(SELECTED, 32));
        assertTrue(state.currentIsProtected(SELECTED));
        state.dismissed();
        assertFalse(state.currentIsProtected(SELECTED));
    }
}
