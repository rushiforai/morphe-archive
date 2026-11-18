/*
 * YTAfterglow for Android.
 *
 * Element names from the Shorts filter of Morphe patches v2.2.0
 * (https://github.com/MorpheApp/morphe-patches, GPLv3), which matches them for
 * YouTube 21.43.523, combined with the iOS tweak's rules. Not an official Morphe file.
 */

package app.afterglow.extension.litho.filters;

import app.afterglow.extension.litho.ByteArrayFilterGroup;
import app.afterglow.extension.litho.LithoComponent;
import app.afterglow.extension.litho.LithoFilter;
import app.afterglow.extension.litho.StringFilterGroup;

/**
 * Shorts shelves and Shorts cards in every feed, for the iOS setting
 * {@code hideShorts} ("Hides Shorts videos from Homepage, Recommended etc.").
 *
 * <p>iOS removes elements named {@code shorts_shelf.eml} or
 * {@code shorts_video_cell.eml}, the {@code eml.shorts-grid} and
 * {@code eml.shorts-shelf} cells and native reel shelves, plus any element
 * whose data holds the string "Shorts" (the shelf title), everywhere except
 * the watch history. It does not look at which tab is shown, so neither does
 * this filter: Home, Subscriptions, search and related videos are all covered.
 */
public final class ShortsFeedFilter extends LithoFilter {
    private final StringFilterGroup shortsElement;
    private final StringFilterGroup shelfHeader;
    /** iOS "6Shorts": the length-prefixed string "Shorts", the title of a Shorts shelf header. */
    private final ByteArrayFilterGroup shortsTitle = ByteArrayFilterGroup.always("\u0006Shorts");
    /** iOS keeps Shorts in the watch history ("history*"); the history page's browse id. */
    private final ByteArrayFilterGroup watchHistory = ByteArrayFilterGroup.always("FEhistory");

    public ShortsFeedFilter() {
        shortsElement = new StringFilterGroup(
                "hideShorts",
                "shorts_shelf",
                "shorts_grid",
                "shorts_video_cell",
                "inline_shorts"
        );

        shelfHeader = new StringFilterGroup("hideShorts", "shelf_header.e");

        addIdentifierCallbacks(shortsElement, shelfHeader);
    }

    @Override
    public boolean isFiltered(LithoComponent component, StringFilterGroup matchedGroup,
                              MatchType matchType, int matchIndex) {
        if (matchedGroup == shelfHeader) {
            // A shelf header is shared by every kind of shelf: only the "Shorts" one.
            if (matchIndex != 0 || !shortsTitle.matches(component)) return false;
        }
        return !watchHistory.matches(component);
    }
}
