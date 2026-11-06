/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * Modified by lavinhoque33, 2026-10-24.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 *
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.extension.youtube.patches.components;

import android.view.View;
import android.view.ViewGroup;

import java.util.regex.Pattern;

import app.morphe.extension.shared.patches.components.ByteArrayFilterGroup;
import app.morphe.extension.shared.patches.components.ByteArrayFilterGroupList;
import app.morphe.extension.shared.patches.components.Filter;
import app.morphe.extension.shared.patches.components.StringFilterGroup;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.StringTrieSearch;
import app.morphe.extension.youtube.innertube.NextResponseOuterClass.NewElement;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.utils.ExtendedUtils;

@SuppressWarnings("unused")
public final class CommentsFilter extends Filter {
    private static final String CHIP_BAR_PATH_PREFIX = "chip_bar.e";
    private static final String COMMENT_COMPOSER_PATH = "comment_composer.e";
    // modified by lavinhoque33, 2026-10-16: path of a single comment or reply (ported from Morphe)
    private static final String COMMENT_PATH = "|comment.e";
    private static final String COMMENT_ENTRY_POINT_TEASER_PATH = "comments_entry_point_teaser";
    private static final Pattern COMMENT_PREVIEW_TEXT_PATTERN = Pattern.compile("comments_entry_point_teaser.+ContainerType");
    // modified by lavinhoque33, 2026-10-16: the button text is localized and the component also holds other tri-state buttons (ported from Morphe)
    private static final String TRANSLATE_BUTTON_ACCESSIBILITY_ID = "id.ui.comments.translate.button";
    private static final String FEED_VIDEO_PATH = "video_lockup_with_attachment";
    private static final String VIDEO_METADATA_CAROUSEL_PATH = "video_metadata_carousel.";

    private final StringFilterGroup chipBar;
    private final StringFilterGroup commentsFilterBar;
    private final ByteArrayFilterGroup aiCommentsSummary;
    private final StringFilterGroup comments;
    private final StringFilterGroup commentComposer;
    private final StringFilterGroup commentComposerButtons;
    private final ByteArrayFilterGroupList commentComposerButtonsGroupList = new ByteArrayFilterGroupList();
    private final StringFilterGroup commentsPreviewDots;
    private final StringFilterGroup emojiButton;
    // modified by lavinhoque33, 2026-10-16: new comment button groups (ported from Morphe)
    private final StringFilterGroup dislikeButton;
    private final StringFilterGroup menuButton;
    private final StringFilterGroup minimalCommentsIndicator;
    private final StringFilterGroup translateButton;
    private final StringFilterGroup previewCommentText;
    private final StringFilterGroup timestampButton;
    private final StringTrieSearch exceptions = new StringTrieSearch();

    public CommentsFilter() {
        exceptions.addPatterns("macro_markers_list_item");

        final StringFilterGroup aiChatSummary = new StringFilterGroup(
                Settings.HIDE_AI_CHAT_SUMMARY,
                "live_chat_summary_banner"
        );

        chipBar = new StringFilterGroup(
                Settings.HIDE_AI_COMMENTS_SUMMARY,
                "chip_bar."
        );

        commentsFilterBar = new StringFilterGroup(
                Settings.HIDE_CATEGORY_BAR_IN_COMMENTS,
                CHIP_BAR_PATH_PREFIX
        );

        aiCommentsSummary = new ByteArrayFilterGroup(
                null,
                "yt_fill_spark"
        );

        final StringFilterGroup channelGuidelines = new StringFilterGroup(
                Settings.HIDE_CHANNEL_GUIDELINES,
                "channel_guidelines_entry_banner",
                "community_guidelines",
                "sponsorships_comments_upsell",
                "viewer_engagement_message"
        );

        comments = new StringFilterGroup(
                null,
                VIDEO_METADATA_CAROUSEL_PATH,
                "_comments",
                "teaser_carousel_with_controller"
        );

        final StringFilterGroup commentsByMembers = new StringFilterGroup(
                Settings.HIDE_COMMENTS_BY_MEMBERS,
                "sponsorships_comments_header.",
                "sponsorships_comments_footer."
        );

        commentComposer = new StringFilterGroup(
                null,
                COMMENT_COMPOSER_PATH
        );

        commentComposerButtons = new StringFilterGroup(
                null,
                "|ContainerType|ContainerType|ContainerType|ContainerType|",
                "composer_main_action_button.e"
        );

        commentComposerButtonsGroupList.addAll(
                new ByteArrayFilterGroup(
                        Settings.HIDE_COMMENTS_CREATE_A_SHORT_BUTTON,
                        "composer_short_creation_button.e"
                ),
                new ByteArrayFilterGroup(
                        Settings.HIDE_COMMENTS_THANKS_BUTTON,
                        "super_thanks_button.e"
                )
        );

        var createAShortButton = new StringFilterGroup(
                Settings.HIDE_COMMENTS_CREATE_A_SHORT_BUTTON,
                "composer_short_creation_button.e"
        );

        emojiButton = new StringFilterGroup(
                Settings.HIDE_COMMENTS_EMOJI_AND_TIMESTAMP_BUTTONS,
                "id.comment.quick_emoji.button"
        );

        // modified by lavinhoque33, 2026-10-16: Dislike, Menu and Translate comment buttons (ported from Morphe)
        dislikeButton = new StringFilterGroup(
                Settings.HIDE_COMMENTS_DISLIKE_BUTTON,
                "engagement_dislike_button.e"
        );

        // Overflow buttons are also used outside of comments.
        menuButton = new StringFilterGroup(
                Settings.HIDE_COMMENTS_MENU_BUTTON,
                "overflow_button.e"
        );

        translateButton = new StringFilterGroup(
                Settings.HIDE_COMMENTS_TRANSLATE_BUTTON,
                "tri_state_button.e"
        );

        // modified by lavinhoque33, 2026-10-16: minimal comments button (ported from Morphe)
        final StringFilterGroup minimalCommentsCards = new StringFilterGroup(
                Settings.MINIMAL_COMMENTS_BUTTON,
                "|carousel_item.e"
        );

        minimalCommentsIndicator = new StringFilterGroup(
                Settings.MINIMAL_COMMENTS_BUTTON,
                VIDEO_METADATA_CAROUSEL_PATH
        );

        timestampButton = new StringFilterGroup(
                Settings.HIDE_COMMENTS_EMOJI_AND_TIMESTAMP_BUTTONS,
                "composer_timestamp_button"
        );

        final StringFilterGroup commentsZeroState = new StringFilterGroup(
                Settings.HIDE_COMMENTS_ZERO_STATE,
                "comment_zero_state"
        );

        final StringFilterGroup liveChatMessages = new StringFilterGroup(
                Settings.HIDE_LIVE_CHAT_MESSAGES,
                "live_chat_text_message",
                "viewer_engagement_message" // message about poll, not poll itself
        );

        final StringFilterGroup previewComment = new StringFilterGroup(
                Settings.HIDE_PREVIEW_COMMENT_OLD_METHOD,
                COMMENT_ENTRY_POINT_TEASER_PATH,
                "comments_entry_point_simplebox"
        );

        commentsPreviewDots = new StringFilterGroup(
                Settings.HIDE_PREVIEW_COMMENT_OLD_METHOD,
                VIDEO_METADATA_CAROUSEL_PATH
        );

        previewCommentText = new StringFilterGroup(
                Settings.HIDE_PREVIEW_COMMENT_NEW_METHOD,
                COMMENT_ENTRY_POINT_TEASER_PATH
        );

        var thanksButton = new StringFilterGroup(
                Settings.HIDE_COMMENTS_THANKS_BUTTON,
                "super_thanks_button.e"
        );

        addIdentifierCallbacks(channelGuidelines);

        addPathCallbacks(
                aiChatSummary,
                chipBar,
                commentsFilterBar,
                comments,
                commentsByMembers,
                commentsZeroState,
                commentComposer,
                commentComposerButtons,
                commentsPreviewDots,
                createAShortButton,
                dislikeButton,
                emojiButton,
                liveChatMessages,
                menuButton,
                minimalCommentsCards,
                minimalCommentsIndicator,
                previewComment,
                previewCommentText,
                thanksButton,
                timestampButton,
                translateButton
        );
    }

    @Override
    public boolean isFiltered(String path, String identifier, String allValue, byte[] buffer,
                              StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        if (exceptions.matches(path))
            return false;

        if (matchedGroup == commentComposer) {
            return emojiButton.check(allValue).isFiltered();
        }

        if (matchedGroup == commentComposerButtons) {
            if (!ExtendedUtils.IS_20_31_OR_GREATER) {
                return false;
            }
            return commentComposerButtonsGroupList.check(buffer).isFiltered();
        }

        if (matchedGroup == timestampButton) {
            return path.startsWith(COMMENT_COMPOSER_PATH);
        } else if (matchedGroup == chipBar) {
            // Playlist sort button uses same components and must only filter if the player is opened.
            return PlayerType.getCurrent().isMaximizedOrFullscreen()
                    && aiCommentsSummary.check(buffer).isFiltered();
        } else if (matchedGroup == commentsFilterBar) {
            return Settings.HIDE_CATEGORY_BAR_IN_COMMENTS.get()
                    && PlayerType.getCurrent().isMaximizedOrFullscreen();
        } else if (matchedGroup == comments) {
            if (path.startsWith(FEED_VIDEO_PATH)) {
                return Settings.HIDE_COMMENTS_SECTION_IN_HOME_FEED.get();
            } else return Settings.HIDE_COMMENTS_SECTION.get();
        } else if (matchedGroup == commentsPreviewDots) {
            return path.contains("carousel_header") &&
                            // Old action buttons layout.
                            (path.endsWith("|ContainerType|ContainerType|ContainerType|")
                            // New action buttons layout.
                            || path.contains("|dot_indicator.e"));
        } else if (matchedGroup == previewCommentText) {
            return COMMENT_PREVIEW_TEXT_PATTERN.matcher(path).find();
        } else if (matchedGroup == dislikeButton || matchedGroup == menuButton) {
            // modified by lavinhoque33, 2026-10-16: only the buttons of comments and replies
            return path.contains(COMMENT_PATH);
        } else if (matchedGroup == translateButton) {
            // modified by lavinhoque33, 2026-10-16: accessibility id is passed as allValue (see the override below)
            return allValue != null && allValue.contains(TRANSLATE_BUTTON_ACCESSIBILITY_ID)
                    && path.contains(COMMENT_PATH);
        } else if (matchedGroup == minimalCommentsIndicator) {
            // modified by lavinhoque33, 2026-10-16: sliding cards page selector
            return path.contains("carousel_header")
                    && path.endsWith("|ContainerType|ContainerType|ContainerType|");
        }

        return true;
    }

    // modified by lavinhoque33, 2026-10-16: the modern litho bridge supplies accessibility text separately
    // (same approach as ActionButtonsFilter); the legacy bridge's allValue holds the component string.
    @Override
    public boolean isFiltered(Object contextSource, String identifier, String accessibility, String path, byte[] buffer,
                              StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        return isFiltered(path, identifier, accessibility, buffer, matchedGroup, contentType, contentIndex);
    }

    /**
     * Injection point.
     */
    public static void hideLiveChatScrollToBottomButton(View view) {
        if (Settings.HIDE_COMMENTS_LIVE_CHAT_SCROLL_TO_BOTTOM_BUTTON.get() && view != null) {
            ViewGroup.LayoutParams lp = view.getLayoutParams();
            if (lp != null) {
                lp.width = 0;
                lp.height = 0;
                view.setLayoutParams(lp);
            }

            view.setVisibility(View.GONE);
        }
    }

    /**
     * Injection point.
     */
    public static void hideInComments(View view) {
        if (view == null || !Settings.HIDE_CATEGORY_BAR_IN_COMMENTS.get()) {
            return;
        }

        if (PlayerType.getCurrent().isMaximizedOrFullscreen()) {
            ViewGroup.LayoutParams lp = view.getLayoutParams();
            if (lp != null) {
                lp.height = 0;
                view.setLayoutParams(lp);
            }
            view.setVisibility(View.GONE);
        }
    }

    /**
     * Injection point.
     */
    public static byte[] onCommentsLoaded(byte[] bytes) {
        if (!Settings.HIDE_COMMENTS_CAROUSEL.get()) {
            return bytes;
        }

        String rawFilterText = Settings.HIDE_COMMENTS_CAROUSEL_FILTER_STRINGS.get();
        if (rawFilterText.isBlank()) {
            return bytes;
        }

        String[] commentsCarouselFilterStrings = rawFilterText.split("\\n");

        try {
            var newElement = NewElement.parseFrom(bytes).toBuilder();
            var identifier = newElement.getProperties().getIdentifierProperties().getIdentifier();
            if (!identifier.contains(VIDEO_METADATA_CAROUSEL_PATH)) {
                return bytes;
            }

            var type = newElement.getType().toBuilder();
            var componentType = type.getComponentType().toBuilder();
            var model = componentType.getModel().toBuilder();
            var videoMetadataCarouselModel = model.getVideoMetadataCarouselModel().toBuilder();
            var data = videoMetadataCarouselModel.getData().toBuilder();
            var carouselTitleDatasList = data.getCarouselTitleDatasList();
            boolean modified = false;

            for (int i = carouselTitleDatasList.size() - 1; i > -1; i--) {
                String title = carouselTitleDatasList.get(i).getTitle();
                Logger.printDebug(() -> "comments title: " + title);

                for (String filter : commentsCarouselFilterStrings) {
                    if (!filter.isEmpty() && title.contains(filter)) {
                        data.removeCarouselItemDatas(i);
                        data.removeCarouselTitleDatas(i);
                        modified = true;
                        break;
                    }
                }
            }

            if (modified) {
                videoMetadataCarouselModel.clearData();
                videoMetadataCarouselModel.setData(data.build());

                model.clearVideoMetadataCarouselModel();
                model.setVideoMetadataCarouselModel(videoMetadataCarouselModel.build());

                componentType.clearModel();
                componentType.setModel(model.build());

                type.clearComponentType();
                type.setComponentType(componentType.build());

                newElement.clearType();
                newElement.setType(type.build());

                return newElement.build().toByteArray();
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Failed to parse newElement", ex);
        }

        return bytes;
    }
}
