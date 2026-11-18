package io.github.jordanwoodson.extension.shared.kick;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Configuration;
import android.view.View;

import java.util.ArrayList;
import java.util.List;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.Network;
import io.github.jordanwoodson.extension.shared.SleepTimer;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Kick's native player (kick-player-v3, on Media3 ExoPlayer): background audio, automatic picture-in-picture, normal
 * latency, the sleep timer, the mobile-data quality ceiling and Fill screen. Each hook returns Kick's own value, or does
 * nothing, while its setting is off. The bridges are filled in at patch time with calls into Kick's player classes;
 * Media3's own classes keep their names in Kick, and are read here through them.
 */
@SuppressWarnings("unused")
public final class KickPlayer {
    private static final String BACKGROUND_AUDIO = "background_audio";
    private static final String FILL_SCREEN = "fill_screen";
    private static final String NO_AUTO_PIP = "no_auto_pip";
    private static final String NORMAL_LATENCY = "normal_latency";
    private static final String QUALITY_METERED = "quality_metered";
    /** PlayerConfig.settings.defaultMaxAutoQualityHeight, the starting ceiling Kick uses when no patch sets one. */
    private static final int KICK_DEFAULT_HEIGHT = 720;
    /** Media3's C.TRACK_TYPE_VIDEO. */
    private static final int TRACK_TYPE_VIDEO = 2;
    /** Media3's AspectRatioFrameLayout.RESIZE_MODE_FIT and RESIZE_MODE_ZOOM. */
    static final int FIT = 0;
    static final int ZOOM = 4;

    static {
        SleepTimer.setPauseAction(KickPlayer::pauseStarted);
    }

    private KickPlayer() {
    }

    // ---------------------------------------------------------------------------------------------
    // Background audio and picture-in-picture

    /**
     * Injection point: the value of the player's staysActiveInBackground, which Kick sets for its main player and which
     * decides whether Kick pauses it when you leave. With Background audio switched off (or Lurk paused) the player
     * pauses as it did before Kick kept it playing; otherwise Kick's value stands.
     */
    public static boolean staysActive(boolean requested) {
        if (requested && Settings.isRegistered(BACKGROUND_AUDIO) && !Settings.isEnabled(BACKGROUND_AUDIO)) return false;
        return requested;
    }

    /**
     * Injection point: the start of the player view's setAutoEnterPiP(boolean) (React Native's
     * startsPictureInPictureAutomatically), which Kick's pause-on-leave logic reads, and of
     * PictureInPictureUtilsKt.applyPiPParams(Activity, boolean, Rational), whether the system may enter
     * picture-in-picture by itself when Kick is left (Android 12 and later).
     */
    public static boolean autoEnterPip(boolean requested) {
        return requested && !enabled(NO_AUTO_PIP);
    }

    // ---------------------------------------------------------------------------------------------
    // Normal latency

    /**
     * Injection point: the start of DataSourceUtilsKt.buildKickPlayerV3MediaSource(Context, VideoSource). Kick's
     * low-latency mode is the live configuration it gives a live stream's source: a short target offset from the live
     * edge for Media3 and a rewrite of the HLS playlist that plays its prefetch segments. Normal latency drops it, so
     * Media3 keeps the distance the playlist asks for.
     */
    public static void normalLatency(Object source) {
        if (source == null || !enabled(NORMAL_LATENCY)) return;
        try {
            if (liveConfiguration(source) == null) return;
            clearLiveConfiguration(source);
            Logger.d("normal latency: low-latency mode off");
        } catch (RuntimeException e) {
            Logger.d("normal latency: " + e);
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Sleep timer

    /**
     * Injection point: Player.Listener.onPlayWhenReadyChanged, which Lurk adds to Kick's player listener, with Kick's
     * player: every start or resume, from React Native, the media notification or a headset, and every pause.
     */
    public static void onPlayWhenReady(Object player, boolean playWhenReady) {
        if (playWhenReady) SleepTimer.onPlay(player);
        else SleepTimer.onStop(player);
    }

    /** Injection point: the start of the player's close(), when React Native releases it. */
    public static void onStop(Object player) {
        SleepTimer.onStop(player);
    }

    /**
     * Pauses every started player the way Kick's own pause does, so its controls and notification follow. A player the
     * bridge doesn't know (it is empty without the Sleep timer patch, as in the host tests) is paused by its own pause().
     */
    static void pauseStarted() {
        int paused = 0;
        for (Object player : SleepTimer.started()) {
            try {
                if (!pausePlayer(player)) player.getClass().getMethod("pause").invoke(player);
                paused++;
            } catch (ReflectiveOperationException | RuntimeException e) {
                Logger.d("sleep timer: " + e);
            }
        }
        Logger.d("sleep timer: paused " + paused + " player" + (paused == 1 ? "" : "s"));
    }

    // ---------------------------------------------------------------------------------------------
    // Quality on mobile data

    /**
     * Injection point: the start of the player's setMaxResolution(VideoSize), the ceiling every stream load, Auto and
     * quality pick goes through. On a metered network a starting ceiling (none, or the tallest track no taller than
     * Kick's 720 or the Default video quality height, which is what Kick's player store picks) is capped; any other size
     * is a pick and passes through.
     */
    public static Object maxResolution(Object player, Object size) {
        int cap = Settings.isRegistered(QUALITY_METERED) ? Settings.getInt(QUALITY_METERED) : 0;
        if (cap <= 0 || player == null) return size;
        try {
            if (!Network.isMetered(playerContext(player))) return size;
            int width = size == null ? 0 : sizeWidth(size);
            int height = size == null ? 0 : sizeHeight(size);
            if (height > 0 && !isStartingCeiling(player, height)) return size;
            if (height > 0 && height <= cap) return size;
            int capped = width > 0 && height > 0 ? (int) Math.ceil((double) width * cap / height) : Integer.MAX_VALUE;
            Logger.d("quality on mobile data: starting ceiling " + height + " -> " + cap);
            return videoSize(capped, cap);
        } catch (RuntimeException e) {
            Logger.d("quality on mobile data: " + e);
            return size;
        }
    }

    /** Whether [height] is the tallest video track no taller than Kick's or Lurk's default ceiling. */
    private static boolean isStartingCeiling(Object player, int height) {
        List<Integer> heights = videoHeights(player);
        for (int ceiling : new int[]{KICK_DEFAULT_HEIGHT, lurkHeight()}) {
            if (ceiling <= 0) continue;
            int tallest = 0;
            for (int track : heights) if (track <= ceiling && track > tallest) tallest = track;
            if (heights.isEmpty() ? height == ceiling : height == tallest) return true;
        }
        return false;
    }

    /**
     * The heights of the player's video tracks: Kick's own list of them, the one its player store picks the starting
     * ceiling from. (Media3's own tracks can't be read here: React Native sets the ceiling on its own thread.)
     */
    static List<Integer> videoHeights(Object player) {
        List<Integer> heights = new ArrayList<>();
        List<?> tracks = videoTracks(player);
        if (tracks == null) return heights;
        for (Object track : tracks) {
            int height = trackHeight(track);
            if (height > 0) heights.add(height);
        }
        return heights;
    }

    // ---------------------------------------------------------------------------------------------
    // Fill screen

    /**
     * Injection point: Media3's AspectRatioFrameLayout.onMeasure, where it reads its resize mode, with the video's and
     * its own width / height. Kick keeps FIT. In landscape, outside picture-in-picture, Fill screen hands back ZOOM
     * when FIT would leave bars at the sides of a video wider than tall (a 16:9 stream on a 20:9 screen): the video
     * fills the width and its top and bottom are cropped. A player next to the chat, which FIT letterboxes, and vertical
     * videos keep FIT. The frame measures on every layout, so rotating back to portrait restores FIT.
     */
    public static int resizeMode(View view, int mode, float videoAspect, float viewAspect) {
        if (mode != FIT || view == null || videoAspect <= 1f || viewAspect <= videoAspect || !enabled(FILL_SCREEN)) {
            return mode;
        }
        try {
            Activity activity = activity(view);
            Configuration configuration = (activity != null ? activity.getResources() : view.getResources())
                    .getConfiguration();
            if (configuration.orientation != Configuration.ORIENTATION_LANDSCAPE) return mode;
            if (activity != null && activity.isInPictureInPictureMode()) return mode;
            return ZOOM;
        } catch (RuntimeException e) {
            Logger.d("fill screen: " + e);
            return mode;
        }
    }

    /**
     * The activity [view] is in. Media3's PlayerView is inflated with the application context, so the activity is found
     * through the first ancestor made with one: Kick's player view, a React Native view.
     */
    static Activity activity(View view) {
        for (Object current = view; current instanceof View; current = ((View) current).getParent()) {
            Context context = ((View) current).getContext();
            while (context instanceof ContextWrapper) {
                if (context instanceof Activity) return (Activity) context;
                context = ((ContextWrapper) context).getBaseContext();
            }
        }
        return null;
    }

    // ---------------------------------------------------------------------------------------------
    // Bridges, filled in at patch time.

    /** ((VideoPlayer) player).getPlayer().pause(), as Kick's own pause; true once done. */
    private static boolean pausePlayer(Object player) {
        return false;
    }

    /** ((VideoSource) source).liveConfiguration. */
    private static Object liveConfiguration(Object source) {
        return null;
    }

    /** ((VideoSource) source).liveConfiguration = null. */
    private static void clearLiveConfiguration(Object source) {
    }

    /** ((VideoPlayer) player).getContext(). */
    private static Context playerContext(Object player) {
        return null;
    }

    /** ((VideoPlayer) player).getAvailableVideoTracks(). */
    private static List<?> videoTracks(Object player) {
        return null;
    }

    /** ((VideoTrack) track).getSize().getHeight(). */
    private static int trackHeight(Object track) {
        return 0;
    }

    /** ((VideoSize) size).getWidth(). */
    private static int sizeWidth(Object size) {
        return 0;
    }

    /** ((VideoSize) size).getHeight(). */
    private static int sizeHeight(Object size) {
        return 0;
    }

    /** new VideoSize(width, height). */
    private static Object videoSize(int width, int height) {
        return null;
    }

    /** The Default video quality height chosen when patching, or 0 without that patch. */
    private static int lurkHeight() {
        return 0;
    }

    private static boolean enabled(String key) {
        return Settings.isRegistered(key) && Settings.isEnabled(key);
    }
}
