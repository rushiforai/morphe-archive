package samsungcompat;

import android.app.Application;

/**
 * Package name the APK's resources are filed under. Morphe's Clone app renames it together with the app;
 * a manifest-only rename (NotesAppRebuild) keeps Samsung's. Pen settings look layouts and palettes up by it.
 */
public final class ResourcePackage {
    private static final String ORIGINAL = "com.samsung.android.app.notes";
    private static String name;

    private ResourcePackage() {}

    /**
     * Authority of the app's share FileProvider. The code has Samsung's written in, but a renamed app's
     * manifest declares it under its own package name, so build it from the running package.
     */
    public static String authority(String written) {
        try {
            Application app = (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            if (app == null || written == null || !written.startsWith(ORIGINAL + ".")) return written;
            return app.getPackageName() + written.substring(ORIGINAL.length());
        } catch (Throwable t) {
            return written;
        }
    }

    /** Called with the package name a lookup was about to use; returns the one that resolves. */
    public static String get(String reported) {
        if (name != null) return name;
        try {
            Application app = (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            if (app == null) return reported;
            String own = app.getPackageName();
            name = app.getResources().getIdentifier("app_name", "string", own) != 0 ? own : ORIGINAL;
            return name;
        } catch (Throwable t) {
            return reported;
        }
    }
}
