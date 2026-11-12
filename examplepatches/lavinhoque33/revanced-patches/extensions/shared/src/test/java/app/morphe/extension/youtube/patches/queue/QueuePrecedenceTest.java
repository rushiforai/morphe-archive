/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU Affero General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.youtube.patches.queue;

import static org.junit.Assert.assertEquals;

import java.util.Arrays;
import java.util.Collection;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

@RunWith(Parameterized.class)
public class QueuePrecedenceTest {
    @Parameterized.Parameters(name = "included={0}, unlock={1}, local={2}, override={3}")
    public static Collection<Object[]> states() {
        // Inputs: Unlock patch included, Unlock switch, local queue active, override switch.
        // Outputs: native Unlock active, feed row overridden.
        return Arrays.asList(new Object[][] {
                {false, false, false, false, false, false},
                {false, false, false, true,  false, true},
                {false, false, true,  false, false, true},
                {false, false, true,  true,  false, true},
                {false, true,  false, false, false, false},
                {false, true,  false, true,  false, true},
                {false, true,  true,  false, false, true},
                {false, true,  true,  true,  false, true},
                {true,  false, false, false, false, false},
                {true,  false, false, true,  false, true},
                {true,  false, true,  false, false, true},
                {true,  false, true,  true,  false, true},
                {true,  true,  false, false, true,  false},
                {true,  true,  false, true,  true,  false},
                {true,  true,  true,  false, false, true},
                {true,  true,  true,  true,  false, true}
        });
    }

    private final boolean patchIncluded;
    private final boolean unlockQueue;
    private final boolean localQueue;
    private final boolean override;
    private final boolean expectedUnlock;
    private final boolean expectedOverride;

    public QueuePrecedenceTest(boolean patchIncluded, boolean unlockQueue, boolean localQueue, boolean override,
                               boolean expectedUnlock, boolean expectedOverride) {
        this.patchIncluded = patchIncluded;
        this.unlockQueue = unlockQueue;
        this.localQueue = localQueue;
        this.override = override;
        this.expectedUnlock = expectedUnlock;
        this.expectedOverride = expectedOverride;
    }

    @Test
    public void unlockRequiresItsPatchAndYieldsToPremiumStyleQueue() {
        assertEquals(expectedUnlock, QueuePrecedence.isUnlockEnabled(patchIncluded, unlockQueue, localQueue));
    }

    @Test
    public void nativeQueueWinsUnlessPremiumStyleQueueWasSelected() {
        boolean unlockEnabled = QueuePrecedence.isUnlockEnabled(patchIncluded, unlockQueue, localQueue);

        assertEquals(expectedOverride,
                QueuePrecedence.isFlyoutOverrideEnabled(localQueue, override, unlockEnabled));
    }
}
