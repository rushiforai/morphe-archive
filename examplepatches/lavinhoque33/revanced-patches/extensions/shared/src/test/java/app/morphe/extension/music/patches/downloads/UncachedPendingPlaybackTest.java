/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

public final class UncachedPendingPlaybackTest {
    private static PlayerFallbackFuture watch(PendingPlaybackRequests registry, Object request, Object scope,
                                               ReplayFuture stock, boolean next) {
        PlayerFallbackFuture result = PlayerFallbackFuture.recoverAsync(stock, Runnable::run, (future, failure) -> {
            throw new AssertionError("Uncached decisions must not wait for or build a saved response");
        });
        result.watch(request, scope, registry, next);
        return result;
    }

    @Test
    public void uncachedAdvanceImmediatelyUsesNativeRemainingQueueOrder() {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        Object request = new Object();
        Object scope = new Object();
        ReplayFuture stock = new ReplayFuture();
        PlayerFallbackFuture player = watch(registry, request, scope, stock, false);
        AtomicInteger selected = new AtomicInteger(-1);
        registry.disconnected((candidate, token) -> candidate == request && token == scope, ignored -> false,
                () -> true, (candidate, token, completed) -> {
                    assertFalse(Thread.holdsLock(registry));
                    assertSame(request, candidate);
                    assertSame(scope, token);
                    selected.set(PlayerFallbackLogic.nextCached(List.of("Ghost", "Memories", "missing", "copy"),
                            1, 3, "copy"::equals));
                    completed.run();
                });
        assertEquals(3, selected.get());
        assertTrue(player.isCancelled());
        assertTrue(stock.isCancelled());
    }

    @Test
    public void noRemainingCopyStopsAfterOneBoundedScan() {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        PlayerFallbackFuture player = watch(registry, new Object(), new Object(), new ReplayFuture(), false);
        AtomicInteger inspected = new AtomicInteger();
        AtomicInteger stopped = new AtomicInteger();
        registry.disconnected((request, scope) -> true, ignored -> false, () -> true,
                (request, scope, completed) -> {
                    assertEquals(-1, PlayerFallbackLogic.nextCached(List.of("old-copy", "missing", "other"),
                            1, 2, id -> { inspected.incrementAndGet(); return "old-copy".equals(id); }));
                    stopped.incrementAndGet();
                    completed.run();
                });
        assertEquals(1, inspected.get());
        assertEquals(1, stopped.get());
        assertTrue(player.isCancelled());
    }

    @Test
    public void explicitUncachedSelectionIsUnavailableRatherThanSkipped() {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        PlayerFallbackFuture player = watch(registry, new Object(), new Object(), new ReplayFuture(), false);
        registry.disconnected((request, scope) -> true, ignored -> false, () -> true,
                (request, scope, completed) -> {
                    PlayerFallbackLogic.Decision decision = PlayerFallbackLogic.decide(true, false, "missing", true,
                            List.of("missing", "copy"), 0, "copy"::equals);
                    assertEquals(PlayerFallbackLogic.Route.UNAVAILABLE, decision.route());
                    completed.run();
                });
        assertTrue(player.isCancelled());
    }

    @Test
    public void reconnectBeforeDecisionLetsTheOnlineResponseWin() throws Exception {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        ReplayFuture stock = new ReplayFuture();
        PlayerFallbackFuture player = watch(registry, new Object(), new Object(), stock, false);
        registry.disconnected((request, scope) -> true, ignored -> false, () -> false,
                (request, scope, completed) -> { throw new AssertionError("Online request must not skip"); });
        assertFalse(player.isDone());
        stock.set("online response");
        assertEquals("online response", player.get());
    }

    @Test
    public void reachabilityIsCheckedAfterCacheInspectionAtTheDecisionPoint() throws Exception {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        ReplayFuture stock = new ReplayFuture();
        PlayerFallbackFuture player = watch(registry, new Object(), new Object(), stock, false);
        AtomicBoolean offline = new AtomicBoolean(true);
        registry.disconnected((request, scope) -> true, request -> { offline.set(false); return false; }, offline::get,
                (request, scope, completed) -> { throw new AssertionError("Reconnection must win"); });
        stock.set("reconnected response");
        assertEquals("reconnected response", player.get());
    }

    @Test
    public void allSiblingLanesAreClaimedBeforeNativeCancellation() {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        Object request = new Object();
        Object scope = new Object();
        ReplayFuture nextStock = new ReplayFuture();
        ReplayFuture playerStock = new ReplayFuture();
        PlayerFallbackFuture next = watch(registry, request, scope, nextStock, true);
        PlayerFallbackFuture player = watch(registry, request, scope, playerStock, false);
        registry.disconnected((candidate, token) -> true, ignored -> false, () -> true,
                (candidate, token, completed) -> {
                    assertFalse(player.pending());
                    assertFalse(next.pending());
                    playerStock.set("late player response");
                    nextStock.set("late next response");
                    assertFalse(player.isDone());
                    assertFalse(next.isDone());
                    completed.run();
                });
        assertTrue(player.isCancelled());
        assertTrue(next.isCancelled());
    }

    @Test
    public void pendingNextMetadataAloneCannotSkipAnAnsweredPlayer() throws Exception {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        ReplayFuture stock = new ReplayFuture();
        PlayerFallbackFuture next = watch(registry, new Object(), new Object(), stock, true);
        registry.disconnected((request, scope) -> true, ignored -> false, () -> true,
                (request, scope, completed) -> { throw new AssertionError("No pending player to skip"); });
        stock.set("next metadata");
        assertEquals("next metadata", next.get());
    }

    @Test
    public void staleOccurrenceCannotCancelOrSkipTheReplacement() {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        Object previousScope = new Object();
        Object replacementScope = new Object();
        PlayerFallbackFuture player = watch(registry, new Object(), previousScope, new ReplayFuture(), false);
        registry.disconnected((request, scope) -> scope == replacementScope, ignored -> false, () -> true,
                (request, scope, completed) -> { throw new AssertionError("Stale owner must not navigate"); });
        assertFalse(player.isDone());
    }

    @Test
    public void groupCancellationDoesNotTouchAnotherOccurrence() {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        Object request = new Object();
        Object scope = new Object();
        Object oldScope = new Object();
        PlayerFallbackFuture player = watch(registry, request, scope, new ReplayFuture(), false);
        PlayerFallbackFuture other = watch(registry, request, oldScope, new ReplayFuture(), true);
        registry.disconnected((candidate, token) -> token == scope, ignored -> false, () -> true,
                (candidate, token, completed) -> completed.run());
        assertTrue(player.isCancelled());
        assertFalse(other.isDone());
    }

    @Test
    public void stockSuccessBeforeTheClaimPreventsAnUnnecessarySkip() throws Exception {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        ReplayFuture stock = new ReplayFuture();
        PlayerFallbackFuture player = watch(registry, new Object(), new Object(), stock, false);
        registry.disconnected((request, scope) -> true, request -> { stock.set("stock winner"); return false; },
                () -> true, (request, scope, completed) -> { throw new AssertionError("Stock already answered"); });
        assertEquals("stock winner", player.get());
    }

    @Test
    public void repeatedLossCannotDispatchTheSkipTwice() {
        PendingPlaybackRequests registry = new PendingPlaybackRequests();
        watch(registry, new Object(), new Object(), new ReplayFuture(), false);
        AtomicInteger skipped = new AtomicInteger();
        PendingPlaybackRequests.Unavailable unavailable = (request, scope, completed) -> {
            skipped.incrementAndGet();
            completed.run();
        };
        registry.disconnected((request, scope) -> true, ignored -> false, () -> true, unavailable);
        registry.disconnected((request, scope) -> true, ignored -> false, () -> true, unavailable);
        assertEquals(1, skipped.get());
    }
}
