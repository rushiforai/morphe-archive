package app.morphed.extension.twitch.ui;

import android.content.Context;
import android.content.res.Configuration;

/** Colors and sizes that sit with Twitch's own screens, light or dark. */
public final class Theme {
    public static final int PURPLE = 0xFF9147FF;

    public final boolean dark;
    public final int background, surface, text, secondary, hairline, danger;
    private final float density;

    public Theme(Context context) {
        dark = (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        density = context.getResources().getDisplayMetrics().density;
        background = dark ? 0xFF0E0E10 : 0xFFF7F7F8;
        surface = dark ? 0xFF1F1F23 : 0xFFFFFFFF;
        text = dark ? 0xFFEFEFF1 : 0xFF0E0E10;
        secondary = dark ? 0xFFADADB8 : 0xFF53535F;
        hairline = dark ? 0x33FFFFFF : 0x1F000000;
        danger = dark ? 0xFFFF6B6B : 0xFFD4183C;
    }

    public int dp(float value) {
        return Math.round(value * density);
    }

    public float dpf(float value) {
        return value * density;
    }
}
