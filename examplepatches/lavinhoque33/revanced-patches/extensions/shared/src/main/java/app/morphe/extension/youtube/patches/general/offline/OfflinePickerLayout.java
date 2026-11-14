/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-11.
 * Written by lavinhoque33, 2026-11-05.
 */
package app.morphe.extension.youtube.patches.general.offline;

final class OfflinePickerLayout {
    private OfflinePickerLayout() {
    }

    static int scrollCap(int screenHeight, int availableHeight, int footerHeight, int padding, int minimum) {
        int remaining = Math.max(0, availableHeight - footerHeight - padding);
        int preferred = Math.max(minimum, (int) (screenHeight * 0.55f));
        return Math.min(preferred, remaining);
    }

    static int playlistOptionsHeight(int availableHeight, int fixedHeight, int optionsHeight, int rowHeight) {
        int remaining = Math.max(0, availableHeight - fixedHeight);
        int reservedRow = Math.min(rowHeight, remaining / 2);
        return Math.min(optionsHeight, remaining - reservedRow);
    }
}
