package android.graphics.fonts;

import android.content.res.Resources;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.os.ParcelFileDescriptor;

import java.io.File;
import java.io.IOException;

/**
 * Android 10's Font for Android 9, where the class does not exist (patch "Android 9 (API 28)"). Loaded only on
 * Android 9 (classes load parent first). AndroidX's Android 10 font loader (TypefaceCompatApi29Impl) builds fonts
 * from resources and from downloaded font files with it. Android 9 cannot load a single font into a family, so each
 * font is loaded at once as a Typeface with the Android 8 APIs (Resources.getFont, Typeface.Builder), and
 * Typeface.CustomFallbackBuilder hands out the one closest to the style asked for.
 */
public final class Font {
    private final Typeface typeface;
    private final FontStyle style;
    private final int ttcIndex;
    private final String variationSettings;

    private Font(Typeface typeface, FontStyle style, int ttcIndex, String variationSettings) {
        this.typeface = typeface;
        this.style = style;
        this.ttcIndex = ttcIndex;
        this.variationSettings = variationSettings;
    }

    public FontStyle getStyle() {
        return style;
    }

    public int getTtcIndex() {
        return ttcIndex;
    }

    public String getFontVariationSettings() {
        return variationSettings;
    }

    /** No file: Android 9 fonts here come from resources or file descriptors. */
    public File getFile() {
        return null;
    }

    /** Android 12's member (Maps calls it only there): this font's metrics, through a copy of the paint. */
    public void getMetrics(Paint paint, Paint.FontMetrics outMetrics) {
        if (outMetrics == null) return;
        Paint copy = new Paint(paint);
        copy.setTypeface(typeface);
        copy.getFontMetrics(outMetrics);
    }

    /** Android 12's member (Maps calls it only there): Android 9 cannot measure by glyph id. */
    public float getGlyphBounds(int glyphId, Paint paint, RectF outBoundingBox) {
        if (outBoundingBox != null) outBoundingBox.setEmpty();
        return 0f;
    }

    /** Android 9 only: the typeface loaded for this font. */
    public Typeface typeface28() {
        return typeface;
    }

    public static final class Builder {
        private final Resources resources;
        private final int resourceId;
        private final ParcelFileDescriptor descriptor;
        private final Font font;
        private int weight = -1;
        private int slant = -1;
        private int ttcIndex;
        private String variationSettings;

        public Builder(Resources resources, int resourceId) {
            this.resources = resources;
            this.resourceId = resourceId;
            this.descriptor = null;
            this.font = null;
        }

        public Builder(ParcelFileDescriptor descriptor) {
            this.resources = null;
            this.resourceId = 0;
            this.descriptor = descriptor;
            this.font = null;
        }

        /** Android 12's copy builder (Maps calls it only there): the font's typeface with this builder's style. */
        public Builder(Font font) {
            this.resources = null;
            this.resourceId = 0;
            this.descriptor = null;
            this.font = font;
            this.weight = font.style.getWeight();
            this.slant = font.style.getSlant();
            this.ttcIndex = font.ttcIndex;
            this.variationSettings = font.variationSettings;
        }

        public Builder setWeight(int weight) {
            if (weight < FontStyle.FONT_WEIGHT_MIN || weight > FontStyle.FONT_WEIGHT_MAX) {
                throw new IllegalArgumentException("weight value must be [1, 1000]");
            }
            this.weight = weight;
            return this;
        }

        public Builder setSlant(int slant) {
            this.slant = slant;
            return this;
        }

        public Builder setTtcIndex(int ttcIndex) {
            this.ttcIndex = ttcIndex;
            return this;
        }

        public Builder setFontVariationSettings(String variationSettings) {
            this.variationSettings = variationSettings;
            return this;
        }

        /** Loads the font now, as Android 10 does; an unreadable font is an IOException, which AndroidX skips. */
        public Font build() throws IOException {
            Typeface typeface;
            try {
                if (font != null) {
                    typeface = font.typeface;
                } else if (descriptor != null) {
                    Typeface.Builder builder = new Typeface.Builder(descriptor.getFileDescriptor()).setTtcIndex(ttcIndex);
                    if (weight != -1) builder.setWeight(weight);
                    if (slant != -1) builder.setItalic(slant == FontStyle.FONT_SLANT_ITALIC);
                    if (variationSettings != null && !variationSettings.isEmpty()) {
                        builder.setFontVariationSettings(variationSettings);
                    }
                    typeface = builder.build();
                } else {
                    typeface = resources.getFont(resourceId);
                }
            } catch (RuntimeException exception) {
                throw new IOException("Could not load the font", exception);
            }
            if (typeface == null) throw new IOException("Could not load the font");
            int fontWeight = weight != -1 ? weight : typeface.isBold() ? FontStyle.FONT_WEIGHT_BOLD : FontStyle.FONT_WEIGHT_NORMAL;
            int fontSlant = slant != -1 ? slant : typeface.isItalic() ? FontStyle.FONT_SLANT_ITALIC : FontStyle.FONT_SLANT_UPRIGHT;
            return new Font(typeface, new FontStyle(fontWeight, fontSlant), ttcIndex, variationSettings);
        }
    }
}
