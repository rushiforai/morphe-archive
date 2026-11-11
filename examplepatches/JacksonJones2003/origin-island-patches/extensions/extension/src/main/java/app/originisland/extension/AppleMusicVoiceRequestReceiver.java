package app.originisland.extension;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.media.browse.MediaBrowser;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.util.Log;

/**
 * Plays a song asked for by voice, which the app that takes the requests of Jovi sends here.
 *
 * vivo does not let an app in the background connect to Apple Music, which that app is when Jovi
 * asks it, so it sends what was asked for here, and the song is searched for and played in Apple
 * Music itself.
 */
@SuppressWarnings("unused")
public final class AppleMusicVoiceRequestReceiver extends BroadcastReceiver {

    private static final String TAG = "OriginIslandAppleMusic";

    /**
     * The app that takes the requests of Jovi, under the package of QQ Music, which Jovi knows.
     */
    private static final String JOVI_STAND_IN_PACKAGE = "com.tencent.qqmusic";

    private static final String EXTRA_QUERY = "query";
    private static final String EXTRA_TITLE = "title";
    private static final String EXTRA_ARTIST = "artist";

    private static final String PLAYBACK_SERVICE = "com.apple.android.music.player.MediaPlaybackService";
    private static final long CONNECT_TIMEOUT_MS = 8000;

    private static final Handler mainHandler = new Handler(Looper.getMainLooper());

    @Override
    public void onReceive(Context context, Intent intent) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.UPSIDE_DOWN_CAKE
                || !JOVI_STAND_IN_PACKAGE.equals(getSentFromPackage())) {
            Log.w(TAG, "Voice request from an app that is not the Jovi stand-in, ignored");
            return;
        }
        String command = intent.getStringExtra("command");
        if (command != null) {
            MediaSession session = AppleMusicCardPatch.getSession();
            if (session == null) {
                return;
            }
            MediaController.TransportControls controls = session.getController().getTransportControls();
            switch (command) {
                case "play":
                    controls.play();
                    break;
                case "pause":
                    controls.pause();
                    break;
                case "next":
                    controls.skipToNext();
                    break;
                case "previous":
                    controls.skipToPrevious();
                    break;
            }
            return;
        }
        String query = intent.getStringExtra(EXTRA_QUERY);
        if (query == null || query.trim().isEmpty()) {
            return;
        }
        Bundle extras = new Bundle();
        String title = intent.getStringExtra(EXTRA_TITLE);
        String artist = intent.getStringExtra(EXTRA_ARTIST);
        if (title != null) {
            extras.putString(MediaStore.EXTRA_MEDIA_FOCUS, MediaStore.Audio.Media.ENTRY_CONTENT_TYPE);
            extras.putString(MediaStore.EXTRA_MEDIA_TITLE, title);
            if (artist != null) {
                extras.putString(MediaStore.EXTRA_MEDIA_ARTIST, artist);
            }
        }

        PendingResult pending = goAsync();
        Context app = context.getApplicationContext();
        MediaSession session = AppleMusicCardPatch.getSession();
        if (session != null) {
            Log.i(TAG, "Playing a voice request");
            session.getController().getTransportControls().playFromSearch(query, extras);
            pending.finish();
            return;
        }

        // The player is not running, which connecting to it starts.
        Log.i(TAG, "Starting the player for a voice request");
        MediaBrowser[] browser = {null};
        Runnable giveUp = () -> {
            if (browser[0] != null) {
                browser[0].disconnect();
                browser[0] = null;
                Log.w(TAG, "The player did not start for a voice request");
                pending.finish();
            }
        };
        browser[0] = new MediaBrowser(app, new ComponentName(app, PLAYBACK_SERVICE), new MediaBrowser.ConnectionCallback() {
            @Override
            public void onConnected() {
                MediaBrowser connected = browser[0];
                if (connected == null) {
                    return;
                }
                mainHandler.removeCallbacks(giveUp);
                Log.i(TAG, "Playing a voice request");
                new MediaController(app, connected.getSessionToken()).getTransportControls().playFromSearch(query, extras);
                // Stays connected a moment, so the player starts before it is let go.
                mainHandler.postDelayed(() -> {
                    connected.disconnect();
                    pending.finish();
                }, 3000);
                browser[0] = null;
            }

            @Override
            public void onConnectionFailed() {
                mainHandler.removeCallbacks(giveUp);
                giveUp.run();
            }
        }, null);
        AppleMusicCardPatch.allowOwnBrowser = true;
        mainHandler.postDelayed(() -> AppleMusicCardPatch.allowOwnBrowser = false, CONNECT_TIMEOUT_MS);
        browser[0].connect();
        mainHandler.postDelayed(giveUp, CONNECT_TIMEOUT_MS);
    }
}
