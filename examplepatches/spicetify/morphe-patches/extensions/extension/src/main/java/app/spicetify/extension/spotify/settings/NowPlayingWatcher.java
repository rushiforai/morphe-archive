package app.spicetify.extension.spotify.settings;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.media.MediaMetadata;
import android.media.browse.MediaBrowser;
import android.media.session.MediaController;
import android.os.Handler;
import android.os.Looper;
import android.service.media.MediaBrowserService;
import android.util.Log;

/**
 * Follows the track in Spotify's own media session, through the media browser service that
 * Android Auto and other accessories use, so server pages can mark the song that is playing.
 */
final class NowPlayingWatcher {
    private static final String TAG = "SpicetifyNowPlaying";
    private static final String SERVICE = "com.spotify.mediabrowserservice.mediabrowserservice.SpotifyMediaBrowserService";

    interface Listener { void changed(String title, String album); }

    private final Context context;
    private final Listener listener;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private MediaBrowser browser;
    private MediaController controller;
    private final MediaController.Callback callback = new MediaController.Callback() {
        @Override public void onMetadataChanged(MediaMetadata metadata) { publish(metadata); }
        @Override public void onSessionDestroyed() { publish(null); }
    };

    NowPlayingWatcher(Context context, Listener listener) {
        this.context = context;
        this.listener = listener;
    }

    void start() {
        if (browser != null) return;
        ComponentName service = new ComponentName(context.getPackageName(), SERVICE);
        if (context.getPackageManager().resolveService(new Intent(MediaBrowserService.SERVICE_INTERFACE).setComponent(service), 0) == null) return;
        try {
            browser = new MediaBrowser(context, service, new MediaBrowser.ConnectionCallback() {
                @Override public void onConnected() {
                    if (browser == null) return;
                    controller = new MediaController(context, browser.getSessionToken());
                    controller.registerCallback(callback, handler);
                    publish(controller.getMetadata());
                }
                @Override public void onConnectionFailed() { Log.w(TAG, "Spotify's media browser refused the connection; the playing song is not marked."); }
                @Override public void onConnectionSuspended() { detachController(); }
            }, null);
            browser.connect();
        } catch (RuntimeException error) {
            Log.w(TAG, "Could not follow Spotify's playing song", error);
            browser = null;
        }
    }

    void stop() {
        detachController();
        if (browser != null) browser.disconnect();
        browser = null;
    }

    private void detachController() {
        if (controller != null) controller.unregisterCallback(callback);
        controller = null;
    }

    private void publish(MediaMetadata metadata) {
        listener.changed(metadata == null ? null : metadata.getString(MediaMetadata.METADATA_KEY_TITLE),
                metadata == null ? null : metadata.getString(MediaMetadata.METADATA_KEY_ALBUM));
    }
}
