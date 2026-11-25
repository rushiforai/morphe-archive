/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-24
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
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ComponentType;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.Element;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.InnertubeCommandHolder;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.LockupViewModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ThumbnailBadge;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ThumbnailOverlay;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ThumbnailOverlayBadgeViewModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.VideoThumbnail;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.VideoWithContextData;
import app.morphe.extension.youtube.patches.CommandRouterPatch;
import app.morphe.extension.youtube.patches.FeedVideoActionsPatch;
import app.morphe.extension.youtube.patches.LocalQueuePatch;
import app.morphe.extension.youtube.patches.utils.PlaylistPatch;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.PlayerType;
import kotlin.Unit;

/** Binds the thumbnail action to the card model and routes clicks to the same queue as the flyout. */
@SuppressWarnings("unused")
public final class ThumbnailQueuePatch {
    // Like the feed layout markers, this metadata is not spoken. It stores the actual card's video ID
    // across Litho mounts without guessing from its title or relying on the last opened menu.
    private static final char MARKER = '\u2063';
    private static final String MARKER_DIGITS = "\u200B\u200C\u200D\u2060";
    private static final String VIDEO_ID_ALPHABET =
            "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-";
    private static final int VIDEO_ID_LENGTH = 11;
    static final int BINDING_LENGTH = 3 + VIDEO_ID_LENGTH * 3;
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

    private enum Queue { LOCAL, YOUTUBE, RVX, UNAVAILABLE }

    record Binding(String videoId, boolean stockQueue) { }

    private static final WatchSession SESSION = new WatchSession();

    static {
        if (isEnabled()) {
            PlayerType.getOnChange().addObserver(type -> {
                SESSION.onPlayerTypeChanged(type);
                FeedVideoActionsPatch.invalidateQueueButtons();
                return Unit.INSTANCE;
            });
        }
    }

    private ThumbnailQueuePatch() {
    }

    private static boolean isPatchIncluded() {
        return false; // Modified during patching.
    }

    public static boolean isEnabled() {
        return isPatchIncluded() && Settings.QUEUE_THUMBNAIL_BUTTON.get();
    }

    /** Marks the final stock or converted layout without touching commands, badges or action rows. */
    public static byte[] markCard(byte[] bytes) {
        if (!isEnabled() || bytes == null || !VIDEO_ELEMENTS.matches(bytes)) {
            return bytes;
        }

        Queue selected = queue(false);
        return markCard(bytes, selected != Queue.UNAVAILABLE, mayUseStockQueue(selected));
    }

    static byte[] markCard(byte[] bytes, boolean queueAvailable, boolean checkStockQueue) {
        if (bytes == null || (!queueAvailable && !checkStockQueue)) {
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
                updated = markClassic(component, queueAvailable, checkStockQueue);
            } else if (model.hasLockupModel() && uri.startsWith(LOCKUP)) {
                updated = markLockup(component, queueAvailable, checkStockQueue);
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

    private static ComponentType markClassic(ComponentType component, boolean queueAvailable, boolean checkStockQueue)
            throws InvalidProtocolBufferException {
        var model = component.getModel();
        var classic = model.getVideoWithContextModel();
        var data = classic.getData();
        var thumbnail = data.getVideoData().getThumbnail();
        if (data.getCompact() || data.getHorizontal() || thumbnail.getIsPlaylist() || thumbnail.getIsMix()
                || data.getCollectionStack() != 0 || !data.getAttachment().isEmpty() || thumbnail.getImage().isEmpty()
                || hasNativeQueueButton(thumbnail.getOverlaysList())) {
            return component;
        }

        String label = data.getAccessibilityText();
        if (label.isEmpty() || hasBinding(label)) {
            return component;
        }
        String videoId = classicVideoId(data);
        ByteString menuOnTap = data.getMenuOnTap();
        var menu = checkStockQueue && !menuOnTap.isEmpty() ? InnertubeCommandHolder.parseFrom(menuOnTap) : null;
        String marked = markLabel(label, videoId, menu, queueAvailable);
        return marked == label ? component : component.toBuilder().setModel(
                model.toBuilder().setVideoWithContextModel(classic.toBuilder().setData(
                        data.toBuilder().setAccessibilityText(marked)))).build();
    }

    private static ComponentType markLockup(ComponentType component, boolean queueAvailable, boolean checkStockQueue) {
        var model = component.getModel();
        var lockup = model.getLockupModel();
        var holder = lockup.getViewModel();
        var video = holder.getLockupViewModel();
        var image = video.getContentImage();
        if (image.hasCollectionThumbnailViewModel()
                || hasNativeQueueButton(image.getThumbnailViewModel().getOverlaysList())) {
            return component;
        }

        var renderer = video.getRendererContext();
        var accessibility = renderer.getAccessibilityContext();
        String label = accessibility.getLabel();
        String marked = markLockupLabel(video, label, queueAvailable, checkStockQueue);
        return marked == label ? component : component.toBuilder().setModel(
                model.toBuilder().setLockupModel(lockup.toBuilder().setViewModel(
                        holder.toBuilder().setLockupViewModel(video.toBuilder().setRendererContext(
                                renderer.toBuilder().setAccessibilityContext(
                                        accessibility.toBuilder().setLabel(marked))))))).build();
    }

    /** The Classic conversion can lose both the content ID and the direct watch endpoint. */
    public static String markConvertedClassicLabel(LockupViewModel source, String label) {
        if (!isEnabled()) {
            return label;
        }

        Queue selected = queue(false);
        try {
            return markLockupLabel(source, label, selected != Queue.UNAVAILABLE, mayUseStockQueue(selected));
        } catch (IllegalArgumentException ex) {
            Logger.printDebug(() -> "Invalid queue menu on a converted card: " + ex.getMessage());
            return label;
        }
    }

    static String markLockupLabel(LockupViewModel video, String label, boolean queueAvailable, boolean checkStockQueue) {
        var image = video.getContentImage();
        if (video.getContentType() != VIDEO_CONTENT_TYPE || image.hasCollectionThumbnailViewModel()
                || image.getThumbnailViewModel().getImage().isEmpty()) {
            return label;
        }

        var menu = checkStockQueue
                ? video.getMetadata().getLockupMetadataViewModel().getMenuButton().getButtonViewModel().getOnTap()
                : null;
        return markLabel(label, video.getContentId(), menu, queueAvailable);
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
            var command = onTap.getInnertubeCommand();
            return command.hasBrowseEndpoint() ? null : command.getWatchEndpoint().getVideoId();
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

    private static boolean hasNativeQueueButton(List<ThumbnailOverlay> overlays) {
        for (ThumbnailOverlay overlay : overlays) {
            if (hasNativeQueueButtonIn(overlay.getThumbnailOverlayBadgeViewModel().getThumbnailBadgesList())
                    || hasNativeQueueButtonIn(overlay.getThumbnailBottomOverlayViewModel().getBadgesList())) {
                return true;
            }
        }
        return false;
    }

    private static boolean hasNativeQueueButtonIn(List<ThumbnailBadge> badges) {
        for (ThumbnailBadge badge : badges) {
            if (badge.hasButtonViewModel()
                    && badge.getButtonViewModel().getOnTap().getInnertubeCommand().hasQueueThumbnailInsertCommand()) {
                return true;
            }
        }
        return false;
    }

    private static String markLabel(String label, String videoId, @Nullable InnertubeCommandHolder menu,
                                    boolean queueAvailable) {
        if (label.isEmpty() || hasBinding(label) || !VIDEO_ID.matcher(videoId).matches()) {
            return label;
        }

        boolean stockQueue = menu != null && menu.hasInnertubeCommand()
                && QueuePatch.hasStockThumbnailInsert(menu.getInnertubeCommand().toByteArray(), videoId);
        return queueAvailable || stockQueue ? boundLabel(label, videoId, stockQueue) : label;
    }

    private static boolean mayUseStockQueue(Queue selected) {
        return selected != Queue.LOCAL && selected != Queue.YOUTUBE;
    }

    static String boundLabel(String label, String videoId, boolean stockQueue) {
        var marked = new StringBuilder(BINDING_LENGTH + label.length()).append(MARKER)
                .append(MARKER_DIGITS.charAt(stockQueue ? 1 : 0));
        for (int i = 0; i < VIDEO_ID_LENGTH; i++) {
            int digit = VIDEO_ID_ALPHABET.indexOf(videoId.charAt(i));
            marked.append(MARKER_DIGITS.charAt(digit >> 4))
                    .append(MARKER_DIGITS.charAt((digit >> 2) & 3))
                    .append(MARKER_DIGITS.charAt(digit & 3));
        }
        // Prepend, rather than append, so the layout's trailing card and inline-player markers stay intact.
        return marked.append(MARKER).append(label).toString();
    }

    static boolean hasBinding(@Nullable CharSequence label) {
        return label != null && label.length() > BINDING_LENGTH && label.charAt(0) == MARKER
                && label.charAt(BINDING_LENGTH - 1) == MARKER;
    }

    @Nullable
    static Binding binding(@Nullable CharSequence label) {
        if (!hasBinding(label)) {
            return null;
        }

        int stock = MARKER_DIGITS.indexOf(label.charAt(1));
        if (stock < 0 || stock > 1) {
            return null;
        }

        var videoId = new StringBuilder(VIDEO_ID_LENGTH);
        for (int i = 2; i < BINDING_LENGTH - 1; i += 3) {
            int high = MARKER_DIGITS.indexOf(label.charAt(i));
            int middle = MARKER_DIGITS.indexOf(label.charAt(i + 1));
            int low = MARKER_DIGITS.indexOf(label.charAt(i + 2));
            if (high < 0 || middle < 0 || low < 0) {
                return null;
            }
            videoId.append(VIDEO_ID_ALPHABET.charAt((high << 4) | (middle << 2) | low));
        }
        return new Binding(videoId.toString(), stock == 1);
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

    /** Injection point: a real close does not always clear YouTube's cached video ID or player type right away. */
    public static void onPlayerDismissed(int dismissType) {
        SESSION.onDismissed(dismissType);
    }

    /** Injection point: the inline preview can move to another card without changing the player type. */
    public static void onVideoLoaded(String videoId) {
        if (isEnabled() && PlayerType.getCurrent() == PlayerType.INLINE_MINIMAL) {
            FeedVideoActionsPatch.invalidateQueueButtons();
        }
    }

    static final class WatchSession {
        private volatile boolean dismissed;

        void onDismissed(int dismissType) {
            if (dismissType == 0) {
                dismissed = true;
            }
        }

        void onPlayerTypeChanged(PlayerType type) {
            // PlayerType only sends changes, so the stale MINIMIZED value does not reopen a closed session.
            switch (type) {
                case WATCH_WHILE_MINIMIZED, WATCH_WHILE_MAXIMIZED, WATCH_WHILE_FULLSCREEN,
                     WATCH_WHILE_PICTURE_IN_PICTURE, VIRTUAL_REALITY_FULLSCREEN -> dismissed = false;
                default -> { }
            }
        }

        boolean isActive(PlayerType type) {
            return !dismissed && !type.isNoneHiddenOrSlidingMinimized() && type != PlayerType.INLINE_MINIMAL
                    && type != PlayerType.WATCH_WHILE_SLIDING_FULLSCREEN_DISMISSED;
        }
    }

    static void onButtonClick(Binding binding) {
        if (!isEnabled()) {
            return;
        }

        String videoId = binding.videoId();
        Queue selected = queue(binding.stockQueue());
        boolean active = SESSION.isActive(PlayerType.getCurrent());
        boolean handled;
        switch (selected) {
            case LOCAL -> {
                if (active) {
                    LocalQueuePatch.appendFromThumbnail(videoId);
                } else {
                    LocalQueuePatch.play(videoId);
                }
                return;
            }
            case YOUTUBE -> handled = CommandRouterPatch.executeCommand(active ? QueuePatch.thumbnailInsertCommand(videoId)
                    : QueuePatch.thumbnailWatchCommand(videoId), new HashMap<>());
            case RVX -> {
                if (active) {
                    PlaylistPatch.appendFromThumbnail(videoId);
                    return;
                }
                handled = CommandRouterPatch.executeCommand(QueuePatch.thumbnailWatchCommand(videoId), new HashMap<>());
            }
            default -> handled = false;
        }
        if (!handled) {
            Utils.showToastShort(str("morphe_queue_thumbnail_unavailable"));
        }
    }
}
