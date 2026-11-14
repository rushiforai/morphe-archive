package app.morphe.extension.mapsautomotive.android9;

import android.graphics.Insets;
import android.os.Build;

/**
 * Android 10 members of Insets (patch "Android 9 (API 28)"). Android 9's hidden Insets has the four fields and of(),
 * which are on its light greylist, but not max() and no allowed equals(); both are computed from the fields.
 */
public final class Insets28 {
    public static final String OWNER = "Landroid/graphics/Insets;";

    private Insets28() {
    }

    public static Insets max(Insets a, Insets b) {
        if (Build.VERSION.SDK_INT >= 29) return Insets.max(a, b);
        return Insets.of(Math.max(a.left, b.left), Math.max(a.top, b.top), Math.max(a.right, b.right),
                Math.max(a.bottom, b.bottom));
    }

    public static boolean equals(Insets insets, Object other) {
        if (Build.VERSION.SDK_INT >= 29) return insets.equals(other);
        if (insets == other) return true;
        if (!(other instanceof Insets)) return false;
        Insets o = (Insets) other;
        return insets.left == o.left && insets.top == o.top && insets.right == o.right && insets.bottom == o.bottom;
    }
}
