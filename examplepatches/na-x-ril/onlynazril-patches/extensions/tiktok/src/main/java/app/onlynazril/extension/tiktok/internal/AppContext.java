package app.onlynazril.extension.tiktok.internal;

import android.content.Context;

import app.onlynazril.extension.tiktok.settings.HomeHold;

public final class AppContext {
    private static volatile Context ctx;
    private static boolean announced;

    private AppContext() {}

    public static void set(Context c) {
        ctx = c;
        // The application object is the one place early enough to watch activities for the
        // Home-tab shortcut. Every other caller passes an application context, which does not
        // register callbacks.
        HomeHold.install(c);
        // The one line that proves the installed APK carries this extension and hooks early enough.
        // It carries the build marker too, so a stale APK is visible in the log rather than guessed at.
        if (!announced) {
            announced = true;
            Debug.print("extension attached (" + Debug.BUILD + ")");
        }
    }

    public static Context get() { return ctx; }
}
