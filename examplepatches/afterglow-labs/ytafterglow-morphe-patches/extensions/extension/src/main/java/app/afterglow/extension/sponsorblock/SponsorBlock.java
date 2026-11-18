package app.afterglow.extension.sponsorblock;

import android.util.Log;
import java.lang.ref.WeakReference;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.video.PlaybackState;
import app.afterglow.extension.video.PlayerController;
import app.afterglow.extension.video.PlayerStatus;
import app.afterglow.extension.video.PlayerType;
import app.afterglow.extension.video.VideoState;

/** Own SponsorBlock client, driven by the active native player director, including Shorts. */
public final class SponsorBlock {
    static final SponsorSession SESSION = new SponsorSession();
    private static SponsorClient client;
    private static boolean installed, tickPending;
    private static long requestedGeneration = -1;

    private SponsorBlock() {}

    public static synchronized void install() {
        if (installed) return;
        installed = true;
        client = new SponsorClient(Afterglow::runOnMain);
        VideoState.addListener(new VideoState.Listener() {
            @Override public void onNewVideo(String id) {
                // Preserve every active-video transition, even A -> B -> A between two ticks.
                // Preloaded Shorts are already excluded by VideoState's director selection.
                SESSION.activate(id);
                Afterglow.runOnMain(() -> {
                    SponsorNotice.dismiss(); SponsorMarkers.invalidate(); schedule(0);
                });
            }
            @Override public void onVideoTime(long time) { wake(); }
            @Override public void onPlayerStatus(PlayerStatus status) { wake(); }
            @Override public void onPlayerType(PlayerType type) { wake(); }
            @Override public void onPlaybackState(PlaybackState state) { wake(); }
            @Override public void onShortsPlayerOpen(boolean open) { wake(); }
        });
        AfterglowPrefs.addListener(key -> {
            if (key != null && !key.startsWith("sponsorBlock")) return;
            Afterglow.runOnMain(() -> {
                requestedGeneration = -1;
                SponsorNotice.dismiss(); SponsorMarkers.invalidate(); schedule(0);
            });
        });
        wake();
    }

    private static void wake() { Afterglow.runOnMain(() -> schedule(0)); }
    private static void schedule(long delay) {
        if (tickPending) return;
        tickPending = true;
        Afterglow.runOnMainDelayed(() -> {
            tickPending = false;
            try {
                update();
                if (playing()) schedule(200);
            } catch (Throwable error) { Afterglow.error("SponsorBlock.tick", error); }
        }, delay);
    }

    static boolean eligible() {
        boolean shorts = VideoState.isShortsPlayerInFront();
        return SponsorSettings.current().shouldRun(shorts) && !VideoState.isAdPlaying()
                && (shorts || VideoState.playerType().isWatchPage()) && !VideoState.videoId().isEmpty();
    }

    private static boolean playing() {
        if (!eligible() || VideoState.playerStatus() != PlayerStatus.VIDEO_PLAYING) return false;
        // Shorts has its own play/pause UI; the watch-page control state can still describe the old video.
        if (VideoState.isShortsPlayerInFront()) return true;
        PlaybackState state = VideoState.playbackState();
        return state == PlaybackState.PLAYING || state == PlaybackState.NEW;
    }

    private static void update() {
        if (!eligible()) { SponsorNotice.dismiss(); return; }
        String id = VideoState.videoId();
        if (!id.equals(SESSION.videoId())) {
            SESSION.activate(id); SponsorNotice.dismiss(); SponsorMarkers.invalidate();
        }
        long generation = SESSION.generation();
        if (requestedGeneration != generation) {
            requestedGeneration = generation;
            client.fetch(id, (segments, error) -> {
                try {
                    if (!id.equals(VideoState.videoId()) || !SESSION.accept(id, generation, segments)) return;
                    if (error != null) Log.w(Afterglow.TAG, "SponsorBlock request unavailable: " + error.getClass().getSimpleName());
                    else Log.i(Afterglow.TAG, "SponsorBlock loaded " + segments.size() + " segments");
                    SponsorMarkers.invalidate(); wake();
                } catch (Throwable failure) { Afterglow.error("SponsorBlock.response", failure); }
            });
        }
        if (!playing()) return;
        long time = VideoState.videoTime();
        if (time < 0) return;
        SponsorSession.Skip skip = SESSION.claim(time / 1000.0, SponsorSettings.current().skipCategories);
        if (skip == null) return;
        PlayerController controller = VideoState.currentController();
        if (!id.equals(VideoState.videoId()) || !VideoState.seekTo(Math.round(skip.segment.end * 1000))) {
            SESSION.reject(skip); return;
        }
        Log.i(Afterglow.TAG, "SponsorBlock skipped " + skip.segment.category.id + " " + skip.segment.start + ".." + skip.segment.end);
        if (!id.equals(VideoState.videoId()) || generation != SESSION.generation()) return;
        WeakReference<PlayerController> owner = new WeakReference<>(controller);
        SponsorNotice.show("Skipped " + skip.segment.category.displayName, () -> {
            if (!id.equals(VideoState.videoId()) || owner.get() == null || owner.get() != VideoState.currentController()) return;
            Double start = SESSION.consumeUndo(skip);
            if (start != null && VideoState.seekTo(Math.round(start * 1000)))
                Log.i(Afterglow.TAG, "SponsorBlock undo " + start);
        });
    }
}
