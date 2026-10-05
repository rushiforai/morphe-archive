package dev.twitchpatches.extension.channelpoints;

import java.lang.ref.WeakReference;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;

public final class PlaybackClaims {
    private static final long RETRY_MS = 30_000;
    private static final int MAX_ATTEMPTS = 3;
    private static final int MAX_CLAIMS = 64;
    private WeakReference<Object> player = new WeakReference<>(null);
    private Object channel;
    private boolean playing;
    private final Map<String, Attempt> attempts = new LinkedHashMap<>();

    public synchronized void configure(Object owner, Object channelId, boolean live) {
        if (owner == null) return;
        if (!live || channelId == null) {
            player = new WeakReference<>(null);
            channel = null;
            playing = false;
            attempts.clear();
            return;
        }
        if (player.get() != owner || !Objects.equals(channel, channelId)) {
            attempts.clear();
            playing = false;
        }
        player = new WeakReference<>(owner);
        channel = channelId;
    }

    public synchronized void state(Object owner, boolean isPlaying) {
        if (player.get() == owner) playing = isPlaying;
    }

    public synchronized void release(Object owner) {
        if (player.get() != owner) return;
        player.clear();
        channel = null;
        playing = false;
        attempts.clear();
    }

    public synchronized boolean offer(Object channelId, String claimId, long now, boolean enabled) {
        if (!enabled || player.get() == null || !playing || channel == null
                || !channel.equals(channelId) || claimId == null || claimId.isEmpty()) return false;
        Attempt previous = attempts.get(claimId);
        if (previous != null && (previous.count >= MAX_ATTEMPTS
                || now < previous.time || now - previous.time < RETRY_MS)) return false;
        attempts.put(claimId, new Attempt(now, previous == null ? 1 : previous.count + 1));
        if (attempts.size() > MAX_CLAIMS) attempts.remove(attempts.keySet().iterator().next());
        return true;
    }

    public synchronized String readiness(Object channelId) {
        if (player.get() == null) return "no observed player";
        if (!playing) return "player not playing";
        return channel != null && channel.equals(channelId) ? "matching live channel" : "different player channel";
    }

    private static final class Attempt {
        final long time;
        final int count;
        Attempt(long time, int count) {
            this.time = time;
            this.count = count;
        }
    }
}
