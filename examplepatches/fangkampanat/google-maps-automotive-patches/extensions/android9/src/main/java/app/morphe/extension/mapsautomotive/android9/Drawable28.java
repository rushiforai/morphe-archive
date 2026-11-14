package app.morphe.extension.mapsautomotive.android9;

import android.graphics.drawable.Drawable;
import android.os.Build;

/** Drawable.isProjected (patch "Android 9 (API 28)"): no projection on Android 9. */
public final class Drawable28 {
    public static final String OWNER = "Landroid/graphics/drawable/Drawable;";

    private Drawable28() {
    }

    public static boolean isProjected(Drawable drawable) {
        if (Build.VERSION.SDK_INT >= 29) return drawable.isProjected();
        return false;
    }
}
