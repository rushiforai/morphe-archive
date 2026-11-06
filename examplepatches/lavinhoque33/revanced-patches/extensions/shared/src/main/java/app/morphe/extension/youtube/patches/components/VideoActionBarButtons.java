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
 * Copyright (C) 2026 lavinhoque33
 * Written by lavinhoque33, 2026-11-06.
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

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import com.google.protobuf.InvalidProtocolBufferException;
import app.morphe.extension.shared.utils.ByteTrieSearch;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.*;

/** Pure element transformations shared by the runtime filter and its JVM tests. */
final class VideoActionBarButtons {
    enum ActionButton {
        UNKNOWN(),
        ASK(
                "yt_fill_experimental_spark",
                "yt_fill_spark"
        ),
        CHANNEL_PROFILE(),
        CLIP(),
        COMMENTS(
                "yt_outline_experimental_text_bubble",
                "yt_outline_message_bubble",
                "yt_outline_message_bubble_right"
        ),
        CONNECT(),
        DISLIKE(),
        DOWNLOAD(),
        HYPE(
                "yt_outline_experimental_hype",
                "yt_outline_star_shooting"
        ),
        LIKE(),
        LIKE_DISLIKE(),
        MORE(),
        PLAYLIST(),
        PROMOTE(
                "yt_outline_experimental_megaphone",
                "yt_outline_megaphone"
        ),
        REMIX(
                "yt_outline_youtube_shorts_plus",
                "yt_outline_experimental_remix"
        ),
        REPORT(
                "yt_outline_experimental_flag",
                "yt_outline_flag"
        ),
        REWARDS(
                "yt_outline_experimental_account_link",
                "yt_outline_account_link"
        ),
        SHARE(
                "yt_outline_experimental_share",
                "yt_outline_share"
        ),
        SHOP(
                "yt_outline_experimental_bag",
                "yt_outline_bag"
        ),
        STOP_ADS(
                "yt_outline_experimental_circle_slash",
                "yt_outline_slash_circle_left"
        ),
        THANKS(
                "yt_outline_experimental_dollar_sign_heart",
                "yt_outline_dollar_sign_heart"
        );

        private final String[] iconNames;

        ActionButton(String... iconNames) {
            this.iconNames = iconNames;
        }
    }

    private static final ActionButton[] BUTTONS = ActionButton.values();
    private static final ByteTrieSearch elementSearch = new ByteTrieSearch(
            ByteTrieSearch.convertStringsToBytes("video_action_bar.e"));

    static boolean shouldHideChannelBar(boolean hideChannelAndSubscribe, boolean hideActionBar) {
        return hideChannelAndSubscribe || hideActionBar;
    }

    static ActionButton classify(VideoActionBarItemContent content) {
        if (content.hasButton()) {
            String iconName = content.getButton().getIconName();
            for (ActionButton button : BUTTONS) {
                for (String icon : button.iconNames) {
                    if (iconName.contains(icon)) return button;
                }
            }
        } else if (content.hasLikeDislikeButtons()) {
            return ActionButton.LIKE_DISLIKE;
        } else if (content.hasLikeButton()) {
            return ActionButton.LIKE;
        } else if (content.hasDislikeButton()) {
            return ActionButton.DISLIKE;
        } else if (content.hasSaveButton()) {
            return ActionButton.PLAYLIST;
        } else if (content.hasDownloadButton()) {
            return ActionButton.DOWNLOAD;
        } else if (content.hasClipButton()) {
            return ActionButton.CLIP;
        } else if (content.hasAccountLinkButton()) {
            return ActionButton.CONNECT;
        } else if (content.hasSubscribeButton()) {
            return ActionButton.CHANNEL_PROFILE;
        }
        return ActionButton.UNKNOWN;
    }

    static boolean isHidden(VideoActionBarItemContent content, Set<ActionButton> hidden) {
        return hidden.contains(classify(content));
    }

    static List<VideoActionBarItem> getShownActions(List<VideoActionBarItem> actions, Set<ActionButton> hidden) {
        List<VideoActionBarItem> shown = null;
        for (int index = 0; index < actions.size(); index++) {
            VideoActionBarItem original = actions.get(index);
            VideoActionBarItem visible = visibleAction(original, hidden);
            if (shown == null && visible != original) {
                shown = new ArrayList<>(actions.size());
                for (int previous = 0; previous < index; previous++) shown.add(actions.get(previous));
            }
            if (shown != null && visible != null) shown.add(visible);
        }
        return shown == null ? actions : shown;
    }

    private static VideoActionBarItem visibleAction(VideoActionBarItem action, Set<ActionButton> hidden) {
        VideoActionBarItemContent content = action.getContent();
        if (!content.hasOverflow()) return isHidden(content, hidden) ? null : action;
        if (hidden.contains(ActionButton.MORE)) return null;

        VideoActionBarOverflow overflow = content.getOverflow();
        List<VideoActionBarItemContent> menu = filterContents(overflow.getMenuItemsList(), hidden);
        boolean hasButton = false;
        for (VideoActionBarItemContent item : menu) {
            if (!item.hasMenuHeader()) {
                hasButton = true;
                break;
            }
        }
        if (!hasButton) return null;

        List<VideoActionBarItemContent> shown = filterContents(overflow.getShownItemsList(), hidden);
        if (menu == overflow.getMenuItemsList() && shown == overflow.getShownItemsList()) return action;
        return action.toBuilder().setContent(content.toBuilder().setOverflow(overflow.toBuilder()
                .clearMenuItems().addAllMenuItems(menu).clearShownItems().addAllShownItems(shown))).build();
    }

    private static List<VideoActionBarItemContent> filterContents(List<VideoActionBarItemContent> contents,
                                                                 Set<ActionButton> hidden) {
        List<VideoActionBarItemContent> shown = null;
        for (int index = 0; index < contents.size(); index++) {
            VideoActionBarItemContent content = contents.get(index);
            boolean hide = isHidden(content, hidden);
            if (shown == null && hide) {
                shown = new ArrayList<>(contents.size());
                for (int previous = 0; previous < index; previous++) shown.add(contents.get(previous));
            }
            if (shown != null && !hide) shown.add(content);
        }
        return shown == null ? contents : shown;
    }

    static byte[] hide(byte[] bytes, Set<ActionButton> hidden) throws InvalidProtocolBufferException {
        if (bytes == null || hidden.isEmpty() || !elementSearch.matches(bytes)) return bytes;

        Element element = Element.parseFrom(bytes);
        ComponentType component = element.getType().getComponentType();
        ElementModel model = component.getModel();
        ElementModel.Builder updated;
        if (model.hasVideoActionBarModel()) {
            VideoActionBarModel actionBar = model.getVideoActionBarModel();
            List<VideoActionBarItem> original = actionBar.getVideoActionBarData().getActionsList();
            List<VideoActionBarItem> shown = getShownActions(original, hidden);
            if (shown == original) return bytes;
            updated = model.toBuilder().setVideoActionBarModel(actionBar.toBuilder().setVideoActionBarData(
                    actionBar.getVideoActionBarData().toBuilder().clearActions().addAllActions(shown)));
        } else if (model.getLockupModel().getViewModel().hasVideoActionBarViewModel()) {
            LockupModel lockup = model.getLockupModel();
            VideoActionBarViewModel actionBar = lockup.getViewModel().getVideoActionBarViewModel();
            List<VideoActionBarItem> original = actionBar.getActionsList();
            List<VideoActionBarItem> shown = getShownActions(original, hidden);
            if (shown == original) return bytes;
            VideoActionBarViewModel.Builder bar = actionBar.toBuilder().clearActions().addAllActions(shown);
            // Minimal needs one item to draw its channel. The litho filter hides this retained item.
            if (shown.isEmpty() && actionBar.hasSubscribeButton() && !original.isEmpty()) {
                bar.addActions(original.get(0));
            }
            updated = model.toBuilder().setLockupModel(lockup.toBuilder().setViewModel(
                    lockup.getViewModel().toBuilder().setVideoActionBarViewModel(bar)));
        } else {
            return bytes;
        }
        return element.toBuilder().setType(element.getType().toBuilder().setComponentType(
                component.toBuilder().setModel(updated))).build().toByteArray();
    }
}
