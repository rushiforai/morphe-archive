package app.fblite.extension;

import android.content.Context;

import java.io.File;

/**
 * Facebook Lite downloads its fonts into getFilesDir() and loads them with
 * Typeface.createFromFile(). When that returns nothing, the app falls back to
 * Typeface.create(name, 0), i.e. the system font.
 *
 * Replacing each font file with a non-empty directory of the same name makes both
 * the download (FileOutputStream) and Typeface.createFromFile() fail.
 */
@SuppressWarnings("unused")
public final class UseSystemFontPatch {

    private static final String[] FONT_FILES = {
            "Optimistic_VF_App_Lite.ttf",
            "optimistic_text_app_regular.ttf",
            "optimistic_text_app_medium.ttf",
            "optimistic_text_app_bold.ttf",
            "optimistic_display_app_medium.ttf",
            "optimistic_display_app_bold.ttf",
            "InstagramSansHeadline-Regular.ttf",
            "InstagramSqueeze-Black.otf",
            "InstagramSignature-Regular.otf",
            "InstagramSerif-Regular.otf",
            "InstagramSans-Regular.ttf",
            "InstagramSansCondensed-Regular.ttf",
            "InstagramPoster-Black.otf",
            "InstagramEditor-Regular.otf",
            "InstagramDeco-Regular.otf",
            "InstagramBubble-Black.otf",
            "HeptaSlab-Medium.ttf",
            "DynaPuff_Condensed-Regular.ttf",
            "Dekko-Regular.ttf",
            "DMMono-Regular.ttf",
            "CourierPrime-Bold.ttf",
            "CosmopolitanScriptRegular.otf",
            "Caprasimo-Regular.ttf",
            "Barlow-SemiBold.ttf",
            "Arapey-Italic.ttf",
            "AlumniSansCollegiateOne-Regular.ttf",
            "emoji_font.ttf",
    };

    public static void blockDownloadedFonts(Context context) {
        try {
            File filesDir = context.getFilesDir();
            for (String name : FONT_FILES) {
                File font = new File(filesDir, name);
                if (font.isDirectory()) continue;
                if (font.exists() && !font.delete()) continue;
                if (font.mkdir()) {
                    // Non-empty so the app cannot simply delete it and download again.
                    new File(font, ".blocked").createNewFile();
                }
            }
        } catch (Throwable ignored) {
            // Never break app startup.
        }
    }
}
