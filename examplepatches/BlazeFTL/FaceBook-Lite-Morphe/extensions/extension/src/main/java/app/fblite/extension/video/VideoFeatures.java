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

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import app.fblite.extension.settings.MorpheLog;
import app.fblite.extension.settings.MorpheSettings;

/**
 * Video download button and auto next reel. Facebook Lite plays every feed, Reels and full screen
 * video in a native com.facebook.lite.widget.video.FbVideoView inside MainActivity, so while
 * MainActivity is in front its window is scanned twice a second for those views.
 *
 * Obfuscated member names are for Facebook Lite 536.0.0.11.107. Any reflection error turns the
 * feature off, the app keeps working.
 */
public final class VideoFeatures {
    static final String TAG = "FbLiteVideo";
    private static final long SCAN_INTERVAL_MS = 500;
    /** While a story is on screen: a sponsored story is on screen for at most one tick before it is skipped. */
    private static final long STORY_SCAN_INTERVAL_MS = 100;
    private static long nextScanDelay = SCAN_INTERVAL_MS;
    static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static Class<?> videoViewClass;
    private static Field playerField;
    private static boolean disabled;
    private static int failures;
    private static final int MAX_FAILURES = 5;
    private static Activity resumed;
    private static final android.graphics.Rect VISIBLE = new android.graphics.Rect();

    private VideoFeatures() {
    }

    /** Called at the start of Application.attachBaseContext. */
    @SuppressWarnings("unused")
    public static void install(Application application) {
        try {
            application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityResumed(Activity activity) {
                    MorpheLog.init(activity.getApplicationContext());
                    MorpheLog.log("activity", "resumed " + activity.getClass().getName());
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
                    DownloadButton.hideNow();
                    ShortControls.hideNow();
                    DoubleTapSeek.hideNow();
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
                    ShortControls.forget(activity);
                    DoubleTapSeek.forget(activity);
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
                failures = 0;
            } catch (Throwable t) {
                failures++;
                log("Video features scan failed (" + failures + " in a row)", t);
                if (failures >= MAX_FAILURES) {
                    disabled = true;
                    DownloadButton.hideNow();
                    ShortControls.hideNow();
                    DoubleTapSeek.hideNow();
                    log("Video features turned off after " + failures + " failures in a row", t);
                }
            }
            MAIN.postDelayed(this, nextScanDelay);
        }
    };

    private static void scan(Activity activity) throws Exception {
        nextScanDelay = SCAN_INTERVAL_MS;
        boolean download = MorpheSettings.isEnabled(activity, MorpheSettings.VIDEO_DOWNLOAD);
        boolean autoNext = MorpheSettings.isEnabled(activity, MorpheSettings.AUTO_NEXT_REEL);
        boolean skipStoryAds = MorpheSettings.isEnabled(activity, MorpheSettings.STORIES_HIDE_ADS);
        boolean profileAlways = MorpheSettings.isEnabled(activity, MorpheSettings.PROFILE_ALWAYS);
        boolean profile = profileAlways || MorpheSettings.isEnabled(activity, MorpheSettings.PROFILE_WHEN_NO_REELS);
        boolean controls = MorpheSettings.isEnabled(activity, MorpheSettings.SHORT_VIDEO_CONTROLS);
        boolean doubleTap = MorpheSettings.isEnabled(activity, MorpheSettings.DOUBLE_TAP_SEEK);
        if (!download && !autoNext && !skipStoryAds && !profile && !controls && !doubleTap) {
            DownloadButton.hide();
            ShortControls.hide();
            DoubleTapSeek.hide();
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
        View paused = null;
        int pausedArea = 0;
        for (View video : videos) {
            if (autoNext) AutoNextReel.observe(video);
            if (!video.isShown()) continue;
            Object player = playerField.get(video);
            if (!(player instanceof MediaController.MediaPlayerControl)) continue;
            if (!((MediaController.MediaPlayerControl) player).isPlaying()) {
                int visible = video.getGlobalVisibleRect(VISIBLE) ? VISIBLE.width() * VISIBLE.height() : 0;
                if (video.getHeight() > 0 && VISIBLE.height() >= video.getHeight() * 0.5f && visible > pausedArea) {
                    pausedArea = visible;
                    paused = video;
                }
                continue;
            }
            int area = video.getWidth() * video.getHeight();
            if (area > bestArea) {
                bestArea = area;
                playing = video;
            }
        }
        if (playing != null) {
            VideoProbe.onPlaying(playing);
            Overlay.trace(activity.getWindow().getDecorView());
        }
        // Also while a video plays: the reel under a creator's page can keep playing, and the page still has to go.
        if (profile) ProfileRedirect.check(activity, profileAlways, playing != null ? playing : paused);
        // A sponsored story: no download button, and the viewer is moved on. The header's "Sponsored" label is the
        // signal, and for a story video also the ad mark in its tracking text.
        Stories.Header story = download || skipStoryAds || controls || doubleTap ? Stories.read(activity) : null;
        if (controls) ShortControls.update(activity, story != null ? null : playing != null ? playing : paused);
        else ShortControls.hide();
        if (doubleTap) DoubleTapSeek.update(activity, story != null ? null : playing != null ? playing : paused);
        else DoubleTapSeek.hide();
        if (download || skipStoryAds) {
            if (story != null && skipStoryAds) nextScanDelay = STORY_SCAN_INTERVAL_MS;
            if (story != null && (story.sponsored || (playing != null && Stories.isAdVideo(playing)))) {
                DownloadButton.hide();
                if (skipStoryAds) Stories.skip(activity);
                return;
            }
        }
        if (!download) {
            DownloadButton.hide();
            return;
        }
        if (playing != null) {
            if (DownloadButton.allowed(playing)) DownloadButton.show(activity, playing);
            else DownloadButton.hide();
            return;
        }
        // No video playing: a story photo fills the window instead. Only on a story screen: the Messages list and other
        // screens with a large picture are not stories, and must not get a download button.
        StoryPhotos.Photo photo = story != null ? StoryPhotos.find(activity) : null;
        if (photo != null) DownloadButton.showPhoto(activity, photo.anchor, photo.url);
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

    /** The media player behind a video view, or null. */
    static Object playerOf(View video) {
        try {
            return playerField == null ? null : playerField.get(video);
        } catch (Throwable t) {
            return null;
        }
    }

    static Class<?> videoViewClass() {
        return videoViewClass;
    }

    static boolean isEnabled(Context context, String key) {
        return MorpheSettings.isEnabled(context, key);
    }

    static void log(String message, Throwable t) {
        if (t != null) Log.e(TAG, message, t);
        MorpheLog.log("video", message, t);
    }
}
