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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class FeedCardFillTest {
    private static final int ITEM_WIDTH = 1080;
    private static final int HORIZONTAL_PADDING = 30;
    private static final int VERTICAL_PADDING = 15;

    @Test
    public void videoZoneUsesTheThumbnailViewWhenItIsUsable() {
        assertEquals(589, FeedCardFill.getVideoZoneBottom(589, ITEM_WIDTH, HORIZONTAL_PADDING, VERTICAL_PADDING));
        // The thumbnail of a card that is not 16:9 keeps its own bottom.
        assertEquals(700, FeedCardFill.getVideoZoneBottom(700, ITEM_WIDTH, HORIZONTAL_PADDING, VERTICAL_PADDING));
    }

    @Test
    public void videoZoneIsTheSixteenByNineBoxWithoutAThumbnailView() {
        // 1020 px wide card: 573.75 px of video below the 15 px of padding, rounded up to cover the last row.
        assertEquals(589, FeedCardFill.getVideoZoneBottom(-1, ITEM_WIDTH, HORIZONTAL_PADDING, VERTICAL_PADDING));
        assertEquals(589, FeedCardFill.getVideoZoneBottom(0, ITEM_WIDTH, HORIZONTAL_PADDING, VERTICAL_PADDING));
        // A view that is as high as the padding has no content.
        assertEquals(589, FeedCardFill.getVideoZoneBottom(VERTICAL_PADDING, ITEM_WIDTH, HORIZONTAL_PADDING,
                VERTICAL_PADDING));
    }

    @Test
    public void videoZoneRoundsUpAndNeverCoversTheLastRowOfTheVideo() {
        // 16:9 of 1000 is 562.5.
        assertEquals(10 + 563, FeedCardFill.getVideoZoneBottom(-1, 1000 + 2 * 20, 20, 10));
        // Exact division is not rounded up.
        assertEquals(10 + 576, FeedCardFill.getVideoZoneBottom(-1, 1024 + 2 * 20, 20, 10));
    }

    @Test
    public void videoZoneOfAnItemNarrowerThanItsPaddingIsOnlyThePadding() {
        assertEquals(VERTICAL_PADDING, FeedCardFill.getVideoZoneBottom(-1, 40, HORIZONTAL_PADDING, VERTICAL_PADDING));
    }

    @Test
    public void fillStartsAtTheVideoZoneBottom() {
        assertEquals(589, FeedCardFill.getFillTop(15, 779, 589));
    }

    @Test
    public void fillKeepsItsOwnTopWhenThereIsNoVideoZoneAboveIt() {
        assertEquals(15, FeedCardFill.getFillTop(15, 779, 0));
        assertEquals(15, FeedCardFill.getFillTop(15, 779, 15));
    }

    @Test
    public void fillIsEmptyWhenTheVideoZoneReachesItsBottom() {
        assertEquals(779, FeedCardFill.getFillTop(15, 779, 779));
        assertEquals(779, FeedCardFill.getFillTop(15, 779, 2000));
    }

    @Test
    public void cardWithoutTheLabelIsACardOnlyWhenMarked() {
        assertTrue(FeedCardFill.isMarkedCardItem(true, false));
        assertFalse(FeedCardFill.isMarkedCardItem(false, false));
    }

    @Test
    public void rowOfShortsIsNeverACardEvenWithAStaleMark() {
        assertFalse(FeedCardFill.isMarkedCardItem(true, true));
        assertFalse(FeedCardFill.isMarkedCardItem(false, true));
    }

    @Test
    public void rowFilterOfARowOfTheCardIsKept() {
        assertFalse(FeedCardFill.isRowFilterStale(true, true, true, 1020, 96));
    }

    @Test
    public void rowFilterIsRemovedWhenTheViewIsGone() {
        assertTrue(FeedCardFill.isRowFilterStale(false, false, false, 0, 96));
    }

    @Test
    public void rowFilterIsRemovedWhenTheViewShowsAnotherDrawable() {
        assertTrue(FeedCardFill.isRowFilterStale(true, false, true, 1020, 96));
    }

    @Test
    public void rowFilterIsRemovedWhenTheViewIsNotInACardOfTheList() {
        assertTrue(FeedCardFill.isRowFilterStale(true, true, false, 1020, 96));
    }

    @Test
    public void rowFilterIsRemovedFromAViewThatBecameAnIcon() {
        // The mounted views of the row are reused as the 40 px icons of the buttons.
        assertTrue(FeedCardFill.isRowFilterStale(true, true, true, 40, 96));
        assertFalse(FeedCardFill.isRowFilterStale(true, true, true, 96, 96));
    }
}
