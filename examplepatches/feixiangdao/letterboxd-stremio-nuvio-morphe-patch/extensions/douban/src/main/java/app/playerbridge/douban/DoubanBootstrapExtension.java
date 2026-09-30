package app.playerbridge.douban;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.util.Log;

/**
 * Minimal bootstrap installed only after the NIS wrapper Application.onCreate()
 * is about to return. No network, reflection or UI work happens here.
 */
public final class DoubanBootstrapExtension {
    private static final String TAG = "DoubanBridgeBootstrap";
    private static final String MOVIE_ACTIVITY =
            "com.douban.frodo.subject.struct2.MovieActivity2";
    private static volatile boolean installed;

    private DoubanBootstrapExtension() {}

    public static void install(Application application) {
        if (application == null || installed) return;
        installed = true;

        try {
            application.registerActivityLifecycleCallbacks(
                    new Application.ActivityLifecycleCallbacks() {
                        @Override
                        public void onActivityResumed(Activity activity) {
                            if (activity == null) return;
                            if (!MOVIE_ACTIVITY.equals(activity.getClass().getName())) return;

                            // Run only after the real protected Activity is fully resumed.
                            activity.getWindow().getDecorView().postDelayed(
                                    () -> DoubanPlayerBridgeRuntime.onMovieActivityResumed(activity),
                                    450
                            );
                        }

                        @Override public void onActivityCreated(Activity a, Bundle b) {}
                        @Override public void onActivityStarted(Activity a) {}
                        @Override public void onActivityPaused(Activity a) {}
                        @Override public void onActivityStopped(Activity a) {}
                        @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
                        @Override public void onActivityDestroyed(Activity a) {}
                    }
            );
            Log.d(TAG, "Lifecycle callback installed");
        } catch (Throwable t) {
            Log.w(TAG, "Failed to install lifecycle callback", t);
        }
    }
}
