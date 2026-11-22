package app.userinsights.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.util.Log;

import java.lang.ref.WeakReference;

/**
 * Entry point called from the patched Reddit MainActivity.onCreate.
 * Tracks the visible activity so the accessibility service knows where to draw badges.
 */
@SuppressWarnings("unused")
public final class UserInsights {
    static final String TAG = "UserInsights";

    private static Context appContext;
    private static WeakReference<Activity> resumedActivity = new WeakReference<>(null);
    private static boolean callbacksRegistered;
    private static boolean promptShownThisProcess;

    private UserInsights() {
    }

    /**
     * Called by the patch at the start of Reddit's MainActivity.onCreate.
     */
    public static void onMainActivityCreate(Activity activity) {
        try {
            init(activity);
            resumedActivity = new WeakReference<>(activity);
            if (Prefs.consumeEmbeddedCrashNotice()) {
                android.widget.Toast.makeText(activity, "User Insights: pills in comments were turned off after a crash. "
                        + "Floating pills are used instead. You can turn them back on in User Insights settings.",
                        android.widget.Toast.LENGTH_LONG).show();
            }
            maybeShowEnablePrompt(activity);
        } catch (Throwable t) {
            Log.e(TAG, "onMainActivityCreate failed", t);
        }
    }

    static void init(Context context) {
        if (appContext == null) {
            appContext = context.getApplicationContext();
        }
        if (!callbacksRegistered && appContext instanceof Application) {
            ((Application) appContext).registerActivityLifecycleCallbacks(new LifecycleCallbacks());
            callbacksRegistered = true;
            installCrashGuard();
        }
    }

    /**
     * If the app ever crashes inside the pills drawn in comments, they are turned off for the
     * next start (floating pills are used instead), so a crash cannot repeat.
     */
    private static void installCrashGuard() {
        final Thread.UncaughtExceptionHandler previous = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler((thread, error) -> {
            try {
                if (EmbeddedPills.causedCrash(error)) {
                    Prefs.markEmbeddedCrashed();
                }
            } catch (Throwable ignored) {
                // Never get in the way of the crash report.
            }
            if (previous != null) {
                previous.uncaughtException(thread, error);
            }
        });
    }

    static Context app() {
        return appContext;
    }

    /**
     * The Reddit activity that is currently in the foreground, or null.
     */
    static Activity currentActivity() {
        Activity activity = resumedActivity.get();
        if (activity == null || activity.isFinishing()) {
            return null;
        }
        return activity;
    }

    static boolean isOwnScreen(Activity activity) {
        return activity instanceof ArchiveActivity || activity instanceof SettingsActivity;
    }

    static boolean isServiceEnabled(Context context) {
        try {
            String enabled = Settings.Secure.getString(
                    context.getContentResolver(), Settings.Secure.ENABLED_ACCESSIBILITY_SERVICES);
            if (enabled == null || enabled.isEmpty()) {
                return false;
            }
            ComponentName component = new ComponentName(context, InsightsAccessibilityService.class);
            String full = component.flattenToString();
            String shortName = component.flattenToShortString();
            for (String service : enabled.split(":")) {
                if (service.equalsIgnoreCase(full) || service.equalsIgnoreCase(shortName)) {
                    return true;
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "isServiceEnabled failed", t);
        }
        return false;
    }

    static void openAccessibilitySettings(Context context) {
        ComponentName component = new ComponentName(context, InsightsAccessibilityService.class);
        try {
            // Opens the page of this service directly (Android 11+).
            Intent details = new Intent("android.settings.ACCESSIBILITY_DETAILS_SETTINGS");
            details.putExtra(Intent.EXTRA_COMPONENT_NAME, component.flattenToString());
            details.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(details);
            return;
        } catch (Throwable ignored) {
            // Fall through to the general page.
        }
        try {
            Intent intent = new Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Throwable t) {
            Log.e(TAG, "Could not open accessibility settings", t);
        }
    }

    static void openAppInfo(Context context) {
        try {
            Intent intent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                    Uri.parse("package:" + context.getPackageName()));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Throwable t) {
            Log.e(TAG, "Could not open app info", t);
        }
    }

    static void openArchive(Context context, String user, String subreddit) {
        Intent intent = new Intent(context, ArchiveActivity.class);
        intent.putExtra(ArchiveActivity.EXTRA_USER, user);
        if (subreddit != null) {
            intent.putExtra(ArchiveActivity.EXTRA_SUBREDDIT, subreddit);
        }
        if (!(context instanceof Activity)) {
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        }
        context.startActivity(intent);
    }

    static void openSettings(Context context) {
        Intent intent = new Intent(context, SettingsActivity.class);
        if (!(context instanceof Activity)) {
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        }
        context.startActivity(intent);
    }

    /**
     * Opens a reddit.com link inside this Reddit app.
     */
    static void openInReddit(Context context, String url) {
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
        intent.setPackage(context.getPackageName());
        if (!(context instanceof Activity)) {
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        }
        try {
            context.startActivity(intent);
        } catch (Throwable t) {
            intent.setPackage(null);
            try {
                context.startActivity(intent);
            } catch (Throwable t2) {
                Log.e(TAG, "Could not open " + url, t2);
            }
        }
    }

    private static void maybeShowEnablePrompt(final Activity activity) {
        if (promptShownThisProcess || Prefs.promptDismissed() || isServiceEnabled(activity)) {
            return;
        }
        promptShownThisProcess = true;

        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            try {
                if (activity.isFinishing() || isServiceEnabled(activity)) {
                    return;
                }
                new AlertDialog.Builder(activity, android.R.style.Theme_DeviceDefault_Dialog_Alert)
                        .setTitle("Turn on User Insights")
                        .setMessage("To show each user's top subreddits and unhide hidden profiles, "
                                + "turn on \"Reddit User Insights\" in Accessibility settings.\n\n"
                                + "It only reads this Reddit app's screens.\n\n"
                                + "If the switch is greyed out: App info → ⋮ → Allow restricted settings, then try again.")
                        .setPositiveButton("Open settings", (d, w) -> openAccessibilitySettings(activity))
                        .setNeutralButton("Not now", null)
                        .setNegativeButton("Don't ask again", (d, w) -> Prefs.setPromptDismissed(true))
                        .show();
            } catch (Throwable t) {
                Log.e(TAG, "Could not show enable prompt", t);
            }
        }, 2500);
    }

    private static final class LifecycleCallbacks implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        }

        @Override
        public void onActivityStarted(Activity activity) {
        }

        @Override
        public void onActivityResumed(Activity activity) {
            resumedActivity = new WeakReference<>(activity);
            if (!isOwnScreen(activity)) {
                ScrollTracker.install(activity);
            }
            InsightsAccessibilityService.requestScan(0);
        }

        @Override
        public void onActivityPaused(Activity activity) {
            OverlayManager.clearAll();
            if (resumedActivity.get() == activity) {
                resumedActivity = new WeakReference<>(null);
            }
        }

        @Override
        public void onActivityStopped(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
            OverlayManager.remove(activity);
        }
    }
}
