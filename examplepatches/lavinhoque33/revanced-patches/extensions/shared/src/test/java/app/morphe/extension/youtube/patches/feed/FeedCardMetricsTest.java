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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class FeedCardMetricsTest {
    private static final int HORIZONTAL_DP = 12;
    private static final int VERTICAL_DP = 6;
    private static final char CARD = '\u200B';
    private static final char NO_INLINE = '\u2062';

    @Test
    public void dpIsRoundedToThePixelsTheAppLaysOut() {
        assertEquals(36, FeedCardMetrics.toPixels(12, 3f));
        assertEquals(32, FeedCardMetrics.toPixels(12, 2.625f));
        assertEquals(30, FeedCardMetrics.toPixels(11.5f, 2.625f));
        assertEquals(0, FeedCardMetrics.toPixels(0, 3.5f));
    }

    @Test
    public void densityComesFromThePaddingOfTheCard() {
        assertEquals(3f, FeedCardMetrics.measureDensity(36, 18, HORIZONTAL_DP, VERTICAL_DP), 0.001f);
        // The app rounds the top, so 6 dp at 2.625 is 16 px, while 12 dp is 31.5 px, which is laid out as 32.
        assertEquals(32 / 12f, FeedCardMetrics.measureDensity(32, 16, HORIZONTAL_DP, VERTICAL_DP), 0.001f);
    }

    @Test
    public void densityIsUnknownForAViewThatIsNotPlacedLikeACard() {
        assertEquals(0f, FeedCardMetrics.measureDensity(0, 0, HORIZONTAL_DP, VERTICAL_DP), 0f);
        assertEquals(0f, FeedCardMetrics.measureDensity(36, 0, HORIZONTAL_DP, VERTICAL_DP), 0f);
        assertEquals(0f, FeedCardMetrics.measureDensity(36, 36, HORIZONTAL_DP, VERTICAL_DP), 0f);
        assertEquals(0f, FeedCardMetrics.measureDensity(-5, 18, HORIZONTAL_DP, VERTICAL_DP), 0f);
    }

    @Test
    public void columnIsAtMostHalfOfTheRow() {
        assertTrue(FeedCardMetrics.isColumnWidth(540, 1080));
        assertTrue(FeedCardMetrics.isColumnWidth(500, 1080));
        assertFalse(FeedCardMetrics.isColumnWidth(541, 1080));
        // The card of a list item that is one card is narrower than the item only by its padding.
        assertFalse(FeedCardMetrics.isColumnWidth(1080 - 2 * 36, 1080));
        assertFalse(FeedCardMetrics.isColumnWidth(0, 1080));
    }

    @Test
    public void viewOverTheThumbnailIsInsideThePaddingWithTheWidthOfTheCard() {
        // The item is 1080 wide at x 0 and y 200, the card padding is 36 x 18, the inline player has the card width.
        assertTrue(FeedCardMetrics.isOverCardThumbnail(36, 218, 1008, 0, 200, 1080, 36, 18, 6));
        // A pixel or two of rounding is the same card.
        assertTrue(FeedCardMetrics.isOverCardThumbnail(37, 217, 1007, 0, 200, 1080, 36, 18, 6));
    }

    @Test
    public void viewThatKeepsTheSquareFullWidthBoundsIsNotOverTheThumbnail() {
        // Not inset by the padding: it is the video of a card that is not clipped, with square corners.
        assertFalse(FeedCardMetrics.isOverCardThumbnail(0, 200, 1080, 0, 200, 1080, 36, 18, 6));
        // Inset twice, which is the thumbnail of a card whose label is on a nested view.
        assertFalse(FeedCardMetrics.isOverCardThumbnail(72, 236, 936, 0, 200, 1080, 36, 18, 6));
    }

    @Test
    public void viewMustMatchAfterTheDensityOfTheCardsChanges() {
        // The layout of the lists is kept by the app until the lists are laid out again, so the padding that the
        // outline uses has to follow it: a card laid out at 2.0 is inset by 24 x 12, not by the 36 x 18 of 3.0.
        assertTrue(FeedCardMetrics.isOverCardThumbnail(24, 212, 672, 0, 200, 720, 24, 12, 2));
        assertFalse(FeedCardMetrics.isOverCardThumbnail(24, 212, 672, 0, 200, 720, 36, 18, 2));
    }

    @Test
    public void labelMarkerMustBeTheLastCharacter() {
        assertTrue(FeedCardMetrics.endsWith("Title" + CARD, CARD));
        assertFalse(FeedCardMetrics.endsWith("Title" + CARD + "x", CARD));
        assertFalse(FeedCardMetrics.endsWith("", CARD));
        assertFalse(FeedCardMetrics.endsWith(null, CARD));
    }

    @Test
    public void cardWithoutInlinePlaybackHasItsMarkerBeforeTheMarkerOfTheCards() {
        assertTrue(FeedCardMetrics.hasMarkerBeforeLast("Playlist" + NO_INLINE + CARD, NO_INLINE));
        assertFalse(FeedCardMetrics.hasMarkerBeforeLast("Video" + CARD, NO_INLINE));
        assertFalse(FeedCardMetrics.hasMarkerBeforeLast("" + CARD, NO_INLINE));
        assertFalse(FeedCardMetrics.hasMarkerBeforeLast(null, NO_INLINE));
    }
}
