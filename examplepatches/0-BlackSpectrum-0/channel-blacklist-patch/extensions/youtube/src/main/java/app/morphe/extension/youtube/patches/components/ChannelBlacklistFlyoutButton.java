package app.morphe.extension.youtube.patches.components;

import static app.morphe.extension.shared.StringRef.str;

import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.Pair;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.spoof.SpoofAppVersionPatch;
import app.morphe.extension.youtube.patches.VersionCheckPatch;
import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.patches.utils.FlyoutUtils;
import app.morphe.extension.youtube.patches.utils.requests.ChannelIdRequest;
import app.morphe.extension.youtube.settings.Settings;

/**
 * Adds the "Add channel to blacklist" entry to the 3-dot flyout menu.
 * Kept out of {@link FlyoutUtils} so upstream changes to that file merge without conflicts.
 * <p>
 * Since upstream v2.0.0 the flyout opens immediately and the channel of the menu's video
 * loads in the background ({@link FlyoutUtils#getFlyoutChannelIdRequest()}), so this button
 * follows the same pattern as the channel whitelist buttons.
 */
@SuppressWarnings("unused")
public final class ChannelBlacklistFlyoutButton {

    public static boolean isPatchIncluded() {
        return false; // Modified during patching.
    }

    // Same icon selection used by upstream flyout buttons (Save to watch later, Queue manager).
    private static boolean useExperimentalIcons() {
        return VersionCheckPatch.IS_20_31_OR_GREATER
                && !SpoofAppVersionPatch.isSpoofingToLessThan("20.31.00");
    }

    private static String getTitle(boolean isBlacklisted) {
        return isBlacklisted
                ? str("morphe_channel_blacklist_flyout_remove")
                : str("morphe_channel_blacklist_flyout_add");
    }

    public static int addFlyoutButton(Object flyoutPanel, int nextButtonIndex, String videoId) {
        if (!isPatchIncluded() || !Settings.CHANNEL_BLACKLIST_FLYOUT_MENU.get()) {
            return nextButtonIndex;
        }

        final Drawable icon = ResourceUtils.getDrawable(
                useExperimentalIcons()
                        ? "yt_outline_experimental_circle_slash_vd_theme_24"
                        : "yt_outline_trash_can_black_24"
        );

        final ChannelIdRequest request = FlyoutUtils.getFlyoutChannelIdRequest();
        if (request == null) {
            // Menus without a video of their own, such as the player settings, belong to the playing video.
            final String playingChannelName = VideoInformation.getChannelName();
            final boolean isBlacklisted = !playingChannelName.isEmpty()
                    && ChannelBlacklistFilter.isChannelBlacklisted(playingChannelName);

            return FlyoutUtils.addFlyoutButton(
                    flyoutPanel,
                    icon,
                    getTitle(isBlacklisted),
                    v -> {
                        FlyoutUtils.dismissFlyout();
                        toggleChannel(playingChannelName, videoId);
                    },
                    nextButtonIndex
            );
        }

        // The button is disabled until the channel is loaded, and is enabled right away if it already is.
        return FlyoutUtils.addFlyoutButton(
                flyoutPanel,
                icon,
                getTitle(false),
                v -> {
                    FlyoutUtils.dismissFlyout();
                    // The button is only enabled once the request is done, so this does not wait.
                    Pair<String, String> channelInfo = request.getChannelInfo();
                    toggleChannel(channelInfo == null ? "" : channelInfo.first, videoId);
                },
                nextButtonIndex,
                new FlyoutUtils.FlyoutButtonResource(request.getFuture(), text -> {
                    Pair<String, String> channelInfo = request.getChannelInfo();
                    String channelName = channelInfo == null ? "" : channelInfo.first;
                    if (TextUtils.isEmpty(channelName)) {
                        return false;
                    }

                    if (text != null) {
                        text.setText(getTitle(ChannelBlacklistFilter.isChannelBlacklisted(channelName)));
                    }
                    return true;
                })
        );
    }

    private static void toggleChannel(String knownChannelName, String videoId) {
        Utils.runOnBackgroundThread(() -> {
            String channelName = knownChannelName;

            if (channelName.isEmpty() && !videoId.isEmpty()) {
                try {
                    ChannelIdRequest req = ChannelIdRequest.fetchRequestIfNeeded(videoId);
                    Pair<String, String> info = req.getChannelInfo();
                    if (info != null && !TextUtils.isEmpty(info.first)) {
                        channelName = info.first;
                    }
                } catch (Exception ex) {
                    Logger.printException(() -> "Failed to resolve channel name for blacklist", ex);
                }
            }

            if (channelName.isEmpty()) {
                Utils.runOnMainThread(() ->
                        Utils.showToastShort(str("morphe_channel_blacklist_channel_not_found")));
                return;
            }

            final String finalChannelName = channelName;
            final boolean currentlyBlacklisted = ChannelBlacklistFilter.isChannelBlacklisted(finalChannelName);

            Utils.runOnMainThread(() -> {
                if (currentlyBlacklisted) {
                    ChannelBlacklistFilter.removeChannel(finalChannelName);
                    Utils.showToastShort(str("morphe_channel_blacklist_channel_removed"));
                } else {
                    ChannelBlacklistFilter.addChannel(finalChannelName);
                    Utils.showToastShort(str("morphe_channel_blacklist_channel_added"));
                }
            });
        });
    }
}
