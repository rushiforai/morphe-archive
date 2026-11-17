/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import org.junit.Test;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static org.junit.Assert.*;

public class SmartShufflePolicyTest {
    private record Item(long occurrenceId, String videoId) implements SmartShufflePolicy.Occurrence { }

    private static Item original(int index) {
        return new Item(index + 1, "original-" + index);
    }

    private static Item[] originals(int count) {
        Item[] result = new Item[count];
        for (int index = 0; index < count; index++) result[index] = original(index);
        return result;
    }

    private static SmartShufflePolicy policy(int count) {
        Set<String> ids = new HashSet<>();
        for (int index = 0; index < count; index++) ids.add("original-" + index);
        return new SmartShufflePolicy(ids);
    }

    private static int indexOf(List<Item> items, long id) {
        for (int index = 0; index < items.size(); index++) if (items.get(index).occurrenceId() == id) return index;
        throw new AssertionError("Missing test occurrence " + id);
    }

    @Test public void cadenceAlternatesTwoAndThreeOriginalsWithoutReordering() {
        SmartShufflePolicy policy = policy(20);
        List<Item> queue = new ArrayList<>(List.of(originals(20)));
        long[] expected = {2, 5, 7};
        for (int index = 0; index < expected.length; index++) {
            long anchor = policy.nextAnchor(queue.toArray(new Item[0]), 0);
            assertEquals(expected[index], anchor);
            Item suggestion = new Item(100 + index, "suggestion-" + index);
            assertTrue(policy.reserve(suggestion.videoId()));
            policy.committed(anchor, suggestion, null);
            queue.add(indexOf(queue, anchor) + 1, suggestion);
        }
        assertEquals(SmartShufflePolicy.NO_ANCHOR, policy.nextAnchor(queue.toArray(new Item[0]), 0));
        List<String> retained = new ArrayList<>();
        for (Item item : queue) if (!policy.isSuggested(item.occurrenceId())) retained.add(item.videoId());
        for (int index = 0; index < 20; index++) assertEquals("original-" + index, retained.get(index));
    }

    @Test public void lookaheadNeverPrebuildsAnUnboundedQueue() {
        SmartShufflePolicy policy = policy(200);
        assertEquals(2, policy.nextAnchor(originals(200), 0));
        assertEquals(12, policy.nextAnchor(originals(200), 10));
        assertEquals(200, policy.nextAnchor(originals(200), 198));
    }

    @Test public void fullPlaylistDedupeIncludesOriginalsNotYetInTheNativePage() {
        SmartShufflePolicy policy = policy(200);
        assertFalse(policy.reserve("original-199"));
        assertFalse(policy.reserve("original-0"));
        assertTrue(policy.reserve("recommendation"));
        assertFalse(policy.reserve("recommendation"));
    }

    @Test public void failedOrDismissedCandidateCannotReturnInSameSession() {
        SmartShufflePolicy policy = policy(10);
        assertTrue(policy.reserve("suggestion"));
        Item suggestion = new Item(99, "suggestion");
        policy.committed(2, suggestion, "payload");
        assertTrue(policy.clear(99));
        assertFalse(policy.reserve("suggestion"));
        assertEquals(5, policy.nextAnchor(originals(10), 0));
    }

    @Test public void occurrenceIdentityNeverMarksAnotherCopyOfTheSameVideo() {
        SmartShufflePolicy policy = policy(10);
        policy.committed(2, new Item(99, "same-video"), "payload");
        assertTrue(policy.isSuggested(99));
        assertFalse(policy.isSuggested(100));
        assertEquals("payload", policy.suggestion(99).attachment());
    }

    @Test public void reorderKeepsTheMarkerAttachedToItsOccurrence() {
        SmartShufflePolicy policy = policy(10);
        Item suggestion = new Item(99, "suggestion");
        policy.committed(2, suggestion, null);
        assertFalse(policy.retain(new Item[]{original(2), suggestion, original(0)}));
        assertTrue(policy.isSuggested(99));
        assertTrue(policy.retain(new Item[]{original(2), original(0)}));
        assertFalse(policy.isSuggested(99));
    }

    @Test public void playNextDoesNotShiftOriginalCadenceOrReshuffleAnything() {
        SmartShufflePolicy policy = policy(10);
        Item[] queue = {original(0), new Item(200, "manual-play-next"), original(1), original(2)};
        assertEquals(2, policy.nextAnchor(queue, 0));
        assertEquals("manual-play-next", queue[1].videoId());
        assertEquals("original-1", queue[2].videoId());
    }

    @Test public void staleRequestOrReplacedQueueCannotCommit() {
        assertTrue(SmartShufflePolicy.accepts(4, 4, 80, 80, true));
        assertFalse(SmartShufflePolicy.accepts(4, 5, 80, 80, true));
        assertFalse(SmartShufflePolicy.accepts(4, 4, 80, 81, true));
        assertFalse(SmartShufflePolicy.accepts(4, 4, 80, 80, false));
    }

    @Test public void offlineRemovalSelectsOnlyFutureOccurrencesNotHistoryOrCurrent() {
        SmartShufflePolicy policy = policy(10);
        Item previous = new Item(90, "past");
        Item current = new Item(91, "current");
        Item upcoming = new Item(92, "next");
        policy.committed(2, previous, null);
        policy.committed(5, current, null);
        policy.committed(7, upcoming, null);
        Item[] queue = {previous, original(0), current, original(1), upcoming};
        assertEquals(List.of(92L), policy.unplayed(queue, 2));
        // Native preserveCurrent may reject a raced removal, so selection alone must not clear the marker.
        assertTrue(policy.isSuggested(92));
        assertTrue(policy.removedOffline(92));
        assertTrue(policy.isSuggested(90));
        assertTrue(policy.isSuggested(91));
        assertFalse(policy.isSuggested(92));
    }

    @Test public void offlineRemovalFreesFutureSlotButRetainsSessionDedupe() {
        SmartShufflePolicy policy = policy(10);
        policy.committed(2, new Item(99, "suggestion"), null);
        assertTrue(policy.removedOffline(99));
        assertEquals(2, policy.nextAnchor(originals(10), 0));
        assertFalse(policy.reserve("suggestion"));
    }

    @Test public void invalidCurrentIndexNeverPlansOrRemovesRows() {
        SmartShufflePolicy policy = policy(10);
        assertEquals(SmartShufflePolicy.NO_ANCHOR, policy.nextAnchor(originals(10), -1));
        assertEquals(SmartShufflePolicy.NO_ANCHOR, policy.nextAnchor(originals(10), 10));
        assertTrue(policy.unplayed(originals(10), -1).isEmpty());
    }

    @Test public void songVideoCounterpartDoesNotForgetOriginalOccurrence() {
        SmartShufflePolicy policy = policy(10);
        assertEquals(2, policy.nextAnchor(originals(10), 0));
        Item[] modeSwitched = {new Item(1, "video-counterpart"), original(1), original(2)};
        assertEquals(2, policy.nextAnchor(modeSwitched, 0));
    }
}
