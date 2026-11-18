/*
 * YTAfterglow for Android.
 *
 * The like, comment, share and remix component names below are the ones the
 * Shorts filter of Morphe patches v2.2.0
 * (https://github.com/MorpheApp/morphe-patches, GPLv3) matches for YouTube
 * 21.43.523; the dislike names follow the same scheme and the iOS evidence
 * ("dislikebutton", "reeldislike"). Not an official Morphe file.
 */

package app.afterglow.extension.litho.filters;

import app.afterglow.extension.litho.LithoComponent;
import app.afterglow.extension.litho.LithoFilter;
import app.afterglow.extension.litho.StringFilterGroup;
import app.afterglow.extension.litho.StringFilterGroupList;

/**
 * The buttons of the Shorts action bar, for the iOS settings
 * {@code hideShortsLike}, {@code hideShortsDislike}, {@code hideShortsComments},
 * {@code hideShortsShare} and {@code hideShortsRemix} ("No Like button" and so
 * on). Each hides one button, as on iOS, where each is its own role in
 * {@code YTAGShortsElementPolicyCore.h}.
 *
 * <p>It shows both ways a button is found:
 * <ul>
 *   <li>Like and dislike are their own components, so their names in the path are enough.</li>
 *   <li>Comments, share and remix are all the same {@code button} component in
 *       the action bar; only their accessibility id tells them apart.</li>
 * </ul>
 *
 * <p>The names come from YouTube's server-sent Litho templates, not from the
 * app, so they cannot be checked against the APK; to confirm them on a device,
 * enable the {@code YTAGLitho} log (see {@code LithoFilterPatch}).
 */
public final class ShortsActionBarFilter extends LithoFilter {
    private final StringFilterGroup actionBar;
    private final StringFilterGroup actionBarButton;
    private final StringFilterGroupList actionBarButtonsById = new StringFilterGroupList();

    public ShortsActionBarFilter() {
        StringFilterGroup likeButton = new StringFilterGroup(
                "hideShortsLike",
                "shorts_like_button.e",
                "reel_like_button.e",
                "reel_like_toggled_button.e"
        );

        // iOS: "dislikebutton", "reeldislike", "shortsdislike" (YTAGShortsElementPolicyCore.h).
        StringFilterGroup dislikeButton = new StringFilterGroup(
                "hideShortsDislike",
                "shorts_dislike_button.e",
                "reel_dislike_button.e",
                "reel_dislike_toggled_button.e"
        );

        // Called for everything in the action bar while any of its button settings is on.
        actionBar = StringFilterGroup.anyOf(
                new String[] {"hideShortsLike", "hideShortsDislike", "hideShortsComments", "hideShortsShare",
                        "hideShortsRemix"},
                "shorts_action_bar.e",
                "reel_action_bar.e"
        );

        // Any of button.eml, shorts_video_action_button.eml or reel_action_button.eml.
        actionBarButton = StringFilterGroup.always("button.e");

        // Buttons that are a generic button component are told apart by their accessibility id.
        // Like and dislike also have their own components above; the ids cover builds that send
        // them as generic buttons, as iOS also matches them by accessibility id.
        actionBarButtonsById.addAll(
                new StringFilterGroup("hideShortsLike", "id.reel_like_button"),
                new StringFilterGroup("hideShortsDislike", "id.reel_dislike_button"),
                new StringFilterGroup("hideShortsComments", "id.reel_comment_button"),
                new StringFilterGroup("hideShortsShare", "id.reel_share_button"),
                new StringFilterGroup("hideShortsRemix", "id.reel_remix_button")
        );

        addPathCallbacks(likeButton, dislikeButton, actionBar);
    }

    @Override
    public boolean isFiltered(LithoComponent component, StringFilterGroup matchedGroup,
                              MatchType matchType, int matchIndex) {
        if (matchedGroup == actionBar) {
            // Only a button whose accessibility id is switched off, never the bar itself.
            return actionBarButton.matches(component.path())
                    && actionBarButtonsById.matches(component.accessibility());
        }
        return true; // likeButton, dislikeButton
    }
}
