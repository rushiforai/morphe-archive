package app.morphe.extension.mapsautomotive.android9;

import android.content.res.Resources;
import android.os.Build;

/** Resources.Theme.rebase (patch "Android 9 (API 28)"): Android 9's own is not allowed for apps, so nothing. */
public final class Theme28 {
    public static final String OWNER = "Landroid/content/res/Resources$Theme;";

    private Theme28() {
    }

    public static void rebase(Resources.Theme theme) {
        if (Build.VERSION.SDK_INT >= 29) theme.rebase();
    }
}
