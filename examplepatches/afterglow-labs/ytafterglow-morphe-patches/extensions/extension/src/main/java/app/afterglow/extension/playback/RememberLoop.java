package app.afterglow.extension.playback;

import java.lang.ref.WeakReference;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.video.PlaybackState;
import app.afterglow.extension.video.PlayerStatus;
import app.afterglow.extension.video.PlayerType;
import app.afterglow.extension.video.VideoState;

/** Retains explicit native loop choices after the iOS three-second activation delay. */
public final class RememberLoop {
    private static final LoopSession SESSION = new LoopSession();
    private static WeakReference<LoopController> host = new WeakReference<>(null);
    private static boolean installed;
    private RememberLoop() {}

    private static boolean enabled() {
        return PlayerBehavior.rememberLoop();
    }

    public static void setController(LoopController value) {
        Afterglow.runOnMain(() -> {
            if (host.get() == value) return;
            SESSION.invalidatePending();
            host = new WeakReference<>(value);
            maybeRestore();
        });
    }

    public static synchronized void install() {
        if (installed) return;
        installed = true;
        VideoState.addListener(new VideoState.Listener() {
            @Override public void onNewVideo(String id) { Afterglow.runOnMain(RememberLoop::maybeRestore); }
            @Override public void onPlayerStatus(PlayerStatus status) { Afterglow.runOnMain(RememberLoop::maybeRestore); }
            @Override public void onPlaybackState(PlaybackState state) { Afterglow.runOnMain(RememberLoop::maybeRestore); }
            @Override public void onPlayerType(PlayerType type) {
                Afterglow.runOnMain(() -> {
                    if (type == PlayerType.NONE) SESSION.clear();
                    else maybeRestore();
                });
            }
        });
    }

    private static boolean activeWatch() {
        return !VideoState.isAdPlaying() && !VideoState.isShortsPlayerInFront()
                && VideoState.playerType().isWatchPage()
                && VideoState.currentController() != null && !VideoState.videoId().isEmpty();
    }

    private static void observe() {
        SESSION.update(VideoState.currentController(), VideoState.videoId(), enabled());
    }

    private static void maybeRestore() {
        try {
            observe();
            if (!enabled() || !activeWatch() || host.get() == null) return;
            long token = SESSION.claim();
            if (token < 0) return;
            WeakReference<LoopController> expected = host;
            Afterglow.runOnMainDelayed(() -> {
                boolean applied = false;
                try {
                    observe();
                    LoopController controller = expected.get();
                    if (enabled() && activeWatch() && controller != null && controller == host.get()
                            && SESSION.matches(token, VideoState.currentController(), VideoState.videoId())) {
                        int mode = AfterglowPrefs.getInt("loopMode");
                        controller.afterglow_setLoopMode(mode >= 0 && mode <= 2 ? mode : 0);
                        applied = true;
                    }
                } catch (Throwable error) { Afterglow.error("RememberLoop.restore", error); }
                finally { SESSION.finish(token, applied); }
            }, 3000);
        } catch (Throwable error) { Afterglow.error("RememberLoop.activation", error); }
    }

    /** Injected only into user action/command sites; automatic native resets are excluded. */
    public static void onManualChoice(int mode) {
        Afterglow.runOnMain(() -> {
            try {
                observe();
                if (enabled() && activeWatch() && mode >= 0 && mode <= 2
                        && SESSION.canRecord(VideoState.currentController(), VideoState.videoId())) {
                    AfterglowPrefs.setInt("loopMode", mode);
                }
            } catch (Throwable error) { Afterglow.error("RememberLoop.manualChoice", error); }
        });
    }
}
