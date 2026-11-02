package app.stylus.extension.bitwarden.patches;

import android.content.res.Resources;
import android.graphics.Typeface;

import java.util.Locale;

@SuppressWarnings("unused")
public final class ForceSystemFontPatch {

    private static final String UI_FONT_RESOURCE_PREFIX = "dm_sans";
    private static final String CUSTOM_UI_FONT_RESOURCE = "custom_ui_font";

    private ForceSystemFontPatch() {
    }

    /**
     * Injection point.
     *
     * <p>Returns the system default {@link Typeface} for the bundled DM Sans UI
     * fonts so the app renders using the device's system font. Monospace fonts
     * (passwords, TOTP codes, recovery codes, ...) are intentionally left
     * untouched, and a user-selected custom UI font always wins.
     *
     * @param resources  Resources used to resolve the font resource name.
     * @param resourceId Font resource id that is being loaded.
     * @param style      Typeface style (Typeface.NORMAL, BOLD, ITALIC, or BOLD_ITALIC).
     * @return The system default typeface for {@code style}, or {@code null} to let
     *         the app load its bundled font.
     */
    public static Typeface getSystemTypeface(Resources resources, int resourceId, int style) {
        if (resources == null) {
            return null;
        }

        String resourceName = resolveResourceName(resources, resourceId);
        if (resourceName == null) {
            return null;
        }

        String lowerCaseName = resourceName.toLowerCase(Locale.ROOT);

        // Monospace text must keep the bundled monospace font so that it stays
        // aligned and readable.
        if (lowerCaseName.contains("mono")) {
            return null;
        }

        // A user-selected custom UI font wins over the system font.
        if (lowerCaseName.contains(CUSTOM_UI_FONT_RESOURCE)) {
            return null;
        }

        if (lowerCaseName.contains(UI_FONT_RESOURCE_PREFIX)) {
            return Typeface.create(Typeface.DEFAULT, style);
        }

        return null;
    }

    private static String resolveResourceName(Resources resources, int resourceId) {
        try {
            return resources.getResourceEntryName(resourceId);
        } catch (Exception ignored) {
            return null;
        }
    }
}
