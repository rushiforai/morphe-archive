/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-26.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.nio.ByteBuffer;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

public class OfflineQueueActionsTest {
    private static final class Row implements OfflineQueueActions.Row {
        final String videoId;
        final ByteBuffer renderer;
        private Object insertion;

        Row(String videoId) {
            this.videoId = videoId;
            renderer = rendererBytes(videoId);
        }

        @Override public Object rvxOfflineInsertion() { return insertion; }
        @Override public void rvxOfflineInsertion(Object insertion) { this.insertion = insertion; }
        @Override public boolean equals(Object other) {
            return other instanceof Row row && renderer.equals(row.renderer);
        }
        @Override public int hashCode() { return renderer.hashCode(); }

        private static ByteBuffer rendererBytes(String videoId) {
            byte[] watch = new ProtoWriter().message(CommandRewrite.WATCH_ENDPOINT_FIELD,
                    new ProtoWriter().string(CommandRewrite.VIDEO_ID_FIELD, videoId).toByteArray()).toByteArray();
            return ByteBuffer.wrap(OfflineWatchNext.queueRow(
                    new OfflineWatchNext.Item(videoId, videoId, "", "", 0, null), watch, null));
        }
    }

    private record Queue(List<Row> rows, int cursor) implements OfflineQueueActions.Queue {
        @Override public int rvxOfflineCursor() { return cursor; }
        @Override public int rvxOfflineSize() { return rows.size(); }
        @Override public Object rvxOfflineItem(int index) { return rows.get(index); }
        @Override public String rvxOfflineVideoId(Object occurrence) { return ((Row) occurrence).videoId; }
    }

    @Test public void nativeQueueClickSelectsBoundDuplicateButNotAnExternalRow() {
        Row first = new Row("sameVideo");
        Row second = new Row("sameVideo");
        Row externalPlaylistRow = new Row("sameVideo");
        Queue queue = new Queue(List.of(first, second), 0);

        assertEquals(1, OfflineQueueActions.nativeOccurrenceIndex(queue, second, -1));
        assertEquals(1, OfflineQueueActions.nativeOccurrenceIndex(queue, second, 1));
        assertEquals(-1, OfflineQueueActions.nativeOccurrenceIndex(queue, second, 0));
        assertEquals(-1, OfflineQueueActions.nativeOccurrenceIndex(queue, externalPlaylistRow, -1));
        assertFalse(OfflineQueueActions.onQueueRowClick(externalPlaylistRow));
    }

    @Test public void nativeCommitUsesLiveSelectedOccurrenceDespiteIdenticalRendererBytes() {
        Row first = new Row("duplicate01");
        Row second = new Row("duplicate01");
        Row external = new Row("duplicate01");
        List<Row> lane = List.of(first, second);
        Queue edited = new Queue(lane, 0);
        int epoch = 7;
        var selection = new OfflineQueueActions.Selection(edited, second, 1, epoch);

        assertNotSame(first, second);
        assertEquals(first.renderer, second.renderer);
        assertEquals(0, lane.indexOf(second));
        assertEquals(1, OfflineQueueActions.nativeCommitIndex(edited, lane, second, selection, epoch));
        assertEquals(-1, OfflineQueueActions.nativeCommitIndex(edited, List.of(first), second, selection, epoch));
        assertEquals(0, OfflineQueueActions.nativeCommitIndex(edited, lane, external, selection, epoch));
        assertEquals(0, OfflineQueueActions.nativeCommitIndex(edited, lane, second, selection, epoch + 1));
        var staleIndex = new OfflineQueueActions.Selection(edited, second, 0, epoch);
        assertEquals(0, OfflineQueueActions.nativeCommitIndex(edited, lane, second, staleIndex, epoch));
        assertEquals(0, OfflineQueueActions.nativeCommitIndex(new Queue(lane, 0), lane, second, selection, epoch));
        assertEquals(0, OfflineQueueActions.nativeCommitIndex(edited, lane, second));
    }

    @Test public void adjacentDuplicatesPublishBothNextAndPreviousWithoutChangingStockEquality() {
        Row first = new Row("duplicate01");
        Row second = new Row("duplicate01");
        Row following = new Row("following01");
        List<Row> lane = List.of(first, second, following);
        Queue edited = new Queue(lane, 0);
        Queue unedited = new Queue(lane, 0);
        Navigator owner = new Navigator(edited);
        int epoch = 7;
        var insertion = new OfflineQueueActions.Insertion(
                new WeakReference<>(edited), new WeakReference<>(owner), epoch, null);
        first.rvxOfflineInsertion(insertion);
        second.rvxOfflineInsertion(insertion);

        int cursor = 0;
        for (int target : new int[]{1, 2, 1, 0}) {
            Row previous = lane.get(cursor);
            Row current = lane.get(target);
            var selection = new OfflineQueueActions.Selection(edited, current, target, epoch);
            cursor = OfflineQueueActions.nativeCommitIndex(edited, lane, current, selection, epoch);
            assertEquals(target, cursor);
            assertFalse(OfflineQueueActions.samePublishedOccurrence(previous, current,
                    OfflineQueueActions.distinctEditedOccurrences(edited, previous, current, epoch)));
        }
        assertTrue(OfflineQueueActions.samePublishedOccurrence(first, second, false)); // connected
        assertFalse(OfflineQueueActions.distinctEditedOccurrences(unedited, first, second, epoch));
        assertFalse(OfflineQueueActions.distinctEditedOccurrences(edited, first, second, epoch + 1));
        assertFalse(OfflineQueueActions.distinctEditedOccurrences(edited, second, second, epoch));
        owner.queue = unedited;
        assertFalse(OfflineQueueActions.distinctEditedOccurrences(edited, first, second, epoch));
    }

    @Test public void freshRowPlayAndShuffleSupersedeEditedSelectionButExactNextRetainsIt() throws Exception {
        Row first = new Row("duplicate01");
        Row second = new Row("duplicate01");
        Queue edited = new Queue(List.of(first, second), 1);
        Navigator owner = new Navigator(edited);
        Request next = new Request(second.videoId);
        Request otherVideo = new Request("otherVideo1");
        Request otherRequest = new Request(second.videoId);
        Field currentSelection = field(PlayerFallback.class, "selection");
        Field generation = field(PlayerFallback.class, "navigationGeneration");
        int epoch = ((AtomicInteger) field(OfflineQueueActions.class, "connectivity").get(null)).get();
        var occurrence = new OfflineQueueActions.Selection(edited, second, 1, epoch);
        PlayerFallback.captureNavigator(owner);
        try {
            for (int start : new int[]{2, 0, -1}) {
                var active = new PlayerFallback.Selection(owner, 1, second.videoId, true, 1,
                        null, generation.getLong(null), occurrence);
                currentSelection.set(null, active);
                owner.request = next;
                assertSame(active, PlayerFallback.editedQueueSelection(next, second.videoId));
                assertTrue(OfflineQueueActions.sameRows(edited, edited.rows(), occurrence.index()));
                assertNull(PlayerFallback.editedQueueSelection(otherRequest, second.videoId));
                assertNull(PlayerFallback.editedQueueSelection(next, otherVideo.videoId()));
                owner.request = otherVideo;
                assertNull(PlayerFallback.editedQueueSelection(otherVideo, otherVideo.videoId()));
                owner.queue = null;
                owner.request = next;
                assertNull(PlayerFallback.editedQueueSelection(next, second.videoId));
                owner.queue = edited;

                byte[] command = OfflineWatchCommand.build(second.videoId, "PL-other", Math.max(0, start),
                        CommandRewrite.TYPE_ATV, start < 0);
                if (start < 0) {
                    var shuffled = new Root(command);
                    OfflineReplay.dispatchShuffleCommand((actual, context) -> {
                        assertSame(shuffled, actual);
                        assertNull(PlayerFallback.editedQueueSelection(next, second.videoId));
                    }, shuffled, Map.of());
                } else {
                    assertTrue(OfflineReplay.noteNativePlaylistStart(command));
                }
                owner.request = otherRequest;
                assertNull(currentSelection.get(null));
                assertNull(PlayerFallback.editedQueueSelection(otherRequest, second.videoId));
                assertFalse(PlayerFallback.ownsQueueContinuation(active, next));
            }
        } finally {
            PlayerFallback.playlistStarted();
        }
    }

    private static Field field(Class<?> type, String name) throws ReflectiveOperationException {
        Field field = type.getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }

    private record Root(byte[] toByteArray) implements NativeDownloads.Command {
        @Override public Object rvxWithBytes(byte[] bytes) { return new Root(bytes); }
    }

    private record Request(String videoId) implements PlayerFallback.Request {
        @Override public String rvxVideoId() { return videoId; }
        @Override public Object rvxPlayerResponse(byte[] bytes) { throw new AssertionError(); }
        @Override public void rvxCancelPlayer(Object callback) { throw new AssertionError(); }
    }

    private static final class Navigator implements PlayerFallback.Navigator, OfflineQueueActions.Owner {
        Queue queue;
        Request request;

        Navigator(Queue queue) { this.queue = queue; }
        @Override public Object rvxOfflineQueue() { return queue; }
        @Override public List<?> rvxItems() { return queue.rows(); }
        @Override public String rvxVideoId(Object item) { return queue.rvxOfflineVideoId(item); }
        @Override public long rvxItemId(Object item) { throw new AssertionError(); }
        @Override public int rvxCurrent() { return queue.cursor(); }
        @Override public Object rvxPlayback() { throw new AssertionError(); }
        @Override public void rvxCancelAndStop() { throw new AssertionError(); }
        @Override public boolean rvxOwnsRequest(Object request) { return this.request == request; }
        @Override public void rvxCancelLoad() { throw new AssertionError(); }
        @Override public Object rvxJump(Object item, boolean restart) { throw new AssertionError(); }
        @Override public void rvxDispatch(Object command) { throw new AssertionError(); }
    }

    @Test public void onlyIdenticalOrderAndCursorRetainDuplicateOccurrences() {
        Row nowPlaying = new Row("keepPlaying");
        Row firstAdd = new Row("repeatedAdd");
        Row secondAdd = new Row("repeatedAdd");
        List<Row> ordered = List.of(nowPlaying, firstAdd, secondAdd);

        assertTrue(OfflineQueueActions.sameRows(new Queue(ordered, 2), ordered, 2));
        assertFalse(OfflineQueueActions.sameRows(new Queue(ordered, 1), ordered, 2));
        assertFalse(OfflineQueueActions.sameRows(new Queue(List.of(nowPlaying, secondAdd, firstAdd), 2), ordered, 2));
        assertFalse(OfflineQueueActions.sameRows(new Queue(List.of(nowPlaying, firstAdd), 1), ordered, 1));
        assertFalse(OfflineQueueActions.sameRows(
                new Queue(List.of(nowPlaying, firstAdd, new Row("repeatedAdd")), 2), ordered, 2));
    }
}
