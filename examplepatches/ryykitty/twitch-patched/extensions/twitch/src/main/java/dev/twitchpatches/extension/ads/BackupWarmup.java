package dev.twitchpatches.extension.ads;

import com.amazonaws.ivs.net.Request;
import dev.twitchpatches.extension.ads.hls.HlsPlaylist;
import dev.twitchpatches.extension.ads.hls.Variant;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.function.BooleanSupplier;

final class BackupWarmup implements AutoCloseable {
    static final class Snapshot {
        final HlsPlaylist playlist;
        final String source;
        final long observed = System.nanoTime();
        Snapshot(HlsPlaylist playlist, String source) { this.playlist = playlist; this.source = source; }
    }
    interface Loader {
        Snapshot load(Variant variant, long deadline) throws InterruptedException;
    }
    private final ScheduledThreadPoolExecutor worker = new ScheduledThreadPoolExecutor(1,
            task -> new Thread(task, "TwitchPatchWarmPlaylist"));
    private final Loader loader;
    private final BooleanSupplier enabled;
    private final Runnable cancel;
    private final Map<String, Snapshot> snapshots = new LinkedHashMap<>();
    private volatile Variant requested;
    private volatile long lastWatch;
    private volatile boolean closed;

    BackupWarmup(BackupSource[] sources, DirectFetch fetch, String channel, String master, Request request,
            Variant initial) {
        this(initial, new SourceLoader(sources, fetch, channel, master, request),
                () -> AdSettings.enabled(2), request::cancel);
    }

    BackupWarmup(Variant initial, Loader loader, BooleanSupplier enabled, Runnable cancel) {
        this.loader = loader; this.enabled = enabled; this.cancel = cancel;
        requested = initial;
        lastWatch = System.nanoTime();
        worker.setRemoveOnCancelPolicy(true);
        worker.scheduleWithFixedDelay(this::poll, 0, 2, TimeUnit.SECONDS);
    }

    void watch(Variant variant) { requested = variant; lastWatch = System.nanoTime(); }

    synchronized Snapshot snapshot(Variant variant) {
        Snapshot found = snapshots.get(variant.uri);
        return closed || found == null || System.nanoTime() - found.observed > TimeUnit.SECONDS.toNanos(8) ? null : found;
    }

    private void poll() {
        Variant variant = requested;
        if (closed || variant == null || !enabled.getAsBoolean() ||
                System.nanoTime() - lastWatch > TimeUnit.SECONDS.toNanos(12)) return;
        long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(1800);
        try {
            Snapshot snapshot = loader.load(variant, deadline);
            synchronized (this) {
                if (closed || snapshot == null) return;
                snapshots.put(variant.uri, snapshot);
                while (snapshots.size() > 3) snapshots.remove(snapshots.keySet().iterator().next());
            }
        } catch (InterruptedException exception) { Thread.currentThread().interrupt(); }
    }

    @Override public void close() {
        closed = true;
        cancel.run();
        worker.shutdownNow();
        synchronized (this) { snapshots.clear(); }
    }

    private static final class SourceLoader implements Loader {
        private final BackupSource[] sources;
        private final DirectFetch fetch;
        private final String channel;
        private final String master;
        private final Request request;
        private int preferred;

        SourceLoader(BackupSource[] sources, DirectFetch fetch, String channel, String master, Request request) {
            this.sources = sources; this.fetch = fetch; this.channel = channel; this.master = master; this.request = request;
        }

        @Override public Snapshot load(Variant variant, long deadline) throws InterruptedException {
            for (int attempt = 0; attempt < sources.length && System.nanoTime() < deadline; attempt++) {
                int index = (preferred + attempt) % sources.length;
                HlsPlaylist playlist = sources[index].load(channel, master, variant, false, request, fetch, deadline);
                if (playlist == null) continue;
                preferred = index;
                return new Snapshot(playlist, sources[index].playerType);
            }
            preferred = (preferred + 1) % sources.length;
            return null;
        }
    }
}
