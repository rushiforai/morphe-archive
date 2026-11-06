package app.morphe.extension.music.patches.components;

import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.patches.components.Filter;
import app.morphe.extension.shared.patches.components.StringFilterGroup;

@SuppressWarnings("unused")
public final class LayoutComponentsFilter extends Filter {
    // modified by lavinhoque33, 2026-10-16: podcast episode Download button ported from Morphe.
    private static final String LIST_ITEM_EXTRA_DETAILS_PATH = "music_list_item_extra_details.";

    private final StringFilterGroup podcastEpisodeDownloadButton;

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

    @Override
    public boolean isFiltered(String path, String identifier, String allValue, byte[] buffer,
                              StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        if (matchedGroup == podcastEpisodeDownloadButton) {
            return path.contains(LIST_ITEM_EXTRA_DETAILS_PATH);
        }

        return true;
    }
}
