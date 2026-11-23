package nl.johninnl.eclipse.auto;

import android.content.ComponentName;
import android.content.Context;
import android.media.MediaMetadata;
import android.media.browse.MediaBrowser;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.util.ArrayList;
import java.util.WeakHashMap;

/**
 * The application-owned link to Eclipse's own playback service: a framework MediaBrowser
 * connected to {@code PlaybackService} (which also starts it) and a MediaController on the
 * session token it yields. A car screen is never the playback owner: the link outlives screens
 * under {@link PlaybackLease} and is released when nothing needs it.
 *
 * All calls and callbacks run on the main thread.
 */
final class MediaLink {
    interface Listener {
        /** The link is ready: a token can be registered with the host. */
        void connected();
        /** Playback state or metadata changed. */
        void changed();
        /** The link failed or ended; {@code reason} is shown to the driver. */
        void disconnected(String reason);
    }

    static final String SERVICE_CLASS = "com.eclipse.android.core.audio.PlaybackService";
    private static final long PAUSE_KEEP_MS = 300000L;
    private static final long PLAY_REQUEST_KEEP_MS = 15000L;

    private static MediaLink shared;

    static MediaLink get(Context context) {
        if (shared == null || shared.closed) shared = new MediaLink(context.getApplicationContext());
        return shared;
    }

    private final Context context;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final WeakHashMap<Listener, Boolean> listeners = new WeakHashMap<>();
    private final Runnable retire = this::retireIfUnused;
    private MediaBrowser browser;
    private MediaController controller;
    private MediaController.Callback callback;
    private boolean closed;
    private boolean connecting;
    private int generation;
    private int lastState = PlaybackState.STATE_NONE;
    private long retainUntil;
    private long playRequestUntil;

    private MediaLink(Context context) { this.context = context; }

    void attach(Listener listener) {
        listeners.put(listener, Boolean.TRUE);
        main.removeCallbacks(retire);
        if (ready()) main.post(() -> { if (listeners.containsKey(listener) && ready()) listener.connected(); });
        else if (!connecting) connect();
    }

    void detach(Listener listener) {
        listeners.remove(listener);
        if (listeners.isEmpty()) {
            PlaybackState state = controller == null ? null : controller.getPlaybackState();
            if (state != null && state.getState() == PlaybackState.STATE_PAUSED && controller.getMetadata() != null) {
                retainUntil = Math.max(retainUntil, SystemClock.uptimeMillis() + PAUSE_KEEP_MS);
            }
            retireIfUnused();
        }
    }

    boolean ready() { return !closed && controller != null && browser != null && browser.isConnected(); }

    /** The framework session token, valid while {@link #ready()}. */
    MediaSession.Token sessionToken() { return browser.getSessionToken(); }

    int generation() { return generation; }

    boolean current(int captured) { return ready() && generation == captured; }

    /** Keep the link alive briefly: a play request has been sent and the state has not caught up. */
    void notePlayRequest() { playRequestUntil = SystemClock.uptimeMillis() + PLAY_REQUEST_KEEP_MS; }

    private void connect() {
        connecting = true;
        final int expected = ++generation;
        browser = new MediaBrowser(context, new ComponentName(context.getPackageName(), SERVICE_CLASS),
            new MediaBrowser.ConnectionCallback() {
                @Override public void onConnected() {
                    if (closed || expected != generation) return;
                    try {
                        controller = new MediaController(context, browser.getSessionToken());
                        if (!context.getPackageName().equals(controller.getPackageName())) {
                            throw new SecurityException("Foreign playback session");
                        }
                        callback = new MediaController.Callback() {
                            @Override public void onPlaybackStateChanged(PlaybackState state) {
                                if (closed || expected != generation) return;
                                int now = state == null ? PlaybackState.STATE_NONE : state.getState();
                                if (PlaybackLease.ongoing(now) || now == PlaybackState.STATE_ERROR) playRequestUntil = 0;
                                if (now == PlaybackState.STATE_PAUSED && lastState != now) {
                                    retainUntil = SystemClock.uptimeMillis() + PAUSE_KEEP_MS;
                                }
                                boolean moved = now != lastState;
                                lastState = now;
                                // Position-only updates keep the same state and redraw nothing.
                                if (moved) notifyChanged();
                                retireIfUnused();
                            }

                            @Override public void onMetadataChanged(MediaMetadata metadata) { notifyChanged(); }

                            @Override public void onSessionDestroyed() { fail("Eclipse playback ended. Reconnect to continue."); }

                            private void notifyChanged() {
                                if (closed || expected != generation) return;
                                for (Listener listener : new ArrayList<>(listeners.keySet())) {
                                    if (listener != null) listener.changed();
                                }
                            }
                        };
                        controller.registerCallback(callback, main);
                        connecting = false;
                        for (Listener listener : new ArrayList<>(listeners.keySet())) {
                            if (listener != null) listener.connected();
                        }
                        retireIfUnused();
                    } catch (RuntimeException failure) {
                        fail("Could not connect Eclipse playback. Open Eclipse and sign in, then reconnect.");
                    }
                }

                @Override public void onConnectionFailed() {
                    if (expected == generation) fail("Open Eclipse on your phone and sign in, then reconnect.");
                }

                @Override public void onConnectionSuspended() {
                    if (expected == generation) fail("Eclipse disconnected. Reconnect to continue.");
                }
            }, null);
        browser.connect();
    }

    private void retireIfUnused() {
        main.removeCallbacks(retire);
        if (closed || !listeners.isEmpty()) return;
        PlaybackState state = controller == null ? null : controller.getPlaybackState();
        int value = state == null ? PlaybackState.STATE_NONE : state.getState();
        long now = SystemClock.uptimeMillis();
        long pausedRemaining = retainUntil - now;
        long requestRemaining = playRequestUntil - now;
        if (PlaybackLease.retain(value, false, pausedRemaining, requestRemaining)) {
            long remaining = Math.max(value == PlaybackState.STATE_PAUSED ? pausedRemaining : 0, requestRemaining);
            if (!PlaybackLease.ongoing(value)) main.postDelayed(retire, Math.max(1, remaining));
            return;
        }
        close();
    }

    private void fail(String reason) {
        ArrayList<Listener> targets = new ArrayList<>(listeners.keySet());
        close();
        for (Listener listener : targets) {
            if (listener != null) listener.disconnected(reason);
        }
    }

    private void close() {
        if (closed) return;
        closed = true;
        generation++;
        connecting = false;
        main.removeCallbacks(retire);
        if (controller != null && callback != null) controller.unregisterCallback(callback);
        callback = null;
        controller = null;
        if (browser != null) browser.disconnect();
        browser = null;
        listeners.clear();
        if (shared == this) shared = null;
    }
}
