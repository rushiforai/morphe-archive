package app.spicetify.extension.spotify.extensions;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import java.lang.ref.WeakReference;

/**
 * The Activity that's resumed, for a hook that shows a dialog with no Activity at hand, such as the
 * Random pill's chooser. PatchSettings installs it from Spotify's onCreate, before any Activity
 * starts, when the extensions patch is installed. Android calls it on the main thread.
 */
public final class ActivityTracker implements Application.ActivityLifecycleCallbacks {
    private static volatile ActivityTracker installed;
    /** Weak, so an Activity Android is done with can still be collected. Null while none is resumed. */
    private volatile WeakReference<Activity> resumed;

    private ActivityTracker() {}

    /** Starts tracking the Activities of {@code context}'s application. Never throws. */
    public static void install(Context context) {
        try {
            ActivityTracker tracker = new ActivityTracker();
            ((Application) context.getApplicationContext()).registerActivityLifecycleCallbacks(tracker);
            installed = tracker;
        } catch (Throwable e) {
            Log.w("Spicetify", "Couldn't track Spotify's Activities", e);
        }
    }

    /** The Activity resumed last, until it pauses; null before any resumes, or without the tracker. */
    static Activity resumed() {
        ActivityTracker tracker = installed;
        WeakReference<Activity> kept = tracker == null ? null : tracker.resumed;
        return kept == null ? null : kept.get();
    }

    @Override
    public void onActivityResumed(Activity activity) {
        resumed = new WeakReference<>(activity);
    }

    /** Only the kept Activity's pause forgets it: in split screen, two can be resumed at once. */
    @Override
    public void onActivityPaused(Activity activity) {
        WeakReference<Activity> kept = resumed;
        if (kept != null && kept.get() == activity) resumed = null;
    }

    @Override public void onActivityCreated(Activity activity, Bundle state) {}
    @Override public void onActivityStarted(Activity activity) {}
    @Override public void onActivityStopped(Activity activity) {}
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
    @Override public void onActivityDestroyed(Activity activity) {}
}
