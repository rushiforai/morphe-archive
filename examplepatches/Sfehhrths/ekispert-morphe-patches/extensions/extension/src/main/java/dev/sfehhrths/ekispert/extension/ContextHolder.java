package dev.sfehhrths.ekispert.extension;

import android.content.Context;

/**
 * Holds the application context captured from {@code AioApplication.onCreate()}.
 * Needed later for sending Broadcasts to the companion app; unused by the logcat milestone.
 */
public final class ContextHolder {

    private static volatile Context appContext;

    private ContextHolder() {
    }

    public static void set(Context context) {
        if (context == null) {
            return;
        }
        Context app = context.getApplicationContext();
        appContext = app != null ? app : context;
    }

    /** @return application context, or {@code null} if the hook has not run yet. */
    public static Context get() {
        return appContext;
    }
}
