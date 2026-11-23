package nl.johninnl.deezer.auth;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/** Exercises the same transaction guard used by GoogleConsent.prepare, without Android fixtures. */
public final class ConsentPreparationTest {
    private static final class Failure implements ConsentPreparation.Failure {
        final ConsentGeneration captured;
        final ConsentGeneration current;
        final List<String> order;
        int resets;
        int retirements;
        boolean cleanupThrows;
        boolean resetThrows;

        Failure(ConsentGeneration captured, ConsentGeneration current, List<String> order) {
            this.captured = captured;
            this.current = current;
            this.order = order;
        }

        @Override public void cancel() {
            order.add("cancel");
            if (captured.isCurrentFor(current, true)) {
                resets++;
                assertTrue("Reset must precede retirement", captured.isActive());
            }
            if (resetThrows) throw new IllegalStateException("reset failed");
        }

        @Override public void cleanup() {
            order.add("cleanup");
            if (cleanupThrows) throw new IllegalStateException("cleanup transaction failed");
        }

        @Override public void retire() {
            order.add("retire");
            retirements++;
            captured.retire();
        }
    }

    @Test public void removeCommitFailureResetsBeforeCleanupAndRetiresExactlyOnce() {
        ConsentGeneration generation = new ConsentGeneration();
        List<String> order = new ArrayList<>();
        Failure failure = new Failure(generation, generation, order);
        Object result = ConsentPreparation.run(() -> {
            order.add("remove.commitNow");
            throw new IllegalStateException("remove transaction failed");
        }, failure);
        assertNull(result);
        assertEquals(Arrays.asList("remove.commitNow", "cancel", "cleanup", "retire"), order);
        assertEquals(1, failure.resets);
        assertEquals(1, failure.retirements);
        assertFalse(generation.isActive());
    }

    @Test public void addCommitFailureUsesSameGuardAndResetsBeforePartialRequestCleanup() {
        ConsentGeneration generation = new ConsentGeneration();
        List<String> order = new ArrayList<>();
        Failure failure = new Failure(generation, generation, order);
        Object result = ConsentPreparation.run(() -> {
            order.add("remove.commitNow");
            order.add("install ownership before synchronous onResume");
            order.add("add.commitNow");
            throw new IllegalStateException("add transaction failed");
        }, failure);
        assertNull(result);
        assertEquals(Arrays.asList("remove.commitNow", "install ownership before synchronous onResume",
                "add.commitNow", "cancel", "cleanup", "retire"), order);
        assertEquals(1, failure.resets);
        assertEquals(1, failure.retirements);
    }

    @Test public void staleTransactionFailureCannotResetNewGenerationOrEscapeThroughCleanup() {
        ConsentGeneration old = new ConsentGeneration();
        old.retire();
        ConsentGeneration current = new ConsentGeneration();
        Failure failure = new Failure(old, current, new ArrayList<>());
        failure.cleanupThrows = true;
        assertNull(ConsentPreparation.run(() -> {
            throw new IllegalStateException("stale transaction failed");
        }, failure));
        assertEquals(0, failure.resets);
        assertEquals(1, failure.retirements);
        assertTrue(current.isActive());
    }

    @Test public void failedResetOrCleanupCannotSkipFinallyRetirementOrReplayReset() {
        ConsentGeneration generation = new ConsentGeneration();
        List<String> order = new ArrayList<>();
        Failure failure = new Failure(generation, generation, order);
        failure.resetThrows = true;
        failure.cleanupThrows = true;
        assertNull(ConsentPreparation.run(() -> null, failure));
        assertEquals(Arrays.asList("cancel", "cleanup", "retire"), order);
        assertEquals(1, failure.resets);
        assertEquals(1, failure.retirements);
        assertFalse(generation.isActive());
    }

    @Test public void successfulPreparationKeepsItsGenerationAndDoesNotInvokeFailureCallbacks() {
        ConsentGeneration generation = new ConsentGeneration();
        Failure failure = new Failure(generation, generation, new ArrayList<>());
        Object prepared = new Object();
        assertSame(prepared, ConsentPreparation.run(() -> prepared, failure));
        assertTrue(failure.order.isEmpty());
        assertTrue(generation.isActive());
    }
}
