package io.github.bryceaspringfield.morphe.extension.youtube;

import android.content.Context;
import android.media.AudioManager;
import android.net.ConnectivityManager;
import android.net.Network;
import android.os.SystemClock;
import android.view.KeyEvent;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.shared.VideoState;

/**
 * Recovers a video the connection change left stopped. The player pauses itself about 2 s after the connection
 * drops, and stays paused, or keeps a frozen position, after the connection returns. So the state is noted when the
 * connection is lost; from 3 s after a network becomes the default, a video playing before the loss and now paused is
 * sent a seek to its position (a new stream request on the new connection) and a play key, and a playing video whose
 * position has not moved in 4 s is sent the seek. A video the user paused before the loss is left paused.
 */
final class NetworkRecovery {

    private static boolean registered;
    /** Whether a video was playing when the connection was last lost, or when the new network arrived. */
    private static volatile boolean wasPlaying;

    private NetworkRecovery() {
    }

    static synchronized void register() {
        if (registered) return;
        registered = true;
        try {
            ConnectivityManager cm = (ConnectivityManager) Utils.getContext().getSystemService(Context.CONNECTIVITY_SERVICE);
            cm.registerDefaultNetworkCallback(new ConnectivityManager.NetworkCallback() {
                @Override
                public void onLost(Network network) {
                    wasPlaying = playing();
                }

                @Override
                public void onAvailable(Network network) {
                    if (!XSettings.FIX_NETWORK_RECOVERY.get()) return;
                    if (playing()) wasPlaying = true;
                    Utils.runOnMainThreadDelayed(() -> check(0), 3000);
                }
            });
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: network callback not registered", t);
        }
    }

    private static boolean playing() {
        try {
            VideoState s = VideoState.getCurrent();
            return s == VideoState.PLAYING || s == VideoState.RECOVERABLE_ERROR;
        } catch (Throwable t) {
            return false;
        }
    }

    private static void check(int round) {
        try {
            if (PlayerType.getCurrent().isNoneOrHidden() || VideoInformation.getVideoLength() <= 0) return;
            final long before = VideoInformation.getVideoTime();
            if (wasPlaying && !playing()) {
                Logger.printDebug(() -> "YouTube Extras: playback stopped at " + before + " ms by the connection change; resuming");
                VideoInformation.seekTo(before);
                Utils.runOnMainThreadDelayed(NetworkRecovery::play, 800);
                if (round < 2) Utils.runOnMainThreadDelayed(() -> check(round + 1), 5000);
                else wasPlaying = false;
                return;
            }
            Utils.runOnMainThreadDelayed(() -> {
                long after = VideoInformation.getVideoTime();
                if (after != before || !playing()) {
                    wasPlaying = false;
                    return;
                }
                Logger.printDebug(() -> "YouTube Extras: playback stuck at " + after + " ms after the connection changed; reloading");
                VideoInformation.seekTo(after);
                if (round < 2) Utils.runOnMainThreadDelayed(() -> check(round + 1), 5000);
            }, 4000);
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: network recovery failed", t);
        }
    }

    /** Sends the play media key, which the system routes to this app's media session, the one playing last. */
    private static void play() {
        try {
            if (playing()) return;
            AudioManager am = (AudioManager) Utils.getContext().getSystemService(Context.AUDIO_SERVICE);
            long now = SystemClock.uptimeMillis();
            am.dispatchMediaKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_MEDIA_PLAY, 0));
            am.dispatchMediaKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_UP, KeyEvent.KEYCODE_MEDIA_PLAY, 0));
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: play key not sent", t);
        }
    }
}
