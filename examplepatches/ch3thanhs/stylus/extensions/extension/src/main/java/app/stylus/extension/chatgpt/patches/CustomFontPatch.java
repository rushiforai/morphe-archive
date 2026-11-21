package app.stylus.extension.chatgpt.patches;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.widget.TextView;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

@SuppressWarnings("unused")
public final class CustomFontPatch {
    private static final String FONT_DIR = "stylus/chatgpt/";
    private static final String DESIGN_FONT_PATH =
            "composeResources/com.openai.kmp.platform.design.resources/font/";
    private static final Set<Typeface> featureTypefaces = ConcurrentHashMap.newKeySet();
    private static volatile FontConfig uiConfig;
    private static volatile FontConfig monoConfig;

    private CustomFontPatch() {
    }

    public static void initialize(Context context) {
        AssetManager assets = context.getAssets();
        uiConfig = loadFont(assets, "ui-font");
        monoConfig = loadFont(assets, "mono-font");
    }

    private static FontConfig loadFont(AssetManager assets, String name) {
        String path = FONT_DIR + name;
        try (BufferedReader input = new BufferedReader(new InputStreamReader(
                assets.open(path + "-config.txt"), StandardCharsets.UTF_8))) {
            boolean hasWeight = "1".equals(input.readLine());
            boolean hasItalic = "1".equals(input.readLine());
            String features = input.readLine();
            Typeface baseFont = new Typeface.Builder(assets, path).build();
            if (baseFont != null) {
                return new FontConfig(assets, path, baseFont, hasWeight, hasItalic, features);
            }
        } catch (IOException | RuntimeException ignored) {
            // The original font remains available if Android cannot read the replacement.
        }
        return null;
    }

    public static Typeface composeTypeface(String family, int weight, int style) {
        if ("monospace".equals(family)) {
            return customTypeface(monoConfig, weight, style != 0);
        }
        if (family == null || family.equals("sans-serif")) {
            return customTypeface(uiConfig, weight, style != 0);
        }
        return null;
    }

    public static Typeface composeDesignTypeface(String path) {
        if ((DESIGN_FONT_PATH + "openai_sans_medium.ttf").equals(path)
                || (DESIGN_FONT_PATH + "soehne_kraeftig.ttf").equals(path)) {
            return customTypeface(uiConfig, 500, false);
        }
        return null;
    }

    public static Typeface valdiTypeface(String name, String family, float weight, boolean italic) {
        int requestedWeight = Float.isFinite(weight) && weight > 0 ? Math.round(weight) : 400;
        if (isValdiMonospaceFamily(name) || isValdiMonospaceFamily(family)) {
            String alias = name == null ? "" : name.toLowerCase(Locale.ROOT).replace('_', '-');
            boolean italicAlias = alias.endsWith("-italic");
            if (requestedWeight == 400) {
                requestedWeight = monospaceAliasWeight(italicAlias ? alias.substring(0, alias.length() - 7) : alias);
            }
            return customTypeface(monoConfig, requestedWeight, italic || italicAlias);
        }
        if (isValdiSansFamily(name) || isValdiSansFamily(family)) {
            return customTypeface(uiConfig, requestedWeight, italic);
        }
        return null;
    }

    public static Typeface valdiNamedTypeface(String name, int weight, int style) {
        return valdiTypeface(name, null, weight, style == 2);
    }

    public static Typeface monospaceTypeface() {
        Typeface typeface = customTypeface(monoConfig, 400, false);
        return typeface != null ? typeface : Typeface.MONOSPACE;
    }

    private static boolean isValdiMonospaceFamily(String name) {
        if (name == null) {
            return false;
        }
        String family = name.toLowerCase(Locale.ROOT);
        return family.equals("monospace") || family.startsWith("monospace-")
                || family.equals("menlo") || family.startsWith("menlo-") || family.startsWith("menlo_")
                || family.equals("ui-monospace") || family.equals("sfmono-regular");
    }

    private static int monospaceAliasWeight(String name) {
        if (name.endsWith("-semibold")) {
            return 600;
        }
        if (name.endsWith("-bold")) {
            return 700;
        }
        if (name.endsWith("-black")) {
            return 900;
        }
        return name.endsWith("-medium") ? 500 : 400;
    }

    private static boolean isValdiSansFamily(String name) {
        if (name == null) {
            return false;
        }
        switch (name) {
            case "default":
            case "system":
            case "system-ui":
            case "sans-serif":
            case "Roboto":
            case "OpenAI Sans":
            case "body":
            case "title1":
            case "title2":
            case "title3":
                return true;
            default:
                return name.startsWith("system-") || name.startsWith("sans-serif-");
        }
    }

    private static Typeface customTypeface(FontConfig current, int requestedWeight, boolean italic) {
        if (current == null) {
            return null;
        }

        int weight = Math.max(1, Math.min(requestedWeight, 1000));
        int key = weight * 2 + (italic ? 1 : 0);
        return current.fonts.computeIfAbsent(key, unused -> {
            Typeface result;
            try {
                if (current.hasWeight || current.hasItalic) {
                    String axes = current.hasWeight ? "'wght' " + weight : "";
                    if (current.hasItalic) {
                        axes += (axes.isEmpty() ? "" : ", ") + "'ital' " + (italic ? 1 : 0);
                    }
                    result = new Typeface.Builder(current.assets, current.path)
                            .setFontVariationSettings(axes)
                            .setWeight(weight)
                            .setItalic(italic && current.hasItalic)
                            .build();
                    if (result != null && italic && !current.hasItalic) {
                        result = Typeface.create(result, weight, true);
                    }
                } else {
                    result = Typeface.create(current.baseTypeface, weight, italic);
                }
            } catch (RuntimeException ignored) {
                return null;
            }
            if (result != null && current.features != null) {
                featureTypefaces.add(result);
            }
            return result;
        });
    }

    public static Typeface setTypeface(Paint paint, Typeface typeface) {
        boolean hadCustomTypeface = isCustomTypeface(paint.getTypeface());
        Typeface result = paint.setTypeface(typeface);
        FontConfig current = uiConfig;
        if (current != null && current.features != null) {
            boolean hasCustomTypeface = isCustomTypeface(paint.getTypeface());
            if (hadCustomTypeface || hasCustomTypeface) {
                String features = removeCustomFeatures(paint.getFontFeatureSettings(), current.features);
                paint.setFontFeatureSettings(hasCustomTypeface ? mergeFeatures(features, current.features) : features);
            }
        }
        return result;
    }

    public static void setFontFeatureSettings(Paint paint, String original) {
        paint.setFontFeatureSettings(featuresFor(paint.getTypeface(), original));
    }

    public static void setViewFontFeatureSettings(TextView view, String original) {
        view.setFontFeatureSettings(featuresFor(view.getTypeface(), original));
    }

    public static void setViewTypeface(TextView view, Typeface typeface) {
        boolean hadCustomTypeface = isCustomTypeface(view.getTypeface());
        view.setTypeface(typeface);
        FontConfig current = uiConfig;
        if (current != null && current.features != null) {
            boolean hasCustomTypeface = isCustomTypeface(view.getTypeface());
            if (hadCustomTypeface || hasCustomTypeface) {
                String features = removeCustomFeatures(view.getFontFeatureSettings(), current.features);
                view.setFontFeatureSettings(hasCustomTypeface ? mergeFeatures(features, current.features) : features);
            }
        }
    }

    private static String featuresFor(Typeface typeface, String original) {
        FontConfig current = uiConfig;
        if (current == null || current.features == null || !isCustomTypeface(typeface)) {
            return original;
        }
        return mergeFeatures(removeCustomFeatures(original, current.features), current.features);
    }

    private static boolean isCustomTypeface(Typeface typeface) {
        return typeface != null && featureTypefaces.contains(typeface);
    }

    private static String mergeFeatures(String original, String custom) {
        return original == null || original.isEmpty() ? custom : original + ", " + custom;
    }

    private static String removeCustomFeatures(String original, String custom) {
        if (custom.equals(original)) {
            return null;
        }
        String suffix = ", " + custom;
        return original != null && original.endsWith(suffix)
                ? original.substring(0, original.length() - suffix.length()) : original;
    }

    private static final class FontConfig {
        final AssetManager assets;
        final String path;
        final Typeface baseTypeface;
        final boolean hasWeight;
        final boolean hasItalic;
        final String features;
        final ConcurrentMap<Integer, Typeface> fonts = new ConcurrentHashMap<>();

        FontConfig(AssetManager assets, String path, Typeface baseTypeface,
                   boolean hasWeight, boolean hasItalic, String features) {
            this.assets = assets;
            this.path = path;
            this.baseTypeface = baseTypeface;
            this.hasWeight = hasWeight;
            this.hasItalic = hasItalic;
            this.features = features;
        }
    }
}
