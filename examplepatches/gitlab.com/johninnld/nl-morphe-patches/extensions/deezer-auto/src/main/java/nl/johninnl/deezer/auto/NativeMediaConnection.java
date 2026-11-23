package nl.johninnl.deezer.auto;

import android.content.ComponentName;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.support.v4.media.MediaBrowserCompat;
import android.support.v4.media.session.MediaControllerCompat;
import android.support.v4.media.session.PlaybackStateCompat;
import java.util.ArrayList;
import java.util.WeakHashMap;

/** Application-owned controller lease; a car screen is never the playback owner. */
final class NativeMediaConnection {
    interface Listener { void connected(); void changed(); void disconnected(String reason); }
    private static NativeMediaConnection shared;
    static NativeMediaConnection get(Context context) {
        if (shared == null || shared.closed) shared = new NativeMediaConnection(context.getApplicationContext());
        return shared;
    }
    private final Context context;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final WeakHashMap<Listener, Boolean> listeners = new WeakHashMap<>();
    private final Runnable retire = this::retireIfUnused;
    private MediaBrowserCompat browser;
    private MediaControllerCompat controller;
    private MediaControllerCompat.Callback callback;
    private boolean closed, connecting;
    private int generation;
    private int lastState = PlaybackStateCompat.STATE_NONE;
    private long retainUntil, playRequestUntil;
    private String error;

    private NativeMediaConnection(Context context) { this.context = context; }
    void attach(Listener listener) {
        listeners.put(listener, Boolean.TRUE);
        main.removeCallbacks(retire);
        if (ready()) main.post(() -> { if (listeners.containsKey(listener) && ready()) listener.connected(); });
        else if (!connecting) connect();
    }
    void detach(Listener listener) {
        listeners.remove(listener);
        if (listeners.isEmpty()) {
            PlaybackStateCompat state = controller == null ? null : controller.getPlaybackState();
            if (state != null && state.getState() == PlaybackStateCompat.STATE_PAUSED && controller.getMetadata() != null)
                retainUntil = Math.max(retainUntil, SystemClock.uptimeMillis() + 300000L);
            retireIfUnused();
        }
    }
    boolean ready() { return !closed && controller != null && browser != null && browser.isConnected(); }
    MediaBrowserCompat browser() { return browser; }
    MediaControllerCompat controller() { return controller; }
    String error() { return error; }
    int generation() { return generation; }
    void notePlayRequest() { playRequestUntil = SystemClock.uptimeMillis() + 15000L; }
    boolean current(int captured) { return ready() && generation == captured; }

    private void connect() {
        connecting = true; error = null;
        final int expected = ++generation;
        browser = new MediaBrowserCompat(context, new ComponentName(context.getPackageName(),
            "com.deezer.feature.mediabrowser.DeezerMediaBrowserService"), new MediaBrowserCompat.ConnectionCallback() {
            @Override public void onConnected() {
                if (closed || expected != generation) return;
                try {
                    controller = new MediaControllerCompat(context, browser.getSessionToken());
                    if (!context.getPackageName().equals(controller.getPackageName())) throw new SecurityException("Foreign playback session");
                    callback = new MediaControllerCompat.Callback() {
                        @Override public void onQueueChanged(java.util.List<android.support.v4.media.session.MediaSessionCompat.QueueItem> queue) { changed(); }
                        @Override public void onPlaybackStateChanged(PlaybackStateCompat state) {
                            if (closed || expected != generation) return;
                            int now = state == null ? PlaybackStateCompat.STATE_NONE : state.getState();
                            if (PlaybackLease.ongoing(now) || now == PlaybackStateCompat.STATE_ERROR) playRequestUntil = 0;
                            if (now == PlaybackStateCompat.STATE_PAUSED && lastState != now)
                                retainUntil = SystemClock.uptimeMillis() + 300000L;
                            lastState = now;
                            changed(); retireIfUnused();
                        }
                        @Override public void onMetadataChanged(android.support.v4.media.MediaMetadataCompat metadata) { changed(); }
                        @Override public void onSessionDestroyed() { fail("Deezer playback ended. Reconnect to continue."); }
                        private void changed() {
                            if (closed || expected != generation) return;
                            for (Listener listener : new ArrayList<>(listeners.keySet())) if (listener != null) listener.changed();
                        }
                    };
                    controller.registerCallback(callback);
                    connecting = false;
                    for (Listener listener : new ArrayList<>(listeners.keySet())) if (listener != null) listener.connected();
                    retireIfUnused();
                } catch (RuntimeException failure) { fail("Could not connect Deezer playback. Open Deezer and sign in, then reconnect."); }
            }
            @Override public void onConnectionFailed() { if (expected == generation) fail("Open Deezer on your phone and sign in, then reconnect."); }
            @Override public void onConnectionSuspended() { if (expected == generation) fail("Deezer disconnected. Reconnect to continue."); }
        }, null);
        browser.connect();
    }
    private void retireIfUnused() {
        main.removeCallbacks(retire);
        if (closed || !listeners.isEmpty()) return;
        PlaybackStateCompat state = controller == null ? null : controller.getPlaybackState();
        int value = state == null ? PlaybackStateCompat.STATE_NONE : state.getState();
        long now = SystemClock.uptimeMillis();
        long pausedRemaining = retainUntil - now, requestRemaining = playRequestUntil - now;
        if (PlaybackLease.retain(value,false,pausedRemaining,requestRemaining)) {
            long remaining = Math.max(value == PlaybackStateCompat.STATE_PAUSED ? pausedRemaining : 0, requestRemaining);
            if (!PlaybackLease.ongoing(value)) main.postDelayed(retire,Math.max(1,remaining));
            return;
        }
        close();
    }
    private void fail(String reason) {
        error = reason;
        ArrayList<Listener> targets = new ArrayList<>(listeners.keySet());
        close();
        for (Listener listener : targets) if (listener != null) listener.disconnected(reason);
    }
    private void close() {
        if (closed) return;
        closed = true; generation++; connecting = false;
        main.removeCallbacks(retire);
        if (controller != null && callback != null) controller.unregisterCallback(callback);
        callback = null; controller = null;
        if (browser != null) browser.disconnect();
        browser = null; listeners.clear();
        if (shared == this) shared = null;
    }
}
