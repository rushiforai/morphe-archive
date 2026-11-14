package app.morphe.extension.mapsautomotive.android9;

import android.graphics.Insets;
import android.os.Build;
import android.view.WindowInsets;

/**
 * Android 10's Insets getters of WindowInsets (patch "Android 9 (API 28)"). Android 9 has the same values as ints
 * (Insets.of is on its light greylist); gesture and tappable insets are the system window insets, as in AndroidX's
 * WindowInsetsCompat below Android 10.
 */
public final class WindowInsets28 {
    public static final String OWNER = "Landroid/view/WindowInsets;";

    private WindowInsets28() {
    }

    public static Insets getSystemWindowInsets(WindowInsets insets) {
        if (Build.VERSION.SDK_INT >= 29) return insets.getSystemWindowInsets();
        return system(insets);
    }

    public static Insets getStableInsets(WindowInsets insets) {
        if (Build.VERSION.SDK_INT >= 29) return insets.getStableInsets();
        return Insets.of(insets.getStableInsetLeft(), insets.getStableInsetTop(), insets.getStableInsetRight(),
                insets.getStableInsetBottom());
    }

    public static Insets getSystemGestureInsets(WindowInsets insets) {
        if (Build.VERSION.SDK_INT >= 29) return insets.getSystemGestureInsets();
        return system(insets);
    }

    public static Insets getMandatorySystemGestureInsets(WindowInsets insets) {
        if (Build.VERSION.SDK_INT >= 29) return insets.getMandatorySystemGestureInsets();
        return system(insets);
    }

    public static Insets getTappableElementInsets(WindowInsets insets) {
        if (Build.VERSION.SDK_INT >= 29) return insets.getTappableElementInsets();
        return system(insets);
    }

    private static Insets system(WindowInsets insets) {
        return Insets.of(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
    }
}
