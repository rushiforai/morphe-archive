package io.github.sabopura.morphe.extension.twitch.points;

import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import java.util.function.Consumer;
import java.util.function.LongSupplier;

/** Separate scheduling from native access so stale-state and re-entry behavior are testable. */
final class ClaimDispatcher {
    interface Access {
        boolean enabled(Object state);
        Object claim(Object state);
        String status(Object state);
        String id(Object claim);
        void submit(Object presenter, String id);
        /** A submitted claim succeeded; called once per claim, however many attempts it took. */
        void claimed();
    }
    private static final class Pending {
        Object latest;
        boolean queued;
        /** The claim submitted last, until Twitch reports it succeeded. Only posted work touches it. */
        String submitted;
    }
    private final WeakHashMap<Object, Pending> states = new WeakHashMap<>();
    private final ClaimGate gate = new ClaimGate();
    private final Access access;
    private final Consumer<Runnable> post;
    private final LongSupplier clock;
    private final Consumer<Throwable> onError;

    ClaimDispatcher(Access access, Consumer<Runnable> post, LongSupplier clock, Consumer<Throwable> onError) {
        this.access = access;
        this.post = post;
        this.clock = clock;
        this.onError = onError;
    }

    void update(Object viewState, Object presenter) {
        if (presenter == null) return;
        synchronized (states) {
            Pending state = states.get(presenter);
            if (state == null) {
                state = new Pending();
                states.put(presenter, state);
            }
            state.latest = viewState;
            if (state.queued) return;
            state.queued = true;
        }
        WeakReference<Object> owner = new WeakReference<>(presenter);
        post.accept(() -> claimLatest(owner));
    }

    private void claimLatest(WeakReference<Object> owner) {
        Object presenter = owner.get();
        if (presenter == null) return;
        Pending state;
        Object viewState;
        synchronized (states) {
            state = states.get(presenter);
            if (state == null) return;
            state.queued = false;
            viewState = state.latest;
        }
        try {
            if (!access.enabled(viewState)) return;
            String status = access.status(viewState);
            if ("SUCCESS".equals(status)) {
                if (state.submitted == null) return;
                state.submitted = null;
                access.claimed();
                return;
            }
            Object claim = access.claim(viewState);
            if (claim == null) return;
            String id = access.id(claim);
            if (!gate.acquire(id, status, clock.getAsLong())) return;
            access.submit(presenter, id);
            state.submitted = id;
        } catch (RuntimeException | LinkageError failure) {
            onError.accept(failure);
        }
    }
}
