package app.spicetify.extension.spotify.theme;

import android.app.Application;

/** Attaches the overlay with fixed IDs, because test resources lack Spotify's colour names. */
public final class ThemeOverlayTestAccess {
    public static final int BACKGROUND = 0x7f0604bc;
    public static final int ELEVATED = 0x7f0604bd;
    public static final int ACCENT = 0x7f0604d5;
    public static final int PRESSED_ACCENT = 0x7f0604d7;

    private ThemeOverlayTestAccess() {}

    public static void attach(Application application) {
        ThemeOverlay.attach(application, new ThemeOverlay.Ids(
                new int[] {0x7f060615, 0x7f060610, BACKGROUND, 0x7f0604bd, 0x7f06024e, 0x7f060ed1},
                new int[] {ACCENT, 0x7f0604d0, 0x7f060643}, PRESSED_ACCENT), 0xFF121212, 0xFF1ED760);
    }

    public static void detach() {
        ThemeOverlay.detach();
    }
}
