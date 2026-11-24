/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-23
 */
package app.morphe.extension.youtube.patches.queue;

import static app.morphe.extension.shared.utils.StringRef.str;

import androidx.annotation.Nullable;

import com.google.protobuf.ByteString;
import com.google.protobuf.InvalidProtocolBufferException;

import java.util.HashMap;
import java.util.List;
import java.util.regex.Pattern;

import app.morphe.extension.shared.innertube.utils.AuthUtils;
import app.morphe.extension.shared.utils.ByteTrieSearch;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ButtonViewModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ComponentType;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.Element;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.InnertubeCommand;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.InnertubeCommandHolder;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.LockupViewModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.QueueThumbnailInsertCommand;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ThumbnailBadge;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ThumbnailOverlay;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ThumbnailOverlayBadgeViewModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.VideoThumbnail;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.VideoWithContextData;
import app.morphe.extension.youtube.patches.CommandRouterPatch;
import app.morphe.extension.youtube.patches.LocalQueuePatch;
import app.morphe.extension.youtube.patches.utils.PlaylistPatch;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.PlayerType;

/** Binds the queue action to the thumbnail's own model, not to a view, text, or flyout state. */
@SuppressWarnings("unused")
public final class ThumbnailQueuePatch {
    private static final String TOKEN_PREFIX = "rvx-thumbnail-queue:";
    private static final String BUTTON_LABEL = "revanced_queue_manager_add_to_queue";
    private static final String CLASSIC = "video_lockup_with_attachment.eml";
    private static final String CLASSIC_WITHOUT_ATTACHMENT = "video_lockup.eml";
    private static final String LOCKUP = "lockup.eml";
    private static final String WATCH_URL = "https://www.youtube.com/watch?v=";
    private static final ByteTrieSearch VIDEO_ELEMENTS = new ByteTrieSearch(
            ByteTrieSearch.convertStringsToBytes(CLASSIC, CLASSIC_WITHOUT_ATTACHMENT, LOCKUP));
    private static final Pattern TEMPLATE_URI = Pattern.compile(
            "(?:video_lockup(?:_with_attachment)?|lockup)\\.eml(?:-\\w+)?\\|[0-9a-f]+\\|?");
    private static final Pattern VIDEO_ID = Pattern.compile("[A-Za-z0-9_-]{11}");
    private static final int VIDEO_CONTENT_TYPE = 1;
    private static final int BUTTON_STYLE_MONO = 9;
    private static final int BUTTON_TYPE_FILLED = 1;
    private static final int BUTTON_SIZE_COMPACT = 2;

    private enum Queue { LOCAL, YOUTUBE, RVX, UNAVAILABLE }

    private ThumbnailQueuePatch() {
    }

    private static boolean isPatchIncluded() {
        return false; // Modified during patching.
    }

    private static boolean isEnabled() {
        return isPatchIncluded() && Settings.QUEUE_THUMBNAIL_BUTTON.get();
    }

    /** Used by the existing Watch later overlay to avoid covering the mounted native action. */
    @Nullable
    public static String visibleButtonLabel() {
        return isEnabled() ? str(BUTTON_LABEL) : null;
    }

    /** Only inserts an overlay. Ordinary watch commands and all existing overlays are left alone. */
    public static byte[] addButton(byte[] bytes) {
        if (!isEnabled() || bytes == null || !VIDEO_ELEMENTS.matches(bytes)) {
            return bytes;
        }

        try {
            Element element = Element.parseFrom(bytes);
            var type = element.getType();
            var component = type.getComponentType();
            String uri = component.getTemplateConfig().getUriTemplateConfig().getUri();
            if (!TEMPLATE_URI.matcher(uri).matches()) {
                return bytes;
            }

            var model = component.getModel();
            ComponentType updated;
            if (model.hasVideoWithContextModel()
                    && (uri.startsWith(CLASSIC) || uri.startsWith(CLASSIC_WITHOUT_ATTACHMENT))) {
                updated = addClassicButton(component);
            } else if (model.hasLockupModel() && uri.startsWith(LOCKUP)) {
                updated = addLockupButton(component);
            } else {
                return bytes;
            }
            return updated == component ? bytes : element.toBuilder()
                    .setType(type.toBuilder().setComponentType(updated)).build().toByteArray();
        } catch (InvalidProtocolBufferException | IllegalArgumentException ex) {
            Logger.printDebug(() -> "Invalid thumbnail queue model: " + ex.getMessage());
            return bytes;
        }
    }

    private static ComponentType addClassicButton(ComponentType component) throws InvalidProtocolBufferException {
        var model = component.getModel();
        var classic = model.getVideoWithContextModel();
        VideoWithContextData data = classic.getData();
        var video = data.getVideoData();
        VideoThumbnail thumbnail = video.getThumbnail();
        if (data.getCompact() || data.getHorizontal() || thumbnail.getIsPlaylist() || thumbnail.getIsMix()
                || data.getCollectionStack() != 0 || thumbnail.getImage().isEmpty()) {
            return component;
        }

        String videoId = classicVideoId(data);
        ThumbnailOverlay button = button(videoId, data.getMenuOnTap(), thumbnail.getOverlaysList());
        if (button == null) {
            return component;
        }

        return component.toBuilder().setModel(model.toBuilder().setVideoWithContextModel(classic.toBuilder()
                .setData(data.toBuilder().setVideoData(video.toBuilder()
                        .setThumbnail(thumbnail.toBuilder().addOverlays(button)))))).build();
    }

    private static ComponentType addLockupButton(ComponentType component) throws InvalidProtocolBufferException {
        var model = component.getModel();
        var lockup = model.getLockupModel();
        var holder = lockup.getViewModel();
        LockupViewModel video = holder.getLockupViewModel();
        var image = video.getContentImage();
        var thumbnail = image.getThumbnailViewModel();
        if (video.getContentType() != VIDEO_CONTENT_TYPE || thumbnail.getImage().isEmpty()) {
            return component;
        }

        String videoId = video.getContentId();
        var menuOnTap = video.getMetadata().getLockupMetadataViewModel().getMenuButton().getButtonViewModel().getOnTap();
        ThumbnailOverlay button = button(videoId, menuOnTap.toByteString(), thumbnail.getOverlaysList());
        if (button == null) {
            return component;
        }

        return component.toBuilder().setModel(model.toBuilder().setLockupModel(lockup.toBuilder()
                .setViewModel(holder.toBuilder().setLockupViewModel(video.toBuilder().setContentImage(image.toBuilder()
                        .setThumbnailViewModel(thumbnail.toBuilder().addOverlays(button))))))).build();
    }

    private static String classicVideoId(VideoWithContextData data) throws InvalidProtocolBufferException {
        String fromTap = watchVideoId(InnertubeCommandHolder.parseFrom(data.getOnTap()), 0);
        if (fromTap == null) {
            return "";
        }
        String url = data.getVideoData().getUrl();
        if (!url.startsWith(WATCH_URL) || url.length() != WATCH_URL.length() + 11) {
            return fromTap;
        }

        // When onTap is wrapped by a command executor, the same model's drag-and-drop URL names the video.
        String fromUrl = url.substring(WATCH_URL.length());
        return fromTap.isEmpty() || fromTap.equals(fromUrl) ? fromUrl : "";
    }

    @Nullable
    private static String watchVideoId(InnertubeCommandHolder onTap, int depth) {
        if (onTap.hasInnertubeCommand()) {
            return onTap.getInnertubeCommand().getWatchEndpoint().getVideoId();
        }
        if (depth == 3) {
            return "";
        }

        String result = "";
        for (InnertubeCommandHolder command : onTap.getSerialCommand().getCommandsList()) {
            String videoId = watchVideoId(command, depth + 1);
            if (videoId == null) {
                return null;
            }
            if (!videoId.isEmpty()) {
                if (!result.isEmpty() && !result.equals(videoId)) {
                    return null;
                }
                result = videoId;
            }
        }
        return result;
    }

    @Nullable
    private static ThumbnailOverlay button(String videoId, ByteString menuOnTap, List<ThumbnailOverlay> overlays)
            throws InvalidProtocolBufferException {
        if (!VIDEO_ID.matcher(videoId).matches()) {
            return null;
        }
        for (ThumbnailOverlay overlay : overlays) {
            for (ThumbnailBadge badge : overlay.getThumbnailOverlayBadgeViewModel().getThumbnailBadgesList()) {
                if (badge.hasButtonViewModel()) {
                    return null; // Do not stack a second button over a server-provided one.
                }
            }
        }

        Queue selectedQueue = queue(false);
        boolean stockQueue = selectedQueue != Queue.LOCAL && !QueuePatch.isEnabled() && !menuOnTap.isEmpty()
                && QueuePatch.hasStockThumbnailInsert(
                        InnertubeCommandHolder.parseFrom(menuOnTap).getInnertubeCommand().toByteArray(), videoId);
        if (selectedQueue == Queue.UNAVAILABLE && !stockQueue) {
            return null;
        }

        var insert = QueueThumbnailInsertCommand.newBuilder()
                .setParams(TOKEN_PREFIX + (stockQueue ? "1" : "0") + videoId);
        var action = InnertubeCommandHolder.newBuilder()
                .setInnertubeCommand(InnertubeCommand.newBuilder().setQueueThumbnailInsertCommand(insert));
        var button = ButtonViewModel.newBuilder()
                .setIconName("quantum_ic_add_to_queue_white_24")
                .setAccessibilityText(str(BUTTON_LABEL))
                .setStyle(BUTTON_STYLE_MONO)
                .setType(BUTTON_TYPE_FILLED)
                .setButtonSize(BUTTON_SIZE_COMPACT)
                .setOnTap(action);
        return ThumbnailOverlay.newBuilder().setThumbnailOverlayBadgeViewModel(
                ThumbnailOverlayBadgeViewModel.newBuilder().addThumbnailBadges(
                        ThumbnailBadge.newBuilder().setButtonViewModel(button))).build();
    }

    private static Queue queue(boolean stockQueue) {
        if (LocalQueuePatch.isEnabled()) {
            return Queue.LOCAL;
        }
        if (QueuePatch.isEnabled()) {
            return Queue.YOUTUBE;
        }
        boolean useRvxQueue = Settings.QUEUE_OVERRIDE_FLYOUT_MENU.get();
        if (useRvxQueue && !AuthUtils.isNotLoggedIn()) {
            return Queue.RVX;
        }
        if (stockQueue) {
            return Queue.YOUTUBE;
        }
        return !useRvxQueue && Settings.QUEUE_ADD_FLYOUT_MENU.get() && !AuthUtils.isNotLoggedIn()
                ? Queue.RVX : Queue.UNAVAILABLE;
    }

    /** Consumes only the button's private token before the app sends a real queue request. */
    public static boolean consumeThumbnailToken(String token) {
        if (!token.startsWith(TOKEN_PREFIX)) {
            return false;
        }
        int offset = TOKEN_PREFIX.length();
        if (isEnabled() && token.length() == offset + 12) {
            boolean stockQueue = token.charAt(offset) == '1';
            String videoId = token.substring(offset + 1);
            if (VIDEO_ID.matcher(videoId).matches()) {
                Utils.runOnMainThreadNowOrLater(() -> append(videoId, stockQueue));
            }
        }
        return true;
    }

    private static void append(String videoId, boolean stockQueue) {
        switch (queue(stockQueue)) {
            case LOCAL -> LocalQueuePatch.appendFromThumbnail(videoId);
            case YOUTUBE -> {
                PlayerType player = PlayerType.getCurrent();
                if (player.isNoneHiddenOrSlidingMinimized() || player == PlayerType.INLINE_MINIMAL
                        || player == PlayerType.WATCH_WHILE_SLIDING_FULLSCREEN_DISMISSED) {
                    Utils.showToastShort(str("morphe_queue_thumbnail_start_playback"));
                } else if (!CommandRouterPatch.executeCommand(QueuePatch.thumbnailInsertCommand(videoId),
                        new HashMap<>())) {
                    Utils.showToastShort(str("morphe_queue_thumbnail_unavailable"));
                }
            }
            case RVX -> PlaylistPatch.appendFromThumbnail(videoId);
            case UNAVAILABLE -> Utils.showToastShort(str("morphe_queue_thumbnail_unavailable"));
        }
    }
}
