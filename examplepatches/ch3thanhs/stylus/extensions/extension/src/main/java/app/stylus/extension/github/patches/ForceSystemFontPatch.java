package app.stylus.extension.github.patches;

import android.content.Context;
import android.graphics.Typeface;
import android.util.TypedValue;

@SuppressWarnings("unused")
public final class ForceSystemFontPatch {

    private ForceSystemFontPatch() {
    }

    public static Typeface getSystemTypeface(Context context, int resourceId, int style) {
        if (context == null) {
            return null;
        }

        String path = resolveResourcePath(context, resourceId);
        if (path == null || !path.startsWith("res/font/")) {
            return null;
        }

        String lowerCasePath = path.toLowerCase();
        if (lowerCasePath.contains("roboto_mono")) {
            return null;
        }

        if (lowerCasePath.contains("inter") || lowerCasePath.contains("monasans")) {
            return Typeface.create(Typeface.DEFAULT, style);
        }

        return null;
    }

    public static Typeface getSystemTypefaceWithUiMonospace(Context context, int resourceId, int style) {
        if (context == null) {
            return null;
        }

        String path = resolveResourcePath(context, resourceId);
        if (path == null || !path.startsWith("res/font/")) {
            return null;
        }

        String lowerCasePath = path.toLowerCase();
        if (lowerCasePath.contains("roboto_mono")) {
            return Typeface.create(Typeface.DEFAULT, style);
        }

        if (lowerCasePath.contains("inter") || lowerCasePath.contains("monasans")) {
            return Typeface.create(Typeface.DEFAULT, style);
        }

        return null;
    }

    private static String resolveResourcePath(Context context, int resourceId) {
        try {
            TypedValue typedValue = new TypedValue();
            context.getResources().getValue(resourceId, typedValue, true);
            CharSequence value = typedValue.string;
            return value == null ? null : value.toString();
        } catch (Exception ignored) {
            return null;
        }
    }
}
