package app.lchanc3.extension.jptt;

import android.app.Application;
import android.content.Context;

/**
 * Holds the application context, set from a hook in {@code JpttApplication.onCreate()}.
 */
@SuppressWarnings("unused")
public final class JpttContext {

    public static final String LOG_TAG = "JpttPatches";

    private static volatile Context applicationContext;

    /** Called from the patched {@code JpttApplication.onCreate()}. */
    public static void setApplication(Application application) {
        applicationContext = application;
    }

    /** Null until the application has been created. */
    public static Context get() {
        return applicationContext;
    }

    private JpttContext() {
    }
}
