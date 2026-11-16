/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-14.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.downloads;

import com.google.common.util.concurrent.ListenableFuture;

import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;

/** The first stock result or connectivity takeover wins; late stock completion cannot replace a local response. */
final class PlayerFallbackFuture extends ReplayFuture implements PendingPlaybackRequests.Entry {
    interface Recovery {
        void recover(ReplayFuture result, Throwable failure);
    }

    private final ListenableFuture<?> stock;
    private final Executor executor;
    private final Recovery recovery;
    private boolean selected;
    private Object request;
    private Object ownership;
    private boolean next;
    private volatile PendingPlaybackRequests registry;

    private PlayerFallbackFuture(ListenableFuture<?> stock, Executor executor, Recovery recovery) {
        this.stock = stock;
        this.executor = executor;
        this.recovery = recovery;
        stock.addListener(this::stockCompleted, Runnable::run);
        addListener(() -> {
            PendingPlaybackRequests owner = registry;
            if (owner != null) owner.remove(this);
            if (isCancelled()) stock.cancel(false);
        }, Runnable::run);
    }

    static PlayerFallbackFuture recoverAsync(ListenableFuture<?> stock, Executor executor, Recovery recovery) {
        return new PlayerFallbackFuture(stock, executor, recovery);
    }

    void watch(Object request, Object ownership, PendingPlaybackRequests registry, boolean next) {
        this.request = request;
        this.ownership = ownership;
        this.next = next;
        this.registry = registry;
        registry.add(this);
    }

    private synchronized boolean select() {
        if (selected || isDone()) return false;
        selected = true;
        return true;
    }

    private void stockCompleted() {
        if (!select()) return;
        try {
            set(stock.get());
        } catch (CancellationException cancelled) {
            cancel(false);
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            setException(interrupted);
        } catch (ExecutionException failed) {
            recover(failed.getCause());
        }
    }

    private void recover(Throwable failure) {
        executor.execute(() -> {
            if (isCancelled()) return;
            try {
                recovery.recover(this, failure);
            } catch (RuntimeException unavailable) {
                setException(failure);
            }
        });
    }

    @Override
    public Object request() {
        return request;
    }

    @Override
    public Object ownership() {
        return ownership;
    }

    @Override
    public boolean player() {
        return !next;
    }

    @Override
    public boolean selectUnavailable() {
        return select();
    }

    @Override
    public void cancelUnavailable() {
        cancel(false);
    }

    @Override
    public synchronized boolean pending() {
        return !selected && !isDone();
    }

    @Override
    public boolean recover(PlaybackConnectionLoss loss) {
        if (!select()) return false;
        recover((Throwable) loss);
        // Do not cancel a shared transport here: its sibling next lane may still be subscribing.
        // The stock result is ignored after selection; explicit native/user cancellation still propagates.
        return true;
    }
}
