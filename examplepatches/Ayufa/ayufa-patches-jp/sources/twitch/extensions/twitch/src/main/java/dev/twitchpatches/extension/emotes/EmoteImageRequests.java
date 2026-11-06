package dev.twitchpatches.extension.emotes;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.function.Consumer;

final class EmoteImageRequests implements AutoCloseable {
    static final class Ticket { Future<?> task; }
    private final ThreadPoolExecutor workers;
    private final Map<String, Ticket> pending = new HashMap<>();

    EmoteImageRequests(int threads) {
        workers = new ThreadPoolExecutor(threads, threads, 0, TimeUnit.MILLISECONDS,
                new LinkedBlockingQueue<>(48), task -> {
                    Thread thread = new Thread(task, "TwitchEmoteImages");
                    thread.setDaemon(true);
                    return thread;
                });
    }

    synchronized boolean submit(String url, Consumer<Ticket> load) {
        if (pending.containsKey(url)) return true;
        Ticket ticket = new Ticket();
        pending.put(url, ticket);
        try { ticket.task = workers.submit(() -> load.accept(ticket)); return true; }
        catch (RejectedExecutionException error) { pending.remove(url); return false; }
    }

    synchronized boolean complete(String url, Ticket ticket) {
        if (pending.get(url) != ticket) return false;
        pending.remove(url);
        return true;
    }

    synchronized void retain(Set<String> visible) {
        pending.entrySet().removeIf(entry -> {
            if (visible.contains(entry.getKey())) return false;
            entry.getValue().task.cancel(true);
            return true;
        });
        workers.purge();
    }

    synchronized int size() { return pending.size(); }
    void cancel() { retain(java.util.Collections.emptySet()); }
    @Override public void close() { cancel(); workers.shutdownNow(); }
}
