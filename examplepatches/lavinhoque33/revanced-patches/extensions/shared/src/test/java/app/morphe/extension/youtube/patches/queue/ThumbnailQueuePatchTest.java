/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24
 */
package app.morphe.extension.youtube.patches.queue;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.net.Uri;
import android.util.Base64;

import com.google.protobuf.ByteString;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.*;
import app.morphe.extension.youtube.shared.PlayerType;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
public class ThumbnailQueuePatchTest {
    private static final String VIDEO_ID = "AbCd-_01234";
    private static final String OTHER_ID = "Zyxwv987654";
    private static final String LOCKUP = "lockup.eml-fe|214590";
    private static final String CLASSIC = "video_lockup_with_attachment.eml-fe|214590";
    private static final String LABEL = "Same title - play video";
    private static final ByteString IMAGE = ByteString.copyFromUtf8("https://i.ytimg.com/vi/" + VIDEO_ID + "/a.jpg");
    private static final ByteString WRAPPED_WATCH = ByteString.copyFrom(new byte[] {10, 0});

    @Test
    public void signedInLockupKeepsItsCommandsThumbnailAndCardLayoutMarkers() throws Exception {
        String layoutLabel = LABEL + "\u2062\u200B";
        var source = lockup(layoutLabel, 1);
        byte[] original = element(LOCKUP, model(source));
        byte[] marked = ThumbnailQueuePatch.markCard(original, true, false);
        var actual = modelOf(marked).getLockupModel().getViewModel().getLockupViewModel();
        var expected = source.toBuilder().setRendererContext(source.getRendererContext().toBuilder()
                .setAccessibilityContext(AccessibilityContext.newBuilder().setLabel(
                        ThumbnailQueuePatch.boundLabel(layoutLabel, VIDEO_ID, false)))).build();

        assertEquals(expected, actual);
        String label = actual.getRendererContext().getAccessibilityContext().getLabel();
        assertTrue(label.endsWith(layoutLabel));
        assertEquals(new ThumbnailQueuePatch.Binding(VIDEO_ID, false), ThumbnailQueuePatch.binding(label));
        assertSame(marked, ThumbnailQueuePatch.markCard(marked, true, false));
    }

    @Test
    public void classicConversionBindsOriginalContentIdEvenWithoutDirectWatchOrUrl() throws Exception {
        var source = lockup(LABEL, 1);
        String marked = ThumbnailQueuePatch.markLockupLabel(source, LABEL, true, false);
        var classic = classic(WRAPPED_WATCH, "").setAccessibilityText(marked).build();
        byte[] converted = element(CLASSIC, classicModel(classic));

        assertEquals(new ThumbnailQueuePatch.Binding(VIDEO_ID, false), ThumbnailQueuePatch.binding(marked));
        assertSame(converted, ThumbnailQueuePatch.markCard(converted, true, false));
        assertEquals(WRAPPED_WATCH, modelOf(converted).getVideoWithContextModel().getData().getOnTap());
    }

    @Test
    public void nativeClassicCardAddsOnlyAnExactVideoBinding() throws Exception {
        var source = classic(watch(VIDEO_ID), "").build();
        byte[] original = element(CLASSIC, classicModel(source));
        byte[] marked = ThumbnailQueuePatch.markCard(original, true, false);
        var actual = modelOf(marked).getVideoWithContextModel().getData();
        String label = actual.getAccessibilityText();

        assertEquals(source, actual.toBuilder().setAccessibilityText(LABEL).build());
        assertEquals(new ThumbnailQueuePatch.Binding(VIDEO_ID, false), ThumbnailQueuePatch.binding(label));
        assertEquals(new ThumbnailQueuePatch.Binding(OTHER_ID, true),
                ThumbnailQueuePatch.binding(ThumbnailQueuePatch.boundLabel(LABEL, OTHER_ID, true)));
        assertNull(ThumbnailQueuePatch.binding(LABEL));
    }

    @Test
    public void leavesShelvesCollectionsCompactRowsAndConflictingVideoIdsAlone() {
        assertUnchanged("horizontal_video_shelf.eml|214590", model(lockup(LABEL, 1)));
        assertUnchanged(LOCKUP, model(lockup(LABEL, 2)));
        var source = classic(watch(VIDEO_ID), "");
        assertUnchanged(CLASSIC, classicModel(source.setCompact(true).build()));
        assertUnchanged(CLASSIC, classicModel(source.setCompact(false).setHorizontal(true).build()));
        assertUnchanged(CLASSIC, classicModel(classic(watch(VIDEO_ID), "https://www.youtube.com/watch?v=" + OTHER_ID)
                .build()));
        byte[] original = element(LOCKUP, model(lockup(LABEL, 1)));
        assertSame(original, ThumbnailQueuePatch.markCard(original, false, false));
    }

    @Test
    public void leavesNativeQueueButtonAloneInsteadOfAddingADuplicate() {
        var source = lockup(LABEL, 1);
        var image = source.getContentImage();
        var command = InnertubeCommandHolder.newBuilder().setInnertubeCommand(InnertubeCommand.newBuilder()
                .setQueueThumbnailInsertCommand(QueueThumbnailInsertCommand.newBuilder().setParams("stock token")));
        var overlay = ThumbnailOverlay.newBuilder().setThumbnailOverlayBadgeViewModel(
                ThumbnailOverlayBadgeViewModel.newBuilder().addThumbnailBadges(ThumbnailBadge.newBuilder()
                        .setButtonViewModel(ButtonViewModel.newBuilder().setOnTap(command))));
        assertUnchanged(LOCKUP, model(source.toBuilder().setContentImage(image.toBuilder().setThumbnailViewModel(
                image.getThumbnailViewModel().toBuilder().addOverlays(overlay))).build()));
    }

    @Test
    public void dismissalInvalidatesEvenAStaleMiniplayerUntilTheNextWatchSession() {
        var session = new ThumbnailQueuePatch.WatchSession();
        assertFalse(session.isActive(PlayerType.NONE));
        assertFalse(session.isActive(PlayerType.HIDDEN));
        assertFalse(session.isActive(PlayerType.INLINE_MINIMAL));
        assertTrue(session.isActive(PlayerType.WATCH_WHILE_MAXIMIZED));
        assertTrue(session.isActive(PlayerType.WATCH_WHILE_MINIMIZED));

        session.onDismissed(1); // Transient state change, not a close.
        assertTrue(session.isActive(PlayerType.WATCH_WHILE_MINIMIZED));
        session.onDismissed(0);
        assertFalse(session.isActive(PlayerType.WATCH_WHILE_MINIMIZED));
        session.onPlayerTypeChanged(PlayerType.WATCH_WHILE_SLIDING_MINIMIZED_DISMISSED);
        assertFalse(session.isActive(PlayerType.WATCH_WHILE_SLIDING_MINIMIZED_DISMISSED));
        assertFalse(session.isActive(PlayerType.WATCH_WHILE_SLIDING_FULLSCREEN_DISMISSED));

        session.onPlayerTypeChanged(PlayerType.WATCH_WHILE_MAXIMIZED);
        session.onPlayerTypeChanged(PlayerType.WATCH_WHILE_MINIMIZED);
        assertTrue(session.isActive(PlayerType.WATCH_WHILE_MINIMIZED));
    }

    @Test
    public void nativeInsertIsAppendOnlyAndIdleWatchUsesTheTappedId() {
        byte[] watch = QueuePatch.thumbnailWatchCommand(VIDEO_ID);
        assertEquals(VIDEO_ID, Proto.string(Proto.bytes(watch, 48_687_757), 1));
        assertNull(Proto.bytes(watch, 465_666_947));

        byte[] insert = QueuePatch.thumbnailInsertCommand(OTHER_ID);
        assertNull(Proto.bytes(insert, 48_687_757));
        assertNull(Proto.bytes(insert, 339_694_216));
        var params = Proto.string(Proto.bytes(insert, 465_666_947), 1);
        byte[] token = Base64.decode(Uri.decode(params), Base64.URL_SAFE);
        byte[] item = Proto.bytes(Proto.bytes(token, 71), 1);
        assertEquals(OTHER_ID, Proto.string(item, 1));
        assertEquals(2, Proto.number(item, 3, 0));
    }

    private static void assertUnchanged(String uri, ElementModel.Builder model) {
        byte[] original = element(uri, model);
        assertSame(original, ThumbnailQueuePatch.markCard(original, true, false));
    }

    private static LockupViewModel lockup(String label, int type) {
        return LockupViewModel.newBuilder().setContentId(VIDEO_ID).setContentType(type)
                .setContentImage(ContentImage.newBuilder().setThumbnailViewModel(
                        ThumbnailViewModel.newBuilder().setImage(IMAGE)))
                .setRendererContext(RendererContext.newBuilder()
                        .setAccessibilityContext(AccessibilityContext.newBuilder().setLabel(label))
                        .setCommandContext(CommandContext.newBuilder().setOnTap(WRAPPED_WATCH)))
                .build();
    }

    private static VideoWithContextData.Builder classic(ByteString onTap, String url) {
        return VideoWithContextData.newBuilder().setAccessibilityText(LABEL).setOnTap(onTap)
                .setVideoData(VideoData.newBuilder().setUrl(url).setThumbnail(
                        VideoThumbnail.newBuilder().setImage(IMAGE).setTimestampText("3:20")));
    }

    private static ByteString watch(String id) {
        return InnertubeCommandHolder.newBuilder().setInnertubeCommand(InnertubeCommand.newBuilder()
                .setWatchEndpoint(WatchEndpoint.newBuilder().setVideoId(id))).build().toByteString();
    }

    private static ElementModel.Builder model(LockupViewModel source) {
        return ElementModel.newBuilder().setLockupModel(LockupModel.newBuilder()
                .setViewModel(LockupViewModelHolder.newBuilder().setLockupViewModel(source)));
    }

    private static ElementModel.Builder classicModel(VideoWithContextData data) {
        return ElementModel.newBuilder().setVideoWithContextModel(VideoWithContextModel.newBuilder().setData(data));
    }

    private static byte[] element(String uri, ElementModel.Builder model) {
        return Element.newBuilder().setType(ElementType.newBuilder().setComponentType(ComponentType.newBuilder()
                .setTemplateConfig(TemplateConfig.newBuilder().setUriTemplateConfig(
                        UriTemplateConfig.newBuilder().setUri(uri)))
                .setModel(model))).build().toByteArray();
    }

    private static ElementModel modelOf(byte[] bytes) throws Exception {
        return Element.parseFrom(bytes).getType().getComponentType().getModel();
    }
}
