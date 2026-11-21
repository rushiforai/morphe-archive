/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.kljjh.flymelyrics;

import android.content.Context;
import android.media.MediaMetadata;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.lang.ref.WeakReference;

public final class FlymeController {
    static final String FILE = "flyme_status_lyrics";
    static final String KEY = "flyme_status_lyrics_enabled";
    private static final Handler handler = new Handler(Looper.getMainLooper());
    private static final Runnable task = FlymeController::tick;
    private static Context app;
    private static WeakReference<MediaSession> session = new WeakReference<>(null);
    private static boolean playing, scheduled, logged;
    private static String rawTitle;
    private static String[] displayed;

    public static synchronized void onMetadata(Context c, MediaSession s, MediaMetadata m) {
        if (c == null) return;
        app = c.getApplicationContext();
        FlymeLyrics.onMetadata(app, s, m);
        session = new WeakReference<>(s);
        rawTitle = m == null ? null : m.getString(MediaMetadata.METADATA_KEY_TITLE);
        displayed = null;
        try { if (m != null) displayed = FlymeSource.identify(rawTitle, m.getString(MediaMetadata.METADATA_KEY_ARTIST)); }
        catch (RuntimeException | LinkageError e) { report(e); }
        refresh();
    }
    public static synchronized void onPlaybackState(Context c, PlaybackState state) {
        if (c == null) return;
        app = c.getApplicationContext();
        playing = state != null && state.getState() == PlaybackState.STATE_PLAYING;
        FlymeLyrics.onPlaybackState(app, state);
        refresh();
    }
    static boolean enabled(Context c) { return c.getSharedPreferences(FILE, Context.MODE_PRIVATE).getBoolean(KEY, true); }
    static synchronized void setEnabled(Context c, boolean value) {
        c.getSharedPreferences(FILE, Context.MODE_PRIVATE).edit().putBoolean(KEY, value).apply();
        refresh();
    }
    private static boolean active() {
        return app != null && FlymeLyrics.supported() && playing && displayed != null && session.get() != null && enabled(app) && FlymeSource.enabled();
    }
    public static synchronized void refresh() {
        try {
            if (active()) {
                if (!scheduled) scheduled = handler.post(task);
                return;
            }
        } catch (RuntimeException | LinkageError e) { report(e); }
        handler.removeCallbacks(task);
        scheduled = false;
        FlymeLyrics.clear(app);
    }
    private static synchronized void tick() {
        scheduled = false;
        try {
            if (!active()) { FlymeLyrics.clear(app); return; }
            FlymeLyrics.onLine(app, session.get(), FlymeTiming.line(app, displayed, rawTitle));
            scheduled = handler.postDelayed(task, 300); // Official LyricsTicker cadence.
        } catch (RuntimeException | LinkageError e) { FlymeLyrics.clear(app); report(e); }
    }
    private static void report(Throwable e) {
        if (!logged) { logged = true; Log.w("FlymeLyrics", "Could not read official lyrics", e); }
    }
    private FlymeController() { }
}
