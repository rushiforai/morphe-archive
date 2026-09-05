package app.template.extension;

import android.content.Context;
import android.graphics.Typeface;

/**
 * Letterboxd ships its own "Graphik" font family ({@code res/font/graphik_app_*}). Text drawn by
 * the extension (the spoiler overlay's label, the tap-to-show-ratings link, the streaming button)
 * falls back to the plain system font unless it explicitly loads that family — which reads as
 * visibly out of place next to the app's own type. Each weight is cached after the first
 * (successful or failed) lookup.
 */
final class AppFont {

    private AppFont() {}

    private static Typeface semibold;
    private static Typeface regular;
    private static boolean triedSemibold;
    private static boolean triedRegular;

    static Typeface semibold(Context context) {
        if (!triedSemibold) {
            triedSemibold = true;
            semibold = load(context, "graphik_app_semibold");
        }
        return semibold != null ? semibold : Typeface.DEFAULT_BOLD;
    }

    /** Matches {@code trailer_button}'s own {@code android:fontFamily}. */
    static Typeface regular(Context context) {
        if (!triedRegular) {
            triedRegular = true;
            regular = load(context, "graphik_app_regular");
        }
        return regular != null ? regular : Typeface.DEFAULT;
    }

    private static Typeface load(Context context, String fontName) {
        try {
            int id = context.getResources().getIdentifier(fontName, "font", context.getPackageName());
            return id == 0 ? null : context.getResources().getFont(id);
        } catch (Throwable ignored) {
            return null;
        }
    }
}
