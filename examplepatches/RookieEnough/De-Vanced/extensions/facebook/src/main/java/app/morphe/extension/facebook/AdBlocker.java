/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook;

import android.app.Application;
import android.util.Log;

import java.util.concurrent.Executors;

/**
 * Dynamic Ad Blocker for Facebook v573+
 * Delegates scan & JNI extraction to AdBlockerScanner to avoid early native class loading.
 */
public final class AdBlocker {

    private static final String TAG = "MorpheDynamicHook";
    private static boolean initialized = false;

    private AdBlocker() { }

    public static void initialize(final Application app) {
        if (initialized) return;
        initialized = true;

        Log.i(TAG, "Registering ActivityLifecycleCallbacks for deferred AdBlocker initialization...");

        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            private boolean started = false;

            @Override
            public void onActivityResumed(android.app.Activity activity) {
                if (!started) {
                    started = true;
                    Log.i(TAG, "First Activity resumed: " + activity.getClass().getName() + ". Dispatching AdBlockerScanner...");

                    Executors.newSingleThreadExecutor().execute(new Runnable() {
                        @Override
                        public void run() {
                            AdBlockerScanner.runScan(app);
                        }
                    });

                }
            }

            @Override public void onActivityCreated(android.app.Activity activity, android.os.Bundle savedInstanceState) {}
            @Override public void onActivityStarted(android.app.Activity activity) {}
            @Override public void onActivityPaused(android.app.Activity activity) {}
            @Override public void onActivityStopped(android.app.Activity activity) {}
            @Override public void onActivitySaveInstanceState(android.app.Activity activity, android.os.Bundle outState) {}
            @Override public void onActivityDestroyed(android.app.Activity activity) {}
        });
    }
}
