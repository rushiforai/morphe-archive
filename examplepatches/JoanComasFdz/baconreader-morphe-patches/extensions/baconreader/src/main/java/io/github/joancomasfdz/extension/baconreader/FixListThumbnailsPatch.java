// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader;

import android.graphics.RenderEffect;
import android.graphics.Shader;
import android.os.Build;
import android.widget.ImageView;

import androidx.annotation.ChecksSdkIntAtLeast;

import app.morphe.extension.shared.Logger;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Fix list thumbnails.
 *
 * Reddit now sends list thumbnails as signed preview.redd.it URLs
 * ("...?width=140&amp;height=132&amp;auto=webp&amp;s=SIGNATURE"). BaconReader does not request
 * raw_json, so the "&" arrive HTML-escaped, and its thumbnail loader uses them as they are:
 * the server can not find the signature and answers 403, leaving the thumbnail empty.
 *
 * Link posts without a thumbnail get one from Reddit's preview image, the embed, or YouTube.
 * NSFW (with "Show NSFW images" off) and spoiler posts get a blurred one.
 * Crossposts of galleries get the preview of the first image, and BaconReader's own gallery indicator.
 * RedGIFs posts without a thumbnail get theirs from the RedGIFs API when they are shown.
 */
@SuppressWarnings("unused")
public final class FixListThumbnailsPatch {
    /** Smallest preview width used as a list thumbnail (the list shows them at ~70dp). */
    private static final int MIN_PREVIEW_WIDTH = 216;
    private static final Pattern WIDTH = Pattern.compile("[?&]width=(\\d+)");
    static final String NSFW = "#morphe-blur-nsfw";
    static final String SPOILER = "#morphe-blur-spoiler";
    /** A RedGIFs link whose thumbnail is looked up when the row is shown. */
    static final String REDGIFS = "#morphe-redgifs";
    private static final Pattern REDGIFS_ID = Pattern.compile(
            "^https?://(?:[a-z0-9]+\\.)?redgifs\\.com/(?:watch|ifr|i)/([A-Za-z]+)", Pattern.CASE_INSENSITIVE);
    /** RedGIFs id -> thumbnail URL, or "" when the video has none (deleted). */
    private static final Map<String, String> REDGIFS_THUMBNAILS = new ConcurrentHashMap<>();
    /** The post each thumbnail view waits a RedGIFs thumbnail for. */
    private static final Map<ImageView, Object> REDGIFS_LOADING = new WeakHashMap<>();
    private static final ExecutorService REDGIFS_LOADER = Executors.newFixedThreadPool(2);

    private static final float BLUR_RADIUS_DP = 12;
    private static final Pattern VIDEO_ID = Pattern.compile(
            "(?:youtu\\.be/|/(?:shorts|live|embed|v)/)([A-Za-z0-9_-]{11})|[?&]v=([A-Za-z0-9_-]{11})");

    private static Field thumbnailField;

    private FixListThumbnailsPatch() {
    }

    /** Injected at the start of Utils.canShowThumbnail and LinkProcessor.loadThumbnail. */
    public static void fixThumbnail(Object link) {
        if (link == null) return;
        try {
            if (thumbnailField == null) thumbnailField = link.getClass().getField("thumbnail");
            String thumbnail = (String) thumbnailField.get(link);
            String fixed = decide(link, unescape(thumbnail));
            if (fixed != null && !fixed.equals(thumbnail)) thumbnailField.set(link, fixed);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not fix the thumbnail URL", ex);
        }
    }

    /**
     * NSFW posts show their preview when the app's "Show NSFW images" is on, and a blurred one
     * when it is off. Spoilers are always blurred. The blur is remembered in the URL fragment
     * (never sent to the server), so it survives the app saving the link in its database.
     */
    private static String decide(Object link, String thumbnail) throws Exception {
        String marker = marker(thumbnail);
        String plain = withoutMarker(thumbnail);
        String lower = plain == null ? "" : plain.trim().toLowerCase(Locale.ROOT);
        boolean spoiler = SPOILER.equals(marker) || lower.equals("spoiler");
        boolean nsfw = NSFW.equals(marker) || lower.equals("nsfw") || Boolean.TRUE.equals(field(link, "over_18"));
        boolean blur = spoiler || (nsfw && !showNsfwImages());

        // Anything but a URL ("default", "image", "nsfw", "spoiler"...) means there is no thumbnail to show.
        boolean missing = plain == null || !lower.startsWith("http");
        if (missing && !isSelf(link) && (!blur || canBlur())) {
            String found = findThumbnail(link);
            if (found != null) plain = found;
            else {
                // The thumbnail needs the video's name as RedGIFs writes it, which only its API gives.
                String redgifs = redgifsUrl(link);
                if (redgifs != null) plain = redgifs + REDGIFS;
            }
        }
        if (plain == null || !plain.startsWith("http") || !blur || !canBlur()) return plain;
        return plain + (spoiler ? SPOILER : NSFW);
    }

    /**
     * Injected where the post list and the post header read Link.isGallery to show BaconReader's gallery
     * indicator (the lines above the thumbnail): crossposts of galleries are galleries too.
     */
    public static Boolean isGallery(Object link) {
        try {
            Boolean gallery = (Boolean) field(link, "isGallery");
            if (Boolean.TRUE.equals(gallery)) return gallery;
            Object parent = crosspostParent(link);
            if (parent != null && Boolean.TRUE.equals(field(parent, "isGallery"))) return Boolean.TRUE;
            return gallery == null ? Boolean.FALSE : gallery;
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not check if the post is a gallery", ex);
            return Boolean.FALSE;
        }
    }

    /** The post a crosspost shares, or null. */
    private static Object crosspostParent(Object link) {
        try {
            List<?> parents = (List<?>) field(link, "crosspostParents");
            return parents == null || parents.isEmpty() ? null : parents.get(0);
        } catch (Exception ex) {
            return null;
        }
    }

    /**
     * Injected at the start of Utils.canShowThumbnail, after fixThumbnail: a blurred thumbnail is
     * shown even when the app would hide the NSFW post's thumbnail. False lets the app decide.
     */
    public static boolean forceShow(Object link) {
        try {
            return link != null && marker((String) field(link, "thumbnail")) != null;
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * Injected in place of the Imgur step of LinkProcessor.loadThumbnail: the thumbnail of an Imgur post is the
     * image of its link. Done here because the app's own code overwrites the Link register with that URL, and
     * {@link #loadThumbnail} needs the Link.
     *
     * @return The URL to load: the Imgur image, or the given thumbnail.
     */
    public static String imgurThumbnail(Object link, String thumbnail) {
        try {
            String url = (String) field(link, "url");
            Class<?> imgurHandler = Class.forName("com.onelouder.baconreader.imageutils.ImgurHandler");
            if (!(Boolean) imgurHandler.getMethod("isImgur", String.class).invoke(null, url)) return thumbnail;
            String imgurUrl = (String) imgurHandler.getMethod("handleImgurUrl", String.class).invoke(null, url);
            return imgurUrl == null || imgurUrl.isEmpty() ? thumbnail : imgurUrl;
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not get the Imgur thumbnail", ex);
            return thumbnail;
        }
    }

    /**
     * Injected in place of the app's Glide load in LinkProcessor.loadThumbnail: tries again when the
     * thumbnail fails to load, and looks up the thumbnails of RedGIFs posts.
     */
    public static void loadThumbnail(Object requestBuilder, ImageView imageView, Object link) {
        try {
            String thumbnail = (String) field(link, "thumbnail");
            String plain = withoutMarker(thumbnail);
            if (plain != null && plain.endsWith(REDGIFS)) {
                loadRedgifsThumbnail(imageView, link, redgifsId(plain), marker(thumbnail));
                return;
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not check the thumbnail", ex);
        }
        REDGIFS_LOADING.remove(imageView);
        Runnable onFailed = null;
        try {
            // Reddit's thumbnail of a RedGIFs video can be broken: ask RedGIFs for it.
            final String redgifs = redgifsUrl(link);
            if (redgifs != null) {
                final String blurMarker = marker((String) field(link, "thumbnail"));
                onFailed = () -> loadRedgifsThumbnail(imageView, link, redgifsId(redgifs), blurMarker);
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not check the thumbnail", ex);
        }
        GlideUtils.intoWithRetry(requestBuilder, imageView, onFailed);
    }

    /** The RedGIFs link of a post (or of the post it crossposts), or null. */
    private static String redgifsUrl(Object link) {
        for (Object post : new Object[]{link, crosspostParent(link)}) {
            if (post == null) continue;
            for (String name : new String[]{"url", "urlOverriddenByDest"}) {
                try {
                    String url = unescape((String) field(post, name));
                    if (redgifsId(url) != null) return url;
                } catch (Exception ignored) {
                }
            }
        }
        return null;
    }

    private static void loadRedgifsThumbnail(final ImageView imageView, final Object link, final String id,
                                             final String blurMarker) {
        GlideUtils.clear(imageView);
        REDGIFS_LOADING.put(imageView, link);
        String known = REDGIFS_THUMBNAILS.get(id);
        if (known != null) {
            showRedgifsThumbnail(imageView, link, known, blurMarker);
            return;
        }
        REDGIFS_LOADER.execute(() -> {
            String found = fetchRedgifsThumbnail(id);
            if (found == null) return; // Network trouble: try again when the row is shown again.
            REDGIFS_THUMBNAILS.put(id, found);
            imageView.post(() -> showRedgifsThumbnail(imageView, link, found, blurMarker));
        });
    }

    private static void showRedgifsThumbnail(ImageView imageView, Object link, String url, String blurMarker) {
        if (REDGIFS_LOADING.get(imageView) != link || url.isEmpty()) return;
        try {
            // Keep it on the post, so the lookup is not needed the next time.
            link.getClass().getField("thumbnail").set(link, blurMarker == null ? url : url + blurMarker);
            GlideUtils.load(imageView, url, null, null);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not show the RedGIFs thumbnail", ex);
        }
    }

    /**
     * The thumbnail of a RedGIFs video, from its API (with BaconReader's client and token), "" when the video
     * has none (deleted, not found), or null when the API could not be reached. Blocks.
     */
    private static String fetchRedgifsThumbnail(String id) {
        for (int attempt = 1; attempt <= GlideUtils.MAX_ATTEMPTS; attempt++) {
            try {
                Class<?> manager = Class.forName("com.onelouder.baconreader.media.gfycat.RedGifsManager");
                Object instance = manager.getField("INSTANCE").get(null);
                Object call = manager.getMethod("getRedGifInfo", String.class).invoke(instance, id);
                Object response = Class.forName("retrofit2.Call").getMethod("execute").invoke(call);
                int code = (Integer) response.getClass().getMethod("code").invoke(response);
                if (code >= 400 && code < 500 && code != 401 && code != 429) return "";
                Object body = response.getClass().getMethod("body").invoke(response);
                if (body != null) {
                    Object gif = body.getClass().getMethod("getGif").invoke(body);
                    Object urls = gif == null ? null : gif.getClass().getMethod("getUrls").invoke(gif);
                    if (urls != null) {
                        String thumbnail = (String) urls.getClass().getMethod("getThumbnail").invoke(urls);
                        if (thumbnail == null) thumbnail = (String) urls.getClass().getMethod("getPoster").invoke(urls);
                        return thumbnail == null ? "" : thumbnail;
                    }
                }
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not get the RedGIFs thumbnail of " + id, ex);
            }
            try {
                Thread.sleep(GlideUtils.RETRY_DELAY_MS * attempt);
            } catch (InterruptedException ex) {
                return null;
            }
        }
        return null;
    }

    /** The id of a RedGIFs link, or null. */
    static String redgifsId(String url) {
        if (url == null) return null;
        Matcher matcher = REDGIFS_ID.matcher(url);
        return matcher.find() ? matcher.group(1).toLowerCase(Locale.ROOT) : null;
    }

    /** Injected at the start of LinkProcessor.loadThumbnail: blurs the row's thumbnail, or clears the blur. */
    public static void beforeLoad(Object link, ImageView imageView) {
        if (imageView == null || !canBlur()) return;
        try {
            boolean blur = link != null && marker((String) field(link, "thumbnail")) != null;
            float radius = BLUR_RADIUS_DP * imageView.getResources().getDisplayMetrics().density;
            imageView.setRenderEffect(blur ? RenderEffect.createBlurEffect(radius, radius, Shader.TileMode.CLAMP) : null);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not blur the thumbnail", ex);
        }
    }

    static String marker(String thumbnail) {
        if (thumbnail == null) return null;
        if (thumbnail.endsWith(SPOILER)) return SPOILER;
        if (thumbnail.endsWith(NSFW)) return NSFW;
        return null;
    }

    static String withoutMarker(String thumbnail) {
        String marker = marker(thumbnail);
        return marker == null ? thumbnail : thumbnail.substring(0, thumbnail.length() - marker.length());
    }

    /** RenderEffect blur needs Android 12; before that, NSFW and spoiler posts keep the app's icon. */
    @ChecksSdkIntAtLeast(api = Build.VERSION_CODES.S)
    private static boolean canBlur() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.S;
    }

    /** BaconReader's own "Show NSFW images" setting. */
    private static boolean showNsfwImages() {
        try {
            return (Boolean) Class.forName("com.onelouder.baconreader.Preferences")
                    .getMethod("getShowNSFWImages").invoke(null);
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * Reddit's preview image, else the first image of a gallery, else the embed's thumbnail, else the YouTube
     * video thumbnail. Crossposts use the shared post's.
     */
    private static String findThumbnail(Object link) {
        String found = findOwnThumbnail(link);
        if (found != null) return found;
        Object parent = crosspostParent(link);
        return parent == null ? null : findOwnThumbnail(parent);
    }

    private static String findOwnThumbnail(Object link) {
        try {
            Object preview = field(link, "preview");
            List<?> images = preview == null ? null : (List<?>) field(preview, "images");
            if (images != null && !images.isEmpty()) {
                Object image = images.get(0);
                List<?> resolutions = (List<?>) field(image, "resolutions");
                String best = null;
                if (resolutions != null) {
                    for (Object resolution : resolutions) {
                        String url = (String) field(resolution, "url");
                        if (url == null) continue;
                        best = url;
                        if (previewWidth(url) >= MIN_PREVIEW_WIDTH) break;
                    }
                }
                if (best == null) {
                    Object source = field(image, "source");
                    if (source != null) best = (String) field(source, "url");
                }
                if (best != null && best.startsWith("http")) return unescape(best);
            }
            String galleryPreview = galleryPreview(link);
            if (galleryPreview != null) return galleryPreview;

            Object media = field(link, "media");
            Object oembed = media == null ? null : field(media, "oembed");
            String embedThumbnail = oembed == null ? null : (String) field(oembed, "thumbnail_url");
            if (embedThumbnail != null && embedThumbnail.startsWith("http")) return unescape(embedThumbnail);

            String url = unescape((String) field(link, "url"));
            String videoId = youtubeVideoId(url);
            if (videoId != null) return "https://i.ytimg.com/vi/" + videoId + "/mqdefault.jpg";
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not find a thumbnail", ex);
        }
        return null;
    }

    /** A preview of the first image of a Reddit gallery, or null. */
    private static String galleryPreview(Object link) throws Exception {
        Object galleryData = field(link, "redditGalleryData");
        List<?> items = galleryData == null ? null : (List<?>) field(galleryData, "galleryItems");
        java.util.Map<?, ?> metadata = (java.util.Map<?, ?>) field(link, "redditMediaMetadata");
        if (items == null || items.isEmpty() || metadata == null) return null;
        Object media = metadata.get(field(items.get(0), "media_id"));
        List<?> previews = media == null ? null : (List<?>) field(media, "p");
        if (previews == null) return null;
        String best = null;
        for (Object preview : previews) {
            String url = (String) field(preview, "u");
            if (url == null) continue;
            best = url;
            Object width = field(preview, "x");
            if (width != null && Integer.parseInt(width.toString()) >= MIN_PREVIEW_WIDTH) break;
        }
        return best != null && best.startsWith("http") ? unescape(best) : null;
    }

    /** The video id of a YouTube watch, youtu.be, shorts, live or embed link, or null. */
    static String youtubeVideoId(String url) {
        if (url == null) return null;
        String host = url.toLowerCase(Locale.ROOT).replaceFirst("^[a-z-]+://", "").replaceFirst("[/?#:].*$", "");
        if (!host.equals("youtu.be") && !host.equals("youtube.com") && !host.endsWith(".youtube.com")) return null;
        Matcher m = VIDEO_ID.matcher(url);
        return m.find() ? (m.group(1) != null ? m.group(1) : m.group(2)) : null;
    }

    static int previewWidth(String url) {
        Matcher m = WIDTH.matcher(url);
        return m.find() ? Integer.parseInt(m.group(1)) : Integer.MAX_VALUE;
    }

    private static boolean isSelf(Object link) {
        try {
            return Boolean.TRUE.equals(field(link, "is_self"));
        } catch (Throwable t) {
            return true;
        }
    }

    private static Object field(Object target, String name) throws Exception {
        try {
            return target.getClass().getField(name).get(target);
        } catch (NoSuchFieldException notPublic) {
            for (Class<?> type = target.getClass(); type != null; type = type.getSuperclass()) {
                try {
                    Field field = type.getDeclaredField(name);
                    field.setAccessible(true);
                    return field.get(target);
                } catch (NoSuchFieldException ignored) {
                }
            }
            throw notPublic;
        }
    }

    static String unescape(String url) {
        if (url == null || url.indexOf('&') < 0) return url;
        return url.replace("&lt;", "<").replace("&gt;", ">").replace("&quot;", "\"")
                .replace("&#39;", "'").replace("&amp;", "&");
    }
}
