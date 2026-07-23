package app.stylus.extension.bitwarden.patches;

import android.graphics.Typeface;

@SuppressWarnings("unused")
public final class ForceSystemFontPatch {

    private ForceSystemFontPatch() {
    }

    /**
     * Injection point.
     *
     * <p>Returns the system default {@link Typeface} for the given style so the
     * app renders using the device's system font instead of bundled DM Sans/Roboto files.
     *
     * @param style Typeface style (Typeface.NORMAL, BOLD, ITALIC, or BOLD_ITALIC).
     * @return The system default typeface for {@code style}.
     */
    public static Typeface getSystemTypeface(int style) {
        return Typeface.create(Typeface.DEFAULT, style);
    }
}