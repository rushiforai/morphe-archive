package app.morphe.extension.discord.bunny.launcher;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Process;
import android.os.SystemClock;
import android.util.Log;

import app.morphe.extension.discord.bunny.recovery.RecoveryManager;

/**
 * Bunny-owned semantic launcher dispatcher.
 *
 * No Android component declaration is required. Cold shortcut delivery is
 * observed from Discord's existing launcher Activity in Bunny's onCreate
 * hook. Warm shortcut delivery comes through React Native Linking.
 */
public final class BunnyShortcutActivity {
    private static final String TAG = "BunnyShortcut";
    private static final int RESTART_REQUEST = 0xB17;

    private BunnyShortcutActivity() {}

    public static boolean dispatch(
            Activity activity,
            Intent request
    ) {
        if (activity == null || request == null) {
            return false;
        }

        Uri uri =
                request.getData();

        String operation =
                shortcutOperation(uri);

        if (operation == null) {
            return false;
        }

        // One-shot intent semantics. Activity recreation must not replay it.
        request.setData(null);
        request.setAction(Intent.ACTION_MAIN);

        if ("safe-mode".equals(operation)) {
            requestSafeMode(activity);
            return true;
        }

        if ("recovery-settings".equals(operation)) {
            LauncherNavigationState.request(
                    activity,
                    BunnyShortcutContract.TARGET_RECOVERY
            );
            return true;
        }

        if ("settings".equals(operation)) {
            LauncherNavigationState.request(
                    activity,
                    BunnyShortcutContract.TARGET_SETTINGS
            );
            return true;
        }

        return false;
    }

    public static void requestSafeMode(
            Activity activity
    ) {
        if (activity == null) {
            return;
        }

        boolean alreadyRunning =
                RecoveryManager.isSessionInitialized();

        RecoveryManager.requestTemporarySafeModeNextLaunch(
                activity
        );

        if (alreadyRunning) {
            restartAtFreshBootstrap(activity);
        }
    }

    private static String shortcutOperation(
            Uri uri
    ) {
        if (uri == null) {
            return null;
        }

        if (!"bunny-morphe".equals(uri.getScheme())) {
            return null;
        }

        if (!"shortcut".equals(uri.getHost())) {
            return null;
        }

        if (uri.getPathSegments().isEmpty()) {
            return null;
        }

        String operation =
                uri.getPathSegments().get(0);

        if (
                "safe-mode".equals(operation)
                        || "recovery-settings".equals(operation)
                        || "settings".equals(operation)
        ) {
            return operation;
        }

        return null;
    }

    public static boolean restartAtFreshBootstrap(
            Activity activity
    ) {
        try {
            Intent launcher =
                    activity.getPackageManager()
                            .getLaunchIntentForPackage(
                                    activity.getPackageName()
                            );

            if (launcher == null) {
                throw new IllegalStateException(
                        "Discord launcher intent unavailable"
                );
            }

            launcher.setAction(Intent.ACTION_MAIN)
                    .setData(null)
                    .addFlags(
                            Intent.FLAG_ACTIVITY_NEW_TASK
                                    | Intent.FLAG_ACTIVITY_CLEAR_TOP
                                    | Intent.FLAG_ACTIVITY_SINGLE_TOP
                    );

            PendingIntent restart =
                    PendingIntent.getActivity(
                            activity,
                            RESTART_REQUEST,
                            launcher,
                            PendingIntent.FLAG_CANCEL_CURRENT
                                    | PendingIntent.FLAG_IMMUTABLE
                    );

            AlarmManager alarms =
                    (AlarmManager) activity.getSystemService(
                            Context.ALARM_SERVICE
                    );

            if (alarms == null) {
                throw new IllegalStateException(
                        "AlarmManager unavailable"
                );
            }

            alarms.set(
                    AlarmManager.ELAPSED_REALTIME,
                    SystemClock.elapsedRealtime(),
                    restart
            );

            activity.finishAndRemoveTask();
            Process.killProcess(Process.myPid());
            return true;
        } catch (Throwable failure) {
            Log.e(
                    TAG,
                    "Controlled Bunny restart failed",
                    failure
            );

            return false;
        }
    }
}