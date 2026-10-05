package dev.twitchpatches.extension.ads;

import android.util.Log;
import com.amazonaws.ivs.net.HttpClient;
import com.amazonaws.ivs.net.Request;
import dev.twitchpatches.extension.ads.hls.HlsPlaylist;
import dev.twitchpatches.extension.ads.hls.LiveWindow;
import dev.twitchpatches.extension.ads.hls.Variant;
import dev.twitchpatches.extension.ads.hls.MasterIdentity;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

final class PlaylistSessions implements AutoCloseable {
    private final DirectFetch fetch;
    private final Map<String, Session> sessions = new LinkedHashMap<>();
    private boolean closed;
    private long lastUnsupportedLog;
    private boolean unmatchedMediaObserved;
    private long policyRevision = AdRuntime.policyRevision();

    PlaylistSessions(HttpClient original) { fetch = new DirectFetch(original); }

    String transform(Request request, String url, String text, boolean enabled) {
        HlsPlaylist playlist = HlsPlaylist.parse(text, url);
        if (!playlist.supported) {
            unsupported("Unsupported HLS; route=" + MasterIdentity.route(url));
            return text;
        }
        Session session;
        Variant variant;
        synchronized (this) {
            if (closed) return text;
            long revision = AdRuntime.policyRevision();
            if (policyRevision != revision) {
                for (Session candidate : sessions.values()) candidate.suspend();
                policyRevision = revision;
            }
            if (!playlist.variants.isEmpty()) {
                String channel = MasterIdentity.channel(url);
                if (channel == null) {
                    unsupported("Unrecognized live master route; original retained");
                    return text;
                }
                sessions.entrySet().removeIf(entry -> {
                    if (System.nanoTime() - entry.getValue().lastAccess > TimeUnit.MINUTES.toNanos(2)) {
                        entry.getValue().close(); return true;
                    }
                    return false;
                });
                Session previous = sessions.remove(url);
                if (previous != null) previous.close();
                Session created = new Session(channel, url, playlist);
                AdRuntime.masters.register(url, playlist);
                sessions.put(url, created);
                while (sessions.size() > 3) {
                    String oldest = sessions.keySet().iterator().next();
                    sessions.remove(oldest).close();
                }
                Log.i("TwitchPatchesAds", "IVS master playlist observed; route=" + MasterIdentity.route(url));
                Request warmRequest = new Request(url, "GET");
                String agent = request.getHeaders().get("User-Agent");
                if (agent != null) warmRequest.setHeader("User-Agent", agent);
                if (enabled) created.startWarmup(warmRequest);
                return text;
            }
            if (!enabled) {
                for (Session candidate : sessions.values()) candidate.suspend();
                return text;
            }
            session = null; variant = null;
            MasterCatalog.Entry manifest = AdRuntime.masters.find(url);
            for (Session candidate : sessions.values()) {
                Variant match = candidate.variants.get(url);
                if (match != null) { session = candidate; variant = match; break; }
            }
            if (session == null) {
                if (manifest != null) {
                    session = sessions.get(manifest.url);
                    if (session == null) {
                        session = new Session(manifest.channel, manifest.url, manifest.playlist);
                        sessions.put(manifest.url, session);
                        while (sessions.size() > 3) sessions.remove(sessions.keySet().iterator().next()).close();
                        Log.i("TwitchPatchesAds", "IVS media session adopted from master handoff");
                    }
                    variant = session.variants.get(url);
                }
            }
        }
        if (session == null || variant == null || playlist.segments.isEmpty()) {
            if (session == null || variant == null) {
                if (playlist.ads || !unmatchedMediaObserved) {
                    unsupported("Media association missing; ads=" + playlist.ads + "; "
                            + AdRuntime.masters.associationEvidence(request.getUrl(), url));
                    unmatchedMediaObserved = true;
                }
            } else if (playlist.ads) unsupported("Ad media has no playable segments; original retained");
            return text;
        }
        session.lastAccess = System.nanoTime();
        return session.media(request, text, playlist, variant, enabled);
    }

    @Override public synchronized void close() {
        closed = true;
        reset(); fetch.close();
    }

    private synchronized void unsupported(String category) {
        if (System.nanoTime() - lastUnsupportedLog < TimeUnit.SECONDS.toNanos(5)) return;
        lastUnsupportedLog = System.nanoTime();
        Log.i("TwitchPatchesAds", category);
    }

    synchronized void reset() {
        for (Session session : sessions.values()) session.close();
        sessions.clear();
    }

    private final class Session {
        final String channel;
        final String master;
        final Map<String, Variant> variants = new LinkedHashMap<>();
        final Map<String, LiveWindow> lanes = new LinkedHashMap<>();
        BackupSource[] backups = newBackups();
        volatile long lastAccess = System.nanoTime();
        volatile boolean stopped;
        BackupWarmup warmup;
        int nextBackup;
        long lastLog;

        Session(String channel, String master, HlsPlaylist playlist) {
            this.channel = channel; this.master = master;
            for (Variant variant : playlist.variants) variants.put(variant.uri, variant);
        }

        void startWarmup(Request request) {
            Variant best = null;
            for (Variant candidate : variants.values())
                if (best == null || candidate.height > best.height) best = candidate;
            warmup = new BackupWarmup(backups, fetch, channel, master, request);
            if (best != null) warmup.watch(best);
        }

        synchronized String media(Request request, String original, HlsPlaylist primary, Variant variant, boolean enabled) {
            if (stopped || request.isCancelled()) return original;
            if (warmup == null && enabled) {
                Request warmRequest = new Request(master, "GET");
                String agent = request.getHeaders().get("User-Agent");
                if (agent != null) warmRequest.setHeader("User-Agent", agent);
                startWarmup(warmRequest);
            }
            boolean knownLive = primary.segments.stream().allMatch(segment -> segment.liveSequence != null);
            boolean needsReplacement = primary.ads || !knownLive;
            LiveWindow window = lanes.get(variant.uri);
            if (window == null) { window = new LiveWindow(); lanes.put(variant.uri, window); }
            if (warmup != null) warmup.watch(variant);
            window.absorb(primary, "main");
            window.advance(true);
            boolean backupUsed = false;
            if (enabled && needsReplacement) {
                BackupWarmup.Snapshot warm = warmup == null ? null : warmup.snapshot(variant);
                if (warm != null) backupUsed = window.acceptCleanBackup(warm.playlist, warm.source);
                long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(2200);
                try {
                    for (int attempt = 0; !backupUsed && attempt < backups.length && System.nanoTime() < deadline; attempt++) {
                        int index = (nextBackup + attempt) % backups.length;
                        HlsPlaylist backup = backups[index].load(channel, master, variant, false, request, fetch, deadline);
                        if (backup == null || stopped || request.isCancelled()) continue;
                        if (window.acceptCleanBackup(backup, backups[index].playerType)) {
                            backupUsed = true; nextBackup = index; break;
                        }
                    }
                    if (!backupUsed) {
                        List<BackupSource> lower = new ArrayList<>();
                        for (BackupSource source : backups) if (source.lowerRendition(variant) != null) lower.add(source);
                        lower.sort((left, right) -> {
                            Variant a = left.lowerRendition(variant), b = right.lowerRendition(variant);
                            if (a == null || b == null) return 0;
                            int height = Integer.compare(b.height, a.height);
                            return height != 0 ? height : Double.compare(b.frameRate, a.frameRate);
                        });
                        for (BackupSource source : lower) {
                            if (System.nanoTime() >= deadline) break;
                            HlsPlaylist backup = source.load(channel, master, variant, true, request, fetch, deadline);
                            if (backup == null || stopped || request.isCancelled()) continue;
                            if (window.acceptCleanBackup(backup, source.playerType)) { backupUsed = true; break; }
                        }
                    }
                    if (!backupUsed) nextBackup = (nextBackup + 1) % backups.length;
                } catch (InterruptedException exception) { Thread.currentThread().interrupt(); return original; }
            }
            String result = window.finish(primary, backupUsed);
            if (result == null) lanes.remove(variant.uri);
            if (System.nanoTime() - lastLog > TimeUnit.SECONDS.toNanos(15)) {
                Log.i("TwitchPatchesAds", needsReplacement ? (backupUsed ? "Ad replacement playlist accepted; primaryAds=" + primary.ads :
                        "Ad detected; blocking incomplete, original media retained") : "IVS live media playlist observed");
                lastLog = System.nanoTime();
            }
            return result == null ? original : result;
        }

        synchronized void suspend() {
            if (warmup == null && lanes.isEmpty()) return;
            if (warmup != null) { warmup.close(); warmup = null; }
            lanes.clear();
            for (BackupSource backup : backups) backup.close();
            backups = newBackups();
        }

        synchronized void close() {
            stopped = true;
            if (warmup != null) warmup.close();
            for (BackupSource backup : backups) backup.close();
        }
    }

    private static BackupSource[] newBackups() {
        return new BackupSource[] {new BackupSource("mobile_feed"), new BackupSource("popout"), new BackupSource("autoplay")};
    }
}
