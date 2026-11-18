/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-17
 */
package app.morphe.extension.youtube.patches.player;

import static org.junit.Assert.*;
import static app.morphe.extension.youtube.patches.player.VideoActionBarLayout.*;

import com.google.protobuf.ByteString;
import org.junit.Test;
import java.util.Base64;
import java.io.ByteArrayOutputStream;
import java.util.List;
import com.google.protobuf.CodedOutputStream;
import app.morphe.extension.youtube.patches.utils.ProtoNode;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.*;

public class VideoActionBarLayoutPatchTest {
    private static byte[] field(int number, byte[] value) throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        CodedOutputStream output = CodedOutputStream.newInstance(bytes);
        output.writeByteArray(number, value);
        output.flush();
        return bytes.toByteArray();
    }

    @Test
    public void subtitleCommandRemovalPreservesTextAndUnrelatedFields() throws Exception {
        ByteArrayOutputStream channel = new ByteArrayOutputStream();
        CodedOutputStream output = CodedOutputStream.newInstance(channel);
        output.writeString(1, "channel name");
        output.writeString(5, "first command");
        output.writeString(5, "second command");
        output.flush();
        int[] path = {1, 168777401, 5, 377581260, 6, 1019, 17, 1017, 1};
        byte[] payload = channel.toByteArray();
        for (int index = path.length - 1; index >= 0; index--) {
            payload = field(path[index], payload);
        }
        ByteArrayOutputStream element = new ByteArrayOutputStream();
        element.write(payload);
        output = CodedOutputStream.newInstance(element);
        output.writeString(123, "video_metadata.eml");
        output.writeInt32(124, 42);
        output.flush();
        byte[] original = element.toByteArray();
        byte[] rewritten = VideoActionBarLayoutPatch.removeSubtitleChannelCommand(original);
        List<ProtoNode> parsed = ProtoNode.parse(rewritten);
        List<ProtoNode> name = ProtoNode.message(parsed, path);
        assertNull(ProtoNode.field(name, 5));
        assertEquals("channel name", ProtoNode.field(name, 1).getText());
        assertEquals(42L, ProtoNode.field(parsed, 124).getVarint().longValue());
        assertSame(rewritten, VideoActionBarLayoutPatch.removeSubtitleChannelCommand(rewritten));
        byte[] unrelated = field(123, "lockup.eml".getBytes(java.nio.charset.StandardCharsets.UTF_8));
        assertSame(unrelated, VideoActionBarLayoutPatch.removeSubtitleChannelCommand(unrelated));
    }

    private static ButtonViewModel button(String id, String title) {
        return ButtonViewModel.newBuilder().setTargetId(id).setTitle(title)
                .setAccessibilityText(title).setIconName(id + "-icon").setType(5).setButtonSize(2).build();
    }

    private static ToggleButtonViewModelHolder toggle(String id) {
        ButtonViewModelHolder button = ButtonViewModelHolder.newBuilder()
                .setButtonViewModel(button(id, id)).build();
        return ToggleButtonViewModelHolder.newBuilder().setToggleButtonViewModel(ToggleButtonViewModel.newBuilder()
                .setDefaultButtonViewModel(button).setToggledButtonViewModel(button)).build();
    }

    private static VideoActionBarViewModel classic() {
        String key = Base64.getUrlEncoder().encodeToString(LikeStatusEntityKey.newBuilder()
                .setVideoId("abcdefghijk").setEntityType(123).setVersion(1).build().toByteArray());
        VideoActionBarLikeDislike likes = VideoActionBarLikeDislike.newBuilder()
                .setLikeButton(VideoActionBarItemContent.newBuilder().setLikeButton(LikeButtonViewModel.newBuilder()
                        .setLikeStatusEntityKey(key).setToggleButtonViewModel(toggle("like"))))
                .setDislikeButton(VideoActionBarItemContent.newBuilder().setDislikeButton(DislikeButtonViewModel.newBuilder()
                        .setToggleButtonViewModel(toggle("dislike"))))
                .setLikeAnimationUrl("like-animation").build();
        return VideoActionBarViewModel.newBuilder().setLayoutStyle(4)
                .addActions(item(VideoActionBarItemContent.newBuilder().setSubscribeButton(ByteString.EMPTY)))
                .addActions(item(VideoActionBarItemContent.newBuilder().setLikeDislikeButtons(likes)))
                .addActions(item(VideoActionBarItemContent.newBuilder().setButton(button("id.video.share.button", "Share"))))
                .addActions(item(VideoActionBarItemContent.newBuilder().setSaveButton(AddToPlaylistButtonViewModel.newBuilder()
                        .setToggleButtonViewModel(toggle("save")))))
                .addActions(item(VideoActionBarItemContent.newBuilder().setDownloadButton(VideoActionBarDownloadButton
                        .newBuilder().setStyle(4))))
                .build();
    }

    private static VideoActionBarItem item(VideoActionBarItemContent.Builder content) {
        return VideoActionBarItem.newBuilder().setContent(content).build();
    }

    @Test
    public void convertsClassicIntoMinimalAndItsOverflow() throws Exception {
        VideoActionBarViewModel minimal = VideoActionBarLayoutPatch.convertActionBar(classic(), MINIMAL, "More actions");
        assertEquals(6, minimal.getLayoutStyle());
        assertTrue(minimal.hasSubscribeButton());
        assertEquals(5, minimal.getActionsCount());
        assertTrue(minimal.getLayoutConfig().getIconButtons());
        assertEquals(5, minimal.getSize().getMaxVisibleButtons());
        LikeButtonViewModel like = minimal.getActions(0).getContent().getLikeButton();
        assertTrue(like.getAnimationEnabled1());
        assertEquals("like-animation", like.getLikeAnimationUrl());
        ButtonViewModel likeButton = like.getToggleButtonViewModel().getToggleButtonViewModel()
                .getDefaultButtonViewModel().getButtonViewModel();
        assertEquals(3, likeButton.getType());
        assertEquals(4, likeButton.getButtonSize());
        assertEquals("", likeButton.getTitle());
        VideoActionBarOverflow overflow = minimal.getActions(4).getContent().getOverflow();
        assertEquals(4, overflow.getShownItemsCount());
        assertEquals(1, overflow.getMenuItemsCount());
        assertTrue(overflow.getMenuItems(0).hasDownloadButton());
        assertEquals("More actions", overflow.getMenuButton().getButtonViewModel().getAccessibilityText());
    }

    @Test
    public void restoresClassicButtonsAndLikeEntityFromMinimal() throws Exception {
        VideoActionBarViewModel minimal = VideoActionBarLayoutPatch.convertActionBar(classic(), MINIMAL, "More");
        VideoActionBarViewModel restored = VideoActionBarLayoutPatch.convertActionBar(minimal, CLASSIC, "");
        assertEquals(4, restored.getLayoutStyle());
        assertEquals(5, restored.getActionsCount());
        assertTrue(restored.getActions(0).getContent().hasSubscribeButton());
        assertFalse(restored.hasSubscribeButton());
        assertFalse(restored.hasSize());
        VideoActionBarLikeDislike likes = restored.getActions(1).getContent().getLikeDislikeButtons();
        assertTrue(likes.getShowLikeCount());
        LikeStatusEntityKey key = LikeStatusEntityKey.parseFrom(Base64.getUrlDecoder().decode(
                likes.getLikeCount().getEntityKey().replace("%3D", "=")));
        assertEquals(445, key.getEntityType());
        assertEquals("abcdefghijk", key.getVideoId());
        assertEquals("", restored.getActions(2).getContent().getButton().getTitle());
        assertEquals(4, restored.getActions(4).getContent().getDownloadButton().getStyle());
        assertEquals(restored, VideoActionBarLayoutPatch.convertActionBar(minimal, CLASSIC_TWO_ROWS, ""));
    }

    private static VideoActionBarViewModel withDislikeToggle(ToggleButtonViewModel toggle) {
        VideoActionBarViewModel original = classic();
        VideoActionBarItem action = original.getActions(1);
        VideoActionBarLikeDislike segmented = action.getContent().getLikeDislikeButtons();
        VideoActionBarItemContent dislike = segmented.getDislikeButton();
        return original.toBuilder().setActions(1, action.toBuilder().setContent(action.getContent().toBuilder()
                .setLikeDislikeButtons(segmented.toBuilder().setDislikeButton(dislike.toBuilder()
                        .setDislikeButton(dislike.getDislikeButton().toBuilder()
                                .setToggleButtonViewModel(ToggleButtonViewModelHolder.newBuilder()
                                        .setToggleButtonViewModel(toggle))))))).build();
    }

    private static ToggleButtonViewModel dislikeToggle(VideoActionBarViewModel actionBar) {
        return actionBar.getActions(1).getContent().getLikeDislikeButtons().getDislikeButton()
                .getDislikeButton().getToggleButtonViewModel().getToggleButtonViewModel();
    }

    private static void assertDislikeIcons(ToggleButtonViewModel toggle) {
        assertEquals("yt_outline_experimental_thumb_down_black_24",
                toggle.getDefaultButtonViewModel().getButtonViewModel().getIconName());
        assertEquals("yt_fill_experimental_thumb_down_black_24",
                toggle.getToggledButtonViewModel().getButtonViewModel().getIconName());
    }

    @Test
    public void replacesModernClassicDislikeIconsWithoutReplacingTextCommandsOrOtherFields() throws Exception {
        ButtonViewModel imageButton = ButtonViewModel.parseFrom(field(998, new byte[]{1}))
                .toBuilder().mergeFrom(button("id.video.dislike.button", "Dislike").toBuilder()
                        .setYticonImage(ByteString.copyFrom(field(1, new byte[0])))
                        .setStyle(2).setState(1).build())
                .setOnTap(InnertubeCommandHolder.newBuilder().setInnertubeCommand(InnertubeCommand.newBuilder()
                        .setLikeEndpoint(LikeEndpoint.newBuilder().setStatus(2)))).build();
        ButtonViewModelHolder holder = ButtonViewModelHolder.newBuilder().setButtonViewModel(imageButton).build();
        VideoActionBarViewModel original = withDislikeToggle(ToggleButtonViewModel.newBuilder()
                .setDefaultButtonViewModel(holder).setToggledButtonViewModel(holder).setIdentifier("vote").build());

        for (VideoActionBarLayout layout : new VideoActionBarLayout[]{CLASSIC, CLASSIC_TWO_ROWS}) {
            VideoActionBarViewModel restored = VideoActionBarLayoutPatch.convertActionBar(original, layout, "");
            ToggleButtonViewModel toggle = dislikeToggle(restored);
            assertDislikeIcons(toggle);
            assertEquals("vote", toggle.getIdentifier());
            assertEquals(imageButton.toBuilder().clearYticonImage().build(),
                    toggle.getDefaultButtonViewModel().getButtonViewModel().toBuilder().clearIconName().build());
            assertEquals(imageButton.toBuilder().clearYticonImage().build(),
                    toggle.getToggledButtonViewModel().getButtonViewModel().toBuilder().clearIconName().build());
            assertTrue(imageButton.hasYticonImage());
            assertFalse(toggle.getDefaultButtonViewModel().getButtonViewModel().hasYticonImage());
            assertFalse(toggle.getToggledButtonViewModel().getButtonViewModel().hasYticonImage());
            assertEquals(original.getActions(1).getContent().getLikeDislikeButtons().getLikeButton(),
                    restored.getActions(1).getContent().getLikeDislikeButtons().getLikeButton());
            assertSame(restored, VideoActionBarLayoutPatch.convertActionBar(restored, layout, ""));
        }
        assertSame(original, VideoActionBarLayoutPatch.convertActionBar(original, DEFAULT, ""));
    }

    @Test
    public void restoresMissingDislikeIconsWhenJoiningMinimalButtons() throws Exception {
        ButtonViewModelHolder holder = ButtonViewModelHolder.newBuilder()
                .setButtonViewModel(button("dislike", "Dislike").toBuilder().clearIconName()).build();
        VideoActionBarViewModel original = withDislikeToggle(ToggleButtonViewModel.newBuilder()
                .setDefaultButtonViewModel(holder).setToggledButtonViewModel(holder).build());
        VideoActionBarViewModel minimal = VideoActionBarLayoutPatch.convertActionBar(original, MINIMAL, "More");

        for (VideoActionBarLayout layout : new VideoActionBarLayout[]{CLASSIC, CLASSIC_TWO_ROWS}) {
            assertDislikeIcons(dislikeToggle(VideoActionBarLayoutPatch.convertActionBar(minimal, layout, "")));
        }
        assertSame(minimal, VideoActionBarLayoutPatch.convertActionBar(minimal, MINIMAL, ""));
        assertEquals("", minimal.getActions(1).getContent().getDislikeButton().getToggleButtonViewModel()
                .getToggleButtonViewModel().getDefaultButtonViewModel().getButtonViewModel().getIconName());
    }

    @Test
    public void preservesExistingIconNamesAndRepairsOnlyTheMissingVoteState() throws Exception {
        ToggleButtonViewModel originalToggle = dislikeToggle(classic());
        VideoActionBarViewModel original = withDislikeToggle(originalToggle.toBuilder()
                .setToggledButtonViewModel(originalToggle.getToggledButtonViewModel().toBuilder()
                        .setButtonViewModel(originalToggle.getToggledButtonViewModel().getButtonViewModel()
                                .toBuilder().clearIconName())).build());

        for (VideoActionBarLayout layout : new VideoActionBarLayout[]{CLASSIC, CLASSIC_TWO_ROWS}) {
            ToggleButtonViewModel restored = dislikeToggle(VideoActionBarLayoutPatch.convertActionBar(
                    original, layout, ""));
            assertEquals(originalToggle.getDefaultButtonViewModel(), restored.getDefaultButtonViewModel());
            assertEquals("yt_fill_experimental_thumb_down_black_24",
                    restored.getToggledButtonViewModel().getButtonViewModel().getIconName());
        }
    }

    @Test
    public void modernizesServerLegacyDislikeIconsInBothClassicLayouts() throws Exception {
        ButtonViewModel defaultButton = button("id.video.dislike.button", "Dislike").toBuilder()
                .setIconName("yt_outline_thumb_down_black_24").build();
        ButtonViewModel toggledButton = defaultButton.toBuilder().setIconName("yt_fill_thumb_down_black_24").build();
        VideoActionBarViewModel original = withDislikeToggle(ToggleButtonViewModel.newBuilder()
                .setDefaultButtonViewModel(ButtonViewModelHolder.newBuilder().setButtonViewModel(defaultButton))
                .setToggledButtonViewModel(ButtonViewModelHolder.newBuilder().setButtonViewModel(toggledButton))
                .setIdentifier("vote").build());
        VideoActionBarViewModel minimal = VideoActionBarLayoutPatch.convertActionBar(original, MINIMAL, "More");

        for (VideoActionBarLayout layout : new VideoActionBarLayout[]{CLASSIC, CLASSIC_TWO_ROWS}) {
            for (VideoActionBarViewModel source : new VideoActionBarViewModel[]{original, minimal}) {
                // Converting to Minimal moves text out of the button before this repair runs.
                ButtonViewModel expectedDefault = source == original
                        ? defaultButton : defaultButton.toBuilder().clearTitle().build();
                ButtonViewModel expectedToggled = source == original
                        ? toggledButton : toggledButton.toBuilder().clearTitle().build();
                VideoActionBarViewModel restored = VideoActionBarLayoutPatch.convertActionBar(source, layout, "");
                ToggleButtonViewModel toggle = dislikeToggle(restored);
                assertDislikeIcons(toggle);
                assertEquals("vote", toggle.getIdentifier());
                assertEquals(expectedDefault.toBuilder().clearIconName().build(),
                        toggle.getDefaultButtonViewModel().getButtonViewModel().toBuilder().clearIconName().build());
                assertEquals(expectedToggled.toBuilder().clearIconName().build(),
                        toggle.getToggledButtonViewModel().getButtonViewModel().toBuilder().clearIconName().build());
                assertSame(restored, VideoActionBarLayoutPatch.convertActionBar(restored, layout, ""));
            }
        }
        assertSame(original, VideoActionBarLayoutPatch.convertActionBar(original, DEFAULT, ""));
        assertSame(minimal, VideoActionBarLayoutPatch.convertActionBar(minimal, MINIMAL, ""));
        assertEquals("yt_outline_thumb_down_black_24", minimal.getActions(1).getContent().getDislikeButton()
                .getToggleButtonViewModel().getToggleButtonViewModel().getDefaultButtonViewModel()
                .getButtonViewModel().getIconName());
    }

    @Test
    public void preservesDefaultUnknownAndAlreadySelectedStyles() throws Exception {
        VideoActionBarViewModel classic = classic();
        assertSame(classic, VideoActionBarLayoutPatch.convertActionBar(classic, DEFAULT, ""));
        assertSame(classic, VideoActionBarLayoutPatch.convertActionBar(classic, CLASSIC, ""));
        VideoActionBarViewModel unknown = classic.toBuilder().setLayoutStyle(99).build();
        assertSame(unknown, VideoActionBarLayoutPatch.convertActionBar(unknown, MINIMAL, ""));
        byte[] otherElement = Element.newBuilder().setType(ElementType.newBuilder().setComponentType(
                ComponentType.newBuilder().setTemplateConfig(TemplateConfig.newBuilder().setUriTemplateConfig(
                        UriTemplateConfig.newBuilder().setUri("lockup.eml"))))).build().toByteArray();
        assertSame(otherElement, VideoActionBarLayoutPatch.rewriteElement(otherElement, MINIMAL, ""));
    }

    @Test
    public void rewritesOnlyActionBarModelAndRetainsElementContext() throws Exception {
        Element element = Element.newBuilder().setType(ElementType.newBuilder().setComponentType(
                ComponentType.newBuilder().setTemplateConfig(TemplateConfig.newBuilder().setUriTemplateConfig(
                        UriTemplateConfig.newBuilder().setUri("compactify_video_action_bar.eml")))
                        .setModel(ElementModel.newBuilder().setLockupModel(LockupModel.newBuilder()
                                .setTheme(ByteString.copyFromUtf8("theme"))
                                .setViewModel(LockupViewModelHolder.newBuilder().setVideoActionBarViewModel(classic()))))))
                .build();
        Element rewritten = Element.parseFrom(VideoActionBarLayoutPatch.rewriteElement(element.toByteArray(), MINIMAL, ""));
        LockupModel model = rewritten.getType().getComponentType().getModel().getLockupModel();
        assertEquals(ByteString.copyFromUtf8("theme"), model.getTheme());
        assertEquals(6, model.getViewModel().getVideoActionBarViewModel().getLayoutStyle());
        assertEquals(element.getType().getComponentType().getTemplateConfig(),
                rewritten.getType().getComponentType().getTemplateConfig());
    }

    @Test
    public void splitsChannelFromButtonsAndLabelsShare() {
        VideoActionBarViewModel original = classic().toBuilder().setLayoutConfig(
                VideoActionBarLayoutConfig.newBuilder().setEnableMarginStartAdjustment(true)).build();
        VideoActionBarViewModel buttons = VideoActionBarLayoutPatch.buttonsRow(original);
        assertEquals(original.getActionsCount() - 1, buttons.getActionsCount());
        assertEquals(original.getActions(1), buttons.getActions(0));
        assertFalse(buttons.getLayoutConfig().getEnableMarginStartAdjustment());
        assertEquals("Share", buttons.getActions(1).getContent().getButton().getTitle());
        assertEquals(original.getActions(3), buttons.getActions(2));
        assertEquals(5, original.getActionsCount());
    }

    @Test
    public void channelRowResetsHeaderStyleAndCanHideOnlySubscribe() {
        CompactChannelBarViewModel channel = CompactChannelBarViewModel.newBuilder()
                .setChannelBarStyle(1)
                .setChannelBarHeader(ChannelBarHeaderViewModelHolder.newBuilder().setChannelBarHeaderViewModel(
                        ChannelBarHeaderViewModel.newBuilder().setStyle(7)))
                .setSubscribeButton(SubscribeButtonViewModelHolder.newBuilder().setSubscribeButtonViewModel(
                        SubscribeButtonViewModel.newBuilder().setStateEntityStoreKey("subscription")))
                .build();
        CompactChannelBarViewModel visible = VideoActionBarLayoutPatch.channelRow(channel, false);
        assertEquals(2, visible.getChannelBarStyle());
        assertEquals(0, visible.getChannelBarHeader().getChannelBarHeaderViewModel().getStyle());
        assertEquals(channel.getSubscribeButton(), visible.getSubscribeButton());
        CompactChannelBarViewModel hidden = VideoActionBarLayoutPatch.channelRow(channel, true);
        assertFalse(hidden.hasSubscribeButton());
        assertEquals(visible.getChannelBarHeader(), hidden.getChannelBarHeader());
        assertTrue(channel.hasSubscribeButton());
    }

    private static void assertClassicRoundTripRetains(VideoActionBarItemContent content) throws Exception {
        VideoActionBarViewModel original = classic().toBuilder()
                .addActions(VideoActionBarItem.newBuilder().setContent(content)).build();
        VideoActionBarViewModel minimal = VideoActionBarLayoutPatch.convertActionBar(original, MINIMAL, "More");
        VideoActionBarOverflow overflow = minimal.getActions(minimal.getActionsCount() - 1).getContent().getOverflow();
        assertEquals(content, overflow.getMenuItems(overflow.getMenuItemsCount() - 1));

        for (VideoActionBarLayout layout : new VideoActionBarLayout[]{CLASSIC, CLASSIC_TWO_ROWS}) {
            VideoActionBarViewModel restored = VideoActionBarLayoutPatch.convertActionBar(minimal, layout, "");
            assertEquals(original.getActionsCount(), restored.getActionsCount());
            assertEquals(content, restored.getActions(restored.getActionsCount() - 1).getContent());
        }
    }

    @Test
    public void classicLayoutsRetainClipFromMinimalOverflow() throws Exception {
        ByteString clip = app.morphe.extension.youtube.innertube.NextResponseOuterClass.ClipButtonViewModel
                .newBuilder().setVideoActionButtonEnablementEntityKey("clip-enabled").build().toByteString();
        assertClassicRoundTripRetains(VideoActionBarItemContent.newBuilder().setClipButton(clip).build());
    }

    @Test
    public void classicLayoutsRetainConnectFromMinimalOverflow() throws Exception {
        ByteString connect = app.morphe.extension.youtube.innertube.NextResponseOuterClass.AccountLinkButtonViewModel
                .newBuilder().setAccountLinkStatusEntityKey("partnership").build().toByteString();
        assertClassicRoundTripRetains(VideoActionBarItemContent.newBuilder().setAccountLinkButton(connect).build());
    }

    @Test
    public void classicLayoutsRetainOtherOverflowModelsButNotMenuHeaders() throws Exception {
        // The remaining PrimaryButtonViewModel oneof arms, besides generic, download, Clip and Connect.
        VideoActionBarItemContent[] contents = {
                VideoActionBarItemContent.newBuilder().setSaveButton(
                        AddToPlaylistButtonViewModel.getDefaultInstance()).build(),
                VideoActionBarItemContent.newBuilder().setSubscribeButton(ByteString.EMPTY).build(),
                VideoActionBarItemContent.newBuilder().setLikeButton(LikeButtonViewModel.getDefaultInstance()).build(),
                VideoActionBarItemContent.newBuilder().setDislikeButton(
                        DislikeButtonViewModel.getDefaultInstance()).build(),
                VideoActionBarItemContent.newBuilder().setOverflow(VideoActionBarOverflow.getDefaultInstance()).build(),
                VideoActionBarItemContent.newBuilder().setLikeDislikeButtons(
                        VideoActionBarLikeDislike.getDefaultInstance()).build()
        };
        VideoActionBarOverflow.Builder overflow = VideoActionBarOverflow.newBuilder()
                .addMenuItems(VideoActionBarItemContent.newBuilder().setMenuHeader(ByteString.EMPTY));
        for (VideoActionBarItemContent content : contents) {
            overflow.addMenuItems(content);
        }
        VideoActionBarViewModel minimal = VideoActionBarViewModel.newBuilder().setLayoutStyle(6)
                .addActions(item(VideoActionBarItemContent.newBuilder().setOverflow(overflow))).build();

        for (VideoActionBarLayout layout : new VideoActionBarLayout[]{CLASSIC, CLASSIC_TWO_ROWS}) {
            VideoActionBarViewModel converted = VideoActionBarLayoutPatch.convertActionBar(minimal, layout, "");
            assertEquals(contents.length, converted.getActionsCount());
            for (int index = 0; index < contents.length; index++) {
                assertEquals(contents[index], converted.getActions(index).getContent());
            }
        }
    }
}
