package app.amazonamoled.extension;

import android.app.Activity;
import android.app.Application;
import android.app.UiModeManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.webkit.WebView;

/**
 * Entry points of the "AMOLED dark theme" patch. Every public static method below is
 * called from code the patch injects into the app, and none of them may throw.
 */
@SuppressWarnings("unused")
public final class AmoledTheme {
    static final String TAG = "AmazonAmoled";

    private static final String PREFS = "amazon_amoled_theme";
    private static final String KEY_FORCED_NIGHT = "forced_app_night_mode";

    private static volatile boolean started;

    private AmoledTheme() {
    }

    // region Patch options. The patch replaces the body of these methods at build time.

    /** "on" (always dark) or "follow_system". */
    public static String configuredMode() {
        return "on";
    }

    /** Brightness of photos and videos in web pages, in percent (30 to 100). */
    public static int configuredPhotoBrightness() {
        return 85;
    }

    /** true: exact-color SVG inversion in web pages, false: cheaper CSS inversion. */
    public static boolean configuredPreciseWebColors() {
        return true;
    }

    /** Repaint the native (non-web) screens in pure black. */
    public static boolean configuredNativeScreens() {
        return true;
    }

    // endregion

    static boolean alwaysOn() {
        return "on".equals(configuredMode());
    }

    /** Whether the dark theme must be shown in this context right now. */
    static boolean isDarkActive(Context context) {
        if (alwaysOn()) return true;
        return context != null && isNight(context);
    }

    private static boolean isNight(Context context) {
        try {
            int night = context.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK;
            return night == Configuration.UI_MODE_NIGHT_YES;
        } catch (Throwable t) {
            return false;
        }
    }

    // region Hooks.

    /** Injected at the start of the app's Application.onCreate(). */
    public static void onApplicationCreate(Application app) {
        if (started || app == null) return;
        started = true;
        try {
            applyAppNightMode(app);
        } catch (Throwable t) {
            Log.e(TAG, "Could not set the app night mode", t);
        }
        if (!configuredNativeScreens()) return; // Only the web pages are darkened.
        try {
            app.registerActivityLifecycleCallbacks(new Lifecycle());
        } catch (Throwable t) {
            Log.e(TAG, "Could not register the activity callbacks", t);
        }
    }

    /** Injected at the start of onAttachedToWindow() of every WebView subclass of the app. */
    public static void onWebViewAttached(WebView webView) {
        WebDarkener.prepareIfDark(webView);
    }

    /** Injected at the start of every WebViewClient.onPageStarted() of the app. */
    public static void onPageStarted(WebView webView) {
        WebDarkener.onPageEvent(webView);
    }

    /** Injected at the start of every WebViewClient.onPageCommitVisible() of the app. */
    public static void onPageCommitVisible(WebView webView) {
        WebDarkener.onPageEvent(webView);
    }

    /** Injected at the start of every WebViewClient.onPageFinished() of the app. */
    public static void onPageFinished(WebView webView) {
        WebDarkener.onPageEvent(webView);
    }

    // endregion

    /**
     * Android 12+: switch this app (and only this app) to night mode, so that the platform's
     * own darkening, the app's night resources and WebView all see a dark configuration.
     */
    private static void applyAppNightMode(Application app) {
        if (Build.VERSION.SDK_INT < 31) return; // Android 10 and 11 are handled per activity.
        UiModeManager uiModeManager = (UiModeManager) app.getSystemService(Context.UI_MODE_SERVICE);
        if (uiModeManager == null) return;
        SharedPreferences prefs = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        boolean forced = prefs.getBoolean(KEY_FORCED_NIGHT, false);
        if (alwaysOn() && configuredNativeScreens()) {
            if (!forced || !isNight(app)) {
                uiModeManager.setApplicationNightMode(UiModeManager.MODE_NIGHT_YES);
                prefs.edit().putBoolean(KEY_FORCED_NIGHT, true).apply();
            }
        } else if (forced) {
            // An earlier build of the patch forced night mode: give control back to the system.
            uiModeManager.setApplicationNightMode(UiModeManager.MODE_NIGHT_AUTO);
            prefs.edit().putBoolean(KEY_FORCED_NIGHT, false).apply();
        }
    }

    /** Android 10 and 11 have no per-app night mode: mark each activity as night instead. */
    @SuppressWarnings("deprecation")
    static void forceNightConfiguration(Activity activity) {
        try {
            Resources res = activity.getResources();
            Configuration current = res.getConfiguration();
            if ((current.uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES) {
                return;
            }
            Configuration night = new Configuration(current);
            night.uiMode = (night.uiMode & ~Configuration.UI_MODE_NIGHT_MASK)
                    | Configuration.UI_MODE_NIGHT_YES;
            res.updateConfiguration(night, res.getDisplayMetrics());
        } catch (Throwable t) {
            Log.e(TAG, "Could not force the night configuration", t);
        }
    }

    private static final class Lifecycle implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityPreCreated(Activity activity, Bundle savedInstanceState) {
            // Only called on Android 10+.
            if (Build.VERSION.SDK_INT < 31 && alwaysOn()) forceNightConfiguration(activity);
        }

        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        }

        @Override
        public void onActivityStarted(Activity activity) {
        }

        @Override
        public void onActivityResumed(Activity activity) {
            try {
                if (configuredNativeScreens() && isDarkActive(activity)) {
                    NativeDarkener.attach(activity);
                }
            } catch (Throwable t) {
                Log.e(TAG, "Could not darken " + activity, t);
            }
        }

        @Override
        public void onActivityPaused(Activity activity) {
        }

        @Override
        public void onActivityStopped(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
            NativeDarkener.detach(activity);
        }
    }
}
