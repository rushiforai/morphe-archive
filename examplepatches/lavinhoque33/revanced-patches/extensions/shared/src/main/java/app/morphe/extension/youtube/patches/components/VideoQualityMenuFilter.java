package app.morphe.extension.youtube.patches.components;

import app.morphe.extension.shared.patches.components.LazyBufferFilter;
import app.morphe.extension.shared.patches.components.StringFilterGroup;
import app.morphe.extension.youtube.patches.video.AdvancedVideoQualityMenuPatch;
import app.morphe.extension.youtube.settings.Settings;

/**
 * LithoFilter for {@link AdvancedVideoQualityMenuPatch}.
 */
public final class VideoQualityMenuFilter extends LazyBufferFilter {
    // Must be volatile or synchronized, as litho filtering runs off main thread and this field is then access from the main thread.
    public static volatile boolean isVideoQualityMenuVisible;

    public VideoQualityMenuFilter() {
        addPathCallbacks(
                new StringFilterGroup(
                        Settings.ADVANCED_VIDEO_QUALITY_MENU,
                        "quick_quality_sheet_content.e"
                )
        );
    }

    @Override
    public boolean isFilteredLazy(String path, String identifier, String allValue, Buffer buffer,
                              StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        isVideoQualityMenuVisible = true;

        return false;
    }
}
