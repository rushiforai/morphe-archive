/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Activity;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.os.Handler;
import android.os.Looper;
import android.view.OrientationEventListener;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;

/**
 * Telegram never turns the video viewer by itself. While a video is on screen the activity follows
 * the phone's sensor like any other screen, so with auto-rotate on the viewer goes landscape the
 * moment the phone is turned (#27). Only the full screen button, and the two places that undo it,
 * ask for an orientation.
 *
 * <p>With the switch on, the viewer asks the activity to stay in portrait for as long as a video
 * is showing, and hands the app's own orientation back afterwards. Telegram's reads and restores of
 * the orientation come through here so it never sees the pin as the app's own. Whatever the switch
 * says, the transitions are counted, content-free, so the diagnostic report shows which path fired.
 * All of it runs on the main thread.
 */
public final class VideoUpright {
    private VideoUpright() {}

    static final String FROM_BUTTON = "full screen from the button";
    static final String FROM_TURNING = "full screen from turning the phone";
    static final String KEPT_UPRIGHT = "turn kept upright";

    /** How long the pin outlasts a video's player, so the next video in the viewer keeps it. */
    private static final long RELEASE_DELAY_MILLIS = 250;

    private static final Runnable RELEASE = VideoUpright::release;

    private static Handler handler;

    private static WeakReference<Activity> activity = new WeakReference<>(null);
    private static boolean pinned;
    private static int original = ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED;
    private static boolean videoShown;
    private static boolean fullByButton;
    private static Watch watch;

    /**
     * Called in place of the viewer switching its sensor listener on, which it does whenever a
     * video starts to play.
     *
     * @param listener Telegram's listener, which holds the viewer
     */
    public static void listenerOn(OrientationEventListener listener) {
        listener.enable();
        HookStatus.invoked(FamilyNames.KEEP_VIDEOS_MUTED);
        try {
            if (!active()) return;
            Activity current = activityOf(listener);
            if (current == null) {
                HookStatus.missingMember(FamilyNames.KEEP_VIDEOS_MUTED, "field", "video viewer", "activity");
                return;
            }
            shown(current);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, "video shown", failure);
        }
    }

    /** Called in place of the viewer switching its sensor listener off, when a video's player is let go. */
    public static void listenerOff(OrientationEventListener listener) {
        listener.disable();
        try {
            hidden();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, "video let go", failure);
        }
    }

    /** A video is on screen in [current]: held upright if the switch is on, watched either way. */
    static void shown(Activity current) {
        if (!active()) return;
        videoShown = true;
        handler().removeCallbacks(RELEASE);
        activity = new WeakReference<>(current);
        try {
            if (!pinned && Settings.VIDEO_ONLY_FROM_BUTTON.get() && portrait(current)) {
                original = current.getRequestedOrientation();
                current.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
                pinned = true;
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, "keeping a video upright", failure);
        }
        startWatch(current);
    }

    /** The video is gone. The pin outlasts it a moment, in case another video follows. */
    static void hidden() {
        videoShown = false;
        stopWatch();
        if (pinned && !fullByButton) {
            handler().removeCallbacks(RELEASE);
            handler().postDelayed(RELEASE, RELEASE_DELAY_MILLIS);
        }
    }

    private static Handler handler() {
        if (handler == null) handler = new Handler(Looper.getMainLooper());
        return handler;
    }

    /** Forgets everything, for tests that share the process. */
    static void reset() {
        if (handler != null) handler.removeCallbacks(RELEASE);
        stopWatch();
        activity = new WeakReference<>(null);
        pinned = false;
        videoShown = false;
        fullByButton = false;
        original = ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED;
    }

    /** The full screen button was tapped. */
    static void buttonPressed() {
        try {
            fullByButton = true;
            if (active()) HookStatus.counted(FamilyNames.KEEP_VIDEOS_MUTED, FROM_BUTTON);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, "full screen button", failure);
        }
    }

    /**
     * Called in place of the viewer reading the app's orientation, which it keeps to put back when
     * full screen ends.
     */
    public static int requested(Activity host) {
        try {
            if (pinned && host == activity.get()) return original;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, "orientation read", failure);
        }
        return host.getRequestedOrientation();
    }

    /**
     * Called in place of the viewer putting an orientation back: when full screen ends, and when
     * the viewer closes after it.
     *
     * @param value what Telegram would ask for
     */
    public static void restore(Activity host, int value) {
        try {
            if (pinned && host == activity.get()) {
                fullByButton = false;
                if (videoShown) {
                    host.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
                } else {
                    host.setRequestedOrientation(original);
                    pinned = false;
                }
                return;
            }
            fullByButton = false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, "orientation put back", failure);
        }
        host.setRequestedOrientation(value);
    }

    /** No video is showing any more: the app's own orientation comes back. */
    private static void release() {
        try {
            Activity host = activity.get();
            if (pinned && !videoShown && host != null) host.setRequestedOrientation(original);
            if (!videoShown) pinned = false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, "orientation given back", failure);
        }
    }

    private static boolean active() {
        return Utils.settingsReady() && !HushTelegramPause.isPaused();
    }

    private static boolean portrait(Activity host) {
        return host.getResources().getConfiguration().orientation == Configuration.ORIENTATION_PORTRAIT;
    }

    /**
     * The activity the viewer sits in. Telegram's listener holds the viewer and the viewer holds the
     * activity, both under names that change every build, so they are found by their types.
     */
    static Activity activityOf(Object listener) throws IllegalAccessException {
        for (Field outer : listener.getClass().getDeclaredFields()) {
            if (!"org.telegram.ui.PhotoViewer".equals(outer.getType().getName())) continue;
            outer.setAccessible(true);
            Object viewer = outer.get(listener);
            if (viewer == null) continue;
            for (Field inner : outer.getType().getDeclaredFields()) {
                if (inner.getType() != Activity.class) continue;
                inner.setAccessible(true);
                return (Activity) inner.get(viewer);
            }
        }
        return null;
    }

    private static void startWatch(Activity host) {
        if (watch != null) return;
        Watch started = new Watch(host.getApplicationContext());
        if (!started.canDetectOrientation()) return;
        started.enable();
        watch = started;
    }

    private static void stopWatch() {
        Watch stopped = watch;
        watch = null;
        if (stopped != null) stopped.disable();
    }

    /** Whether auto-rotate is on, and the app is free to follow the sensor to either landscape side. */
    private static boolean screenWouldFollow(Activity host, int asked) {
        boolean autoRotate = android.provider.Settings.System.getInt(host.getContentResolver(),
                android.provider.Settings.System.ACCELEROMETER_ROTATION, 1) == 1;
        return autoRotate && (asked == ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED
                || asked == ActivityInfo.SCREEN_ORIENTATION_USER
                || asked == ActivityInfo.SCREEN_ORIENTATION_SENSOR
                || asked == ActivityInfo.SCREEN_ORIENTATION_FULL_SENSOR
                || asked == ActivityInfo.SCREEN_ORIENTATION_FULL_USER);
    }

    /** A phone turned on its side while a video is open, and what that did. Counted once per turn. */
    static final class Watch extends OrientationEventListener {
        private boolean primed;
        private boolean sideways;

        Watch(Context context) {
            super(context);
        }

        @Override public void onOrientationChanged(int degrees) {
            try {
                turned(degrees);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, "phone turned", failure);
            }
        }

        void turned(int degrees) {
            if (degrees == ORIENTATION_UNKNOWN) return;
            boolean side = degrees >= 60 && degrees <= 120 || degrees >= 240 && degrees <= 300;
            boolean flat = degrees <= 30 || degrees >= 330 || degrees >= 150 && degrees <= 210;
            if (!primed) {
                primed = true;
                sideways = side;
                return;
            }
            if (flat) {
                sideways = false;
            } else if (side && !sideways) {
                sideways = true;
                Activity host = activity.get();
                if (fullByButton || host == null) return;
                if (pinned) {
                    if (screenWouldFollow(host, original)) HookStatus.counted(FamilyNames.KEEP_VIDEOS_MUTED, KEPT_UPRIGHT);
                } else if (screenWouldFollow(host, host.getRequestedOrientation())) {
                    HookStatus.counted(FamilyNames.KEEP_VIDEOS_MUTED, FROM_TURNING);
                }
            }
        }
    }
}
