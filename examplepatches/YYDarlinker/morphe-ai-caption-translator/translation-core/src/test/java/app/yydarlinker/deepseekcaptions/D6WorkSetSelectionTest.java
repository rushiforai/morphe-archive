package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;
import org.junit.Test;

/** Behaviour at idle, admission, abandonment and independent work sets. */
public class D6WorkSetSelectionTest {
    private static List<RebuildPlanner.Block> blocks() {
        RebuildSource source = RebuildContractTest.source("alpha beta gamma delta", 1000);
        List<RebuildPlanner.Block> result = new ArrayList<>();
        for (int i = 0; i < source.words.size(); i++)
            result.add(new RebuildPlanner.Block(i, i, i, source));
        return result;
    }

    private static RebuildWorkSet work(int count) {
        RebuildWorkSet result = new RebuildWorkSet();
        result.initialize(count);
        return result;
    }

    @Test public void idleSelectionIsUnaffectedByAnotherSessionStartingWork() {
        List<RebuildPlanner.Block> blocks = blocks();
        RebuildWorkSet idle = work(blocks.size());
        RebuildWorkSet.Selection before = idle.select(blocks, 0, 0, 1000, true, 0, 0);
        assertTrue(before.starts.isEmpty());
        assertTrue(before.abandoned.isEmpty());
        assertNull(before.pending);
        assertNull(idle.slots[0].attempt);

        RebuildWorkSet other = work(blocks.size());
        other.slots[0].cacheChecked = true;
        RebuildWorkSet.Selection started = other.select(blocks, 0, 0, 1000, true, 0, 0);
        assertEquals(1, started.starts.size());
        assertEquals(0, started.starts.get(0).index);
        assertTrue(started.starts.get(0).dispatched);
        assertTrue(before.starts.isEmpty());
        assertTrue(before.abandoned.isEmpty());
        assertNull(before.pending);
        assertNull(idle.slots[0].attempt);
    }

    @Test public void waitingFocusRetiresAndCanBeReadmittedAfterItsRetryGate() {
        List<RebuildPlanner.Block> blocks = blocks();
        RebuildWorkSet work = work(blocks.size());
        work.slots[0].cacheChecked = true;
        RebuildWorkSet.Selection selected = work.select(blocks, 0, 0, 1000, false, 2, 0);
        assertTrue(selected.starts.isEmpty());
        assertNotNull(selected.pending);
        assertFalse(selected.pending.dispatched);
        assertEquals(0, work.slots[0].attempts);
        work.retirePending(selected.pending, 1000);
        assertNull(work.slots[0].attempt);
        assertNull(work.select(blocks, 0, 0, 1499, false, 0, 0).pending);
        RebuildWorkSet.Selection next = work.select(blocks, 0, 0, 1500, false, 0, 0);
        assertEquals(1, next.starts.size());
        assertTrue(next.starts.get(0).dispatched);
        assertEquals(1, work.slots[0].attempts);
    }

    @Test public void exhaustionIsReportedOnceAndAheadOrderHonoursTwoSlotLimit() {
        List<RebuildPlanner.Block> blocks = blocks();
        RebuildWorkSet exhausted = work(blocks.size());
        exhausted.slots[0].cacheChecked = true;
        exhausted.slots[0].attempts = 2;
        exhausted.slots[0].slowRetries = RebuildController.MAX_SLOW_RETRIES;
        RebuildWorkSet.Selection abandoned = exhausted.select(blocks, 0, 0, 1000, false, 0, 0);
        assertEquals(1, abandoned.abandoned.size());
        assertEquals(Integer.valueOf(0), abandoned.abandoned.get(0));
        assertEquals(RebuildController.FAILED, exhausted.slots[0].state);
        assertTrue(exhausted.select(blocks, 0, 0, 1000, false, 0, 0).abandoned.isEmpty());

        RebuildWorkSet ahead = work(blocks.size());
        ahead.slots[0].state = RebuildController.FAILED;
        ahead.everReady = true;
        for (RebuildWorkSet.Slot slot : ahead.slots) slot.cacheChecked = true;
        RebuildWorkSet.Selection selected = ahead.select(blocks, 0, 0, 1000, true, 0, 0);
        assertEquals(2, selected.starts.size());
        assertEquals(1, selected.starts.get(0).index);
        assertEquals(2, selected.starts.get(1).index);
        assertNull(ahead.slots[3].attempt);
    }
}
