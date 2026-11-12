/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class QueueLogBudgetTest {
    private static int logged(QueueLogBudget budget, int calls, long start, long step) {
        int count = 0;
        for (int i = 0; i < calls; i++) {
            if (budget.allow(start + i * step)) count++;
        }
        return count;
    }

    @Test public void theFirstCallsOfTheProcessAreAlwaysLogged() {
        QueueLogBudget budget = new QueueLogBudget();
        for (int i = 0; i < QueueLogBudget.ALWAYS_LOGGED; i++) assertTrue(budget.allow(1_000));
    }

    @Test public void aBurstIsBoundedPerWindow() {
        QueueLogBudget budget = new QueueLogBudget();
        // 100 calls in one second: the first 5 plus one window of 20.
        assertEquals(QueueLogBudget.ALWAYS_LOGGED + QueueLogBudget.PER_WINDOW, logged(budget, 100, 1_000, 10));
        assertFalse(budget.allow(1_500));
    }

    @Test public void aNewWindowLogsAgain() {
        QueueLogBudget budget = new QueueLogBudget();
        logged(budget, 100, 1_000, 10);
        assertTrue(budget.allow(1_000 + QueueLogBudget.WINDOW_MILLIS + 1_000));
    }
}
