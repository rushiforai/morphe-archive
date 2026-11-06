package dev.twitchpatches.extension.ads;

import dev.twitchpatches.extension.ads.hls.HlsPlaylist;
import dev.twitchpatches.extension.ads.hls.MasterIdentity;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.function.LongSupplier;

final class MasterCatalog {
    static final class Entry {
        final String channel;
        final String url;
        final HlsPlaylist playlist;
        long touched;

        Entry(String channel, String url, HlsPlaylist playlist, long touched) {
            this.channel = channel; this.url = url; this.playlist = playlist; this.touched = touched;
        }
    }

    private final Map<String, Entry> entries = new LinkedHashMap<>();
    private final LongSupplier clock;
    private static final long TTL = TimeUnit.MINUTES.toNanos(2);

    MasterCatalog() { this(System::nanoTime); }
    MasterCatalog(LongSupplier clock) { this.clock = clock; }

    synchronized void register(String url, HlsPlaylist playlist) {
        expire();
        String channel = MasterIdentity.channel(url);
        if (channel == null || !playlist.supported || playlist.variants.isEmpty()) return;
        entries.remove(url);
        entries.put(url, new Entry(channel, url, playlist, clock.getAsLong()));
        while (entries.size() > 32) entries.remove(entries.keySet().iterator().next());
    }

    synchronized Entry find(String mediaUrl) {
        expire();
        Entry found = null;
        for (Entry entry : entries.values()) {
            if (entry.playlist.variants.stream().noneMatch(variant -> variant.uri.equals(mediaUrl))) continue;
            // Shared rendition URLs cannot identify a unique channel.
            if (found != null && !found.channel.equals(entry.channel)) return null;
            found = entry;
        }
        if (found != null) found.touched = clock.getAsLong();
        return found;
    }

    synchronized String associationEvidence(String requestUrl, String responseUrl) {
        expire();
        MediaAssociationEvidence evidence = new MediaAssociationEvidence(requestUrl, responseUrl);
        for (Entry entry : entries.values()) evidence.observe(entry.playlist);
        return evidence.summary();
    }

    private void expire() {
        long now = clock.getAsLong();
        entries.entrySet().removeIf(entry -> now - entry.getValue().touched > TTL);
    }
}
