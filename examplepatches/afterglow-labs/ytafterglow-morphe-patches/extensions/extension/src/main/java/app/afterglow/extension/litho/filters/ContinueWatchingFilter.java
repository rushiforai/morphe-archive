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
 * The Continue watching surface, for the iOS setting {@code noContinueWatching}
 * (tweak "watch-page"): elements whose names or shelf data carry the markers
 * iOS's ytagCellLooksLikeContinueWatching looks for.
 */
public final class ContinueWatchingFilter extends LithoFilter {
    private static final String[] MARKERS = {
            "continue_watching", "resume_watching", "watching_history", "watch_history", "resume_history"
    };

    private final StringFilterGroup shelf;
    private final ByteArrayFilterGroup shelfData = new ByteArrayFilterGroup("noContinueWatching", MARKERS);

    public ContinueWatchingFilter() {
        StringFilterGroup element = new StringFilterGroup("noContinueWatching", MARKERS);
        shelf = new StringFilterGroup("noContinueWatching", "horizontal_shelf.e", "mixed_content_shelf.e");
        addPathCallbacks(element, shelf);
    }

    @Override
    public boolean isFiltered(LithoComponent component, StringFilterGroup matchedGroup,
                              MatchType matchType, int matchIndex) {
        if (matchedGroup == shelf) {
            // A shelf element whose data names it continue watching or watch history.
            return matchIndex == 0 && shelfData.matches(component);
        }
        return true;
    }
}
