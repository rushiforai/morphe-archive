package app.morphed.extension.twitch.patches;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import app.morphed.extension.twitch.adblock.AccessTokenClient;
import app.morphed.extension.twitch.adblock.AdBlocker;
import app.morphed.extension.twitch.adblock.BackupStreamFinder;
import app.morphed.extension.twitch.adblock.Http;
import app.morphed.extension.twitch.adblock.Logger;
import app.morphed.extension.twitch.adblock.LoggingHttp;
import app.morphed.extension.twitch.adblock.Problem;
import app.morphed.extension.twitch.adblock.UrlConnectionHttp;

/**
 * Entry point used by the patched IVS HTTP client.
 */
@SuppressWarnings("unused")
public final class StreamAdsPatch {
    private static final String TAG = "TwitchMorphed";

    /** Logcat and, while the Detailed log setting is on, the log file. */
    static final Logger LOGGER = message -> {
        Log.d(TAG, message);
        DebugLog.log(message);
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

    private StreamAdsPatch() {
    }

    /** Handing a playlist to the player failed. */
    public static void deliveryFailed(String url, Throwable t) {
        Log.e(TAG, "Playlist delivery failed for " + url, t);
        DebugLog.log("Playlist delivery failed: " + Log.getStackTraceString(t));
        PROBLEMS.report(Problem.PROCESSING_FAILED, "delivery: " + t);
    }

    /** Called as the first player HTTP client is made, so the label is ready before the first ad. */
    public static void prepare() {
        INDICATOR.prepare();
    }

    /**
     * An ad the app wanted to show was stopped before it started (refused request, ineligible check).
     * Shown only while a stream is watched (it polls playlists and plays with sound); on the main page
     * the same requests are for banner and feed ads, which stay blocked without a message.
     */
    static void adBlocked() {
        if (watching()) {
            showAdBlocked();
            return;
        }
        // A client-side ad is checked as the stream opens, before its first playlist: check again
        // once the player had time to start. Still no stream means nothing to show it on.
        if (adBlockedPending) return;
        adBlockedPending = true;
        MAIN.postDelayed(() -> {
            adBlockedPending = false;
            if (watching()) {
                showAdBlocked();
            } else {
                LOGGER.log("Ad blocked outside a stream (no label)");
            }
        }, STREAM_START_MS);
    }

    private static boolean watching() {
        return AD_BLOCKER.isWatching() && PlayerRefresher.watchedPlayer() != null;
    }

    private static void showAdBlocked() {
        long now = System.currentTimeMillis();
        if (now - lastAdBlockedShownAt < AD_BLOCKED_DEBOUNCE_MS) return;
        lastAdBlockedShownAt = now;
        INDICATOR.flash("Ad blocked");
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
            return AD_BLOCKER.process(url, body);
        } catch (Throwable t) {
            Log.e(TAG, "Playlist processing failed for " + url, t);
            DebugLog.log("Playlist processing failed: " + Log.getStackTraceString(t));
            PROBLEMS.report(Problem.PROCESSING_FAILED, t.toString());
            return body;
        }
    }

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
