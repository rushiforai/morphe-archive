// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.embedcommentimages;

import static app.morphe.extension.shared.StringRef.str;

import android.app.Dialog;
import android.app.DownloadManager;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.ConnectivityManager;
import android.net.Uri;
import android.os.Environment;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ImageSpan;
import android.text.style.URLSpan;
import android.util.TypedValue;
import android.view.GestureDetector;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;
import io.github.joancomasfdz.extension.baconreader.DownloadProgress;
import io.github.joancomasfdz.extension.baconreader.GlideUtils;
import io.github.joancomasfdz.extension.baconreader.ImageDownloader;
import io.github.joancomasfdz.extension.baconreader.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;

/**
 * Shows images from comments and post text as images under the text, instead of the
 * "GIF" word or a bare image link. Small images (emotes) are shown inline in the text.
 * Videos uploaded in comments are played under the text.
 *
 * Gestures on an image: tap switches between 200x200dp and full width, double tap
 * opens a full-screen zoomable viewer, long press downloads (if enabled in settings).
 */
@SuppressWarnings("unused")
public final class EmbedCommentImagesPatch {
    static final int IMAGE_SIZE_DP = 200;
    private static final int PLACEHOLDER_LINES = 2;
    private static final float EXPANDED_MAX_SCREEN_HEIGHT = 0.8f;
    /** <img> tags up to this size (in Reddit's width/height attributes) are emotes. */
    static final int EMOTE_MAX_SIZE = 64;

    // i.redd.it/<id>.<ext> and preview.redd.it/<id>.<ext>?width=..., also under the e2e tests' fake Reddit, which
    // serves them at <fake>/_media/<host>/.
    private static final Pattern REDDIT_MEDIA_ID =
            Pattern.compile("(?i)/(?:i|preview)\\.redd\\.it/([a-z0-9]+)\\.[a-z0-9]+(?:[?#]|$)");
    static final Pattern IMG_TAG = Pattern.compile("<img\\b[^>]*?\\bsrc=\"([^\"]+)\"[^>]*>");
    private static final Pattern WIDTH_ATTR = Pattern.compile("\\bwidth=\"(\\d+)\"");
    private static final Pattern HEIGHT_ATTR = Pattern.compile("\\bheight=\"(\\d+)\"");
    private static final Pattern GIPHY_PAGE = Pattern.compile("^https?://(?:www\\.)?giphy\\.com/gifs/(?:[^/?#]*-)?([A-Za-z0-9]+)/?(?:[?#].*)?$");
    private static final Pattern GIPHY_MEDIA = Pattern.compile("^https?://media\\.giphy\\.com/media/([A-Za-z0-9]+)/");

    /** Images the user resized by tapping (preview URL -> expanded), overriding the default. */
    /**
     * The size of the images loaded before (URL -> {width, height}), so an image shown again starts with
     * its final size: a redraw of the comments (a vote) then does not change their height.
     */
    private static final android.util.LruCache<String, int[]> IMAGE_SIZES = new android.util.LruCache<>(300);
    private static final Map<String, Boolean> SIZE_OVERRIDES = Collections.synchronizedMap(new HashMap<String, Boolean>());
    /** Image slots added below each TextView, so they can be removed when the view is reused. */
    private static final Map<TextView, List<View>> SLOTS = new WeakHashMap<>();
    /** What the slots of each TextView show, so they are kept when the same content is shown again. */
    private static final Map<TextView, String> SLOT_KEYS = new WeakHashMap<>();
    /** Changes every time a TextView is re-bound, so late emote loads for old content are dropped. */
    private static final Map<TextView, Object> GENERATIONS = new WeakHashMap<>();
    /** Image slots removed because their view shows another comment now, so late loads are dropped. */
    private static final Map<View, Boolean> REMOVED_SLOTS = new WeakHashMap<>();
    private static final ExecutorService EMOTE_LOADER = Executors.newFixedThreadPool(2);
    /** Emote ids in comment markdown: ![img](emote|free_emotes_pack|grin), ![gif](emote|t5_2r656|13103). */
    private static final Pattern EMOTE_MARKDOWN = Pattern.compile("!\\[(?:img|gif)\\]\\((emote\\|[^|)\\s]+\\|[^)\\s]+)\\)");
    private static final String SNOOMOJI_PACK = "emote|free_emotes_pack|";
    private static final String SNOOMOJI_URL =
            "https://www.redditstatic.com/marketplace-assets/v1/core/emotes/snoomoji_emotes/free_emotes_pack/";
    /** Markdown of the comment being bound, set by setCommentSource and used by the next embed call. */
    private static String pendingMarkdown;

    private EmbedCommentImagesPatch() {
    }

    /** An image found in the text. */
    static final class ImageRef {
        final String previewUrl;
        final String fullUrl;
        /** Size from Reddit's width/height attributes, or 0 when unknown. */
        final int width;
        final int height;

        ImageRef(String previewUrl, String fullUrl, int width, int height) {
            this.previewUrl = previewUrl;
            this.fullUrl = fullUrl;
            this.width = width;
            this.height = height;
        }
    }

    /**
     * Injected at the start of CommentHolder.handleGifLinkInComment. Returns true when
     * the app's "GIF" link must be skipped because this patch shows the image instead.
     */
    public static boolean skipGifLink() {
        return Settings.SHOW_IMAGES.get();
    }

    /**
     * Injected at the start of CommentHolder.updateView. Reddit's API now sends the same
     * placeholder image for every emote, so the real ones are found from the markdown.
     */
    public static void setCommentSource(Object comment) {
        try {
            pendingMarkdown = (String) comment.getClass().getField("body").get(comment);
        } catch (Throwable t) {
            pendingMarkdown = null;
        }
    }

    /**
     * Injected right after the app sets the text of an image, GIF or video post, under its media
     * (PostMediaHandler). Images are inserted right after the TextView, which must be inside a vertical
     * LinearLayout, and start at full width.
     */
    public static void embed(TextView textView) {
        pendingMarkdown = null;
        markPostText(textView);
        embedText(textView, Collections.<String>emptyList());
    }

    /**
     * Injected right after the app sets the text of a comment (CommentHolder.updateView), after setCommentSource.
     * The media of its bare links show where the links are.
     */
    public static void embedComment(TextView textView) {
        String markdown = pendingMarkdown;
        pendingMarkdown = null;
        embedInPlace(textView, markdown);
    }

    /** Embeds the media of the text, with the ids of its emotes, in order. */
    private static void embedText(TextView textView, List<String> emoteIds) {
        embedText(textView, emoteIds, Collections.<String>emptySet());
    }

    /**
     * Embeds the media of the text, with the ids of its emotes, in order. Media whose mediaKey is in shown, or that
     * the text shows earlier, are not added again.
     */
    private static void embedText(TextView textView, List<String> emoteIds, Set<String> shown) {
        // The app shows the comment again on every change (a vote, a collapsed reply...). Its images are
        // kept when they did not change: new ones would start small and make the list jump.
        List<View> previousSlots = SLOTS.remove(textView);
        String previousKey = SLOT_KEYS.remove(textView);
        boolean keptSlots = false;
        try {
            textView.setVisibility(View.VISIBLE);
            Object generation = new Object();
            GENERATIONS.put(textView, generation);

            Context context = textView.getContext();
            // Images go in slots right after the TextView, so they need a vertical LinearLayout.
            LinearLayout parent = textView.getParent() instanceof LinearLayout
                    && ((LinearLayout) textView.getParent()).getOrientation() == LinearLayout.VERTICAL
                    ? (LinearLayout) textView.getParent() : null;
            boolean imagesOn = parent != null && Settings.SHOW_IMAGES.get();
            boolean videosOn = parent != null && Settings.SHOW_VIDEOS.get();
            boolean titlesOn = Settings.YOUTUBE_TITLES.get();
            // Thumbnails are drawn inside the text; on metered data with "Wi-Fi only" they are skipped.
            boolean thumbnailsOn = Settings.YOUTUBE_THUMBNAILS.get()
                    && !(Settings.IMAGES_WIFI_ONLY.get() && isMetered(context));
            boolean xPostsOn = Settings.X_POSTS.get();
            boolean blueskyPostsOn = Settings.BLUESKY_POSTS.get();
            CharSequence text = fullText(textView);
            if (!(text instanceof Spanned)) return;
            // Emotes are part of the text, drawn whatever "Show images" says: BaconReader would show their <img> tags
            // as text.
            if (!imagesOn && !videosOn && !titlesOn && !thumbnailsOn && !xPostsOn && !blueskyPostsOn
                    && !text.toString().contains("<img")) return;

            SpannableStringBuilder builder = new SpannableStringBuilder(text);
            String plain = builder.toString();
            List<ImageRef> images = new ArrayList<>();
            // Text ranges to delete, or to replace with an inline emote ({start, end, emote index or -1}).
            List<int[]> edits = new ArrayList<>();
            List<String> emoteUrls = new ArrayList<>();
            List<URLSpan> youtubeLinks = new ArrayList<>();
            List<URLSpan> thumbnailLinks = new ArrayList<>();
            List<URLSpan> postLinks = new ArrayList<>();
            List<String> videoIds = new ArrayList<>();
            List<String> albums = new ArrayList<>();
            Set<String> keys = new HashSet<>(shown);

            // Links: either wrap an <img> tag (giphy comments) or point straight at an image.
            for (URLSpan span : builder.getSpans(0, builder.length(), URLSpan.class)) {
                int start = builder.getSpanStart(span);
                int end = builder.getSpanEnd(span);
                String linkText = plain.substring(start, end);
                String link = normalizeLink(span.getURL());
                String videoId = videosOn ? CommentVideo.videoId(link) : null;
                if (videoId != null) {
                    if (keys.add(videoKey(videoId))) videoIds.add(videoId);
                    // Only drop the text when it is the bare link, keep words that were linked.
                    if (linkText.trim().startsWith("http")) edits.add(new int[]{start, end, -1});
                    continue;
                }
                if (SocialPosts.postKey(link, xPostsOn, blueskyPostsOn) != null) {
                    if (SocialPosts.isBareLink(linkText)) postLinks.add(span);
                    continue;
                }
                if (YoutubeTitles.isYoutubeUrl(link)) {
                    if (thumbnailsOn && YoutubeTitles.hasThumbnail(link)) thumbnailLinks.add(span);
                    if (titlesOn && YoutubeTitles.isBareYoutubeLink(linkText, span.getURL())) youtubeLinks.add(span);
                    continue;
                }
                if (!imagesOn) continue;

                if (ImgurAlbum.isAlbum(link)) {
                    if (keys.add(albumKey(link))) albums.add(link);
                    // Only drop the text when it is the bare link, keep words that were linked.
                    if (linkText.trim().startsWith("http")) edits.add(new int[]{start, end, -1});
                    continue;
                }

                Matcher img = IMG_TAG.matcher(linkText);
                if (img.find()) {
                    // Giphy comments: the <img> is a small preview, the link is the full GIF.
                    String preview = unescape(img.group(1));
                    String full = toImageUrl(normalizeLink(span.getURL()));
                    if (full == null) full = preview;
                    if (keys.add(mediaKey(full))) {
                        images.add(new ImageRef(preview, full, width(img.group()), height(img.group())));
                    }
                    edits.add(new int[]{start, end, -1});
                    continue;
                }

                String imageUrl = toImageUrl(normalizeLink(span.getURL()));
                if (imageUrl == null) continue;
                if (keys.add(mediaKey(imageUrl))) images.add(new ImageRef(imageUrl, imageUrl, 0, 0));
                // Only drop the text when it is the bare link, keep words that were linked.
                if (linkText.trim().startsWith("http")) edits.add(new int[]{start, end, -1});
            }

            // <img> tags that are not inside a link: emotes inline, always; anything bigger below the text, with
            // "Show images" on.
            Matcher img = IMG_TAG.matcher(plain);
            while (img.find()) {
                if (isInside(edits, img.start())) continue;
                String src = unescape(img.group(1));
                int width = width(img.group());
                int height = height(img.group());
                if (isEmote(width, height)) {
                    edits.add(new int[]{img.start(), img.end(), emoteUrls.size()});
                    emoteUrls.add(src);
                } else if (imagesOn) {
                    if (keys.add(mediaKey(src))) images.add(new ImageRef(src, src, width, height));
                    edits.add(new int[]{img.start(), img.end(), -1});
                }
            }

            if (emoteIds.size() == emoteUrls.size()) {
                for (int i = 0; i < emoteUrls.size(); i++) {
                    emoteUrls.set(i, emoteUrl(emoteIds.get(i), emoteUrls.get(i)));
                }
            }

            if (edits.isEmpty() && images.isEmpty() && albums.isEmpty() && videoIds.isEmpty()
                    && youtubeLinks.isEmpty() && thumbnailLinks.isEmpty() && postLinks.isEmpty()) return;

            Collections.sort(edits, new Comparator<int[]>() {
                @Override
                public int compare(int[] a, int[] b) {
                    return b[0] - a[0];
                }
            });
            int emoteSize = Math.round(textView.getTextSize() * 1.3f);
            List<Object[]> emoteSpans = new ArrayList<>();
            for (int[] edit : edits) {
                if (edit[2] < 0) {
                    builder.delete(edit[0], edit[1]);
                } else {
                    builder.replace(edit[0], edit[1], "\uFFFC");
                    ColorDrawable empty = new ColorDrawable(Color.TRANSPARENT);
                    empty.setBounds(0, 0, emoteSize, emoteSize);
                    ImageSpan placeholder = new ImageSpan(empty, ImageSpan.ALIGN_BOTTOM);
                    builder.setSpan(placeholder, edit[0], edit[0] + 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                    emoteSpans.add(new Object[]{placeholder, emoteUrls.get(edit[2])});
                }
            }
            List<YoutubeTitles.Pending> pendingTitles = YoutubeTitles.prepare(textView, builder, youtubeLinks);
            // Photos of X and Bluesky posts are skipped where images load only on Wi-Fi.
            boolean postPhotosOn = !(Settings.IMAGES_WIFI_ONLY.get() && isMetered(context));
            List<SocialPosts.Image> postImages = new ArrayList<>();
            List<SocialPosts.Pending> pendingPosts = SocialPosts.prepare(textView, builder, postLinks, postPhotosOn,
                    postImages);
            List<YoutubeTitles.Thumbnail> thumbnails = YoutubeTitles.insertThumbnails(textView, builder, thumbnailLinks,
                    fullWidthFor(textView));
            trimWhitespace(builder);

            if (builder.length() == 0) {
                textView.setVisibility(View.GONE);
            } else {
                textView.setText(builder, TextView.BufferType.SPANNABLE);
            }

            YoutubeTitles.load(textView, generation, pendingTitles);
            SocialPosts.load(textView, generation, pendingPosts, postPhotosOn);
            SocialPosts.loadImages(textView, generation, postImages);
            YoutubeTitles.loadThumbnails(textView, generation, thumbnails);
            for (Object[] emote : emoteSpans) {
                loadEmote(textView, generation, (ImageSpan) emote[0], (String) emote[1], emoteSize);
            }

            if (images.isEmpty() && albums.isEmpty() && videoIds.isEmpty()) return;
            String key = slotKey(images, albums, videoIds);
            if (key.equals(previousKey) && isAttached(parent, previousSlots)) {
                SLOTS.put(textView, previousSlots);
                SLOT_KEYS.put(textView, key);
                keptSlots = true;
                return;
            }
            removeSlots(previousSlots);
            previousSlots = null;
            List<View> slots = new ArrayList<>();
            int index = parent.indexOfChild(textView) + 1;
            for (ImageRef image : images) {
                View slot = createImageSlot(textView, image);
                parent.addView(slot, index++);
                slots.add(slot);
            }
            for (String album : albums) {
                View slot = ImgurAlbum.createSlot(textView, album);
                parent.addView(slot, index++);
                slots.add(slot);
            }
            boolean fullWidth = fullWidthFor(textView);
            int maxHeight = (int) (textView.getResources().getDisplayMetrics().heightPixels * EXPANDED_MAX_SCREEN_HEIGHT);
            boolean loadPreviews = !(Settings.IMAGES_WIFI_ONLY.get() && isMetered(context));
            for (String videoId : videoIds) {
                View slot = CommentVideo.createSlot(textView, videoId, fullWidth, dp(textView, IMAGE_SIZE_DP),
                        maxHeight, loadPreviews);
                parent.addView(slot, index++);
                slots.add(slot);
            }
            SLOTS.put(textView, slots);
            SLOT_KEYS.put(textView, key);
        } catch (Throwable t) {
            ErrorDialog.printException(() -> "embed failed", t);
        } finally {
            if (!keptSlots) removeSlots(previousSlots);
        }
    }

    /**
     * The views put in a text's column in place of its bare media links: each link's media, then a copy of the
     * TextView with the text up to the next link. Only used on the main thread.
     */
    private static final Map<TextView, List<View>> IN_PLACE_VIEWS = new WeakHashMap<>();
    /** What the views in place of a text's links show, to keep them when the same text is shown again. */
    private static final Map<TextView, String> IN_PLACE_KEYS = new WeakHashMap<>();
    /** The TextView each copy shows the rest of. */
    private static final Map<TextView, TextView> COPY_SOURCES = new WeakHashMap<>();
    /** The texts of posts, and their copies: their images start at full width. */
    private static final Map<TextView, Boolean> POST_TEXTS = new WeakHashMap<>();
    /** The touch listener the app gives each comment's TextView, for the TextView's copies. */
    private static final Map<View, View.OnTouchListener> TOUCH_LISTENERS = new WeakHashMap<>();

    /** Makes the media that replaces a bare link, under the given TextView. */
    private interface SlotMaker {
        View make(TextView textView) throws Exception;
    }

    /**
     * A bare link to media in a text: where it is, its media's mediaKey, and what makes the view that shows the media
     * in its place, or null when an earlier link of the text shows the same media.
     */
    private static final class Anchor {
        final int start;
        final int end;
        final String key;
        final SlotMaker slot;

        Anchor(int start, int end, String key, SlotMaker slot) {
            this.start = start;
            this.end = end;
            this.key = key;
            this.slot = slot;
        }
    }

    /**
     * Injected right after the app sets the text of a text post, in its detail view
     * (DetailLinkFragment.updateSelftext) and in card mode (SelftextAdapter.getView). The media of its bare links
     * show where the links are, and its images start at full width.
     */
    public static void embedPostText(TextView textView) {
        pendingMarkdown = null;
        markPostText(textView);
        embedInPlace(textView, null);
    }

    /** Injected right after CommentHolder gives the comment body its touch listener, for the body's copies. */
    public static void rememberTouch(View view, View.OnTouchListener listener) {
        if (listener == null) TOUCH_LISTENERS.remove(view);
        else TOUCH_LISTENERS.put(view, listener);
    }

    static void markPostText(TextView textView) {
        POST_TEXTS.put(textView, Boolean.TRUE);
    }

    /** Whether the images under the TextView start at full width: always in posts, by the setting in comments. */
    static boolean fullWidthFor(TextView textView) {
        return POST_TEXTS.containsKey(textView) || Settings.IMAGES_FULL_WIDTH.get();
    }

    /**
     * Shows the media of the bare links of a comment's or post's text where the links are: the text is cut at each
     * link, the part before the first one stays in the TextView, and each link's media goes under it, followed by
     * the text up to the next link in a copy of the TextView.
     */
    private static void embedInPlace(TextView textView, String markdown) {
        try {
            CharSequence full = fullText(textView);
            List<Anchor> anchors = full instanceof Spanned && !isExpandable(textView)
                    ? anchors(textView, (Spanned) full) : Collections.<Anchor>emptyList();
            if (anchors.isEmpty()) {
                removeInPlace(textView);
                embedText(textView, emoteIds(markdown));
                return;
            }
            Spanned text = (Spanned) full;
            LinearLayout parent = (LinearLayout) textView.getParent();
            List<String> ids = emoteIds(markdown);
            List<SpannableStringBuilder> pieces = new ArrayList<>();
            pieces.add(piece(text, 0, anchors.get(0).start));
            for (int i = 0; i < anchors.size(); i++) {
                int end = i + 1 < anchors.size() ? anchors.get(i + 1).start : text.length();
                pieces.add(piece(text, anchors.get(i).end, end));
            }
            // Each piece gets the ids of its own emotes, when they add up.
            int total = 0;
            int[] counts = new int[pieces.size()];
            for (int i = 0; i < pieces.size(); i++) {
                counts[i] = emoteCount(pieces.get(i));
                total += counts[i];
            }
            List<List<String>> pieceIds = new ArrayList<>();
            int from = 0;
            for (int count : counts) {
                pieceIds.add(total == ids.size()
                        ? new ArrayList<>(ids.subList(from, from + count)) : Collections.<String>emptyList());
                from += count;
            }

            // The media shown in place of the links are not added again under the pieces.
            Set<String> shown = new HashSet<>();
            for (Anchor anchor : anchors) shown.add(anchor.key);
            textView.setText(pieces.get(0), TextView.BufferType.SPANNABLE);
            embedText(textView, pieceIds.get(0), shown);
            if (textView.getText().length() == 0) textView.setVisibility(View.GONE);

            // The app shows a comment again on every change (a vote, a collapsed reply...): the media and the
            // copies are kept when the text did not change, or the list would jump.
            StringBuilder key = new StringBuilder(text.toString()).append('\u0000');
            for (Anchor anchor : anchors) key.append(anchor.start).append(',');
            List<View> previous = IN_PLACE_VIEWS.get(textView);
            if (key.toString().equals(IN_PLACE_KEYS.get(textView)) && previous != null) {
                boolean attached = true;
                for (View view : previous) {
                    if (view.getParent() != parent || REMOVED_SLOTS.containsKey(view)) attached = false;
                }
                if (attached) return;
            }
            removeInPlace(textView);

            List<View> added = new ArrayList<>();
            List<View> textSlots = SLOTS.get(textView);
            int index = parent.indexOfChild(textView) + 1 + (textSlots != null ? textSlots.size() : 0);
            for (int i = 0; i < anchors.size(); i++) {
                SlotMaker maker = anchors.get(i).slot;
                if (maker != null) {
                    View slot = maker.make(textView);
                    parent.addView(slot, index++);
                    added.add(slot);
                }
                SpannableStringBuilder rest = pieces.get(i + 1);
                if (rest.length() == 0) continue;
                TextView copy = copyOf(textView);
                copy.setText(rest, TextView.BufferType.SPANNABLE);
                parent.addView(copy, index++);
                added.add(copy);
                embedText(copy, pieceIds.get(i + 1), shown);
                List<View> copySlots = SLOTS.get(copy);
                index += copySlots != null ? copySlots.size() : 0;
            }
            IN_PLACE_VIEWS.put(textView, added);
            IN_PLACE_KEYS.put(textView, key.toString());
        } catch (Throwable t) {
            ErrorDialog.printException(() -> "embedInPlace failed", t);
        }
    }

    /** How many emotes, small <img> tags outside links, the text has. */
    private static int emoteCount(Spanned text) {
        URLSpan[] links = text.getSpans(0, text.length(), URLSpan.class);
        Matcher img = IMG_TAG.matcher(text);
        int count = 0;
        while (img.find()) {
            boolean inLink = false;
            for (URLSpan link : links) {
                if (img.start() >= text.getSpanStart(link) && img.start() < text.getSpanEnd(link)) inLink = true;
            }
            if (!inLink && isEmote(width(img.group()), height(img.group()))) count++;
        }
        return count;
    }

    /** The bare links of the text whose media are shown, in the order of the text, as embed finds them. */
    private static List<Anchor> anchors(final TextView textView, Spanned text) {
        List<Anchor> result = new ArrayList<>();
        Set<String> keys = new HashSet<>();
        if (!(textView.getParent() instanceof LinearLayout)
                || ((LinearLayout) textView.getParent()).getOrientation() != LinearLayout.VERTICAL) {
            return result;
        }
        boolean imagesOn = Settings.SHOW_IMAGES.get();
        boolean videosOn = Settings.SHOW_VIDEOS.get();
        boolean xPostsOn = Settings.X_POSTS.get();
        boolean blueskyPostsOn = Settings.BLUESKY_POSTS.get();
        String plain = text.toString();
        URLSpan[] spans = text.getSpans(0, text.length(), URLSpan.class);
        final Spanned spanned = text;
        java.util.Arrays.sort(spans, new Comparator<URLSpan>() {
            @Override
            public int compare(URLSpan a, URLSpan b) {
                return Integer.compare(spanned.getSpanStart(a), spanned.getSpanStart(b));
            }
        });
        for (URLSpan span : spans) {
            int start = text.getSpanStart(span);
            int end = text.getSpanEnd(span);
            if (!result.isEmpty() && start < result.get(result.size() - 1).end) continue;
            String linkText = plain.substring(start, end);
            final String link = normalizeLink(span.getURL());
            Matcher img = IMG_TAG.matcher(linkText);
            boolean giphy = imagesOn && link != null && img.find();
            if (!giphy && !linkText.trim().startsWith("http")) continue;
            final String videoId = videosOn ? CommentVideo.videoId(link) : null;
            if (videoId != null) {
                final boolean loadPreviews = !(Settings.IMAGES_WIFI_ONLY.get() && isMetered(textView.getContext()));
                addAnchor(result, keys, start, end, videoKey(videoId), view -> CommentVideo.createSlot(view, videoId,
                        fullWidthFor(view), dp(view, IMAGE_SIZE_DP),
                        (int) (view.getResources().getDisplayMetrics().heightPixels * EXPANDED_MAX_SCREEN_HEIGHT),
                        loadPreviews));
                continue;
            }
            if (SocialPosts.postKey(link, xPostsOn, blueskyPostsOn) != null) continue;
            if (YoutubeTitles.isYoutubeUrl(link)) continue;
            if (!imagesOn || link == null) continue;
            if (ImgurAlbum.isAlbum(link)) {
                addAnchor(result, keys, start, end, albumKey(link), view -> ImgurAlbum.createSlot(view, link));
                continue;
            }
            final ImageRef image;
            if (giphy) {
                String preview = unescape(img.group(1));
                String full = toImageUrl(link);
                image = new ImageRef(preview, full != null ? full : preview, width(img.group()), height(img.group()));
            } else {
                String imageUrl = toImageUrl(link);
                if (imageUrl == null) continue;
                image = new ImageRef(imageUrl, imageUrl, 0, 0);
            }
            addAnchor(result, keys, start, end, mediaKey(image.fullUrl), view -> createImageSlot(view, image));
        }
        return result;
    }

    /**
     * Adds the anchor of a link. A media an earlier link of the text shows: its link is cut, and nothing takes its
     * place.
     */
    private static void addAnchor(List<Anchor> anchors, Set<String> keys, int start, int end, String key,
                                  SlotMaker slot) {
        anchors.add(new Anchor(start, end, key, keys.add(key) ? slot : null));
    }

    /** [start, end) of the text, with its spans, without the blank lines around it. */
    private static SpannableStringBuilder piece(Spanned text, int start, int end) {
        SpannableStringBuilder builder = new SpannableStringBuilder(text, start, end);
        // An empty range keeps the spans that touch it, emptied: a link at the start of the text would be in the
        // piece before it, with no text, and its media would show twice.
        for (URLSpan link : builder.getSpans(0, builder.length(), URLSpan.class)) {
            if (builder.getSpanStart(link) == builder.getSpanEnd(link)) builder.removeSpan(link);
        }
        trimWhitespace(builder);
        return builder;
    }

    /**
     * What names a media across the links and tags of a text: Reddit's id of an uploaded image or GIF, which its
     * i.redd.it and preview.redd.it addresses and its media_metadata entry share, or else its address.
     */
    private static String mediaKey(String url) {
        Matcher id = REDDIT_MEDIA_ID.matcher(url);
        return id.find() ? "reddit:" + id.group(1).toLowerCase(Locale.ROOT) : url;
    }

    private static String videoKey(String videoId) {
        return "video:" + videoId;
    }

    private static String albumKey(String link) {
        return "album:" + link;
    }

    /** A TextView that shows text like the given one does, in its column, and reacts to touches like it. */
    private static TextView copyOf(TextView textView) {
        Context context = textView.getContext();
        TextView copy;
        // The app's ClickableTextView handles the taps on its links itself.
        try {
            copy = textView.getClass().getConstructor(Context.class).newInstance(context);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not copy the post's TextView", ex);
            copy = new TextView(context);
        }
        copy.setTextSize(TypedValue.COMPLEX_UNIT_PX, textView.getTextSize());
        copy.setTextColor(textView.getTextColors());
        if (textView.getLinkTextColors() != null) copy.setLinkTextColor(textView.getLinkTextColors());
        copy.setTypeface(textView.getTypeface());
        copy.setLineSpacing(textView.getLineSpacingExtra(), textView.getLineSpacingMultiplier());
        copy.setPadding(textView.getPaddingLeft(), textView.getPaddingTop(), textView.getPaddingRight(),
                textView.getPaddingBottom());
        copy.setMovementMethod(textView.getMovementMethod());
        // The e2e tests find the text after a media link by it.
        copy.setId(resourceId("baconreader_patches_text_after_media"));
        copy.setOnTouchListener(TOUCH_LISTENERS.get(textView));
        COPY_SOURCES.put(copy, textView);
        if (POST_TEXTS.containsKey(textView)) POST_TEXTS.put(copy, Boolean.TRUE);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = dp(textView, 8);
        if (textView.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams text = (ViewGroup.MarginLayoutParams) textView.getLayoutParams();
            params.leftMargin = text.leftMargin;
            params.rightMargin = text.rightMargin;
        }
        copy.setLayoutParams(params);
        return copy;
    }

    /** Removes the media and the copies embedInPlace put in the column of the TextView. */
    private static void removeInPlace(TextView textView) {
        IN_PLACE_KEYS.remove(textView);
        List<View> old = IN_PLACE_VIEWS.remove(textView);
        if (old == null) return;
        for (View view : old) {
            if (view instanceof TextView) {
                removeSlots(SLOTS.remove(view));
                SLOT_KEYS.remove(view);
                GENERATIONS.remove(view);
                ViewGroup parent = (ViewGroup) view.getParent();
                if (parent != null) parent.removeView(view);
            } else {
                removeSlots(Collections.singletonList(view));
            }
        }
    }

    /** Identifies the images, albums and videos shown under a text. */
    private static String slotKey(List<ImageRef> images, List<String> albums, List<String> videoIds) {
        StringBuilder key = new StringBuilder();
        for (ImageRef image : images) key.append("i:").append(image.previewUrl).append('|').append(image.fullUrl).append('\n');
        for (String album : albums) key.append("a:").append(album).append('\n');
        for (String videoId : videoIds) key.append("v:").append(videoId).append('\n');
        return key.toString();
    }

    /** Whether the slots are still shown under the text. */
    private static boolean isAttached(LinearLayout parent, List<View> slots) {
        if (slots == null || slots.isEmpty()) return false;
        for (View slot : slots) {
            if (slot.getParent() != parent || REMOVED_SLOTS.containsKey(slot)) return false;
        }
        return true;
    }

    /**
     * The whole text of the view. The text of image, GIF and video posts is in an ExpandableTextView, which shows
     * a shortened copy of it until "see more" is tapped.
     */
    static CharSequence fullText(TextView textView) {
        if (isExpandable(textView)) {
            try {
                CharSequence original = (CharSequence) textView.getClass().getMethod("getOriginalText").invoke(textView);
                if (original != null) return original;
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not get the whole text", ex);
            }
        }
        return textView.getText();
    }

    /** After the whole text was changed in place: an ExpandableTextView shows a copy of it, made again here. */
    static void fullTextChanged(TextView textView, CharSequence text) {
        if (isExpandable(textView)) textView.setText(text, TextView.BufferType.SPANNABLE);
    }

    private static boolean isExpandable(TextView textView) {
        return textView.getClass().getName().equals("com.onelouder.baconreader.ExpandableTextView");
    }

    /** Whether the TextView still shows the content a late load was started for. */
    static boolean isCurrent(TextView textView, Object generation) {
        return GENERATIONS.get(textView) == generation;
    }

    /** The view is reused for another comment: drop the images added for the previous one. */
    private static void removeSlots(List<View> old) {
        if (old == null) return;
        for (View slot : old) {
            CommentVideo.release(slot);
            ImgurAlbum.release(slot);
            discardSlot(slot);
            ViewGroup parent = (ViewGroup) slot.getParent();
            if (parent != null) parent.removeView(slot);
        }
    }

    /** Stops loading the image of a slot that is not shown anymore. */
    static void discardSlot(View slot) {
        REMOVED_SLOTS.put(slot, Boolean.TRUE);
        GlideUtils.clear(((ViewGroup) slot).getChildAt(0));
    }

    // region Image slot

    /**
     * A slot shows a placeholder until the image loads, then the image replaces it.
     * When Reddit gives the image size, the placeholder has the exact final size, so the
     * list does not jump; otherwise it is two text lines tall. Colors come from the text
     * color, so it matches light, dark and black themes.
     */
    static View createImageSlot(final TextView textView, ImageRef found) throws Exception {
        int[] loadedSize = found.width > 0 && found.height > 0 ? null : IMAGE_SIZES.get(found.fullUrl);
        final ImageRef image = loadedSize == null ? found
                : new ImageRef(found.previewUrl, found.fullUrl, loadedSize[0], loadedSize[1]);
        final Context context = textView.getContext();
        int textColor = textView.getCurrentTextColor();
        int faintColor = withAlpha(textColor, 0x1A);
        final int mutedColor = withAlpha(textColor, 0x80);
        final int collapsedSize = dp(textView, IMAGE_SIZE_DP);
        final int expandedMaxHeight = (int) (textView.getResources().getDisplayMetrics().heightPixels
                * EXPANDED_MAX_SCREEN_HEIGHT);
        final int lineBoxHeight = Math.max(textView.getLineHeight() * PLACEHOLDER_LINES, dp(textView, 32));

        final FrameLayout slot = new FrameLayout(context);
        slot.setLayoutParams(slotLayoutParams(textView, ViewGroup.LayoutParams.WRAP_CONTENT));

        // The image starts empty (0x0) and grows when Glide sets it.
        final ImageView imageView = new ImageView(context);
        imageView.setId(viewId(image.fullUrl));
        imageView.setAdjustViewBounds(true);
        imageView.setScaleType(ImageView.ScaleType.FIT_START);
        slot.addView(imageView, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        final boolean knownSize = image.width > 0 && image.height > 0;
        final FrameLayout placeholder = knownSize
                ? new AspectRatioFrameLayout(context, (float) image.height / image.width, expandedMaxHeight)
                : new FrameLayout(context);
        GradientDrawable background = new GradientDrawable();
        background.setColor(faintColor);
        background.setCornerRadius(dp(textView, 6));
        placeholder.setBackground(background);
        slot.addView(placeholder, new FrameLayout.LayoutParams(collapsedSize, lineBoxHeight));

        final TextView message = new TextView(context);
        message.setTextColor(mutedColor);
        message.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        message.setVisibility(View.GONE);
        placeholder.addView(message, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));

        // Download progress, at the bottom of the placeholder or of the image when switching to the full image.
        final DownloadProgress progress = new DownloadProgress(context);
        slot.addView(progress.root, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM));

        final boolean[] expanded = {isExpanded(textView, image)};
        final boolean[] fullLoaded = {false};
        final boolean[] loadStarted = {false};
        final Runnable applySize = new Runnable() {
            @Override
            public void run() {
                applySize(slot, imageView, placeholder, image, expanded[0], knownSize,
                        collapsedSize, expandedMaxHeight, lineBoxHeight);
            }
        };
        applySize.run();

        final GlideUtils.LoadCallback firstLoad = new GlideUtils.LoadCallback() {
            @Override
            public void onReady() {
                placeholder.setVisibility(View.GONE);
                Drawable drawable = imageView.getDrawable();
                if (drawable != null && drawable.getIntrinsicWidth() > 0 && drawable.getIntrinsicHeight() > 0) {
                    IMAGE_SIZES.put(image.fullUrl, new int[]{drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight()});
                }
            }

            @Override
            public void onFailed() {
                message.setText(str("revanced_embed_comment_images_unavailable"));
                message.setVisibility(View.VISIBLE);
                progress.fail();
            }
        };
        final Runnable startLoad = new Runnable() {
            @Override
            public void run() {
                if (loadStarted[0]) return;
                loadStarted[0] = true;
                message.setVisibility(View.GONE);
                loadWithProgress(slot, imageView, progress, expanded[0] ? image.fullUrl : image.previewUrl,
                        null, firstLoad);
                fullLoaded[0] = expanded[0] || image.fullUrl.equals(image.previewUrl);
            }
        };

        if (Settings.IMAGES_WIFI_ONLY.get() && isMetered(context)) {
            message.setText(str("revanced_embed_comment_images_tap_to_load"));
            message.setVisibility(View.VISIBLE);
            placeholder.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    startLoad.run();
                }
            });
        } else {
            startLoad.run();
        }

        final GestureDetector gestures = new GestureDetector(context, new GestureDetector.SimpleOnGestureListener() {
            @Override
            public boolean onDown(MotionEvent e) {
                return true;
            }

            @Override
            public boolean onSingleTapConfirmed(MotionEvent e) {
                expanded[0] = !expanded[0];
                SIZE_OVERRIDES.put(image.previewUrl, expanded[0]);
                applySize.run();
                // Swap the small preview for the full image. The preview is loaded as Glide's
                // thumbnail, so it stays on screen until the full one is ready. Reusing the
                // current Drawable as a placeholder is unsafe: Glide may recycle its bitmap.
                if (expanded[0] && !fullLoaded[0]) {
                    fullLoaded[0] = true;
                    loadWithProgress(slot, imageView, progress, image.fullUrl, image.previewUrl, null);
                }
                return true;
            }

            @Override
            public boolean onDoubleTap(MotionEvent e) {
                showViewer(context, image);
                return true;
            }

            @Override
            public void onLongPress(MotionEvent e) {
                if (!Settings.IMAGES_LONG_PRESS_DOWNLOAD.get()) return;
                imageView.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
                download(context, image.fullUrl);
            }
        });
        imageView.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                return gestures.onTouchEvent(event);
            }
        });
        return slot;
    }

    /** Gives an image the size the user chose for another one, unless it has its own. */
    static void inheritSize(ImageRef from, ImageRef to) {
        Boolean expanded = SIZE_OVERRIDES.get(from.previewUrl);
        if (expanded != null && !SIZE_OVERRIDES.containsKey(to.previewUrl)) SIZE_OVERRIDES.put(to.previewUrl, expanded);
    }

    static boolean isExpanded(TextView textView, ImageRef image) {
        Boolean override = SIZE_OVERRIDES.get(image.previewUrl);
        return override != null ? override : fullWidthFor(textView);
    }

    /**
     * Collapsed: fits a 200x200dp box. Expanded: full width, keeping the aspect ratio, at most
     * 80% of the screen height. The placeholder gets the same size the image will have.
     */
    private static void applySize(FrameLayout slot, ImageView imageView, FrameLayout placeholder, ImageRef image,
                                  boolean expanded, boolean knownSize, int collapsedSize, int expandedMaxHeight,
                                  int lineBoxHeight) {
        int width = expanded ? ViewGroup.LayoutParams.MATCH_PARENT : ViewGroup.LayoutParams.WRAP_CONTENT;
        slot.getLayoutParams().width = width;
        imageView.getLayoutParams().width = width;
        imageView.setMaxWidth(expanded ? Integer.MAX_VALUE : collapsedSize);
        imageView.setMaxHeight(expanded ? expandedMaxHeight : collapsedSize);

        ViewGroup.LayoutParams placeholderParams = placeholder.getLayoutParams();
        if (expanded) {
            placeholderParams.width = ViewGroup.LayoutParams.MATCH_PARENT;
            placeholderParams.height = knownSize ? ViewGroup.LayoutParams.WRAP_CONTENT : lineBoxHeight;
        } else if (knownSize) {
            // Like the image: scaled down to fit the box, never up.
            int[] box = image.width <= collapsedSize && image.height <= collapsedSize
                    ? new int[]{image.width, image.height} : fitInBox(image.width, image.height, collapsedSize);
            placeholderParams.width = box[0];
            placeholderParams.height = box[1];
        } else {
            placeholderParams.width = collapsedSize;
            placeholderParams.height = lineBoxHeight;
        }
        slot.requestLayout();
    }

    /** Size of a width x height image scaled to fit a box x box square. */
    static int[] fitInBox(int width, int height, int box) {
        float scale = Math.min((float) box / width, (float) box / height);
        return new int[]{Math.max(1, Math.round(width * scale)), Math.max(1, Math.round(height * scale))};
    }

    static boolean isMetered(Context context) {
        try {
            ConnectivityManager manager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
            return manager != null && manager.isActiveNetworkMetered();
        } catch (Throwable t) {
            return false;
        }
    }

    // endregion

    // region Download progress

    /**
     * Downloads the image with a progress bar, then shows it. If the download fails, Glide loads it instead.
     *
     * @param thumbnailUrl An image shown until the image is loaded, or null.
     */
    private static void loadWithProgress(final FrameLayout slot, final ImageView imageView,
                                         final DownloadProgress progress, final String url,
                                         final String thumbnailUrl, final GlideUtils.LoadCallback callback) {
        progress.start();
        ImageDownloader.download(slot.getContext(), url, new ImageDownloader.Listener() {
            @Override
            public void onProgress(long received, long total) {
                progress.update(received, total);
            }

            @Override
            public void onDownloaded(final File file) {
                progress.stop();
                if (REMOVED_SLOTS.containsKey(slot)) return; // The view shows another comment now.
                try {
                    GlideUtils.load(imageView, file, thumbnailUrl, new GlideUtils.LoadCallback() {
                        @Override
                        public void onReady() {
                            if (callback != null) callback.onReady();
                        }

                        @Override
                        public void onFailed() {
                            // A damaged download: forget it and let Glide load the image itself.
                            //noinspection ResultOfMethodCallIgnored
                            file.delete();
                            loadUrl();
                        }
                    });
                } catch (Exception ex) {
                    ErrorDialog.printException(() -> "load failed", ex);
                }
            }

            @Override
            public void onFailed() {
                progress.stop();
                loadUrl();
            }

            private void loadUrl() {
                if (REMOVED_SLOTS.containsKey(slot)) return;
                try {
                    GlideUtils.load(imageView, url, thumbnailUrl, callback);
                } catch (Exception ex) {
                    ErrorDialog.printException(() -> "load failed", ex);
                }
            }
        });
    }

    // endregion

    // region Full-screen viewer

    /** Full-screen black viewer: pinch to zoom, drag, double tap to zoom, tap or back to close. */
    private static void showViewer(final Context context, final ImageRef image) {
        try {
            final Dialog dialog = new Dialog(context, android.R.style.Theme_Black_NoTitleBar_Fullscreen);
            FrameLayout root = new FrameLayout(context);
            root.setBackgroundColor(Color.BLACK);

            ZoomImageView zoomView = new ZoomImageView(context);
            zoomView.setId(resourceId("baconreader_patches_image_viewer"));
            root.addView(zoomView, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            final ProgressBar spinner = new ProgressBar(context);
            spinner.setIndeterminateTintList(ColorStateList.valueOf(0x99FFFFFF));
            root.addView(spinner, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));

            zoomView.setOnTap(new Runnable() {
                @Override
                public void run() {
                    dialog.dismiss();
                }
            });
            zoomView.setOnLongPress(new Runnable() {
                @Override
                public void run() {
                    if (Settings.IMAGES_LONG_PRESS_DOWNLOAD.get()) download(context, image.fullUrl);
                }
            });
            dialog.setContentView(root);
            dialog.show();

            File downloaded = ImageDownloader.cached(context, image.fullUrl);
            if (downloaded != null) {
                GlideUtils.load(zoomView, downloaded, null, viewerCallback(context, spinner));
                return;
            }
            GlideUtils.load(zoomView, image.fullUrl,
                    image.fullUrl.equals(image.previewUrl) ? null : image.previewUrl,
                    viewerCallback(context, spinner));
        } catch (Throwable t) {
            ErrorDialog.printException(() -> "viewer failed", t);
        }
    }

    private static GlideUtils.LoadCallback viewerCallback(Context context, final ProgressBar spinner) {
        return new GlideUtils.LoadCallback() {
            @Override
            public void onReady() {
                spinner.setVisibility(View.GONE);
            }

            @Override
            public void onFailed() {
                spinner.setVisibility(View.GONE);
                Utils.showToastShort(str("revanced_embed_comment_images_unavailable"));
            }
        };
    }

    // endregion

    // region Emotes

    /** Loads a small image off the main thread and swaps it into the text in place of the placeholder. */
    private static void loadEmote(final TextView textView, final Object generation, final ImageSpan placeholder,
                                  final String url, final int size) {
        EMOTE_LOADER.execute(() -> {
            try {
                final Drawable drawable = GlideUtils.fetch(textView, url, size, size);
                textView.post(() -> replaceEmote(textView, generation, placeholder, drawable, size));
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not load the emote " + url, ex);
            }
        });
    }

    private static void replaceEmote(TextView textView, Object generation, ImageSpan placeholder,
                                     Drawable drawable, int size) {
        if (GENERATIONS.get(textView) != generation) return; // The view shows another comment now.
        CharSequence fullText = fullText(textView);
        if (!(fullText instanceof Spannable)) return;
        Spannable text = (Spannable) fullText;
        int start = text.getSpanStart(placeholder);
        int end = text.getSpanEnd(placeholder);
        if (start < 0) return;
        int width = drawable.getIntrinsicWidth() > 0 && drawable.getIntrinsicHeight() > 0
                ? Math.round(size * (float) drawable.getIntrinsicWidth() / drawable.getIntrinsicHeight())
                : size;
        drawable.setBounds(0, 0, width, size);
        text.removeSpan(placeholder);
        text.setSpan(new ImageSpan(drawable, ImageSpan.ALIGN_BOTTOM), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        fullTextChanged(textView, text);
    }

    /** Emote ids in the order they appear in the markdown. */
    static List<String> emoteIds(String markdown) {
        List<String> ids = new ArrayList<>();
        if (markdown == null) return ids;
        Matcher matcher = EMOTE_MARKDOWN.matcher(markdown);
        while (matcher.find()) ids.add(matcher.group(1));
        return ids;
    }

    /**
     * The image of a Reddit snoomoji (free emotes pack), whose URL follows from its name.
     * Subreddit emotes can not be derived, so they keep the URL Reddit sent.
     */
    static String emoteUrl(String id, String fallback) {
        if (!id.startsWith(SNOOMOJI_PACK)) return fallback;
        String name = id.substring(SNOOMOJI_PACK.length());
        if (!name.matches("[A-Za-z0-9_]+")) return fallback;
        return SNOOMOJI_URL + name + ".gif";
    }

    static boolean isEmote(int width, int height) {
        return width > 0 && height > 0 && width <= EMOTE_MAX_SIZE && height <= EMOTE_MAX_SIZE;
    }

    // endregion

    // region Download

    /** Saves the full-size image to Downloads/BaconReader using the system DownloadManager. */
    private static void download(Context context, String url) {
        try {
            String fileName = fileNameFor(url);
            DownloadManager.Request request = new DownloadManager.Request(Uri.parse(url));
            request.setTitle(fileName);
            request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
            request.setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, "BaconReader/" + fileName);
            DownloadManager manager = (DownloadManager) context.getSystemService(Context.DOWNLOAD_SERVICE);
            manager.enqueue(request);
            Utils.showToastShort(str("revanced_embed_comment_images_downloading"));
        } catch (Throwable t) {
            ErrorDialog.printException(() -> "download failed", t);
            Utils.showToastShort(str("revanced_embed_comment_images_download_failed"));
        }
    }

    /** A readable file name for an image URL, e.g. "giphy-<id>.gif" or the URL's last path segment. */
    static String fileNameFor(String url) {
        Matcher giphy = GIPHY_MEDIA.matcher(url);
        if (giphy.find()) return "giphy-" + giphy.group(1) + ".gif";

        String path = url.replaceFirst("[?#].*$", "");
        String name = path.substring(path.lastIndexOf('/') + 1).replaceAll("[^A-Za-z0-9._-]", "_");
        if (name.isEmpty()) name = "image";
        if (!name.contains(".")) name += ".jpg";
        return name;
    }

    // endregion

    // region URL helpers

    /** Undoes the app's internal-browser rewrite: "browser-activity-https://x" -> "https://x". */
    static String normalizeLink(String url) {
        if (url == null) return null;
        if (url.startsWith("browser-activity-https:")) return "https:" + url.substring("browser-activity-https:".length());
        if (url.startsWith("browser-activity:")) return "http:" + url.substring("browser-activity:".length());
        return url;
    }

    /** Returns a directly loadable image URL for a link, or null when the link is not an image. */
    static String toImageUrl(String url) {
        if (url == null || !url.startsWith("http")) return null;

        Matcher giphy = GIPHY_PAGE.matcher(url);
        if (giphy.matches()) return "https://media.giphy.com/media/" + giphy.group(1) + "/giphy.gif";

        String lower = url.toLowerCase(Locale.ROOT);
        String path = lower.replaceFirst("[?#].*$", "");
        if (path.endsWith(".gifv") && path.contains("imgur.com/")) {
            return url.replaceFirst("(?i)\\.gifv", ".gif");
        }
        if (path.endsWith(".gif") || path.endsWith(".png") || path.endsWith(".jpg")
                || path.endsWith(".jpeg") || path.endsWith(".webp")) {
            return url;
        }
        if (lower.startsWith("https://i.redd.it/") || lower.startsWith("https://preview.redd.it/")) {
            return url;
        }
        return null;
    }

    static String unescape(String url) {
        return url.replace("&amp;", "&");
    }

    /**
     * The id of an image's view, a GIF's apart from an image's (the patch adds both to the app's resources): the e2e
     * tests find the images by it.
     */
    private static int viewId(String url) {
        String path = url.toLowerCase(Locale.ROOT).replaceFirst("[?#].*$", "");
        String name = path.endsWith(".gif") ? "baconreader_patches_comment_gif" : "baconreader_patches_comment_image";
        return resourceId(name);
    }

    /** The id the patch adds to the app's resources as {@code name}, for the e2e tests to find a view by. */
    static int resourceId(String name) {
        int id = ResourceUtils.getIdentifier(ResourceType.ID, name);
        return id == 0 ? View.NO_ID : id;
    }

    /** The width attribute of an <img> tag, or 0. */
    static int width(String tag) {
        return intAttr(WIDTH_ATTR, tag);
    }

    /** The height attribute of an <img> tag, or 0. */
    static int height(String tag) {
        return intAttr(HEIGHT_ATTR, tag);
    }

    private static int intAttr(Pattern pattern, String tag) {
        Matcher matcher = pattern.matcher(tag);
        if (!matcher.find()) return 0;
        try {
            return Integer.parseInt(matcher.group(1));
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    // endregion

    private static boolean isInside(List<int[]> ranges, int index) {
        for (int[] range : ranges) {
            if (index >= range[0] && index < range[1]) return true;
        }
        return false;
    }

    /**
     * Removes the empty lines left before and after the text by removed links.
     */
    private static void trimWhitespace(SpannableStringBuilder builder) {
        int end = builder.length();
        while (end > 0 && isBlank(builder.charAt(end - 1))) end--;
        builder.delete(end, builder.length());
        int start = 0;
        while (start < builder.length() && isBlank(builder.charAt(start))) start++;
        builder.delete(0, start);
    }

    /** Whitespace, including the invisible characters Reddit's editor leaves in comments. */
    static boolean isBlank(char c) {
        return Character.isWhitespace(c) || c == '\u00A0' || c == '\u200B' || c == '\u200C' || c == '\u200D'
                || c == '\uFEFF';
    }

    private static int withAlpha(int color, int alpha) {
        return (color & 0x00FFFFFF) | (alpha << 24);
    }

    /**
     * Called right after card mode inflates a row of the post's text. The row is the TextView alone, so it is put in a
     * vertical LinearLayout, where the images go under it. The column keeps the row's layout params; the text fills
     * its width.
     */
    public static View columnFor(View row) {
        if (!(row instanceof TextView) || row.getParent() != null) return row;
        LinearLayout column = new LinearLayout(row.getContext());
        column.setOrientation(LinearLayout.VERTICAL);
        ViewGroup.LayoutParams params = row.getLayoutParams();
        if (params != null) column.setLayoutParams(params);
        column.addView(row, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return column;
    }

    /**
     * A slot under {@code textView}, {@code width} wide, sits in the text's column. A comment's
     * text is inset by its container's padding, which the slot shares; a post's text by its own
     * margins (24 dp), which the slot copies, or it runs from the screen's edge to the other. A
     * comment's image fills the comment's width, so it leaves out the right margin its text keeps
     * (16 dp).
     */
    static LinearLayout.LayoutParams slotLayoutParams(TextView textView, int width) {
        LinearLayout.LayoutParams params =
                new LinearLayout.LayoutParams(width, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = dp(textView, 4);
        if (textView.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams text =
                    (ViewGroup.MarginLayoutParams) textView.getLayoutParams();
            TextView source = COPY_SOURCES.containsKey(textView) ? COPY_SOURCES.get(textView) : textView;
            boolean comment =
                    source.getId() == ResourceUtils.getIdentifier(ResourceType.ID, "commentBody");
            params.leftMargin = text.leftMargin;
            params.rightMargin = comment ? 0 : text.rightMargin;
        }
        return params;
    }

    private static int dp(View view, int dp) {
        return dp(view.getContext(), dp);
    }

    private static int dp(Context context, int dp) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, dp, context.getResources().getDisplayMetrics()));
    }
}
