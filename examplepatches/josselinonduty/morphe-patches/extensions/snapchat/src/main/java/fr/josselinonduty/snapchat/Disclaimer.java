package fr.josselinonduty.snapchat;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.util.Log;

import java.util.Locale;

/**
 * One-time warning shown on the first visible screen of the patched app (login or main),
 * whichever activity comes first. Enabled only when the Show disclaimer patch added its
 * manifest meta-data flag.
 */
public final class Disclaimer implements Application.ActivityLifecycleCallbacks {
    private static final String PREFS = "fr.josselinonduty.snapchat";
    private static final String KEY_ACK = "disclaimer_ack";
    private static final String META_ENABLED = "fr.josselinonduty.snapchat.disclaimer";

    private static final String TAG = "SnapDisclaimer";

    private AlertDialog dialog;
    private Activity host;
    private boolean done;

    private Disclaimer() {}

    /** Called from the component factory, before the Application is even attached. */
    public static void register(Application app) {
        app.registerActivityLifecycleCallbacks(new Disclaimer());
    }

    private static boolean enabled(Activity activity) throws Exception {
        ApplicationInfo info = activity.getPackageManager()
                .getApplicationInfo(activity.getPackageName(), PackageManager.GET_META_DATA);
        return info.metaData != null && info.metaData.getBoolean(META_ENABLED, false);
    }

    @Override
    public void onActivityResumed(final Activity activity) {
        Log.i(TAG, "resumed " + activity.getClass().getName() + " done=" + done + " dialog=" + (dialog != null));
        if (done || dialog != null) return;
        try {
            if (!enabled(activity)) {
                Log.w(TAG, "meta-data flag missing");
                done = true;
                return;
            }
            final SharedPreferences prefs = activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            if (prefs.getBoolean(KEY_ACK, false)) {
                Log.i(TAG, "already acknowledged");
                done = true;
                return;
            }
            boolean fr = Locale.getDefault().getLanguage().equals("fr");
            dialog = new AlertDialog.Builder(activity, AlertDialog.THEME_DEVICE_DEFAULT_DARK)
                    .setTitle(fr ? "Application modifiée" : "Modified app")
                    .setMessage(fr
                            ? "Cette version de Snapchat est modifiée par des patchs encore récents. "
                            + "Snapchat s'est historiquement montré hostile envers les applications modifiées : "
                            + "votre compte peut être verrouillé ou banni.\n\n"
                            + "Il est conseillé de n'utiliser que des comptes auxquels vous ne tenez pas."
                            : "This Snapchat build is modified by very new patches. Snapchat has "
                            + "historically been unfriendly to modified apps, so your account may be "
                            + "locked or banned.\n\n"
                            + "Only use accounts you do not care about.")
                    .setCancelable(false)
                    .setPositiveButton(fr ? "J'ai compris" : "I understand", (d, which) -> {
                        prefs.edit().putBoolean(KEY_ACK, true).apply();
                        done = true;
                    })
                    .create();
            dialog.setOnDismissListener(d -> dialog = null);
            host = activity;
            dialog.show();
            Log.i(TAG, "shown");
        } catch (Throwable error) {
            Log.e(TAG, "failed", error);
            done = true; // A disclaimer must never crash the app.
        }
    }

    @Override
    public void onActivityDestroyed(Activity activity) {
        // The screen hosting the dialog is going away (e.g. login -> main): re-show on the next one.
        if (dialog != null && host == activity) {
            dialog.dismiss();
            dialog = null;
        }
    }

    @Override public void onActivityCreated(Activity activity, Bundle state) {}
    @Override public void onActivityStarted(Activity activity) {}
    @Override public void onActivityPaused(Activity activity) {}
    @Override public void onActivityStopped(Activity activity) {}
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
}
