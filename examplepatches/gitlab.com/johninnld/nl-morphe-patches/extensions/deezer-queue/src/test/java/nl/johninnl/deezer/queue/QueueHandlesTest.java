package nl.johninnl.deezer.queue;

import static org.junit.Assert.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;

public class QueueHandlesTest {
    @Test public void mediaSessionAdvertisesImplementedStandardActionsWithoutInventingSkipAvailability() {
        long required = 4L | 2L | 1L | 1024L | 2048L;
        for (long nativeActions : new long[]{0, 257330, 16 | 32, 1L << 39}) {
            long exported = QueueSession.standardActions(nativeActions);
            assertEquals(required, exported & required);
            assertEquals(nativeActions & (16 | 32 | 4096), exported & (16 | 32 | 4096));
            assertEquals(nativeActions & ~required, exported & ~required);
        }
    }

    @Test public void currentSourceCanBeMappedAfterTheIndependentPlaybackCursorArrives() {
        Native n = new Native();
        QueueHandles handles = new QueueHandles(n);
        List<Long> raw = Arrays.asList(n.raw(0), n.raw(1), n.raw(2));
        n.cursorStamp = -1;
        assertNull(handles.replace(n.source, n.rows, raw, n.sourceEpoch, n.sourceStamp));
        assertFalse(handles.mapped());
        n.cursorStamp = n.sourceStamp;
        assertNotNull(handles.replace(n.source, n.rows, raw, n.sourceEpoch, n.sourceStamp));
        assertTrue(handles.mapped());
        n.allowed = false;
        assertTrue(handles.mapped());
        assertFalse(handles.ready());
    }

    static final class Row {
        final String song; final int occurrence, position;
        Row(String song, int occurrence, int position) {
            this.song = song; this.occurrence = occurrence; this.position = position;
        }
    }
    static final class Command { final int position; Command(int position) { this.position = position; } }
    static final class Native implements NativeQueue, SourceEpoch {
        final Object lock = new Object(), holder = new Object();
        Object cursor = new Object(), source;
        long epoch = 1, sourceEpoch = 1;
        long cursorStamp = QueueMutation.version(), sourceStamp = QueueMutation.version();
        int sourceReads, advanceOnSourceRead = -1;
        boolean allowed = true, failStampReads;
        List<Row> rows = Arrays.asList(new Row("A", 0, 0), new Row("X", 1, 1), new Row("A", 2, 2));
        Native() { source = rows; }
        int events, reads, currentPosition;
        List<Row> played = new ArrayList<>();
        Runnable afterEvent, beforeConsume;
        public Object queueLock() { return lock; }
        public Object queueHolder() { return holder; }
        public Object queueCursor() { return cursor; }
        public Object queueSource() { return source; }
        public long queueSourceEpoch() {
            if (++sourceReads == advanceOnSourceRead) sourceEpoch++;
            return sourceEpoch;
        }
        public long queueCursorStamp() { return cursorStamp; }
        public long queueSourceStamp() {
            if (failStampReads) throw new IllegalStateException("closing native cursor");
            return sourceStamp;
        }
        public long queueSourceVersion() { return sourceEpoch; }
        public Object queueSourceList() { return source; }
        public long queueEpoch() { return epoch; }
        public Object queueItem(int position) { reads++; return position >= 0 && position < rows.size() ? rows.get(position) : null; }
        public int queuePosition(Object item) { return ((Row) item).position; }
        final java.util.Map<Integer, Long> forcedIds = new java.util.HashMap<>();
        public long queueRawId(Object item) {
            Row row = (Row) item;
            return forcedIds.getOrDefault(row.position, (long) java.util.Objects.hash(441L, row.song, row.occurrence));
        }
        long raw(int position) { return queueRawId(rows.get(position)); }
        public int queueSize() { return rows.size(); }
        public boolean queueSame(Object left, Object right) {
            if (!(left instanceof Row) || !(right instanceof Row)) return false;
            Row a = (Row) left, b = (Row) right;
            return a.song.equals(b.song) && a.occurrence == b.occurrence && a.position == b.position;
        }
        public boolean queueAllowed() { return allowed; }
        public Object queueCurrent() { return rows.get(currentPosition); }
        public void queueDispatch(long rawId) {
            events++;
            if (afterEvent != null) { Runnable action = afterEvent; afterEvent = null; action.run(); }
            for (Row row : rows) if (queueRawId(row) == rawId) {
                QueueHandles.selectedCommand(this, new Command(row.position)); return;
            }
        }
        public void queueCommand(Object command) {
            if (beforeConsume != null) { Runnable action = beforeConsume; beforeConsume = null; action.run(); }
            Row selected = (Row) queueItem(((Command) command).position);
            if (QueueHandles.consume(holder, selected)) played.add(selected);
        }
        void replaceRows(List<Row> replacement) {
            rows = replacement; cursor = new Object(); source = rows; epoch++; sourceEpoch++;
        }
    }
    private List<Long> publish(QueueHandles session, Native nativeQueue) {
        List<Long> positions = new ArrayList<>();
        for (Row row : nativeQueue.rows) positions.add(nativeQueue.queueRawId(row));
        return session.replace(nativeQueue.source, nativeQueue.rows, positions, nativeQueue.sourceEpoch, nativeQueue.sourceStamp);
    }

    @Test public void selectsActualDuplicateOccurrenceAndMapsActiveId() {
        Native n = new Native(); QueueHandles session = new QueueHandles(n);
        List<Long> ids = publish(session, n);
        assertNotEquals(ids.get(0), ids.get(2));
        assertEquals(ids.get(0).longValue(), session.active(n.raw(0)));
        assertTrue(session.select(ids.get(2)));
        assertSame(n.rows.get(2), n.played.get(0));
        assertEquals(2, n.played.get(0).occurrence);
        assertEquals(Arrays.asList("A", "X", "A"), Arrays.asList(n.rows.get(0).song, n.rows.get(1).song, n.rows.get(2).song));
    }

    @Test public void unknownStaleAndIneligibleCommandsHaveNoNativeEffects() {
        Native n = new Native(); QueueHandles session = new QueueHandles(n);
        List<Long> ids = publish(session, n);
        assertFalse(session.select(-1)); assertFalse(session.select(0)); assertFalse(session.select(Long.MAX_VALUE));
        n.allowed = false; assertFalse(session.ready()); assertFalse(session.select(ids.get(2)));
        n.allowed = true; n.replaceRows(Arrays.asList(new Row("B", 0, 0)));
        assertFalse(session.select(ids.get(0))); assertEquals(-1, session.active(n.raw(0)));
        assertEquals(0, n.events); assertTrue(n.played.isEmpty());
    }

    @Test public void reordersAndSameSlotReplacementNeverReuseHandles() {
        Native n = new Native(); QueueHandles session = new QueueHandles(n);
        List<Long> before = publish(session, n);
        n.replaceRows(Arrays.asList(new Row("A", 2, 0), new Row("X", 1, 1), new Row("A", 0, 2)));
        List<Long> reordered = publish(session, n);
        assertFalse(session.select(before.get(2))); assertTrue(session.select(reordered.get(0)));
        assertEquals(2, n.played.get(0).occurrence);
        n.replaceRows(Arrays.asList(new Row("B", 3, 0)));
        List<Long> replaced = publish(session, n);
        assertFalse(session.select(reordered.get(0))); assertTrue(session.select(replaced.get(0)));
        assertEquals("B", n.played.get(1).song);
        for (Long id : before) assertFalse(reordered.contains(id));
    }

    @Test public void aToBToAAndDelayedProducerCannotReviveOldGeneration() {
        Native n = new Native(); QueueHandles session = new QueueHandles(n);
        List<Long> ids = publish(session, n);
        Object oldCursor = n.cursor, oldSource = n.source;
        List<Row> oldRows = n.rows; long oldEpoch = n.sourceEpoch;
        n.replaceRows(Arrays.asList(new Row("B", 7, 0)));
        n.rows = oldRows; n.cursor = oldCursor; n.source = oldSource;
        n.epoch++; n.sourceEpoch++;
        assertFalse(session.select(ids.get(0)));
        assertNull(session.replace(oldSource, oldRows, Arrays.asList(n.raw(0), n.raw(1), n.raw(2)), oldEpoch, n.sourceStamp));
        assertFalse(session.ready()); assertTrue(n.played.isEmpty());
        QueueSource delayed = new QueueSource(3, oldSource, n);
        n.sourceEpoch++; delayed.seal(); assertFalse(delayed.current());
    }

    @Test public void changedOrRepublishedQueueDuringCommandCannotRetarget() {
        Native n = new Native(); QueueHandles session = new QueueHandles(n);
        List<Long> ids = publish(session, n);
        n.beforeConsume = () -> n.replaceRows(Arrays.asList(new Row("B", 9, 0)));
        assertFalse(session.select(ids.get(0))); assertTrue(n.played.isEmpty());
        ids = publish(session, n);
        n.beforeConsume = () -> publish(session, n);
        assertFalse(session.select(ids.get(0))); assertTrue(n.played.isEmpty());
    }

    @Test public void producerEpochCannotAdvanceBetweenValidationReads() {
        Native n = new Native(); QueueHandles session = new QueueHandles(n);
        n.advanceOnSourceRead = 2;
        assertNull(publish(session, n));
        assertFalse(session.ready()); assertEquals(0, n.events);
    }

    @Test public void eventReentrancyCannotStealCommandAndOrdinaryNativeCallsStayNative() {
        Native n = new Native(); QueueHandles session = new QueueHandles(n);
        List<Long> ids = publish(session, n);
        n.afterEvent = () -> QueueHandles.command(n, new Command(1));
        assertTrue(session.select(ids.get(2)));
        assertEquals("X", n.played.get(0).song);
        assertEquals(2, n.played.get(1).occurrence);
        n.beforeConsume = () -> QueueHandles.command(n, new Command(1));
        assertTrue(session.select(ids.get(0)));
        assertEquals("X", n.played.get(2).song);
        assertEquals(0, n.played.get(3).occurrence);
    }

    @Test public void invalidationAndTeardownRetireAllHandles() {
        Native n = new Native(); QueueHandles session = new QueueHandles(n);
        List<Long> ids = publish(session, n);
        assertNull(session.replace(n.source, n.rows, Arrays.asList(n.raw(0), n.raw(0), n.raw(2)), n.sourceEpoch, n.sourceStamp));
        assertFalse(session.select(ids.get(0)));
        ids = publish(session, n); session.invalidate(); assertFalse(session.select(ids.get(0)));
        ids = publish(session, n); session.retire(); assertFalse(session.ready()); assertFalse(session.select(ids.get(0)));
        QueueHandles next = new QueueHandles(n); assertFalse(publish(next, n).contains(ids.get(0)));
    }

    @Test public void snapshotWorkIsLinearAndSelectionReadsOneDirectRow() {
        Native n = new Native(); n.rows = new ArrayList<>();
        for (int i = 0; i < 1000; i++) n.rows.add(new Row("same-song", i, i));
        n.source = n.rows;
        QueueHandles session = new QueueHandles(n);
        List<Long> ids = publish(session, n); assertEquals(1000, n.reads);
        assertTrue(session.select(ids.get(999))); assertEquals(1002, n.reads);
        assertSame(n.rows.get(999), n.played.get(0));
    }

    @Test public void sameCursorIndistinguishableReplacementInvalidatesBeforeLoaderRefresh() {
        Native n = new Native(); QueueHandles session = new QueueHandles(n);
        List<Long> ids = publish(session, n);
        Object cursor = n.cursor, source = n.source;
        QueueMutation.begin();
        try {
            assertEquals(-1, QueueMutation.version());
            assertFalse(session.select(ids.get(0)));
            assertNull(publish(session, n));
        } finally { QueueMutation.end(); }
        assertSame(cursor, n.cursor); assertSame(source, n.source);
        assertFalse(session.select(ids.get(0))); assertNull(publish(session, n));
        assertEquals(0, n.events);
        n.cursorStamp = QueueMutation.version(); n.sourceStamp = QueueMutation.version();
        List<Long> fresh = publish(session, n);
        assertFalse(fresh.contains(ids.get(0))); assertTrue(session.select(fresh.get(0)));
    }

    @Test public void overlappingAndFailedWritesCannotExposeAStableGeneration() {
        long previous = QueueMutation.version();
        QueueMutation.begin(); QueueMutation.begin();
        try {
            assertEquals(-1, QueueMutation.version());
            QueueMutation.end();
            assertEquals(-1, QueueMutation.version());
        } finally { QueueMutation.end(); }
        assertTrue(QueueMutation.version() > previous);
    }

    @Test public void onlyProvenMetadataKeysAreExemptFromOccurrenceInvalidation() {
        assertFalse(QueueMutation.identityKeys(Arrays.asList("BOOKMARK", "heard_status")));
        assertTrue(QueueMutation.identityKeys(Arrays.asList("position")));
        assertTrue(QueueMutation.identityKeys(Arrays.asList("rowid")));
        assertTrue(QueueMutation.identityKeys(Arrays.asList("_rowid_")));
        assertTrue(QueueMutation.identityKeys(Arrays.asList("unknown_future_field")));
        assertTrue(QueueMutation.identityKeys(Arrays.asList("BOOKMARK", "MEDIA_ID")));
    }

    @Test public void nativeTrackMetadataRefreshMayRewriteOnlyTheSelectedIdentityUnchanged() {
        List<String> keys = Arrays.asList("MEDIA_ID", "MEDIA_TYPE", "MEDIA_VERSION", "ORIGIN_ID", "FALLBACK_ID",
            "PUID", "TITLE", "TYPE", "ALBUM_ID", "ALBUM_NAME", "ARTIST_ID", "ARTIST_NAME", "ARTIST_PICTURE",
            "BOOKMARK", "HEARD_STATUS", "DURATION", "COVER_INFO", "COVER_TYPE", "EXTERNAL_URL", "LYRICS_ID",
            "LYRICS_STATUS", "OPTIONS", "AVAILABLE_FORMATS", "STREAMING_QUALITY", "LAST_STREAMING_QUALITY",
            "STREAMING_URL", "PAYLOAD", "EXPLICIT_LYRICS_STATUS", "EXPLICIT_COVER_STATUS", "TRACK_TOKEN",
            "TRACK_TOKEN_EXPIRATION_TIME_MILLIS", "AUTHORS", "COMPOSERS", "ARTISTS", "GAIN", "TRACK_NUMBER", "DISK_NUMBER");
        String selection = "MEDIA_ID=? AND MEDIA_TYPE=?";
        String[] args = {"native-id", "song"};
        // This full native refresh was formerly classified as a replacement merely because
        // MEDIA_ID/MEDIA_TYPE were present, stranding the unchanged cursors at epoch 22.
        assertTrue(QueueMutation.identityKeys(keys));
        assertTrue(QueueMutation.metadataRefresh(keys, selection, args, "native-id", "song"));
        assertFalse(QueueMutation.metadataRefresh(keys, selection, args, "different-id", "song"));
        assertFalse(QueueMutation.metadataRefresh(keys, selection, args, "native-id", "episode"));
        assertFalse(QueueMutation.metadataRefresh(keys, null, args, "native-id", "song"));
        assertFalse(QueueMutation.metadataRefresh(keys, "MEDIA_ID=?", args, "native-id", "song"));
        assertFalse(QueueMutation.metadataRefresh(keys, selection, null, "native-id", "song"));
        assertFalse(QueueMutation.metadataRefresh(keys, selection, new String[]{"native-id"}, "native-id", "song"));
        for (String structural : Arrays.asList("POSITION", "ORIGINAL_POSITION", "AUDIO_CONTEXT_ID", "rowid", "_rowid_", "unknown_future_field")) {
            List<String> changed = new ArrayList<>(keys); changed.add(structural);
            assertFalse(structural, QueueMutation.metadataRefresh(changed, selection, args, "native-id", "song"));
        }
        assertFalse(QueueMutation.metadataRefresh(Arrays.asList("MEDIA_ID", "TITLE"), selection, args, "native-id", "song"));
    }

    @Test public void nativeProviderFailureIsPreservedAndMutationAlwaysEnds() {
        RuntimeException original = new RuntimeException("native provider failure");
        NativeProvider provider = (NativeProvider) java.lang.reflect.Proxy.newProxyInstance(
            NativeProvider.class.getClassLoader(), new Class<?>[] { NativeProvider.class },
            (object, method, args) -> { throw original; });
        long before = QueueMutation.version();
        Throwable actual = assertThrows(Throwable.class, () -> QueueMutation.call(provider, "reorder", null, null));
        assertSame(original, actual);
        assertTrue(QueueMutation.version() > before);
    }

    @Test public void closingCursorValidationFailsClosedAndRestoresOrdinaryNativeCommands() {
        Native n = new Native(); QueueHandles session = new QueueHandles(n);
        List<Long> ids = publish(session, n);
        n.beforeConsume = () -> n.failStampReads = true;
        assertFalse(session.select(ids.get(0))); assertTrue(n.played.isEmpty());
        n.failStampReads = false;
        QueueHandles.command(n, new Command(1));
        assertEquals("X", n.played.get(0).song);
        n.failStampReads = true;
        QueueSource source = new QueueSource(n);
        source.begin(n.rows); source.seal(); assertFalse(source.current());
    }

    @Test public void failedCursorExtrasNeverBecomeInitialEpochZero() {
        android.database.Cursor cursor = (android.database.Cursor) java.lang.reflect.Proxy.newProxyInstance(
            android.database.Cursor.class.getClassLoader(), new Class<?>[] { android.database.Cursor.class },
            (object, method, args) -> { throw new IllegalStateException("closed"); });
        assertEquals(-1, QueueMutation.cursorVersion(cursor));
        assertEquals(-1, QueueMutation.cursorVersion(null));
    }

    @Test public void publishedWindowUsesNativePositionsAndNeverExpandsToPhoneQueue() {
        Native n = new Native(); n.rows = new ArrayList<>();
        for (int i = 0; i < 80; i++) n.rows.add(new Row("track-" + i, i, i));
        n.source = n.rows;
        QueueHandles session = new QueueHandles(n);
        List<Row> window = n.rows.subList(20, 51);
        List<Long> positions = new ArrayList<>(); for (Row row : window) positions.add(n.queueRawId(row));
        List<Long> ids = session.replace(n.source, window, positions, n.sourceEpoch, n.sourceStamp);
        assertEquals(31, ids.size()); assertEquals(80, n.rows.size());
        assertEquals(-1, session.active(n.raw(0)));
        n.currentPosition = 31;
        assertEquals(ids.get(11).longValue(), session.active(n.raw(31)));
        assertTrue(session.select(ids.get(0))); assertSame(n.rows.get(20), n.played.get(0));
        // Ordinary native phone selection remains independent of exported handles/window.
        QueueHandles.command(n, new Command(79));
        assertSame(n.rows.get(79), n.played.get(1));
        List<Long> nextIds = new ArrayList<>();
        for (Row row : n.rows.subList(30, 61)) nextIds.add(n.queueRawId(row));
        List<Long> crossed = session.replace(n.source, n.rows.subList(30, 61), nextIds, n.sourceEpoch, n.sourceStamp);
        assertEquals(31, crossed.size()); assertFalse(session.select(ids.get(0)));
    }
    @Test public void signedNativeHashIsNotAQueuePositionOrExportedHandle() {
        Native n = new Native(); n.replaceRows(Arrays.asList(new Row("negative-native-hash", 0, 0)));
        assertTrue(n.raw(0) < -1);
        QueueHandles session = new QueueHandles(n);
        List<Long> ids = publish(session, n);
        assertNotNull(ids); assertNotEquals(n.raw(0), ids.get(0).longValue());
        assertEquals(ids.get(0).longValue(), session.active(n.raw(0)));
        assertTrue(session.select(ids.get(0))); assertSame(n.rows.get(0), n.played.get(0));
        n.forcedIds.put(0, -1L);
        assertNull(publish(session, n));
    }

    @Test public void nativeHashCollisionOutsidePublishedWindowCannotRedirectTheSelection() {
        Native n = new Native();
        n.replaceRows(Arrays.asList(new Row("B", 0, 0), new Row("A", 31, 1)));
        assertEquals(n.raw(0), n.raw(1)); // Actual Objects.hash collision for distinct tuples.
        QueueHandles session = new QueueHandles(n);
        assertNull(session.replace(n.source, n.rows.subList(1, 2), Arrays.asList(n.raw(1)), n.sourceEpoch, n.sourceStamp));
        assertFalse(session.ready()); assertEquals(0, n.events); assertTrue(n.played.isEmpty());
    }

}
