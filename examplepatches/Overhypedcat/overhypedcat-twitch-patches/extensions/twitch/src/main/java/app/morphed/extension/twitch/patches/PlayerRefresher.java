package app.morphed.extension.twitch.patches;

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
 * (playing with sound; feed previews play muted).
 */
@SuppressWarnings("unused")
public final class PlayerRefresher {

    /** Players (weakly held, they come and go with every preview) and the surface they draw on. */
    private static final Map<Player, WeakReference<Surface>> PLAYERS = Collections.synchronizedMap(new WeakHashMap<>());

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

    /**
     * The player of the stream on screen, for the detailed log: one with sound that has a stream loaded (READY,
     * playing, stalled), playing ones first. Null when none.
     */
    public static Player shownPlayer() {
        Player ready = null;
        for (Player player : players()) {
            try {
                if (player.isMuted()) continue;
                Player.State state = player.getState();
                if (state == Player.State.PLAYING || state == Player.State.BUFFERING) return player;
                if (state == Player.State.READY && ready == null) ready = player;
            } catch (Throwable ignored) {
                // A released player: skip it.
            }
        }
        return ready;
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

    /**
     * Whether {@code player} plays sound without video (Twitch's Audio Only mode). Its video view
     * stays in place, hidden behind the player's header, so a label over it would be misplaced.
     * Read through reflection: if a Twitch update drops the method, the label is used as before.
     */
    static boolean playsAudioOnly(Player player) {
        try {
            Object quality = player.getClass().getMethod("getQuality").invoke(player);
            if (quality == null) return false;
            Object height = quality.getClass().getMethod("getHeight").invoke(quality);
            Object name = quality.getClass().getMethod("getName").invoke(quality);
            return isAudioOnly(height instanceof Integer ? (Integer) height : -1, name == null ? null : name.toString());
        } catch (Throwable t) {
            return false;
        }
    }

    /** IVS reports audio only as a quality without height, named like {@code audio_only}. */
    static boolean isAudioOnly(int height, String name) {
        if (name != null && name.toLowerCase(java.util.Locale.ROOT).contains("audio")) return true;
        return height == 0;
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
}
