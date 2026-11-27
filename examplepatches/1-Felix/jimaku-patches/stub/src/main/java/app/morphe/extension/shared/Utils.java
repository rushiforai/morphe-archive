package app.morphe.extension.shared;

import android.content.Context;

/** Signature stub of the Morphe extension library's utilities. */
public final class Utils {
    private Utils() {
    }

    /** The app's context, set when YouTube's main activity is created. */
    public static Context getContext() {
        throw new UnsupportedOperationException();
    }

    /** Whether YouTube shows its dark theme, as Morphe's theme hook last saw it. */
    public static boolean isDarkModeEnabled() {
        throw new UnsupportedOperationException();
    }
}
