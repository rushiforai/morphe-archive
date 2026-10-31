package app.morphed.extension.twitch.adblock;

import app.morphed.extension.twitch.hls.MasterPlaylist;
import app.morphed.extension.twitch.hls.PlaylistStitcher;
import app.morphed.extension.twitch.hls.UrlKey;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * State for one loaded live stream: its qualities, the stitched playlists, and the backup in use.
 * <p>
 * Playlist handling holds the session's lock; the backup search does not (it can take seconds), so
 * everything the search touches is thread safe and only one search runs per stream at a time.
 */
final class StreamSession {
    /** Break state of one quality: the player can switch quality, or be moved, in the middle of a break. */
    static final class QualityState {
        /** Ad segments of this quality are being replaced or cut out. */
        boolean swappingAds;
        /** Polls in a row without ad segments while swapping; the break ends at two. */
        int cleanPolls;
    }

    final String channel;
    /** Usher master playlist URL the app requested; backups reuse its parameters. */
    final String masterUrl;
    final MasterPlaylist master;

    final Map<String, PlaylistStitcher> stitchers = new HashMap<>();
    final Map<String, QualityState> qualities = new HashMap<>();
    /** Backup master playlist per player type, reused until it turns out stale. */
    final Map<String, String> backupMasters = new ConcurrentHashMap<>();
    /** Backup chosen per quality for the current ad break. */
    final Map<String, BackupStreamFinder.Result> backupResults = new ConcurrentHashMap<>();
    final Map<String, Long> failedPlayerTypes = new ConcurrentHashMap<>();
    final AtomicBoolean searching = new AtomicBoolean();
    /** When a search last found no ad-free player type; searches pause for a while after. */
    volatile long lastEmptySearchAt = Long.MIN_VALUE / 2;

    /** The playlist carries ad markers (with or without ad segments). */
    boolean inAdBreak;
    volatile long lastSeen;
    /** The quality (master playlist URL) polled most recently. */
    volatile String lastVariantUrl;
    /** Playlist URLs Twitch moved a quality to, mapped to that quality's master playlist URL. */
    final Map<String, String> aliases = new ConcurrentHashMap<>();

    StreamSession(String channel, String masterUrl, MasterPlaylist master, long now) {
        this.channel = channel;
        this.masterUrl = masterUrl;
        this.master = master;
        this.lastSeen = now;
    }

    /** The master playlist URL of the quality {@code url} belongs to. */
    String variantUrlFor(String url) {
        String alias = aliases.get(UrlKey.of(url));
        return alias != null ? alias : url;
    }

    PlaylistStitcher stitcherFor(String url) {
        // A moved playlist continues the same stitched stream.
        String key = UrlKey.of(variantUrlFor(url));
        PlaylistStitcher stitcher = stitchers.get(key);
        if (stitcher == null) {
            stitcher = new PlaylistStitcher();
            stitchers.put(key, stitcher);
        }
        return stitcher;
    }

    QualityState qualityFor(String url) {
        String key = UrlKey.of(variantUrlFor(url));
        QualityState state = qualities.get(key);
        if (state == null) {
            state = new QualityState();
            qualities.put(key, state);
        }
        return state;
    }

    /** The break of the quality {@code url} belongs to is over. */
    void endAdSwap(String url) {
        String key = UrlKey.of(variantUrlFor(url));
        QualityState state = qualityFor(url);
        state.swappingAds = false;
        state.cleanPolls = 0;
        backupResults.remove(key);
        for (QualityState other : qualities.values()) {
            if (other.swappingAds) return;
        }
        // No quality is in a break any more: the next one starts with a fresh search.
        failedPlayerTypes.clear();
        lastEmptySearchAt = Long.MIN_VALUE / 2;
    }
}
