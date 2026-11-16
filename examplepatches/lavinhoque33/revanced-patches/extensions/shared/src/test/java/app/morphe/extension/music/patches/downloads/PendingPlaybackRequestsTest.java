/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-14.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.function.Predicate;

public final class PendingPlaybackRequestsTest {
    private static PlayerFallbackFuture watch(PendingPlaybackRequests registry, Object request, Object ownership,
                                               ReplayFuture stock, Executor executor) {
        PlayerFallbackFuture future = PlayerFallbackFuture.recoverAsync(stock, executor, (result, failure) -> {
            assertTrue(failure instanceof PlaybackConnectionLoss);
            assertFalse(Thread.holdsLock(registry));
            result.set("saved copy");
        });
        future.watch(request, ownership, registry, false);
        return future;
    }

    private static void disconnect(PendingPlaybackRequests registry, PendingPlaybackRequests.Ownership owns,
                                   Predicate<Object> cached) {
        registry.disconnected(owns, cached, () -> false, (request, scope, completed) -> {
            throw new AssertionError("Reconnected uncached requests must remain online");
        });
    }

    @Test
    public void disconnectCompletesPendingRequestWithoutAnyTransportFailure() throws Exception {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        Object request = new Object();
        Object ownership = new Object();
        ReplayFuture stock = new ReplayFuture();
        PlayerFallbackFuture future = watch(registry, request, ownership, stock, Runnable::run);
        disconnect(registry, (candidate, scope) -> candidate == request && scope == ownership, ignored -> true);
        assertEquals("saved copy", future.get());
        assertFalse(stock.isDone());
        stock.set("late online response");
        assertEquals("saved copy", future.get());
    }

    @Test
    public void lossClaimsBeforeBackgroundCopyReadAndRejectsLateSuccess() throws Exception {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        List<Runnable> pending = new ArrayList<>();
        ReplayFuture stock = new ReplayFuture();
        PlayerFallbackFuture future = watch(registry, new Object(), new Object(), stock, pending::add);
        disconnect(registry, (request, ownership) -> true, ignored -> true);
        assertFalse(future.isDone());
        stock.set("late response while reading the copy");
        assertFalse(future.isDone());
        pending.get(0).run();
        assertEquals("saved copy", future.get());
    }

    @Test
    public void cancelAfterLossBeforeCopyDeliveryCannotRevivePlayback() {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        List<Runnable> pending = new ArrayList<>();
        ReplayFuture stock = new ReplayFuture();
        PlayerFallbackFuture future = watch(registry, new Object(), new Object(), stock, pending::add);
        disconnect(registry, (request, ownership) -> true, ignored -> true);
        future.cancel(false);
        pending.get(0).run();
        assertTrue(future.isCancelled());
        assertTrue(stock.isCancelled());
    }

    @Test
    public void previousNativeSuccessRemainsTheWinner() throws Exception {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        ReplayFuture stock = new ReplayFuture();
        PlayerFallbackFuture future = watch(registry, new Object(), new Object(), stock, Runnable::run);
        stock.set("native success");
        disconnect(registry, (request, ownership) -> true, ignored -> true);
        assertEquals("native success", future.get());
    }

    @Test
    public void reconnectBeforeUncachedDecisionLetsStockWin() throws Exception {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        ReplayFuture stock = new ReplayFuture();
        PlayerFallbackFuture future = watch(registry, new Object(), new Object(), stock, Runnable::run);
        disconnect(registry, (request, ownership) -> true, ignored -> false);
        assertFalse(future.isDone());
        stock.set("native uncached stream");
        assertEquals("native uncached stream", future.get());
    }

    @Test
    public void requestIdentityAndOccurrenceScopeRejectStaleSnapshots() {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        Object previous = new String("same video");
        Object replacement = new String("same video");
        Object previousScope = new Object();
        Object replacementScope = new Object();
        ReplayFuture stock = new ReplayFuture();
        PlayerFallbackFuture future = watch(registry, previous, previousScope, stock, Runnable::run);
        disconnect(registry, (request, scope) -> request == replacement && scope == replacementScope, ignored -> true);
        assertFalse(future.isDone());
        PendingPlaybackRequests reused = new PendingPlaybackRequests();
        PlayerFallbackFuture sameRequest = watch(reused, previous, previousScope, new ReplayFuture(), Runnable::run);
        disconnect(reused, (request, scope) -> request == previous && scope == replacementScope, ignored -> true);
        assertFalse(sameRequest.isDone());
    }

    @Test
    public void duplicateNotificationsCannotDuplicateCopyReads() throws Exception {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        List<Runnable> pending = new ArrayList<>();
        PlayerFallbackFuture future = watch(registry, new Object(), new Object(), new ReplayFuture(), pending::add);
        disconnect(registry, (request, ownership) -> true, ignored -> true);
        disconnect(registry, (request, ownership) -> true, ignored -> true);
        assertEquals(1, pending.size());
        pending.get(0).run();
        assertEquals("saved copy", future.get());
    }

    @Test
    public void explicitCancellationBeforeNotificationRemainsAuthoritative() {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        PlayerFallbackFuture future = watch(registry, new Object(), new Object(), new ReplayFuture(), Runnable::run);
        future.cancel(false);
        disconnect(registry, (request, ownership) -> true, ignored -> true);
        assertTrue(future.isCancelled());
    }

    @Test
    public void connectivityEventSurvivesNativeWrappingAndRapidReconnect() {
        Object request = new Object();
        Object scope = new Object();
        PlaybackConnectionLoss loss = new PlaybackConnectionLoss(request, scope);
        IOException nativeWrapper = new IOException("native error", loss);
        assertSame(loss, PlaybackConnectionLoss.find(nativeWrapper));
        assertSame(request, loss.request);
        assertSame(scope, loss.ownership);
        // No global reachability value participates in the already selected request-local event.
        assertTrue(PlayerFallback.replayFailure(request, nativeWrapper));
    }
}
