/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.music.patches.components;

import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.patches.components.Filter;
import app.morphe.extension.shared.patches.components.StringFilterGroup;

@SuppressWarnings("unused")
public final class SpeedDialShelfFilter extends Filter {
    private static final String ROOT_CELL_SUFFIX = "|CellType|";

    public SpeedDialShelfFilter() {
        addIdentifierCallbacks(new StringFilterGroup(Settings.HIDE_SPEED_DIAL_SHELF, "music_speed_dial_shelf.e"));
    }

    @Override
    public boolean isFiltered(Object contextSource, String identifier, String accessibility, String path, byte[] buffer,
                              StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        // Descendants inherit the shelf identifier. Drop the root cell, not its individual items.
        return contentIndex == 0 && path.length() == identifier.length() + ROOT_CELL_SUFFIX.length()
                && path.startsWith(identifier) && path.endsWith(ROOT_CELL_SUFFIX);
    }
}
