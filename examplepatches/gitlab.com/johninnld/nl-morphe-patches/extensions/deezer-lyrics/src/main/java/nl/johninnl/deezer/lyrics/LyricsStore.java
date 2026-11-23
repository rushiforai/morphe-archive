package nl.johninnl.deezer.lyrics;

import java.util.LinkedHashMap;
import java.util.Map;

/** Bounded metadata-specific cache and current-track ownership, independent of Android UI. */
public final class LyricsStore {
    public enum Availability { NATIVE, PENDING, FALLBACK, MISSING }
    public static final class Ticket {
        public final TrackSignature track;
        final long generation;
        Ticket(TrackSignature track, long generation) { this.track = track; this.generation = generation; }
    }
    public static final class Snapshot {
        public final Availability availability;
        public final LyricsPayload payload;
        Snapshot(Availability availability, LyricsPayload payload) { this.availability = availability; this.payload = payload; }
    }
    private static final class Cached {
        final LyricsPayload payload;
        final long expires;
        Cached(LyricsPayload payload, long expires) { this.payload = payload; this.expires = expires; }
    }
    private static final long POSITIVE_TTL = 24 * 60 * 60 * 1000L, NEGATIVE_TTL = 15 * 60 * 1000L;
    private final int capacity;
    private final LinkedHashMap<TrackSignature, Cached> cache = new LinkedHashMap<>(32, 0.75f, true);
    private TrackSignature current;
    private boolean nativeAvailable;
    private long generation, notBefore;

    public LyricsStore() { this(32); }
    LyricsStore(int capacity) {
        if (capacity < 1 || capacity > 128) throw new IllegalArgumentException("Invalid lyrics cache size");
        this.capacity = capacity;
    }

    public synchronized Ticket select(TrackSignature track, boolean hasNativeLyrics) {
        if (track == null) { clearSelection(); return null; }
        if (!track.equals(current) || nativeAvailable != hasNativeLyrics) generation++;
        current = track;
        nativeAvailable = hasNativeLyrics;
        return new Ticket(track, generation);
    }

    public synchronized void clearSelection() { current = null; nativeAvailable = false; generation++; }

    public synchronized boolean owns(Ticket ticket) {
        return ticket != null && current != null && ticket.generation == generation && ticket.track.equals(current);
    }

    public synchronized Snapshot snapshot(long monotonicMs) {
        if (current == null) return new Snapshot(Availability.MISSING, null);
        if (nativeAvailable) return new Snapshot(Availability.NATIVE, null);
        Cached entry = cache.get(current);
        if (entry == null) return new Snapshot(Availability.PENDING, null);
        if (entry.expires <= monotonicMs) { cache.remove(current); return new Snapshot(Availability.PENDING, null); }
        return new Snapshot(entry.payload == null ? Availability.MISSING : Availability.FALLBACK, entry.payload);
    }

    public synchronized boolean needsLookup(Ticket ticket, long monotonicMs) {
        return owns(ticket) && snapshot(monotonicMs).availability == Availability.PENDING && monotonicMs >= notBefore;
    }

    public synchronized long notBefore() { return notBefore; }

    /** Call on the serialized network worker. Every request is separated by at least 350ms. */
    public synchronized void requestFinished(long monotonicMs) { notBefore = Math.max(notBefore, add(monotonicMs, 350)); }

    public synchronized boolean complete(Ticket ticket, LrclibClient.Result result, long monotonicMs) {
        if (ticket == null || result == null) return false;
        if (result.status == LrclibClient.Status.RETRY) {
            // Rate limits apply to the client even when the track changed during the request.
            notBefore = Math.max(notBefore, add(monotonicMs, result.retryDelayMs));
        } else {
            long ttl = result.status == LrclibClient.Status.FOUND ? POSITIVE_TTL :
                    result.status == LrclibClient.Status.MISSING ? NEGATIVE_TTL : 30000;
            cache.put(ticket.track, new Cached(result.payload, add(monotonicMs, ttl)));
            while (cache.size() > capacity) {
                Map.Entry<TrackSignature, Cached> first = cache.entrySet().iterator().next();
                cache.remove(first.getKey());
            }
        }
        return owns(ticket) && !nativeAvailable;
    }

    private static long add(long a, long b) { return a > Long.MAX_VALUE - b ? Long.MAX_VALUE : a + b; }
}
