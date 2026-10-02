package app.fblite.extension.video;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.MediaController;

import java.io.File;
import java.io.FileWriter;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import app.fblite.extension.settings.MorpheSettings;

/**
 * Video download button and auto next reel. Facebook Lite plays every feed, Reels and full screen
 * video in a native com.facebook.lite.widget.video.FbVideoView inside MainActivity, so while
 * MainActivity is in front its window is scanned twice a second for those views.
 *
 * Obfuscated member names are for Facebook Lite 530.0.0.8.106. Any reflection error turns the
 * feature off, the app keeps working.
 */
public final class VideoFeatures {
    static final String TAG = "FbLiteVideo";
    private static final long SCAN_INTERVAL_MS = 500;
    private static final String DEBUG_DIR = "/storage/emulated/0/Android/data/com.facebook.lite/cache/";
    private static final boolean DEBUG = new File(DEBUG_DIR + "fblite-video-debug").exists();

    static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static Class<?> videoViewClass;
    private static Field playerField;
    private static boolean disabled;
    private static Activity resumed;

    private VideoFeatures() {
    }

    /** Called at the start of Application.attachBaseContext. */
    @SuppressWarnings("unused")
    public static void install(Application application) {
        try {
            application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityResumed(Activity activity) {
                    if (!activity.getClass().getName().equals("com.facebook.lite.MainActivity")) return;
                    resumed = activity;
                    MAIN.removeCallbacks(SCAN);
                    MAIN.postDelayed(SCAN, SCAN_INTERVAL_MS);
                }

                @Override
                public void onActivityPaused(Activity activity) {
                    if (resumed != activity) return;
                    resumed = null;
                    MAIN.removeCallbacks(SCAN);
                    DownloadButton.hide();
                }

                @Override
                public void onActivityCreated(Activity activity, Bundle state) {
                }

                @Override
                public void onActivityStarted(Activity activity) {
                }

                @Override
                public void onActivityStopped(Activity activity) {
                }

                @Override
                public void onActivitySaveInstanceState(Activity activity, Bundle state) {
                }

                @Override
                public void onActivityDestroyed(Activity activity) {
                    DownloadButton.forget(activity);
                }
            });
        } catch (Throwable t) {
            Log.e(TAG, "Could not install video features", t);
        }
    }

    private static final Runnable SCAN = new Runnable() {
        @Override
        public void run() {
            Activity activity = resumed;
            if (activity == null || disabled) return;
            try {
                scan(activity);
            } catch (Throwable t) {
                disabled = true;
                DownloadButton.hide();
                log("Video features failed, turning them off", t);
            }
            MAIN.postDelayed(this, SCAN_INTERVAL_MS);
        }
    };

    private static void scan(Activity activity) throws Exception {
        boolean download = MorpheSettings.isEnabled(activity, MorpheSettings.VIDEO_DOWNLOAD);
        boolean autoNext = MorpheSettings.isEnabled(activity, MorpheSettings.AUTO_NEXT_REEL);
        if (!download && !autoNext) {
            DownloadButton.hide();
            return;
        }
        if (videoViewClass == null) {
            videoViewClass = Class.forName("com.facebook.lite.widget.video.FbVideoView", false, activity.getClassLoader());
            playerField = videoViewClass.getDeclaredField("A0G");
            playerField.setAccessible(true);
        }
        List<View> videos = new ArrayList<>();
        collect(activity.getWindow().getDecorView(), videos);

        View playing = null;
        int bestArea = 0;
        for (View video : videos) {
            if (autoNext) AutoNextReel.observe(video);
            if (!video.isShown()) continue;
            Object player = playerField.get(video);
            if (!(player instanceof MediaController.MediaPlayerControl) || !((MediaController.MediaPlayerControl) player).isPlaying()) continue;
            int area = video.getWidth() * video.getHeight();
            if (area > bestArea) {
                bestArea = area;
                playing = video;
            }
        }
        if (download && playing != null) DownloadButton.show(activity, playing);
        else DownloadButton.hide();
    }

    private static void collect(View view, List<View> out) {
        if (view.getVisibility() != View.VISIBLE) return;
        if (videoViewClass.isInstance(view)) {
            out.add(view);
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) collect(group.getChildAt(i), out);
        }
    }

    /** Reads a field declared on the given class (subclasses of FbVideoView shadow some names). */
    static Object field(Object target, Class<?> declaring, String name) throws Exception {
        Field f = declaring.getDeclaredField(name);
        f.setAccessible(true);
        return f.get(target);
    }

    static Class<?> videoViewClass() {
        return videoViewClass;
    }

    static boolean isEnabled(Context context, String key) {
        return MorpheSettings.isEnabled(context, key);
    }

    static void log(String message, Throwable t) {
        if (t != null) Log.e(TAG, message, t);
        if (!DEBUG) return;
        try {
            FileWriter writer = new FileWriter(DEBUG_DIR + "fblite-video.log", true);
            writer.write(System.currentTimeMillis() + " " + message + (t != null ? ": " + Log.getStackTraceString(t) : "") + "\n");
            writer.close();
        } catch (Throwable ignored) {
        }
    }
}
