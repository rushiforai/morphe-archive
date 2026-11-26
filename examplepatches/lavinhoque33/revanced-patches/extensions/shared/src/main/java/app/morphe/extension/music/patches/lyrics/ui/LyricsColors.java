/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2269
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-25.
 */

package app.morphe.extension.music.patches.lyrics.ui;

import android.graphics.Color;

import app.morphe.extension.music.patches.utils.MusicLightTheme;
import app.morphe.extension.shared.utils.ResourceType;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.BaseThemeUtils;

final class LyricsColors {
    static final String APP_PRIMARY_TEXT_COLOR = "ytm_text_color_primary";

    /** The app's secondary text tint; on stock Music this is an opaque grey. */
    static final String APP_SECONDARY_TEXT_COLOR = "ytm_text_color_secondary";
    private static final String APP_TRANSLUCENT_SECONDARY_TEXT_COLOR = "ytm_text_color_secondary_translucent";
    private static final int FALLBACK_SECONDARY_ALPHA = 0x66;

    /** Dimmed until the word is sung. */
    static final float UNSUNG_ALPHA = MusicLightTheme.isEnabled() ? 0.76f : 0.35f;

    /** Smaller than the lyric it reads, so at the same weight the two would read as one line. */
    static final float ACTIVE_READING_ALPHA = 0.8f;
    /** Unified with reading alpha so translation remains legible over dynamic background. */
    private static final int ACTIVE_TRANSLATION_ALPHA = Math.round(0.8f * 255f);

    /** A background vocal is drawn on its own, so it is not dimmed with the lead line. */
    static final float ACTIVE_BG_ALPHA = 0.8f;
    private static int cachedLineColor;
    private static int cachedUnsungColor;
    private static int cachedSecondaryColor;
    private static int cachedInactiveTranslationAlpha;
    private static boolean colorCacheValid;

    static int secondaryTextColor() {
        ensureColorCache();
        return cachedSecondaryColor;
    }

    static int translationBaseAlpha(boolean active) {
        if (active) {
            return ACTIVE_TRANSLATION_ALPHA;
        }
        ensureColorCache();
        return cachedInactiveTranslationAlpha;
    }

    private static int inactiveTranslationAlpha(int secondaryColor) {
        if (MusicLightTheme.isEnabled()) {
            return Math.round(UNSUNG_ALPHA * 255f);
        }

        final int secondaryAlpha = Color.alpha(secondaryColor);
        if (secondaryAlpha < ACTIVE_TRANSLATION_ALPHA) {
            return secondaryAlpha;
        }

        // The normal lyric layout draws the primary glyph color at this opacity, not the
        // secondary color's darker RGB. Use the app's actual translucent secondary palette.
        final int translucentAlpha = Color.alpha(ResourceUtils.getColor(
                APP_TRANSLUCENT_SECONDARY_TEXT_COLOR, FALLBACK_SECONDARY_ALPHA << 24));
        return translucentAlpha < ACTIVE_TRANSLATION_ALPHA ? translucentAlpha : FALLBACK_SECONDARY_ALPHA;
    }

    private static int computeSecondaryColor(int base) {
        int secondary = ResourceUtils.getColor(APP_SECONDARY_TEXT_COLOR, 0);
        if (secondary != 0) {
            return secondary;
        }
        return Color.argb(FALLBACK_SECONDARY_ALPHA, Color.red(base), Color.green(base), Color.blue(base));
    }

    private static void ensureColorCache() {
        if (!colorCacheValid) {
            final int base = computeLineColor();
            cachedLineColor = base;
            cachedUnsungColor = Color.argb(Math.round(UNSUNG_ALPHA * 255f),
                    Color.red(base), Color.green(base), Color.blue(base));
            cachedSecondaryColor = computeSecondaryColor(base);
            cachedInactiveTranslationAlpha = inactiveTranslationAlpha(cachedSecondaryColor);
            colorCacheValid = true;
        }
    }

    static int unsungWordColor() {
        ensureColorCache();
        return cachedUnsungColor;
    }

    /** Falls back to the generic foreground color when the app ships no lyrics text color. */
    static int lineTextColor() {
        ensureColorCache();
        return cachedLineColor;
    }

    private static int computeLineColor() {
        final int colorId = ResourceUtils.getIdentifier(ResourceType.COLOR, APP_PRIMARY_TEXT_COLOR);
        if (colorId == 0) {
            return BaseThemeUtils.getAppForegroundColor();
        }
        return ResourceUtils.getColor(APP_PRIMARY_TEXT_COLOR, BaseThemeUtils.getAppForegroundColor());
    }

    static void invalidate() {
        colorCacheValid = false;
    }
}
