package android.graphics;

import android.graphics.fonts.Font;
import android.graphics.fonts.FontFamily;
import android.graphics.fonts.FontStyle;

/**
 * Android 10's Typeface.CustomFallbackBuilder for Android 9, where the class does not exist (patch "Android 9
 * (API 28)"). A top-level class under the nested class's binary name; loaded only on Android 9 (classes load parent
 * first). build() takes the first family's font closest to the style and applies the style with
 * Typeface.create(Typeface, int, boolean) (Android 9). Custom fallback families and the system fallback name are kept
 * but unused: Android 9 falls back to the system fonts for missing glyphs.
 */
public final class Typeface$CustomFallbackBuilder {
    public static final int MAX_CUSTOM_FALLBACK = 64;

    private final FontFamily family;
    private FontStyle style = new FontStyle();
    private int customFallbacks;

    public Typeface$CustomFallbackBuilder(FontFamily family) {
        if (family == null) throw new NullPointerException("family");
        this.family = family;
    }

    public Typeface$CustomFallbackBuilder setSystemFallback(String familyName) {
        if (familyName == null) throw new NullPointerException("familyName");
        return this;
    }

    public Typeface$CustomFallbackBuilder setStyle(FontStyle style) {
        if (style == null) throw new NullPointerException("style");
        this.style = style;
        return this;
    }

    public Typeface$CustomFallbackBuilder addCustomFallback(FontFamily family) {
        if (family == null) throw new NullPointerException("family");
        if (++customFallbacks >= MAX_CUSTOM_FALLBACK) {
            throw new IllegalArgumentException("Custom fallback limit exceeded(" + MAX_CUSTOM_FALLBACK + ")");
        }
        return this;
    }

    public Typeface build() {
        Font font = family.closestFont28(style);
        return Typeface.create(font.typeface28(), style.getWeight(), style.getSlant() == FontStyle.FONT_SLANT_ITALIC);
    }
}
