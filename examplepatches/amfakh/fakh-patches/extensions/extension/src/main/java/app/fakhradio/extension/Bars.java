package app.fakhradio.extension;

import android.content.Context;
import android.content.res.Configuration;

/** The system bar icons of the full player, which the app forces to white. */
public final class Bars {
    private Bars() {
    }

    /** Whether the bar icons should be dark: in the light theme, where the player is pale. */
    public static boolean darkIcons(Context context) {
        int night = context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return night != Configuration.UI_MODE_NIGHT_YES;
    }
}
