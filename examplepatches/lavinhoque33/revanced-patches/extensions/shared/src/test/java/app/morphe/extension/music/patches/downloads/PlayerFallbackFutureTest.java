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

public final class PlayerFallbackFutureTest {
    @Test
    public void outstandingRequestUsesConnectivityAtFailure() throws Exception {
        ReplayFuture network = new ReplayFuture();
        AtomicBoolean online = new AtomicBoolean(true);
        ListenableFuture<?> response = PlayerFallbackFuture.recoverAsync(network, Runnable::run, (result, cause) -> {
            if (online.get()) result.setException(cause);
            else result.set("local");
        });
        assertFalse(response.isDone());

        online.set(false);
        network.setException(new IOException("connection lost"));
        assertEquals("local", response.get());
        assertFalse(network.set("late network response"));
        assertEquals("local", response.get());
    }

    @Test
    public void onlineFailureRemainsTheSameFailure() {
        ReplayFuture network = new ReplayFuture();
        IOException failure = new IOException("server failure while online");
        ListenableFuture<?> response = PlayerFallbackFuture.recoverAsync(network, Runnable::run,
                (result, cause) -> result.setException(cause));
        network.setException(failure);
        assertSame(failure, assertThrows(ExecutionException.class, response::get).getCause());
    }

    @Test
    public void successfulOnlineResponseIsNeverReplaced() throws Exception {
        ReplayFuture network = new ReplayFuture();
        ListenableFuture<?> response = PlayerFallbackFuture.recoverAsync(network, Runnable::run, (result, cause) -> {
            throw new AssertionError("successful request must not consult the store");
        });
        network.set("online");
        assertEquals("online", response.get());
    }

    @Test
    public void cancellationPreventsQueuedRecoveryAndCancelsNativeRequest() {
        ReplayFuture network = new ReplayFuture();
        List<Runnable> pending = new ArrayList<>();
        ListenableFuture<?> response = PlayerFallbackFuture.recoverAsync(network, pending::add, (result, cause) -> {
            throw new AssertionError("cancelled request must not revive");
        });
        network.setException(new IOException("lost"));
        assertEquals(1, pending.size());
        response.cancel(false);
        pending.get(0).run();
        assertTrue(response.isCancelled());
    }

    @Test
    public void cancellingBeforeNetworkCompletionPropagates() {
        ReplayFuture network = new ReplayFuture();
        ListenableFuture<?> response = PlayerFallbackFuture.recoverAsync(network, Runnable::run,
                (result, cause) -> result.set("local"));
        response.cancel(false);
        assertTrue(network.isCancelled());
    }

    @Test
    public void nativeCancellationNeverTriggersOfflineFallback() {
        ReplayFuture network = new ReplayFuture();
        ListenableFuture<?> response = PlayerFallbackFuture.recoverAsync(network, Runnable::run, (result, cause) -> {
            throw new AssertionError("native cancellation is not a transport failure");
        });
        network.cancel(false);
        assertTrue(response.isCancelled());
    }

    @Test
    public void unavailableCompletionWaitsForNativeCancellationAndStop() {
        ReplayFuture network = new ReplayFuture();
        List<Runnable> mainThread = new ArrayList<>();
        List<String> events = new ArrayList<>();
        ListenableFuture<?> response = PlayerFallbackFuture.recoverAsync(network, Runnable::run,
                (result, failure) -> mainThread.add(() -> {
                    events.add("cancel native runner");
                    events.add("native stopped");
                    result.cancel(false);
                }));
        response.addListener(() -> events.add("request completed"), Runnable::run);
        network.setException(new IOException("disconnected uncached request"));
        assertFalse(response.isDone());

        mainThread.get(0).run();
        assertTrue(response.isCancelled());
        assertEquals(List.of("cancel native runner", "native stopped", "request completed"), events);
    }

    @Test
    public void recoveryFailureNeverLeavesARequestPending() {
        ReplayFuture network = new ReplayFuture();
        IOException failure = new IOException("transport failed");
        ListenableFuture<?> response = PlayerFallbackFuture.recoverAsync(network, Runnable::run, (result, cause) -> {
            throw new IllegalStateException("response cannot be constructed");
        });
        network.setException(failure);
        assertSame(failure, assertThrows(ExecutionException.class, response::get).getCause());
    }

    @Test
    public void outstandingUncachedAdvanceResolvesToABoundedNativeSkip() throws Exception {
        ReplayFuture network = new ReplayFuture();
        AtomicBoolean online = new AtomicBoolean(true);
        List<String> queue = List.of("current", "missing", "also missing", "saved");
        ListenableFuture<?> response = PlayerFallbackFuture.recoverAsync(network, Runnable::run,
                (result, cause) -> result.set(PlayerFallbackLogic.decide(true, online.get(),
                        "missing", false, queue, 1, "saved"::equals)));
        online.set(false);
        network.setException(new IOException("lost during uncached Next"));

        PlayerFallbackLogic.Decision decision = (PlayerFallbackLogic.Decision) response.get();
        assertEquals(PlayerFallbackLogic.Route.SKIP, decision.route());
        assertEquals(3, decision.nextIndex());
        assertFalse(network.set("late network response"));
    }
}
