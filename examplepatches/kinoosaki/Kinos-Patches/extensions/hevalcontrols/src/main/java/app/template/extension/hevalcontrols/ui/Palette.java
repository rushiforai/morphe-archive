package app.template.extension.hevalcontrols.ui;

import android.content.Context;
import android.content.res.Configuration;

import app.template.extension.hevalcontrols.HevalSettings;

/**
 * Colour tokens for the settings screen. Framework only: the .mpe carries no resources.
 *
 * <p>Text contrast (WCAG 2.x, on the row surface / the page background), 2026-11-11:
 * {@code secondary} (descriptions) light 9.33 / 8.65, dark 10.08 / 11.47, AMOLED 11.26 / 12.88;
 * {@code muted} (tertiary: "Off", footnotes) light 6.50, dark 7.63, AMOLED 8.52 on the surface;
 * {@code accent} ("On", the row marker) light 6.53, dark 8.83, AMOLED 9.86 on the surface.
 * Every pair stays above AA 4.5:1.
 */
final class Palette {
    final boolean light;
    /** Descriptions and other secondary text; {@code muted} is for tertiary text only. */
    final int secondary;
    final int background, surface, text, muted, accent, onAccent, line, outline, track, ripple;
    final int warning, warningSurface, error, errorSurface, success;

    private Palette(boolean light, boolean amoled) {
        this.light = light;
        if (light) {
            background = 0xfff6f6f9;
            surface = 0xffffffff;
            text = 0xff1b1b21;
            secondary = 0xff454652;
            muted = 0xff5c5d6a;
            accent = 0xff2f55c4;
            onAccent = 0xffffffff;
            line = 0xffdcdde5;
            outline = 0xff7d7f8c;
            track = 0xffd3d5de;
            ripple = 0x222f55c4;
            warning = 0xff6f4a00;
            warningSurface = 0xffffefc7;
            error = 0xffa8231b;
            errorSurface = 0xffffdad5;
            success = 0xff1d6b35;
        } else {
            background = amoled ? 0xff000000 : 0xff121214;
            surface = amoled ? 0xff141419 : 0xff1e1f25;
            text = 0xffeeeef3;
            secondary = 0xffc8cad6;
            muted = 0xffaeb0bd;
            accent = 0xffa7bcff;
            onAccent = 0xff0e1b45;
            line = amoled ? 0xff2a2c34 : 0xff34363f;
            outline = 0xff8b8d9a;
            track = 0xff3b3d47;
            ripple = 0x33a7bcff;
            warning = 0xffffcf70;
            warningSurface = amoled ? 0xff2a1f00 : 0xff352a06;
            error = 0xffffb4aa;
            errorSurface = amoled ? 0xff3a0a06 : 0xff4a120c;
            success = 0xff8fd9a0;
        }
    }

    /** The palette for the saved theme choice; "system" follows the night mode. */
    static Palette resolve(Context context, String theme) {
        if (HevalSettings.THEME_LIGHT.equals(theme)) return new Palette(true, false);
        if (HevalSettings.THEME_DARK.equals(theme)) return new Palette(false, false);
        if (HevalSettings.THEME_AMOLED.equals(theme)) return new Palette(false, true);
        int night = context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return new Palette(night != Configuration.UI_MODE_NIGHT_YES, false);
    }
}
