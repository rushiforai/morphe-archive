package app.myspoti.extension;

import android.content.Context;
import android.graphics.Color;

/**
 * Small Java mirror of MySpoti's public Classic and Immersive design tokens.
 *
 * Source of truth: ui/theme/Theme.kt, ui/theme/Color.kt, ui/immersive/ImmersiveTheme.kt,
 * and data/api/SupportReminder.kt. Keep preference names and accent values in sync;
 * this extension runs in the host process and reads the same SharedPreferences.
 */
final class MySpotiImmersiveStyle {
    private static final String LOOK_PREFS = "settings_prefs";
    private static final String LOOK_KEY = "look";
    private static final String SUPPORT_PREFS = "support_reminder";
    private static final String IMMERSIVE_ACCENT_KEY = "accent_immersive";

    // ImmersiveTheme.kt
    static final int PAGE = Color.BLACK;
    static final int RAISED = Color.rgb(28, 28, 30); // #1C1C1E
    static final int GLASS_FILL = 0xE02C2C34;        // #2C2C34 at 88%
    static final int SEPARATOR = 0x1AFFFFFF;        // white at 10%
    static final int GLASS_EDGE = 0x1FFFFFFF;       // white at 12%
    static final int TEXT = Color.WHITE;
    static final int TEXT_SECONDARY = 0x99FFFFFF;   // white at 60%
    static final int TEXT_TERTIARY = 0x61FFFFFF;    // white at 38%
    static final int DESTRUCTIVE = 0xFFFF453A;

    private MySpotiImmersiveStyle() {}

    static boolean isImmersive(Context context) {
        return "IMMERSIVE".equals(context.getSharedPreferences(LOOK_PREFS, Context.MODE_PRIVATE)
                .getString(LOOK_KEY, "CLASSIC"));
    }

    /** The active look's accent, using the exact defaults and preference keys from MySpoti. */
    static int accent(Context context) {
        return accent(context, true);
    }

    static int accent(Context context, boolean immersive) {
        String keyName = immersive ? IMMERSIVE_ACCENT_KEY : "accent_classic";
        String key = context.getSharedPreferences(SUPPORT_PREFS, Context.MODE_PRIVATE)
                .getString(keyName, null);
        // Classic defaults to Spotify green. Immersive uses its own pink until the user
        // explicitly chooses an Immersive accent; an explicitly saved green remains green.
        if (key == null) return immersive ? 0xFFFF4F7B : 0xFF1ED760;
        switch (key) {
            case "green": return 0xFF1ED760;
            case "blue": return 0xFF509BF5;
            case "purple": return 0xFFAF7AF6;
            case "pink": return 0xFFF573A0;
            case "orange": return 0xFFFF9E3D;
            // SupportReminder falls back to GREEN for an invalid persisted accent value.
            default: return 0xFF1ED760;
        }
    }

    static int withAlpha(int color, int alpha) {
        return Color.argb(Math.max(0, Math.min(255, alpha)), Color.red(color),
                Color.green(color), Color.blue(color));
    }

    static int tintedSurface(Context context, int alpha) {
        return composite(accent(context), RAISED, alpha);
    }

    private static int composite(int foreground, int background, int alpha) {
        float a = Math.max(0, Math.min(255, alpha)) / 255f;
        int r = Math.round(Color.red(foreground) * a + Color.red(background) * (1f - a));
        int g = Math.round(Color.green(foreground) * a + Color.green(background) * (1f - a));
        int b = Math.round(Color.blue(foreground) * a + Color.blue(background) * (1f - a));
        return Color.rgb(r, g, b);
    }
}
