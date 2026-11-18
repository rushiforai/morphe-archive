package app.afterglow.extension.playback;

import android.app.Activity;

import java.lang.ref.WeakReference;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.video.PlayerController;
import app.afterglow.extension.video.PlayerStatus;
import app.afterglow.extension.video.PlayerType;
import app.afterglow.extension.video.VideoState;

/** iOS activation delay and finish behavior, through the native fullscreen control. */
public final class Fullscreen {
    private static final FullscreenSession SESSION = new FullscreenSession();
    private static WeakReference<FullscreenController> controller = new WeakReference<>(null);
    private static boolean installed;
    private Fullscreen() {}

    /** The iOS switch expands allowed orientations; it does not auto-enter fullscreen. */
    public static boolean maintainFullscreenOnRotation(boolean nativeMaintain) {
        return nativeMaintain || (PlayerBehavior.portraitFullscreen()
                && VideoState.playerType() == PlayerType.WATCH_WHILE_FULLSCREEN
                && !VideoState.isShortsPlayerInFront());
    }

    public static void setController(FullscreenController value) {
        Afterglow.runOnMain(() -> {
            if (controller.get() != value) SESSION.clear();
            controller = new WeakReference<>(value);
        });
    }

    /** Explicit user action; independent of the Fullscreen tweak's automatic settings. */
    public static boolean enterFromOverlayButton() {
        FullscreenController host = controller.get();
        if (host == null || !foreground() || VideoState.isShortsPlayerInFront()
                || VideoState.isAdPlaying() || !VideoState.playerType().isWatchPage()) return false;
        if (VideoState.playerType() != PlayerType.WATCH_WHILE_FULLSCREEN) host.afterglow_enterFullscreen();
        return true;
    }

    /** Explicit action from an owned dialog, whose window holds focus instead of the activity. */
    public static boolean enterFromControlsSheet(Activity activity) {
        FullscreenController host = controller.get();
        if (host == null || activity == null || activity != Afterglow.mainActivity()
                || activity.isFinishing() || activity.isDestroyed() || activity.getWindow() == null
                || !activity.getWindow().getDecorView().isShown() || VideoState.isShortsPlayerInFront()
                || VideoState.isAdPlaying() || !VideoState.playerType().isWatchPage()) return false;
        if (VideoState.playerType() != PlayerType.WATCH_WHILE_FULLSCREEN) host.afterglow_enterFullscreen();
        return true;
    }

    public static synchronized void install() {
        if (installed) return;
        installed = true;
        VideoState.addListener(new VideoState.Listener() {
            @Override public void onNewVideo(String id) {
                observe();
                if (VideoState.playerStatus() == PlayerStatus.VIDEO_PLAYING) maybeEnter();
            }
            @Override public void onPlayerStatus(PlayerStatus status) {
                observe();
                if (status == PlayerStatus.VIDEO_PLAYING) maybeEnter();
                else if (status == PlayerStatus.ENDED) maybeExit();
            }
            @Override public void onPlayerType(PlayerType type) {
                if (type == PlayerType.NONE) SESSION.clear();
                else if (VideoState.playerStatus() == PlayerStatus.VIDEO_PLAYING) maybeEnter();
            }
        });
    }

    private static long observe() {
        return SESSION.update(VideoState.currentController(), VideoState.videoId());
    }

    private static boolean activeWatch() {
        // Only the local director reports VIDEO_PLAYING; an MDX controller is never
        // selected here. Recheck at execution time, after the native status update.
        return InstalledTweaks.has("fullscreen") && !VideoState.isAdPlaying()
                && !VideoState.isShortsPlayerInFront() && VideoState.playerType().isWatchPage();
    }

    private static boolean foreground() {
        Activity activity = Afterglow.mainActivity();
        return activity != null && !activity.isFinishing() && !activity.isDestroyed()
                && activity.hasWindowFocus();
    }

    private static void maybeEnter() {
        try {
            observe();
            if (!activeWatch() || controller.get() == null) return;
            long token = SESSION.claimEntry();
            if (token < 0 || !PlayerBehavior.autoFullscreen()) return;
            PlayerController player = VideoState.currentController();
            FullscreenController host = controller.get();
            // The iOS watch player schedules this 0.75 seconds after content activation.
            Afterglow.runOnMainDelayed(() -> {
                try {
                    if (controller.get() == host && SESSION.matches(token, VideoState.currentController(), VideoState.videoId())
                            && player == VideoState.currentController() && activeWatch() && foreground()
                            && PlayerBehavior.autoFullscreen() && VideoState.playerStatus() == PlayerStatus.VIDEO_PLAYING
                            && VideoState.playerType() == PlayerType.WATCH_WHILE_MAXIMIZED) {
                        host.afterglow_enterFullscreen();
                    }
                } catch (Throwable error) { Afterglow.error("Fullscreen.enter", error); }
            }, 750);
        } catch (Throwable error) { Afterglow.error("Fullscreen.activation", error); }
    }

    private static void maybeExit() {
        try {
            if (!activeWatch() || !PlayerBehavior.exitFullscreen()
                    || VideoState.playerType() != PlayerType.WATCH_WHILE_FULLSCREEN) return;
            long token = observe();
            FullscreenController host = controller.get();
            if (host == null) return;
            // Status hooks run before native code. Finish that update before changing layout.
            Afterglow.runOnMainDelayed(() -> {
                try {
                    if (controller.get() == host && SESSION.matches(token, VideoState.currentController(), VideoState.videoId())
                            && activeWatch() && foreground() && PlayerBehavior.exitFullscreen()
                            && VideoState.playerStatus() == PlayerStatus.ENDED
                            && VideoState.playerType() == PlayerType.WATCH_WHILE_FULLSCREEN) {
                        host.afterglow_exitFullscreen();
                    }
                } catch (Throwable error) { Afterglow.error("Fullscreen.exit", error); }
            }, 0);
        } catch (Throwable error) { Afterglow.error("Fullscreen.finish", error); }
    }
}
