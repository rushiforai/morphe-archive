package app.morphe.extension.youtube.patches.components;

import app.morphe.extension.shared.patches.components.LazyBufferFilter;
import app.morphe.extension.shared.patches.components.StringFilterGroup;
import app.morphe.extension.youtube.patches.video.CustomPlaybackSpeedPatch;
import app.morphe.extension.youtube.settings.Settings;

/**
 * LithoFilter for {@link CustomPlaybackSpeedPatch}.
 */
public final class PlaybackSpeedMenuFilter extends LazyBufferFilter {
    /**
     * Old litho based speed selection menu.
     */
    public static volatile boolean isOldPlaybackSpeedMenuVisible;

    /**
     * 0.05x speed selection menu.
     */
    public static volatile boolean isPlaybackRateSelectorMenuVisible;

    private final StringFilterGroup oldPlaybackMenuGroup;

    public PlaybackSpeedMenuFilter() {
        // 0.05x litho speed menu.
        final StringFilterGroup playbackRateSelectorGroup = new StringFilterGroup(
                Settings.ENABLE_CUSTOM_PLAYBACK_SPEED,
                "playback_rate_selector_menu_sheet."
        );

        // Old litho based speed menu.
        oldPlaybackMenuGroup = new StringFilterGroup(
                Settings.ENABLE_CUSTOM_PLAYBACK_SPEED,
                "playback_speed_sheet_content.");

        addPathCallbacks(playbackRateSelectorGroup, oldPlaybackMenuGroup);
    }

    @Override
    public boolean isFilteredLazy(String path, String identifier, String allValue, Buffer buffer,
                              StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        if (matchedGroup == oldPlaybackMenuGroup) {
            isOldPlaybackSpeedMenuVisible = true;
        } else {
            isPlaybackRateSelectorMenuVisible = true;
        }

        return false;
    }
}
