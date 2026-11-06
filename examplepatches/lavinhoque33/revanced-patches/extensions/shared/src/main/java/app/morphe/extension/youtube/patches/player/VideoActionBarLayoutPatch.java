/*
 * Copyright (C) 2026 lavinhoque33
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-06.
 *
 * Ported from Morphe. See NOTICE for GPLv3 Section 7 terms that apply to Morphe contributions.
 */
package app.morphe.extension.youtube.patches.player;

import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.AddToPlaylistButtonViewModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ButtonViewModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ButtonViewModelHolder;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ComponentType;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.DislikeButtonViewModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.Element;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.LikeButtonViewModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.LikeStatusEntityKey;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.LockupModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ToggleButtonViewModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ToggleButtonViewModelHolder;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.VideoActionBarItem;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.VideoActionBarItemContent;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.VideoActionBarLikeCount;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.VideoActionBarLikeDislike;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.VideoActionBarOverflow;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.VideoActionBarSize;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.VideoActionBarViewModel;
import app.morphe.extension.shared.utils.ByteTrieSearch;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.PackageUtils;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.CompactChannelBarModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.CompactChannelBarViewModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.CompactChannelBarViewModelHolder;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ElementModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.EnvironmentSubscriptionConfig;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.SubscribeState;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.SubscriptionConfig;
import app.morphe.extension.youtube.innertube.NextResponseOuterClass.NewElement;
import app.morphe.extension.youtube.innertube.NextResponseOuterClass.SecondaryContents;
import app.morphe.extension.youtube.innertube.NextResponseOuterClass.SlimVideoMetadataSectionRenderer;
import app.morphe.extension.youtube.innertube.NextResponseOuterClass.TertiaryContents;
import app.morphe.extension.youtube.patches.feed.FeedCardLayoutPatch;
import com.google.protobuf.MessageLite;
import com.google.protobuf.InvalidProtocolBufferException;

import java.util.Base64;

public final class VideoActionBarLayoutPatch {
    private static final String VIDEO_ACTION_BAR_TEMPLATE = "compactify_video_action_bar.eml";
    private static final int LAYOUT_STYLE_CLASSIC = 4;
    private static final int LAYOUT_STYLE_MINIMAL = 6;
    private static final String SHARE_BUTTON_ID = "id.video.share.button";
    private static final String OVERFLOW_BUTTON_ICON = "yt_outline_experimental_overflow_horizontal_black_24";
    private static final String MORE_ACTIONS_TEXT = "accessibility_more_actions_video";
    private static final int LIKE_COUNT_ENTITY_TYPE = 445;
    private static final int CHANNEL_BAR_ENVIRONMENT_FIELD = 4;
    private static final int CLASSIC_BUTTON_TYPE = 5;
    private static final int CLASSIC_BUTTON_SIZE = 2;
    private static final int CLASSIC_DOWNLOAD_BUTTON_STYLE = 4;
    private static final int MINIMAL_BUTTON_TYPE = 3;
    private static final int MINIMAL_BUTTON_SIZE = 4;
    private static final int MINIMAL_BUTTON_ICON_STYLE = 1;
    /**
     * Values of the action bar of the minimal layout, which are not in the action bar of the classic layout.
     */
    private static final VideoActionBarSize MINIMAL_LAYOUT_SIZE = VideoActionBarSize.newBuilder()
            .setMinButtonsWidth(150)
            .setMaxButtonsWidth(150)
            .setButtonSpacing(2)
            .setMaxVisibleButtons(5)
            .build();

    private static final ByteTrieSearch actionBarSearch = new ByteTrieSearch(
            ByteTrieSearch.convertStringsToBytes(VIDEO_ACTION_BAR_TEMPLATE));

    private static final class RuntimeLayout {
        static final VideoActionBarLayout LAYOUT = Settings.VIDEO_ACTION_BAR_LAYOUT.get().effective(
                PackageUtils.isTablet(), Settings.DISABLE_LAYOUT_UPDATES.get());
        static final FeedCardLayoutPatch.VideoTemplate CHANNEL_BAR_TEMPLATE =
                new FeedCardLayoutPatch.VideoTemplate("compact_channel_bar.eml", 391108665, 6, 5);
    }

    public static VideoActionBarLayout getLayout() {
        return RuntimeLayout.LAYOUT;
    }

    /** Injection point. Unrelated elements and server-default layouts keep their original bytes. */
    public static byte[] setVideoActionBarLayout(byte[] bytes) {
        VideoActionBarLayout layout = RuntimeLayout.LAYOUT;
        if (layout == VideoActionBarLayout.DEFAULT || bytes == null || !actionBarSearch.matches(bytes)) {
            return bytes;
        }

        try {
            String moreActionsText = layout == VideoActionBarLayout.MINIMAL
                    && ResourceUtils.getStringIdentifier(MORE_ACTIONS_TEXT) != 0
                    ? ResourceUtils.getString(MORE_ACTIONS_TEXT) : "";
            return rewriteElement(bytes, layout, moreActionsText);
        } catch (Exception ex) {
            Logger.printException(() -> "setVideoActionBarLayout failure", ex);
            return bytes;
        }
    }

    static byte[] rewriteElement(byte[] bytes, VideoActionBarLayout layout, String moreActionsText)
            throws com.google.protobuf.InvalidProtocolBufferException {
        if (layout == VideoActionBarLayout.DEFAULT || bytes == null || !actionBarSearch.matches(bytes)) {
            return bytes;
        }

        Element element = Element.parseFrom(bytes);
        ComponentType componentType = element.getType().getComponentType();
        LockupModel lockupModel = componentType.getModel().getLockupModel();
        VideoActionBarViewModel actionBar = lockupModel.getViewModel().getVideoActionBarViewModel();
        VideoActionBarViewModel converted = convertActionBar(actionBar, layout, moreActionsText);
        return converted == actionBar ? bytes
                : withActionBar(element, componentType, lockupModel, converted).toByteArray();
    }

    static VideoActionBarViewModel convertActionBar(VideoActionBarViewModel actionBar,
                                                    VideoActionBarLayout layout, String moreActionsText)
            throws com.google.protobuf.InvalidProtocolBufferException {
        boolean minimal = layout == VideoActionBarLayout.MINIMAL;
        if (layout == VideoActionBarLayout.DEFAULT
                || actionBar.getLayoutStyle() != (minimal ? LAYOUT_STYLE_CLASSIC : LAYOUT_STYLE_MINIMAL)) {
            return actionBar;
        }

        VideoActionBarViewModel.Builder builder = minimal
                ? toMinimal(actionBar, moreActionsText) : toClassic(actionBar);
        return builder.setLayoutStyle(minimal ? LAYOUT_STYLE_MINIMAL : LAYOUT_STYLE_CLASSIC)
                .setLayoutConfig(actionBar.getLayoutConfig().toBuilder().setIconButtons(minimal))
                .build();
    }

    private static VideoActionBarViewModel.Builder toMinimal(
            VideoActionBarViewModel actionBar, String moreActionsText) {
        VideoActionBarViewModel.Builder builder = actionBar.toBuilder().clearActions();
        VideoActionBarOverflow.Builder overflow = VideoActionBarOverflow.newBuilder();
        for (VideoActionBarItem action : actionBar.getActionsList()) {
            VideoActionBarItemContent content = action.getContent();
            if (content.hasSubscribeButton()) {
                builder.setSubscribeButton(content);
            } else if (content.hasLikeDislikeButtons()) {
                VideoActionBarLikeDislike likeDislike = content.getLikeDislikeButtons();
                LikeButtonViewModel likeButton = likeDislike.getLikeButton().getLikeButton();
                DislikeButtonViewModel dislikeButton = likeDislike.getDislikeButton().getDislikeButton();
                VideoActionBarItemContent minimalLikeButton = VideoActionBarItemContent.newBuilder()
                        .setLikeButton(likeButton.toBuilder()
                                .setToggleButtonViewModel(
                                        layoutToggleButton(likeButton.getToggleButtonViewModel(), true))
                                .setAnimationEnabled1(true)
                                .setAnimationEnabled2(true)
                                .setAnimationEnabled3(true)
                                .setLikeAnimationUrl(likeDislike.getLikeAnimationUrl())
                                .setLikedAnimationUrl(likeDislike.getLikedAnimationUrl())
                                .setLikeCountAnimationParams(likeDislike.getLikeCountAnimationParams()))
                        .build();
                VideoActionBarItemContent minimalDislikeButton = VideoActionBarItemContent.newBuilder()
                        .setDislikeButton(dislikeButton.toBuilder()
                                .setToggleButtonViewModel(
                                        layoutToggleButton(dislikeButton.getToggleButtonViewModel(), true)))
                        .build();
                builder
                        .addActions(VideoActionBarItem.newBuilder().setContent(minimalLikeButton))
                        .addActions(VideoActionBarItem.newBuilder().setContent(minimalDislikeButton));
                overflow.addShownItems(minimalLikeButton).addShownItems(minimalDislikeButton);
            } else if (content.hasSaveButton()) {
                AddToPlaylistButtonViewModel saveButton = content.getSaveButton();
                VideoActionBarItemContent minimalSaveButton = content.toBuilder()
                        .setSaveButton(saveButton.toBuilder()
                                .setToggleButtonViewModel(
                                        layoutToggleButton(saveButton.getToggleButtonViewModel(), true)))
                        .build();
                builder.addActions(action.toBuilder().setContent(minimalSaveButton));
                overflow.addShownItems(minimalSaveButton);
            } else if (SHARE_BUTTON_ID.equals(content.getButton().getTargetId())) {
                VideoActionBarItemContent minimalShareButton = content.toBuilder()
                        .setButton(layoutButton(content.getButton(), true))
                        .build();
                builder.addActions(action.toBuilder().setContent(minimalShareButton));
                overflow.addShownItems(minimalShareButton);
            } else {
                overflow.addMenuItems(content);
            }
        }

        if (overflow.getMenuItemsCount() > 0) {
            overflow.setMenuButton(ButtonViewModelHolder.newBuilder()
                            .setButtonViewModel(layoutButton(ButtonViewModel.newBuilder()
                                    .setIconName(OVERFLOW_BUTTON_ICON)
                                    .setAccessibilityText(moreActionsText)
                                    .build(), true)))
                    .setMenuStyle(1);
            builder.addActions(VideoActionBarItem.newBuilder()
                    .setContent(VideoActionBarItemContent.newBuilder().setOverflow(overflow)));
        }

        builder.setSize(MINIMAL_LAYOUT_SIZE);
        return builder;
    }

    private static VideoActionBarViewModel.Builder toClassic(VideoActionBarViewModel actionBar)
            throws com.google.protobuf.InvalidProtocolBufferException {
        VideoActionBarViewModel.Builder builder = actionBar.toBuilder().clearActions();
        // The subscribe button is the first item of the classic layout.
        if (actionBar.hasSubscribeButton()) {
            builder.addActions(VideoActionBarItem.newBuilder().setContent(actionBar.getSubscribeButton()));
        }

        // The items of the minimal layout have no text, but the same items in its overflow have.
        VideoActionBarOverflow overflow = VideoActionBarOverflow.getDefaultInstance();
        for (VideoActionBarItem action : actionBar.getActionsList()) {
            if (action.getContent().hasOverflow()) {
                overflow = action.getContent().getOverflow();
            }
        }
        VideoActionBarItemContent shownLikeButton = VideoActionBarItemContent.getDefaultInstance();
        VideoActionBarItemContent shownDislikeButton = VideoActionBarItemContent.getDefaultInstance();
        VideoActionBarItemContent shownSaveButton = VideoActionBarItemContent.getDefaultInstance();
        for (VideoActionBarItemContent content : overflow.getShownItemsList()) {
            if (content.hasLikeButton()) {
                shownLikeButton = content;
            } else if (content.hasDislikeButton()) {
                shownDislikeButton = content;
            } else if (content.hasSaveButton()) {
                shownSaveButton = content;
            }
        }

        LikeButtonViewModel likeButton = LikeButtonViewModel.getDefaultInstance();
        for (VideoActionBarItem action : actionBar.getActionsList()) {
            VideoActionBarItemContent content = action.getContent();
            if (content.hasLikeButton()) {
                likeButton = content.getLikeButton();
            } else if (content.hasDislikeButton()) {
                builder.addActions(VideoActionBarItem.newBuilder().setContent(joinLikeDislike(
                        likeButton, content.getDislikeButton(), shownLikeButton, shownDislikeButton)));
            } else if (content.hasSaveButton()) {
                ToggleButtonViewModelHolder saveToggleButton = shownSaveButton.hasSaveButton()
                        ? shownSaveButton.getSaveButton().getToggleButtonViewModel()
                        : content.getSaveButton().getToggleButtonViewModel();
                builder.addActions(action.toBuilder().setContent(content.toBuilder()
                        .setSaveButton(content.getSaveButton().toBuilder()
                                .setToggleButtonViewModel(layoutToggleButton(saveToggleButton, false)))));
            } else if (SHARE_BUTTON_ID.equals(content.getButton().getTargetId())) {
                builder.addActions(action.toBuilder().setContent(content.toBuilder()
                        .setButton(layoutButton(content.getButton(), false))));
            }
        }

        // The items of the menu of the minimal layout are in the row of the classic layout.
        for (VideoActionBarItemContent content : overflow.getMenuItemsList()) {
            if (content.hasDownloadButton()) {
                builder.addActions(VideoActionBarItem.newBuilder().setContent(content.toBuilder()
                        .setDownloadButton(content.getDownloadButton().toBuilder()
                                .setStyle(CLASSIC_DOWNLOAD_BUTTON_STYLE)
                                .clearPremiumOfferText())));
            } else if (content.hasButton()) {
                builder.addActions(VideoActionBarItem.newBuilder().setContent(content.toBuilder()
                        .setButton(layoutButton(content.getButton(), false))));
            } else if (!content.hasMenuHeader()) {
                // Clip, Connect and other action models keep their commands and unknown fields.
                builder.addActions(VideoActionBarItem.newBuilder().setContent(content));
            }
        }

        builder.clearSubscribeButton().clearSize();
        return builder;
    }

    private static VideoActionBarItemContent joinLikeDislike(LikeButtonViewModel likeButton,
            DislikeButtonViewModel dislikeButton, VideoActionBarItemContent shownLikeButton,
            VideoActionBarItemContent shownDislikeButton) throws com.google.protobuf.InvalidProtocolBufferException {
        // The count of the likes is an entity of the video, with the key of the like status of another type.
        LikeStatusEntityKey likeKey = LikeStatusEntityKey.parseFrom(Base64.getUrlDecoder().decode(
                likeButton.getLikeStatusEntityKey().replace("%3D", "=")));
        String likeCountKey = Base64.getUrlEncoder().encodeToString(
                        likeKey.toBuilder().setEntityType(LIKE_COUNT_ENTITY_TYPE).build().toByteArray())
                .replace("=", "%3D");

        ToggleButtonViewModelHolder likeToggleButton = shownLikeButton.hasLikeButton()
                ? shownLikeButton.getLikeButton().getToggleButtonViewModel()
                : likeButton.getToggleButtonViewModel();
        ToggleButtonViewModelHolder dislikeToggleButton = shownDislikeButton.hasDislikeButton()
                ? shownDislikeButton.getDislikeButton().getToggleButtonViewModel()
                : dislikeButton.getToggleButtonViewModel();
        return VideoActionBarItemContent.newBuilder().setLikeDislikeButtons(VideoActionBarLikeDislike.newBuilder()
                                .setLikeButton(VideoActionBarItemContent.newBuilder()
                                        .setLikeButton(likeButton.toBuilder()
                                                .setToggleButtonViewModel(layoutToggleButton(likeToggleButton, false))
                                                .clearAnimationEnabled1()
                                                .clearAnimationEnabled2()
                                                .clearAnimationEnabled3()
                                                .clearLikeAnimationUrl()
                                                .clearLikedAnimationUrl()
                                                .clearLikeCountAnimationParams()))
                                .setDislikeButton(VideoActionBarItemContent.newBuilder()
                                        .setDislikeButton(dislikeButton.toBuilder()
                                                .setToggleButtonViewModel(
                                        layoutToggleButton(dislikeToggleButton, false))))
                                .setShowLikeCount(true)
                                .setLikeCount(VideoActionBarLikeCount.newBuilder().setEntityKey(likeCountKey))
                                .setLikeCountAnimationParams(likeButton.getLikeCountAnimationParams())
                                .setAnimationEnabled1(true)
                                .setAnimationEnabled2(true)
                                .setLikeAnimationUrl(likeButton.getLikeAnimationUrl())
                                .setLikedAnimationUrl(likeButton.getLikedAnimationUrl())).build();
    }

    private static Element withActionBar(Element element, ComponentType componentType,
                                         LockupModel lockupModel, VideoActionBarViewModel actionBar) {
        return element.toBuilder()
                .setType(element.getType().toBuilder()
                        .setComponentType(componentType.toBuilder()
                                .setModel(componentType.getModel().toBuilder()
                                        .setLockupModel(lockupModel.toBuilder()
                                                .setViewModel(lockupModel.getViewModel().toBuilder()
                                                        .setVideoActionBarViewModel(actionBar))))))
                .build();
    }

    /**
     * The buttons of the minimal layout have the text outside the button, below its icon.
     * The buttons of the classic layout have the text inside the button.
     */
    private static ButtonViewModel layoutButton(ButtonViewModel button, boolean minimal) {
        ButtonViewModel.Builder builder = button.toBuilder();
        if (minimal) {
            builder.clearTitle()
                    .setType(MINIMAL_BUTTON_TYPE)
                    .setButtonSize(MINIMAL_BUTTON_SIZE)
                    .setIconStyle(MINIMAL_BUTTON_ICON_STYLE);
        } else {
            // The share button of the classic layout has only its icon.
            if (SHARE_BUTTON_ID.equals(button.getTargetId())) {
                builder.clearTitle();
            }
            builder.clearIconStyle()
                    .setType(CLASSIC_BUTTON_TYPE)
                    .setButtonSize(CLASSIC_BUTTON_SIZE);
        }
        return builder.build();
    }

    private static ToggleButtonViewModelHolder layoutToggleButton(ToggleButtonViewModelHolder holder, boolean minimal) {
        ToggleButtonViewModel toggleButton = holder.getToggleButtonViewModel();
        return holder.toBuilder()
                .setToggleButtonViewModel(toggleButton.toBuilder()
                        .setDefaultButtonViewModel(toggleButton.getDefaultButtonViewModel().toBuilder()
                                .setButtonViewModel(layoutButton(
                                        toggleButton.getDefaultButtonViewModel().getButtonViewModel(), minimal)))
                        .setToggledButtonViewModel(toggleButton.getToggledButtonViewModel().toBuilder()
                                .setButtonViewModel(layoutButton(
                                        toggleButton.getToggledButtonViewModel().getButtonViewModel(), minimal))))
                .build();
    }
    /**
     * Injection point.
     * <p>
     * The channel and the buttons of the phone layouts are one element, so the row of each one is
     * another element of the section that the watch page shows, as on tablets.
     *
     * @return The section with the two rows, or null if the section does not change.
     */
    public static byte[] getTwoRowsSection(MessageLite section) {
        if (RuntimeLayout.LAYOUT != VideoActionBarLayout.CLASSIC_TWO_ROWS) {
            return null;
        }

        byte[] sectionBytes;
        try {
            sectionBytes = section.toByteArray();
        } catch (IllegalStateException ex) {
            // A section that 'Hide related videos' changed in place, which cannot be serialized.
            return null;
        }

        try {
            SecondaryContents contents = SecondaryContents.parseFrom(sectionBytes);
            if (!contents.hasSlimVideoMetadataSectionRenderer()) {
                return null;
            }

            SlimVideoMetadataSectionRenderer renderer = contents.getSlimVideoMetadataSectionRenderer();
            SlimVideoMetadataSectionRenderer.Builder newRenderer = renderer.toBuilder().clearTertiaryContents();
            boolean changed = false;
            for (TertiaryContents row : renderer.getTertiaryContentsList()) {
                byte[] bytes = row.getElementRenderer().getNewElement().toByteArray();
                if (!actionBarSearch.matches(bytes)) {
                    newRenderer.addTertiaryContents(row);
                    continue;
                }

                Element element = Element.parseFrom(rewriteElement(bytes, VideoActionBarLayout.CLASSIC_TWO_ROWS, ""));
                ComponentType componentType = element.getType().getComponentType();
                LockupModel lockupModel = componentType.getModel().getLockupModel();
                VideoActionBarViewModel actionBar = lockupModel.getViewModel().getVideoActionBarViewModel();
                // The response has no element of the channel bar, so its uri is taken from the template cache.
                String channelBarUri = RuntimeLayout.CHANNEL_BAR_TEMPLATE.getUri();
                if (channelBarUri == null || actionBar.getActionsCount() == 0
                        || !actionBar.getActions(0).getContent().hasSubscribeButton()) {
                    newRenderer.addTertiaryContents(row);
                    continue;
                }

                // The settings that hide the channel and its Subscribe button are applied to the new channel bar here.
                if (!Settings.HIDE_CHANNEL_PROFILE_BUTTON.get() && !Settings.HIDE_ACTION_BAR.get()) {
                    CompactChannelBarViewModel channel = CompactChannelBarViewModel.parseFrom(
                            actionBar.getActions(0).getContent().getSubscribeButton());
                    CompactChannelBarViewModel newChannel = channelRow(channel,
                            Settings.HIDE_CHANNEL_PROFILE_SUBSCRIBE_BUTTON.get());

                    SubscriptionConfig config = FeedCardLayoutPatch.subscriptionConfig(
                            componentType.getSubscriptionConfig(), RuntimeLayout.CHANNEL_BAR_TEMPLATE);
                    CompactChannelBarModel channelModel = CompactChannelBarModel.newBuilder()
                            .setContext(lockupModel.getContext())
                            .setSubscribeState(SubscribeState.newBuilder().setKey(channel.getSubscribeButton()
                                    .getSubscribeButtonViewModel().getStateEntityStoreKey()))
                            .setViewModel(CompactChannelBarViewModelHolder.newBuilder()
                                    .setCompactChannelBarViewModel(newChannel))
                            .setUseThemeFromContext(true)
                            .build();
                    EnvironmentSubscriptionConfig environment = EnvironmentSubscriptionConfig.newBuilder()
                            .setModelField(RuntimeLayout.CHANNEL_BAR_TEMPLATE.modelField)
                            .setResultField(CHANNEL_BAR_ENVIRONMENT_FIELD)
                            .build();
                    ComponentType.Builder channelComponent = ComponentType.newBuilder()
                            .setTemplateConfig(FeedCardLayoutPatch.templateConfig(channelBarUri))
                            .setModel(ElementModel.newBuilder().setCompactChannelBarModel(channelModel))
                            .setSubscriptionConfig(config.toBuilder().setEnvironmentSubscriptionConfig(environment));
                    Element channelElement = element.toBuilder()
                            .setProperties(element.getProperties().toBuilder().setIdentifierProperties(
                                    element.getProperties().getIdentifierProperties().toBuilder()
                                            .setIdentifier(channelBarUri)))
                            .setType(element.getType().toBuilder().setComponentType(channelComponent))
                            .build();
                    newRenderer.addTertiaryContents(elementRow(row, channelElement));
                }

                newRenderer.addTertiaryContents(elementRow(row,
                        withActionBar(element, componentType, lockupModel, buttonsRow(actionBar))));
                changed = true;
            }

            return changed
                    ? contents.toBuilder().setSlimVideoMetadataSectionRenderer(newRenderer).build().toByteArray()
                    : null;
        } catch (Exception ex) {
            Logger.printException(() -> "getTwoRowsSection failure", ex);
        }

        return null;
    }

    static CompactChannelBarViewModel channelRow(CompactChannelBarViewModel channel, boolean hideSubscribe) {
        CompactChannelBarViewModel.Builder builder = channel.toBuilder()
                .setChannelBarStyle(2)
                .setChannelBarHeader(channel.getChannelBarHeader().toBuilder()
                        .setChannelBarHeaderViewModel(channel.getChannelBarHeader()
                                .getChannelBarHeaderViewModel().toBuilder().clearStyle()));
        if (hideSubscribe) {
            builder.clearSubscribeButton();
        }
        return builder.build();
    }

    static VideoActionBarViewModel buttonsRow(VideoActionBarViewModel actionBar) {
        VideoActionBarViewModel.Builder buttons = actionBar.toBuilder().clearActions();
        for (int index = 1; index < actionBar.getActionsCount(); index++) {
            VideoActionBarItem action = actionBar.getActions(index);
            VideoActionBarItemContent content = action.getContent();
            // Without the channel, Share has enough room for its title.
            buttons.addActions(SHARE_BUTTON_ID.equals(content.getButton().getTargetId())
                    ? action.toBuilder().setContent(content.toBuilder().setButton(content.getButton().toBuilder()
                            .setTitle(content.getButton().getAccessibilityText()))).build()
                    : action);
        }
        return buttons.setLayoutConfig(actionBar.getLayoutConfig().toBuilder()
                .clearEnableMarginStartAdjustment()).build();
    }

    private static TertiaryContents elementRow(TertiaryContents row, Element element)
            throws InvalidProtocolBufferException {
        return row.toBuilder()
                .setElementRenderer(row.getElementRenderer().toBuilder()
                        .setNewElement(NewElement.parseFrom(element.toByteArray())))
                .build();
    }

}
