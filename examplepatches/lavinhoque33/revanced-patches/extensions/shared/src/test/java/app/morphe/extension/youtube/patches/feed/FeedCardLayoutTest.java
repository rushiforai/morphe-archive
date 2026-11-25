/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-24.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.extension.youtube.patches.feed;

import static app.morphe.extension.youtube.patches.feed.FeedCardLayoutPatch.FeedCardLayout.CARDS;
import static app.morphe.extension.youtube.patches.feed.FeedCardLayoutPatch.FeedCardLayout.CARDS_WITH_ACTION_BUTTONS;
import static app.morphe.extension.youtube.patches.feed.FeedCardLayoutPatch.FeedCardLayout.CLASSIC;
import static app.morphe.extension.youtube.patches.feed.FeedCardLayoutPatch.FeedCardLayout.DEFAULT;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.PackageInfo;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.InsetDrawable;
import android.support.v7.widget.RecyclerView;
import android.widget.FrameLayout;
import android.widget.ImageView;

import com.google.protobuf.ByteString;

import java.util.Arrays;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.*;
import app.morphe.extension.youtube.patches.feed.FeedCardLayoutPatch.FeedCardLayout;
import app.morphe.extension.youtube.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
public class FeedCardLayoutTest {
    private static final String CARD_URI = "lockup.eml-fe|214590";
    private static final String CLASSIC_URI = "video_lockup_with_attachment.eml-fe|214590";
    private static final String VIDEO_ID = "NWItxGY5NNk";
    private static final ByteString THUMBNAIL = ByteString.copyFromUtf8("https://i.ytimg.com/vi/" + VIDEO_ID + "/a.jpg");

    @Before
    @SuppressWarnings("deprecation")
    public void setUp() {
        Context app = RuntimeEnvironment.getApplication();
        PackageInfo info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.versionName = "21.45.90";
        info.applicationInfo = app.getApplicationInfo();
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);
        Resources original = app.getResources();
        var resources = new Resources(original.getAssets(), original.getDisplayMetrics(),
                original.getConfiguration()) {
            @Override
            public int getIdentifier(String name, String type, String packageName) {
                return "results".equals(name) && "id".equals(type) ? android.R.id.list
                        : super.getIdentifier(name, type, packageName);
            }
        };
        Utils.setContext(new ContextWrapper(app) {
            @Override
            public Resources getResources() {
                return resources;
            }
        });
        Settings.FEED_CARD_LAYOUT_DYNAMIC_COLORS.save(false);
    }

    @Test
    public void plainCardsFitNativeVideoAndRemoveOnlyTheActionRow() throws Exception {
        ComponentType input = nativeVideo();
        byte[] bytes = element(input).toByteArray();
        ComponentType output = render(bytes, CARDS);
        LockupModel fitted = output.getModel().getLockupModel();
        LockupViewModel original = lockup(input);
        LockupMetadata metadata = original.getMetadata();
        RendererContext renderer = original.getRendererContext();

        assertCardInsets(fitted);
        assertEquals(original.toBuilder()
                .setMetadata(metadata.toBuilder()
                        .setLockupMetadataViewModel(metadata.getLockupMetadataViewModel().toBuilder()
                                .clearActionButtons()))
                .setRendererContext(renderer.toBuilder().setAccessibilityContext(
                        renderer.getAccessibilityContext().toBuilder().setLabel("A video\u200B")))
                .build(), lockup(output));
        assertEquals(input.getModel().getLockupModel().getContext(), fitted.getContext());
        byte[] fittedBytes = element(output).toByteArray();
        assertSame(fittedBytes, FeedCardLayoutPatch.setFeedCardLayout(fittedBytes, CARDS));
    }

    @Test
    public void cardsWithButtonsKeepNativeActionCommandsAndPreview() throws Exception {
        ComponentType input = nativeVideo();
        Settings.FEED_CARD_LAYOUT_DYNAMIC_COLORS.save(true);
        ComponentType output = render(element(input).toByteArray(), CARDS_WITH_ACTION_BUTTONS);
        LockupModel fitted = output.getModel().getLockupModel();

        assertCardInsets(fitted);
        assertEquals(3, lockup(output).getMetadata().getLockupMetadataViewModel().getActionButtonsCount());
        assertEquals(lockup(input).getMetadata(), lockup(output).getMetadata());
        assertEquals(lockup(input).getInlinePlayback(), lockup(output).getInlinePlayback());
        assertEquals(lockup(input).getContentImage(), lockup(output).getContentImage());
        assertEquals(lockup(input).getRendererContext().getCommandContext(),
                lockup(output).getRendererContext().getCommandContext());
        CardLayoutExperiments experiments = fitted.getContext().getElementsExperiments().getCardLayoutExperiments();
        assertTrue(experiments.getEnableColorSampledBackground());
        assertFalse(experiments.getEnableMetadataBackground());
    }

    @Test
    public void plainCardsAlsoRemoveEmbeddedActionsWhenConvertingClassicVideo() throws Exception {
        // The converter learns the current lockup template before converting classic cards to it.
        FeedCardLayoutPatch.setFeedCardLayout(element(nativeVideo()).toByteArray(), CARDS);
        LockupViewModel source = lockup(nativeVideo());
        VideoWithContextModel classic = VideoWithContextModel.newBuilder()
                .setData(VideoWithContextData.newBuilder()
                        .setAccessibilityText("A video")
                        .setInlinePlayback(source.getInlinePlayback().getInlinePlayback())
                        .setOnTap(source.getRendererContext().getCommandContext().getOnTap())
                        .setMenuOnTap(source.getMetadata().getLockupMetadataViewModel().getMenuButton()
                                .getButtonViewModel().getOnTap().toByteString())
                        .setVideoData(VideoData.newBuilder()
                                .setThumbnail(VideoThumbnail.newBuilder().setImage(THUMBNAIL))
                                .setLockupMetadata(source.getMetadata())))
                .build();
        Element input = element(component(CLASSIC_URI, ElementModel.newBuilder().setVideoWithContextModel(classic)));
        ComponentType output = render(input.toByteArray(), CARDS);

        assertCardInsets(output.getModel().getLockupModel());
        assertEquals(0, lockup(output).getMetadata().getLockupMetadataViewModel().getActionButtonsCount());
        assertEquals(source.getRendererContext().getCommandContext(),
                lockup(output).getRendererContext().getCommandContext());
    }

    @Test
    public void targetTemplateDoesNotConfuseShelfModelsOrReplaceTheirOwnPadding() {
        ComponentType input = nativeVideo();
        assertUnchanged(input.toBuilder().setTemplateConfig(template("horizontal_shelf.eml-fe|214590")).build());
        assertUnchanged(component(CARD_URI, ElementModel.newBuilder()
                .setHorizontalShelfModel(HorizontalShelfModel.getDefaultInstance())));

        LockupModel padded = input.getModel().getLockupModel().toBuilder()
                .setPadding(LockupPadding.newBuilder().setStart(4).setEnd(8)).build();
        ComponentType shelfItem = input.toBuilder().setModel(ElementModel.newBuilder().setLockupModel(padded)).build();
        assertUnchanged(shelfItem);
    }

    @Test
    public void labelLessNonVideoCardGetsTitleAndNoInlineMarkerWithoutLosingItsAction() throws Exception {
        LockupViewModel video = lockup(nativeVideo());
        LockupViewModel promo = video.toBuilder().setContentType(0).clearInlinePlayback()
                .clearRendererContext().build();
        ComponentType input = component(CARD_URI, ElementModel.newBuilder().setLockupModel(LockupModel.newBuilder()
                .setViewModel(LockupViewModelHolder.newBuilder().setLockupViewModel(promo))));
        ComponentType output = render(element(input).toByteArray(), CARDS);

        assertCardInsets(output.getModel().getLockupModel());
        assertEquals("A video\u2062\u200B", lockup(output).getRendererContext().getAccessibilityContext().getLabel());
        assertEquals(promo.getMetadata(), lockup(output).getMetadata());
    }

    @Test
    public void defaultKeepsNativeCardBytesIntact() {
        byte[] input = element(nativeVideo()).toByteArray();
        assertSame(input, FeedCardLayoutPatch.setFeedCardLayout(input, DEFAULT));
        assertNotSame(input, FeedCardLayoutPatch.setFeedCardLayout(input, CARDS));
    }

    @Test
    public void onlySingleColumnFeedCardSectionsReplaceTheStockRowGap() {
        var homeFeed = new RecyclerView(Utils.getContext());
        homeFeed.setId(android.R.id.list);
        var nestedShelf = new RecyclerView(Utils.getContext());
        nestedShelf.setId(android.R.id.content);

        assertEquals(0f, FeedCardLayoutPatch.getSectionRowGap(homeFeed, 1, 20f, CARDS), 0f);
        assertEquals(0f, FeedCardLayoutPatch.getSectionRowGap(homeFeed, 1, 20f, CARDS_WITH_ACTION_BUTTONS), 0f);
        assertEquals(20f, FeedCardLayoutPatch.getSectionRowGap(homeFeed, 2, 20f, CARDS), 0f);
        assertEquals(20f, FeedCardLayoutPatch.getSectionRowGap(nestedShelf, 1, 20f, CARDS), 0f);
        assertEquals(20f, FeedCardLayoutPatch.getSectionRowGap(null, 1, 20f, CARDS), 0f);
        assertEquals(20f, FeedCardLayoutPatch.getSectionRowGap(homeFeed, 1, 20f, CLASSIC), 0f);
        assertEquals(20f, FeedCardLayoutPatch.getSectionRowGap(homeFeed, 1, 20f, DEFAULT), 0f);
    }

    @Test
    public void nativeTitleAndNestedBylineUseOneTintWithoutTintingThePreview() {
        Settings.FEED_CARD_LAYOUT_DYNAMIC_COLORS.save(true);
        Context context = Utils.getContext();
        var feed = new RecyclerView(context);
        feed.setId(android.R.id.list);
        var item = new FrameLayout(context);
        item.setContentDescription("A live video\u200B");
        feed.addView(item);
        var card = new FrameLayout(context);
        item.addView(card);
        var preview = new ImageView(context);
        card.addView(preview);
        int[] pixels = new int[64 * 64];
        Arrays.fill(pixels, Color.RED);
        preview.setImageBitmap(Bitmap.createBitmap(pixels, 64, 64, Bitmap.Config.ARGB_8888));
        var band = new FrameLayout(context);
        card.addView(band);
        var lowerBand = new FrameLayout(context);
        band.addView(lowerBand);

        item.layout(0, 0, 1080, 889);
        card.layout(30, 15, 1050, 889);
        preview.layout(0, 0, 1020, 574);
        band.layout(0, 574, 1020, 874);
        lowerBand.layout(0, 112, 1020, 300);

        var nativeFilter = new PorterDuffColorFilter(Color.DKGRAY, PorterDuff.Mode.SRC_IN);
        var title = new ColorDrawable(0xFF212120);
        title.setColorFilter(nativeFilter);
        var mountedTitle = new InsetDrawable(title, 0);
        mountedTitle.setCallback(card);
        mountedTitle.setBounds(0, 573, 1020, 874);
        title.setBounds(0, 0, 1020, 301);

        var byline = new ColorDrawable(0xFF212120);
        byline.setCallback(lowerBand);
        byline.setBounds(0, 0, 1020, 188);
        var previewPaint = new ColorDrawable(Color.TRANSPARENT);
        previewPaint.setCallback(preview);
        previewPaint.setBounds(0, 0, 1020, 574);

        // Record the mounted shapes before sampling, as happens when a card is first drawn.
        FeedCardColorSampler.onCardShapeDraw(title);
        FeedCardColorSampler.onCardShapeDraw(byline);
        FeedCardColorSampler.updateCardTints(feed);
        FeedCardColorSampler.onCardShapeDraw(previewPaint);

        assertNotNull(title.getColorFilter());
        assertNotSame(nativeFilter, title.getColorFilter());
        assertSame(title.getColorFilter(), byline.getColorFilter());
        assertNull(previewPaint.getColorFilter());

        Settings.FEED_CARD_LAYOUT_DYNAMIC_COLORS.save(false);
        FeedCardColorSampler.updateCardTints(feed);
        assertSame(nativeFilter, title.getColorFilter());
        assertNull(byline.getColorFilter());
        Settings.FEED_CARD_LAYOUT_DYNAMIC_COLORS.save(true);
        FeedCardColorSampler.onCardShapeDraw(title);
        assertNotSame(nativeFilter, title.getColorFilter());

        // Litho can move a drawable to another host without replacing the drawable.
        mountedTitle.setCallback(null);
        title.setCallback(preview);
        title.setBounds(0, 0, 1020, 574);
        FeedCardColorSampler.onCardShapeDraw(title);
        assertSame(nativeFilter, title.getColorFilter());
    }

    private static void assertUnchanged(ComponentType component) {
        byte[] input = element(component).toByteArray();
        assertSame(input, FeedCardLayoutPatch.setFeedCardLayout(input, CARDS));
    }

    private static ComponentType render(byte[] input, FeedCardLayout layout) throws Exception {
        return Element.parseFrom(FeedCardLayoutPatch.setFeedCardLayout(input, layout)).getType().getComponentType();
    }

    private static void assertCardInsets(LockupModel card) {
        LockupPadding padding = card.getPadding();
        assertEquals(12.0f, padding.getStart(), 0.0f);
        assertEquals(12.0f, padding.getEnd(), 0.0f);
        assertEquals(6.0f, padding.getTop(), 0.0f);
        assertEquals(6.0f, padding.getBottom(), 0.0f);
    }

    private static ComponentType nativeVideo() {
        var watch = InnertubeCommandHolder.newBuilder().setInnertubeCommand(InnertubeCommand.newBuilder()
                .setWatchEndpoint(WatchEndpoint.newBuilder().setVideoId(VIDEO_ID))).build();
        var channel = InnertubeCommandHolder.newBuilder().setInnertubeCommand(InnertubeCommand.newBuilder()
                .setBrowseEndpoint(BrowseEndpoint.newBuilder().setBrowseId("UC0000000000000000000000"))).build();
        var queue = InnertubeCommandHolder.newBuilder().setInnertubeCommand(InnertubeCommand.newBuilder()
                .setQueueThumbnailInsertCommand(QueueThumbnailInsertCommand.newBuilder().setParams("encoded params")));
        var menu = InnertubeCommandHolder.newBuilder().setInnertubeCommand(InnertubeCommand.newBuilder()
                .setOpenPopupAction(OpenPopupAction.getDefaultInstance()));
        var metadata = LockupMetadataViewModel.newBuilder()
                .setTitle(AttributedText.newBuilder().setContent("A video").build().toByteString())
                .setMenuButton(ButtonViewModelHolder.newBuilder()
                        .setButtonViewModel(ButtonViewModel.newBuilder().setOnTap(menu)))
                .setMetadata(ContentMetadata.newBuilder().setContentMetadataViewModel(
                        ContentMetadataViewModel.newBuilder().addMetadataRows(MetadataRow.newBuilder().addMetadataParts(
                                MetadataPart.newBuilder().setText(AttributedText.newBuilder().setContent("Channel")
                                        .addCommandRuns(TextCommandRun.newBuilder().setLength(7).setOnTap(channel)))))))
                .addActionButtons(ActionButton.newBuilder().setLikeButtonViewModel(LikeButtonViewModel.newBuilder()
                        .setLikeStatusEntityKey("like-state")))
                .addActionButtons(ActionButton.newBuilder().setButtonViewModel(ButtonViewModel.newBuilder()
                        .setAccessibilityText("Comments").setOnTap(watch)))
                .addActionButtons(ActionButton.newBuilder().setAddToPlaylistButtonViewModel(
                        AddToPlaylistButtonViewModel.newBuilder().setToggleButtonViewModel(
                                ToggleButtonViewModelHolder.newBuilder().setToggleButtonViewModel(
                                        ToggleButtonViewModel.newBuilder().setDefaultButtonViewModel(
                                                ButtonViewModelHolder.newBuilder().setButtonViewModel(
                                                        ButtonViewModel.newBuilder().setOnTap(menu)))))));
        var image = ThumbnailViewModel.newBuilder().setImage(THUMBNAIL)
                .addOverlays(ThumbnailOverlay.newBuilder().setThumbnailBottomOverlayViewModel(
                        ThumbnailBottomOverlayViewModel.newBuilder().addBadges(ThumbnailBadge.newBuilder()
                                .setButtonViewModel(ButtonViewModel.newBuilder().setOnTap(queue)))));
        var video = LockupViewModel.newBuilder().setContentType(1).setContentId(VIDEO_ID)
                .setContentImage(ContentImage.newBuilder().setThumbnailViewModel(image))
                .setMetadata(LockupMetadata.newBuilder().setLockupMetadataViewModel(metadata))
                .setInlinePlayback(LockupInlinePlayback.newBuilder().setInlinePlayback(watch.toByteString()))
                .setRendererContext(RendererContext.newBuilder()
                        .setAccessibilityContext(AccessibilityContext.newBuilder().setLabel("A video"))
                        .setCommandContext(CommandContext.newBuilder().setOnTap(watch.toByteString())));
        return component(CARD_URI, ElementModel.newBuilder().setLockupModel(LockupModel.newBuilder()
                .setViewModel(LockupViewModelHolder.newBuilder().setLockupViewModel(video))));
    }

    private static ComponentType component(String uri, ElementModel.Builder model) {
        return ComponentType.newBuilder().setTemplateConfig(template(uri)).setModel(model).build();
    }

    private static TemplateConfig template(String uri) {
        return TemplateConfig.newBuilder().setUriTemplateConfig(UriTemplateConfig.newBuilder().setUri(uri)).build();
    }

    private static LockupViewModel lockup(ComponentType component) {
        return component.getModel().getLockupModel().getViewModel().getLockupViewModel();
    }

    private static Element element(ComponentType component) {
        return Element.newBuilder().setType(ElementType.newBuilder().setComponentType(component)).build();
    }
}
