/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.feed;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.WeakHashMap;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.instagram.settings.SettingsStatus;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.ResourceIdCache;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.ViewWatcher;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for Rounded corners on Reels (#362), part of the Rounded post corners patch.
 *
 * <p>Each page of the Reels viewer, in the Reels tab and wherever a reel opens full screen, keeps its
 * video in a frame of its own, {@link #FRAME}. The seek bar, captions and buttons are drawn in layers
 * beside it, so cutting that frame's corners rounds the video and leaves them whole. Nothing of
 * Instagram's code changes: while the switch is on, a resumed activity gets one global-layout
 * listener, which notes that the screen was laid out again, and one pre-draw listener, which then
 * looks through the window once and rounds each video frame it finds that isn't rounded yet, at the
 * size Corner size picks. A new page is laid out as it comes in, so it's rounded before its first
 * frame shows.
 *
 * <p>With the switch off, HushGram paused or the settings not read, an activity gets no listener,
 * and one already listening puts every frame it rounded back as Instagram had it and drops both
 * listeners at its next frame. A resumed activity decides again, and so does the one under HushGram
 * settings when the switch is flipped, so the switch needs no restart.
 * Frames are held weakly. Anything thrown leaves the screen as Instagram drew it.
 */
public final class ReelCorners {
    /** The frame a reel's video sits in, alone, under the viewer's overlay. */
    static final String FRAME = "clips_viewer_video_layout";

    /** The most views looked at in one search, so a strange tree can't make a long one. */
    static final int MAX_VIEWS = 6000;

    static final String HOOK = "reel frame";
    static final String COUNT_ROUNDED = "reel frames rounded";

    private static final RoundedFrames rounded = new RoundedFrames();
    private static final ResourceIdCache ids = new ResourceIdCache();
    private static final WeakHashMap<Activity, Session> sessions = new WeakHashMap<>();
    private static volatile boolean registered;
    private static volatile boolean logged;

    private ReelCorners() {
    }

    /** Called as the application starts. Does nothing in a build without the patch. */
    public static void install(Context context) {
        try {
            if (registered || !SettingsStatus.roundedPostCorners() || !(context instanceof Application)) return;
            registered = true;
            ViewWatcher.onResumeAndPause((Application) context, ReelCorners::watch, ReelCorners::unwatch);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.ROUNDED_POST_CORNERS, HOOK + " start", failure);
        }
    }

    /** Whether reels are rounded now: the switch on, HushGram not paused, the settings read. */
    static boolean wanted() {
        return Utils.settingsReady() && Settings.ROUNDED_REEL_CORNERS.get();
    }

    /** Starts watching [activity] if the switch is on, or puts back what was rounded if it's off. */
    static void watch(Activity activity) {
        try {
            if (!wanted()) {
                if (!rounded.isEmpty()) rounded.putBack();
                return;
            }
            Session session;
            synchronized (sessions) {
                session = sessions.get(activity);
                if (session == null) {
                    session = new Session(activity);
                    sessions.put(activity, session);
                }
            }
            session.attach();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.ROUNDED_POST_CORNERS, HOOK, failure);
        }
    }

    /**
     * The switch was flipped in HushGram settings. They open as a dialog over [activity], which stays
     * resumed, so it decides again now rather than at its next resume. Posted, so it reads the value
     * this change saves.
     */
    public static void switchChanged(@Nullable Activity activity) {
        if (activity != null) Utils.runOnMainThread(() -> watch(activity));
    }

    static void unwatch(Activity activity) {
        try {
            Session session;
            synchronized (sessions) {
                session = sessions.remove(activity);
            }
            if (session != null) session.detach();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.ROUNDED_POST_CORNERS, HOOK, failure);
        }
    }

    /** Tests give the frame an id of their own, since a test app has none of Instagram's. */
    static void idForTests(Context context, int id) {
        ids.putForTests(context.getPackageName(), FRAME, id);
    }

    static int roundedForTests() {
        return rounded.size();
    }

    public static boolean listeningForTests(Activity activity) {
        synchronized (sessions) {
            Session session = sessions.get(activity);
            return session != null && session.listening();
        }
    }

    public static void resetForTests() {
        ids.clear();
        synchronized (sessions) {
            for (Session session : new ArrayList<>(sessions.values())) session.detach();
            sessions.clear();
        }
        rounded.clear();
        logged = false;
    }

    /** One activity's place in the shared frame watcher. */
    private static final class Session implements ViewWatcher.Member {
        private final WeakReference<Activity> activity;

        Session(Activity activity) {
            this.activity = new WeakReference<>(activity);
        }

        boolean listening() {
            Activity owner = activity.get();
            return owner != null && ViewWatcher.listening(owner, this);
        }

        void attach() {
            Activity owner = activity.get();
            if (owner == null || ViewWatcher.joined(owner, this)) return;
            HookStatus.invoked(FamilyNames.ROUNDED_POST_CORNERS);
            ViewWatcher.join(owner, this);
        }

        void detach() {
            Activity owner = activity.get();
            if (owner != null) ViewWatcher.leave(owner, this);
        }

        @Override
        public boolean wanted() {
            return ReelCorners.wanted();
        }

        @Override
        public boolean preDraw(Activity owner, boolean laidOut) {
            try {
                if (!wanted()) {
                    rounded.putBack();
                    detach();
                    return false;
                }
                if (laidOut) {
                    int id = ids.resolve(owner.getResources(), owner.getPackageName(), FRAME, false);
                    if (id == 0) {
                        HookStatus.missingViewId(FamilyNames.ROUNDED_POST_CORNERS, FRAME);
                        return false;
                    }
                    HookStatus.recoveredViewId(FamilyNames.ROUNDED_POST_CORNERS, FRAME);
                    float radius = Settings.ROUNDED_CORNER_SIZE.get().dp * owner.getResources().getDisplayMetrics().density;
                    walk(owner.getWindow().getDecorView(), id, radius, new int[] {MAX_VIEWS});
                }
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.ROUNDED_POST_CORNERS, HOOK, failure);
            }
            // The outline is set before this frame is drawn, so the frame already shows it.
            return false;
        }

        private void walk(View view, int id, float radius, int[] budget) {
            if (budget[0]-- <= 0) return;
            if (view.getId() == id) {
                if (rounded.round(view, radius)) {
                    HookStatus.counted(FamilyNames.ROUNDED_POST_CORNERS, COUNT_ROUNDED);
                    if (!logged) {
                        logged = true;
                        Logger.printDebug(() -> "Rounded corners on Reels: rounded a reel's video frame");
                    }
                }
                return;
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) walk(group.getChildAt(i), id, radius, budget);
            }
        }
    }
}
