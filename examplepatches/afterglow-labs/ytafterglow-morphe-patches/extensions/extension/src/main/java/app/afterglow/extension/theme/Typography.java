package app.afterglow.extension.theme;

import android.graphics.Paint;
import android.graphics.Typeface;
import android.text.TextPaint;
import android.util.TypedValue;
import android.widget.TextView;

import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.AfterglowPrefs;

/** Applies size/weight/style relative to each original font, without compounding recycled text. */
public final class Typography {
    private static final Map<Paint, Source> SOURCES = new WeakHashMap<>();
    private static final Map<String, Typeface> FONTS = new HashMap<>();
    // A registry font can reach both a styled span and the layout paint. Do not
    // apply relative weight twice when the layout receives our own replacement.
    private static final java.util.Set<Typeface> PROVIDED = java.util.Collections.newSetFromMap(new WeakHashMap<>());
    private static final class Source {
        float size, appliedSize;
        Typeface face, appliedFace;
        Source(Paint paint) { size = appliedSize = paint.getTextSize(); face = appliedFace = paint.getTypeface(); }
    }
    private Typography() {}
    public static synchronized Typeface nativeTypeface(Typeface original) {
        if (original == null || !InstalledTweaks.has("typography") || PROVIDED.contains(original)) return original;
        try {
            Typeface replacement = styledFont(original);
            if (replacement != original) PROVIDED.add(replacement);
            return replacement;
        } catch (Throwable error) { Afterglow.error("Typography.registry", error); return original; }
    }
    public static void textPaint(TextPaint paint) {
        if (paint == null || !InstalledTweaks.has("typography")) return;
        try { apply(paint, false); } catch (Throwable error) { Afterglow.error("Typography.textPaint", error); }
    }
    /** Spans receive a copy of an already sized layout paint; change only its face. */
    public static void span(TextPaint paint) {
        if (paint != null) paint.setTypeface(nativeTypeface(paint.getTypeface()));
    }
    public static void textView(TextView view, boolean tab) {
        if (!InstalledTweaks.has("typography")) return;
        Paint paint = view.getPaint();
        float before = paint.getTextSize(); Typeface face = paint.getTypeface();
        apply(paint, tab);
        float size = paint.getTextSize(); Typeface replacement = paint.getTypeface();
        if (before != size || face != replacement) {
            // Restore before using TextView setters so its layout cache sees the change.
            paint.setTextSize(before); paint.setTypeface(face);
            view.setTextSize(TypedValue.COMPLEX_UNIT_PX, size); view.setTypeface(replacement);
        }
    }
    private static synchronized void apply(Paint paint, boolean tab) {
        Source source = SOURCES.get(paint);
        if (source == null) { source = new Source(paint); SOURCES.put(paint, source); }
        if (paint.getTextSize() != source.appliedSize) source.size = paint.getTextSize();
        if (paint.getTypeface() != source.appliedFace) source.face = paint.getTypeface();
        int sizeMode = Math.max(0, Math.min(5, AfterglowPrefs.getInt("theme_fontSizeMode")));
        float scale = new float[]{1, .9f, 1, 1.1f, 1.2f, 1.3f}[sizeMode];
        float density = Afterglow.context() == null ? 1 : Afterglow.context().getResources().getDisplayMetrics().scaledDensity;
        int tabMode = tab ? Math.max(0, Math.min(2, AfterglowPrefs.getInt("theme_tabLabelSizeMode"))) : 0;
        float size = Math.max(9 * density, source.size * scale - tabMode * density);
        Typeface face = PROVIDED.contains(source.face) ? source.face : styledFont(source.face);
        // Auto is exact passthrough, including small native labels and icon fonts.
        source.appliedSize = sizeMode == 0 && tabMode == 0 ? source.size : size;
        source.appliedFace = face;
        paint.setTextSize(source.appliedSize); paint.setTypeface(face);
    }
    private static Typeface styledFont(Typeface source) {
        int mode = Math.max(0, Math.min(32, AfterglowPrefs.getInt("theme_fontMode")));
        if (mode == 0 && InstalledTweaks.has("lite-mode") && app.afterglow.extension.settings.LiteMode.enabled()) mode = 5;
        int weightMode = Math.max(0, Math.min(9, AfterglowPrefs.getInt("theme_fontWeightMode")));
        int style = Math.max(0, Math.min(2, AfterglowPrefs.getInt("theme_fontStyleMode")));
        return styledFont(source, mode, weightMode, style);
    }
    /** Editor-only rendering: a draft never changes the active preference or native font cache policy. */
    public static synchronized void preview(Paint paint, Map<String, Object> values, float size, boolean title) {
        Typeface source = title ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT;
        if (values == null || !InstalledTweaks.has("typography")) { paint.setTextSize(size); paint.setTypeface(source); return; }
        int mode = bounded(values, "fontMode", 32), weight = bounded(values, "fontWeightMode", 9);
        int style = bounded(values, "fontStyleMode", 2), sizeMode = bounded(values, "fontSizeMode", 5);
        paint.setTextSize(size * new float[]{1, .9f, 1, 1.1f, 1.2f, 1.3f}[sizeMode]);
        paint.setTypeface(styledFont(source, mode, weight, style));
    }
    private static int bounded(Map<String, Object> values, String key, int max) {
        Object value = values.get(key);
        return value instanceof Number ? Math.max(0, Math.min(max, ((Number) value).intValue())) : 0;
    }
    private static Typeface styledFont(Typeface source, int mode, int weightMode, int style) {
        if (mode == 0 && weightMode == 0 && style == 0) return source;
        Typeface original = source == null ? Typeface.DEFAULT : source;
        int weight = Math.max(100, Math.min(900, original.getWeight() + (weightMode == 0 ? 0 : weightMode * 100 - 400)));
        return font(mode, original, weight, style == 0 ? original.isItalic() : style == 2);
    }
    private static Typeface font(int mode, Typeface original, int weight, boolean italic) {
        String key = mode + ":" + weight + ":" + italic + ":" + (mode == 0 ? original.hashCode() : 0);
        Typeface cached = FONTS.get(key); if (cached != null) return cached;
        String file = null;
        switch (mode) {
            case 22: file = weight < 400 ? (italic ? "calibrili.ttf" : "calibril.ttf") : weight >= 600 ? (italic ? "calibriz.ttf" : "calibrib.ttf") : (italic ? "calibrii.ttf" : "calibri.ttf"); break;
            case 23: file = "Michroma-Regular.ttf"; break;
            case 24: file = "prestige.ttf"; break;
            case 25: file = "ScienceGothic-VariableFont_CTRS,slnt,wdth,wght.ttf"; break;
            case 26: file = "ScienceGothic_SemiCondensed-" + (weight <= 200 ? "Thin" : weight < 500 ? "Regular" : weight < 700 ? "Medium" : weight < 900 ? "ExtraBold" : "Black") + ".ttf"; break;
            case 27: file = "ScienceGothic_SemiExpanded-" + (weight <= 200 ? "ExtraLight" : weight < 600 ? "Light" : "Black") + ".ttf"; break;
            case 28: file = "SairaExtraCondensed-" + (weight < 600 ? "Regular" : weight < 700 ? "SemiBold" : weight < 800 ? "Bold" : weight < 900 ? "ExtraBold" : "Black") + ".ttf"; break;
            case 29: file = "ShareTechMono-Regular.ttf"; break;
            case 30: file = italic ? "SofiaSansExtraCondensed-Italic-VariableFont_wght.ttf" : "SofiaSansExtraCondensed-VariableFont_wght.ttf"; break;
            case 31: file = "TextMeOne-Regular.ttf"; break;
            case 32: file = italic ? "VoxRoundWide-LightIt.ttf" : weight >= 600 ? "VoxRoundWide-Semibold.ttf" : "VoxRoundWide.ttf"; break;
        }
        Typeface base = original;
        if (file != null && Afterglow.context() != null) {
            try {
                Typeface.Builder builder = new Typeface.Builder(Afterglow.context().getAssets(), "afterglow/fonts/" + file).setWeight(weight).setItalic(italic);
                if (mode == 25) builder.setFontVariationSettings("'wght' " + weight + ", 'slnt' " + (italic ? -10 : 0));
                else if (mode == 30) builder.setFontVariationSettings("'wght' " + weight);
                base = builder.build();
            } catch (RuntimeException error) { Afterglow.error("Typography.font", error); }
        } else if (mode != 0) {
            // Native system counterparts for iOS system faces; bundled families above are exact.
            String family = mode == 4 || (mode >= 5 && mode <= 7) ? "monospace"
                    : mode == 3 || (mode >= 11 && mode <= 17) ? "serif"
                    : mode == 20 || mode == 21 ? "casual" : "sans-serif";
            base = Typeface.create(family, Typeface.NORMAL);
        }
        Typeface result = Typeface.create(base, weight, italic);
        FONTS.put(key, result);
        return result;
    }
}
