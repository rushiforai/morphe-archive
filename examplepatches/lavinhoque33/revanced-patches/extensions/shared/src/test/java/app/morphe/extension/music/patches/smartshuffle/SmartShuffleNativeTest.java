/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-15.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import android.app.Activity;

import org.junit.Test;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.utils.Utils;

import static org.junit.Assert.*;

/** Native occurrence continuity, independent of video identity or mutable queue model identity. */
public class SmartShuffleNativeTest {
    private static SmartShuffleNative.Item item(long id, String video) {
        return new SmartShuffleNative.Item(id, video);
    }

    @Test public void insertionAndPlayNextPreserveGenerationAndOriginalOrder() {
        SmartShuffleNative.Generation state = new SmartShuffleNative.Generation();
        long generation = state.update(new SmartShuffleNative.Item[]{item(1, "a"), item(2, "b")}, "PLsource");
        assertEquals(generation, state.update(new SmartShuffleNative.Item[]{
                item(1, "a"), item(3, "suggestion"), item(4, "playnext"), item(2, "b")}, "PLsource"));
    }

    @Test public void movesAndCounterpartVideoChangesPreserveOccurrenceGeneration() {
        SmartShuffleNative.Generation state = new SmartShuffleNative.Generation();
        long generation = state.update(new SmartShuffleNative.Item[]{item(1, "audio"), item(2, "b")}, "PLsource");
        assertEquals(generation, state.update(new SmartShuffleNative.Item[]{
                item(2, "b"), item(1, "video-counterpart")}, "PLsource"));
    }

    @Test public void replacementWithSameVideoIdsChangesGeneration() {
        SmartShuffleNative.Generation state = new SmartShuffleNative.Generation();
        long generation = state.update(new SmartShuffleNative.Item[]{item(1, "a"), item(2, "b")}, "PLsource");
        assertNotEquals(generation, state.update(new SmartShuffleNative.Item[]{
                item(3, "a"), item(4, "b")}, "PLsource"));
    }

    @Test public void explicitNativeReplacementChangesGenerationEvenWhenItemsAreReused() {
        SmartShuffleNative.Generation state = new SmartShuffleNative.Generation();
        SmartShuffleNative.Item[] items = {item(1, "a"), item(2, "b")};
        long generation = state.update(items, "PLsource");
        state.reset();
        assertNotEquals(generation, state.update(items, "PLsource"));
    }

    @Test public void duplicateVideoRemovalTargetsOnlyRequestedOccurrence() {
        SmartShuffleNative.Item[] items = {item(10, "duplicate"), item(11, "duplicate")};
        assertEquals(0, SmartShuffleNative.indexOf(items, 10));
        assertEquals(1, SmartShuffleNative.indexOf(items, 11));
        assertEquals(-1, SmartShuffleNative.indexOf(items, 12));
    }

    @Test public void differentSourceInvalidatesOverlappingOccurrences() {
        SmartShuffleNative.Generation state = new SmartShuffleNative.Generation();
        SmartShuffleNative.Item[] items = {item(1, "a")};
        long generation = state.update(items, "PLfirst");
        assertNotEquals(generation, state.update(items, "PLsecond"));
    }

    @Test public void emptyQueueReplacementInvalidatesPriorGeneration() {
        SmartShuffleNative.Generation state = new SmartShuffleNative.Generation();
        long generation = state.update(new SmartShuffleNative.Item[]{item(1, "a")}, "PLsource");
        assertNotEquals(generation, state.update(new SmartShuffleNative.Item[0], ""));
    }

    @Test public void pendingRemovalCannotCrossQueueGeneration() {
        SmartShuffleNative.Snapshot snapshot = new SmartShuffleNative.Snapshot(2, 0,
                new SmartShuffleNative.Item[]{item(1, "a"), item(2, "suggestion")}, true, "PLsource");
        assertEquals(-1, SmartShuffleNative.removalIndex(snapshot, 1, 2, false));
    }

    @Test public void preserveCurrentRechecksOccurrenceAtCommitInsteadOfSchedulingTime() {
        SmartShuffleNative.Snapshot snapshot = new SmartShuffleNative.Snapshot(2, 1,
                new SmartShuffleNative.Item[]{item(1, "a"), item(2, "suggestion")}, true, "PLsource");
        assertEquals(-1, SmartShuffleNative.removalIndex(snapshot, 2, 2, true));
        assertEquals(1, SmartShuffleNative.removalIndex(snapshot, 2, 2, false));
        assertEquals(0, SmartShuffleNative.removalIndex(snapshot, 2, 1, true));
    }

    @Test public void recycledNonnativeRowsNeverGetVideoBasedIdentity() {
        assertEquals(Long.MIN_VALUE, SmartShuffleNative.occurrenceId(new Object()));
        assertEquals(42, SmartShuffleNative.occurrenceId((SmartShuffleNative.Occurrence) () -> 42));
    }

    @Test public void insertedOccurrencesKeepTheirOwnIdentityEvenWithDuplicateVideosAndMovedNeighbors() {
        SmartShuffleNative.Item original = item(10, "duplicate");
        SmartShuffleNative.Item neighbor = item(11, "neighbor");
        SmartShuffleNative.Item suggestion = item(12, "duplicate");
        SmartShuffleNative.Item[] inserted = SmartShuffleNative.insertedItems(
                new SmartShuffleNative.Item[]{original, neighbor},
                new SmartShuffleNative.Item[]{neighbor, suggestion, original});

        assertEquals(1, inserted.length);
        assertSame(suggestion, inserted[0]);
        assertEquals(12, inserted[0].occurrenceId());
    }

    @Test public void counterpartUpdatesAndReorderingNeverMasqueradeAsNewSuggestionOccurrences() {
        SmartShuffleNative.Item[] inserted = SmartShuffleNative.insertedItems(
                new SmartShuffleNative.Item[]{item(10, "audio"), item(11, "neighbor")},
                new SmartShuffleNative.Item[]{item(11, "neighbor"), item(10, "video")});

        assertEquals(0, inserted.length);
    }

    private static final class DispatchActivity extends Activity implements SmartShuffleNative.ActivityAccess {
        Object current;
        byte[] bytes;
        int calls;

        @Override public Object smartCurrentDispatcher() { return current; }
        @Override public void smartDispatch(byte[] bytes) {
            this.bytes = bytes;
            calls++;
        }
    }

    private static final class RecordingDispatcher implements SmartShuffleNative.CommandAccess {
        int calls;
        byte[] bytes;
        RuntimeException failure;

        @Override public void smartDispatch(byte[] bytes) {
            calls++;
            this.bytes = bytes;
            if (failure != null) throw failure;
        }
    }

    private static final class DispatchState implements AutoCloseable {
        final Field activity = Utils.class.getDeclaredField("activityRef");
        final Field dispatcher = SmartShuffleNative.class.getDeclaredField("dispatcher");
        final Object previousActivity;
        final Object previousDispatcher;

        DispatchState(DispatchActivity current) throws Exception {
            activity.setAccessible(true);
            dispatcher.setAccessible(true);
            previousActivity = activity.get(null);
            previousDispatcher = dispatcher.get(null);
            activity.set(null, new WeakReference<>(current));
        }

        @Override public void close() throws Exception {
            activity.set(null, previousActivity);
            dispatcher.set(null, previousDispatcher);
        }
    }

    @Test public void nullWeakDispatcherIsReacquiredFromTheCurrentActivity() throws Exception {
        DispatchActivity activity = new DispatchActivity();
        RecordingDispatcher current = new RecordingDispatcher();
        activity.current = current;
        try (DispatchState state = new DispatchState(activity)) {
            SmartShuffleNative.captureDispatcher(null);
            List<Exception> failures = new ArrayList<>();
            byte[] command = SmartShuffleKeep.pickerCommand("aaaaaaaaaaa");
            SmartShuffleNative.dispatchOnMainThread(command, () -> true, failures::add);
            assertEquals(1, current.calls);
            assertSame(command, current.bytes);
            assertTrue(failures.isEmpty());
            assertSame(current, ((WeakReference<?>) state.dispatcher.get(null)).get());
        }
    }

    @Test public void staleWeakDispatcherIsNeverUsedInsteadOfTheCurrentActivity() throws Exception {
        DispatchActivity activity = new DispatchActivity();
        RecordingDispatcher stale = new RecordingDispatcher();
        RecordingDispatcher current = new RecordingDispatcher();
        activity.current = current;
        try (DispatchState state = new DispatchState(activity)) {
            SmartShuffleNative.captureDispatcher(stale);
            List<Exception> failures = new ArrayList<>();
            SmartShuffleNative.dispatchOnMainThread(new byte[]{1}, () -> true, failures::add);
            assertEquals(0, stale.calls);
            assertEquals(1, current.calls);
            assertTrue(failures.isEmpty());
        }
    }

    @Test public void activityGatewayHandlesNativeDispatchersWithoutTheCapturedBridgeInterface() throws Exception {
        DispatchActivity activity = new DispatchActivity();
        activity.current = new Object();
        try (DispatchState state = new DispatchState(activity)) {
            SmartShuffleNative.captureDispatcher(null);
            List<Exception> failures = new ArrayList<>();
            byte[] command = new byte[]{1};
            SmartShuffleNative.dispatchOnMainThread(command, () -> true, failures::add);
            assertEquals(1, activity.calls);
            assertSame(command, activity.bytes);
            assertTrue(failures.isEmpty());
        }
    }

    @Test public void cancelledPendingWindowCannotRunAQueuedNativeCommand() throws Exception {
        DispatchActivity activity = new DispatchActivity();
        RecordingDispatcher current = new RecordingDispatcher();
        activity.current = current;
        try (DispatchState state = new DispatchState(activity)) {
            List<Exception> failures = new ArrayList<>();
            SmartShuffleNative.dispatchOnMainThread(new byte[]{1}, () -> false, failures::add);
            assertEquals(0, current.calls);
            assertTrue(failures.isEmpty());
        }
    }

    @Test public void missingActivityDispatcherAndThrownNativeCallsAreReported() throws Exception {
        DispatchActivity activity = new DispatchActivity();
        RecordingDispatcher stale = new RecordingDispatcher();
        try (DispatchState state = new DispatchState(activity)) {
            SmartShuffleNative.captureDispatcher(stale);
            List<Exception> failures = new ArrayList<>();
            SmartShuffleNative.dispatchOnMainThread(new byte[]{1}, () -> true, failures::add);
            assertEquals(0, stale.calls);
            assertEquals(1, failures.size());
            assertTrue(failures.get(0) instanceof IllegalStateException);

            RecordingDispatcher current = new RecordingDispatcher();
            current.failure = new IllegalStateException("native failure");
            activity.current = current;
            SmartShuffleNative.dispatchOnMainThread(new byte[]{1}, () -> true, failures::add);
            assertEquals(1, current.calls);
            assertEquals(2, failures.size());
            assertSame(current.failure, failures.get(1));
        }
    }
}
