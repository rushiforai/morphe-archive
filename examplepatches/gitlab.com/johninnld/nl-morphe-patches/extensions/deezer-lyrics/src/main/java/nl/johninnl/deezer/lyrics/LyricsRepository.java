package nl.johninnl.deezer.lyrics;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.function.LongSupplier;

/** Serial, coalesced lookups. Cancellation and native track identity guard every delivery. */
public final class LyricsRepository implements AutoCloseable {
    public interface Listener {
        boolean isCurrent();
        void found(LyricsPayload payload);
        void missing();
    }
    public interface Request { void cancel(); }
    interface Fetcher { LrclibClient.Result fetch(TrackSignature signature); }
    private static final int MAX_PENDING = 16;
    private final ScheduledThreadPoolExecutor worker;
    private final Fetcher fetcher;
    private final LongSupplier clock;
    private final LyricsStore cache = new LyricsStore();
    private final LinkedHashMap<TrackSignature, Work> pending = new LinkedHashMap<>();
    private boolean scheduled, closed;

    private final class Subscription implements Request {
        private Listener listener;
        Subscription(Listener listener) { this.listener = listener; }
        @Override public synchronized void cancel() { listener = null; }
        synchronized boolean alive() { return listener != null; }
        boolean current() {
            Listener target;
            synchronized (this) { target = listener; }
            return target != null && target.isCurrent();
        }
        void deliver(LyricsPayload payload) {
            Listener target;
            synchronized (this) { target = listener; listener = null; }
            if (target == null || !target.isCurrent()) return;
            if (payload == null) target.missing(); else target.found(payload);
        }
    }
    private final class Work {
        final TrackSignature signature;
        final LyricsStore.Ticket ticket;
        final List<Subscription> subscriptions = new ArrayList<>();
        int attempts;
        Work(TrackSignature signature, LyricsStore.Ticket ticket) { this.signature = signature; this.ticket = ticket; }
    }

    public LyricsRepository() {
        this(new LrclibClient()::fetch, android.os.SystemClock::elapsedRealtime);
    }

    LyricsRepository(Fetcher fetcher, LongSupplier clock) {
        this.fetcher = fetcher;
        this.clock = clock;
        worker = new ScheduledThreadPoolExecutor(1, task -> {
            Thread thread = new Thread(task, "Deezer-LRCLIB");
            thread.setDaemon(true);
            return thread;
        });
        worker.setRemoveOnCancelPolicy(true);
        worker.setExecuteExistingDelayedTasksAfterShutdownPolicy(false);
    }

    public Request lookup(TrackSignature signature, Listener listener) {
        if (signature == null || listener == null) throw new IllegalArgumentException("Incomplete lyric lookup");
        Subscription subscription = new Subscription(listener);
        synchronized (this) {
            if (closed) { subscription.cancel(); return subscription; }
            Work existing = pending.get(signature);
            if (existing != null) {
                existing.subscriptions.add(subscription);
                return subscription;
            }
            if (pending.size() >= MAX_PENDING) {
                // Never accumulate a library scan. Stale screen subscriptions are discarded first.
                prune();
                if (pending.size() >= MAX_PENDING) {
                    worker.execute(() -> subscription.deliver(null));
                    return subscription;
                }
            }
            LyricsStore.Ticket ticket = cache.select(signature, false);
            Work work = new Work(signature, ticket);
            work.subscriptions.add(subscription);
            pending.put(signature, work);
            schedule(0);
        }
        return subscription;
    }

    public synchronized LyricsPayload cached(TrackSignature signature) {
        if (signature == null || closed) return null;
        cache.select(signature, false);
        return cache.snapshot(clock.getAsLong()).payload;
    }

    private synchronized void prune() {
        pending.values().removeIf(work -> {
            work.subscriptions.removeIf(s -> !s.alive());
            return work.subscriptions.isEmpty();
        });
    }

    private synchronized void schedule(long delay) {
        if (closed || scheduled) return;
        scheduled = true;
        worker.schedule(this::runOne, Math.max(0, delay), TimeUnit.MILLISECONDS);
    }

    private void runOne() {
        Work work;
        LyricsStore.Snapshot snapshot;
        synchronized (this) {
            scheduled = false;
            if (closed) return;
            prune();
            if (pending.isEmpty()) return;
            work = pending.values().iterator().next();
            // A native observer owns its immutable signature; a different screen can look up
            // another track concurrently without receiving this entry's cached payload.
            cache.select(work.signature, false);
            snapshot = cache.snapshot(clock.getAsLong());
            if (snapshot.availability == LyricsStore.Availability.PENDING) {
                long delay = cache.notBefore() - clock.getAsLong();
                if (delay > 0) { schedule(delay); return; }
                work.attempts++;
            }
        }
        if (snapshot.availability != LyricsStore.Availability.PENDING) {
            finish(work, snapshot.payload);
            return;
        }
        List<Subscription> selected;
        synchronized (this) { selected = new ArrayList<>(work.subscriptions); }
        // A native listener can hold its own UI lock. Never call it under the repository lock.
        if (selected.stream().noneMatch(Subscription::current)) { finish(work, null); return; }
        LrclibClient.Result result;
        try { result = fetcher.fetch(work.signature); }
        catch (Exception failure) { result = LrclibClient.Result.error(); }
        synchronized (this) {
            if (closed) return;
            long now = clock.getAsLong();
            cache.complete(work.ticket, result, now);
            cache.requestFinished(now);
            if (result.status == LrclibClient.Status.RETRY && work.attempts < 2) {
                schedule(Math.max(0, cache.notBefore() - now));
                return;
            }
        }
        finish(work, result.payload);
    }

    private void finish(Work work, LyricsPayload payload) {
        List<Subscription> listeners;
        synchronized (this) {
            if (pending.get(work.signature) != work) return;
            pending.remove(work.signature);
            listeners = new ArrayList<>(work.subscriptions);
            schedule(Math.max(0, cache.notBefore() - clock.getAsLong()));
        }
        for (Subscription subscription : listeners) subscription.deliver(payload);
    }

    @Override public synchronized void close() {
        closed = true;
        for (Work work : pending.values()) for (Subscription subscription : work.subscriptions) subscription.cancel();
        pending.clear();
        worker.shutdownNow();
    }
}
