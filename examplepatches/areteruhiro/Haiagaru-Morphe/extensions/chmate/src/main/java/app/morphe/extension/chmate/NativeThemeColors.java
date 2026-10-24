package app.morphe.extension.chmate;

import android.content.Context;

/** Filled at patch time from ChMate's selected theme, including custom themes. */
public final class NativeThemeColors {
    private NativeThemeColors() { }

    // Order: window, text, primary, dialog, progress, progress background, list.
    // Unsupported builds retain the existing system-based Compose theme.
    public static int[] colors(Context context) { return null; }
}
