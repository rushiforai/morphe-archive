package app.morphed.extension.twitch.patches;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

import java.lang.reflect.Method;

import app.morphed.extension.twitch.adblock.AccessTokenClient;
import app.morphed.extension.twitch.adblock.AdBlocker;
import app.morphed.extension.twitch.adblock.BackupStreamFinder;
import app.morphed.extension.twitch.adblock.Http;
import app.morphed.extension.twitch.adblock.Logger;
import app.morphed.extension.twitch.adblock.LoggingHttp;
import app.morphed.extension.twitch.adblock.Problem;
import app.morphed.extension.twitch.adblock.UrlConnectionHttp;
import app.morphed.extension.twitch.hls.FakeAd;

/**
 * Entry point used by the patched IVS HTTP client.
 */
@SuppressWarnings("unused")
public final class StreamAdsPatch {
    private static final String TAG = "TwitchMorphed";

    /**
     * Logcat and, while the Detailed log setting is on, the log file. Lines for every poll and request
     * are only written while the Detailed log is on.
     */
    static final Logger LOGGER = new Logger() {
        @Override
        public void log(String message) {
            Log.d(TAG, message);
            DebugLog.log(message);
        }

        @Override
        public boolean detailed() {
            return DebugLog.isOn();
        }
    };

    // Must come after LOGGER: static fields are set in the order they are written.
    static final Problem.Reporter PROBLEMS = new ProblemNotifier();
    private static final AdBreakIndicator INDICATOR = new AdBreakIndicator(PROBLEMS);
    private static final AdBlocker AD_BLOCKER = createAdBlocker();

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /** Time for a stream that is being opened to fetch its first playlists. */
    private static final long STREAM_START_MS = 4_000;
    /** One stopped ad can mean several refused requests (retries): one message is enough. */
    private static final long AD_BLOCKED_DEBOUNCE_MS = 30_000;
    private static volatile long lastAdBlockedShownAt;
    private static volatile boolean adBlockedPending;
    /** The pending check is for an ad the app was about to play itself (main thread only). */
    private static boolean pendingPlaybackAd;

    private StreamAdsPatch() {
    }

    /** Handing a playlist to the player failed. */
    public static void deliveryFailed(String url, Throwable t) {
        Log.e(TAG, "Playlist delivery failed for " + url, t);
        DebugLog.log("Playlist delivery failed: " + Log.getStackTraceString(t));
        PROBLEMS.report(Problem.PROCESSING_FAILED, "delivery: " + t);
    }

    /** Wrapping a player's HTTP client failed: that player plays without the ad blocker. */
    public static void setupFailed(Throwable t) {
        DebugLog.log("Ad blocker setup failed: " + Log.getStackTraceString(t));
        PROBLEMS.report(Problem.PROCESSING_FAILED, "setup: " + t);
    }

    /** Called as the first player HTTP client is made, so the label is ready before the first ad. */
    public static void prepare() {
        INDICATOR.prepare();
    }

    /**
     * A request to an ad server was refused. Shown only while a live stream is watched (it polls
     * playlists and plays with sound); on the main page the same requests are for banner and feed
     * ads, which stay blocked without a message.
     */
    static void adBlocked() {
        // Called from network threads (refused requests) and the app's own threads; the players are
        // asked for their state on the main thread, where the app uses them.
        MAIN.post(() -> onMain(() -> adBlockedOnMain(false)));
    }

    /**
     * An ad the app was about to play itself (a pre-roll before a stream or a past broadcast) was
     * stopped. That only happens when something is opened to watch, so it is shown over any player
     * that plays with sound, live or not; muted feed previews do not count.
     */
    static void playbackAdBlocked() {
        MAIN.post(() -> onMain(() -> adBlockedOnMain(true)));
    }

    /** Main thread work must never crash Twitch: a failure becomes an error message. */
    private static void onMain(Runnable work) {
        try {
            work.run();
        } catch (Throwable t) {
            Log.e(TAG, "Ad blocked notice failed", t);
            PROBLEMS.report(Problem.LABEL_FAILED, t.toString());
        }
    }

    private static void adBlockedOnMain(boolean playbackAd) {
        if (watching(playbackAd)) {
            showAdBlocked();
            return;
        }
        // A client-side ad is checked as the stream opens, before its player plays: check again once
        // it had time to start. Still nothing playing means nothing to show it on.
        if (adBlockedPending) {
            pendingPlaybackAd |= playbackAd;
            return;
        }
        adBlockedPending = true;
        pendingPlaybackAd = playbackAd;
        MAIN.postDelayed(() -> onMain(() -> recheckAdBlocked(1)), STREAM_START_MS);
    }

    /**
     * A refused ad server request gets one recheck. An ad the app was about to play itself means
     * something was opened to watch, so it waits for a slow player a while longer.
     */
    private static void recheckAdBlocked(int attempt) {
        if (watching(pendingPlaybackAd)) {
            adBlockedPending = false;
            showAdBlocked();
        } else if (pendingPlaybackAd && attempt < PLAYBACK_RECHECKS) {
            MAIN.postDelayed(() -> onMain(() -> recheckAdBlocked(attempt + 1)), PLAYBACK_RECHECK_MS);
        } else {
            adBlockedPending = false;
            LOGGER.log("Ad blocked outside a stream (no label)");
        }
    }

    /** Rechecks for a player after a blocked pre-roll: 4 s, then every 2 s, so up to 12 s in all. */
    private static final int PLAYBACK_RECHECKS = 5;
    private static final long PLAYBACK_RECHECK_MS = 2_000;

    /** Whether there is something on screen to show a block over; see adBlocked and playbackAdBlocked. */
    private static boolean watching(boolean anyPlayback) {
        if (PlayerRefresher.watchedPlayer() == null) return false;
        return anyPlayback || AD_BLOCKER.isWatching();
    }

    private static void showAdBlocked() {
        if (System.currentTimeMillis() - lastAdBlockedShownAt < AD_BLOCKED_DEBOUNCE_MS) return;
        // The quiet time only starts once the user saw it: a block that could not be shown leaves
        // the next one free to show.
        INDICATOR.flash("Ad blocked", () -> lastAdBlockedShownAt = System.currentTimeMillis());
    }

    public static boolean shouldInspect(String url) {
        try {
            if (AD_BLOCKER.shouldInspect(url)) return true;
            AD_BLOCKER.checkRequest(url);
            return false;
        } catch (Throwable t) {
            PROBLEMS.report(Problem.PROCESSING_FAILED, t.toString());
            return false;
        }
    }

    /** The playlist to give the player, or the original body if anything goes wrong. */
    public static String process(String url, String body) {
        try {
            int fakeAd = fakeAdSegments();
            if (fakeAd > 0 && AD_BLOCKER.isKnownMediaPlaylist(url)) body = FakeAd.inject(body, fakeAd);
            return AD_BLOCKER.process(url, body);
        } catch (Throwable t) {
            Log.e(TAG, "Playlist processing failed for " + url, t);
            DebugLog.log("Playlist processing failed: " + Log.getStackTraceString(t));
            PROBLEMS.report(Problem.PROCESSING_FAILED, t.toString());
            return body;
        }
    }

    /**
     * Test switch for checking the ad blocker on a device when Twitch serves no ads:
     * {@code adb shell setprop debug.twitchmorphed.fake_ad 3} makes the newest 3 segments of the
     * watched stream look like a stitched ad, {@code 0} ends it. Apps cannot set debug properties, so
     * only a developer with adb can. Read at most every few seconds, so polls pay a time check only.
     */
    private static int fakeAdSegments() {
        if (fakeAdUnavailable) return 0;
        long now = SystemClock.elapsedRealtime();
        if (now - fakeAdCheckedAt < FAKE_AD_CHECK_MS) return fakeAd;
        fakeAdCheckedAt = now;
        try {
            Method get = systemPropertyGet;
            if (get == null) {
                get = Class.forName("android.os.SystemProperties").getMethod("get", String.class, String.class);
                systemPropertyGet = get;
            }
            String value = String.valueOf(get.invoke(null, "debug.twitchmorphed.fake_ad", "0")).trim();
            int segments;
            try {
                segments = Integer.parseInt(value);
            } catch (NumberFormatException notANumber) {
                segments = 0;
            }
            if (segments != fakeAd) LOGGER.log("Test ad " + (segments > 0 ? "on (" + segments + " segments)" : "off"));
            fakeAd = segments;
        } catch (Throwable t) {
            // Android does not let it be read here: the test switch is off for good, no retries.
            fakeAdUnavailable = true;
            fakeAd = 0;
        }
        return fakeAd;
    }

    private static final long FAKE_AD_CHECK_MS = 3_000;
    private static volatile long fakeAdCheckedAt = Long.MIN_VALUE / 2;
    private static volatile int fakeAd;
    private static volatile Method systemPropertyGet;
    private static volatile boolean fakeAdUnavailable;

    private static AdBlocker createAdBlocker() {
        DebugLog.resumeIfEnabled();
        Logger logger = LOGGER;
        Http http = new LoggingHttp(new UrlConnectionHttp(), logger, System::currentTimeMillis);
        BackupStreamFinder backups = new BackupStreamFinder(
                http, new AccessTokenClient(http), logger, System::currentTimeMillis, PROBLEMS);
        AdBlocker.BreakListener breaks = new AdBlocker.BreakListener() {
            @Override
            public void onBlocking(String quality) {
                INDICATOR.show(quality);
            }

            @Override
            public void onBreakOver() {
                INDICATOR.hide();
                PlayerRefresher.refreshPlayingPlayers();
            }
        };
        return new AdBlocker(backups, logger, System::currentTimeMillis, breaks, PROBLEMS);
    }
}
