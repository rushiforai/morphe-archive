/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-19.
 * Written by lavinhoque33, 2026-11-19.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.io.EOFException;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.ConnectException;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;

import javax.net.ssl.SSLException;

import org.junit.Test;

public class DownloadRetryPlanTest {
    private static final long NOW = 900_000;

    @Test public void automaticResumeSkipsRunningSources() {
        assertEquals(0, DownloadRetryPlan.delayUntilAutomaticResume(false, null, NOW));
        assertEquals(Long.MAX_VALUE, DownloadRetryPlan.delayUntilAutomaticResume(true, null, NOW));
    }

    @Test public void onlyThirdConsecutiveIdleAttemptHoldsTheSource() {
        DownloadRetryPlan.Attempt attempt = null;
        long start = NOW;
        for (int idle = 1; idle <= 2; idle++, start += 600_000) {
            attempt = DownloadRetryPlan.finish(attempt, start, false, false);
            assertEquals(idle, attempt.idleAttempts());
            assertFalse(attempt.held());
            assertEquals(1, DownloadRetryPlan.delayUntilAutomaticResume(false, attempt, start + 599_999));
            assertEquals(0, DownloadRetryPlan.delayUntilAutomaticResume(false, attempt, start + 600_000));
        }

        var held = DownloadRetryPlan.finish(attempt, start, false, false);
        assertEquals(3, held.idleAttempts());
        assertTrue(held.held());
        assertEquals(Long.MAX_VALUE, DownloadRetryPlan.delayUntilAutomaticResume(false, held, start + 600_000));
    }

    @Test public void healthyProgressResetsTheIdleStreakButKeepsTheCooldown() {
        var first = DownloadRetryPlan.finish(null, NOW, false, false);
        var second = DownloadRetryPlan.finish(first, NOW + 600_000, false, false);
        var progressed = DownloadRetryPlan.finish(second, NOW + 1_200_000, true, false);
        assertEquals(0, progressed.idleAttempts());
        assertEquals(1, DownloadRetryPlan.delayUntilAutomaticResume(false, progressed, NOW + 1_799_999));
        assertEquals(0, DownloadRetryPlan.delayUntilAutomaticResume(false, progressed, NOW + 1_800_000));
        assertEquals(1, DownloadRetryPlan.finish(progressed, NOW + 1_800_000, false, false).idleAttempts());
    }

    @Test public void interruptionsPreserveTheStreakAndRestartTheCooldown() {
        var first = DownloadRetryPlan.finish(null, NOW, false, true);
        assertEquals(0, first.idleAttempts());

        var idle = DownloadRetryPlan.finish(first, NOW + 600_000, false, false);
        var interrupted = DownloadRetryPlan.finish(idle, NOW + 1_200_000, false, true);
        assertEquals(1, interrupted.idleAttempts());
        assertEquals(1, DownloadRetryPlan.delayUntilAutomaticResume(false, interrupted, NOW + 1_799_999));
        assertEquals(0, DownloadRetryPlan.delayUntilAutomaticResume(false, interrupted, NOW + 1_800_000));

        var interruptedWithProgress = DownloadRetryPlan.finish(interrupted, NOW + 1_800_000, true, true);
        assertEquals(1, interruptedWithProgress.idleAttempts());
        assertEquals(2, DownloadRetryPlan.finish(interruptedWithProgress, NOW + 2_400_000, false, false).idleAttempts());
    }

    @Test public void onlyAutomaticInterruptionsSuppressFailureNotifications() {
        assertFalse(DownloadRetryPlan.reportFailure(true, true));
        assertTrue(DownloadRetryPlan.reportFailure(true, false));
        assertTrue(DownloadRetryPlan.reportFailure(false, true));
        assertTrue(DownloadRetryPlan.reportFailure(false, false));
    }

    @Test public void pendingSourceCanBeResumedManuallyEvenWhenAutomaticResumeIsHeld() {
        var held = new DownloadRetryPlan.Attempt(NOW, DownloadRetryPlan.IDLE_LIMIT);
        assertEquals(Long.MAX_VALUE, DownloadRetryPlan.delayUntilAutomaticResume(false, held, NOW));
        assertTrue(DownloadRetryPlan.canResume(true, true));
        assertFalse(DownloadRetryPlan.canResume(true, false));
        assertFalse(DownloadRetryPlan.canResume(false, true));
    }

    @Test public void eachRunHasFiveMinutesToWaitAcrossOutages() {
        var budget = new DownloadRetryPlan.OutageBudget();
        assertEquals(300_000, budget.remaining());
        budget.waited(30_000);
        assertEquals(270_000, budget.remaining());
        budget.waited(270_000);
        assertEquals(0, budget.remaining());
        budget.waited(1);
        assertEquals(0, budget.remaining());
    }

    @Test public void retriesAnOutageFailureOnceButNeverARoutineTrackFailure() {
        assertTrue(DownloadRetryPlan.retryAfterFailure(true, false));
        assertFalse(DownloadRetryPlan.retryAfterFailure(true, true));
        assertFalse(DownloadRetryPlan.retryAfterFailure(false, false));
    }

    @Test public void onlyRetryWaitsForConnectivityToSettle() {
        assertEquals(0, DownloadRetryPlan.settleBeforeAttempt(false, false));
        assertEquals(2_000, DownloadRetryPlan.settleBeforeAttempt(true, false));
    }

    @Test public void stopAbortsBeforeStartingAnAttemptOrSettlingForRetry() {
        assertEquals(-1, DownloadRetryPlan.settleBeforeAttempt(false, true));
        assertEquals(-1, DownloadRetryPlan.settleBeforeAttempt(true, true));
    }

    @Test public void socketAndStreamFailuresGetTheConnectivityGracePeriod() {
        assertTrue(DownloadRetryPlan.isTransportFailure(new SocketException(), false));
        assertTrue(DownloadRetryPlan.isTransportFailure(new ConnectException(), false));
        assertTrue(DownloadRetryPlan.isTransportFailure(new UnknownHostException(), false));
        assertTrue(DownloadRetryPlan.isTransportFailure(new SSLException("Handshake closed"), false));
        assertTrue(DownloadRetryPlan.isTransportFailure(new SocketTimeoutException(), false));
        assertTrue(DownloadRetryPlan.isTransportFailure(new InterruptedIOException(), false));
        assertTrue(DownloadRetryPlan.isTransportFailure(new EOFException(), false));
    }

    @Test public void wrappedTransportFailureStillGetsTheGracePeriod() {
        var failure = new ExecutionException(new IOException("Browse failed", new SocketException()));
        assertTrue(DownloadRetryPlan.isTransportFailure(failure, false));
    }

    @Test public void httpAndContentFailuresDoNotWait() {
        assertFalse(DownloadRetryPlan.isTransportFailure(new IOException("Music browse HTTP 401"), false));
        assertFalse(DownloadRetryPlan.isTransportFailure(new IOException("Playlist is empty"), false));
    }

    @Test public void interruptionAndCancellationDoNotWait() {
        assertFalse(DownloadRetryPlan.isTransportFailure(new InterruptedException(), false));
        assertFalse(DownloadRetryPlan.isTransportFailure(new CancellationException(), false));
        assertFalse(DownloadRetryPlan.isTransportFailure(new InterruptedIOException(), true));
        assertFalse(DownloadRetryPlan.isTransportFailure(new SocketTimeoutException(), true));
        var cancelled = new CancellationException();
        cancelled.initCause(new SocketException());
        assertFalse(DownloadRetryPlan.isTransportFailure(new IOException(cancelled), false));
    }
}
