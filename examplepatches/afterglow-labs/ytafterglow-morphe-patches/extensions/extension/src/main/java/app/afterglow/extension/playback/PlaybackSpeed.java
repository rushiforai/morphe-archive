package app.afterglow.extension.playback;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.video.PlayerStatus;
import app.afterglow.extension.video.PlayerType;
import app.afterglow.extension.video.VideoState;

/**
 * iOS "playback-speed" tweak.
 *
 * <ul>
 *   <li>{@code speedIndex} ("Hold to speed"): the rate while the player is held. 0 turns the
 *       gesture off, 1 keeps YouTube's 2x, 2-17 are 1.25x to 5x (iOS YTSpeedmasterController).
 *       YouTube's "2x" hint over the player still names its own rate.</li>
 *   <li>{@code autoSpeedIndex} ("Default playback rate"): the rate a video starts at. As on iOS
 *       it is set once per video, 0.75 s after the video (not an ad) starts playing on the
 *       watch page; Shorts and the muted feed previews keep their speed, and a speed the viewer
 *       picks afterwards is never overridden. 1.0x (the default) changes nothing.</li>
 * </ul>
 */
@SuppressWarnings("unused")
public final class PlaybackSpeed {
    private static final String TWEAK = "playback-speed";
    /** iOS schedules setAutoSpeed 0.75 s after the video activates. */
    private static final long DEFAULT_RATE_DELAY_MS = 750;

    private static final PlaybackTables.OncePerVideo DEFAULT_RATE_APPLIED = new PlaybackTables.OncePerVideo();
    private static boolean installed;

    private PlaybackSpeed() {}

    /** Injection point, at startup: follows the playing video for the default rate. */
    public static synchronized void install() {
        if (installed) return;
        installed = true;
        try {
            VideoState.addListener(new VideoState.Listener() {
                @Override
                public void onPlayerStatus(PlayerStatus status) {
                    if (status == PlayerStatus.VIDEO_PLAYING) maybeApplyDefaultRate();
                }

                @Override
                public void onPlayerType(PlayerType type) {
                    // A feed preview opened on the watch page keeps playing without a new status.
                    if (type.isWatchPage() && VideoState.playerStatus() == PlayerStatus.VIDEO_PLAYING) {
                        maybeApplyDefaultRate();
                    }
                }
            });
        } catch (Throwable error) {
            Afterglow.error("PlaybackSpeed.install", error);
        }
    }

    /** The watch page plays a video (not an ad), and no Short is in front of it. */
    private static boolean isWatchPageVideo() {
        return !VideoState.isAdPlaying() && !VideoState.isShortsPlayerInFront() && VideoState.playerType().isWatchPage();
    }

    private static void maybeApplyDefaultRate() {
        try {
            if (!InstalledTweaks.has(TWEAK)) return;
            float rate = PlaybackTables.defaultRate(AfterglowPrefs.getInt("autoSpeedIndex"));
            if (rate <= 0 || !isWatchPageVideo()) return;
            String videoId = VideoState.videoId();
            if (!DEFAULT_RATE_APPLIED.claim(videoId)) return;
            Afterglow.runOnMainDelayed(() -> {
                try {
                    if (videoId.equals(VideoState.videoId()) && isWatchPageVideo()) VideoState.setPlaybackSpeed(rate);
                } catch (Throwable error) {
                    Afterglow.error("PlaybackSpeed default rate", error);
                }
            }, DEFAULT_RATE_DELAY_MS);
        } catch (Throwable error) {
            Afterglow.error("PlaybackSpeed.maybeApplyDefaultRate", error);
        }
    }

    /** Injection point: false turns YouTube's tap and hold speed off. */
    public static boolean isHoldSpeedEnabled(boolean original) {
        try {
            if (!original || !InstalledTweaks.has(TWEAK)) return original;
            return PlaybackTables.holdEnabled(AfterglowPrefs.getInt("speedIndex"));
        } catch (Throwable error) {
            Afterglow.error("PlaybackSpeed.isHoldSpeedEnabled", error);
            return original;
        }
    }

    /** Injection point: the rate while the player is held (YouTube's is 2.0). */
    public static float getHoldSpeed(float original) {
        try {
            if (!InstalledTweaks.has(TWEAK)) return original;
            return PlaybackTables.holdRate(AfterglowPrefs.getInt("speedIndex"), original);
        } catch (Throwable error) {
            Afterglow.error("PlaybackSpeed.getHoldSpeed", error);
            return original;
        }
    }

    /** Injection point: the highest rate YouTube allows for the video. */
    public static float raiseSpeedCeiling(float maximum) {
        try {
            return InstalledTweaks.has(TWEAK) ? PlaybackTables.raiseCeiling(maximum) : maximum;
        } catch (Throwable error) {
            Afterglow.error("PlaybackSpeed.raiseSpeedCeiling", error);
            return maximum;
        }
    }
}
