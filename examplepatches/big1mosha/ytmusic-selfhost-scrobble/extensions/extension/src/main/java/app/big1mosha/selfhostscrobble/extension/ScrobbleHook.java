/*
 * Personal use only. See the README for details.
 */

package app.big1mosha.selfhostscrobble.extension;

import android.media.MediaMetadata;
import android.media.session.PlaybackState;
import android.util.Log;

/**
 * Entry points called by the patched YouTube Music bytecode.
 */
@SuppressWarnings("unused")
public final class ScrobbleHook {
    private static final String TAG = "SelfHostScrobble";

    private ScrobbleHook() {
    }

    /**
     * Called before the media session receives new track metadata.
     */
    public static void onSetMetadata(MediaMetadata metadata) {
        try {
            ScrobbleManager.getInstance().onSetMetadata(metadata);
        } catch (Throwable t) {
            Log.e(TAG, "onSetMetadata failed", t);
        }
    }

    /**
     * Called before the media session receives a new playback state.
     */
    public static void onSetPlaybackState(PlaybackState state) {
        try {
            ScrobbleManager.getInstance().onSetPlaybackState(state);
        } catch (Throwable t) {
            Log.e(TAG, "onSetPlaybackState failed", t);
        }
    }
}
