package app.kyt.extension.rym;

/**
 * Creates TIDAL objects and returns TIDAL resource ids.
 * <p>
 * The methods of this class are replaced by the patch, because they use obfuscated TIDAL
 * classes and resource ids that change with every app version.
 * <p>
 * They are kept in their own class on purpose: if a replaced method fails bytecode verification,
 * Android rejects this whole class. Callers then get the error inside their try/catch,
 * instead of the error breaking the class with the injection points called by TIDAL.
 */
final class TidalObjects {

    /**
     * @return A TIDAL menu item title object with a raw text.
     */
    static Object createTitle(String text) {
        return null;
    }

    /**
     * @return A TIDAL ContentMetadata object, used by TIDAL for event tracking.
     */
    static Object createContentMetadata(String contentType, String contentId) {
        return null;
    }

    /**
     * @return The drawable resource id of the menu item icon.
     */
    static int getIconResId() {
        return 0;
    }

    /**
     * @return The color resource id the TIDAL menu items use.
     */
    static int getColorResId() {
        return 0;
    }
}
