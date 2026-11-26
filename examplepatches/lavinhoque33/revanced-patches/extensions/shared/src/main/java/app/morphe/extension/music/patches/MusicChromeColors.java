/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25.
 */

package app.morphe.extension.music.patches;

import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;

import androidx.annotation.Nullable;

import app.morphe.extension.music.patches.utils.MusicLightTheme;
import app.morphe.extension.shared.ui.glass.GlassCapsuleDrawable;

/** Foregrounds paired with the surfaces of Music's bottom navigation and miniplayer. */
final class MusicChromeColors {
    private static final int MUTED_DARK = 0xFF505357;
    private static final int MUTED_LIGHT = 0xFFDADCE0;
    private static final float TEXT_CONTRAST = 4.5f;
    private static final int[][] PIVOT_STATES = {{android.R.attr.state_selected}, {}};
    private static final int[][] CONTROL_STATES = {{-android.R.attr.state_enabled}, {}};

    private MusicChromeColors() {
    }

    static ColorStateList pivotTint(int selected, int unselected) {
        return new ColorStateList(PIVOT_STATES, new int[]{selected, unselected});
    }

    static ColorStateList controlTint(int foreground) {
        final int disabled = (foreground & 0x00FFFFFF) | 0x61000000;
        return new ColorStateList(CONTROL_STATES, new int[]{disabled, foreground});
    }

    static int foreground(int surface) {
        if (contrast(surface, MusicLightTheme.FOREGROUND) >= TEXT_CONTRAST) {
            return MusicLightTheme.FOREGROUND;
        }
        return contrast(surface, Color.WHITE) >= TEXT_CONTRAST ? Color.WHITE : Color.BLACK;
    }

    static int secondary(int surface, int foreground) {
        final int muted = foreground == Color.WHITE ? MUTED_LIGHT : MUTED_DARK;
        if (contrast(surface, muted) >= TEXT_CONTRAST) return muted;

        // Keep as much distinction as the particular album/custom surface allows.
        final int softened = blend(foreground, muted, 0.5f);
        return contrast(surface, softened) >= TEXT_CONTRAST ? softened : foreground;
    }

    private static float contrast(int first, int second) {
        final float firstLuminance = Color.luminance(first);
        final float secondLuminance = Color.luminance(second);
        return (Math.max(firstLuminance, secondLuminance) + 0.05f)
                / (Math.min(firstLuminance, secondLuminance) + 0.05f);
    }

    /** Approximate the center fill of the shared glass capsule over the light browse surface. */
    static int glassSurface(int albumColor, float opacityScale, boolean lightTint) {
        if (albumColor == 0) return MusicLightTheme.SURFACE;

        final int tint = GlassCapsuleDrawable.toTintColor(albumColor);
        final int fill = lightTint ? blend(tint, Color.WHITE, 0.55f) : tint;
        return blend(MusicLightTheme.SURFACE, fill, Math.min(1f, (lightTint ? 0.44f : 0.54f) * opacityScale));
    }

    static int drawableSurface(@Nullable Drawable background, int fallback) {
        if (background instanceof ColorDrawable drawable) {
            return over(drawable.getColor(), fallback);
        }
        if (background instanceof GradientDrawable gradient) {
            ColorStateList color = gradient.getColor();
            if (color != null) return over(color.getDefaultColor(), fallback);
        }
        return fallback;
    }

    private static int over(int foreground, int background) {
        if (Color.alpha(foreground) == 255) return foreground;
        if (Color.alpha(foreground) == 0) return background;

        return blend(background, foreground, Color.alpha(foreground) / 255f);
    }

    private static int blend(int from, int to, float fraction) {
        final float remaining = 1f - fraction;
        return Color.rgb(Math.round(Color.red(from) * remaining + Color.red(to) * fraction),
                Math.round(Color.green(from) * remaining + Color.green(to) * fraction),
                Math.round(Color.blue(from) * remaining + Color.blue(to) * fraction));
    }
}
