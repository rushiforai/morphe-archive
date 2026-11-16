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

/** Patched into a native Observable subclass; construction never subscribes or starts a request. */
@SuppressWarnings("unused")
public final class PlayerStreamRace {
    public interface NativeCalls {
        void rvxSubscribe(Object source, Object observer);
        void rvxSubscribed(Object observer, Object disposable);
        void rvxNext(Object observer, Object value);
        void rvxError(Object observer, Throwable failure);
        void rvxComplete(Object observer);
        void rvxDispose(Object disposable);
        boolean rvxDisposed(Object disposable);
    }

    private final Object request;
    private final boolean next;
    private final Object source;

    public PlayerStreamRace(Object request, boolean next, Object source) {
        this.request = request;
        this.next = next;
        this.source = source;
    }

    public void subscribe(Object observer) {
        NativeCalls calls = (NativeCalls) (Object) this;
        calls.rvxSubscribe(source, new Subscription(request, PlayerFallback.ownership(request), next, calls, observer));
    }

    /** Native Observer and Disposable are installed by the same versioned bytecode adapter. */
    public static final class Subscription extends PlaybackStreamState implements PendingPlaybackRequests.Entry {
        private final Object request;
        private final Object ownership;
        private final boolean next;
        private final NativeCalls calls;
        private final Object observer;
        private volatile Object upstream;
        private volatile ListenableFuture<?> local;

        Subscription(Object request, Object ownership, boolean next, NativeCalls calls, Object observer) {
            this.request = request;
            this.ownership = ownership;
            this.next = next;
            this.calls = calls;
            this.observer = observer;
        }

        public void stockSubscribe(Object disposable) {
            upstream = disposable;
            if (disposed()) {
                calls.rvxDispose(disposable);
                return;
            }
            calls.rvxSubscribed(observer, this);
            if (!disposed() && ownership != null) PlaybackConnectivity.watch(this);
        }

        public void stockNext(Object value) {
            if (!stockValue()) return;
            finished();
            calls.rvxNext(observer, value);
        }

        public void stockError(Throwable failure) {
            if (!stockTerminal()) return;
            finished();
            calls.rvxError(observer, failure);
        }

        public void stockComplete() {
            if (!stockTerminal()) return;
            finished();
            calls.rvxComplete(observer);
        }

        private void finished() {
            if (ownership != null) PlaybackConnectivity.finished(this);
        }

        public void dispose() {
            if (!disposeOnce()) return;
            finished();
            ListenableFuture<?> result = local;
            if (result != null) result.cancel(false);
            Object disposable = upstream;
            if (disposable != null) calls.rvxDispose(disposable);
        }

        public boolean isDisposed() {
            if (disposed()) return true;
            Object disposable = upstream;
            return !locallySelected() && disposable != null && calls.rvxDisposed(disposable);
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
            return selectLocal();
        }

        @Override
        public void cancelUnavailable() {
            dispose();
        }

        @Override
        public boolean pending() {
            return pendingResponse();
        }

        @Override
        public boolean recover(PlaybackConnectionLoss loss) {
            if (!selectLocal()) return false;
            ListenableFuture<?> result = PlayerFallback.recoverFuture(request, next, loss);
            local = result;
            if (disposed()) result.cancel(false);
            result.addListener(() -> localCompleted(result), Runnable::run);
            return true;
        }

        private void localCompleted(ListenableFuture<?> result) {
            if (disposed()) return;
            try {
                Object value = result.get();
                if (!localTerminal()) return;
                finished();
                calls.rvxNext(observer, value);
                if (!disposed()) calls.rvxComplete(observer);
                dispose();
            } catch (CancellationException cancelled) {
                dispose();
            } catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
                localError(interrupted);
            } catch (ExecutionException failure) {
                localError(failure.getCause());
            }
        }

        private void localError(Throwable failure) {
            if (!localTerminal()) return;
            finished();
            calls.rvxError(observer, failure);
            dispose();
        }
    }
}
