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

    public static int addFlyoutButton(Object flyoutPanel, int nextButtonIndex, String videoId) {
        if (!isPatchIncluded() || !Settings.CHANNEL_BLACKLIST_FLYOUT_MENU.get()) {
            return nextButtonIndex;
        }

        final Drawable icon = ResourceUtils.getDrawable(
                useExperimentalIcons()
                        ? "yt_outline_experimental_circle_slash_vd_theme_24"
                        : "yt_outline_trash_can_black_24"
        );

        final String currentChannelName = getCurrentChannelName();
        final boolean isBlacklisted = !currentChannelName.isEmpty()
                && ChannelBlacklistFilter.isChannelBlacklisted(currentChannelName);

        final String buttonTitle = isBlacklisted
                ? str("morphe_channel_blacklist_flyout_remove")
                : str("morphe_channel_blacklist_flyout_add");

        return FlyoutUtils.addFlyoutButton(
                flyoutPanel,
                icon,
                buttonTitle,
                v -> {
                    FlyoutUtils.dismissFlyout();
                    toggleChannel(videoId);
                },
                nextButtonIndex
        );
    }

    private static String getCurrentChannelName() {
        String name = FlyoutUtils.getFlyoutChannelName();
        return !name.isEmpty() ? name : VideoInformation.getChannelName();
    }

    private static void toggleChannel(String videoId) {
        Utils.runOnBackgroundThread(() -> {
            String channelName = getCurrentChannelName();

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
