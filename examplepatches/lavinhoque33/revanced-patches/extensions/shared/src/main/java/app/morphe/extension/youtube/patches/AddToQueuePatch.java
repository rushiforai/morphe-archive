/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/1837
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.extension.youtube.patches;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Activity;
import android.graphics.drawable.Drawable;
import android.util.Pair;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.Nullable;

import java.util.List;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceType;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.general.DownloadActionsPatch;
import app.morphe.extension.youtube.patches.utils.FlyoutUtils;
import app.morphe.extension.youtube.patches.utils.LocalQueueSheet;
import app.morphe.extension.youtube.patches.utils.PlaylistPatch;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.settings.YouTubeActivityHook;

@SuppressWarnings("unused")
public final class AddToQueuePatch {

    public static final List<String> queueButtonOriginalNames = List.of(
            "QUEUE_PLAY_NEXT",
            "QUEUE_PLAY_LAST"
    );

    private static final Drawable queueButtonDrawable = getQueueButtonDrawable();
    private static final String queueButtonName = str("morphe_queue_flyout_title");

    private static final int SECONDARY_CONTAINER_ID =
            ResourceUtils.getIdentifier(ResourceType.ID, "list_item_secondary_container");

    private static Drawable getQueueButtonDrawable() {
        final String iconName = YouTubeActivityHook.useBoldFlyoutIcons()
                ? "yt_outline_experimental_queue_vd_theme_24"
                : "yt_outline_experimental_queue_black_24";

        Drawable drawable = ResourceUtils.getDrawable(iconName);
        if (drawable != null) {
            return drawable;
        }

        // The plain list icon is a small bitmap, but it exists on every version the patch supports.
        drawable = ResourceUtils.getDrawable("yt_outline_list_view_black_24");
        if (drawable != null) {
            return drawable;
        }

        final int fallbackId = PlaylistPatch.QueueManager.OPEN_QUEUE.drawableId;
        return fallbackId == 0 ? null : Utils.getContext().getDrawable(fallbackId);
    }

    public static boolean isPatchIncluded() {
        return false; // Modified during patching.
    }

    public static int addFlyoutButton(Object flyoutPanel, int index, String videoId) {
        if (!isPatchIncluded()) {
            return index;
        }

        if (LocalQueuePatch.isEnabled()) {
            return addLocalQueueButtons(flyoutPanel, index, videoId);
        }

        if (!Settings.QUEUE_ADD_FLYOUT_MENU.get() ||
                !DownloadActionsPatch.getFlyoutPlaylistId().isEmpty() ||
                videoId.isEmpty()) {
            return index;
        }

        return FlyoutUtils.addFlyoutButton(
                flyoutPanel,
                queueButtonDrawable,
                queueButtonName,
                v -> flyoutButtonClickLogic(
                        queueButtonOriginalNames.get(0),
                        videoId
                ),
                index
        );
    }

    public static void onListBound(ViewGroup itemList) {
        if (!isPatchIncluded() || !isFlyoutOverrideEnabled()) {
            return;
        }

        final String videoId = DownloadActionsPatch.getFlyoutVideoId();
        for (var button : DownloadActionsPatch.getVisibleFlyoutButtons()) {
            final String buttonName = button.first;
            if (!queueButtonOriginalNames.contains(buttonName)) {
                continue;
            }

            final int itemIndex = button.second - 1;
            if (itemIndex < 0 || itemIndex >= itemList.getChildCount()) {
                continue;
            }

            View item = itemList.getChildAt(itemIndex);
            var badge = SECONDARY_CONTAINER_ID == 0 ? null : item.findViewById(SECONDARY_CONTAINER_ID);
            if (badge != null && badge.getVisibility() != View.GONE) {
                Logger.printDebug(() -> "Hiding the menu item secondary icon");
                badge.setVisibility(View.GONE);
            }

            if (LocalQueuePatch.isEnabled()) {
                Logger.printDebug(() -> "Queue row " + buttonName + " video id: '" + videoId + "'");
                item.setOnClickListener(v -> {
                    if (videoId.isEmpty()) {
                        Utils.showToastShort(str(DownloadActionsPatch.getFlyoutPlaylistId().isEmpty()
                                ? "morphe_local_queue_unavailable"
                                : "morphe_local_queue_playlist_unsupported"));
                        FlyoutUtils.dismissFlyout();
                    } else {
                        flyoutButtonClickLogic(buttonName, videoId);
                    }
                });
            }
        }
    }

    private static boolean isFlyoutOverrideEnabled() {
        return LocalQueuePatch.isEnabled() || Settings.QUEUE_OVERRIDE_FLYOUT_MENU.get();
    }

    private static boolean hasFlyoutButton(String buttonName) {
        for (Pair<String, Integer> button : DownloadActionsPatch.getVisibleFlyoutButtons()) {
            if (button.first.equals(buttonName)) {
                return true;
            }
        }
        return false;
    }

    private static int addLocalQueueButtons(Object flyoutPanel, int index, String videoId) {
        final boolean feedFlyout = !DownloadActionsPatch.getFlyoutVideoId().isEmpty();
        final boolean videoFlyout = feedFlyout && DownloadActionsPatch.getFlyoutPlaylistId().isEmpty();

        if (videoFlyout && !hasFlyoutButton(queueButtonOriginalNames.get(0))) {
            index = FlyoutUtils.addFlyoutButton(
                    flyoutPanel,
                    queueButtonDrawable,
                    str("morphe_local_queue_play_next"),
                    v -> flyoutButtonClickLogic(queueButtonOriginalNames.get(0), videoId),
                    index
            );
        }

        if (videoFlyout && !hasFlyoutButton(queueButtonOriginalNames.get(1))) {
            index = FlyoutUtils.addFlyoutButton(
                    flyoutPanel,
                    queueButtonDrawable,
                    str("morphe_local_queue_play_last"),
                    v -> flyoutButtonClickLogic(queueButtonOriginalNames.get(1), videoId),
                    index
            );
        }

        final int size = LocalQueuePatch.size();
        if (feedFlyout && size > 0) {
            index = FlyoutUtils.addFlyoutButton(
                    flyoutPanel,
                    queueButtonDrawable,
                    str("morphe_local_queue_open", size),
                    v -> {
                        FlyoutUtils.dismissFlyout();
                        Activity activity = Utils.getActivity();
                        if (activity != null && !activity.isFinishing() && !activity.isDestroyed()) {
                            LocalQueueSheet.show(activity);
                        } else {
                            Logger.printException(() -> "Could not open queue sheet, activity is not available");
                        }
                    },
                    index
            );
        }

        return index;
    }

    /**
     * Called from the 'Play next in queue' hook of the Hook download actions patch, which owns the hook.
     * The older 'Override Play next in queue' setting only applies when this patch returns the original.
     */
    public static Runnable replaceButtonRunnable(Runnable original) {
        if (!isPatchIncluded() || !isFlyoutOverrideEnabled()) {
            return original;
        }

        if (DownloadActionsPatch.getFlyoutVideoId().isEmpty()) {
            Logger.printDebug(() -> "Cannot replace on item click, flyoutVideoId is empty");
            if (LocalQueuePatch.isEnabled()
                    && queueButtonOriginalNames.contains(DownloadActionsPatch.getCurrentButtonName())) {
                return () -> {
                    Utils.showToastShort(str("morphe_local_queue_playlist_unsupported"));
                    FlyoutUtils.dismissFlyout();
                };
            }
            return original;
        }

        return getNewRunnable(original, DownloadActionsPatch.getCurrentButtonName());
    }

    /**
     * Injection point.
     */
    public static boolean replaceOnItemClick(Object object) {
        try {
            if (!isFlyoutOverrideEnabled()) {
                return false;
            }

            if (DownloadActionsPatch.getFlyoutVideoId().isEmpty()) {
                Logger.printDebug(() -> "Cannot replace on item click, flyoutVideoId is empty");
                return false;
            }

            int buttonIndex = -1;
            String buttonName = "";

            if (object instanceof Integer index) {
                buttonIndex = index;
            } else if (object instanceof String name) {
                buttonName = name;
            }

            List<Pair<String, Integer>> visibleButtons = DownloadActionsPatch.getVisibleFlyoutButtons();
            if (!visibleButtons.isEmpty()) {
                if (buttonIndex >= 0) {
                    return flyoutButtonClickLogic(
                            visibleButtons.get(buttonIndex).first,
                            DownloadActionsPatch.getFlyoutVideoId()
                    );
                } else if (!buttonName.isEmpty()) {
                    return flyoutButtonClickLogic(buttonName, DownloadActionsPatch.getFlyoutVideoId());
                }
            }
        } catch (Exception ex) {
            Logger.printException(() -> "replaceOnItemClick failure", ex);
        }
        return false;
    }

    private static Runnable getNewRunnable(@Nullable Runnable original, String buttonName) {
        return () -> {
            try {
                // Reset index logic goes here if needed between UI clicks
                DownloadActionsPatch.resetCurrentButtonIndex();

                if (flyoutButtonClickLogic(buttonName, DownloadActionsPatch.getFlyoutVideoId())) {
                    return;
                }
            } catch (Exception ex) {
                Logger.printException(() -> "Add to queue getNewRunnable failure", ex);
            }
            if (original != null) {
                original.run();
            }
        };
    }

    public static boolean flyoutButtonClickLogic(String buttonName, String videoId) {
        try {
            if (queueButtonOriginalNames.contains(buttonName)) {
                if (LocalQueuePatch.isEnabled()) {
                    LocalQueuePatch.add(videoId, queueButtonOriginalNames.get(0).equals(buttonName));
                    FlyoutUtils.dismissFlyout();
                    return true;
                }

                Logger.printDebug(() -> "Opening custom queue flyout with videoId: " + videoId);

                Activity activity = Utils.getActivity();
                if (activity != null && !activity.isFinishing() && !activity.isDestroyed()) {
                    PlaylistPatch.prepareDialogBuilder(videoId);
                } else {
                    Logger.printException(() -> "Could not open queue flyout, activity is not available");
                }

                FlyoutUtils.dismissFlyout(); // Must dismiss after showing dialog.
                return true;
            }
        } catch (Exception ex) {
            Logger.printException(() -> "flyoutButtonClickLogic failure: " + buttonName, ex);
        }

        return false;
    }
}
