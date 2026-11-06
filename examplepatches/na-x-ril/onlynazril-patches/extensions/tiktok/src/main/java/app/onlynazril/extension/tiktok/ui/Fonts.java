package app.onlynazril.extension.tiktok.ui;

import android.graphics.Typeface;

import app.onlynazril.extension.tiktok.settings.CustomFontSettings;

/**
 * The face this screen draws with.
 *
 * The screen is built from the extension's own views, so it never passes through the app's font
 * resolvers the patch hooks. It asks for the same face directly instead: the imported font while
 * the switch is on, and the platform's own sans-serif otherwise.
 *
 * One imported file carries one face, so a "bold" line is the file's own face too. The fallback
 * keeps the platform's bold so the screen still reads as intended while no font is imported.
 */
public final class Fonts {
    private Fonts() {}

    /** The face for a line: the imported one while it is on, else the platform's sans-serif. */
    public static Typeface face(boolean bold) {
        Typeface imported = CustomFontSettings.typeface();
        if (imported != null) return imported;
        return Typeface.create("sans-serif", bold ? Typeface.BOLD : Typeface.NORMAL);
    }
}
