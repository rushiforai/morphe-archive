package dev.twitchpatches.extension.ads;

import com.amazonaws.ivs.net.Request;
import dev.twitchpatches.extension.ads.hls.HlsPlaylist;
import dev.twitchpatches.extension.ads.hls.Variant;
import dev.twitchpatches.extension.ads.hls.MasterIdentity;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;

final class BackupSource {
    final String playerType;
    private volatile List<Variant> variants;
    private final ReentrantLock loading = new ReentrantLock();
    private long expires;
    private long retryAfter;
    private volatile TokenResult pending;
    private volatile boolean closed;
    private long lastDiagnostic;

    BackupSource(String playerType) { this.playerType = playerType; }

    HlsPlaylist load(String channel, String originalMaster, Variant original, boolean lower,
            Request parent, DirectFetch fetch, long deadline) throws InterruptedException {
        long remaining = deadline - System.nanoTime();
        if (remaining <= 0 || !loading.tryLock(Math.min(remaining, TimeUnit.MILLISECONDS.toNanos(50)), TimeUnit.NANOSECONDS)) return null;
        try { return loadOwned(channel, originalMaster, original, lower, parent, fetch, deadline); }
        finally { loading.unlock(); }
    }

    private HlsPlaylist loadOwned(String channel, String originalMaster, Variant original, boolean lower,
            Request parent, DirectFetch fetch, long deadline) throws InterruptedException {
        if (closed || System.nanoTime() < retryAfter || System.nanoTime() >= deadline) return null;
        if (variants == null || System.nanoTime() >= expires) {
            TokenResult request = AdRuntime.requestToken(channel, playerType);
            pending = request;
            TokenResult.Token token;
            try { token = request.await(Math.max(1, Math.min(1200,
                    TimeUnit.NANOSECONDS.toMillis(deadline - System.nanoTime()))),
                    () -> !closed && !parent.isCancelled() && AdSettings.enabled(2)); }
            finally { pending = null; }
            if (closed || token == null || parent.isCancelled()) { diagnose("token unavailable"); coolDown(); return null; }
            String url = MasterIdentity.replaceToken(originalMaster, token.signature, token.value);
            String text = fetch.playlist(url, parent, deadline);
            if (text == null) { diagnose("master fetch failed"); coolDown(); return null; }
            HlsPlaylist parsed = HlsPlaylist.parse(text, url);
            if (!parsed.supported || parsed.variants.isEmpty()) { diagnose("unsupported master"); coolDown(); return null; }
            variants = parsed.variants;
            expires = System.nanoTime() + TimeUnit.MINUTES.toNanos(2);
        }
        Variant rendition = Variant.match(variants, original, lower);
        if (rendition == null) { diagnose("compatible rendition unavailable"); return null; }
        String text = fetch.playlist(rendition.uri, parent, deadline);
        if (text == null) { diagnose("media fetch failed"); variants = null; coolDown(); return null; }
        HlsPlaylist playlist = HlsPlaylist.parse(text, rendition.uri);
        if (!playlist.supported || playlist.ads || playlist.segments.isEmpty() ||
                playlist.segments.stream().anyMatch(segment -> segment.liveSequence == null)) {
            diagnose(!playlist.supported ? "unsupported media" : playlist.ads ? "backup contains ads" : "live sequence unavailable");
            coolDown(); return null;
        }
        return playlist;
    }

    private void coolDown() { retryAfter = System.nanoTime() + TimeUnit.SECONDS.toNanos(3); }

    private void diagnose(String category) {
        if (System.nanoTime() - lastDiagnostic < TimeUnit.SECONDS.toNanos(5)) return;
        android.util.Log.i("TwitchPatchesAds", "Alternate " + playerType + ": " + category);
        lastDiagnostic = System.nanoTime();
    }

    Variant lowerRendition(Variant original) {
        List<Variant> cached = variants;
        return cached == null || closed ? null : Variant.match(cached, original, true);
    }

    void close() {
        closed = true;
        TokenResult request = pending;
        if (request != null) request.cancel();
    }
}
