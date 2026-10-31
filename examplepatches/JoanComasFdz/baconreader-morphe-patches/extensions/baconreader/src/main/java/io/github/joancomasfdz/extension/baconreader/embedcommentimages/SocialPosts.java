// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.embedcommentimages;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.text.Layout;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.style.ForegroundColorSpan;
import android.text.style.ImageSpan;
import android.text.style.LeadingMarginSpan;
import android.text.style.StyleSpan;
import android.text.style.UnderlineSpan;
import android.text.style.URLSpan;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import io.github.joancomasfdz.extension.baconreader.GlideUtils;
import app.morphe.extension.shared.Logger;

/**
 * Bare X (Twitter) and Bluesky post links show the post in the text: author, date, text and its first photo
 * or video still. Tapping the post opens the link, as tapping the link did.
 * <p>
 * X posts come from X's embed service, the one embedded posts on web pages use. Long posts are cut there, and
 * end with "…". Bluesky posts come from Bluesky's public API.
 */
final class SocialPosts {
    private static final Pattern STATUS = Pattern.compile(
            "^https?://(?:www\\.|mobile\\.)?(?:x|twitter)\\.com/(?:[A-Za-z0-9_]+|i/web)/status(?:es)?/(\\d+)",
            Pattern.CASE_INSENSITIVE);
    private static final String SYNDICATION_URL = "https://cdn.syndication.twimg.com/tweet-result?id=%s&token=%s";
    private static final Pattern BLUESKY_POST = Pattern.compile(
            "^https?://(?:www\\.)?bsky\\.app/profile/([^/?#]+)/post/([A-Za-z0-9]+)", Pattern.CASE_INSENSITIVE);
    private static final String BLUESKY_URL = "https://public.api.bsky.app/xrpc/app.bsky.feed.getPostThread"
            + "?depth=0&parentHeight=0&uri=at://%s/app.bsky.feed.post/%s";
    private static final String X_KEY = "x:";
    private static final String BLUESKY_KEY = "bluesky:";
    private static final int CACHE_SIZE = 100;
    private static final long FRAME_MS = 50;
    private static final int IMAGE_WIDTH_DP = 200;
    /** Tall photos are shown narrower, at most this times as tall as the full width. */
    private static final float MAX_IMAGE_RATIO = 1.25f;
    /** Cached for posts that do not exist anymore or can not be shown (deleted, protected). */
    private static final Post MISSING = new Post("", "", "", null, null, 0, 0, false);

    private static final Map<String, Post> POSTS = Collections.synchronizedMap(
            new LinkedHashMap<String, Post>(32, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Post> eldest) {
                    return size() > CACHE_SIZE;
                }
            });
    private static final ExecutorService LOADER = Executors.newFixedThreadPool(2);

    private SocialPosts() {
    }

    /** What is shown of a post. */
    static final class Post {
        final String name;
        final String handle;
        final String text;
        /** Creation time, or null. */
        final Date date;
        /** First photo or video still, or null. */
        final String imageUrl;
        final int imageWidth;
        final int imageHeight;
        final boolean video;

        Post(String name, String handle, String text, Date date, String imageUrl, int imageWidth, int imageHeight,
             boolean video) {
            this.name = name;
            this.handle = handle;
            this.text = text;
            this.date = date;
            this.imageUrl = imageUrl;
            this.imageWidth = imageWidth;
            this.imageHeight = imageHeight;
            this.video = video;
        }
    }

    /** A link waiting for its post. */
    static final class Pending {
        final ImageSpan spinner;
        final URLSpan link;
        final String id;

        Pending(ImageSpan spinner, URLSpan link, String id) {
            this.spinner = spinner;
            this.link = link;
            this.id = id;
        }
    }

    /** A photo shown in a post, loaded after the post. */
    static final class Image {
        final ImageSpan placeholder;
        final String url;
        final int width;
        final int height;
        final boolean video;

        Image(ImageSpan placeholder, String url, int width, int height, boolean video) {
            this.placeholder = placeholder;
            this.url = url;
            this.width = width;
            this.height = height;
            this.video = video;
        }
    }

    /**
     * Identifies the post of an X, Twitter or Bluesky post link ("x:id" or "bluesky:handle/id"), or null.
     */
    static String postKey(String url, boolean x, boolean bluesky) {
        if (url == null) return null;
        Matcher matcher = STATUS.matcher(url);
        if (x && matcher.find()) return X_KEY + matcher.group(1);
        matcher = BLUESKY_POST.matcher(url);
        if (bluesky && matcher.find()) return BLUESKY_KEY + matcher.group(1) + "/" + matcher.group(2);
        return null;
    }

    /** The text shows the URL itself, not words the author linked. */
    static boolean isBareLink(String linkText) {
        if (linkText == null) return false;
        String text = linkText.trim().toLowerCase(Locale.ROOT);
        return !text.isEmpty() && !text.matches(".*\\s.*")
                && (text.contains("x.com/") || text.contains("twitter.com/") || text.contains("bsky.app/"));
    }

    // region Text

    /**
     * Applied to the new text before it is set: known posts replace their link right away, the others get a
     * spinner after the link.
     *
     * @param images Filled with the photos of the posts shown right away.
     */
    static List<Pending> prepare(TextView textView, SpannableStringBuilder builder, List<URLSpan> links,
                                 boolean loadImages, List<Image> images) {
        List<Pending> pending = new ArrayList<>();
        if (links.isEmpty()) return pending;
        List<URLSpan> sorted = new ArrayList<>(links);
        final SpannableStringBuilder b = builder;
        Collections.sort(sorted, new Comparator<URLSpan>() {
            @Override
            public int compare(URLSpan x, URLSpan y) {
                return b.getSpanStart(y) - b.getSpanStart(x); // From the end, so earlier offsets stay valid.
            }
        });
        int size = Math.round(textView.getTextSize() * 0.85f);
        for (URLSpan link : sorted) {
            int start = builder.getSpanStart(link);
            int end = builder.getSpanEnd(link);
            if (start < 0 || end <= start) continue;
            String id = postKey(EmbedCommentImagesPatch.normalizeLink(link.getURL()), true, true);
            Post post = POSTS.get(id);
            if (post != null) {
                if (post != MISSING) {
                    Image image = replaceWithPost(textView, builder, link, post, loadImages);
                    if (image != null) images.add(image);
                }
                continue;
            }
            YoutubeTitles.SpinnerDrawable drawable = new YoutubeTitles.SpinnerDrawable(textView.getCurrentTextColor(), size);
            ImageSpan spinner = new ImageSpan(drawable, ImageSpan.ALIGN_BOTTOM);
            YoutubeTitles.insertAfterKeepingSpans(builder, start, end, " ￼");
            builder.setSpan(spinner, end + 1, end + 2, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            pending.add(new Pending(spinner, link, id));
        }
        return pending;
    }

    /** Looks the posts up in the background and swaps them in while the view still shows this text. */
    static void load(final TextView textView, final Object generation, List<Pending> pending,
                     final boolean loadImages) {
        if (pending.isEmpty()) return;
        animate(textView, generation, pending);
        for (final Pending p : pending) {
            LOADER.execute(() -> {
                final Post post = fetch(p.id);
                textView.post(() -> apply(textView, generation, p, post, loadImages));
            });
        }
    }

    private static void apply(TextView textView, Object generation, Pending p, Post post, boolean loadImages) {
        try {
            if (!EmbedCommentImagesPatch.isCurrent(textView, generation)) return;
            CharSequence current = EmbedCommentImagesPatch.fullText(textView);
            if (!(current instanceof Spanned)) return;
            if (((Spanned) current).getSpanStart(p.spinner) < 0) return;

            SpannableStringBuilder builder = new SpannableStringBuilder(current);
            int spinnerStart = builder.getSpanStart(p.spinner);
            builder.removeSpan(p.spinner);
            builder.delete(spinnerStart - 1, spinnerStart + 1); // The space and the spinner.
            Image image = null;
            if (post != null && post != MISSING && builder.getSpanStart(p.link) >= 0) {
                image = replaceWithPost(textView, builder, p.link, post, loadImages);
            }
            textView.setText(builder, TextView.BufferType.SPANNABLE);
            if (image != null) loadImages(textView, generation, Collections.singletonList(image));
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not show the X post", ex);
        }
    }

    /**
     * Replaces the link with the post, on lines of its own, with a bar on its left like a quote.
     *
     * @return The photo to load, or null.
     */
    private static Image replaceWithPost(TextView textView, SpannableStringBuilder builder, URLSpan link, Post post,
                                         boolean loadImages) {
        int start = builder.getSpanStart(link);
        int end = builder.getSpanEnd(link);
        int textColor = textView.getCurrentTextColor();
        int mutedColor = (textColor & 0x00FFFFFF) | 0x99000000;

        SpannableStringBuilder block = new SpannableStringBuilder();
        block.append(post.name);
        block.setSpan(new StyleSpan(Typeface.BOLD), 0, block.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        block.append(" @").append(post.handle);
        String date = formatDate(post.date);
        if (date != null) block.append(" · ").append(date);
        // The first line looks like a link, so the post reads as one.
        block.setSpan(new ForegroundColorSpan(textView.getLinkTextColors().getDefaultColor()), 0, block.length(),
                Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        block.setSpan(new UnderlineSpan(), 0, block.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        if (!post.text.isEmpty()) block.append('\n').append(post.text);

        Image image = null;
        if (post.imageUrl != null && loadImages) {
            int[] size = imageSize(textView, post.imageWidth, post.imageHeight);
            block.append("\n￼");
            GradientDrawable box = new GradientDrawable();
            box.setColor((textColor & 0x00FFFFFF) | 0x1A000000);
            box.setCornerRadius(dp(textView, 6));
            box.setBounds(0, 0, size[0], size[1]);
            ImageSpan placeholder = new ImageSpan(box, ImageSpan.ALIGN_BOTTOM);
            block.setSpan(placeholder, block.length() - 1, block.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            image = new Image(placeholder, post.imageUrl, size[0], size[1], post.video);
        }

        // The post opens the link like the link did, without being drawn as one (colored and underlined).
        for (Object span : builder.getSpans(start, end, Object.class)) {
            if (builder.getSpanStart(span) == start && builder.getSpanEnd(span) == end) builder.removeSpan(span);
        }
        builder.replace(start, end, block);
        int blockEnd = start + block.length();
        builder.setSpan(new PlainLinkSpan(link.getURL()), start, blockEnd, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        // Lines of its own: a line break before and after the post, unless the text already has one.
        if (blockEnd < builder.length() && builder.charAt(blockEnd) != '\n') builder.insert(blockEnd, "\n");
        if (start > 0 && builder.charAt(start - 1) != '\n') {
            builder.insert(start, "\n");
            start++;
            blockEnd++;
        }
        builder.setSpan(new QuoteBar(mutedColor, dp(textView, 3), dp(textView, 10)), start, blockEnd,
                Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return image;
    }

    /** Redraws the spinners until every post has arrived or the view shows something else. */
    private static void animate(final TextView textView, final Object generation, final List<Pending> pending) {
        textView.postDelayed(new Runnable() {
            @Override
            public void run() {
                if (!EmbedCommentImagesPatch.isCurrent(textView, generation)) return;
                CharSequence text = EmbedCommentImagesPatch.fullText(textView);
                if (!(text instanceof Spanned)) return;
                boolean spinning = false;
                for (Pending p : pending) {
                    if (((Spanned) text).getSpanStart(p.spinner) >= 0) spinning = true;
                }
                if (!spinning) return;
                textView.invalidate();
                textView.postDelayed(this, FRAME_MS);
            }
        }, FRAME_MS);
    }

    // endregion

    // region Photos

    static void loadImages(final TextView textView, final Object generation, List<Image> images) {
        for (final Image image : images) {
            LOADER.execute(() -> {
                try {
                    final Drawable drawable = GlideUtils.fetch(textView, image.url, image.width, image.height);
                    textView.post(() -> showImage(textView, generation, image, drawable));
                } catch (Exception ex) {
                    Logger.printInfo(() -> "Could not load the X post photo", ex);
                }
            });
        }
    }

    private static void showImage(TextView textView, Object generation, Image image, Drawable drawable) {
        if (!EmbedCommentImagesPatch.isCurrent(textView, generation)) return;
        CharSequence fullText = EmbedCommentImagesPatch.fullText(textView);
        if (!(fullText instanceof Spannable)) return;
        Spannable text = (Spannable) fullText;
        int start = text.getSpanStart(image.placeholder);
        int end = text.getSpanEnd(image.placeholder);
        if (start < 0) return;
        Drawable shown = image.video
                ? new PlayOverlay(drawable, new YoutubeTitles.PlayDrawable(dp(textView, 44))) : drawable;
        shown.setBounds(0, 0, image.width, image.height);
        text.removeSpan(image.placeholder);
        text.setSpan(new ImageSpan(shown, ImageSpan.ALIGN_BOTTOM), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        EmbedCommentImagesPatch.fullTextChanged(textView, text);
    }

    /** The photo's size in the text: the width of a YouTube thumbnail, narrower when the photo is tall. */
    private static int[] imageSize(TextView textView, int width, int height) {
        int baseWidth = EmbedCommentImagesPatch.isFullWidthDefault() ? contentWidth(textView) : dp(textView, IMAGE_WIDTH_DP);
        float ratio = width > 0 && height > 0 ? (float) height / width : 9f / 16f;
        int w = baseWidth;
        int h = Math.round(w * ratio);
        int maxHeight = Math.round(baseWidth * MAX_IMAGE_RATIO);
        if (h > maxHeight) {
            h = maxHeight;
            w = Math.round(h / ratio);
        }
        return new int[]{Math.max(1, w), Math.max(1, h)};
    }

    // endregion

    // region Embed service

    /** The post, MISSING when there is none for this key, or null on a network error (retried later). */
    private static Post fetch(String id) {
        boolean x = id.startsWith(X_KEY);
        for (int attempt = 1; ; attempt++) {
            HttpURLConnection connection = null;
            try {
                String url;
                if (x) {
                    String status = id.substring(X_KEY.length());
                    url = String.format(SYNDICATION_URL, status, token(status));
                } else {
                    String[] parts = id.substring(BLUESKY_KEY.length()).split("/", 2);
                    url = String.format(BLUESKY_URL, java.net.URLEncoder.encode(parts[0], "UTF-8"), parts[1]);
                }
                connection = (HttpURLConnection) new URL(url).openConnection();
                connection.setConnectTimeout(8000);
                connection.setReadTimeout(8000);
                int code = connection.getResponseCode();
                if (code >= 400 && code < 500 && code != 408 && code != 429) {
                    // Deleted, protected or not a post: it will not change by asking again.
                    POSTS.put(id, MISSING);
                    return MISSING;
                }
                if (code != 200) throw new java.io.IOException("HTTP " + code);
                InputStream in = connection.getInputStream();
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buffer = new byte[8192];
                int n;
                while ((n = in.read(buffer)) > 0) out.write(buffer, 0, n);
                JSONObject json = new JSONObject(out.toString("UTF-8"));
                Post post = x ? parse(json) : parseBluesky(json);
                POSTS.put(id, post);
                return post;
            } catch (Exception ex) {
                if (attempt >= GlideUtils.MAX_ATTEMPTS) {
                    Logger.printInfo(() -> "Could not load the post " + id, ex);
                    return null;
                }
                try {
                    Thread.sleep(GlideUtils.RETRY_DELAY_MS * attempt);
                } catch (InterruptedException interrupted) {
                    return null;
                }
            } finally {
                if (connection != null) connection.disconnect();
            }
        }
    }

    static Post parse(JSONObject json) throws Exception {
        JSONObject user = json.optJSONObject("user");
        if (user == null || !json.has("text")) return MISSING; // An empty answer: no such post.
        String text = json.optString("text", "");

        // The text ends with links to its photos (t.co), outside of the displayed range.
        JSONArray range = json.optJSONArray("display_text_range");
        if (range != null && range.length() == 2) {
            int endPoint = Math.min(range.optInt(1, text.length()), text.codePointCount(0, text.length()));
            text = text.substring(0, text.offsetByCodePoints(0, endPoint));
        }
        // Short links show where they go.
        JSONObject entities = json.optJSONObject("entities");
        JSONArray urls = entities == null ? null : entities.optJSONArray("urls");
        for (int i = 0; urls != null && i < urls.length(); i++) {
            JSONObject url = urls.getJSONObject(i);
            String shortUrl = url.optString("url", "");
            if (!shortUrl.isEmpty()) text = text.replace(shortUrl, url.optString("display_url", shortUrl));
        }
        text = unescape(text).trim();
        // Long posts are cut by the embed service.
        if (json.has("note_tweet") && !text.endsWith("…")) text += "…";

        String imageUrl = null;
        int width = 0;
        int height = 0;
        boolean video = false;
        JSONArray media = json.optJSONArray("mediaDetails");
        if (media != null && media.length() > 0) {
            JSONObject first = media.getJSONObject(0);
            imageUrl = first.optString("media_url_https", null);
            JSONObject info = first.optJSONObject("original_info");
            if (info != null) {
                width = info.optInt("width");
                height = info.optInt("height");
            }
            String type = first.optString("type", "");
            video = type.equals("video") || type.equals("animated_gif");
            if (imageUrl != null && imageUrl.startsWith("https://pbs.twimg.com/")) imageUrl += "?name=small";
        }

        return new Post(user.optString("name", ""), user.optString("screen_name", ""), text,
                parseDate(json.optString("created_at", "")), imageUrl, width, height, video);
    }

    /** A Bluesky post (getPostThread). Its first image, video still or link preview is shown. */
    static Post parseBluesky(JSONObject json) throws Exception {
        JSONObject thread = json.optJSONObject("thread");
        JSONObject post = thread == null ? null : thread.optJSONObject("post");
        if (post == null) return MISSING; // Deleted or blocked.
        JSONObject author = post.optJSONObject("author");
        JSONObject record = post.optJSONObject("record");
        if (author == null || record == null) return MISSING;
        String handle = author.optString("handle", "");
        String name = author.optString("displayName", "").trim();

        String imageUrl = null;
        int width = 0;
        int height = 0;
        boolean video = false;
        JSONObject embed = post.optJSONObject("embed");
        if (embed != null && embed.has("media")) embed = embed.optJSONObject("media"); // A quote with media.
        if (embed != null) {
            String type = embed.optString("$type", "");
            JSONObject ratio = null;
            if (type.startsWith("app.bsky.embed.images")) {
                JSONArray images = embed.optJSONArray("images");
                JSONObject first = images == null || images.length() == 0 ? null : images.getJSONObject(0);
                if (first != null) {
                    imageUrl = first.optString("thumb", null);
                    ratio = first.optJSONObject("aspectRatio");
                }
            } else if (type.startsWith("app.bsky.embed.video")) {
                imageUrl = embed.optString("thumbnail", null);
                ratio = embed.optJSONObject("aspectRatio");
                video = true;
            } else if (type.startsWith("app.bsky.embed.external")) {
                JSONObject external = embed.optJSONObject("external");
                if (external != null) imageUrl = external.optString("thumb", null);
            }
            if (ratio != null) {
                width = ratio.optInt("width");
                height = ratio.optInt("height");
            }
        }

        return new Post(name.isEmpty() ? handle : name, handle, record.optString("text", "").trim(),
                parseDate(record.optString("createdAt", "")), imageUrl, width, height, video);
    }

    /** The token X's embed script sends with the post id. */
    static String token(String id) {
        double value = Double.parseDouble(id) / 1e15 * Math.PI;
        StringBuilder result = new StringBuilder(Long.toString((long) value, 36));
        double fraction = value - Math.floor(value);
        for (int i = 0; i < 10 && fraction > 0; i++) {
            fraction *= 36;
            int digit = (int) fraction;
            result.append(Character.forDigit(digit, 36));
            fraction -= digit;
        }
        String token = result.toString().replace("0", "");
        return token.isEmpty() ? "a" : token;
    }

    /** An ISO 8601 time in UTC ("2026-10-02T15:22:58.000Z"); the fraction of seconds is ignored. */
    private static Date parseDate(String value) {
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss", Locale.US);
            format.setTimeZone(TimeZone.getTimeZone("UTC"));
            return format.parse(value.substring(0, 19));
        } catch (Exception ex) {
            return null;
        }
    }

    /** "Oct 2", or "Oct 2, 2025" for another year. */
    private static String formatDate(Date date) {
        if (date == null) return null;
        Calendar then = Calendar.getInstance();
        then.setTime(date);
        boolean thisYear = then.get(Calendar.YEAR) == Calendar.getInstance().get(Calendar.YEAR);
        return new SimpleDateFormat(thisYear ? "MMM d" : "MMM d, yyyy", Locale.getDefault()).format(date);
    }

    static String unescape(String text) {
        return text.replace("&lt;", "<").replace("&gt;", ">").replace("&quot;", "\"").replace("&#39;", "'")
                .replace("&amp;", "&");
    }

    // endregion

    private static int contentWidth(TextView textView) {
        int width = textView.getWidth() - textView.getTotalPaddingLeft() - textView.getTotalPaddingRight();
        if (width <= 0) width = textView.getResources().getDisplayMetrics().widthPixels - dp(textView, 32);
        return width - dp(textView, 13); // The quote bar and its gap.
    }

    private static int dp(TextView view, int value) {
        return Math.round(value * view.getResources().getDisplayMetrics().density);
    }

    /** Opens the link when tapped, like a URLSpan, but keeps the text's own style. */
    private static final class PlainLinkSpan extends URLSpan {
        PlainLinkSpan(String url) {
            super(url);
        }

        @Override
        public void updateDrawState(TextPaint paint) {
        }
    }

    /** A bar on the left of the post's lines, like a quote. */
    private static final class QuoteBar implements LeadingMarginSpan {
        private final int color;
        private final int width;
        private final int gap;

        QuoteBar(int color, int width, int gap) {
            this.color = color;
            this.width = width;
            this.gap = gap;
        }

        @Override
        public int getLeadingMargin(boolean first) {
            return width + gap;
        }

        @Override
        public void drawLeadingMargin(Canvas canvas, Paint paint, int x, int dir, int top, int baseline, int bottom,
                                      CharSequence text, int start, int end, boolean first, Layout layout) {
            Paint.Style style = paint.getStyle();
            int previousColor = paint.getColor();
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(color);
            canvas.drawRect(x, top, x + dir * width, bottom, paint);
            paint.setStyle(style);
            paint.setColor(previousColor);
        }
    }

    /** A video still with a play button in its center. */
    private static final class PlayOverlay extends Drawable {
        private final Drawable image;
        private final Drawable play;

        PlayOverlay(Drawable image, Drawable play) {
            this.image = image;
            this.play = play;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            image.setBounds(b);
            image.draw(canvas);
            int size = Math.min(play.getIntrinsicWidth(), Math.min(b.width(), b.height()) / 2);
            int left = b.centerX() - size / 2;
            int top = b.centerY() - size / 2;
            play.setBounds(left, top, left + size, top + size);
            play.draw(canvas);
        }

        @Override
        public void setAlpha(int alpha) {
            image.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            image.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
