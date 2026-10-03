/*
 * Copyright 2026 De-Vanced
 * Copyright 2026 Hushfacebook contributors
 * [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
 *
 * Timing model adapted from Hushfacebook (GPL-3.0).
 * [https://github.com/SysAdminDoc/HushFacebook/blob/aa6cb7c4d904b3fbf1da07809231e97b151705fb/extensions/facebook/src/main/java/app/morphe/extension/facebook/feed/ReturnRefresh.java](https://github.com/SysAdminDoc/HushFacebook/blob/aa6cb7c4d904b3fbf1da07809231e97b151705fb/extensions/facebook/src/main/java/app/morphe/extension/facebook/feed/ReturnRefresh.java)
 */

package app.morphe.extension.facebook.feed;

import android.app.Application;
import android.app.Activity;
import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;

import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.facebook.settings.DeVancedSettings;

/** A one-use marker for returning after Facebook's UI has been hidden. */
public final class ReturnRefresh {
    private static final long HOLD_MS = 10 * 60 * 1000L;
    private static final String TAG = "DeVancedReturnRefresh";
    private static final AtomicInteger STARTED_ACTIVITIES =
            new AtomicInteger();
    private static long hiddenAt = -1;
    private static boolean registered;

    private ReturnRefresh() {
    }

    public static synchronized void register(Context context) {
        if (registered || !(context instanceof Application)) return;
        Application application = (Application) context;
        application.registerComponentCallbacks(new ComponentCallbacks2() {
            @Override
            public void onTrimMemory(int level) {
                if (level == TRIM_MEMORY_UI_HIDDEN) {
                    ReturnRefresh.uiHidden();
                }
            }

            @Override
            public void onConfigurationChanged(Configuration configuration) {
            }

            @Override
            public void onLowMemory() {
            }
        });
        application.registerActivityLifecycleCallbacks(
                new Application.ActivityLifecycleCallbacks() {
                    @Override
                    public void onActivityStarted(Activity activity) {
                        STARTED_ACTIVITIES.incrementAndGet();
                    }

                    @Override
                    public void onActivityStopped(Activity activity) {
                        int remaining = STARTED_ACTIVITIES.decrementAndGet();
                        if (remaining <= 0) {
                            STARTED_ACTIVITIES.set(0);
                            uiHidden();
                        }
                    }

                    @Override public void onActivityCreated(
                            Activity activity,
                            Bundle state
                    ) {
                    }

                    @Override public void onActivityResumed(Activity activity) {
                    }

                    @Override public void onActivityPaused(Activity activity) {
                    }

                    @Override public void onActivitySaveInstanceState(
                            Activity activity,
                            Bundle state
                    ) {
                    }

                    @Override public void onActivityDestroyed(Activity activity) {
                    }
                }
        );
        registered = true;
    }

    public static void uiHidden() {
        uiHidden(SystemClock.elapsedRealtime());
    }

    static synchronized void uiHidden(long now) {
        hiddenAt = now;
        Log.i(TAG, "hidden at=" + now);
    }

    public static boolean shouldSkip() {
        try {
            boolean skip = skipAt(SystemClock.elapsedRealtime());
            Log.i(TAG, "skip=" + skip);
            return skip;
        } catch (Throwable failure) {
            return false;
        }
    }

    static synchronized boolean skipAt(long now) {
        long at = hiddenAt;
        hiddenAt = -1;
        return at >= 0 && now >= at && now - at <= HOLD_MS &&
                DeVancedSettings.isAutoRefreshDisabled();
    }
}
