/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook;

import android.app.Application;
import android.app.Activity;
import android.content.ComponentCallbacks2;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Process;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.Window;

import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.facebook.settings.DeVancedSettings;

/** Coordinates low-overhead behavior without changing Facebook UI semantics. */
public final class PerformanceOptimizer {
    private static final String TAG = "DeVancedOptimizer";
    private static final AtomicInteger SUPPRESSED_GC = new AtomicInteger();

    private static volatile boolean enabled;
    private static volatile boolean reduceAnimations;
    private static volatile boolean disableHaptics;
    private static volatile boolean reduceBackgroundWork;
    private static volatile boolean callbacksRegistered;
    private static volatile long explicitGcAllowedUntilMs;

    private PerformanceOptimizer() {
    }

    public static void initialize() {
        setEnabled(DeVancedSettings.isOptimizationEnabled());
    }

    public static synchronized void initialize(Application application) {
        setEnabled(DeVancedSettings.isOptimizationEnabled());
        if (application == null || callbacksRegistered) return;

        callbacksRegistered = true;
        application.registerComponentCallbacks(new ComponentCallbacks2() {
            @Override
            public void onTrimMemory(int level) {
                trimExtensionCaches();
                if (level >= ComponentCallbacks2.TRIM_MEMORY_RUNNING_CRITICAL) {
                    explicitGcAllowedUntilMs = SystemClock.uptimeMillis() + 5_000L;
                }
            }

            @Override
            public void onLowMemory() {
                trimExtensionCaches();
                explicitGcAllowedUntilMs = SystemClock.uptimeMillis() + 10_000L;
            }

            @Override
            public void onConfigurationChanged(Configuration configuration) {
            }
        });
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityCreated(Activity activity, android.os.Bundle savedInstanceState) {
                configureWindow(activity);
            }

            @Override
            public void onActivityResumed(Activity activity) {
                configureWindow(activity);
            }

            @Override
            public void onActivityStarted(Activity activity) {
            }

            @Override
            public void onActivityPaused(Activity activity) {
            }

            @Override
            public void onActivityStopped(Activity activity) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, android.os.Bundle outState) {
            }

            @Override
            public void onActivityDestroyed(Activity activity) {
            }
        });
        Log.i(TAG, "initialized; enabled=" + enabled);
    }

    public static void setEnabled(boolean enabled) {
        PerformanceOptimizer.enabled = enabled;
        PerformanceOptimizer.reduceAnimations =
                DeVancedSettings.isReduceAnimationsEnabled();
        PerformanceOptimizer.disableHaptics =
                DeVancedSettings.isHapticsDisabled();
        PerformanceOptimizer.reduceBackgroundWork =
                DeVancedSettings.isBackgroundWorkReduced();
        StrictAdBlocker.setPerformanceMode(enabled);
        FeedSanitizer.setPerformanceMode(enabled || reduceBackgroundWork);
        if (enabled || reduceBackgroundWork) {
            FeedSanitizer.stopBackgroundScanning();
        }
    }

    public static boolean performHapticFeedback(View view, int feedbackConstant) {
        return !disableHaptics && view != null &&
                view.performHapticFeedback(feedbackConstant);
    }

    public static boolean performHapticFeedback(
            View view,
            int feedbackConstant,
            int flags
    ) {
        return !disableHaptics && view != null &&
                view.performHapticFeedback(feedbackConstant, flags);
    }

    public static void requestExplicitGc() {
        if (!enabled ||
                SystemClock.uptimeMillis() <= explicitGcAllowedUntilMs) {
            System.gc();
            return;
        }
        if (SUPPRESSED_GC.getAndIncrement() == 0) {
            Log.i(TAG, "suppressed explicit GC");
        }
    }

    public static void applyBackgroundThreadPriority() {
        if (!enabled) return;
        try {
            Process.setThreadPriority(Process.THREAD_PRIORITY_BACKGROUND);
        } catch (Throwable ignored) {
        }
    }

    private static void trimExtensionCaches() {
        StrictAdBlocker.trimCaches();
        FeedSanitizer.trimCaches();
    }

    private static void configureWindow(Activity activity) {
        if (!reduceAnimations || activity == null) return;
        try {
            Window window = activity.getWindow();
            if (window == null) return;
            window.setWindowAnimations(0);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                window.setEnterTransition(null);
                window.setExitTransition(null);
                window.setReturnTransition(null);
                window.setReenterTransition(null);
                window.setSharedElementEnterTransition(null);
                window.setSharedElementExitTransition(null);
                window.setSharedElementReturnTransition(null);
                window.setSharedElementReenterTransition(null);
                window.setAllowEnterTransitionOverlap(false);
                window.setAllowReturnTransitionOverlap(false);
            }
            activity.overridePendingTransition(0, 0);
        } catch (Throwable ignored) {
        }
    }
}
