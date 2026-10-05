package dev.twitchpatches.extension.ads;

import com.amazonaws.ivs.net.Request;
import dev.twitchpatches.extension.ads.hls.HlsPlaylist;
import dev.twitchpatches.extension.ads.hls.Variant;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

final class BackupWarmup implements AutoCloseable {
    static final class Snapshot {
        final HlsPlaylist playlist;
        final String source;
        final long observed = System.nanoTime();
        Snapshot(HlsPlaylist playlist, String source) { this.playlist = playlist; this.source = source; }
    }
    private final ScheduledThreadPoolExecutor worker = new ScheduledThreadPoolExecutor(1,
            task -> new Thread(task, "TwitchPatchWarmPlaylist"));
    private final BackupSource[] sources;
    private final DirectFetch fetch;
    private final String channel;
    private final String master;
    private final Request request;
    private final Map<String, Snapshot> snapshots = new LinkedHashMap<>();
    private volatile Variant requested;
    private volatile long lastWatch;
    private volatile boolean closed;
    private int preferred;

    BackupWarmup(BackupSource[] sources, DirectFetch fetch, String channel, String master, Request request) {
        this.sources = sources; this.fetch = fetch; this.channel = channel; this.master = master; this.request = request;
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
        if (closed || variant == null || !AdSettings.enabled(2) ||
                System.nanoTime() - lastWatch > TimeUnit.SECONDS.toNanos(12)) return;
        long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(1800);
        try {
            for (int attempt = 0; attempt < sources.length && System.nanoTime() < deadline; attempt++) {
                int index = (preferred + attempt) % sources.length;
                HlsPlaylist playlist = sources[index].load(channel, master, variant, false, request, fetch, deadline);
                if (playlist == null || closed) continue;
                synchronized (this) {
                    snapshots.put(variant.uri, new Snapshot(playlist, sources[index].playerType));
                    while (snapshots.size() > 3) snapshots.remove(snapshots.keySet().iterator().next());
                }
                preferred = index;
                return;
            }
            preferred = (preferred + 1) % sources.length;
        } catch (InterruptedException exception) { Thread.currentThread().interrupt(); }
    }

    @Override public void close() { closed = true; request.cancel(); worker.shutdownNow(); synchronized (this) { snapshots.clear(); } }
}
