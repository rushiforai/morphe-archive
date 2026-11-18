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
 * The sort chips of the comments panel, for the iOS setting
 * {@code commentsHeaderMode} 2 ("Hidden", tweak "comments-header"). iOS removes
 * the comments panel's subheader, finding the panel by {@code comment-item-section}
 * or {@code shorts-comments-panel}; the same ids tell the comments chip row from
 * the history one here.
 */
public final class CommentsHeaderFilter extends LithoFilter {
    private static final int HIDDEN = 2;
    private static final ByteArrayFilterGroup COMMENTS_PANEL = ByteArrayFilterGroup.always(
            "comment-item-section", "shorts-comments-panel", "engagement-panel-comments-section");

    public CommentsHeaderFilter() {
        addPathCallbacks(StringFilterGroup.whenEquals("commentsHeaderMode", HIDDEN, "chip_bar.e"));
    }

    /** True if the component's data names the comments panel. */
    static boolean isCommentsPanel(LithoComponent component) {
        return COMMENTS_PANEL.matches(component);
    }

    @Override
    public boolean isFiltered(LithoComponent component, StringFilterGroup matchedGroup,
                              MatchType matchType, int matchIndex) {
        return matchIndex == 0 && isCommentsPanel(component);
    }
}
