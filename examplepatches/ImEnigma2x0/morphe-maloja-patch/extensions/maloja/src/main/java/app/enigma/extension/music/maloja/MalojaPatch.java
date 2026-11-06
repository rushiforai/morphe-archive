package app.enigma.extension.music.maloja;

import android.media.MediaMetadata;
import android.media.session.PlaybackState;
import android.os.Handler;
import android.os.Looper;

import app.morphe.extension.shared.Logger;

@SuppressWarnings("unused")
public class MalojaPatch {
    /**
     * Injection point, at the start of the main activity creation.
     * <p>
     * Runs before the official shared extension may have set up the app context, so the work
     * is posted until the activity is created.
     */
    public static void onActivityCreated() {
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                MalojaScrobbleManager.getInstance();
                // Both may have been skipped if a media session hook ran before the app context was set.
                OfflinePlaybackScrobbler.start();
                ScrobbleQueue.start();
            } catch (Exception ex) {
                Logger.printException(() -> "onActivityCreated failure", ex);
            }
        });
    }

    /**
     * Injection point.
     */
    public static void onSetMetadata(MediaMetadata metadata) {
        try {
            MalojaScrobbleManager.getInstance().onSetMetadata(metadata);
        } catch (Exception ex) {
            Logger.printException(() -> "onSetMetadata failure", ex);
        }
    }

    /**
     * Injection point.
     */
    public static void onSetPlaybackState(PlaybackState state) {
        try {
            MalojaScrobbleManager.getInstance().onSetPlaybackState(state);
        } catch (Exception ex) {
            Logger.printException(() -> "onSetPlaybackState failure", ex);
        }
    }
}
