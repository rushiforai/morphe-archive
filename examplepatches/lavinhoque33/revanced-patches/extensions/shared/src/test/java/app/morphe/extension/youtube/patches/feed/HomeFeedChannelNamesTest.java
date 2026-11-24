/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-23
 * Written by lavinhoque33, 2026-11-23
 */

package app.morphe.extension.youtube.patches.feed;

import static app.morphe.extension.youtube.patches.feed.HomeFeedChannelNamesPatch.rewrite;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.PackageInfo;
import android.content.res.Resources;

import com.google.protobuf.ByteString;
import com.google.protobuf.CodedOutputStream;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.io.ByteArrayOutputStream;
import java.util.Base64;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.*;
import app.morphe.extension.youtube.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
public class HomeFeedChannelNamesTest {
    @Before
    public void initializeExtensionContext() {
        Context app = RuntimeEnvironment.getApplication();
        PackageInfo info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.versionName = "21.45.90";
        info.applicationInfo = app.getApplicationInfo();
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);
        Utils.setContext(app);
    }

    private static final String HOME = "FEwhat_to_watch";
    private static final String SOURCE_ID = "UCb0dmZQAftj6Dl38bqpfZoQ";
    private static final String OTHER_ID = "UCJ5ucEKfmOwfiUYC796gVSA";
    private static final String SOURCE_HANDLE = "@Source3650";
    private static final String SEPARATOR = "\u2069\u202f•\u202f";

    // Anonymous ANDROID /next, v21.45.90, dQw4w9WgXcQ, hl=ja. The unrelated card fields were removed;
    // the attributed metadata (including the native play icon), avatar and endpoint remain first-party wire data.
    private static final String PUBLIC_CLASSIC_CARD =
            "CpUEyuvqgwWOBBo8ksuhkAU2CjR2aWRlb19sb2NrdXBfd2l0aF9hdHRhY2htZW50LmVtbC1mZXxlOWEyNjYyZTg5YWIyYTFh"
            + "Ks0DoqvT+AbGA5IBwgMKvwMaeRo744OB44Oj44Oz44ON44Or44CMZXZlcnkgc29uZyBpcyBhIHNjYXLjgI3jgavnp7vli5Xj"
            + "gZfjgb7jgZkqOrKtyYYFNNKg3bkBLhIYVUNrVVNQalJMOG1kMmhsRThiTlhBVC1BIhIvQGV2ZXJ5c29uZ2lzYXNjYXIyK2h0"
            + "dHBzOi8vd3d3LnlvdXR1YmUuY29tL3dhdGNoP3Y9TldJdHhHWTVOTmuqAZMCkv8DjgIKNwo1ODAnUyBNVVNJQyBPTiBUSEUg"
            + "Uk9BRCB8IDIgSG91cnMgb2YgQ2xhc3NpYyAnODBzIEhpdHMa0gGahO2qD8sBCgAKwgEKvwESiAEKLmV2ZXJ5IHNvbmcgaXMg"
            + "YSBzY2FyICAgICAgNDkx5LiHICAgNSDjgYvmnIjliY1CVggXEAMaTgoyyqPh3QQsCioKKBomEh55dF9vdXRsaW5lX3BsYXlf"
            + "YXJyb3dfYmxhY2tfMjQY4MCB+w8SGKLY6IMFEhIHDQAAQEEQARoHDQAAQEEQASADGjJldmVyeSBzb25nIGlzIGEgc2Nhciwg"
            + "NDkx5LiH5Zue6KaW6IG0LCA1IOOBi+aciOWJjQoACgA=";

    @Test
    public void localizedPublicRendererKeepsItsNativePlayIconAndMetadata() throws Exception {
        byte[] alreadyNamed = Base64.getDecoder().decode(PUBLIC_CLASSIC_CARD);
        assertSame(alreadyNamed, rewrite(alreadyNamed, HOME, false));

        Element source = Element.parseFrom(alreadyNamed);
        var sourceModel = model(source);
        var classic = sourceModel.getVideoWithContextModel();
        var data = classic.getData();
        var video = data.getVideoData();
        var metadata = video.getLockupMetadata();
        MetadataPart part = details(metadata).getMetadataRows(1).getMetadataParts(0);
        var original = part.getText();

        String name = "every song is a scar";
        String handle = "@everysongisascar";
        AttachmentRun play = original.getAttachmentRuns(0);
        var handleText = original.toBuilder().setContent(handle + original.getContent().substring(name.length()))
                .setAttachmentRuns(0, play.toBuilder().setStartIndex(play.getStartIndex() + handle.length()
                        - name.length()));
        var changedMetadata = withPart(metadata, 1, part.toBuilder().setText(handleText).build());
        byte[] input = withModel(source, sourceModel.toBuilder().setVideoWithContextModel(classic.toBuilder()
                .setData(data.toBuilder().setVideoData(video.toBuilder().setLockupMetadata(changedMetadata))))
                .build()).toByteArray();

        Element result = Element.parseFrom(rewrite(input, HOME, false));
        assertEquals(source, result);
        assertSame(input, rewrite(input, "FEsubscriptions", false));
        assertSame(input, rewrite(input, HOME, true));
    }

    @Test
    public void modernAuthorCommandStyleAndSiblingRowsArePreserved() throws Exception {
        InnertubeCommandHolder endpoint = destination(SOURCE_ID, SOURCE_HANDLE);
        Element input = modern(SOURCE_HANDLE, "Source", endpoint, endpoint);
        Element result = Element.parseFrom(rewrite(input.toByteArray(), HOME, false));
        var inputVideo = model(input).getLockupModel().getViewModel().getLockupViewModel();
        var outputVideo = model(result).getLockupModel().getViewModel().getLockupViewModel();
        var before = inputVideo.getMetadata().getLockupMetadataViewModel();
        var after = outputVideo.getMetadata().getLockupMetadataViewModel();
        assertEquals(before.getTitle(), after.getTitle());
        assertEquals(before.getImage(), after.getImage());
        assertEquals(inputVideo.getRendererContext(), outputVideo.getRendererContext());

        var inputRows = details(inputVideo.getMetadata());
        var outputRows = details(outputVideo.getMetadata());
        assertEquals(inputRows.getDelimiter(), outputRows.getDelimiter());
        assertEquals(inputRows.getMetadataRows(1), outputRows.getMetadataRows(1));
        var text = outputRows.getMetadataRows(0).getMetadataParts(0).getText();
        assertEquals("\u2067Source" + SEPARATOR + "10K views", text.getContent());
        assertEquals(1, text.getCommandRuns(0).getStartIndex());
        assertEquals("Source".length(), text.getCommandRuns(0).getLength());
        assertEquals(endpoint, text.getCommandRuns(0).getOnTap());
        assertEquals("Source".length(), text.getStyleRuns(0).getLength());
        assertEquals(1 + "Source".length() + SEPARATOR.length(), text.getStyleRuns(1).getStartIndex());
    }

    @Test
    public void classicConversionUsesNamedAvatarBeforeLosingTheSourceVideoId() throws Exception {
        Context app = RuntimeEnvironment.getApplication();
        useStockAvatarLabel(app);
        Settings.FEED_CARD_LAYOUT.save(FeedCardLayoutPatch.FeedCardLayout.CLASSIC);
        HomeFeedChannelNamesPatch.setBrowseId(HOME);

        try {
            // Prime the layout converter with the first-party classic template from the capture above.
            FeedCardLayoutPatch.setFeedCardLayout(Base64.getDecoder().decode(PUBLIC_CLASSIC_CARD));

            ByteString watch = opaquePlaybackCommand();
            byte[] input = classicSource(watch).toByteArray();

            Settings.HOME_FEED_CHANNEL_NAMES.save(false);
            var disabled = renderAsClassic(input);
            assertEquals(watch, disabled.getOnTap());
            assertEquals("", disabled.getVideoData().getUrl());
            assertEquals(SOURCE_HANDLE + "   2.4M   8d ago", classicByline(disabled).getText().getContent());

            Settings.HOME_FEED_CHANNEL_NAMES.save(true);
            var enabled = renderAsClassic(input);
            assertEquals(disabled.toBuilder().setVideoData(disabled.getVideoData().toBuilder()
                    .setLockupMetadata(enabled.getVideoData().getLockupMetadata())).build(), enabled);
            var byline = classicByline(enabled);
            assertEquals("Source   2.4M   8d ago", byline.getText().getContent());
            assertEquals("Source, 2.4 million views, 8 days ago", byline.getAccessibilityLabel());

            HomeFeedChannelNamesPatch.setBrowseId("FEsubscriptions");
            assertEquals(disabled, renderAsClassic(input));
        } finally {
            HomeFeedChannelNamesPatch.clearBrowseId();
            Settings.HOME_FEED_CHANNEL_NAMES.save(false);
            Settings.FEED_CARD_LAYOUT.save(FeedCardLayoutPatch.FeedCardLayout.DEFAULT);
            Utils.setContext(app);
        }
    }

    private static Element classicSource(ByteString watch) {
        var endpoint = destination(SOURCE_ID, SOURCE_HANDLE);
        Element source = modern(SOURCE_HANDLE, "Source", endpoint, endpoint);
        var sourceModel = model(source);
        var lockup = sourceModel.getLockupModel();
        var holder = lockup.getViewModel();
        var video = holder.getLockupViewModel();

        // Signed-in 21.45.90 Home: no metadata accessibility label on the author part; the avatar carries the name.
        var byline = ContentMetadataViewModel.newBuilder()
                .addMetadataRows(MetadataRow.newBuilder().addMetadataParts(metadataPart(SOURCE_HANDLE, "")))
                .addMetadataRows(MetadataRow.newBuilder()
                        .addMetadataParts(metadataPart("2.4M", "2.4 million views"))
                        .addMetadataParts(metadataPart("8d ago", "8 days ago")));
        var metadata = video.getMetadata().getLockupMetadataViewModel();
        var avatar = metadata.getImage().getDecoratedAvatarViewModel().toBuilder().setA11YLabel("Go to channel Source");
        var lockedVideo = video.toBuilder().setMetadata(LockupMetadata.newBuilder()
                        .setLockupMetadataViewModel(metadata.toBuilder()
                                .setImage(LockupImage.newBuilder().setDecoratedAvatarViewModel(avatar))
                                .setMetadata(ContentMetadata.newBuilder().setContentMetadataViewModel(byline))))
                .setContentImage(ContentImage.newBuilder().setThumbnailViewModel(ThumbnailViewModel.newBuilder()
                        .setImage(ByteString.copyFromUtf8("\n\u0030https://i.ytimg.com/vi/NWItxGY5NNk/hqdefault.jpg"))))
                .setRendererContext(RendererContext.newBuilder()
                        .setCommandContext(CommandContext.newBuilder().setOnTap(watch)));
        return withModel(source, sourceModel.toBuilder().setLockupModel(lockup.toBuilder()
                .setViewModel(holder.toBuilder().setLockupViewModel(lockedVideo))).build());
    }

    private static MetadataPart.Builder metadataPart(String text, String label) {
        return MetadataPart.newBuilder().setText(AttributedText.newBuilder().setContent(text))
                .setAccessibilityLabel(label);
    }

    private static ByteString opaquePlaybackCommand() throws Exception {
        // Keep the real command envelope without retaining the signed-in request payload.
        var buffer = new ByteArrayOutputStream();
        var output = CodedOutputStream.newInstance(buffer);
        output.writeByteArray(200453700, new byte[0]);
        output.flush();
        return InnertubeCommandHolder.newBuilder()
                .setInnertubeCommand(InnertubeCommand.parseFrom(buffer.toByteArray())).build().toByteString();
    }

    private static MetadataPart classicByline(VideoWithContextData data) {
        return details(data.getVideoData().getLockupMetadata()).getMetadataRows(0).getMetadataParts(0);
    }

    @SuppressWarnings("deprecation")
    private static void useStockAvatarLabel(Context app) {
        Resources original = app.getResources();
        int goToChannel = 0x7f140090;
        var resources = new Resources(original.getAssets(), original.getDisplayMetrics(),
                original.getConfiguration()) {
            @Override
            public int getIdentifier(String name, String type, String packageName) {
                return "accessibility_go_to_channel".equals(name) ? goToChannel
                        : super.getIdentifier(name, type, packageName);
            }

            @Override
            public String getString(int id) {
                return id == goToChannel ? "Go to channel" : super.getString(id);
            }
        };
        Utils.setContext(new ContextWrapper(app) {
            @Override
            public Resources getResources() {
                return resources;
            }
        });
    }

    private static VideoWithContextData renderAsClassic(byte[] input) throws Exception {
        byte[] rendered = HomeFeedChannelNamesPatch.onElementLoaded(FeedCardLayoutPatch.setFeedCardLayout(input));
        return model(Element.parseFrom(rendered)).getVideoWithContextModel().getData();
    }

    @Test
    public void unicodeDisplayNameAndPercentEncodedHandleUseExactRowIdentity() throws Exception {
        String handle = "@夜の音";
        String displayName = "夜の音楽 🎶";
        InnertubeCommandHolder endpoint = destination(OTHER_ID, "@%E5%A4%9C%E3%81%AE%E9%9F%B3");
        Element row = modern(handle, displayName, endpoint, endpoint);
        byte[] input = row.toByteArray();
        Element output = Element.parseFrom(rewrite(input, HOME, false));
        var video = model(output).getLockupModel().getViewModel().getLockupViewModel();
        var part = details(video.getMetadata()).getMetadataRows(0).getMetadataParts(0);
        assertEquals("\u2067" + displayName + SEPARATOR + "10K views", part.getText().getContent());
        assertEquals(displayName.length(), part.getText().getCommandRuns(0).getLength());

        InnertubeCommandHolder wrongHandle = destination(OTHER_ID, "@別の音");
        InnertubeCommandHolder wrongId = destination(SOURCE_ID, handle);
        assertUnchanged(modern(handle, displayName, wrongHandle, endpoint));
        assertUnchanged(modern(handle, displayName, endpoint, wrongId));
        assertUnchanged(modern(SOURCE_HANDLE, "@Source3650", destination(SOURCE_ID, SOURCE_HANDLE),
                destination(SOURCE_ID, SOURCE_HANDLE)));
        assertUnchanged(modern("Trailer " + handle, displayName, endpoint, endpoint));
    }

    private static void assertUnchanged(Element input) {
        byte[] bytes = input.toByteArray();
        assertSame(bytes, rewrite(bytes, HOME, false));
    }

    private static Element modern(String handle, String name, InnertubeCommandHolder avatar,
                                  InnertubeCommandHolder author) {
        int suffixStart = 1 + handle.length() + SEPARATOR.length();
        AttributedText text = AttributedText.newBuilder().setContent("\u2067" + handle + SEPARATOR + "10K views")
                .addCommandRuns(TextCommandRun.newBuilder().setStartIndex(1).setLength(handle.length()).setOnTap(author))
                .addStyleRuns(TextRunRange.newBuilder().setStartIndex(1).setLength(handle.length()))
                .addStyleRuns(TextRunRange.newBuilder().setStartIndex(suffixStart).setLength("10K views".length()))
                .build();
        var details = ContentMetadataViewModel.newBuilder().setDelimiter(" · ")
                .addMetadataRows(MetadataRow.newBuilder().addMetadataParts(MetadataPart.newBuilder()
                        .setText(text).setAccessibilityLabel(name + ", 10 thousand views")))
                .addMetadataRows(MetadataRow.newBuilder().addMetadataParts(MetadataPart.newBuilder()
                        .setText(AttributedText.newBuilder().setContent("2 days ago · " + handle))));
        var metadata = LockupMetadataViewModel.newBuilder().setTitle(ByteString.copyFromUtf8("Title " + handle))
                .setMetadata(ContentMetadata.newBuilder().setContentMetadataViewModel(details))
                .setImage(LockupImage.newBuilder().setDecoratedAvatarViewModel(DecoratedAvatarViewModel.newBuilder()
                        .setA11YLabel("チャンネル「" + name + "」に移動します")
                        .setRendererContext(RendererContext.newBuilder().setCommandContext(CommandContext.newBuilder()
                                .setOnTap(avatar.toByteString())))));
        var video = LockupViewModel.newBuilder().setContentType(1).setContentId("NWItxGY5NNk")
                .setMetadata(LockupMetadata.newBuilder().setLockupMetadataViewModel(metadata));
        var model = ElementModel.newBuilder().setLockupModel(LockupModel.newBuilder()
                .setViewModel(LockupViewModelHolder.newBuilder().setLockupViewModel(video)));
        return Element.newBuilder().setType(ElementType.newBuilder().setComponentType(ComponentType.newBuilder()
                .setTemplateConfig(TemplateConfig.newBuilder().setUriTemplateConfig(UriTemplateConfig.newBuilder()
                        .setUri("lockup.eml-fe|8c3f407b04ae7a1f"))).setModel(model))).build();
    }

    private static InnertubeCommandHolder destination(String id, String handle) {
        return InnertubeCommandHolder.newBuilder().setInnertubeCommand(InnertubeCommand.newBuilder()
                .setBrowseEndpoint(BrowseEndpoint.newBuilder().setBrowseId(id).setCanonicalBaseUrl("/" + handle)))
                .build();
    }

    private static ContentMetadataViewModel details(LockupMetadata metadata) {
        return metadata.getLockupMetadataViewModel().getMetadata().getContentMetadataViewModel();
    }

    private static LockupMetadata withPart(LockupMetadata metadata, int row, MetadataPart part) {
        var view = metadata.getLockupMetadataViewModel();
        var outer = view.getMetadata();
        var details = outer.getContentMetadataViewModel();
        return metadata.toBuilder().setLockupMetadataViewModel(view.toBuilder()
                .setMetadata(outer.toBuilder().setContentMetadataViewModel(details.toBuilder()
                        .setMetadataRows(row, details.getMetadataRows(row).toBuilder().setMetadataParts(0, part)))))
                .build();
    }

    private static ElementModel model(Element element) {
        return element.getType().getComponentType().getModel();
    }

    private static Element withModel(Element element, ElementModel model) {
        return element.toBuilder().setType(element.getType().toBuilder()
                .setComponentType(element.getType().getComponentType().toBuilder().setModel(model))).build();
    }
}
