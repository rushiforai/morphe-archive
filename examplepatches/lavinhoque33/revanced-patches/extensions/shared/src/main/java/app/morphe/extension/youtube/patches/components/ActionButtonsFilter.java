/*
 * Copyright (C) 2024-2026 anddea
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Original author(s):
 * - anddea (https://github.com/anddea)
 * - inotia00 (https://github.com/inotia00)
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-06.
 *
 * ------------------------------------------------------------------------
 * GPLv3 Section 7 – Additional Terms & Attribution Requirements
 * ------------------------------------------------------------------------
 *
 * This file contains substantial original work by the author(s) listed above.
 *
 * In accordance with Section 7 of the GNU General Public License v3.0,
 * the following additional terms apply to this file:
 *
 * 1. Source Credit Preservation (Section 7(b)): This specific copyright notice
 *    and the list of original authors above must be preserved in any copy
 *    or derivative work. You may add your own copyright notice below it,
 *    but you may not remove the original one.
 *
 * 2. Origin & Modification Marking (Section 7(c)): Modified versions must be
 *    clearly marked as such (e.g., by adding a "Modified by" line or a new
 *    copyright notice) and must not be misrepresented as the original work.
 *
 * 3. Version Control Attribution (Section 7(b)): Any ports or substantial
 *    modifications must retain historical authorship credit in version control
 *    systems (e.g., Git), listing original author(s) appropriately and
 *    modifiers as committers or co-authors.
 *
 * 4. User Interface Attribution (Section 7(b)): Any works containing or
 *    derived from this material must maintain a visible credit or
 *    acknowledgment to the original author(s) within the application's
 *    user interface (e.g., in an "About" or "Credits" section).
 */

/*
 * Portions of this file are ported from Morphe:
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 */

package app.morphe.extension.youtube.patches.components;

import static app.morphe.extension.youtube.utils.ExtendedUtils.IS_20_22_OR_GREATER;

import androidx.annotation.GuardedBy;
import androidx.annotation.NonNull;

import com.google.protobuf.MessageLite;

import org.apache.commons.lang3.StringUtils;

import java.util.List;
import java.util.Map;

import app.morphe.extension.shared.patches.components.ByteArrayFilterGroup;
import app.morphe.extension.shared.patches.components.ByteArrayFilterGroupList;
import app.morphe.extension.shared.patches.components.Filter;
import app.morphe.extension.shared.patches.components.StringFilterGroup;
import app.morphe.extension.shared.patches.components.StringFilterGroupList;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.innertube.NextResponseOuterClass.ActionButtons;
import app.morphe.extension.youtube.innertube.NextResponseOuterClass.NewElement;
import app.morphe.extension.youtube.innertube.NextResponseOuterClass.SecondaryContents;
import app.morphe.extension.youtube.innertube.NextResponseOuterClass.SingleColumnWatchNextResults;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.patches.components.VideoActionBarButtons.ActionButton;
import app.morphe.extension.youtube.shared.VideoInformation;

@SuppressWarnings("unused")
public final class ActionButtonsFilter extends Filter {
    private static final java.util.Set<ActionButton> hiddenButtons = java.util.EnumSet.noneOf(ActionButton.class);

    static {
        if (Settings.HIDE_ASK_BUTTON.get()) hiddenButtons.add(ActionButton.ASK);
        if (Settings.HIDE_CHANNEL_PROFILE_BUTTON.get()) hiddenButtons.add(ActionButton.CHANNEL_PROFILE);
        if (Settings.HIDE_CLIP_BUTTON.get()) hiddenButtons.add(ActionButton.CLIP);
        if (Settings.HIDE_COMMENTS_BUTTON.get()) hiddenButtons.add(ActionButton.COMMENTS);
        if (Settings.HIDE_CONNECT_BUTTON.get()) hiddenButtons.add(ActionButton.CONNECT);
        if (Settings.HIDE_DISLIKE_BUTTON.get()) hiddenButtons.add(ActionButton.DISLIKE);
        if (Settings.HIDE_DOWNLOAD_BUTTON.get()) hiddenButtons.add(ActionButton.DOWNLOAD);
        if (Settings.HIDE_HYPE_BUTTON.get()) hiddenButtons.add(ActionButton.HYPE);
        if (Settings.HIDE_LIKE_BUTTON.get()) hiddenButtons.add(ActionButton.LIKE);
        if (Settings.HIDE_LIKE_DISLIKE_BUTTON.get()) hiddenButtons.add(ActionButton.LIKE_DISLIKE);
        if (Settings.HIDE_MORE_BUTTON.get()) hiddenButtons.add(ActionButton.MORE);
        if (Settings.HIDE_PLAYLIST_BUTTON.get()) hiddenButtons.add(ActionButton.PLAYLIST);
        if (Settings.HIDE_PROMOTE_BUTTON.get()) hiddenButtons.add(ActionButton.PROMOTE);
        if (Settings.HIDE_REMIX_BUTTON.get()) hiddenButtons.add(ActionButton.REMIX);
        if (Settings.HIDE_REPORT_BUTTON.get()) hiddenButtons.add(ActionButton.REPORT);
        if (Settings.HIDE_REWARDS_BUTTON.get()) hiddenButtons.add(ActionButton.REWARDS);
        if (Settings.HIDE_SHARE_BUTTON.get()) hiddenButtons.add(ActionButton.SHARE);
        if (Settings.HIDE_SHOP_BUTTON.get()) hiddenButtons.add(ActionButton.SHOP);
        if (Settings.HIDE_STOP_ADS_BUTTON.get()) hiddenButtons.add(ActionButton.STOP_ADS);
        if (Settings.HIDE_THANKS_BUTTON.get()) hiddenButtons.add(ActionButton.THANKS);
    }

    /**
     * Caches only the segmented-layout flag needed by Return YouTube Dislike, by video ID.
     */
    @GuardedBy("itself")
    private static final Map<String, Boolean> segmentedButtonLookup =
            Utils.createSizeRestrictedMap(10);

    private static final String COMPACT_CHANNEL_BAR_PREFIX = "compact_channel_bar.";
    private static final String COMPACTIFY_VIDEO_ACTION_BAR_PREFIX = "compactify_video_action_bar.";
    private static final String SEGMENTED_LIKE_DISLIKE_BUTTON_PREFIX = "segmented_like_dislike_button.";
    private static final String VIDEO_ACTION_BAR_PREFIX = "video_action_bar.";
    private static final String ELEMENT_BUTTON_ID = "id.elements.button";
    private static final String MORE_BUTTON_PATH = "overflow_menu_button.e";

    private final StringFilterGroup actionBarGroup;
    private final StringFilterGroup channelBarGroup;
    private final StringFilterGroup likeSubscribeGlow;
    private final StringFilterGroup moreButton;
    private final StringFilterGroup channelProfileButton;
    private final StringFilterGroup subscribeButton;
    private final StringFilterGroupList accessibilityGroupList = new StringFilterGroupList();
    private final ByteArrayFilterGroupList bufferGroupList = new ByteArrayFilterGroupList();

    public ActionButtonsFilter() {
        actionBarGroup = new StringFilterGroup(
                null,
                IS_20_22_OR_GREATER
                        ? new String[]{VIDEO_ACTION_BAR_PREFIX}
                        : new String[]{VIDEO_ACTION_BAR_PREFIX, COMPACTIFY_VIDEO_ACTION_BAR_PREFIX}
        );
        channelBarGroup = new StringFilterGroup(Settings.HIDE_CHANNEL_PROFILE_BUTTON, COMPACT_CHANNEL_BAR_PREFIX);
        addIdentifierCallbacks(actionBarGroup, channelBarGroup);

        likeSubscribeGlow = new StringFilterGroup(
                Settings.DISABLE_LIKE_DISLIKE_GLOW,
                "animated_button_border."
        );
        moreButton = new StringFilterGroup(
                Settings.HIDE_MORE_BUTTON,
                MORE_BUTTON_PATH
        );
        channelProfileButton = new StringFilterGroup(
                Settings.HIDE_CHANNEL_PROFILE_BUTTON,
                "|compact_channel_bar.e"
        );
        subscribeButton = new StringFilterGroup(
                Settings.HIDE_CHANNEL_PROFILE_SUBSCRIBE_BUTTON,
                "|compact_channel_bar_animated_buttons.e"
        );
        addPathCallbacks(likeSubscribeGlow, moreButton, channelProfileButton, subscribeButton);

        accessibilityGroupList.addAll(
                new StringFilterGroup(
                        Settings.HIDE_DISLIKE_BUTTON,
                        "id.video.dislike"
                ),
                new StringFilterGroup(
                        Settings.HIDE_LIKE_BUTTON,
                        "id.video.like"
                ),
                new StringFilterGroup(
                        Settings.HIDE_SHARE_BUTTON,
                        "id.video.share"
                ),
                new StringFilterGroup(
                        Settings.HIDE_PLAYLIST_BUTTON,
                        "id.video.add_to.button"
                )
        );
        bufferGroupList.addAll(
                new ByteArrayFilterGroup(
                        Settings.HIDE_ASK_BUTTON,
                        "PAyouchat"
                ),
                new ByteArrayFilterGroup(
                        Settings.HIDE_HYPE_BUTTON,
                        "yt_outline_experimental_hype",
                        "yt_outline_star_shooting"
                )
        );
    }

    private static boolean isVideoActionBar(@NonNull String identifier) {
        return StringUtils.startsWithAny(identifier, COMPACTIFY_VIDEO_ACTION_BAR_PREFIX, VIDEO_ACTION_BAR_PREFIX);
    }


    @Override
    public boolean isFiltered(String path, String identifier, String allValue, byte[] buffer,
                              StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        if (matchedGroup == likeSubscribeGlow) {
            return StringUtils.startsWithAny(
                    path,
                    COMPACT_CHANNEL_BAR_PREFIX,
                    COMPACTIFY_VIDEO_ACTION_BAR_PREFIX,
                    VIDEO_ACTION_BAR_PREFIX
            );
        }
        if (matchedGroup == moreButton) {
            return true;
        }
        if (matchedGroup == channelProfileButton || matchedGroup == subscribeButton) {
            // Also covers the separate channel row in Classic Two-Rows.
            return StringUtils.startsWithAny(path, COMPACT_CHANNEL_BAR_PREFIX,
                    COMPACTIFY_VIDEO_ACTION_BAR_PREFIX, VIDEO_ACTION_BAR_PREFIX);
        }
        if (matchedGroup == channelBarGroup) {
            return VideoActionBarButtons.shouldHideChannelBar(
                    Settings.HIDE_CHANNEL_PROFILE_BUTTON.get(), Settings.HIDE_ACTION_BAR.get());
        }
        if (matchedGroup == actionBarGroup) {
            if (Settings.HIDE_ACTION_BAR.get()) {
                return true;
            }

            String accessibility = allValue == null ? "" : allValue;
            if (!path.contains(SEGMENTED_LIKE_DISLIKE_BUTTON_PREFIX)
                    && accessibilityGroupList.check(accessibility).isFiltered()) {
                return true;
            }
            // More menu entries and shared icon names are serialized into one component buffer.
            // Filtering that buffer would hide the entire More button instead of one menu entry.
            return !path.contains(MORE_BUTTON_PATH)
                    && accessibility.startsWith(ELEMENT_BUTTON_ID)
                    && bufferGroupList.check(buffer).isFiltered();
        }

        return true;
    }

    @Override
    public boolean isFiltered(Object contextSource, String identifier, String accessibility, String path, byte[] buffer,
                              StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        return isFiltered(path, identifier, accessibility, buffer, matchedGroup, contentType, contentIndex);
    }

    /**
     * v20.21 needs accessibility and the direct component buffer for buttons not represented by
     * the legacy action-button model.
     */
    @Override
    public boolean useModernFilterDataInLegacyBridge() {
        return true;
    }

    /** Injection point. Remove hidden buttons from the element, including Minimal overflow items. */
    public static byte[] hideActionButtons(byte[] bytes) {
        try {
            return VideoActionBarButtons.hide(bytes, hiddenButtons);
        } catch (Exception ex) {
            Logger.printException(() -> "hideActionButtons failure", ex);
            return bytes;
        }
    }

    /** Whether the unfiltered server model has a segmented like/dislike button, even if hidden. */
    public static boolean hasCurrentVideoSegmentedButton() {
        synchronized (segmentedButtonLookup) {
            return Boolean.TRUE.equals(segmentedButtonLookup.get(VideoInformation.getVideoId()));
        }
    }

    /**
     * Injection point.
     * Invoke as soon as the endpoint response is received.
     */
    public static void onSingleColumnWatchNextResultsLoaded(@NonNull MessageLite messageLite) {
        if (!Settings.RYD_ENABLED.get()) {
            return;
        }

        synchronized (segmentedButtonLookup) {
            try {
                var singleColumnWatchNextResults = SingleColumnWatchNextResults.parseFrom(messageLite.toByteArray());
                var primaryResults = singleColumnWatchNextResults.getPrimaryResults();
                var secondaryResults = primaryResults.getSecondaryResults();

                SecondaryContents finalSecondaryContents = null;
                for (var secondaryContents : secondaryResults.getSecondaryContentsList()) {
                    if (secondaryContents.hasSlimVideoMetadataSectionRenderer()) {
                        finalSecondaryContents = secondaryContents;
                        break;
                    }
                }
                if (finalSecondaryContents == null) {
                    return;
                }

                var slimVideoMetadataSectionRenderer = finalSecondaryContents.getSlimVideoMetadataSectionRenderer();
                String videoId = slimVideoMetadataSectionRenderer.getVideoId();
                if (segmentedButtonLookup.containsKey(videoId)) {
                    return;
                }

                NewElement finalNewElement = null;
                for (var tertiaryContents : slimVideoMetadataSectionRenderer.getTertiaryContentsList()) {
                    var newElement = tertiaryContents.getElementRenderer().getNewElement();
                    String identifier = newElement.getProperties().getIdentifierProperties().getIdentifier();
                    if (isVideoActionBar(identifier)) {
                        finalNewElement = newElement;
                        break;
                    }
                }
                if (finalNewElement == null) {
                    return;
                }

                var model = finalNewElement.getType().getComponentType().getModel();
                List<ActionButtons> finalActionButtons = null;

                if (model.hasYoutubeModel()) {
                    finalActionButtons = model.getYoutubeModel()
                            .getViewModel()
                            .getCompactifyVideoActionBarViewModel()
                            .getActionButtonsList();
                } else if (model.hasVideoActionBarModel()) {
                    finalActionButtons = model.getVideoActionBarModel()
                            .getVideoActionBarData()
                            .getActionButtonsList();
                } else {
                    Logger.printDebug(() -> "Unknown model: " + model + ", videoId: " + videoId);
                }
                if (finalActionButtons == null || finalActionButtons.isEmpty()) {
                    return;
                }

                boolean segmented = false;
                for (ActionButtons button : finalActionButtons) {
                    if (button.getPrimaryButtonViewModel().hasSegmentedLikeDislikeButtonViewModel()) {
                        segmented = true;
                        break;
                    }
                }
                segmentedButtonLookup.put(videoId, segmented);
            } catch (Exception ex) {
                Logger.printException(() -> "Failed to parse SingleColumnWatchNextResults", ex);
            }
        }
    }
}
