package io.github.sabopura.morphe.extension.twitch.original;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.os.SystemClock;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.app.PlayerRetry;
import io.github.sabopura.morphe.extension.twitch.player.PlayerTools;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;
import io.github.sabopura.morphe.extension.twitch.ui.Notice;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/** A slow tick while the player is on screen; it stops by itself when there is no player or no window. */
public final class PlayerWatch {
    public static final String KEY_RECOVER = "auto_recover", KEY_THRESHOLD = "auto_recover_seconds";
    private static final long TICK_MS = 2000;
    private static final RecoverPolicy RECOVER = new RecoverPolicy();
    private static final Runnable TICK = PlayerWatch::tick;
    private static boolean running;
    private static long lastTick;
    private static String lastContent = "";

    private PlayerWatch() {
    }

    /** Injection point: the IVS player started. */
    public static void started() {
        try {
            if (!Features.any(Feature.AUTO_RECOVER, Feature.PATCH_STATS, Feature.CHANNEL_PROFILES)) return;
            // Posted from the player's thread, this runs after the guard around it has returned.
            Original.onMain(() -> {
                try {
                    ensure();
                    if (Features.has(Feature.CHANNEL_PROFILES)) ChannelProfiles.playerStarted();
                } catch (RuntimeException | LinkageError e) {
                    Diagnostics.note("original.player-watch-start", e);
                }
            });
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("original.player-started", e);
        }
    }

    static void ensure() {
        if (running || !Features.any(Feature.AUTO_RECOVER, Feature.PATCH_STATS) || !PlayerTools.hasPlayer()) return;
        running = true;
        lastTick = SystemClock.uptimeMillis();
        Original.MAIN.postDelayed(TICK, TICK_MS);
    }

    private static void tick() {
        running = false;
        try {
            if (!Original.foreground() || !PlayerTools.hasPlayer()) return;
            long now = SystemClock.uptimeMillis(), elapsed = now - lastTick;
            lastTick = now;
            String state = PlayerTools.audibleState();
            if (Features.has(Feature.AUTO_RECOVER)) recover(state, now);
            if (Features.has(Feature.PATCH_STATS) && "PLAYING".equals(state)) Stats.addWatched(elapsed);
            running = true;
            Original.MAIN.postDelayed(TICK, TICK_MS);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("original.player-watch", e);
        }
    }

    private static void recover(String state, long now) {
        SharedPreferences prefs = Original.prefs();
        Context context = Original.activity();
        if (prefs == null || !prefs.getBoolean(KEY_RECOVER, false) || context == null) return;
        String content = PlayerTools.content();
        if (!content.equals(lastContent)) {
            lastContent = content;
            RECOVER.reset();
        }
        boolean watching = !Original.adCoverUp() && !PlayerRetry.casting() && networkUp(context);
        long threshold = Math.max(5, Math.min(30, prefs.getInt(KEY_THRESHOLD, 10))) * 1000L;
        switch (RECOVER.tick(state, watching, threshold, now)) {
            case RELOAD:
                Notice.show(context, label("再生が止まったので読み込み直します（" + RECOVER.tries() + "/" + RecoverPolicy.MAX_TRIES + "）",
                        "Playback stalled, reloading (" + RECOVER.tries() + "/" + RecoverPolicy.MAX_TRIES + ")"));
                PlayerTools.reload(context);
                break;
            case GIVE_UP:
                Notice.show(context, label("読み込み直しても再生されないため、自動復旧をやめました",
                        "Still stalled after reloading, so automatic recovery stopped"));
                break;
            default:
                break;
        }
    }

    private static boolean networkUp(Context context) {
        ConnectivityManager connectivity = context.getSystemService(ConnectivityManager.class);
        if (connectivity == null) return false;
        Network network = connectivity.getActiveNetwork();
        NetworkCapabilities capabilities = network == null ? null : connectivity.getNetworkCapabilities(network);
        return capabilities != null && capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET);
    }
}
