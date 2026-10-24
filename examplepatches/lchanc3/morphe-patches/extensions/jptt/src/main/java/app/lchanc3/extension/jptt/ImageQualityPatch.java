package app.lchanc3.extension.jptt;

import com.davemorrissey.labs.subscaleview.SubsamplingScaleImageView;
import com.facebook.imagepipeline.common.ResizeOptions;

/**
 * Decodes article pictures at the resolution they are shown at.
 *
 * <p>Fresco 3 downsamples network images by default, so that no side is
 * longer than 2048 pixels. That also covers a request without a size, which
 * is how the full size viewer asks for a picture: a 1584x2240 typhoon chart
 * came back at half its size there, and was stretched back up to fill the
 * screen.
 *
 * <p>Fresco also picks the sample size so that a preview may end up a quarter
 * smaller than the view it is drawn into, which is what makes small text in a
 * preview soft.
 */
@SuppressWarnings("unused")
public final class ImageQualityPatch {

    /**
     * Fresco's own cap, which {@link #configureViewer} matches. Any picture
     * with a side at least this long is drawn from tiles instead.
     */
    private static final int FRESCO_MAX_BITMAP_DIMENSION = 2048;

    /**
     * The cap for previews, which are drawn into a view no wider than the
     * screen. Twice Fresco's, so that a long screenshot shown cropped to its
     * top keeps enough of its width; at most 64MB in ARGB_8888.
     */
    private static final float PREVIEW_MAX_BITMAP_DIMENSION = 4096f;

    /** Fresco's default, which the two-argument constructor passes. */
    private static final float ROUND_UP_FRACTION = 2f / 3f;

    private ImageQualityPatch() {
    }

    /**
     * Replaces the {@code new ResizeOptions(width, height)} of a preview.
     *
     * <p>Fresco settles for a bitmap down to 3/4 of the size asked for, so
     * asking for 4/3 of the view gets one at least as large as the view.
     */
    public static ResizeOptions previewResizeOptions(int width, int height) {
        return new ResizeOptions(
                scale(width),
                scale(height),
                PREVIEW_MAX_BITMAP_DIMENSION,
                ROUND_UP_FRACTION
        );
    }

    /**
     * Called on the full size viewer once its decoders are set.
     *
     * <p>The viewer decodes a picture whole through Fresco when it fits in a
     * single tile, and the tile size defaults to what the canvas allows, far
     * above Fresco's cap. Lowering it to the cap sends every picture Fresco
     * would shrink to the region decoder instead, which reads the original
     * bytes and only decodes the part on screen, at the zoom it is shown at.
     */
    public static void configureViewer(SubsamplingScaleImageView view) {
        view.setMaxTileSize(FRESCO_MAX_BITMAP_DIMENSION);
    }

    private static int scale(int size) {
        // ResizeOptions rejects anything below 1, and so did the original.
        return size <= 0 ? size : (int) Math.ceil(size * 4.0 / 3.0);
    }
}
