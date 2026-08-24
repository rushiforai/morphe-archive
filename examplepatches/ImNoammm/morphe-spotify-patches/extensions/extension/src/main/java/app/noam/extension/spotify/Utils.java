package app.noam.extension.spotify;

import android.content.Context;
import android.util.Log;

public final class Utils {
    public static final String TAG = "MorpheSpotify";

    private static Context context;

    private Utils() {}

    public static void setContext(Context newContext) {
        if (newContext != null) context = newContext.getApplicationContext();
    }

    public static Context getContext() {
        return context;
    }

    public static void log(String message) {
        Log.d(TAG, message);
    }

    public static void logError(String message, Throwable throwable) {
        Log.e(TAG, message, throwable);
    }

    public static int stringId(String name) {
        Context c = context;
        if (c == null) return 0;
        return c.getResources().getIdentifier(name, "string", c.getPackageName());
    }
}
