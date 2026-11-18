package app.morphe.extension.music.patches.components;

import android.text.TextUtils;
import android.view.View;
import android.widget.TextView;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceType;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.patches.components.Filter;
import app.morphe.extension.shared.patches.components.StringFilterGroup;

@SuppressWarnings("unused")
public final class LayoutComponentsFilter extends Filter {
    private static final String LIST_ITEM_EXTRA_DETAILS_PATH = "music_list_item_extra_details.";

    private final StringFilterGroup podcastEpisodeDownloadButton;

    private static int searchEditTextId;

    public LayoutComponentsFilter() {

        final StringFilterGroup buttonShelf = new StringFilterGroup(
                Settings.HIDE_BUTTON_SHELF,
                "entry_point_button_shelf."
        );

        final StringFilterGroup carouselShelf = new StringFilterGroup(
                Settings.HIDE_CAROUSEL_SHELF,
                "music_grid_item_carousel."
        );

        final StringFilterGroup playlistCardShelf = new StringFilterGroup(
                Settings.HIDE_PLAYLIST_CARD_SHELF,
                "music_container_card_shelf."
        );

        final StringFilterGroup sampleShelf = new StringFilterGroup(
                Settings.HIDE_SAMPLE_SHELF,
                "immersive_card_shelf."
        );

        final StringFilterGroup yourDownloadsShelf = new StringFilterGroup(
                Settings.HIDE_YOUR_DOWNLOADS_SHELF,
                "music_downloads_shelf.e"
        );

        addPathCallbacks(yourDownloadsShelf);

        // Download button under the description of a podcast episode in episode lists.
        podcastEpisodeDownloadButton = new StringFilterGroup(
                Settings.HIDE_PODCAST_EPISODE_DOWNLOAD_BUTTON,
                "music_download_button."
        );

        addIdentifierCallbacks(
                buttonShelf,
                carouselShelf,
                playlistCardShelf,
                podcastEpisodeDownloadButton,
                sampleShelf
        );
    }

    /**
     * Only remove suggested-search shelves before typing. If the query cannot be read,
     * leave the response untouched rather than risk hiding typed-query suggestions.
     */
    public static boolean hideYouMayAlsoLikeSection(@Nullable View suggestionsList) {
        if (!Settings.HIDE_YOU_MAY_ALSO_LIKE_SECTION.get() || suggestionsList == null) {
            return false;
        }

        try {
            if (searchEditTextId == 0) {
                searchEditTextId = ResourceUtils.getIdentifier(ResourceType.ID, "search_edit_text");
            }

            View searchEditText = suggestionsList.getRootView().findViewById(searchEditTextId);
            if (searchEditText instanceof TextView textView) {
                return TextUtils.isEmpty(textView.getText());
            }
        } catch (Exception ex) {
            Logger.printException(() -> "hideYouMayAlsoLikeSection failure", ex);
        }

        return false;
    }

    @Override
    public boolean isFiltered(String path, String identifier, String allValue, byte[] buffer,
                              StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        if (matchedGroup == podcastEpisodeDownloadButton) {
            return path.contains(LIST_ITEM_EXTRA_DETAILS_PATH);
        }

        return true;
    }
}
