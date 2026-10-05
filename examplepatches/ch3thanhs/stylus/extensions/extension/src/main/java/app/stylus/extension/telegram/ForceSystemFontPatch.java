package app.stylus.extension.telegram.patches;

import android.graphics.Typeface;

import java.util.Locale;

@SuppressWarnings("unused")
public final class ForceSystemFontPatch {

    private ForceSystemFontPatch() {
    }

    /**
     * Returns a system Typeface for Telegram's bundled font asset path.
     *
     * Returning null is intentionally avoided here because this method is
     * the fast-path injected into Telegram's getTypeface(String).
     */
    public static Typeface getSystemTypeface(String assetPath) {
        if (assetPath == null || assetPath.isEmpty()) {
            return null;
        }

        String path = assetPath.toLowerCase(Locale.ROOT);

        /*
         * Telegram mono/code text.
         *
         * Keep it monospace so code formatting and alignment remain intact.
         */
        if (path.contains("rmono")) {
            return Typeface.create(Typeface.MONOSPACE, Typeface.NORMAL);
        }

        /*
         * Italic variants.
         */
        if (path.contains("italic")) {
            if (path.contains("medium")
                    || path.contains("bold")
                    || path.contains("rextrabold")) {
                return Typeface.create(
                        Typeface.DEFAULT,
                        Typeface.BOLD_ITALIC
                );
            }

            return Typeface.create(
                    Typeface.DEFAULT,
                    Typeface.ITALIC
            );
        }

        /*
         * Telegram extra-bold.
         *
         * Typeface.create(Typeface.DEFAULT, 800, false) is not universally
         * available on Telegram's older Android API range, so BOLD is the
         * portable fallback.
         */
        if (path.contains("rextrabold")) {
            return Typeface.create(
                    Typeface.DEFAULT,
                    Typeface.BOLD
            );
        }

        /*
         * Telegram medium / bold resources.
         *
         * Telegram's getTypeface() itself treats "medium" and "rbold" as
         * bold-weight resources.
         */
        if (path.contains("medium")
                || path.contains("rbold")) {
            return Typeface.create(
                    Typeface.DEFAULT,
                    Typeface.BOLD
            );
        }

        /*
         * All remaining Telegram-specific font assets become the normal
         * Android UI sans-serif face.
         *
         * This includes:
         *   ritalic.ttf
         *   rcondensedbold.ttf
         *   num.otf
         *   mw_bold.ttf
         *   other bundled assets
         *
         * The XML/resource layer handles bundled font references declared
         * directly from resources.
         */
        return Typeface.create(
                Typeface.DEFAULT,
                Typeface.NORMAL
        );
    }
}