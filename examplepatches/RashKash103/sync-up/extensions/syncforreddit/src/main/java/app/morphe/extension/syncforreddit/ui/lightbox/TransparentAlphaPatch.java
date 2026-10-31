package app.morphe.extension.syncforreddit.ui.lightbox;

import android.graphics.Bitmap;
import android.graphics.Color;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.syncforreddit.settings.SyncUpSettings;

/**
 * What a picture with transparency in it is drawn as in the lightbox.
 *
 * <p>The zooming view Sync opens a picture in decodes through Skia, and where nothing says
 * otherwise that decoder is built with {@code RGB_565} — a format with no alpha channel at all.
 * Everything transparent therefore arrives opaque, showing whatever was underneath it in the
 * file, which for most pictures saved with a matte is white.
 *
 * <p>Naming a preferred config is the library's own way of settling this, and the decoders read
 * it before falling back, so answering here is enough for every one of them.
 *
 * @noinspection unused
 */
public final class TransparentAlphaPatch {
    private static final String KEEP_ALPHA = "sync_up_lightbox_alpha";

    /** Reported once rather than for every tile a large picture is decoded in. */
    private static boolean said;

    private TransparentAlphaPatch() {}

    public static boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    /**
     * @param original What the view was going to decode as, which is null unless something has
     *                 already asked for a particular format.
     * @return The format to decode a picture in the lightbox as.
     */
    public static Bitmap.Config preferredConfig(Bitmap.Config original) {
        if (!isPatchIncluded()) {
            return original;
        }

        boolean keep = SyncUpSettings.flag(KEEP_ALPHA, true);
        if (!said) {
            said = true;
            SyncUpSettings.report("lightbox", KEEP_ALPHA);
            Logger.printDebug(() -> "lightbox: asked what to decode as, was " + original
                    + ", keep alpha is " + keep);
        }

        if (!keep) {
            return original;
        }
        // Only where nothing else has chosen: a caller that named a format meant it.
        if (original != null && original != Bitmap.Config.RGB_565) {
            Logger.printDebug(() -> "lightbox: leaving the chosen " + original + " alone");
            return original;
        }
        Logger.printDebug(() -> "lightbox: decoding as ARGB_8888 so transparency survives");
        return Bitmap.Config.ARGB_8888;
    }

    /**
     * What the zooming view paints behind each tile of the picture.
     *
     * <p>Decoding with an alpha channel is only half of it: the view fills every tile with a
     * colour first, and the viewer asks for opaque white. Transparency therefore arrived intact
     * and was then painted over, which is why the preview above a post was right while the same
     * picture opened was not.
     *
     * @param original The colour the viewer asked for.
     * @return The colour to paint behind the picture.
     */
    public static int tileBackground(int original) {
        if (!isPatchIncluded() || !SyncUpSettings.flag(KEEP_ALPHA, true)) {
            return original;
        }
        if (original == Color.TRANSPARENT) {
            return original;
        }
        Logger.printDebug(() -> "lightbox: painting nothing behind the tiles rather than "
                + String.format("#%08X", original));
        return Color.TRANSPARENT;
    }
}
