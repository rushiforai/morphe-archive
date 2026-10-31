package app.morphed.extension.twitch.adblock;

import app.morphed.extension.twitch.hls.AdMarkers;
import app.morphed.extension.twitch.hls.MasterPlaylist;
import app.morphed.extension.twitch.hls.MediaPlaylist;
import app.morphed.extension.twitch.hls.PlaylistStitcher;
import app.morphed.extension.twitch.hls.UrlKey;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.LongSupplier;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Rewrites the live playlists the player downloads so it never receives ad segments.
 * <ul>
 *     <li>Master playlist: remembered so each quality can be matched to a backup later.</li>
 *     <li>Media playlist without ads: passed through.</li>
 *     <li>Ad markers only (client side ad): markers removed so the app does not start the ad.</li>
 *     <li>Ad segments (stitched ad): replaced by a clean backup playlist; if none exists the ad
 *     segments are cut out and the player waits for live content.</li>
 * </ul>
 */
public final class AdBlocker {
    private static final Pattern CHANNEL = Pattern.compile("/channel/hls/([^/?]+)\\.m3u8");
    private static final long SESSION_MAX_IDLE_MS = 30 * 60 * 1000;
    private static final long REASSIGNMENT_WINDOW_MS = 30 * 1000;
    /**
     * A playing stream refreshes its playlist about every 2 seconds. Only when it has been quiet
     * longer than that can a new playlist URL be the same stream moved to another server.
     */
    private static final long MOVED_GAP_MS = 2_500;
    private static final int MAX_PREVIEW_VARIANTS = 500;
    private static final Pattern TOKEN_PARAMETER = Pattern.compile("[?&]token=([^&]+)");
    private static final Pattern PLAYER_TYPE = Pattern.compile("\"player_type\"\\s*:\\s*\"([^\"]+)\"");

    /** Follows ad breaks, for the on-screen notice and the post-break player refresh. */
    public interface BreakListener {
        BreakListener NONE = new BreakListener() {
            @Override
            public void onBlocking(String quality) {
            }

            @Override
            public void onBreakOver() {
            }
        };

        /**
         * Called on every playlist poll that has ad segments.
         *
         * @param quality the backup quality shown instead of the ad, like {@code 360p}, or null
         *                while the ad segments are cut out
         */
        void onBlocking(String quality);

        /** The ad segments are gone and the original stream plays again; the player may need a refresh. */
        void onBreakOver();
    }

    private final BackupStreamFinder backups;
    private final Logger logger;
    private final LongSupplier clock;
    private final BreakListener breaks;
    private final Problem.Reporter problems;
    private final Map<String, StreamSession> sessionsByVariant = new ConcurrentHashMap<>();
    private final Set<String> previewVariants = ConcurrentHashMap.newKeySet();

    public AdBlocker(BackupStreamFinder backups, Logger logger, LongSupplier clock,
                     BreakListener breaks, Problem.Reporter problems) {
        this.backups = backups;
        this.logger = logger;
        this.clock = clock;
        this.breaks = breaks;
        this.problems = problems;
    }

    /**
     * A live usher playlist this blocker does not recognise, which means Twitch changed its usher
     * paths and streams bypass the ad blocker.
     */
    public boolean isUnrecognizedLivePlaylist(String url) {
        if (url == null || shouldInspect(url)) return false;
        String path = UrlKey.of(url);
        return path.contains("usher.") && path.endsWith(".m3u8")
                && !path.contains("/vod/") && !url.contains("picture-by-picture");
    }

    /** Called for requests that are not inspected, to notice playlists that slip past. */
    public void checkRequest(String url) {
        if (isUnrecognizedLivePlaylist(url)) problems.report(Problem.UNRECOGNIZED_PLAYLIST, UrlKey.of(url));
    }

    public boolean isMasterPlaylist(String url) {
        return url.contains("usher.ttvnw.net") && CHANNEL.matcher(url).find() && !url.contains("picture-by-picture");
    }

    public boolean isKnownMediaPlaylist(String url) {
        return sessionsByVariant.containsKey(UrlKey.of(url));
    }

    /** A quality of a stream preview, which is left alone. */
    boolean isPreviewPlaylist(String url) {
        return previewVariants.contains(UrlKey.of(url));
    }

    /**
     * The player type in the access token of an usher URL, such as {@code mobile-feed}, or null.
     * The token is URL encoded JSON in the {@code token} parameter.
     */
    static String tokenPlayerType(String usherUrl) {
        Matcher token = TOKEN_PARAMETER.matcher(usherUrl);
        if (!token.find()) return null;
        String json;
        try {
            json = URLDecoder.decode(token.group(1), "UTF-8");
        } catch (UnsupportedEncodingException | IllegalArgumentException e) {
            return null;
        }
        Matcher playerType = PLAYER_TYPE.matcher(json);
        return playerType.find() ? playerType.group(1) : null;
    }

    /** Stream previews (the home feed thumbnails that play) request their token as a feed player. */
    static boolean isPreview(String usherUrl) {
        String playerType = tokenPlayerType(usherUrl);
        return playerType != null && playerType.contains("feed");
    }

    /**
     * A live media playlist on Twitch's playlist servers, known or not: video-weaver hosts, and
     * since 2026 hosts like {@code euc11.playlist.ttvnw.net/v1/playlist/...}.
     */
    static boolean isLiveMediaPlaylist(String url) {
        String path = UrlKey.of(url);
        if (!path.endsWith(".m3u8")) return false;
        return path.contains("video-weaver.") || path.contains(".playlist.ttvnw.net/") || path.contains("/v1/playlist/");
    }

    public boolean shouldInspect(String url) {
        if (url == null || isPreviewPlaylist(url)) return false;
        return isMasterPlaylist(url) || isKnownMediaPlaylist(url) || isLiveMediaPlaylist(url);
    }

    /** Returns the playlist to hand to the player in place of {@code body}. */
    public String process(String url, String body) {
        if (isMasterPlaylist(url)) {
            onMasterPlaylist(url, body);
            return body;
        }
        StreamSession session = sessionsByVariant.get(UrlKey.of(url));
        if (session != null) return onMediaPlaylist(session, url, body);
        if (!isLiveMediaPlaylist(url)) return body;

        long now = clock.getAsLong();
        StreamSession latest = latestSession(now);
        if (latest == null) {
            // A live playlist with no stream it could belong to: Twitch changed how streams are loaded.
            problems.report(Problem.UNRECOGNIZED_PLAYLIST, UrlKey.of(url));
            return body;
        }
        if (now - latest.lastSeen < MOVED_GAP_MS) {
            // That stream is still being polled at its own URL, so this playlist belongs to another
            // player (for example a preview): leave it alone.
            logger.log("Leaving unrelated playlist alone: " + UrlKey.of(url));
            return body;
        }
        // Only the same stream shares segments with it; anything else (picture-by-picture, a preview
        // that was not recognised) must not mix its segments and ads into the stream being watched.
        boolean sameStream;
        synchronized (latest) {
            sameStream = latest.stitcherFor(latest.lastVariantUrl).recognises(MediaPlaylist.parse(body, url));
        }
        if (!sameStream) {
            logger.log("Leaving unrelated playlist alone (no shared segments): " + UrlKey.of(url));
            return body;
        }
        return onMediaPlaylist(adoptMovedPlaylist(latest, url), url, body);
    }

    /** The stream polled most recently within the reassignment window, or null. */
    private StreamSession latestSession(long now) {
        StreamSession latest = null;
        for (StreamSession session : sessionsByVariant.values()) {
            if (session.lastVariantUrl == null || now - session.lastSeen > REASSIGNMENT_WINDOW_MS) continue;
            if (latest == null || session.lastSeen > latest.lastSeen) latest = session;
        }
        return latest;
    }

    /**
     * Twitch can move a running stream to another playlist server. The new URL is not in the master
     * playlist, so it is attached to the quality that was playing, once that one has stopped being polled.
     */
    private StreamSession adoptMovedPlaylist(StreamSession latest, String url) {
        synchronized (latest) {
            latest.aliases.put(UrlKey.of(url), latest.lastVariantUrl);
        }
        sessionsByVariant.put(UrlKey.of(url), latest);
        logger.log("Playlist moved to " + UrlKey.of(url));
        return latest;
    }

    private void onMasterPlaylist(String url, String body) {
        Matcher matcher = CHANNEL.matcher(url);
        if (!matcher.find()) return;

        long now = clock.getAsLong();
        forgetIdleSessions(now);

        String channel = matcher.group(1).toLowerCase();
        MasterPlaylist master = MasterPlaylist.parse(body);
        if (isPreview(url)) {
            // Previews have no ads to block; remember their qualities only to leave them alone.
            if (previewVariants.size() > MAX_PREVIEW_VARIANTS) previewVariants.clear();
            for (MasterPlaylist.Variant variant : master.variants) previewVariants.add(UrlKey.of(variant.url));
            logger.log("Ignoring preview of " + channel);
            return;
        }
        StreamSession session = new StreamSession(channel, url, master, now);
        for (MasterPlaylist.Variant variant : master.variants) {
            sessionsByVariant.put(UrlKey.of(variant.url), session);
        }
        StringBuilder qualities = new StringBuilder();
        for (MasterPlaylist.Variant variant : master.variants) {
            if (qualities.length() > 0) qualities.append(", ");
            qualities.append(variant.resolution == null ? "audio" : variant.resolution).append(' ').append(variant.codecs);
        }
        logger.log("Watching " + channel + " as " + tokenPlayerType(url) + ": " + qualities);
    }

    private String onMediaPlaylist(StreamSession session, String url, String body) {
        MediaPlaylist playlist = MediaPlaylist.parse(body, url);

        // The search can take seconds, so it runs without the session lock: a retry of a timed out
        // request must not queue up behind it. One search per stream at a time; a poll arriving
        // during one cuts the ad out instead of starting another.
        BackupStreamFinder.Result backup = null;
        String searchNote = "";
        if (playlist.hasAdSegments()) {
            MasterPlaylist.Variant variant = session.master.byUrl(session.variantUrlFor(url));
            if (variant == null) {
                searchNote = " (quality unknown)";
            } else if (!session.searching.compareAndSet(false, true)) {
                searchNote = " (another search is running)";
            } else {
                long searchStart = clock.getAsLong();
                try {
                    backup = backups.find(session, variant);
                } finally {
                    session.searching.set(false);
                }
                searchNote = " (searched " + (clock.getAsLong() - searchStart) + "ms)";
            }
        }

        long waitStart = clock.getAsLong();
        synchronized (session) {
            long waited = clock.getAsLong() - waitStart;
            if (waited > 100) logger.log("Waited " + waited + "ms for " + session.channel + " (another playlist was being handled)");
            return handleMediaPlaylist(session, url, body, playlist, backup, searchNote);
        }
    }

    /** Called with the session locked. */
    private String handleMediaPlaylist(StreamSession session, String url, String body, MediaPlaylist playlist,
                                       BackupStreamFinder.Result backup, String searchNote) {
        session.lastSeen = clock.getAsLong();
        session.lastVariantUrl = session.variantUrlFor(url);
        PlaylistStitcher stitcher = session.stitcherFor(url);
        StreamSession.QualityState quality = session.qualityFor(url);
        logger.log(pollSummary(session, url, playlist, quality));

        if (!playlist.hasAds()) {
            Set<String> suspicious = AdMarkers.suspiciousMarkers(body);
            if (!suspicious.isEmpty()) {
                problems.report(Problem.UNRECOGNIZED_AD_MARKERS, String.join(", ", suspicious));
            }
            if (session.inAdBreak) {
                logger.log("Ad markers gone on " + session.channel);
                session.inAdBreak = false;
            }
        } else if (!session.inAdBreak) {
            session.inAdBreak = true;
            logger.log("Ad markers on " + session.channel + (playlist.hasAdSegments() ? " (stitched ad)" : " (markers only)"));
        }

        if (playlist.hasAdSegments()) {
            quality.swappingAds = true;
            quality.cleanPolls = 0;
            if (backup != null) {
                logger.log("Serving " + backup.playerType + " " + backup.resolution + " instead" + searchNote);
                breaks.onBlocking(qualityLabel(backup.resolution));
                MediaPlaylist backupPlaylist = MediaPlaylist.parse(backup.playlist, backup.url);
                return stitcher.process(backupPlaylist, backup.playlist, "backup:" + backup.playerType);
            }
            logger.log("No ad-free stream" + searchNote + ", cutting the ad out");
            breaks.onBlocking(null);
            return stitcher.process(playlist, body, PlaylistStitcher.NATIVE);
        }

        // Ad markers can stay in the playlist a while after the ad itself, so the break follows the
        // ad segments. It ends after two clean polls in a row, so a single clean window (for example
        // between two ads) does not end it and start it again moments later.
        String output = stitcher.process(playlist, body, PlaylistStitcher.NATIVE);
        if (quality.swappingAds && ++quality.cleanPolls >= 2) {
            logger.log("Ad break over on " + session.channel);
            session.endAdSwap(url);
            breaks.onBreakOver();
        }
        return output;
    }

    /** One line per playlist refresh for the detailed log. */
    private static String pollSummary(StreamSession session, String url, MediaPlaylist playlist,
                                      StreamSession.QualityState quality) {
        MasterPlaylist.Variant variant = session.master.byUrl(session.variantUrlFor(url));
        int ads = 0;
        int untitled = 0;
        for (MediaPlaylist.Segment segment : playlist.segments) {
            if (segment.isAd()) ads++;
            else if (!segment.live) untitled++;
        }
        return "Playlist " + session.channel + " " + (variant == null ? "?" : variant.resolution == null ? "audio" : variant.resolution)
                + ": sequence " + playlist.mediaSequence + ", " + playlist.segments.size() + " segments, " + ads + " ads"
                // Not titled "live" without a stitched ad marker: if these are ads, Twitch changed its markers.
                + (untitled > 0 ? ", " + untitled + " not titled live" : "")
                + (playlist.hasAdTags ? ", ad markers" : "") + (quality.swappingAds ? ", in break" : "");
    }

    /** {@code 640x360} becomes {@code 360p}; audio only (no resolution) gives null. */
    static String qualityLabel(String resolution) {
        if (resolution == null) return null;
        int x = resolution.indexOf('x');
        return x < 0 ? resolution : resolution.substring(x + 1) + "p";
    }

    private void forgetIdleSessions(long now) {
        Iterator<StreamSession> iterator = sessionsByVariant.values().iterator();
        while (iterator.hasNext()) {
            if (now - iterator.next().lastSeen > SESSION_MAX_IDLE_MS) iterator.remove();
        }
    }
}
