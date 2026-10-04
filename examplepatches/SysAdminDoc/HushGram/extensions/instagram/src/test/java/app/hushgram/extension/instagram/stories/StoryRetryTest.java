/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.stories;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.function.BooleanSupplier;

import app.hushgram.extension.shared.SettingsContextRule;

/** Active anonymity never forwards a saved original when selection or allocation fails. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
public class StoryRetryTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    private static final String ACCOUNT = "900";
    private static final String MARKED = "111_900_900";
    private static final String UNMARKED = "222_900_900";
    private static final BooleanSupplier ON = () -> true;
    private static final BooleanSupplier OFF = () -> false;

    private enum Fault { NONE, NULL, THROW, OOM, NONEMPTY, MAP_NULL, MAP_THROW, ACCOUNT_THROW }

    private static final class Batch {
        final Map<Object, Object> stories = new LinkedHashMap<>();

        Batch(String... keys) {
            for (String key : keys) stories.put(key, "entry " + key);
        }
    }

    private static final class Batches implements StorySeen.Batches {
        final Fault fault;
        int allocations;

        Batches(Fault fault) { this.fault = fault; }

        @Override public Object empty() {
            allocations++;
            if (fault == Fault.NULL) return null;
            if (fault == Fault.THROW) throw new IllegalStateException("factory failed");
            if (fault == Fault.OOM) throw new OutOfMemoryError("factory failed");
            return fault == Fault.NONEMPTY ? new Batch(UNMARKED) : new Batch();
        }

        @Override public Map<Object, Object> stories(Object batch) {
            if (fault == Fault.MAP_NULL) return null;
            if (fault == Fault.MAP_THROW) throw new OutOfMemoryError("map failed");
            return ((Batch) batch).stories;
        }

        @Override public String account(Object store) {
            if (fault == Fault.ACCOUNT_THROW) throw new OutOfMemoryError("account failed");
            return (String) store;
        }
    }

    private static final StorySeen.Diagnostics QUIET = new StorySeen.Diagnostics() {
        @Override public void saw() { }
        @Override public void heldBack() { }
        @Override public void sentMarked() { }
        @Override public void threw(String hook, Throwable failure) { }
    };

    private static final StorySeen.Diagnostics BROKEN = new StorySeen.Diagnostics() {
        @Override public void saw() { throw new OutOfMemoryError("counter failed"); }
        @Override public void heldBack() { throw new OutOfMemoryError("counter failed"); }
        @Override public void sentMarked() { throw new OutOfMemoryError("counter failed"); }
        @Override public void threw(String hook, Throwable failure) { throw new OutOfMemoryError("report failed"); }
    };

    private void selectionFails(Fault fault) {
        StoryMarks marks = new StoryMarks(() -> 1L);
        marks.toggle(ACCOUNT, "111");
        Batch original = new Batch(MARKED, UNMARKED);
        Batches batches = new Batches(fault);
        assertNull(StorySeen.toRetry(ACCOUNT, original, batches, ON, ON, marks, BROKEN));
        assertTrue("the original is not changed into an empty batch", original.stories.containsKey(UNMARKED));
        assertEquals("a failed selection does not consume the mark", StoryMarks.State.MARKED, marks.state(ACCOUNT, "111"));
    }

    @Test public void nullFactoryCancels() { selectionFails(Fault.NULL); }
    @Test public void throwingFactoryCancels() { selectionFails(Fault.THROW); }
    @Test public void allocationFailureCancels() { selectionFails(Fault.OOM); }
    @Test public void nonemptyFactoryCancels() { selectionFails(Fault.NONEMPTY); }
    @Test public void unreadableMapCancels() { selectionFails(Fault.MAP_NULL); }
    @Test public void failingMapCancels() { selectionFails(Fault.MAP_THROW); }
    @Test public void failingAccountCancels() { selectionFails(Fault.ACCOUNT_THROW); }

    @Test public void noMarksNeedsNoEmptyFactory() {
        for (Fault fault : Fault.values()) {
            Batches batches = new Batches(fault);
            assertNull(StorySeen.toRetry(ACCOUNT, new Batch(UNMARKED), batches, ON, OFF, new StoryMarks(() -> 1L), BROKEN));
            assertEquals("a held retry is canceled without allocation", 0, batches.allocations);
        }
    }

    @Test public void offPreservesTheOriginalEvenWithBrokenAdapters() {
        for (Fault fault : Fault.values()) {
            Batches batches = new Batches(fault);
            Batch original = new Batch(MARKED, UNMARKED);
            assertSame(original, StorySeen.toRetry(ACCOUNT, original, batches, OFF, ON, new StoryMarks(() -> 1L), BROKEN));
            assertEquals(0, batches.allocations);
        }
    }

    @Test public void failingMarkingSwitchCancels() {
        BooleanSupplier broken = () -> { throw new OutOfMemoryError("switch failed"); };
        assertNull(StorySeen.toRetry(ACCOUNT, new Batch(UNMARKED), new Batches(Fault.NONE), ON, broken,
                new StoryMarks(() -> 1L), BROKEN));
    }

    private void failedRetryGateKeepsEarlierHeldBatch(BooleanSupplier failing) {
        Batch original = new Batch(MARKED, UNMARKED);
        Batches batches = new Batches(Fault.NONE);
        StoryMarks marks = new StoryMarks(() -> 1L);
        assertNull(StorySeen.toRetry(ACCOUNT, original, batches, ON, OFF, marks, BROKEN));
        for (int retry = 0; retry < 3; retry++) {
            assertNull(StorySeen.toRetry(ACCOUNT, original, batches, failing, OFF, marks, BROKEN));
        }
        assertEquals(2, original.stories.size());
        assertEquals(0, batches.allocations);
        assertSame(original, StorySeen.toRetry(ACCOUNT, original, batches, OFF, OFF, marks, BROKEN));
        assertSame("fresh sends keep their existing gate failure behavior", original,
                StorySeen.toSend(ACCOUNT, original, batches, failing, OFF, marks, BROKEN));
    }

    @Test public void anonymityGateExceptionCannotReviveAnEarlierHeldRetry() {
        failedRetryGateKeepsEarlierHeldBatch(() -> { throw new IllegalStateException("gate failed"); });
    }

    @Test public void anonymityGateAllocationFailureCannotReviveAnEarlierHeldRetry() {
        failedRetryGateKeepsEarlierHeldBatch(() -> { throw new OutOfMemoryError("gate failed"); });
    }

    @Test public void diagnosticsCannotCancelAValidMarkedSubset() {
        StoryMarks marks = new StoryMarks(() -> 1L);
        marks.toggle(ACCOUNT, "111");
        Batch original = new Batch(MARKED, UNMARKED);
        Batch answer = (Batch) StorySeen.toRetry(ACCOUNT, original, new Batches(Fault.NONE), ON, ON, marks, BROKEN);
        assertEquals(1, answer.stories.size());
        assertTrue(answer.stories.containsKey(MARKED));
        assertEquals(2, original.stories.size());
    }

    @Test public void aSecondAccountCannotUseTheFirstAccountsMark() {
        StoryMarks marks = new StoryMarks(() -> 1L);
        marks.toggle(ACCOUNT, "111");
        assertNull(StorySeen.toRetry("901", new Batch(MARKED, UNMARKED), new Batches(Fault.NONE), ON, ON, marks, QUIET));
        assertEquals(StoryMarks.State.MARKED, marks.state(ACCOUNT, "111"));
    }

    @Test public void repeatedFactoryFailuresKeepUnmarkedReceiptsPrivateAndTheMarkEligible() {
        StoryMarks marks = new StoryMarks(() -> 1L);
        marks.toggle(ACCOUNT, "111");
        Batch original = new Batch(MARKED, UNMARKED);
        Batches broken = new Batches(Fault.OOM);
        for (int attempt = 0; attempt < 64; attempt++) {
            assertNull(StorySeen.toRetry(ACCOUNT, original, broken, ON, ON, marks, BROKEN));
            assertEquals(2, original.stories.size());
        }
        assertEquals(StoryMarks.State.MARKED, marks.state(ACCOUNT, "111"));
        Batch recovered = (Batch) StorySeen.toRetry(ACCOUNT, original, new Batches(Fault.NONE), ON, ON, marks, QUIET);
        assertEquals(1, recovered.stories.size());
        assertTrue(recovered.stories.containsKey(MARKED));
    }

    @Test public void aRetryDelayedPastMarkExpiryCancelsInsteadOfSendingItsOriginal() {
        long[] now = {1L};
        StoryMarks marks = new StoryMarks(() -> now[0]);
        marks.toggle(ACCOUNT, "111");
        now[0] += StoryMarks.LIFETIME_MS + 1;
        Batches batches = new Batches(Fault.OOM);
        assertNull(StorySeen.toRetry(ACCOUNT, new Batch(MARKED, UNMARKED), batches, ON, ON, marks, BROKEN));
        assertEquals(0, batches.allocations);
        assertEquals(StoryMarks.State.UNMARKED, marks.state(ACCOUNT, "111"));
    }

    @Test public void accountTeardownCannotReviveHeldReceiptsOrMarks() {
        StoryMarks marks = new StoryMarks(() -> 1L);
        marks.toggle(ACCOUNT, "111");
        Batch original = new Batch(MARKED, UNMARKED);
        assertNull(StorySeen.toRetry(ACCOUNT, original, new Batches(Fault.NULL), ON, ON, marks, QUIET));
        marks.clear();
        Batches batches = new Batches(Fault.NONE);
        assertNull(StorySeen.toRetry(ACCOUNT, original, batches, ON, ON, marks, BROKEN));
        assertNull(StorySeen.toRetry("901", original, batches, ON, ON, marks, BROKEN));
        assertEquals(0, batches.allocations);
        assertEquals(StoryMarks.State.UNMARKED, marks.state(ACCOUNT, "111"));
    }
}
