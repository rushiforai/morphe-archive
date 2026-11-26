package app.hushmessenger.extension;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;

/**
 * Whether HushMessenger's own screens (settings, the restart screen, saved message search, and bars Hush draws over a
 * chat before Messenger says its theme) are light. With Follow your phone's dark mode on they're light unless the
 * phone is in dark mode (#232); otherwise the Light theme switch decides, and both start off, so they're dark.
 */
final class SettingsTheme {
    private SettingsTheme() { }

    /** The Light theme switch: light settings while they don't follow the phone. Off by default. */
    static final String LIGHT = "light";
    /** Runtime switch: the screens go light or dark with the phone's dark mode, and Light theme waits. Off by default. */
    static final String FOLLOW_PHONE = "follow_phone_theme";

    /** Whether Follow your phone's dark mode is on. */
    static boolean followsPhone() {
        return Settings.preferences != null && Settings.preferences.getBoolean(FOLLOW_PHONE, false);
    }

    /** Whether a screen shown in [context] is light. Without a context, the phone's own configuration. */
    static boolean light(Context context) {
        if (Settings.preferences == null) return false;
        if (!followsPhone()) return Settings.preferences.getBoolean(LIGHT, false);
        Resources resources = context != null ? context.getResources() : Resources.getSystem();
        return !nightMode(resources.getConfiguration());
    }

    /** Whether [configuration] says the phone is in dark mode. An undefined mode reads as light, as Android draws it. */
    static boolean nightMode(Configuration configuration) {
        return (configuration.uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }
}
