package com.nmnvan.extension.thescore;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

@SuppressWarnings("unused")
public final class Utils {

    private static final String TAG = "NeilMorphe";

    private static volatile Context context;

    private Utils() {
    }

    /**
     * Injection point: start of ScoreApplication.onCreate().
     */
    public static void setContext(Context appContext) {
        context = appContext.getApplicationContext();
    }

    /**
     * @return the application context, or null if setContext() was not called yet.
     */
    public static Context getContext() {
        return context;
    }

    /**
     * Relaunches the app so settings that are read at startup take effect.
     */
    public static void restartApp(Activity activity) {
        Intent intent = activity.getPackageManager().getLaunchIntentForPackage(activity.getPackageName());
        if (intent == null) return;
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        activity.finishAffinity();
        activity.startActivity(intent);
        Runtime.getRuntime().exit(0);
    }

    public static void logException(String message, Throwable ex) {
        Log.e(TAG, message, ex);
    }
}
