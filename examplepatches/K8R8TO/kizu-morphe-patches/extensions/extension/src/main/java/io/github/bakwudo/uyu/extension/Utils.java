package io.github.bakwudo.uyu.extension;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.util.Log;

@SuppressWarnings("unused")
public final class Utils {
    private static final String TAG = "uyu";

    @SuppressLint("StaticFieldLeak")
    private static volatile Context context;

    private Utils() {
    }

    /**
     * Injection point: start of Application.onCreate.
     */
    public static void setContext(Context appContext) {
        context = appContext;
    }

    /**
     * @return The application context, or null before Application.onCreate.
     */
    public static Context getContext() {
        return context;
    }

    /**
     * Looks up one of Twitch's own resources by name. Resource ids change between Twitch
     * versions, names usually do not.
     *
     * @return The resource id, or 0 if it does not exist.
     */
    @SuppressLint("DiscouragedApi")
    public static int getResourceId(Context context, String name, String type) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }

    /**
     * @return The activity a view context belongs to, or null.
     */
    public static Activity findActivity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity activity) return activity;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    public static void logInfo(String message) {
        Log.i(TAG, message);
    }

    public static void logError(String message, Throwable throwable) {
        Log.e(TAG, message, throwable);
    }
}
