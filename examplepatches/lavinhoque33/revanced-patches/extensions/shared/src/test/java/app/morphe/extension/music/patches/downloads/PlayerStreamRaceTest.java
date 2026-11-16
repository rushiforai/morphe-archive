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
import java.util.concurrent.atomic.AtomicBoolean;

public final class PlayerStreamRaceTest {
    private static final class Calls implements PlayerStreamRace.NativeCalls {
        final List<Object> events = new ArrayList<>();

        @Override
        public void rvxSubscribe(Object source, Object observer) {
            throw new AssertionError("Construction must not subscribe");
        }

        @Override
        public void rvxSubscribed(Object observer, Object disposable) {
            events.add("subscribed");
        }

        @Override
        public void rvxNext(Object observer, Object value) {
            events.add(value);
        }

        @Override
        public void rvxError(Object observer, Throwable failure) {
            events.add(failure);
        }

        @Override
        public void rvxComplete(Object observer) {
            events.add("complete");
        }

        @Override
        public void rvxDispose(Object disposable) {
            ((AtomicBoolean) disposable).set(true);
        }

        @Override
        public boolean rvxDisposed(Object disposable) {
            return ((AtomicBoolean) disposable).get();
        }
    }

    private static PlayerStreamRace.Subscription subscription(Calls calls) {
        return new PlayerStreamRace.Subscription(new Object(), null, true, calls, new Object());
    }

    @Test
    public void wrappingDoesNotSubscribeOrConstructAPendingResponse() {
        Calls calls = new Calls();
        new PlayerStreamRace(new Object(), true, calls);
        assertTrue(calls.events.isEmpty());
    }

    @Test
    public void onlineWatchNextForwardsAllValuesUnchanged() {
        Calls calls = new Calls();
        PlayerStreamRace.Subscription subscription = subscription(calls);
        subscription.stockSubscribe(new AtomicBoolean());
        Object first = new Object();
        Object second = new Object();
        subscription.stockNext(first);
        subscription.stockNext(second);
        subscription.stockComplete();
        assertEquals(List.of("subscribed", first, second, "complete"), calls.events);
    }

    @Test
    public void originalErrorIsNotReplaced() {
        Calls calls = new Calls();
        PlayerStreamRace.Subscription subscription = subscription(calls);
        subscription.stockSubscribe(new AtomicBoolean());
        IOException failure = new IOException("stock failure");
        subscription.stockError(failure);
        assertSame(failure, calls.events.get(1));
    }

    @Test
    public void cancellationBeforeOnSubscribeDisposesTheLateHandle() {
        Calls calls = new Calls();
        PlayerStreamRace.Subscription subscription = subscription(calls);
        subscription.dispose();
        AtomicBoolean upstream = new AtomicBoolean();
        subscription.stockSubscribe(upstream);
        subscription.stockNext("late");
        subscription.stockComplete();
        assertTrue(upstream.get());
        assertTrue(calls.events.isEmpty());
    }

    @Test
    public void downstreamCancellationIsAuthoritative() {
        Calls calls = new Calls();
        PlayerStreamRace.Subscription subscription = subscription(calls);
        AtomicBoolean upstream = new AtomicBoolean();
        subscription.stockSubscribe(upstream);
        assertFalse(subscription.isDisposed());
        subscription.dispose();
        subscription.stockNext("late");
        subscription.stockError(new IOException("late failure"));
        assertTrue(subscription.isDisposed());
        assertTrue(upstream.get());
        assertEquals(List.of("subscribed"), calls.events);
    }

    @Test
    public void emptyCompletionRemainsEmptyRatherThanInventingAResponse() {
        Calls calls = new Calls();
        PlayerStreamRace.Subscription subscription = subscription(calls);
        subscription.stockSubscribe(new AtomicBoolean());
        subscription.stockComplete();
        assertEquals(List.of("subscribed", "complete"), calls.events);
    }

    @Test
    public void uncachedClaimRejectsLateSignalsBeforeCancellingTheNativeHandle() {
        Calls calls = new Calls();
        PlayerStreamRace.Subscription player =
                new PlayerStreamRace.Subscription(new Object(), null, false, calls, new Object());
        AtomicBoolean upstream = new AtomicBoolean();
        player.stockSubscribe(upstream);
        assertTrue(player.player());
        assertTrue(player.selectUnavailable());
        player.stockNext("late response");
        player.stockError(new IOException("late network failure"));
        player.stockComplete();
        assertEquals(List.of("subscribed"), calls.events);
        player.cancelUnavailable();
        assertTrue(player.isDisposed());
        assertTrue(upstream.get());
    }

    @Test
    public void nextLaneIsNotAPlayerAndStockWinnerCannotBeClaimed() {
        Calls calls = new Calls();
        PlayerStreamRace.Subscription next = subscription(calls);
        assertFalse(next.player());
        next.stockSubscribe(new AtomicBoolean());
        next.stockNext("online metadata");
        assertFalse(next.selectUnavailable());
        assertEquals(List.of("subscribed", "online metadata"), calls.events);
    }
}
