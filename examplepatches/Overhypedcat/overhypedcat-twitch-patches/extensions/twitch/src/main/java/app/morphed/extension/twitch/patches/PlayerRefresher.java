package app.morphed.extension.twitch.patches;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Surface;

import com.amazonaws.ivs.player.Player;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Keeps track of the IVS players and the surface each one draws on. Finds the player being watched
 * (playing with sound; feed previews play muted), and nudges it back to the live edge after an ad
 * break, so audio and video line up again after switching playlists.
 */
@SuppressWarnings("unused")
public final class PlayerRefresher {
    private static final String TAG = "TwitchMorphed";
    private static final long PLAY_DELAY_MS = 150;
    /** Let the player pick up the first playlist after the break before nudging it. */
    private static final long REFRESH_DELAY_MS = 1_000;

    /** Players (weakly held, they come and go with every preview) and the surface they draw on. */
    private static final Map<Player, WeakReference<Surface>> PLAYERS = Collections.synchronizedMap(new WeakHashMap<>());
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private PlayerRefresher() {
    }

    /** Injected at the end of the CorePlayerImpl constructor. */
    public static void register(Player player) {
        if (player == null) return;
        PLAYERS.put(player, new WeakReference<>(null));
        DebugLog.log("Player " + System.identityHashCode(player) + " created, " + PLAYERS.size() + " alive");
    }

    /** Injected at the start of CorePlayerImpl.setSurface. */
    public static void onSurface(Player player, Surface surface) {
        if (player == null) return;
        PLAYERS.put(player, new WeakReference<>(surface));
    }

    /** The player being watched: playing (or buffering) with sound. Null on the main page. */
    static Player watchedPlayer() {
        for (Player player : players()) {
            try {
                Player.State state = player.getState();
                if ((state == Player.State.PLAYING || state == Player.State.BUFFERING) && !player.isMuted()) return player;
            } catch (Throwable ignored) {
                // A released player: skip it.
            }
        }
        return null;
    }

    /** The surface {@code player} draws on, or null if unknown. */
    static Surface surfaceOf(Player player) {
        WeakReference<Surface> surface = player == null ? null : PLAYERS.get(player);
        return surface == null ? null : surface.get();
    }

    private static List<Player> players() {
        synchronized (PLAYERS) {
            return new ArrayList<>(PLAYERS.keySet());
        }
    }

    public static void refreshPlayingPlayers() {
        MAIN.postDelayed(() -> {
            for (Player player : players()) {
                try {
                    // Buffering players are nudged too: a stall right after the switch is what this fixes.
                    Player.State state = player.getState();
                    if (state != Player.State.PLAYING && state != Player.State.BUFFERING) continue;
                    // Previews in the feed play muted; only the stream being watched has sound.
                    if (player.isMuted()) continue;
                    player.pause();
                    MAIN.postDelayed(player::play, PLAY_DELAY_MS);
                    StreamAdsPatch.LOGGER.log("Refreshed player " + System.identityHashCode(player) + " (" + state + ") after ad break");
                } catch (Throwable t) {
                    Log.e(TAG, "Player refresh failed", t);
                    DebugLog.log("Player refresh failed: " + t);
                }
            }
        }, REFRESH_DELAY_MS);
    }
}
