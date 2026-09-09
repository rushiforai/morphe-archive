package app.vantage.extension.music;

import android.app.Activity;
import android.os.SystemClock;
import android.util.Log;

/**
 * Keeps YouTube Music's background playback alive when the SYSTEM destroys
 * MusicActivity to reclaim memory.
 *
 * <p>Why the activity dies at all: ActivityThread installs a BinderInternal GC
 * watcher at attach time. After any GC, if activities have changed and the
 * app's own ART heap is above 3/4 of Runtime.maxMemory(), it calls
 * ActivityTaskManager.getService().releaseSomeActivities(mAppThread). The system
 * then runs WindowProcessController.releaseSomeActivities("low-mem"), which
 * calls ActivityRecord.destroyImmediately("low-mem") on every activity of that
 * process that is non-visible, stopped and has saved state. It is the only path
 * that destroys a STOPPED, NON-VISIBLE activity without finishing it, so
 * isFinishing() is false there and true for every user-initiated close.
 *
 * <p>isFinishing() alone is not enough, though: a configuration-change relaunch
 * (rotation, dark mode, locale) also destroys the activity with isFinishing()
 * false, and there the teardown is followed immediately by a fresh onCreate, so
 * suppressing anything would be wrong. isChangingConfigurations() separates the
 * two.
 *
 * <p>What YouTube Music then does: MusicActivity.onDestroy tears down its peer
 * graph, the media session is deactivated, MedialibPlayer.stopVideo runs with
 * STOPPAGE_DIRECTOR_RESET_INTERNALLY, the media foreground service drops and
 * the process goes cached - so playback stops even though the player itself
 * lives in an application-scoped component and had been happily playing with
 * the activity merely stopped.
 *
 * <p>What this class does: it opens a short suppression window when a destroy
 * arrives that the user did not ask for, and swallows the two teardown calls
 * that stop playback while that window is open. Everything else about the
 * destroy proceeds normally, so the activity is still released and its memory
 * still reclaimed - only the playback teardown is skipped.
 */
public final class KeepPlayback {

    private static final String TAG = "VKEEP";

    /**
     * How long after a system-initiated destroy the teardown calls are
     * swallowed. The observed teardown lands within ~40 ms of onDestroy, but
     * parts of it are posted through the main-thread Handler and through Rx
     * observers, so the window has to outlive the current message. It is kept
     * short so a genuine later stop (a pause or dismiss from the notification)
     * is never affected.
     */
    private static final long WINDOW_MS = 5_000L;

    /**
     * The one stoppage reason ever swallowed: the reason the failing teardown
     * passes to stopVideo, as seen in the reproduction logs
     * ("MedialibPlayer.stopVideo(), STOPPAGE_DIRECTOR_RESET_INTERNALLY").
     *
     * <p>Compared as a NAME, not as an ordinal. The patch injects a call to the
     * app's own reason-name mapper and hands the result here, so nothing in
     * this patch depends on the enum's numbering surviving an app update. A
     * user asking the app to stop arrives as a different name (ordinal 33 on
     * the emulator) and is never affected.
     */
    private static final String STOPPAGE_DIRECTOR_RESET_INTERNALLY =
            "STOPPAGE_DIRECTOR_RESET_INTERNALLY";

    /** Set true to log every hook with a stack trace. */
    private static final boolean DIAG = false;

    /** Main-thread only in practice; volatile so a player thread sees it. */
    private static volatile long suppressUntil = 0L;

    private KeepPlayback() {}

    /**
     * Called first thing in MusicActivity.onDestroy().
     *
     * @param activity the MusicActivity being destroyed
     */
    public static void onActivityDestroy(Object activity) {
        boolean finishing = true;
        boolean changingConfigurations = false;
        try {
            if (activity instanceof Activity) {
                Activity a = (Activity) activity;
                finishing = a.isFinishing();
                changingConfigurations = a.isChangingConfigurations();
            }
        } catch (Exception ex) {
            // Fail closed: treat an unreadable state as a user-initiated close
            // so playback stops the way it does today.
            Log.e(TAG, "could not read the activity state, not suppressing", ex);
            finishing = true;
            changingConfigurations = false;
        }

        boolean suppress = !finishing && !changingConfigurations;
        // finishing: back press or a swipe from recents, the user closed the app.
        // changingConfigurations: a rotation or theme change, a fresh onCreate
        // follows immediately and the app re-establishes its own state.
        suppressUntil = suppress ? SystemClock.elapsedRealtime() + WINDOW_MS : 0L;

        // Logged unconditionally: a MusicActivity destroy is rare, and this one
        // line is what tells a "playback died again" report apart from a
        // user-initiated close.
        Log.i(TAG, "MusicActivity destroy: finishing=" + finishing
                + " changingConfigurations=" + changingConfigurations
                + " suppressPlaybackTeardown=" + suppress);
        if (DIAG) {
            Log.w(TAG, "onActivityDestroy stack", new Throwable("onDestroy"));
        }
    }

    /**
     * Called first thing in BackgroundPlayerService.onTaskRemoved(), which is
     * how a swipe from recents stops playback. Closing the window there means a
     * swipe that lands seconds after a system destroy still stops playback.
     */
    public static void onPlayerServiceTaskRemoved() {
        Log.i(TAG, "BackgroundPlayerService.onTaskRemoved: closing the suppression window");
        suppressUntil = 0L;
    }

    /**
     * Called first thing in MedialibPlayer.stopVideo(int reason), with the
     * reason already mapped to its name by the app's own mapper.
     *
     * @param reasonName the STOPPAGE_* name, or null if the mapper returned none
     * @return true to swallow the stop
     */
    public static boolean onBeforeStopVideo(String reasonName) {
        boolean suppress = STOPPAGE_DIRECTOR_RESET_INTERNALLY.equals(reasonName) && isWindowOpen();
        if (DIAG) {
            Log.w(TAG, "stopVideo reason=" + reasonName + " suppress=" + suppress,
                    new Throwable("stopVideo"));
        }
        if (suppress) {
            Log.i(TAG, "kept playback: swallowed stopVideo(" + reasonName
                    + ") after a system-initiated MusicActivity destroy");
        }
        return suppress;
    }

    /**
     * Called first thing in the media-session activate/deactivate method.
     * Only a deactivation is ever swallowed.
     *
     * @param active the requested active state
     * @return true to swallow the call
     */
    public static boolean onBeforeSetMediaSessionActive(boolean active) {
        boolean suppress = !active && isWindowOpen();
        if (DIAG) {
            Log.w(TAG, "setMediaSessionActive " + active + " suppress=" + suppress,
                    new Throwable("setActive"));
        }
        if (suppress) {
            Log.i(TAG, "kept playback: swallowed MediaSession setActive(false) "
                    + "after a system-initiated MusicActivity destroy");
        }
        return suppress;
    }

    private static boolean isWindowOpen() {
        // elapsedRealtime, not currentTimeMillis: a wall-clock jump (NTP, the
        // user changing the time) must not widen or close the window.
        long until = suppressUntil;
        return until != 0L && SystemClock.elapsedRealtime() < until;
    }
}
