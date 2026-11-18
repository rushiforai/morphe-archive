/*
 * YTAfterglow for Android.
 *
 * The accessibility ids are the iOS tweak's; the action bar identifier and the
 * share, save and remix icon names are the ones the video action buttons filter
 * of Morphe patches v2.2.0 (https://github.com/MorpheApp/morphe-patches, GPLv3)
 * uses for YouTube 21.43.523. Not an official Morphe file.
 */

package app.afterglow.extension.litho.filters;

import app.afterglow.extension.litho.LithoComponent;
import app.afterglow.extension.litho.LithoFilter;
import app.afterglow.extension.litho.StringFilterGroup;
import app.afterglow.extension.litho.StringFilterGroupList;

/**
 * The buttons under the video on the watch page, for the iOS settings
 * {@code noPlayerDownloadButton}, {@code noPlayerShareButton},
 * {@code noPlayerSaveButton}, {@code noPlayerRemixButton} and
 * {@code noPlayerClipButton}. Each hides one button.
 *
 * <p>iOS looks inside the scrollable action bar for each button's
 * accessibility id ({@code id.video.share.button}, {@code id.video.add_to.button},
 * {@code id.video.remix.button}, {@code id.ui.add_to.offline.button}) or, for
 * Clip, its {@code clip_button.eml} component, and falls back to the English
 * label. The same ids come from YouTube's server here and work in every language.
 * Current action models share sibling icons, so icon bytes cannot identify a button.
 */
public final class PlayerActionButtonsFilter extends LithoFilter {
    private final StringFilterGroup actionBar;
    private final StringFilterGroup quickActions;
    private final StringFilterGroupList quickButtonsById = new StringFilterGroupList();
    private final StringFilterGroupList buttonsById = new StringFilterGroupList();
    private final StringFilterGroup clipButton;

    public PlayerActionButtonsFilter() {
        // Every component of the action bar element has the bar's identifier.
        actionBar = StringFilterGroup.anyOf(
                new String[] {"noPlayerDownloadButton", "noPlayerShareButton", "noPlayerSaveButton",
                        "noPlayerRemixButton", "noPlayerClipButton"},
                "video_action_bar.e"
        );
        // Confirmed in 21.43.523 runtime: the fullscreen bar has a separate identifier,
        // but uses the same native Share and Save accessibility ids and icon models.
        // Only these two iOS preferences also govern the on-video action controls.
        quickActions = StringFilterGroup.anyOf(
                new String[] {"noPlayerShareButton", "noPlayerSaveButton"}, "quick_actions.e");
        quickButtonsById.addAll(
                new StringFilterGroup("noPlayerShareButton", "id.video.share.button"),
                new StringFilterGroup("noPlayerSaveButton", "id.video.add_to.button")
        );

        buttonsById.addAll(
                new StringFilterGroup("noPlayerDownloadButton", "id.ui.add_to.offline.button"),
                new StringFilterGroup("noPlayerShareButton", "id.video.share.button"),
                new StringFilterGroup("noPlayerSaveButton", "id.video.add_to.button"),
                new StringFilterGroup("noPlayerRemixButton", "id.video.remix.button")
        );

        clipButton = new StringFilterGroup("noPlayerClipButton", "clip_button.e");

        addIdentifierCallbacks(actionBar, quickActions);
    }

    @Override
    public boolean isFiltered(LithoComponent component, StringFilterGroup matchedGroup,
                              MatchType matchType, int matchIndex) {
        // Never the bar itself, only the components inside it.
        if (component.pathIndexOf(".e", component.identifier().length()) < 0) return false;

        // The "more" button lists the actions that did not fit, with their icons: never it.
        String name = component.componentName();
        if (component.pathContains("|overflow_menu_button.")) return false;

        if (matchedGroup == quickActions) {
            // These buttons share a model containing every action's icon. The native
            // accessibility id identifies this button; icon bytes would hide its siblings.
            return quickButtonsById.matches(component.accessibility());
        }

        if (buttonsById.matches(component.accessibility())) return true;
        if (clipButton.matches(name)) return true;

        // Leave unidentified buttons intact. Their shared model can contain Share/Save
        // icons even when this component belongs to Like or another unrelated action.
        return false;
    }
}
