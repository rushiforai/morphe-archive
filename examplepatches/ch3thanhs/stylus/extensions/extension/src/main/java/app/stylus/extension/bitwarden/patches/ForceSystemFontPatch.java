package app.stylus.extension.bitwarden.patches;

import android.content.res.Resources;
import android.graphics.Typeface;

@SuppressWarnings("unused")
public final class ForceSystemFontPatch {

    private static final String UI_FONT_RESOURCE_NAME = "inter_variable";

    private ForceSystemFontPatch() {
    }

    /**
     * Injection point.
     *
     * <p>Returns the system default {@link Typeface} for the bundled UI font.
     * Custom UI and monospace fonts use the app's normal resource loader.
     *
     * @param resources  Resources used to resolve the font resource name.
     * @param resourceId Font resource id that is being loaded.
     * @param style      Typeface style (Typeface.NORMAL, BOLD, ITALIC, or BOLD_ITALIC).
     * @return The system default typeface for {@code style}, or {@code null} to let
     *         the app load its bundled font.
     */
    public static Typeface getSystemTypeface(Resources resources, int resourceId, int style) {
        if (resources == null || hasCustomUiFont()) {
            return null;
        }

        if (UI_FONT_RESOURCE_NAME.equals(resolveResourceName(resources, resourceId))) {
            return Typeface.create(Typeface.DEFAULT, style);
        }

        return null;
    }

    // Custom font changes this at patch time because it keeps Inter's resource ID and name.
    private static boolean hasCustomUiFont() {
        return false;
    }

    private static String resolveResourceName(Resources resources, int resourceId) {
        try {
            return resources.getResourceEntryName(resourceId);
        } catch (Exception ignored) {
            return null;
        }
    }
}
