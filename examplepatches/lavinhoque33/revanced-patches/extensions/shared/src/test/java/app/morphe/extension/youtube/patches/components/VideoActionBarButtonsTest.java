/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-06.
 */
package app.morphe.extension.youtube.patches.components;

import static org.junit.Assert.*;
import static app.morphe.extension.youtube.patches.components.VideoActionBarButtons.ActionButton.*;

import java.io.ByteArrayOutputStream;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.junit.Test;
import com.google.protobuf.ByteString;
import com.google.protobuf.CodedInputStream;
import com.google.protobuf.CodedOutputStream;
import com.google.protobuf.WireFormat;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.*;
import app.morphe.extension.youtube.patches.components.VideoActionBarButtons.ActionButton;

public class VideoActionBarButtonsTest {
    private static VideoActionBarItemContent icon(String name) {
        return VideoActionBarItemContent.newBuilder().setButton(ButtonViewModel.newBuilder().setIconName(name)).build();
    }

    private static VideoActionBarItem item(VideoActionBarItemContent content) {
        return VideoActionBarItem.newBuilder().setContent(content).build();
    }

    private static Map<ActionButton, VideoActionBarItemContent> contentTypes() {
        Map<ActionButton, VideoActionBarItemContent> types = new LinkedHashMap<>();
        types.put(LIKE_DISLIKE, VideoActionBarItemContent.newBuilder().setLikeDislikeButtons(
                VideoActionBarLikeDislike.getDefaultInstance()).build());
        types.put(LIKE, VideoActionBarItemContent.newBuilder().setLikeButton(
                LikeButtonViewModel.getDefaultInstance()).build());
        types.put(DISLIKE, VideoActionBarItemContent.newBuilder().setDislikeButton(
                DislikeButtonViewModel.getDefaultInstance()).build());
        types.put(PLAYLIST, VideoActionBarItemContent.newBuilder().setSaveButton(
                AddToPlaylistButtonViewModel.getDefaultInstance()).build());
        types.put(DOWNLOAD, VideoActionBarItemContent.newBuilder().setDownloadButton(
                VideoActionBarDownloadButton.getDefaultInstance()).build());
        types.put(CLIP, VideoActionBarItemContent.newBuilder().setClipButton(ByteString.EMPTY).build());
        types.put(CONNECT, VideoActionBarItemContent.newBuilder().setAccountLinkButton(ByteString.EMPTY).build());
        types.put(CHANNEL_PROFILE, VideoActionBarItemContent.newBuilder().setSubscribeButton(ByteString.EMPTY).build());
        return types;
    }

    @Test
    public void selectsEachProtoButtonTypeIndependently() {
        for (Map.Entry<ActionButton, VideoActionBarItemContent> type : contentTypes().entrySet()) {
            assertEquals(type.getKey(), VideoActionBarButtons.classify(type.getValue()));
            assertTrue(VideoActionBarButtons.isHidden(type.getValue(), EnumSet.of(type.getKey())));
            assertFalse(VideoActionBarButtons.isHidden(type.getValue(), EnumSet.of(THANKS)));
        }
        // The fork's individual switches target standalone buttons, not the segmented pill.
        assertFalse(VideoActionBarButtons.isHidden(contentTypes().get(LIKE_DISLIKE), EnumSet.of(LIKE, DISLIKE)));
    }

    @Test
    public void recognizesForkAndMorpheIconVariantsButKeepsUnknownIcons() {
        String[] icons = {"yt_fill_spark", "yt_outline_message_bubble_right", "yt_outline_star_shooting",
                "yt_outline_megaphone", "yt_outline_experimental_remix", "yt_outline_flag",
                "yt_outline_account_link", "yt_outline_share", "yt_outline_bag",
                "yt_outline_slash_circle_left", "yt_outline_dollar_sign_heart"};
        ActionButton[] expected = {ASK, COMMENTS, HYPE, PROMOTE, REMIX, REPORT, REWARDS, SHARE, SHOP, STOP_ADS, THANKS};
        for (int index = 0; index < icons.length; index++) {
            assertEquals(expected[index], VideoActionBarButtons.classify(icon(icons[index] + "_black_24")));
        }
        assertEquals(UNKNOWN, VideoActionBarButtons.classify(icon("future_button_icon")));
        assertFalse(VideoActionBarButtons.isHidden(icon("future_button_icon"), EnumSet.of(SHARE)));
    }

    @Test
    public void removesSelectedActionsWithoutReorderingOrCopyingUnchangedList() {
        VideoActionBarItem like = item(contentTypes().get(LIKE));
        VideoActionBarItem share = item(icon("yt_outline_share"));
        VideoActionBarItem other = item(icon("future_icon"));
        List<VideoActionBarItem> actions = Arrays.asList(like, share, other);
        assertSame(actions, VideoActionBarButtons.getShownActions(actions, EnumSet.of(CLIP)));
        assertEquals(Arrays.asList(like, other), VideoActionBarButtons.getShownActions(actions, EnumSet.of(SHARE)));
    }

    private static VideoActionBarItem overflow(VideoActionBarItemContent... menuItems) {
        return item(VideoActionBarItemContent.newBuilder().setOverflow(VideoActionBarOverflow.newBuilder()
                .addAllMenuItems(Arrays.asList(menuItems)).addShownItems(contentTypes().get(LIKE))
                .addShownItems(icon("yt_outline_share"))).build());
    }

    @Test
    public void filtersMinimalMenuAndShownItemsTogether() {
        VideoActionBarItem menu = overflow(icon("yt_outline_share"), contentTypes().get(DOWNLOAD));
        List<VideoActionBarItem> result = VideoActionBarButtons.getShownActions(
                Collections.singletonList(menu), EnumSet.of(SHARE));
        VideoActionBarOverflow filtered = result.get(0).getContent().getOverflow();
        assertEquals(1, filtered.getMenuItemsCount());
        assertTrue(filtered.getMenuItems(0).hasDownloadButton());
        assertEquals(1, filtered.getShownItemsCount());
        assertTrue(filtered.getShownItems(0).hasLikeButton());
    }

    @Test
    public void removesEmptyHeaderOnlyAndExplicitlyHiddenOverflowMenus() {
        VideoActionBarItemContent header = VideoActionBarItemContent.newBuilder()
                .setMenuHeader(ByteString.EMPTY).build();
        assertTrue(VideoActionBarButtons.getShownActions(Collections.singletonList(overflow(header)),
                EnumSet.of(SHARE)).isEmpty());
        assertTrue(VideoActionBarButtons.getShownActions(Collections.singletonList(overflow(icon("yt_outline_share"))),
                EnumSet.of(SHARE)).isEmpty());
        assertTrue(VideoActionBarButtons.getShownActions(Collections.singletonList(overflow(contentTypes().get(DOWNLOAD))),
                EnumSet.of(MORE)).isEmpty());
    }

    private static Element element(boolean legacy, boolean channel, VideoActionBarItem... actions) {
        ElementModel.Builder model = ElementModel.newBuilder();
        if (legacy) {
            model.setVideoActionBarModel(VideoActionBarModel.newBuilder().setVideoActionBarData(
                    VideoActionBarData.newBuilder().addAllActions(Arrays.asList(actions))));
        } else {
            VideoActionBarViewModel.Builder bar = VideoActionBarViewModel.newBuilder()
                    .setLayoutStyle(6).addAllActions(Arrays.asList(actions));
            if (channel) bar.setSubscribeButton(contentTypes().get(CHANNEL_PROFILE));
            model.setLockupModel(LockupModel.newBuilder().setViewModel(
                    LockupViewModelHolder.newBuilder().setVideoActionBarViewModel(bar)));
        }
        return Element.newBuilder().setType(ElementType.newBuilder().setComponentType(ComponentType.newBuilder()
                .setTemplateConfig(TemplateConfig.newBuilder().setUriTemplateConfig(UriTemplateConfig.newBuilder()
                        .setUri(legacy ? "video_action_bar.eml" : "compactify_video_action_bar.eml")))
                .setModel(model))).build();
    }

    @Test
    public void removesButtonsFromBothOldAndCompactifyModels() throws Exception {
        for (boolean legacy : new boolean[]{false, true}) {
            Element before = element(legacy, false, item(icon("yt_outline_share")), item(contentTypes().get(DOWNLOAD)));
            Element after = Element.parseFrom(VideoActionBarButtons.hide(before.toByteArray(), EnumSet.of(SHARE)));
            ElementModel model = after.getType().getComponentType().getModel();
            List<VideoActionBarItem> actions = legacy ? model.getVideoActionBarModel().getVideoActionBarData().getActionsList()
                    : model.getLockupModel().getViewModel().getVideoActionBarViewModel().getActionsList();
            assertEquals(1, actions.size());
            assertTrue(actions.get(0).getContent().hasDownloadButton());
            assertEquals(before.getType().getComponentType().getTemplateConfig(),
                    after.getType().getComponentType().getTemplateConfig());
        }
    }

    @Test
    public void minimalRetainsRenderingSentinelButTwoRowsCanHaveNoButtons() throws Exception {
        VideoActionBarItem like = item(contentTypes().get(LIKE));
        VideoActionBarItem share = item(icon("yt_outline_share"));
        for (boolean channel : new boolean[]{false, true}) {
            Element after = Element.parseFrom(VideoActionBarButtons.hide(element(false, channel, like, share)
                    .toByteArray(), EnumSet.of(LIKE, SHARE)));
            VideoActionBarViewModel bar = after.getType().getComponentType().getModel()
                    .getLockupModel().getViewModel().getVideoActionBarViewModel();
            assertEquals(channel ? 1 : 0, bar.getActionsCount());
            if (channel) assertEquals(like, bar.getActions(0));
            assertEquals(channel, bar.hasSubscribeButton());
        }
    }

    @Test
    public void unrelatedAndUnchangedElementsKeepOriginalBytes() throws Exception {
        byte[] bytes = element(false, false, item(contentTypes().get(LIKE))).toByteArray();
        assertSame(bytes, VideoActionBarButtons.hide(bytes, EnumSet.noneOf(ActionButton.class)));
        assertSame(bytes, VideoActionBarButtons.hide(bytes, EnumSet.of(CLIP)));
        byte[] unrelated = Element.getDefaultInstance().toByteArray();
        assertSame(unrelated, VideoActionBarButtons.hide(unrelated, EnumSet.of(LIKE)));
        assertNull(VideoActionBarButtons.hide(null, EnumSet.of(LIKE)));
    }

    @Test
    public void preservesUnknownTopLevelFieldsWhenRemovingButtons() throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        bytes.write(element(false, false, item(icon("yt_outline_share")), item(contentTypes().get(LIKE))).toByteArray());
        CodedOutputStream output = CodedOutputStream.newInstance(bytes);
        output.writeUInt32(199, 42);
        output.flush();
        CodedInputStream input = CodedInputStream.newInstance(VideoActionBarButtons.hide(bytes.toByteArray(), EnumSet.of(SHARE)));
        boolean found = false;
        while (!input.isAtEnd()) {
            int tag = input.readTag();
            if (WireFormat.getTagFieldNumber(tag) == 199) {
                assertEquals(42, input.readUInt32());
                found = true;
            } else {
                input.skipField(tag);
            }
        }
        assertTrue(found);
    }

    @Test
    public void standaloneChannelRootHonorsChannelHideWithoutHidingAllActions() {
        assertFalse(VideoActionBarButtons.shouldHideChannelBar(false, false));
        assertTrue(VideoActionBarButtons.shouldHideChannelBar(true, false));
        assertTrue(VideoActionBarButtons.shouldHideChannelBar(false, true));
        assertTrue(VideoActionBarButtons.shouldHideChannelBar(true, true));
    }
}
