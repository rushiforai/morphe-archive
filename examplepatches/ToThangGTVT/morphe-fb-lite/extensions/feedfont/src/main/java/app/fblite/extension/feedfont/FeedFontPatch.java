package app.fblite.extension.feedfont;

import android.content.Context;

/**
 * Facebook Lite draws feed text with glyph outlines the server sends (a Roboto lookalike), rasterized
 * by X.0eF in the secondary dex. This extension ships a class with the same name that draws the glyphs
 * with the system font instead, see X.$0eF (renamed to X.0eF at build time).
 */
@SuppressWarnings("unused")
public final class FeedFontPatch {

    /**
     * Called at the start of attachBaseContext, before the secondary dex is unpacked.
     *
     * The app's class loader (X.09K) searches its dex files most recently used first, so once the
     * secondary dex has served a class it is searched before the APK dex and the original X.0eF wins.
     * Loading the class now, while only the APK dex exists, defines the replacement in the
     * PathClassLoader, and later lookups reuse it.
     */
    public static void loadRasterizer(Context context) {
        try {
            OriginalRasterizer.dataDir = context.getApplicationInfo().dataDir;
            Class.forName("X.0eF", false, FeedFontPatch.class.getClassLoader());
        } catch (Throwable ignored) {
            // The app keeps its own rasterizer.
        }
    }
}
