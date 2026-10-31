// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.embedcommentimages;

import static app.morphe.extension.shared.StringRef.str;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.SystemClock;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ImageSpan;
import android.text.style.URLSpan;
import android.widget.TextView;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import io.github.joancomasfdz.extension.baconreader.GlideUtils;
import app.morphe.extension.shared.Logger;

/**
 * Bare YouTube links (the link text is the URL itself) show a small spinner, then the video's
 * title from YouTube's oEmbed endpoint. The link keeps its spans, so it stays clickable and
 * keeps the app's "red YouTube links" color. Links written as [text](url) are left alone.
 */
final class YoutubeTitles {
    private static final String SPINNER_SEPARATOR = "\u00A0";
    private static final int CACHE_SIZE = 300;
    private static final long FRAME_MS = 50;
    private static final int THUMBNAIL_WIDTH_DP = 200;
    private static final Pattern HANDLE = Pattern.compile("/@([^/?#]+)");
    private static final Pattern VIDEO_ID = Pattern.compile(
            "(?:youtu\\.be/|/(?:shorts|live|embed|v)/)([A-Za-z0-9_-]{11})|[?&]v=([A-Za-z0-9_-]{11})");
    /** A channel by its @handle, or one of the channel's pages (videos, shorts...). */
    private static final Pattern CHANNEL = Pattern.compile(
            "^[a-z-]+://[^/]+/(@[^/?#]+)(?:/(?:featured|videos|shorts|streams|playlists|community|about))?/?(?:[?#].*)?$",
            Pattern.CASE_INSENSITIVE);
    private static final Pattern PLAYLIST = Pattern.compile(
            "^[a-z-]+://[^/]+/playlist\\?(?:[^#]*&)?list=([A-Za-z0-9_-]+)", Pattern.CASE_INSENSITIVE);
    /** A 4:3 thumbnail with black bars, as oEmbed gives them; the same image exists in 16:9. */
    private static final Pattern LETTERBOXED_THUMBNAIL = Pattern.compile("^(https://i\\.ytimg\\.com/vi/[^/]+/)hqdefault\\.jpg$");
    private static final Pattern START_PARAM = Pattern.compile("[?&#](?:t|start)=([0-9hms]+)");
    private static final Pattern TIME_PART = Pattern.compile("(\\d+)([hms])");

    /** URL -> "@channel - title", or "" when YouTube has no title for it (removed, private, not a video). */
    private static final Map<String, String> TITLES = Collections.synchronizedMap(
            new LinkedHashMap<String, String>(64, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
                    return size() > CACHE_SIZE;
                }
            });
    /** URL -> thumbnail from oEmbed, for links whose thumbnail does not follow from the URL (playlists). */
    private static final Map<String, String> THUMBNAILS = Collections.synchronizedMap(
            new LinkedHashMap<String, String>(64, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
                    return size() > CACHE_SIZE;
                }
            });
    private static final ExecutorService LOADER = Executors.newFixedThreadPool(2);

    private YoutubeTitles() {
    }

    /** A link waiting for its title. */
    static final class Pending {
        final ImageSpan spinner;
        final URLSpan link;
        final String url;

        Pending(ImageSpan spinner, URLSpan link, String url) {
            this.spinner = spinner;
            this.link = link;
            this.url = url;
        }
    }

    static boolean isYoutubeUrl(String url) {
        if (url == null) return false;
        String host = url.toLowerCase(Locale.ROOT).replaceFirst("^[a-z-]+://", "").replaceFirst("[/?#:].*$", "");
        return host.equals("youtu.be") || host.equals("youtube.com") || host.endsWith(".youtube.com");
    }

    /** The text shows the URL itself (Reddit auto-links, or [url](url)), not words the author linked. */
    static boolean isBareYoutubeLink(String linkText, String url) {
        url = EmbedCommentImagesPatch.normalizeLink(url);
        if (!isYoutubeUrl(url) || linkText == null) return false;
        String text = linkText.trim();
        return !text.isEmpty() && !text.matches(".*\\s.*") && text.toLowerCase(Locale.ROOT).contains("youtu");
    }

    static String oembedUrl(String url) throws Exception {
        return "https://www.youtube.com/oembed?format=json&url=" + URLEncoder.encode(url, "UTF-8");
    }

    /**
     * Applied to the new text before it is set: known titles replace their link text right away,
     * the others get a spinner in front of the link.
     */
    static List<Pending> prepare(TextView textView, SpannableStringBuilder builder, List<URLSpan> links) {
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
            String url = EmbedCommentImagesPatch.normalizeLink(link.getURL());
            // YouTube has no title for channels; the link has their @handle.
            String channel = channelLabel(url);
            if (channel != null) {
                replaceKeepingSpans(builder, start, end, channel);
                continue;
            }
            String title = TITLES.get(url);
            if (title != null) {
                if (!title.isEmpty()) replaceKeepingSpans(builder, start, end, title + suffix(url));
                continue;
            }
            SpinnerDrawable drawable = new SpinnerDrawable(textView.getCurrentTextColor(), size);
            ImageSpan spinner = new ImageSpan(drawable, ImageSpan.ALIGN_BOTTOM);
            insertAfterKeepingSpans(builder, start, end, SPINNER_SEPARATOR + "\uFFFC");
            int spinnerStart = end + SPINNER_SEPARATOR.length();
            builder.setSpan(spinner, spinnerStart, spinnerStart + 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            pending.add(new Pending(spinner, link, url));
        }
        return pending;
    }

    /** Looks the titles up in the background and swaps them in while the view still shows this text. */
    static void load(final TextView textView, final Object generation, List<Pending> pending) {
        if (pending.isEmpty()) return;
        animate(textView, generation, pending);
        for (final Pending p : pending) {
            LOADER.execute(new Runnable() {
                @Override
                public void run() {
                    final String title = fetchTitle(p.url);
                    textView.post(new Runnable() {
                        @Override
                        public void run() {
                            apply(textView, generation, p, title);
                        }
                    });
                }
            });
        }
    }

    private static void apply(TextView textView, Object generation, Pending p, String title) {
        try {
            if (!EmbedCommentImagesPatch.isCurrent(textView, generation)) return;
            CharSequence current = EmbedCommentImagesPatch.fullText(textView);
            if (!(current instanceof Spanned)) return;
            if (((Spanned) current).getSpanStart(p.spinner) < 0) return;

            SpannableStringBuilder builder = new SpannableStringBuilder(current);
            int start = builder.getSpanStart(p.link);
            int end = builder.getSpanEnd(p.link);
            if (title != null && !title.isEmpty() && start >= 0 && end > start) {
                replaceKeepingSpans(builder, start, end, title + suffix(p.url));
            }
            int spinnerStart = builder.getSpanStart(p.spinner);
            builder.removeSpan(p.spinner);
            int from = spinnerStart - SPINNER_SEPARATOR.length();
            if (from >= 0 && builder.subSequence(from, spinnerStart).toString().equals(SPINNER_SEPARATOR)) {
                builder.delete(from, spinnerStart + 1);
            } else {
                builder.delete(spinnerStart, spinnerStart + 1);
            }
            textView.setText(builder, TextView.BufferType.SPANNABLE);
        } catch (Exception t) {
            Logger.printInfo(() -> "Could not show the title", t);
        }
    }

    /** Redraws the spinners until every title has arrived or the view shows something else. */
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

    /** The video title, "" when YouTube has none for this URL, or null on a network error (retried later). */
    private static String fetchTitle(String url) {
        for (int attempt = 1; ; attempt++) {
            HttpURLConnection connection = null;
            try {
                connection = (HttpURLConnection) new URL(oembedUrl(url)).openConnection();
                connection.setConnectTimeout(8000);
                connection.setReadTimeout(8000);
                int code = connection.getResponseCode();
                if (code >= 400 && code < 500) {
                    // Removed, private or not a video: it will not change by asking again.
                    TITLES.put(url, "");
                    return "";
                }
                if (code != 200) throw new java.io.IOException("HTTP " + code);
                InputStream in = connection.getInputStream();
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buffer = new byte[8192];
                int n;
                while ((n = in.read(buffer)) > 0) out.write(buffer, 0, n);
                JSONObject json = new JSONObject(out.toString("UTF-8"));
                String title = label(json.optString("title", ""), json.optString("author_name", ""),
                        json.optString("author_url", ""));
                String thumbnail = json.optString("thumbnail_url", "");
                if (thumbnail.startsWith("https://")) THUMBNAILS.put(url, sixteenByNine(thumbnail));
                TITLES.put(url, title);
                return title;
            } catch (Exception ex) {
                if (attempt >= GlideUtils.MAX_ATTEMPTS) {
                    Logger.printInfo(() -> "Title lookup failed for " + url, ex);
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

    // region URL details

    /** The 11-character video id of a watch, youtu.be, shorts, live or embed link, or null. */
    static String videoId(String url) {
        if (!isYoutubeUrl(url)) return null;
        Matcher m = VIDEO_ID.matcher(url);
        return m.find() ? (m.group(1) != null ? m.group(1) : m.group(2)) : null;
    }

    /** "@handle [Channel]" for a link to a channel, or null. */
    static String channelLabel(String url) {
        if (!isYoutubeUrl(url)) return null;
        Matcher matcher = CHANNEL.matcher(url);
        if (!matcher.matches()) return null;
        String handle = matcher.group(1);
        try {
            handle = URLDecoder.decode(handle, "UTF-8");
        } catch (Exception ignored) {
        }
        return handle + " " + str("revanced_youtube_titles_channel");
    }

    /** Whether the link is a playlist page (youtube.com/playlist?list=...), not a video of a playlist. */
    static boolean isPlaylist(String url) {
        return isYoutubeUrl(url) && PLAYLIST.matcher(url).find();
    }

    /** Whether the link gets a thumbnail: a video, or a playlist (the thumbnail of its first video). */
    static boolean hasThumbnail(String url) {
        return videoId(url) != null || isPlaylist(url);
    }

    static String sixteenByNine(String thumbnailUrl) {
        Matcher m = LETTERBOXED_THUMBNAIL.matcher(thumbnailUrl);
        return m.matches() ? m.group(1) + "mqdefault.jpg" : thumbnailUrl;
    }

    static String thumbnailUrl(String videoId) {
        return "https://i.ytimg.com/vi/" + videoId + "/mqdefault.jpg"; // 320x180, 16:9 without black bars.
    }

    static boolean isShort(String url) {
        return url != null && url.toLowerCase(Locale.ROOT).matches("^[a-z-]+://[^/]+/shorts/.*");
    }

    /** Start time from t= or start= (83, 83s, 1m23s, 1h2m3s), in seconds, or -1. */
    static int startSeconds(String url) {
        if (url == null) return -1;
        Matcher m = START_PARAM.matcher(url);
        if (!m.find()) return -1;
        String value = m.group(1).toLowerCase(Locale.ROOT);
        if (value.matches("\\d+")) {
            // Too many digits for an int: no start time, rather than an error.
            try {
                return Integer.parseInt(value);
            } catch (NumberFormatException ex) {
                return -1;
            }
        }
        Matcher parts = TIME_PART.matcher(value);
        int seconds = 0;
        boolean any = false;
        while (parts.find()) {
            int n = Integer.parseInt(parts.group(1));
            String unit = parts.group(2);
            seconds += unit.equals("h") ? n * 3600 : unit.equals("m") ? n * 60 : n;
            any = true;
        }
        return any ? seconds : -1;
    }

    static String formatTime(int seconds) {
        int h = seconds / 3600;
        int m = seconds % 3600 / 60;
        int sec = seconds % 60;
        return h > 0 ? String.format(Locale.US, "%d:%02d:%02d", h, m, sec) : String.format(Locale.US, "%d:%02d", m, sec);
    }

    /** " (from 1:23)", " [Short]" and " [Playlist]" (localized), added after the title. */
    static String suffix(String url) {
        StringBuilder result = new StringBuilder();
        int start = startSeconds(url);
        if (start > 0) result.append(' ').append(str("revanced_youtube_titles_from_time", formatTime(start)));
        if (isShort(url)) result.append(' ').append(str("revanced_youtube_titles_short"));
        if (isPlaylist(url)) result.append(' ').append(str("revanced_youtube_titles_playlist"));
        return result.toString();
    }

    // endregion

    /** "@channel - Title": the channel's @handle, or its name when it has no handle. */
    static String label(String title, String authorName, String authorUrl) {
        title = title == null ? "" : title.trim();
        if (title.isEmpty()) return "";
        String channel = null;
        Matcher handle = HANDLE.matcher(authorUrl == null ? "" : authorUrl);
        if (handle.find()) {
            try {
                channel = "@" + URLDecoder.decode(handle.group(1), "UTF-8");
            } catch (Exception e) {
                channel = "@" + handle.group(1);
            }
        } else if (authorName != null && !authorName.trim().isEmpty()) {
            channel = authorName.trim();
        }
        return channel == null ? title : channel + " - " + title;
    }

    // region Span helpers

    /** Replaces [start, end) and moves the spans that covered exactly that range (link, color) onto the new text. */
    static void replaceKeepingSpans(SpannableStringBuilder builder, int start, int end, CharSequence replacement) {
        Object[] spans = exactSpans(builder, start, end);
        for (Object span : spans) builder.removeSpan(span);
        builder.replace(start, end, replacement);
        for (Object span : spans) {
            builder.setSpan(span, start, start + replacement.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
    }

    /** Inserts text right after [start, end) without the link's spans growing over it. */
    static void insertAfterKeepingSpans(SpannableStringBuilder builder, int start, int end, CharSequence text) {
        Object[] spans = exactSpans(builder, start, end);
        for (Object span : spans) builder.removeSpan(span);
        builder.insert(end, text);
        for (Object span : spans) {
            builder.setSpan(span, start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
    }

    private static Object[] exactSpans(SpannableStringBuilder builder, int start, int end) {
        List<Object> result = new ArrayList<>();
        for (Object span : builder.getSpans(start, end, Object.class)) {
            if (builder.getSpanStart(span) == start && builder.getSpanEnd(span) == end) result.add(span);
        }
        return result.toArray();
    }

    // endregion

    /** A small rotating arc, drawn in the text color. */
    static final class SpinnerDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF oval = new RectF();
        private final int size;

        SpinnerDrawable(int color, int size) {
            this.size = size;
            paint.setColor((color & 0x00FFFFFF) | 0xB0000000);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeWidth(Math.max(2f, size / 8f));
            setBounds(0, 0, size, size);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            float inset = paint.getStrokeWidth();
            oval.set(b.left + inset, b.top + inset, b.right - inset, b.bottom - inset);
            float angle = (SystemClock.uptimeMillis() % 1000) * 360f / 1000f;
            canvas.drawArc(oval, angle, 270f, false, paint);
        }

        @Override
        public int getIntrinsicWidth() {
            return size;
        }

        @Override
        public int getIntrinsicHeight() {
            return size;
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    // region Thumbnails

    /** A thumbnail drawn in the text, on its own line under the line with its link. */
    static final class Thumbnail {
        final ImageSpan placeholder;
        /** The thumbnail, or null when it has to be looked up from the link (playlists). */
        final String imageUrl;
        final String linkUrl;
        final int width;
        final int height;
        final boolean fullWidth;

        Thumbnail(ImageSpan placeholder, String imageUrl, String linkUrl, int width, int height, boolean fullWidth) {
            this.placeholder = placeholder;
            this.imageUrl = imageUrl;
            this.linkUrl = linkUrl;
            this.width = width;
            this.height = height;
            this.fullWidth = fullWidth;
        }
    }

    /**
     * Adds a line with a 16:9 placeholder after the line of each link. The placeholder has the
     * link's URLSpan too, so tapping the thumbnail opens the video like tapping the link does.
     */
    static List<Thumbnail> insertThumbnails(TextView textView, SpannableStringBuilder builder, List<URLSpan> links,
                                            boolean fullWidth) {
        List<Thumbnail> result = new ArrayList<>();
        if (links.isEmpty()) return result;
        List<URLSpan> sorted = new ArrayList<>(links);
        final SpannableStringBuilder b = builder;
        Collections.sort(sorted, new Comparator<URLSpan>() {
            @Override
            public int compare(URLSpan x, URLSpan y) {
                return b.getSpanStart(y) - b.getSpanStart(x); // From the end, so earlier offsets stay valid.
            }
        });
        int width = fullWidth ? contentWidth(textView) : dp(textView, THUMBNAIL_WIDTH_DP);
        int height = Math.round(width * 9f / 16f);
        for (URLSpan link : sorted) {
            int end = builder.getSpanEnd(link);
            if (end < 0) continue;
            String linkUrl = EmbedCommentImagesPatch.normalizeLink(link.getURL());
            String id = videoId(linkUrl);
            if (id == null && !isPlaylist(linkUrl)) continue;
            int lineEnd = indexOf(builder, '\n', end);
            if (lineEnd < 0) lineEnd = builder.length();
            builder.insert(lineEnd, "\n\uFFFC");
            int at = lineEnd + 1;

            GradientDrawable box = new GradientDrawable();
            box.setColor((textView.getCurrentTextColor() & 0x00FFFFFF) | 0x1A000000);
            box.setCornerRadius(dp(textView, 6));
            box.setBounds(0, 0, width, height);
            ImageSpan placeholder = new ImageSpan(box, ImageSpan.ALIGN_BOTTOM);
            builder.setSpan(placeholder, at, at + 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            builder.setSpan(new URLSpan(link.getURL()), at, at + 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            result.add(new Thumbnail(placeholder, id != null ? thumbnailUrl(id) : null, linkUrl, width, height,
                    fullWidth));
        }
        return result;
    }

    static void loadThumbnails(final TextView textView, final Object generation, List<Thumbnail> thumbnails) {
        for (final Thumbnail thumbnail : thumbnails) {
            LOADER.execute(() -> {
                try {
                    String imageUrl = thumbnail.imageUrl;
                    if (imageUrl == null) {
                        // Playlists: the thumbnail comes with the title.
                        imageUrl = THUMBNAILS.get(thumbnail.linkUrl);
                        if (imageUrl == null && !TITLES.containsKey(thumbnail.linkUrl)) {
                            fetchTitle(thumbnail.linkUrl);
                            imageUrl = THUMBNAILS.get(thumbnail.linkUrl);
                        }
                        if (imageUrl == null) return;
                    }
                    final Drawable image = GlideUtils.fetch(textView, imageUrl, thumbnail.width, thumbnail.height);
                    textView.post(() -> showThumbnail(textView, generation, thumbnail, image));
                } catch (Exception ex) {
                    Logger.printInfo(() -> "Could not load the YouTube thumbnail", ex);
                }
            });
        }
    }

    private static void showThumbnail(TextView textView, Object generation, Thumbnail thumbnail, Drawable image) {
        if (!EmbedCommentImagesPatch.isCurrent(textView, generation)) return;
        CharSequence fullText = EmbedCommentImagesPatch.fullText(textView);
        if (!(fullText instanceof Spannable)) return;
        Spannable text = (Spannable) fullText;
        int start = text.getSpanStart(thumbnail.placeholder);
        int end = text.getSpanEnd(thumbnail.placeholder);
        if (start < 0) return;
        int width = thumbnail.width;
        int height = thumbnail.height;
        if (thumbnail.fullWidth) {
            // The first guess was made before the view had a size; use the real width now.
            int measured = textView.getWidth() - textView.getTotalPaddingLeft() - textView.getTotalPaddingRight();
            if (measured > 0) {
                width = measured;
                height = Math.round(width * 9f / 16f);
            }
        }
        Drawable drawable = new ThumbnailDrawable(image, new PlayDrawable(dp(textView, 44)));
        drawable.setBounds(0, 0, width, height);
        text.removeSpan(thumbnail.placeholder);
        text.setSpan(new ImageSpan(drawable, ImageSpan.ALIGN_BOTTOM), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        EmbedCommentImagesPatch.fullTextChanged(textView, text);
    }

    private static int contentWidth(TextView textView) {
        int width = textView.getWidth() - textView.getTotalPaddingLeft() - textView.getTotalPaddingRight();
        if (width > 0) return width;
        return textView.getResources().getDisplayMetrics().widthPixels - dp(textView, 32);
    }

    private static int indexOf(CharSequence text, char c, int from) {
        for (int i = from; i < text.length(); i++) {
            if (text.charAt(i) == c) return i;
        }
        return -1;
    }

    private static int dp(TextView view, int value) {
        return Math.round(value * view.getResources().getDisplayMetrics().density);
    }

    /** The thumbnail with the play button in its center. */
    private static final class ThumbnailDrawable extends Drawable {
        private final Drawable image;
        private final Drawable play;

        ThumbnailDrawable(Drawable image, Drawable play) {
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

    // endregion

    static final class PlayDrawable extends Drawable {
        private final Paint circle = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint triangle = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final int size;

        PlayDrawable(int size) {
            this.size = size;
            circle.setColor(0x99000000);
            triangle.setColor(0xFFFFFFFF);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            float cx = b.exactCenterX();
            float cy = b.exactCenterY();
            float r = Math.min(b.width(), b.height()) / 2f;
            canvas.drawCircle(cx, cy, r, circle);
            float t = r * 0.45f;
            path.reset();
            path.moveTo(cx - t * 0.7f, cy - t);
            path.lineTo(cx - t * 0.7f, cy + t);
            path.lineTo(cx + t, cy);
            path.close();
            canvas.drawPath(path, triangle);
        }

        @Override
        public int getIntrinsicWidth() {
            return size;
        }

        @Override
        public int getIntrinsicHeight() {
            return size;
        }

        @Override
        public void setAlpha(int alpha) {
            circle.setAlpha(alpha);
            triangle.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            triangle.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
