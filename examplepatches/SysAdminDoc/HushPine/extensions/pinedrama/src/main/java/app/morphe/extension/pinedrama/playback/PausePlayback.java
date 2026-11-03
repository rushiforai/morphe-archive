/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.pinedrama.playback;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.media.AudioManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.pinedrama.blockauthor.FeedVisibility;
import app.morphe.extension.pinedrama.navigation.StartPage;
import app.morphe.extension.pinedrama.wellbeing.SessionBudget;
import app.morphe.extension.pinedrama.wellbeing.SessionLockOverlay;
import app.morphe.extension.pinedrama.wellbeing.SessionPlaybackHold;

import java.lang.ref.WeakReference;

/**
 * Two switches for a feed that keeps playing when nobody is watching it.
 *
 * <p>Opening the comments leaves the video running behind the sheet, so the sound of a video
 * nobody can see plays over reading. And coming back to the app starts the feed again by
 * itself, which is the one moment a reader has clearly not asked for anything.
 *
 * <p>Both ask for the audio focus, which is how one app tells another to stop. TikTok 47.0.3's
 * player plays on through that, so both also pause the video on screen with PineDrama's own pause,
 * the one the session hold uses ({@link SessionPlaybackHold#pauseForSwitch}), and hand back only
 * the video they paused. The hold owns the focus while it is up, and it covers the feed and
 * swallows the touches, so neither of these does anything during one.
 */
public final class PausePlayback {
    /** Written from the audio focus callback, which is not guaranteed to be the main thread. */
    private static volatile boolean quietened;
    private static WeakReference<Activity> quietOwnerReference = new WeakReference<>(null);
    private static WeakReference<Object> quietPageReference = new WeakReference<>(null);

    /**
     * Held while a comment sheet is open or the feed is waiting for a tap. Nothing is done with
     * the callbacks beyond the one case that has to be handled: losing the focus for good drops
     * this off the focus stack, so the flag has to follow or nothing would ever ask again.
     */
    private static final AudioManager.OnAudioFocusChangeListener QUIET = change -> {
        if (change == AudioManager.AUDIOFOCUS_LOSS) quietened = false;
    };

    private static WeakReference<View> sheetReference = new WeakReference<>(null);
    /**
     * 47.0.3's comment sheet, drawn into the activity: the activity it is in, the decor view whose
     * layout passes are watched for it, and whether it is holding the feed.
     */
    private static WeakReference<Activity> panelActivityReference = new WeakReference<>(null);
    private static WeakReference<View> panelWatchedReference = new WeakReference<>(null);
    private static boolean panelHeld;
    private static WeakReference<Object> panelPageReference = new WeakReference<>(null);
    private static int panelChecksLeft;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final long PANEL_CHECK_MILLIS = 250;
    private static final Runnable PANEL_CHECK = PausePlayback::checkPanel;
    private static final android.view.ViewTreeObserver.OnGlobalLayoutListener PANEL_LAYOUT =
            PausePlayback::onPanelLayout;
    private static WeakReference<View> catcherReference = new WeakReference<>(null);
    /** Watches the feed go away under the catcher, so the catcher goes with it. */
    private static android.view.ViewTreeObserver.OnGlobalLayoutListener feedWatcher;
    private static WeakReference<ViewGroup> watchedRootReference = new WeakReference<>(null);
    private static boolean installed;
    /** PineDrama's screens that are started, weakly: the app is away once the last one stops. */
    private static final java.util.Set<Activity> STARTED =
            java.util.Collections.newSetFromMap(new java.util.WeakHashMap<>());

    /**
     * True once the app has been away. A resume that follows no pause is a dialog closing over
     * an activity that never left, and the reader did not go anywhere.
     */
    private static boolean wasAway;

    /** The feed's activity, from install: only its resumes are the feed coming up. */
    private static Class<?> feedClass;

    /**
     * Set at install when this process started from the launcher, and spent at the feed's first
     * resume either way. A link, a notification or a shortcut starts PineDrama for something else,
     * and a hold in front of it would only be in the way.
     */
    private static boolean firstStartPending;

    private PausePlayback() {
    }

    // ------------------------------------------------------------------ the comment sheet

    /**
     * Called as a comment cell is bound, which only happens while a sheet is open.
     *
     * <p>The cell is not attached to anything yet during the bind, so the walk up to the sheet
     * waits a post, which is the same thing the block-author takeover in the same callback does.
     */
    public static void onCommentCellBound(View cell) {
        return;
    }

    /**
     * The comment switch's row comes with Comment tools. This class is installed by every patch
     * that carries the playback bridge, so a value saved under a bundle that had the row, read in
     * one that hasn't, would pause the feed with no switch left to say why.
     */
    private static boolean commentPauseWanted() {
        return false;
    }

    /** Holds the feed while the sheet covers it, and hands it back once it has gone. */
    private static void syncPanel() {
        Activity activity = panelActivityReference.get();
        boolean wanted = commentPauseWanted();
        boolean visible = activity != null && wanted && ownsForeground(activity) && panelOpen(activity);
        Object page = FeedVisibility.playbackPage(activity);
        Object expected = panelPageReference.get();
        if (!visible) panelPageReference.clear();
        else if (expected == null || samePage(expected, page, activity)) {
            panelPageReference = new WeakReference<>(page);
        }
        boolean open = visible && panelPageReference.get() == page;
        if (open && !panelHeld && !SessionBudget.isLocked()) {
            panelHeld = true;
            quieten(activity);
            checkPanelSoon();
        } else if (!open && panelHeld) {
            panelHeld = false;
            // The switch turned off while the sheet is still up: the feature stops managing, and
            // that must not start the sound behind the open comments. The video stays as it is,
            // one tap from the reader; only the sheet going away hands it back playing.
            if (!wanted) handBack(false);
            else unquieten();
        }
    }

    /**
     * A layout pass in the feed's window. Opening the sheet lays it out, but that pass can come
     * while the sheet still sits below the screen, and the slide up after it makes no pass of its
     * own. So a pass that finds the sheet parked looks again a few times a second for a moment,
     * as a bind does. Before the sheet exists, or with the switch off, it's only the sync.
     */
    private static void onPanelLayout() {
        syncPanel();
        return;
    }

    private static boolean panelOpen(Activity activity) {
        return !activity.isFinishing() && !activity.isDestroyed()
                && FeedVisibility.isCommentSheetVisible(activity);
    }

    /**
     * A sheet that only slides makes no layout pass, so while it holds the feed, and for a
     * moment after a bind, it is also checked a few times a second.
     */
    private static void checkPanel() {
        syncPanel();
        if (panelHeld || --panelChecksLeft > 0) MAIN.postDelayed(PANEL_CHECK, PANEL_CHECK_MILLIS);
    }

    private static void checkPanelSoon() {
        MAIN.removeCallbacks(PANEL_CHECK);
        MAIN.postDelayed(PANEL_CHECK, PANEL_CHECK_MILLIS);
    }

    /** The activity a view is in, or null when its context is not one. */
    private static Activity activityOf(View view) {
        Context context = view.getContext();
        while (context instanceof android.content.ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((android.content.ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    // ------------------------------------------------------------------ coming back to the app

    /**
     * Called from the main activity's onCreate. Registers once for the whole process: an
     * activity is created again on a configuration change the host does not swallow, and a
     * second registration would quieten the feed twice for one return.
     */
    public static void install(Activity activity) {
        install(activity, null);
    }

    /**
     * {@link #install(Activity)} with onCreate's saved state. Android hands one back when it
     * builds PineDrama's screen again after closing it in the background, as a reopen from Recents
     * does, and the intent it comes with is still the launcher's from the first start.
     */
    public static void install(Activity activity, Bundle state) {
        try {
            if (installed || activity == null) return;
            Application application = activity.getApplication();
            if (application == null) return;
            installed = true;
            feedClass = activity.getClass();
            firstStartPending = state == null && startedFromTheLauncher(activity.getIntent());
            // Called from onCreate, ahead of this activity's own start, which adds it again.
            STARTED.add(activity);
            // The activity that shows the feed. These callbacks come for every activity in the
            // process, and a screen of PineDrama's own that covered the feed (messages, a web page,
            // HushPine's settings) pauses on the way back with the feed's player already stopped.
            final Class<?> feed = activity.getClass();
            application.registerActivityLifecycleCallbacks(
                    new Application.ActivityLifecycleCallbacks() {
                        // Before the activity's own lifecycle observers, where PineDrama's player
                        // stops, so the reader's play state is still there to read. Android 9 and
                        // older have no such callback: there the observers run before any the
                        // application gets, so Keep paused has nothing true to read and stays out.
                        @Override public void onActivityPrePaused(Activity paused) {
                        }

                        @Override public void onActivityPreResumed(Activity resumed) {
                        }

                        @Override public void onActivityResumed(Activity resumed) {
                            onForeground(resumed);
                        }

                        @Override public void onActivityPaused(Activity paused) {
                        }

                        // Gone only when the last of PineDrama's screens stops. Coming back from
                        // messages or HushPine's settings resumes the feed first and stops the
                        // other screen after, and taking that stop for leaving froze the hold's
                        // countdown and gated the feed behind a tap nobody had left for.
                        @Override public void onActivityStopped(Activity stopped) {
                            if (STARTED.remove(stopped) && STARTED.isEmpty()) onBackground();
                            // The feed going behind another of PineDrama's screens still lets go of
                            // what it held for the comments: kept, it paused whatever played on
                            // the screen in front, a video opened from a hashtag in the sheet.
                            else if (stopped.getClass() == feed) letGo();
                        }

                        @Override public void onActivityCreated(Activity created, Bundle state) {
                        }

                        @Override public void onActivityStarted(Activity started) {
                            STARTED.add(started);
                        }

                        @Override public void onActivitySaveInstanceState(
                                Activity saved, Bundle state) {
                        }

                        @Override public void onActivityDestroyed(Activity destroyed) {
                        }
                    });
        } catch (Throwable error) {
            Logger.printException(() -> "Could not follow the app coming back", error);
        }
    }

    /**
     * The app is no longer on screen.
     *
     * <p>Stopped rather than paused: a dialog or an in-app screen over the feed pauses the
     * activity without the reader having gone anywhere, and gating the feed behind a tap for
     * that is not what the row says. And nothing this holds survives the app going away, since
     * a sheet dismissed while nobody was looking would otherwise leave the feed quiet until
     * the process died.
     */
    static void onBackground() {
        wasAway = true;
        letGo();
        return;
    }

    static void onForeground(Activity activity) {
        try {
            Activity quietOwner = quietOwnerReference.get();
            if (quietOwner != null && quietOwner != activity) letGo();
            // The sheet the reader left open is the sheet they are looking at again, but only
            // if this is the screen it belongs to. These callbacks are registered for every
            // activity in the process, and a sheet left open on the feed while the reader is in
            // the settings is not a reason to take the sound off whatever is playing there.
            View sheet = sheetReference.get();
            if (activity != null && panelActivityReference.get() == activity) syncPanel();
            if (firstStartPending && activity != null && activity.getClass() == feedClass) {
                firstStartPending = false;
            }
            if (!wasAway) return;
            wasAway = false;
            return;
        } catch (Throwable error) {
            Logger.printException(() -> "Could not hold the feed on returning", error);
        }
    }

    /**
     * A tap on PineDrama's icon, as the launcher sends it, and nothing that came with a page to open.
     * Start page's check, which also turns away the push extras some notifications put on the
     * launcher's own intent. A reopen from Recents after Android closed PineDrama carries that intent
     * too, and plays: the reader was already watching. It's marked as launched from history only
     * once PineDrama's screen itself is gone, so the saved state {@link #install(Activity, Bundle)}
     * gets covers the rest.
     */
    static boolean startedFromTheLauncher(Intent intent) {
        return StartPage.isLauncherStart(intent)
                && (intent.getFlags() & Intent.FLAG_ACTIVITY_LAUNCHED_FROM_HISTORY) == 0;
    }

    private static void stopWatchingTheFeed() {
        ViewGroup root = watchedRootReference.get();
        watchedRootReference = new WeakReference<>(null);
        if (root != null && feedWatcher != null) {
            root.getViewTreeObserver().removeOnGlobalLayoutListener(feedWatcher);
        }
        feedWatcher = null;
    }

    /**
     * Hands the sound and the catcher back as the app goes away.
     *
     * <p>The sheet being followed is remembered rather than forgotten. A reader who switches
     * apps with the comments open comes back to the same sheet, and nothing binds a cell in a
     * list that is already full, so forgetting it here left the feed playing behind an open
     * sheet for the rest of that sheet's life.
     */
    private static void letGo() {
        removeCatcher();
        MAIN.removeCallbacks(PANEL_CHECK);
        panelHeld = false;
        handBack(false);
    }

    private static void removeCatcher() {
        stopWatchingTheFeed();
        View catcher = catcherReference.get();
        catcherReference = new WeakReference<>(null);
        if (catcher == null) return;
        if (catcher.getParent() instanceof ViewGroup) {
            ViewGroup parent = (ViewGroup) catcher.getParent();
            SessionLockOverlay.hideBehind(parent, catcher, false);
            parent.removeView(catcher);
        }
    }

    // ------------------------------------------------------------------ the sound itself

    @SuppressWarnings("deprecation")
    private static void quieten(Activity activity) {
        Object page = FeedVisibility.playbackPage(activity);
        if (quietOwnerReference.get() != activity || quietPageReference.get() != page) {
            SessionPlaybackHold.releaseForSwitch(false);
        }
        quietOwnerReference = new WeakReference<>(activity);
        quietPageReference = new WeakReference<>(page);
        SessionPlaybackHold.pauseForSwitch();
        if (quietened) return;
        // A muted feed holds no focus to take away, so the request would only pause the music
        // another app is playing under it, which is what Mute feed videos lets through.
        if (FeedMute.isHoldingFocus()) return;
        AudioManager audio = audioManager();
        if (audio == null) return;
        try {
            // The request-object form arrived in API 26 and this runs from 23. The older call is
            // deprecated rather than gone, and it is the one both understand.
            audio.requestAudioFocus(QUIET, AudioManager.STREAM_MUSIC,
                    AudioManager.AUDIOFOCUS_GAIN_TRANSIENT);
            quietened = true;
        } catch (Exception refused) {
            Logger.printDebug(() -> "Could not take the audio focus to pause the feed");
        }
    }

    /**
     * Hands the feed back once nothing holds it. The open sheet and the catcher each hold it: a
     * reader who comes back to the comments they left open gets the catcher with the sheet, and
     * closing either must leave the video stopped until the other has gone too.
     */
    private static void unquieten() {
        View sheet = sheetReference.get();
        if (catcherReference.get() != null || (sheet != null && sheet.getWindowToken() != null)
                || panelHeld) return;
        Activity owner = quietOwnerReference.get();
        Object page = quietPageReference.get();
        handBack(ownsForeground(owner) && page != null
                && samePage(page, FeedVisibility.playbackPage(owner), owner));
    }

    /** Native detail navigation must not carry the old page's comment hold to its player. */
    public static void onPlaybackPageChanged() {
        Activity owner = quietOwnerReference.get();
        if (owner == null) return;
        Object page = FeedVisibility.playbackPage(owner);
        if (!samePage(quietPageReference.get(), page, owner)) letGo();
        else quietPageReference = new WeakReference<>(page);
    }

    /** A cold Home page may obtain its first pager without a navigation. */
    private static boolean samePage(Object expected, Object current, Activity activity) {
        if (expected == current) return true;
        if (activity == null || expected != activity || !(current instanceof View)) return false;
        View home = FeedVisibility.homeTabView(activity);
        return (home == null || home.isSelected())
                && SessionPlaybackHold.switchPlayerNotReplaced();
    }

    /** The sheet or cover still belongs to the foreground native page. */
    private static boolean ownsForeground(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return false;
        Activity visible = Utils.getVisibleActivity();
        return visible == null || visible == activity;
    }

    /** With {@code resume} false the video is left as PineDrama has it, which going away wants. */
    @SuppressWarnings("deprecation")
    private static void handBack(boolean resume) {
        SessionPlaybackHold.releaseForSwitch(resume);
        quietOwnerReference.clear();
        quietPageReference.clear();
        if (!quietened) return;
        quietened = false;
        AudioManager audio = audioManager();
        if (audio == null) return;
        try {
            audio.abandonAudioFocus(QUIET);
        } catch (Exception ignored) {
            Logger.printDebug(() -> "Could not hand the audio focus back");
        }
    }

    private static AudioManager audioManager() {
        Context context = Utils.getContext();
        return context == null ? null
                : (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
    }

    // ------------------------------------------------------------------ test seams

    static boolean quietenedForTests() {
        return quietened;
    }

    static void quietenForTests() {
        quieten(Utils.getVisibleActivity());
    }

    static View catcherForTests() {
        return catcherReference.get();
    }

    static void resetForTests() {
        removeCatcher();
        // The hold's state is static and shared with every other suite in this sandbox.
        SessionPlaybackHold.releaseForSwitch(false);
        quietened = false;
        quietOwnerReference.clear();
        quietPageReference.clear();
        installed = false;
        STARTED.clear();
        wasAway = false;
        feedClass = null;
        firstStartPending = false;
        sheetReference = new WeakReference<>(null);
        MAIN.removeCallbacks(PANEL_CHECK);
        View watched = panelWatchedReference.get();
        if (watched != null) watched.getViewTreeObserver().removeOnGlobalLayoutListener(PANEL_LAYOUT);
        panelWatchedReference = new WeakReference<>(null);
        panelActivityReference = new WeakReference<>(null);
        panelPageReference.clear();
        panelHeld = false;
        panelChecksLeft = 0;
    }

    static void setWasAwayForTests(boolean away) {
        wasAway = away;
    }

    static boolean wasAwayForTests() {
        return wasAway;
    }
}
