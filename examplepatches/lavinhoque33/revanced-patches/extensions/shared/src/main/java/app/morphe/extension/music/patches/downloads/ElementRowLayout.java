/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

/**
 * Where the check goes in the row of a numbered track list (an album page). Those rows are Litho views whose text is
 * drawn, not made of views, so the check is placed by the two cells that are views: the cell of the track number
 * (which names the track) and the cell of the three-dot action menu at the end of the row, which the check sits
 * next to, on its start side, centered vertically in the row. Pure arithmetic in pixels and the screen density, so
 * it can be tested without Android.
 */
final class ElementRowLayout {
    static final float CHECK_DP = 16;
    /** The room between the check and the menu cell. */
    static final float CHECK_GAP_DP = 4;

    private static final float MIN_ROW_DP = 56;
    private static final float MAX_ROW_DP = 80;
    private static final float MIN_CELL_DP = 28;
    private static final float MAX_CELL_DP = 40;
    private static final float MAX_CELL_START_DP = 24;
    private static final float MIN_MENU_DP = 28;
    private static final float MAX_MENU_DP = 48;
    private static final float MAX_MENU_END_DP = 24;

    private ElementRowLayout() {}

    /**
     * Whether a view is as big as a track row: as wide as a list and 56 to 80 dp high (a track row is 64 dp). The
     * 48 dp action bar of the album header, whose buttons are as narrow as the number cell, is not.
     */
    static boolean isTrackRow(int rowWidth, int rowHeight, float density) {
        return rowWidth >= 280 * density && rowHeight >= MIN_ROW_DP * density && rowHeight <= MAX_ROW_DP * density;
    }

    /**
     * Whether a view of a row is the cell of the track number: narrow, tall, at the start of the row, in a row of the
     * height of a track row. A thumbnail (wider) or a button at the end (far from the start) is not.
     *
     * @param cellLeft Distance of the view from the start of the row.
     */
    static boolean isNumberCell(int cellLeft, int cellWidth, int cellHeight, int rowWidth, int rowHeight,
                                float density) {
        return isTrackRow(rowWidth, rowHeight, density)
                && cellWidth >= MIN_CELL_DP * density && cellWidth <= MAX_CELL_DP * density
                && cellHeight >= rowHeight / 2 && cellLeft >= 0 && cellLeft <= MAX_CELL_START_DP * density;
    }

    /**
     * Whether a view of a row is the cell of the action menu: narrow, tall and at the end of the row.
     *
     * @param cellEnd Distance of the end edge of the view from the end of the row.
     */
    static boolean isMenuCell(int cellEnd, int cellWidth, int cellHeight, int rowWidth, int rowHeight,
                              float density) {
        return isTrackRow(rowWidth, rowHeight, density)
                && cellWidth >= MIN_MENU_DP * density && cellWidth <= MAX_MENU_DP * density
                && cellHeight >= rowHeight / 2 && cellEnd >= 0 && cellEnd <= MAX_MENU_END_DP * density;
    }

    /**
     * The left of the check: on the start side of the menu cell, so right to its left in a left-to-right row and
     * right to its right in a right-to-left row.
     */
    static int checkLeft(int menuLeft, int menuWidth, boolean rightToLeft, float density) {
        int gap = Math.round(CHECK_GAP_DP * density);
        int size = Math.round(CHECK_DP * density);
        return rightToLeft ? menuLeft + menuWidth + gap : menuLeft - gap - size;
    }

    /** The top of the check: centered vertically in the row. */
    static int checkTop(int rowHeight, float density) {
        return (rowHeight - Math.round(CHECK_DP * density)) / 2;
    }
}
