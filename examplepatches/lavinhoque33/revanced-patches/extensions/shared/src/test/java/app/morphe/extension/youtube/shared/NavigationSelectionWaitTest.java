/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.youtube.shared;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.concurrent.TimeUnit;

public class NavigationSelectionWaitTest {
    @Test
    public void timedOutWorkerCannotReleaseNextBackSelection() throws InterruptedException {
        var selection = new NavigationBar.SelectionWait();
        var first = selection.current();
        assertFalse(first.await(0, TimeUnit.MILLISECONDS));

        // A second Back arrives after the first wait times out but before it cleans up.
        selection.reset();
        var second = selection.current();
        selection.release(first);

        assertTrue(first.await(0, TimeUnit.MILLISECONDS));
        assertFalse(second.await(0, TimeUnit.MILLISECONDS));
        selection.release(selection.current());
        assertTrue(second.await(0, TimeUnit.MILLISECONDS));
        assertNull(selection.current());
    }
}
