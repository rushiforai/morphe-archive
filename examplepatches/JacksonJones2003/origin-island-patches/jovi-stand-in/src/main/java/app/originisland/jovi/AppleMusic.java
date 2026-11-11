package app.originisland.jovi;

import android.content.ComponentName;
import android.content.Context;
import android.media.browse.MediaBrowser;
import android.media.session.MediaController;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

/**
 * A connection to the session of Apple Music, to tell Jovi what plays. vivo only lets it connect
 * while Apple Music runs and this app may reach it, so requests to play go another way.
 */
final class AppleMusic {

    static final String PACKAGE = "com.apple.android.music";
    private static final String SERVICE = "com.apple.android.music.player.MediaPlaybackService";
    private static final String TAG = "AppleMusicJovi";

    private static final Handler mainHandler = new Handler(Looper.getMainLooper());

    private static MediaBrowser browser;
    private static MediaController controller;
    private static final List<Consumer<MediaController>> waiting = new ArrayList<>();
    private static final List<Runnable> onConnectedListeners = new ArrayList<>();

    private AppleMusic() {
    }

    /**
     * @return The controller, or null while not connected.
     */
    static MediaController controller() {
        return controller;
    }

    static void addOnConnectedListener(Runnable listener) {
        onConnectedListeners.add(listener);
    }

    /**
     * Runs with the controller on the main thread once connected, or with null if Apple Music
     * cannot be reached.
     */
    static void withController(Context context, Consumer<MediaController> action) {
        mainHandler.post(() -> {
            if (controller != null && browser != null && browser.isConnected()) {
                action.accept(controller);
                return;
            }
            waiting.add(action);
            if (browser == null) {
                connect(context.getApplicationContext());
            }
        });
    }

    private static void connect(Context context) {
        Log.i(TAG, "Connecting to Apple Music");
        MediaBrowser[] self = {null};
        boolean[] done = {false};
        self[0] = new MediaBrowser(context, new ComponentName(PACKAGE, SERVICE), new MediaBrowser.ConnectionCallback() {
            @Override
            public void onConnected() {
                if (browser != self[0]) {
                    return;
                }
                controller = new MediaController(context, self[0].getSessionToken());
                Log.i(TAG, "Connected to Apple Music");
                for (Runnable listener : onConnectedListeners) {
                    listener.run();
                }
                flush(controller);
            }

            @Override
            public void onConnectionFailed() {
                // The callback can come more than once for an attempt.
                if (browser != self[0] || done[0]) {
                    return;
                }
                done[0] = true;
                Log.i(TAG, "Could not connect to Apple Music");
                reset();
            }

            @Override
            public void onConnectionSuspended() {
                if (browser != self[0]) {
                    return;
                }
                Log.i(TAG, "Apple Music went away");
                reset();
            }
        }, null);
        browser = self[0];
        self[0].connect();
    }

    private static void reset() {
        browser = null;
        controller = null;
        flush(null);
    }

    private static void flush(MediaController result) {
        List<Consumer<MediaController>> actions = new ArrayList<>(waiting);
        waiting.clear();
        for (Consumer<MediaController> action : actions) {
            try {
                action.accept(result);
            } catch (Exception ex) {
                Log.e(TAG, "Action failure", ex);
            }
        }
    }
}
