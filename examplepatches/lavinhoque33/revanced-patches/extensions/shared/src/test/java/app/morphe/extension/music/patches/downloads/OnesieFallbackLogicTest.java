/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import com.google.common.util.concurrent.ListenableFuture;

import org.junit.Test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.atomic.AtomicBoolean;

public final class OnesieFallbackLogicTest {
    private static final class Completion implements OnesieFallback.Controller {
        final AtomicBoolean response = new AtomicBoolean();
        final ReplayFuture scalar = new ReplayFuture();
        final ReplayFuture packed = new ReplayFuture();
        final List<String> events = new ArrayList<>();
        boolean closed;
        boolean cancelled;
        boolean cancelAfterClaim;
        boolean throwFromPacked;

        @Override
        public synchronized boolean rvxClaimFailure() {
            return !closed && !cancelled && !scalar.isDone() && response.compareAndSet(false, true);
        }

        @Override
        public boolean rvxFailureLive() {
            if (cancelAfterClaim) {
                cancelled = true;
                scalar.cancel(false);
            }
            return !closed && !cancelled && !scalar.isCancelled();
        }

        @Override
        public void rvxFailFuture(Exception failure) {
            assertFalse(Thread.holdsLock(this));
            events.add("scalar failure");
            scalar.setException(failure);
        }

        @Override
        public void rvxFailPacked(Exception failure) {
            assertFalse(Thread.holdsLock(this));
            events.add("packed failure");
            if (throwFromPacked) throw new IllegalStateException("subscriber failed");
            packed.setException(failure);
        }

        @Override
        public void rvxCloseFailure() {
            assertFalse(Thread.holdsLock(this));
            events.add("cleanup");
            closed = true;
            scalar.cancel(false);
            packed.cancel(false);
        }
    }

    @Test
    public void onlineAndDisabledRequestsKeepNativeRetryBehavior() {
        assertFalse(OnesieFallbackLogic.disconnected(true, true));
        assertFalse(OnesieFallbackLogic.disconnected(false, false));
        assertFalse(OnesieFallbackLogic.disconnected(false, true));
        assertTrue(OnesieFallbackLogic.disconnected(true, false));
    }

    @Test
    public void realFailureSettlesBothOutputsBeforeCleanupCanCancelThem() {
        Completion completion = new Completion();
        IOException failure = new IOException("Cronet disconnected");
        assertTrue(OnesieFallbackLogic.complete(completion, failure));
        assertEquals(List.of("scalar failure", "packed failure", "cleanup"), completion.events);
        assertSame(failure, assertThrows(ExecutionException.class, completion.scalar::get).getCause());
        assertSame(failure, assertThrows(ExecutionException.class, completion.packed::get).getCause());
        assertFalse(completion.scalar.isCancelled());
        assertFalse(completion.packed.isCancelled());
    }

    @Test
    public void pendingScalarAndPackedRequestsRecoverWithoutWaitingForRetryExhaustion() throws Exception {
        Completion completion = new Completion();
        ListenableFuture<?> player = PlayerFallbackFuture.recoverAsync(completion.scalar, Runnable::run,
                (result, failure) -> result.set("saved player"));
        ListenableFuture<?> next = PlayerFallbackFuture.recoverAsync(completion.packed, Runnable::run,
                (result, failure) -> result.set("captured queue"));
        assertFalse(player.isDone());
        assertFalse(next.isDone());
        OnesieFallbackLogic.complete(completion, new IOException("first failed open"));
        assertEquals("saved player", player.get());
        assertEquals("captured queue", next.get());
    }

    @Test
    public void successfulResponseGateCannotBeReplacedByFailure() {
        Completion completion = new Completion();
        completion.response.set(true);
        assertFalse(OnesieFallbackLogic.complete(completion, new IOException("late failure")));
        assertTrue(completion.events.isEmpty());
    }

    @Test
    public void cancelledOrClosedControllersCannotRevivePlayback() {
        Completion cancelled = new Completion();
        cancelled.cancelled = true;
        assertFalse(OnesieFallbackLogic.complete(cancelled, new IOException("cancelled")));
        assertTrue(cancelled.events.isEmpty());
        Completion closed = new Completion();
        closed.closed = true;
        assertFalse(OnesieFallbackLogic.complete(closed, new IOException("closed")));
        assertTrue(closed.events.isEmpty());
    }

    @Test
    public void cancellationAfterAdmissionStillWins() {
        Completion completion = new Completion();
        completion.cancelAfterClaim = true;
        assertFalse(OnesieFallbackLogic.complete(completion, new IOException("replaced request")));
        assertTrue(completion.scalar.isCancelled());
        assertTrue(completion.events.isEmpty());
    }

    @Test
    public void repeatedTransportFailuresCompleteOnlyOnce() {
        Completion completion = new Completion();
        IOException failure = new IOException("first failure");
        assertTrue(OnesieFallbackLogic.complete(completion, failure));
        assertFalse(OnesieFallbackLogic.complete(completion, new IOException("duplicate failure")));
        assertEquals(3, completion.events.size());
    }

    @Test
    public void subscriberFailureStillClosesTransport() {
        Completion completion = new Completion();
        completion.throwFromPacked = true;
        assertThrows(IllegalStateException.class,
                () -> OnesieFallbackLogic.complete(completion, new IOException("disconnected")));
        assertTrue(completion.closed);
        assertEquals(List.of("scalar failure", "packed failure", "cleanup"), completion.events);
    }
}
