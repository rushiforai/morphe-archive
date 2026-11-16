/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.view.KeyEvent;

import org.junit.Test;

import java.util.List;

public final class ExhaustedPlaybackTest {
    private final ExhaustedPlayback state = new ExhaustedPlayback();
    private final Object owner = new Object();
    private final Object selection = new Object();
    private final ExhaustedPlayback.Occurrence previous = new ExhaustedPlayback.Occurrence(11, "Ghost");
    private final ExhaustedPlayback.Occurrence failed = new ExhaustedPlayback.Occurrence(22, "Holy");

    private void exhaust() {
        state.arm(owner, selection, failed, previous, state.generation());
    }

    private ExhaustedPlayback.Resume play() {
        return state.take(owner, selection, 22, true, false);
    }

    @Test
    public void offlinePlayResumesThePreviousOccurrenceAfterInFlightExhaustion() {
        exhaust();
        ExhaustedPlayback.Resume resume = play();
        assertNotNull(resume);
        assertSame(previous, resume.previous());
        assertSame(failed, resume.failed());
    }

    @Test
    public void onlyAnExplicitNonRepeatingPlayKeyMayBypassTheStockActionMask() {
        assertTrue(PlayerFallbackLogic.isExplicitPlayKey(KeyEvent.ACTION_DOWN, 0, KeyEvent.KEYCODE_MEDIA_PLAY));
        assertFalse(PlayerFallbackLogic.isExplicitPlayKey(KeyEvent.ACTION_UP, 0, KeyEvent.KEYCODE_MEDIA_PLAY));
        assertFalse(PlayerFallbackLogic.isExplicitPlayKey(KeyEvent.ACTION_DOWN, 1, KeyEvent.KEYCODE_MEDIA_PLAY));
        assertFalse(PlayerFallbackLogic.isExplicitPlayKey(KeyEvent.ACTION_DOWN, 0, KeyEvent.KEYCODE_MEDIA_NEXT));
        assertFalse(PlayerFallbackLogic.isExplicitPlayKey(KeyEvent.ACTION_DOWN, 0, KeyEvent.KEYCODE_MEDIA_PAUSE));
        assertFalse(PlayerFallbackLogic.isExplicitPlayKey(KeyEvent.ACTION_DOWN, 0, KeyEvent.KEYCODE_MEDIA_PLAY_PAUSE));
        assertFalse(PlayerFallbackLogic.isExplicitPlayKey(KeyEvent.ACTION_DOWN, 0, KeyEvent.KEYCODE_HEADSETHOOK));
    }

    @Test
    public void queuedReplacementNavigationInvalidatesAnAlreadyClaimedPlayDispatch() {
        exhaust();
        ExhaustedPlayback.Resume claimed = play();
        state.clear();
        assertTrue(claimed.generation() != state.generation());
    }

    @Test
    public void lateOldStopCannotEraseANewerExhaustedRecovery() {
        long oldLoss = state.generation();
        state.reconnected();
        exhaust();
        state.arm(owner, selection, failed, previous, oldLoss);
        assertNotNull(play());
    }

    @Test
    public void normalPlayWithoutAnExhaustedRequestPassesThrough() {
        assertNull(play());
    }

    @Test
    public void onlinePlayPassesThroughAndCannotLeaveADelayedOfflineInterception() {
        exhaust();
        assertNull(state.take(owner, selection, 22, true, true));
        assertNull(play());
    }

    @Test
    public void disabledReplayPassesThrough() {
        exhaust();
        assertNull(state.take(owner, selection, 22, false, false));
        assertNull(play());
    }

    @Test
    public void replacementSelectionInvalidatesEvenAtTheSameQueueOccurrence() {
        exhaust();
        assertNull(state.take(owner, new Object(), 22, true, false));
        assertNull(play());
    }

    @Test
    public void newNavigationClearsAnExhaustedStop() {
        exhaust();
        state.clear();
        assertNull(play());
    }

    @Test
    public void replacementNavigatorCannotResumeTheOldOccurrence() {
        exhaust();
        assertNull(state.take(new Object(), selection, 22, true, false));
    }

    @Test
    public void anotherDuplicateOccurrenceDoesNotMatchTheFailedSelection() {
        exhaust();
        assertNull(state.take(owner, selection, 23, true, false));
    }

    @Test
    public void previousOccurrenceIsNotCorrelatedByVideoId() {
        ExhaustedPlayback.Occurrence duplicate = new ExhaustedPlayback.Occurrence(33, "Ghost");
        state.arm(owner, selection, failed, duplicate, state.generation());
        assertEquals(33, play().previous().itemId());
    }

    @Test
    public void explicitPlayIsOneShotAndCannotBecomeAnAutomaticRepeatLoop() {
        exhaust();
        assertNotNull(play());
        assertNull(play());
        assertNull(play());
    }

    @Test
    public void reconnectInvalidatesEvenIfConnectivityDropsAgainBeforePlay() {
        exhaust();
        state.reconnected();
        assertNull(play());
    }

    @Test
    public void reconnectBeforeADeferredStopCannotArmThatOldLoss() {
        long lossGeneration = state.generation();
        state.reconnected();
        state.arm(owner, selection, failed, previous, lossGeneration);
        assertNull(play());
    }

    @Test
    public void anInitialValidatedCallbackCannotInvalidateASubsequentLoss() {
        state.reconnected();
        exhaust();
        assertNotNull(play());
    }

    @Test
    public void noPreviousPlayableOccurrenceMeansNoInterception() {
        state.arm(owner, selection, failed, null, state.generation());
        assertNull(play());
    }

    @Test
    public void failedOccurrenceIsNeverReplayedAsItsOwnPreviousSong() {
        state.arm(owner, selection, failed, failed, state.generation());
        assertNull(play());
    }

    @Test
    public void stopDiagnosticProvesTheLoadedTailHasNoLaterCopy() {
        String log = PlayerFallbackLogic.describeStop(List.of(previous, failed), 1, 1, 1, true,
                "in-flight-exhausted", "Ghost"::equals);
        assertTrue(log.contains("size=2 current=1 failed=1 scan=[2,2) budget=1 left=0"));
        assertTrue(log.contains("cached=[0#11:Ghost]"));
    }

    @Test
    public void stopDiagnosticExposesCopiesOutsideTheRemainingBudgetAndDuplicateIds() {
        String log = PlayerFallbackLogic.describeStop(List.of(previous, failed,
                new ExhaustedPlayback.Occurrence(33, "Ghost")), 1, 1, 1, true,
                "in-flight-exhausted", "Ghost"::equals);
        assertTrue(log.contains("scan=[2,2) budget=1 left=0"));
        assertTrue(log.contains("cached=[0#11:Ghost, 2#33:Ghost]"));
    }

    @Test
    public void stopWithoutAMatchedSelectionDoesNotClaimToHaveScanned() {
        String log = PlayerFallbackLogic.describeStop(List.of(previous, failed), 1, -1, 0, false,
                "missing-selection", "Ghost"::equals);
        assertTrue(log.contains("scan=[-1,-1) budget=0"));
        assertTrue(log.contains("reason=missing-selection"));
    }
}
