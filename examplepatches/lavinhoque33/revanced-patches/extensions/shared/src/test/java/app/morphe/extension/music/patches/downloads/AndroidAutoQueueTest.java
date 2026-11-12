/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-11.
 */
package app.morphe.extension.music.patches.downloads;

import org.junit.Test;
import static org.junit.Assert.*;

/** Exercises the actual mutation/readiness guards without Android or mocked native queue implementations. */
public class AndroidAutoQueueTest {
    @Test public void unchangedPlayingVideoIsNotAQueueCommit() {
        Object model = new Object();
        assertFalse(AndroidAutoQueue.newQueue(model, 42, model, 42));
    }

    @Test public void selectingTheSameVideoStillRequiresANewNativeItemOrModel() {
        Object model = new Object();
        assertTrue(AndroidAutoQueue.newQueue(model, 42, model, 43));
        assertTrue(AndroidAutoQueue.newQueue(model, 42, new Object(), 42));
    }

    @Test public void anEmptyMutableModelBecomesReadyWithoutReplacement() {
        Object model = new Object();
        Object selection = new Object();
        assertTrue(AndroidAutoQueue.newQueue(model, Long.MIN_VALUE, model, 42));
        assertTrue(AndroidAutoQueue.canCommit(selection, selection, model, model, "ghost", "ghost", 42, 42));
    }

    @Test public void metadataCompletionBeforeNativeReadinessCannotMutate() {
        Object selection = new Object();
        assertFalse(AndroidAutoQueue.canCommit(selection, selection, null, new Object(), "ghost", "ghost", 42, 42));
    }

    @Test public void replacementAfterReadinessInvalidatesThatQueueSnapshot() {
        Object selection = new Object();
        assertFalse(AndroidAutoQueue.canCommit(selection, selection, new Object(), new Object(),
                "ghost", "ghost", 42, 42));
    }

    @Test public void newSelectionRejectsAnOldCompletionEvenForTheSameSongAndModel() {
        Object model = new Object();
        assertFalse(AndroidAutoQueue.canCommit(new Object(), new Object(), model, model, "ghost", "ghost", 42, 42));
    }

    @Test public void reconnectCancellationRejectsOutstandingWork() {
        Object model = new Object();
        assertFalse(AndroidAutoQueue.canCommit(null, new Object(), model, model, "ghost", "ghost", 42, 42));
    }

    @Test public void movingToAnotherNativeCurrentItemPreventsInsertion() {
        Object selection = new Object();
        Object model = new Object();
        assertFalse(AndroidAutoQueue.canCommit(selection, selection, model, model, "ghost", "homesick", 42, 42));
    }

    @Test public void onlyTheCurrentSelectionAndItsCommittedNativeModelCanMutate() {
        Object selection = new Object();
        Object model = new Object();
        assertTrue(AndroidAutoQueue.canCommit(selection, selection, model, model, "ghost", "ghost", 42, 42));
    }

    @Test public void sameSongInTheSameModelWithADifferentPersistentItemCannotMutate() {
        Object selection = new Object();
        Object model = new Object();
        assertFalse(AndroidAutoQueue.canCommit(selection, selection, model, model, "ghost", "ghost", 42, 43));
    }
}
