/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.extension.music.patches.manualqueue;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.pm.PackageInfo;

import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.utils.Utils;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class ManualQueueTest {
    private static final Row PLAYING = new Row(1, "playing");
    private static final Row REMAINDER = new Row(2, "remainder");
    private static final Row FIRST_A = new Row(3, "A");
    private static final Row B = new Row(4, "B");
    private static final Row SECOND_A = new Row(5, "A");
    private static final Row C = new Row(6, "C");

    @Before
    public void setUp() {
        var context = RuntimeEnvironment.getApplication();
        PackageInfo info = new PackageInfo();
        info.packageName = context.getPackageName();
        info.versionName = "9.45.51";
        info.applicationInfo = context.getApplicationInfo();
        Shadows.shadowOf(context.getPackageManager()).installPackage(info);
        Utils.setContext(context);
        Settings.FIFO_ADD_TO_QUEUE.save(true);
        Settings.JAM_ENABLED.resetToDefault();
    }

    @Test
    public void reversedNativeCallbacksStillCommitInTapOrderIncludingDuplicates() {
        NativeQueue queue = new NativeQueue();
        Request first = queue.fromFlyout(FIRST_A);
        Request second = queue.fromFlyout(B);
        Request third = queue.fromFlyout(SECOND_A);

        third.succeed();
        second.succeed();
        queue.drain();
        assertEquals(List.of(PLAYING, REMAINDER), queue.rows);

        first.succeed();
        queue.drain();
        assertEquals(List.of(PLAYING, FIRST_A, B, SECOND_A, REMAINDER), queue.rows);
        assertEquals(0, queue.current);
        assertEquals(3, queue.nativeDispatches);
    }

    @Test
    public void failedLookupDoesNotBlockLaterCallbacks() {
        NativeQueue queue = new NativeQueue();
        Request failed = queue.fromFlyout(FIRST_A);
        Request next = queue.fromFlyout(B);
        next.succeed();
        failed.fail();
        queue.drain();

        assertEquals(List.of(PLAYING, B, REMAINDER), queue.rows);
        assertEquals(1, queue.failures);
    }

    @Test
    public void advancementRemovalAndExplicitReorderUseTheRemainingNativeOccurrences() {
        NativeQueue queue = new NativeQueue();
        queue.fromFlyout(FIRST_A).succeed();
        queue.fromFlyout(B).succeed();
        queue.fromFlyout(SECOND_A).succeed();
        queue.drain();

        queue.current = 1;
        queue.rows.remove(B);
        queue.rows.remove(SECOND_A);
        queue.rows.add(SECOND_A); // Native drag after the playlist remainder; don't undo it.
        queue.fromFlyout(C).succeed();
        queue.drain();

        assertEquals(List.of(PLAYING, FIRST_A, REMAINDER, SECOND_A, C), queue.rows);
        assertEquals(1, queue.current);
    }

    @Test
    public void consumedDuplicateCannotAnchorALaterAdd() {
        NativeQueue queue = new NativeQueue();
        queue.fromFlyout(FIRST_A).succeed();
        queue.drain();
        queue.current = 1;
        queue.fromFlyout(B).succeed();
        queue.drain();

        // Returning to the first song doesn't revive the consumed A as a pending addition.
        queue.current = 0;
        queue.rows.remove(B);
        queue.fromFlyout(SECOND_A).succeed();
        queue.drain();
        assertEquals(List.of(PLAYING, SECOND_A, FIRST_A, REMAINDER), queue.rows);
    }

    @Test
    public void nativePlayNextAndProgrammaticTailEditsAreUntouched() {
        NativeQueue queue = new NativeQueue();
        queue.fromFlyout(FIRST_A).succeed();
        queue.drain();

        queue.enqueue(B, null, 1).succeed();
        queue.enqueue(SECOND_A, null, -1).succeed();
        queue.drain();
        queue.fromFlyout(C).succeed();
        queue.drain();

        assertEquals(List.of(PLAYING, B, FIRST_A, C, REMAINDER, SECOND_A), queue.rows);
    }

    @Test
    public void replacementDropsTheOldLookupWithoutBlockingTheNewQueue() {
        NativeQueue queue = new NativeQueue();
        Request old = queue.fromFlyout(FIRST_A);
        ManualQueue.replaced(queue);
        queue.rows.clear();
        queue.rows.addAll(List.of(PLAYING, REMAINDER));
        queue.fromFlyout(B).succeed();
        queue.drain();

        old.succeed();
        queue.drain();
        assertEquals(List.of(PLAYING, B, REMAINDER), queue.rows);
    }

    @Test
    public void originSurvivesANativeCopyButDoesNotModifyTheInput() {
        Map<String, Object> stock = Map.of("native metadata", new Object());
        Map<String, Object> tagged = ManualQueue.fromFlyout(stock);
        assertFalse(ManualQueue.hasOrigin(stock));
        assertFalse(ManualQueue.hasOrigin(null));
        assertSame(stock.get("native metadata"), tagged.get("native metadata"));
        assertTrue(ManualQueue.hasOrigin(new HashMap<>(tagged)));
        Settings.FIFO_ADD_TO_QUEUE.save(false);
        assertFalse(ManualQueue.hasOrigin(tagged));
    }

    @Test
    public void remoteShuffledEmptyUnknownAndDisabledQueuesStayNative() {
        NativeQueue queue = new NativeQueue();
        assertNotNull(ManualQueue.prepare(queue));

        queue.local = false;
        assertNull(ManualQueue.prepare(queue));
        queue.local = true;
        queue.unshuffled = false;
        assertNull(ManualQueue.prepare(queue));
        queue.unshuffled = true;
        queue.current = -1;
        assertNull(ManualQueue.prepare(queue));
        queue.current = queue.rows.size();
        assertNull(ManualQueue.prepare(queue));
        queue.current = 0;
        queue.rows.clear();
        assertNull(ManualQueue.prepare(queue));

        queue.rows.addAll(List.of(PLAYING, REMAINDER));
        Settings.FIFO_ADD_TO_QUEUE.save(false);
        assertNull(ManualQueue.prepare(queue));
        queue.fromFlyout(FIRST_A).succeed();
        queue.drain();
        assertEquals(List.of(PLAYING, REMAINDER, FIRST_A), queue.rows);
    }

    private record Row(long occurrence, String video) {}

    private static final class NativeQueue implements ManualQueue.Access, ManualQueue.Queue, ManualQueue.Lane {
        final ArrayList<Row> rows = new ArrayList<>(List.of(PLAYING, REMAINDER));
        final ArrayDeque<Runnable> nativeExecutor = new ArrayDeque<>();
        int current;
        int failures;
        int nativeDispatches;
        boolean local = true;
        boolean unshuffled = true;
        ManualQueue.State state;

        Request fromFlyout(Row row) {
            return enqueue(row, ManualQueue.prepare(this), -1);
        }

        Request enqueue(Row row, ManualQueue.Dispatch dispatch, int stockIndex) {
            Request request = new Request(this, row, stockIndex);
            ManualQueue.dispatch(this, request, dispatch);
            return request;
        }

        void drain() {
            while (!nativeExecutor.isEmpty()) nativeExecutor.removeFirst().run();
        }

        @Override public void rvxManualDispatch(Object command) {
            nativeDispatches++;
            Request request = (Request) command;
            ManualQueue.bindCallback(request);
            request.executor = ManualQueue.completionExecutor(nativeExecutor::addLast);
        }

        @Override public ManualQueue.Queue rvxManualQueue() { return this; }
        @Override public ManualQueue.Lane rvxManualLane() { return this; }
        @Override public int rvxManualCurrent() { return current; }
        @Override public boolean rvxManualLocal() { return local; }
        @Override public boolean rvxManualUnshuffled() { return unshuffled; }
        @Override public ManualQueue.State rvxManualState() { return state; }
        @Override public void rvxManualState(ManualQueue.State next) { state = next; }
        @Override public int size() { return rows.size(); }
        @Override public Object get(int index) { return rows.get(index); }
        @Override public long applyAsLong(Object row) { return ((Row) row).occurrence(); }
    }

    private static final class Request {
        final NativeQueue queue;
        final Row row;
        final int stockIndex;
        Executor executor;

        Request(NativeQueue queue, Row row, int stockIndex) {
            this.queue = queue;
            this.row = row;
            this.stockIndex = stockIndex;
        }

        void succeed() {
            executor.execute(() -> {
                List<Row> response = List.of(row);
                int index = ManualQueue.insertionIndex(this, queue, stockIndex < 0 ? queue.rows.size() : stockIndex,
                        response);
                boolean inserted = queue.rows.addAll(index, response);
                ManualQueue.committed(this, response, inserted);
            });
        }

        void fail() {
            executor.execute(() -> queue.failures++);
        }
    }
}
