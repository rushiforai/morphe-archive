/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */

package app.morphe.extension.youtube.patches.feed;

import androidx.annotation.Nullable;

/**
 * Measurements and label checks of {@link FeedCardLayoutPatch} that need no views, so they can be tested
 * without Android.
 */
final class FeedCardMetrics {
    private FeedCardMetrics() {
    }

    /**
     * @return The pixels of the dp, rounded like the layout of the app does.
     */
    static int toPixels(float dp, float density) {
        return Math.round(dp * density);
    }

    /**
     * The padding of a card, around the view with the label of the card, gives the density that the app used to
     * lay out the cards: it is 12 dp on the left and 6 dp on the top, which is checked with the ratio of the
     * two, so a view that is not a card is not taken for one.
     *
     * @param left                The left edge of the view of the card, in the item.
     * @param top                 The top edge of the view of the card, in the item.
     * @param horizontalPaddingDp The padding of the cards on the sides, in dp.
     * @param verticalPaddingDp   The padding of the cards above and below, in dp.
     * @return The density that the app used to lay out the card, or 0 if the view is not placed like a card.
     */
    static float measureDensity(int left, int top, int horizontalPaddingDp, int verticalPaddingDp) {
        if (left <= 0 || Math.abs(top * horizontalPaddingDp - left * verticalPaddingDp) > horizontalPaddingDp) {
            return 0;
        }
        return (float) left / horizontalPaddingDp;
    }

    /**
     * A column of a row of cards is at most half as wide as the row, while the card of a list item that is one
     * card is only narrower than the item by its padding, which doesn't follow the density of the display
     * until the list is laid out again.
     */
    static boolean isColumnWidth(int columnWidth, int rowWidth) {
        return columnWidth > 0 && 2 * columnWidth <= rowWidth;
    }

    /**
     * @return Whether a view starts at the top left of a card inside the padding of the card, with the width
     *         of the card. The padding is laid out from dp with rounding, so the match has a tolerance.
     */
    static boolean isOverCardThumbnail(int viewLeft, int viewTop, int viewWidth, int itemLeft, int itemTop,
                                       int itemWidth, int horizontalPadding, int verticalPadding, int tolerance) {
        return Math.abs(viewLeft - itemLeft - horizontalPadding) <= tolerance
                && Math.abs(viewTop - itemTop - verticalPadding) <= tolerance
                && Math.abs(viewWidth - itemWidth + 2 * horizontalPadding) <= tolerance;
    }

    /**
     * @return Whether the label ends with the marker, which the converted elements add to their label.
     */
    static boolean endsWith(@Nullable CharSequence text, char marker) {
        return text != null && text.length() > 0 && text.charAt(text.length() - 1) == marker;
    }

    /**
     * @return Whether the label of a card has the marker of the cards without inline playback just before
     *         the marker of the cards.
     */
    static boolean hasMarkerBeforeLast(@Nullable CharSequence text, char marker) {
        return text != null && text.length() > 1 && text.charAt(text.length() - 2) == marker;
    }
}
