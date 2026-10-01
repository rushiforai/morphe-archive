package app.spicetify.extension.spotify.theme;

import android.graphics.Color;
import android.util.Log;
import app.spicetify.extension.spotify.settings.PatchSettings;

/**
 * Replaces Spotify's stock Encore background and accent colours with the in-app theme.
 * The theme patch calls {@link #map(long)} on each stock colour constant while Spotify builds its Compose palette.
 */
public final class EncorePalette {
    static final int BASE = 0xFF121212;
    static final int ELEVATED = 0xFF1F1F1F;
    static final int HIGHLIGHT = 0xFF2A2A2A;
    static final int PRESS = 0xFF191919;
    static final int SURFACE = 0xFF282828;
    static final int ACCENT = 0xFF1ED760;
    static final int ACCENT_HIGHLIGHT = 0xFF3BE477;
    static final int ACCENT_PRESS = 0xFF1ABC54;

    private static volatile boolean warned;

    private EncorePalette() {}

    /** Takes and returns an ARGB colour in the low 32 bits, as Spotify's colour constants are stored. */
    public static long map(long argb) {
        if (!PatchSettings.initialized()) {
            if (!warned) {
                warned = true;
                Log.w("SpicetifyTheme", "Spotify built its palette before Spicetify settings loaded; keeping stock colors.");
            }
            return argb;
        }
        Integer mapped = map((int) argb, PatchSettings.themeBackground(), PatchSettings.themeSurface(), PatchSettings.themeAccent());
        return mapped == null ? argb : mapped & 0xFFFFFFFFL;
    }

    static Integer map(int color, Integer background, Integer surface, Integer accent) {
        if (background != null || surface != null) {
            int base = base(background);
            int top = surface(background, surface);
            switch (color) {
                case BASE: return base;
                case SURFACE: return top;
                case ELEVATED: return elevated(background, surface);
                case HIGHLIGHT: return lighten(top, 2);
                case PRESS: return mix(base, top, 0.25f);
                default: break;
            }
        }
        if (accent != null) {
            switch (color) {
                case ACCENT: return accent;
                case ACCENT_HIGHLIGHT: return mix(accent, Color.WHITE, 0.12f);
                case ACCENT_PRESS: return pressed(accent);
                default: break;
            }
        }
        return null;
    }

    static int base(Integer background) {
        return background == null ? BASE : background;
    }

    /** The chosen surface, or one derived from the background the way Spotify's #282828 relates to #121212. */
    static int surface(Integer background, Integer surface) {
        if (surface != null) return surface;
        return background == null ? SURFACE : lighten(background, 22);
    }

    static int elevated(Integer background, Integer surface) {
        return mix(base(background), surface(background, surface), 0.5f);
    }

    /** Darkens an accent the way Spotify's pressed green relates to its base green. */
    static int pressed(int accent) {
        return Color.argb(Color.alpha(accent), Math.round(Color.red(accent) * 0.87f),
                Math.round(Color.green(accent) * 0.87f), Math.round(Color.blue(accent) * 0.87f));
    }

    static int lighten(int color, int amount) {
        return Color.argb(Color.alpha(color), Math.min(255, Color.red(color) + amount),
                Math.min(255, Color.green(color) + amount), Math.min(255, Color.blue(color) + amount));
    }

    static int mix(int color, int toward, float fraction) {
        return Color.argb(Color.alpha(color),
                Math.round(Color.red(color) + (Color.red(toward) - Color.red(color)) * fraction),
                Math.round(Color.green(color) + (Color.green(toward) - Color.green(color)) * fraction),
                Math.round(Color.blue(color) + (Color.blue(toward) - Color.blue(color)) * fraction));
    }
}
