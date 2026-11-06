package android.app;

import android.content.Context;

/** Supply an isolated application context to the production reflective bridge. */
public final class ActivityThread {
    public static Context application = new Context();
    public static Context currentApplication() { return application; }
}
