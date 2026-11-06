/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-04.
 */

package app.morphe.extension.youtube.patches.feed;

/**
 * Decisions of {@link FeedCardColorSampler} that need no views, so they can be tested without Android.
 */
final class FeedCardFill {
    /**
     * The thumbnail of a card, and the video that plays over it, are 16:9.
     */
    private static final int VIDEO_ASPECT_WIDTH = 16;
    private static final int VIDEO_ASPECT_HEIGHT = 9;

    private FeedCardFill() {
    }

    /**
     * The surface of a card is drawn behind its content, and the inline video of a card is a surface
     * below the window of the app, which is only visible where the window is transparent. So the surface
     * must not paint the zone of the thumbnail, which is where the video plays.
     *
     * @param thumbnailBottom   The bottom of the thumbnail view in the item, or a value that is not larger
     *                          than the vertical padding if the card has no usable thumbnail view, such as
     *                          while the card plays, when the view of the thumbnail can be gone.
     * @param itemWidth         The width of the item of the card.
     * @param horizontalPadding The padding around the card, at its left and at its right.
     * @param verticalPadding   The padding around the card, at its top and at its bottom.
     * @return The bottom of the video zone of the card in the item, which is exact if the thumbnail view is
     *         usable and the 16:9 box of the card otherwise. It is rounded up, so the last row of the video
     *         is never covered.
     */
    static int getVideoZoneBottom(int thumbnailBottom, int itemWidth, int horizontalPadding, int verticalPadding) {
        if (thumbnailBottom > verticalPadding) {
            return thumbnailBottom;
        }

        final int cardWidth = Math.max(0, itemWidth - 2 * horizontalPadding);
        final int videoHeight = (cardWidth * VIDEO_ASPECT_HEIGHT + VIDEO_ASPECT_WIDTH - 1) / VIDEO_ASPECT_WIDTH;
        return verticalPadding + videoHeight;
    }

    /**
     * @param fillTop         The top of the rectangle of the surface.
     * @param fillBottom      The bottom of the rectangle of the surface.
     * @param videoZoneBottom The bottom of the video zone, in the same coordinates.
     * @return The top of the part of the surface that is painted, which is the video zone bottom or the
     *         top of the rectangle. It is the bottom of the rectangle if nothing is painted.
     */
    static int getFillTop(int fillTop, int fillBottom, int videoZoneBottom) {
        return Math.min(fillBottom, Math.max(fillTop, videoZoneBottom));
    }

    /**
     * @param markedAsCard Whether the app told the patch that the item shows a card. The mark is set when the
     *                     item is bound as a card, and it is not cleared when the view is recycled for an
     *                     item that the patch is not told about, such as a row of Shorts.
     * @param shortsRow    Whether the item is a row of a Shorts shelf.
     * @return Whether an item without the label of a converted card is a card, which gets the color and the
     *         surface of a card.
     */
    static boolean isMarkedCardItem(boolean markedAsCard, boolean shortsRow) {
        // The Shorts play inline over their own thumbnail, so a surface of a card would hide the video.
        return markedAsCard && !shortsRow;
    }

    /**
     * @param imageViewAlive  Whether the view that the filter was applied in still exists.
     * @param drawableInView  Whether the view still shows the drawable that has the filter.
     * @param inCard          Whether the view is an image of the metadata of a card that is in the list now.
     * @param viewWidth       The width of the view.
     * @param minimumWidth    The width of the narrowest image of the metadata of a card, which is wider
     *                        than the icons of the buttons that the app mounts in the same views.
     * @return Whether the filter of the image of a row of a card has to be removed from its drawable,
     *         because the drawable or the view are no longer an image of the metadata of a card.
     */
    static boolean isRowFilterStale(boolean imageViewAlive, boolean drawableInView, boolean inCard,
                                    int viewWidth, int minimumWidth) {
        return !imageViewAlive || !drawableInView || !inCard || viewWidth < minimumWidth;
    }
}
