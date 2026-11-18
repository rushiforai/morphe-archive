/*
 * YTAfterglow for Android.
 *
 * Component names from the layout and comments filters of Morphe patches v2.2.0
 * (https://github.com/MorpheApp/morphe-patches, GPLv3), which match them for
 * YouTube 21.43.523, combined with the iOS tweak's rules. Not an official Morphe file.
 */

package app.afterglow.extension.litho.filters;

import app.afterglow.extension.litho.ByteArrayFilterGroup;
import app.afterglow.extension.litho.LithoComponent;
import app.afterglow.extension.litho.LithoFilter;
import app.afterglow.extension.litho.StringFilterGroup;

/**
 * Chip rows, for the iOS setting {@code noSubbar} (tweak "navigation-bar"). iOS
 * removes every chip row; on Android the Subscriptions, channel page and history
 * chip rows and chip shelves are Litho, while the Home, search and related chip
 * rows are Views.
 */
public final class SubbarFilter extends LithoFilter {
    private final StringFilterGroup historyChipBar;
    private final ByteArrayFilterGroup watchHistoryChips = ByteArrayFilterGroup.always("FEhistory");

    public SubbarFilter() {
        StringFilterGroup chipRows = new StringFilterGroup("noSubbar", "subscriptions_chip_bar", "channels_chip_bar.e");
        StringFilterGroup chipShelf = new StringFilterGroup("noSubbar", "chips_shelf");
        historyChipBar = new StringFilterGroup("noSubbar", "chip_bar.e");
        addPathCallbacks(chipRows, historyChipBar);
        addIdentifierCallbacks(chipShelf);
    }

    @Override
    public boolean isFiltered(LithoComponent component, StringFilterGroup matchedGroup,
                              MatchType matchType, int matchIndex) {
        if (matchedGroup == historyChipBar) {
            // The plain chip row is also the comments sort row: only the history page's.
            return matchIndex == 0 && watchHistoryChips.matches(component)
                    && !CommentsHeaderFilter.isCommentsPanel(component);
        }
        return true;
    }
}
