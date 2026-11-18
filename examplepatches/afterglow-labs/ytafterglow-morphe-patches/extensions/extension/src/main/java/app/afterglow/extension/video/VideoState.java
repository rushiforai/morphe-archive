/*
 * YTAfterglow for Android.
 *
 * The hooks that feed this class are adapted from the video information, video id,
 * player type and player response patches of Morphe patches v2.2.0
 * (https://github.com/MorpheApp/morphe-patches, GPLv3), which were forked from
 * ReVanced patches (https://github.com/ReVanced/revanced-patches, GPLv3). Modified
 * for YTAfterglow: one observe-only state class with listeners, the playing director
 * chosen by its own status, and the video id read from that director.
 * Not an official Morphe or ReVanced file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package app.afterglow.extension.video;

import android.view.View;

import java.lang.ref.WeakReference;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

import app.afterglow.extension.Afterglow;

/**
 * The video YouTube is playing, for every Afterglow feature that needs it (default speed and
 * quality, SponsorBlock, loop, ...). Filled by the unnamed {@code VideoStatePatch}; it only
 * observes and never changes YouTube's behaviour by itself.
 *
 * <p>YouTube keeps one player director per playback. The director that last moved to an
 * active status (ad or video requested or playing) is the current one: its video id, time,
 * speed and seeks are what this class reports and acts on. Preloaded Shorts get directors
 * too, but they never become active until they play.
 *
 * <p>Queries can be made from any thread. {@link #seekTo}, {@link #seekToRelative} and
 * {@link #setPlaybackSpeed} must be called on the main thread. Listeners are called on the
 * thread of the hook that fired, which is the main thread for everything but
 * {@link Listener#onPlayerResponse}.
 */
public final class VideoState {
    /** Gets told about playback; every method is optional. */
    public interface Listener {
        /**
         * YouTube created a player director: a video is about to load (or a Short is preloaded).
         * Called before the video id, time and length of the new video are known.
         */
        default void onPlayerCreated() {}

        /** The current director plays a video other than the one before (ads excluded). */
        default void onNewVideo(String videoId) {}

        /** The current director's status changed. */
        default void onPlayerStatus(PlayerStatus status) {}

        /** About once a second while a video plays, with the time in milliseconds. */
        default void onVideoTime(long timeMs) {}

        /** The watch page player moved (opened, minimized, fullscreen, closed, ...). */
        default void onPlayerType(PlayerType type) {}

        /** The play/pause control changed. */
        default void onPlaybackState(PlaybackState state) {}

        /** The Shorts player opened or closed. */
        default void onShortsPlayerOpen(boolean open) {}

        /**
         * YouTube loaded the player response of a video. Called off the main thread, also for
         * videos that are only preloaded (the next Shorts, feed previews).
         */
        default void onPlayerResponse(String videoId, boolean isShort) {}
    }

    /** Player parameters of every Short start with these characters. */
    private static final String SHORTS_PLAYER_PARAMETERS = "8AEB";
    private static final int MAX_REMEMBERED_RESPONSES = 64;

    private static final CopyOnWriteArrayList<Listener> LISTENERS = new CopyOnWriteArrayList<>();

    private static volatile WeakReference<PlayerController> current = new WeakReference<>(null);
    private static volatile WeakReference<PlayerController> latestCreated = new WeakReference<>(null);
    private static volatile WeakReference<PlayerController> casting = new WeakReference<>(null);

    private static volatile String videoId = "";
    private static volatile long videoTime = -1;
    private static volatile long videoLength = 0;
    private static volatile PlayerStatus status = PlayerStatus.NEW;
    private static volatile PlayerType playerType = PlayerType.NONE;
    private static volatile PlaybackState playbackState = PlaybackState.NEW;
    private static volatile boolean shortsPlayerOpen;
    /** Shorts player views attached to a window; only touched on the main thread. */
    private static int attachedShortsPlayers;

    /** Video id to "is a Short", from the player responses YouTube loaded last. */
    private static final Map<String, Boolean> SHORTS_BY_VIDEO = new LinkedHashMap<String, Boolean>(16, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
            return size() > MAX_REMEMBERED_RESPONSES;
        }
    };

    private VideoState() {}

    // region Queries

    /** Id of the video the current director plays, or "" before any video played. */
    public static String videoId() {
        PlayerController controller = current.get();
        if (controller != null) {
            try {
                String id = controller.afterglow_getVideoId();
                if (id != null && !id.isEmpty()) return id;
            } catch (Throwable error) {
                Afterglow.error("VideoState.videoId", error);
            }
        }
        return videoId;
    }

    /** True if YouTube's player response marked this video as a Short. */
    public static boolean isShort(String id) {
        if (id == null || id.isEmpty()) return false;
        synchronized (SHORTS_BY_VIDEO) {
            return Boolean.TRUE.equals(SHORTS_BY_VIDEO.get(id));
        }
    }

    /** True if the current video is a Short, wherever it plays. */
    public static boolean isShort() {
        return isShort(videoId());
    }

    /** True while the Shorts player is open. */
    public static boolean isShortsPlayerOpen() {
        return shortsPlayerOpen;
    }

    /** True while the Shorts player is open and the watch page player is not in front of it. */
    public static boolean isShortsPlayerInFront() {
        return shortsPlayerOpen && !playerType.isMaximizedOrFullscreen();
    }

    public static PlayerType playerType() {
        return playerType;
    }

    public static PlayerStatus playerStatus() {
        return status;
    }

    public static PlaybackState playbackState() {
        return playbackState;
    }

    /** True while an ad plays (or is about to) instead of the video. */
    public static boolean isAdPlaying() {
        return status.isAd();
    }

    /** Playback time of the current video in milliseconds, or -1 when unknown. */
    public static long videoTime() {
        PlayerController controller = current.get();
        if (controller != null) {
            try {
                long time = controller.afterglow_getVideoTime();
                if (time >= 0) return time;
            } catch (Throwable error) {
                Afterglow.error("VideoState.videoTime", error);
            }
        }
        return videoTime;
    }

    /** Length of the video shown in the player's seek bar in milliseconds, or 0 when unknown. */
    public static long videoLength() {
        return videoLength;
    }

    /** Playback rate of the current director, or 1 when unknown. */
    public static float playbackSpeed() {
        PlayerController controller = current.get();
        if (controller == null) return 1f;
        try {
            float speed = controller.afterglow_getPlaybackSpeed();
            return speed > 0 ? speed : 1f;
        } catch (Throwable error) {
            Afterglow.error("VideoState.playbackSpeed", error);
            return 1f;
        }
    }

    // endregion

    // region Actions (main thread)

    /** Seeks the current video, or the casting session when the device does not play it. */
    public static boolean seekTo(long timeMs) {
        try {
            PlayerController controller = current.get();
            if (controller != null && controller.afterglow_seekTo(timeMs)) return true;
            PlayerController remote = casting.get();
            return remote != null && remote.afterglow_seekTo(timeMs);
        } catch (Throwable error) {
            Afterglow.error("VideoState.seekTo", error);
            return false;
        }
    }

    /** Seeks the current video by an offset in milliseconds. */
    public static boolean seekToRelative(long offsetMs) {
        try {
            PlayerController controller = current.get();
            if (controller != null && controller.afterglow_seekToRelative(offsetMs)) return true;
            PlayerController remote = casting.get();
            return remote != null && remote.afterglow_seekToRelative(offsetMs);
        } catch (Throwable error) {
            Afterglow.error("VideoState.seekToRelative", error);
            return false;
        }
    }

    /** Sets the playback rate of the current video. False if there is no current director. */
    public static boolean setPlaybackSpeed(float speed) {
        if (!(speed > 0)) return false;
        try {
            PlayerController controller = current.get();
            if (controller == null) return false;
            controller.afterglow_setPlaybackSpeed(speed);
            return true;
        } catch (Throwable error) {
            Afterglow.error("VideoState.setPlaybackSpeed", error);
            return false;
        }
    }

    /** The current director, for features that need to compare players. */
    public static PlayerController currentController() {
        return current.get();
    }

    // endregion

    public static void addListener(Listener listener) {
        if (listener != null) LISTENERS.addIfAbsent(listener);
    }

    public static void removeListener(Listener listener) {
        LISTENERS.remove(listener);
    }

    // region Injection points. Each one catches everything, so YouTube's code always continues.

    /** Injection point: a local player director was created. */
    public static void onPlayerCreated(PlayerController controller) {
        try {
            latestCreated = new WeakReference<>(controller);
            if (current.get() == null) current = new WeakReference<>(controller);
            for (Listener listener : LISTENERS) {
                try {
                    listener.onPlayerCreated();
                } catch (Throwable error) {
                    Afterglow.error("VideoState listener onPlayerCreated", error);
                }
            }
        } catch (Throwable error) {
            Afterglow.error("VideoState.onPlayerCreated", error);
        }
    }

    /** Injection point: the casting (MDX) director was created. */
    public static void onCastingPlayerCreated(PlayerController controller) {
        try {
            casting = new WeakReference<>(controller);
        } catch (Throwable error) {
            Afterglow.error("VideoState.onCastingPlayerCreated", error);
        }
    }

    /** Injection point: a local director's status changes, before the director acts on it. */
    public static void onPlayerStatus(PlayerController controller, Enum<?> youTubeStatus) {
        try {
            PlayerStatus newStatus = youTubeStatus == null ? null : PlayerStatus.fromName(youTubeStatus.name());
            if (controller == null || newStatus == null) return;
            if (newStatus.isActive()) {
                current = new WeakReference<>(controller);
            } else if (controller != current.get()) {
                return; // A director that is not playing, such as a preloaded Short.
            }
            boolean changed = status != newStatus;
            status = newStatus;
            if (!newStatus.isAd()) checkNewVideo(controller);
            if (changed) {
                for (Listener listener : LISTENERS) {
                    try {
                        listener.onPlayerStatus(newStatus);
                    } catch (Throwable error) {
                        Afterglow.error("VideoState listener onPlayerStatus", error);
                    }
                }
            }
        } catch (Throwable error) {
            Afterglow.error("VideoState.onPlayerStatus", error);
        }
    }

    private static void checkNewVideo(PlayerController controller) {
        String id;
        try {
            id = controller.afterglow_getVideoId();
        } catch (Throwable error) {
            // A director without a playback yet; the status listeners still run.
            Afterglow.error("VideoState.checkNewVideo", error);
            return;
        }
        if (id == null || id.isEmpty() || id.equals(videoId)) return;
        videoId = id;
        videoLength = 0;
        for (Listener listener : LISTENERS) {
            try {
                listener.onNewVideo(id);
            } catch (Throwable error) {
                Afterglow.error("VideoState listener onNewVideo", error);
            }
        }
    }

    /**
     * Injection point, off the main thread: YouTube builds the player request of a video.
     * Observes only.
     */
    public static void onPlayerResponse(String id, String playerParameters, boolean isShortAndOpeningOrPlaying) {
        try {
            if (id == null || id.isEmpty()) return;
            boolean isShort = playerParameters != null && playerParameters.startsWith(SHORTS_PLAYER_PARAMETERS);
            synchronized (SHORTS_BY_VIDEO) {
                SHORTS_BY_VIDEO.put(id, isShort);
            }
            for (Listener listener : LISTENERS) {
                try {
                    listener.onPlayerResponse(id, isShort);
                } catch (Throwable error) {
                    Afterglow.error("VideoState listener onPlayerResponse", error);
                }
            }
        } catch (Throwable error) {
            Afterglow.error("VideoState.onPlayerResponse", error);
        }
    }

    /** Injection point: a director reports its playback progress, in milliseconds. */
    public static void onVideoTime(long timeMs) {
        try {
            videoTime = timeMs;
            for (Listener listener : LISTENERS) {
                try {
                    listener.onVideoTime(timeMs);
                } catch (Throwable error) {
                    Afterglow.error("VideoState listener onVideoTime", error);
                }
            }
        } catch (Throwable error) {
            Afterglow.error("VideoState.onVideoTime", error);
        }
    }

    /** Injection point: the player's seek bar draws a video of this length (milliseconds). */
    public static void onVideoLength(long lengthMs) {
        if (lengthMs > 0) videoLength = lengthMs;
    }

    /** Injection point: the watch page player changed its type. */
    public static void onPlayerType(Enum<?> youTubeType) {
        try {
            PlayerType type = youTubeType == null ? null : PlayerType.fromName(youTubeType.name());
            if (type == null || type == playerType) return;
            playerType = type;
            for (Listener listener : LISTENERS) {
                try {
                    listener.onPlayerType(type);
                } catch (Throwable error) {
                    Afterglow.error("VideoState listener onPlayerType", error);
                }
            }
        } catch (Throwable error) {
            Afterglow.error("VideoState.onPlayerType", error);
        }
    }

    /** Injection point: the player controls state changed. */
    public static void onPlaybackState(Enum<?> youTubeState) {
        try {
            PlaybackState state = youTubeState == null ? null : PlaybackState.fromName(youTubeState.name());
            if (state == null || state == playbackState) return;
            playbackState = state;
            for (Listener listener : LISTENERS) {
                try {
                    listener.onPlaybackState(state);
                } catch (Throwable error) {
                    Afterglow.error("VideoState listener onPlaybackState", error);
                }
            }
        } catch (Throwable error) {
            Afterglow.error("VideoState.onPlaybackState", error);
        }
    }

    /**
     * Injection point: YouTube created the Shorts player view. More than one can be attached at
     * once (a Shorts live stream opened from the Shorts feed), so the player counts as closed
     * only when the last one is detached.
     */
    public static void onShortsPlayerView(View view) {
        try {
            if (view == null) return;
            view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                @Override
                public void onViewAttachedToWindow(View v) {
                    attachedShortsPlayers++;
                    setShortsPlayerOpen(true);
                }

                @Override
                public void onViewDetachedFromWindow(View v) {
                    attachedShortsPlayers = Math.max(0, attachedShortsPlayers - 1);
                    setShortsPlayerOpen(attachedShortsPlayers > 0);
                }
            });
        } catch (Throwable error) {
            Afterglow.error("VideoState.onShortsPlayerView", error);
        }
    }

    private static void setShortsPlayerOpen(boolean open) {
        if (shortsPlayerOpen == open) return;
        shortsPlayerOpen = open;
        for (Listener listener : LISTENERS) {
            try {
                listener.onShortsPlayerOpen(open);
            } catch (Throwable error) {
                Afterglow.error("VideoState listener onShortsPlayerOpen", error);
            }
        }
    }

    // endregion
}
