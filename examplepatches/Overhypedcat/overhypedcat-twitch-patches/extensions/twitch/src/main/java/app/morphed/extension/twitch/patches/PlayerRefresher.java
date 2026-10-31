package app.morphed.extension.twitch.patches;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import com.amazonaws.ivs.player.Player;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Keeps track of the IVS players and nudges the playing, unmuted ones back to the live edge after
 * an ad break, so audio and video line up again after switching playlists.
 */
@SuppressWarnings("unused")
public final class PlayerRefresher {
    private static final String TAG = "TwitchMorphed";
    private static final long PLAY_DELAY_MS = 150;
    /** Let the player pick up the first playlist after the break before nudging it. */
    private static final long REFRESH_DELAY_MS = 1_000;

    private static final Map<Player, Boolean> PLAYERS = Collections.synchronizedMap(new WeakHashMap<>());
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private PlayerRefresher() {
    }

    /** Injected at the end of the CorePlayerImpl constructor. */
    public static void register(Player player) {
        if (player == null) return;
        PLAYERS.put(player, Boolean.TRUE);
        DebugLog.log("Player " + System.identityHashCode(player) + " created, " + PLAYERS.size() + " alive");
    }

    public static void refreshPlayingPlayers() {
        MAIN.postDelayed(() -> {
            List<Player> players;
            synchronized (PLAYERS) {
                players = new ArrayList<>(PLAYERS.keySet());
            }
            for (Player player : players) {
                try {
                    // Buffering players are nudged too: a stall right after the switch is what this fixes.
                    Player.State state = player.getState();
                    boolean muted = player.isMuted();
                    StreamAdsPatch.LOGGER.log("Player " + System.identityHashCode(player) + " state " + state + (muted ? ", muted" : ""));
                    if (state != Player.State.PLAYING && state != Player.State.BUFFERING) continue;
                    // Previews in the feed play muted; only the stream being watched has sound.
                    if (muted) continue;
                    player.pause();
                    MAIN.postDelayed(player::play, PLAY_DELAY_MS);
                    StreamAdsPatch.LOGGER.log("Refreshed player " + System.identityHashCode(player) + " after ad break");
                } catch (Throwable t) {
                    Log.e(TAG, "Player refresh failed", t);
                    DebugLog.log("Player refresh failed: " + t);
                }
            }
        }, REFRESH_DELAY_MS);
    }
}
