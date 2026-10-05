/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */


package app.morphe.extension.instagram.patches.download;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.os.Build;
import android.content.Context;
import android.app.Activity;
import android.graphics.Color;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;
import android.widget.LinearLayout;

import java.lang.reflect.Field;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.entity.MediaData;
import app.morphe.extension.instagram.entity.ImageData;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.instagram.utils.InstagramLogger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.instagram.entity.MediaType;

import com.instagram.common.session.UserSession;

public class DownloadUtils {
    private static final String DRAWABLE_DOWNLOAD_ICON = "instagram_download_outline_24";

    public static String getSubfolderName(String username){
        boolean SPLIT_BY_USERNAME = Settings.downloadUsernameFolder();
        return SPLIT_BY_USERNAME ? username : null;
    }

    /**
     * Username used for downloaded file names, read from the post's `Media`. Falls back to a
     * neutral name instead of failing the download when the post carries no author.
     */
    private static String feedDownloadUsername(MediaData mediaData) {
        String username = getMediaUsername(mediaData.getObject());
        return username == null || username.isEmpty() ? "user" : username;
    }

    /** The author username of a `Media`, or null. The patch replaces this body. */
    static String getMediaUsername(Object media) {
        return null;
    }

    /**
     * Entry point of every download button. Direct download saves the media being viewed. A single
     * media always downloads straight away; a carousel opens the media picker sheet. Instagram
     * serves the highest quality first, so no resolution is ever asked for.
     */
    public static void downloadPost(Context context,  UserSession userSession, Object mediaObject, int position) {
        downloadPost(context, userSession, mediaObject, position, false);
    }

    /**
     * Long press of a download button. With direct download on a tap saves right away, so holding
     * opens the chooser instead: the media picker of a carousel. Without direct download a tap already
     * offers the chooser, so the hold does nothing.
     */
    public static void downloadPostChooser(
            Context context, UserSession userSession, Object mediaObject, int position) {
        if (!Settings.directDownload()) return;
        downloadPost(context, userSession, mediaObject, position, true);
    }

    private static void downloadPost(
            Context context, UserSession userSession, Object mediaObject, int position, boolean chooser) {
        try {
            boolean ENABLE_DIRECT_DOWNLOAD = !chooser && Settings.directDownload();
            position = position < 1 ? 0 : position;
            MediaData mediaInfo = new MediaData(mediaObject);
            if (ENABLE_DIRECT_DOWNLOAD || mediaInfo.getCarouselSize() <= 1) {
                downloadMedia(context, mediaInfo, position, MediaType.ANY);
            } else {
                showDownloadSheet(context, mediaInfo);
            }

        } catch (Exception e) {
            InstagramLogger.printException(() -> "Error at downloadPost", e);
        }
    }

    private static void showDownloadSheet(Context context, MediaData mediaInfo) throws Exception {
        int carouselSize = mediaInfo.getCarouselSize();
        List<DownloadItem> items = new ArrayList<>(carouselSize);
        for (int index = 0; index < carouselSize; index++) {
            MediaData mediaData = mediaInfo.getMediaAt(index);
            boolean video = mediaData.isVideo();
            List<ImageData> variants = sortedThumbnailVariants(mediaData);
            List<Object> cacheObjects = new ArrayList<>(variants.size());
            List<String> cacheUrls = new ArrayList<>(variants.size());
            for (ImageData variant : variants) {
                String url = imageUrl(variant);
                if (url == null || cacheUrls.contains(url)) continue;
                cacheObjects.add(imageObject(variant));
                cacheUrls.add(url);
            }
            String networkUrl = smallThumbnailUrl(variants);
            items.add(new DownloadItem(
                    str(video ? "piko_media_video" : "piko_media_photo"),
                    mediaData.getMediaLink(),
                    video,
                    cacheObjects,
                    cacheUrls,
                    networkUrl));
            logThumbnailCandidates(index, variants, cacheObjects, cacheUrls, networkUrl);
        }

        DownloadSheet.show(context, items, feedDownloadUsername(mediaInfo), new DownloadSheet.Listener() {
            @Override
            public void onDownloadItem(int index) {
                downloadFromSheet(context, mediaInfo, index);
            }

            @Override
            public void onDownloadItems(List<Integer> indexes) {
                downloadFromSheet(context, mediaInfo, indexes);
            }

            @Override
            public void onDownloadAll() {
                downloadFromSheet(context, mediaInfo, -1);
            }
        });
    }

    private static final int THUMBNAIL_TARGET_SIZE_PX = 256;

    /** Image variants of the item, largest (display) variant first. */
    private static List<ImageData> sortedThumbnailVariants(MediaData mediaData) {
        List<ImageData> variants = new ArrayList<>(imageVariants(mediaData));
        variants.sort((left, right) -> Integer.compare(imageSize(right), imageSize(left)));
        return variants;
    }

    /**
     * One diagnostic line per sheet item: every candidate with its variant size and whether the
     * real `ExtendedImageUrl` object is available for the object-key probe.
     */
    private static void logThumbnailCandidates(
            int index,
            List<ImageData> variants,
            List<Object> cacheObjects,
            List<String> cacheUrls,
            String networkUrl
    ) {
        StringBuilder message = new StringBuilder(512);
        message.append("item[").append(index).append("] candidates=").append(cacheUrls.size());
        for (ImageData variant : variants) {
            String url = imageUrl(variant);
            if (url == null) continue;
            int candidateIndex = cacheUrls.indexOf(url);
            if (candidateIndex < 0) continue;
            message.append(" | ").append(imageDimensions(variant))
                    .append(cacheObjects.get(candidateIndex) == null ? " (no-obj) " : " (obj) ")
                    .append(url);
        }
        message.append(" network=").append(networkUrl == null ? "<none>" : networkUrl);
        ThumbnailLoader.logDiagnostic(message.toString());
    }

    /**
     * Smallest variant at or above the badge target, so the network fallback stays cheap without
     * looking soft. Falls back to the largest smaller variant when every image is tiny.
     */
    private static String smallThumbnailUrl(List<ImageData> variants) {
        ImageData best = null;
        int bestSize = 0;
        for (ImageData variant : variants) {
            int size = imageSize(variant);
            if (size <= 0) continue;
            if (best == null || preferNetworkVariant(size, bestSize)) {
                best = variant;
                bestSize = size;
            }
        }
        return best == null ? null : imageUrl(best);
    }

    private static boolean preferNetworkVariant(int size, int currentSize) {
        boolean sizeAboveTarget = size >= THUMBNAIL_TARGET_SIZE_PX;
        boolean currentAboveTarget = currentSize >= THUMBNAIL_TARGET_SIZE_PX;
        if (sizeAboveTarget != currentAboveTarget) return sizeAboveTarget;
        return sizeAboveTarget ? size < currentSize : size > currentSize;
    }

    private static List<ImageData> imageVariants(MediaData mediaData) {
        try {
            List<ImageData> variants = mediaData.getImageVariants();
            return variants == null ? Collections.emptyList() : variants;
        } catch (Exception e) {
            Logger.printDebug(() -> "Could not read the media image variants for a thumbnail");
            return Collections.emptyList();
        }
    }

    private static int imageSize(ImageData variant) {
        try {
            return Math.max(variant.getWidth(), variant.getHeight());
        } catch (Exception e) {
            return 0;
        }
    }

    private static String imageDimensions(ImageData variant) {
        try {
            return variant.getWidth() + "x" + variant.getHeight();
        } catch (Exception e) {
            return "?x?";
        }
    }

    private static String imageUrl(ImageData variant) {
        try {
            return variant.getUrl();
        } catch (Exception e) {
            return null;
        }
    }

    /** The real `ExtendedImageUrl` object, or null when the entity cannot expose it. */
    private static Object imageObject(ImageData variant) {
        try {
            return variant.getObject();
        } catch (Exception e) {
            return null;
        }
    }

    private static void downloadFromSheet(Context context, MediaData mediaInfo, int position) {
        try {
            downloadMedia(context, mediaInfo, position, MediaType.ANY);
        } catch (Exception e) {
            InstagramLogger.printException(() -> "Error at downloadFromSheet", e);
            Utils.showToastShort(e.getMessage());
        }
    }

    private static void downloadFromSheet(Context context, MediaData mediaInfo, List<Integer> indexes) {
        try {
            downloadMedia(context, mediaInfo, indexes);
        } catch (Exception e) {
            InstagramLogger.printException(() -> "Error at downloadFromSheet", e);
            Utils.showToastShort(e.getMessage());
        }
    }

    /** Downloads the picked media of a carousel behind a single toast. */
    private static void downloadMedia(Context context, MediaData mediaInfo, List<Integer> indexes) throws Exception {
        if (indexes.size() == 1) {
            downloadMedia(context, mediaInfo, indexes.get(0), MediaType.ANY);
            return;
        }
        if (!Utils.isNetworkConnected()) {
            Utils.showToastShort(str("piko_no_internet"));
            return;
        }
        String username = feedDownloadUsername(mediaInfo);
        String subFolder = getSubfolderName(username);
        List<DownloadService.Item> items = new ArrayList<>(indexes.size());
        for (int index : indexes) {
            MediaData mediaData = mediaInfo.getMediaAt(index);
            items.add(new DownloadService.Item(
                    mediaData.getMediaLink(), subFolder, username + "_" + mediaData.getDownloadFilename(MediaType.ANY)));
        }
        DownloadService.download(context, items, announcedAuthor(mediaInfo, username));
    }

    /** The author the batch message names, or null when the post carries none. */
    private static String announcedAuthor(MediaData mediaInfo, String username) {
        return getMediaUsername(mediaInfo.getObject()) != null ? username : null;
    }

    // Position is set to -1 if we want to download all medias from the media info object.
    public static void downloadMedia(Context context, MediaData mediaInfo, int position, MediaType mediaType) throws Exception {
        if(!Utils.isNetworkConnected()){
            Utils.showToastShort(str("piko_no_internet"));
            return;
        }
        String username = feedDownloadUsername(mediaInfo);
        String subFolder = getSubfolderName(username);

        if (position != -1) {
            MediaData mediaData = mediaInfo.getMediaAt(position);
            String mediaUrl;
            if (mediaType.equals(MediaType.IMAGE)) {
                mediaUrl = mediaData.getImageLink();
            } else {
                mediaUrl = mediaData.getMediaLink();
            }
            String fileName = username+"_"+mediaData.getDownloadFilename(mediaType);

            DownloadService.download(
                    context,
                    Collections.singletonList(new DownloadService.Item(mediaUrl, subFolder, fileName)),
                    announcedAuthor(mediaInfo, username));

        } else {
            int carouselSize = mediaInfo.getCarouselSize();

            List<DownloadService.Item> items = new ArrayList<>(carouselSize);
            for (int index = 0; index < carouselSize; index++) {
                MediaData currentMediaData = mediaInfo.getMediaAt(index);
                String fileName = username+"_"+currentMediaData.getDownloadFilename(MediaType.ANY);
                String mediaUrl = currentMediaData.getMediaLink();
                items.add(new DownloadService.Item(mediaUrl, subFolder, fileName));
            }
            DownloadService.download(context, items, announcedAuthor(mediaInfo, username));
        }
    }

    private static final Object FEED_DOWNLOAD_BUTTON_TAG = new Object();
    private static final String MEDIA_CLASS_NAME = "com.instagram.feed.media.Media";

    /** Shared by the injected Litho component and the view holder hook. */
    public static boolean isFeedDownloadButtonEnabled() {
        return Settings.feedDownloadButton();
    }

    /** Adds a download button beside the save button; called from the patched row binder on every bind. */
    public static void addFeedDownloadButton(
            View rootView, Object media, UserSession userSession, Object rowState) {
        try {
            if (rootView == null || media == null) return;
            if (!isFeedDownloadButtonEnabled()) {
                removeFeedDownloadButton(rootView);
                return;
            }

            Context context = rootView.getContext();
            int saveButtonId = ResourceUtils.getIdentifier(context, ResourceType.ID, "row_feed_button_save");
            View saveButton = saveButtonId == 0 ? null : rootView.findViewById(saveButtonId);
            if (saveButton == null || !(saveButton.getParent() instanceof ViewGroup)) return;

            // Litho hosts reject added views; their button is built into the component instead.
            ViewGroup buttonGroup = (ViewGroup) saveButton.getParent();
            if (buttonGroup.getClass().getName().startsWith("com.facebook.litho.")) return;

            ImageView button = buttonGroup.findViewWithTag(FEED_DOWNLOAD_BUTTON_TAG);
            if (button == null) {
                button = createFeedDownloadButton(context, saveButton, buttonGroup);
            }
            button.setOnClickListener(
                    v -> downloadPost(context, userSession, media, currentMediaIndex(rowState)));
            button.setOnLongClickListener(v -> {
                downloadPostChooser(context, userSession, media, currentMediaIndex(rowState));
                return true;
            });
        } catch (Exception e) {
            InstagramLogger.printException(() -> "addFeedDownloadButton failure", e);
        }
    }

    /**
     * Live carousel index of a feed row state, read at click time so the download follows a swipe.
     * The patch replaces this body with direct reads of the resolved row state fields.
     */
    static int currentMediaIndex(Object rowState) {
        return 0;
    }

    /** Unwraps a feed row state to the single `Media` it holds; anything else is returned as is. */
    static Object extractMedia(Object source) {
        if (source == null || MEDIA_CLASS_NAME.equals(source.getClass().getName())) return source;
        try {
            for (Field field : source.getClass().getDeclaredFields()) {
                if (!MEDIA_CLASS_NAME.equals(field.getType().getName())) continue;
                field.setAccessible(true);
                Object media = field.get(source);
                if (media != null) return media;
            }
        } catch (Exception e) {
            InstagramLogger.printException(() -> "Could not extract the media from the feed row state", e);
        }
        return source;
    }

    /** Drops the button on rebind so turning the toggle off takes effect without recreating the row. */
    private static void removeFeedDownloadButton(View rootView) {
        View existing = rootView.findViewWithTag(FEED_DOWNLOAD_BUTTON_TAG);
        if (existing == null) return;
        ViewParent parent = existing.getParent();
        if (parent instanceof ViewGroup) ((ViewGroup) parent).removeView(existing);
    }

    private static ImageView createFeedDownloadButton(Context context, View saveButton, ViewGroup buttonGroup) {
        ImageView button = new ImageView(context);
        button.setTag(FEED_DOWNLOAD_BUTTON_TAG);
        button.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        applyFeedDownloadIcon(button, context);
        button.setPadding(
                saveButton.getPaddingLeft(),
                saveButton.getPaddingTop(),
                saveButton.getPaddingRight(),
                saveButton.getPaddingBottom());
        buttonGroup.addView(button, buttonGroup.indexOfChild(saveButton), cloneLayoutParams(saveButton));
        return button;
    }

    /** Copies the save button's slot so the download icon matches its size and spacing. */
    private static ViewGroup.LayoutParams cloneLayoutParams(View saveButton) {
        ViewGroup.LayoutParams saveParams = saveButton.getLayoutParams();
        if (saveParams instanceof LinearLayout.LayoutParams) {
            return new LinearLayout.LayoutParams((LinearLayout.LayoutParams) saveParams);
        }
        if (saveParams instanceof ViewGroup.MarginLayoutParams) {
            return new ViewGroup.MarginLayoutParams((ViewGroup.MarginLayoutParams) saveParams);
        }
        if (saveParams != null) {
            return new ViewGroup.LayoutParams(saveParams.width, saveParams.height);
        }
        return new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    /** Uses the row context: the application context cannot resolve activity scoped theme attributes. */
    private static void applyFeedDownloadIcon(ImageView button, Context context) {
        int drawableId = ResourceUtils.getIdentifier(context, ResourceType.DRAWABLE, DRAWABLE_DOWNLOAD_ICON);
        if (drawableId == 0) return;
        button.setImageDrawable(context.getDrawable(drawableId));

        int attrId = ResourceUtils.getAttrIdentifier("igds_color_primary_icon");
        TypedValue typedValue = new TypedValue();
        if (attrId != 0
                && context.getTheme().resolveAttribute(attrId, typedValue, true)
                && typedValue.resourceId != 0) {
            button.setColorFilter(context.getColor(typedValue.resourceId));
        }
    }

    private static final Object STORY_DOWNLOAD_BUTTON_TAG = new Object();
    private static final String STORY_LIKE_CONTAINER_ID = "toolbar_like_container";

    public static boolean isStoryDownloadButtonEnabled() {
        return Settings.storyDownloadButton();
    }

    /**
     * Adds a download button to the story icon row beside the reply pill; called from the patched
     * toolbar binder on every story bind, so the button is reused and always points at the story
     * currently shown. {@code media} is the story's `Media`, null for stories that carry none.
     */
    public static void addStoryDownloadButton(View buttonsContainer, Object media, UserSession userSession) {
        try {
            if (!(buttonsContainer instanceof ViewGroup)) return;
            ViewGroup row = (ViewGroup) buttonsContainer;

            ImageView button = row.findViewWithTag(STORY_DOWNLOAD_BUTTON_TAG);
            if (media == null || !isStoryDownloadButtonEnabled()) {
                if (button != null) row.removeView(button);
                return;
            }

            Context context = row.getContext();
            if (button == null) {
                button = createStoryDownloadButton(context, row);
                if (button == null) return;
            }
            button.setOnClickListener(v -> downloadStory(v, userSession, media, false));
            button.setOnLongClickListener(v -> {
                if (Settings.directDownload()) downloadStory(v, userSession, media, true);
                return true;
            });
        } catch (Exception e) {
            InstagramLogger.printException(() -> "addStoryDownloadButton failure", e);
        }
    }

    /**
     * A photo story downloads straight away. A video story offers the video or its cover frame as a
     * photo (a story is flattened with its text and stickers either way), unless direct download is on,
     * which keeps the video. Holding the button ([chooser]) offers the choice even then.
     */
    private static void downloadStory(View anchor, UserSession userSession, Object media, boolean chooser) {
        Context context = anchor.getContext();
        try {
            MediaData storyInfo = new MediaData(media);
            boolean directDownload = !chooser && Settings.directDownload();
            boolean video = storyInfo.isVideo();
            InstagramLogger.printInfo(() -> "story download video=" + video + " direct=" + directDownload
                    + " ctx=" + context.getClass().getName());
            if (!video || directDownload) {
                downloadMedia(context, storyInfo, 0, MediaType.ANY);
                return;
            }
            DownloadSheet.showStoryOptions(hostActivityOf(anchor), feedDownloadUsername(storyInfo), new DownloadSheet.StoryListener() {
                @Override
                public void onDownloadVideo() {
                    downloadFromSheet(context, storyInfo, 0);
                }

                @Override
                public void onDownloadPhoto() {
                    try {
                        downloadMedia(context, storyInfo, 0, MediaType.IMAGE);
                    } catch (Exception e) {
                        InstagramLogger.printException(() -> "Error at story photo download", e);
                        Utils.showToastShort(e.getMessage());
                    }
                }
            });
        } catch (Exception e) {
            InstagramLogger.printException(() -> "Error at downloadStory", e);
            Utils.showToastShort(e.getMessage());
        }
    }

    /**
     * The activity hosting a story row. The row is inflated with a themed wrapper around the application
     * context, and the window's decor view uses a `DecorContext`, neither of which reaches an activity.
     * The ancestors the activity itself inflated (such as the content frame) do, so the view tree is walked
     * upwards until one is found. Throws when none is, so the failure is visible instead of silent.
     */
    private static Activity hostActivityOf(View view) {
        View current = view;
        while (current != null) {
            Activity activity = DownloadSheet.findActivity(current.getContext());
            if (activity != null) return activity;
            ViewParent parent = current.getParent();
            current = parent instanceof View ? (View) parent : null;
        }
        throw new IllegalStateException("No activity found above the story download button");
    }

    /** Sized and spaced like the like button, which is the first icon of the row. */
    private static ImageView createStoryDownloadButton(Context context, ViewGroup row) {
        int likeContainerId = ResourceUtils.getIdentifier(context, ResourceType.ID, STORY_LIKE_CONTAINER_ID);
        View model = likeContainerId == 0 ? null : row.findViewById(likeContainerId);
        if (model == null || model.getParent() != row) {
            model = row.getChildCount() == 0 ? null : row.getChildAt(0);
        }
        if (model == null) return null;

        int drawableId = ResourceUtils.getIdentifier(context, ResourceType.DRAWABLE, DRAWABLE_DOWNLOAD_ICON);
        if (drawableId == 0) return null;

        ImageView button = new ImageView(context);
        button.setTag(STORY_DOWNLOAD_BUTTON_TAG);
        button.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        button.setImageDrawable(context.getDrawable(drawableId));
        // The story viewer is always dark, and its icons are white.
        button.setColorFilter(Color.WHITE);
        button.setContentDescription(str("piko_download_current_media"));
        button.setPadding(
                model.getPaddingLeft(), model.getPaddingTop(), model.getPaddingRight(), model.getPaddingBottom());
        row.addView(button, row.indexOfChild(model), cloneLayoutParams(model));
        return button;
    }
}
