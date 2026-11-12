/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

/**
 * The layout decisions behind the check at the end of a classic song row, on ids and rule targets only, so they can
 * be tested without Android. The rows are two layouts (ids of Music 9.40.51, 9.15.51 and 8.30.54 alike):
 * <ul>
 *   <li>{@code music_two_column_item} (lists, playlist pages, Search songs): in the RelativeLayout
 *   {@code two_column_item_content} the text column {@code details_container} is {@code toStartOf}
 *   {@code contributor_avatars_container}, which is {@code toLeftOf} {@code contextual_menu_container}, which is
 *   {@code alignParentEnd};</li>
 *   <li>{@code playlist_panel_video_item} (the player queue): in the RelativeLayout {@code content} a text
 *   LinearLayout without an id is {@code toStartOf} {@code menu_anchor_container} ({@code alignParentEnd}; it holds
 *   the menu, the drag handle and a spacer).</li>
 * </ul>
 * A RelativeLayout resolves {@code toStartOf} into {@code LEFT_OF} (or {@code RIGHT_OF} when right to left) when it
 * is laid out and no longer reports the {@code START_OF} verb, so a rule has to be read from all three verbs.
 */
final class RowEndSlots {
    /** The menu containers of the two layouts, in the order they are looked for. */
    static final String[] MENU_CONTAINERS = {"contextual_menu_container", "menu_anchor_container"};
    static final String CONTRIBUTORS = "contributor_avatars_container";

    private RowEndSlots() {}

    /**
     * The view a child is placed at the start of, as a laid out RelativeLayout reports it: the {@code START_OF}
     * rule, or else the resolved rule of the layout direction ({@code LEFT_OF} left to right, {@code RIGHT_OF}
     * right to left), 0 when it has none.
     */
    static int startOfTarget(int startOf, int leftOf, int rightOf, boolean rightToLeft) {
        if (startOf != 0) return startOf;
        return rightToLeft ? rightOf : leftOf;
    }

    /**
     * Whether a child is the text column of the row: it ends at the avatars or the menu container, and is neither.
     *
     * @param target The id it is placed at the start of, see {@link #startOfTarget}.
     */
    static boolean isTextColumn(int childId, int target, int menuId, int avatarsId) {
        if (target == 0 || childId == menuId || (avatarsId != 0 && childId == avatarsId)) return false;

        return target == menuId || (avatarsId != 0 && target == avatarsId);
    }

    /** The view the check is placed in front of: the avatars when a row has some, else the menu container. */
    static int anchor(int menuId, int avatarsId, boolean hasAvatars) {
        return hasAvatars && avatarsId != 0 ? avatarsId : menuId;
    }
}
