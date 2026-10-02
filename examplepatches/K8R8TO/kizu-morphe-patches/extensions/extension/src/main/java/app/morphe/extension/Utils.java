package app.morphe.extension;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.util.Log;

import app.morphe.extension.twitch.emotes.EmoteSupport;

public final class Utils {
    private static final String TAG = "kizu";
    @SuppressLint("StaticFieldLeak")
    private static volatile Context context;

    private Utils() {}

    public static void setContext(Context appContext) {
        context = appContext;
        io.github.bakwudo.uyu.extension.Utils.setContext(appContext);
        EmoteSupport.init(appContext);
    }

    public static Context getContext() {
        return context;
    }

    @SuppressLint("DiscouragedApi")
    public static int getResourceId(Context context, String name, String type) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }

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
