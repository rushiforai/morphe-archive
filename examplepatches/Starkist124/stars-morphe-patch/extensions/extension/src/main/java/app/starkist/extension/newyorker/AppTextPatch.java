package app.starkist.extension.newyorker;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.os.Build;
import android.util.Log;

import app.starkist.extension.settings.StarSettings;

/**
 * Applies the Star settings font and text size to the app's native (non-article) screens.
 */
@SuppressWarnings("unused")
public final class AppTextPatch {

    private static final String TAG = "StarSettings";

    /**
     * Injected into the app's base activity, which forces fontScale to 1.0
     * just before applying its configuration. Replaces it with the chosen size.
     */
    public static void applyTextScale(Context context, Configuration configuration) {
        try {
            if (context == null || configuration == null) return;
            configuration.fontScale = StarSettings.getTextZoom(context) / 100f;
        } catch (Exception e) {
            Log.e(TAG, "Could not apply text size", e);
        }
    }

    /**
     * Injected into ResourcesCompat right after a font file is loaded. Every font the app
     * uses comes through here, both for its older screens and its Compose screens.
     *
     * @return The chosen font with the original's weight and style, or the original font.
     */
    public static Typeface overrideTypeface(Context context, Typeface original) {
        try {
            if (context == null || original == null) return original;
            Typeface replacement = StarSettings.getTypeface(context);
            if (replacement == null) return original;

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                return Typeface.create(replacement, original.getWeight(), original.isItalic());
            }
            int style = (original.isBold() ? Typeface.BOLD : 0) | (original.isItalic() ? Typeface.ITALIC : 0);
            return Typeface.create(replacement, style);
        } catch (Exception e) {
            Log.e(TAG, "Could not replace font", e);
            return original;
        }
    }
}
