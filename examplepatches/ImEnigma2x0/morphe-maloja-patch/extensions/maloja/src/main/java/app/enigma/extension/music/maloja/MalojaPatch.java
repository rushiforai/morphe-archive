package app.enigma.extension.music.maloja;

import android.media.MediaMetadata;
import android.media.session.PlaybackState;

import app.morphe.extension.shared.Logger;

@SuppressWarnings("unused")
public class MalojaPatch {
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
