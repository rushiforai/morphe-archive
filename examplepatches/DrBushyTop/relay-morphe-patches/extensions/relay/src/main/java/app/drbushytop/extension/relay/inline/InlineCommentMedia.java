package app.drbushytop.extension.relay.inline;

import android.content.res.Resources;
import android.graphics.RectF;
import android.net.Uri;
import android.text.Layout;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.URLSpan;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.MotionEvent;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Draws pictures and GIFs linked from a comment inside the comment, where the link was.
 *
 * <p>These hooks call in here:
 * <ol>
 *   <li>{@link #rememberStory} while Relay parses a post's JSON, to know which posts are NSFW.</li>
 *   <li>{@link #rememberComment} while Relay parses a comment's JSON, because Relay reads
 *   {@code media_metadata} there and throws it away. It carries each picture's real size, so the
 *   comment is laid out at the right height before anything has downloaded.</li>
 *   <li>{@link #inlineMedia} right after Relay turns the comment's HTML into text. Every link to
 *   a picture whose text is the address itself (or Relay's "(GIF)") is drawn by a
 *   {@link MediaSpan}. The link stays on it, so tapping the picture opens Relay's full screen
 *   viewer as before.</li>
 *   <li>{@link #bindCommentBody} just before the comment list puts that text in a view, so the
 *   pictures know how wide they may be and which view to redraw when they arrive.</li>
 *   <li>{@link #touchBelowPicture} when a comment is touched, so the room under a picture
 *   collapses the comment instead of opening the picture.</li>
 * </ol>
 */
@SuppressWarnings("unused")
public final class InlineCommentMedia {
    static final String TAG = "RelayInlineMedia";

    /** What a comment's JSON says that its text does not. */
    private static final class CommentInfo {
        final JSONObject metadata;
        final String postName;
        final boolean postNsfw;

        CommentInfo(JSONObject metadata, String postName, boolean postNsfw) {
            this.metadata = metadata;
            this.postName = postName;
            this.postNsfw = postNsfw;
        }
    }

    private static final Map<Object, CommentInfo> COMMENTS = new WeakHashMap<>();

    /** Recently parsed posts marked NSFW, by {@code t3_<id>}. */
    private static final int NSFW_POSTS_KEPT = 2000;
    private static final Map<String, Boolean> NSFW_POSTS = new java.util.LinkedHashMap<String, Boolean>(64, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
            return size() > NSFW_POSTS_KEPT;
        }
    };

    private InlineCommentMedia() {
    }

    /** Hook: a DataStory is being filled from {@code json}, the post or its {@code data}. */
    public static void rememberStory(JSONObject json) {
        try {
            if (json == null) return;
            JSONObject data = json.optJSONObject("data");
            if (data != null) json = data;
            String name = json.optString("name", "");
            if (!name.startsWith("t3_")) return;
            synchronized (NSFW_POSTS) {
                if (json.optBoolean("over_18")) NSFW_POSTS.put(name, Boolean.TRUE);
                else NSFW_POSTS.remove(name);
            }
            // adb shell setprop log.tag.RelayInlineMedia DEBUG
            if (Log.isLoggable(TAG, Log.DEBUG)) Log.d(TAG, "Post " + name + " NSFW: " + json.optBoolean("over_18"));
        } catch (Throwable t) {
            Log.e(TAG, "rememberStory", t);
        }
    }

    static boolean isNsfwPost(String name) {
        if (name == null) return false;
        synchronized (NSFW_POSTS) {
            return NSFW_POSTS.containsKey(name);
        }
    }

    /** Hook: {@code comment} is a DataComment being built from {@code json}. */
    public static void rememberComment(Object comment, JSONObject json) {
        try {
            if (comment == null || json == null) return;
            String post = json.optString("link_id", "");
            CommentInfo info = new CommentInfo(json.optJSONObject("media_metadata"),
                    post.isEmpty() ? null : post, json.optBoolean("over_18"));
            synchronized (COMMENTS) {
                COMMENTS.put(comment, info);
            }
        } catch (Throwable t) {
            Log.e(TAG, "rememberComment", t);
        }
    }

    /** Hook: returns {@code body} with picture links drawn as pictures. */
    public static Spanned inlineMedia(Object comment, Spanned body) {
        if (body == null) return null;
        try {
            URLSpan[] links = body.getSpans(0, body.length(), URLSpan.class);
            if (links.length == 0) return body;
            // Off, or on mobile data with "Only on Wi-Fi": leave the links as Relay drew them.
            if (!InlineMediaSettings.showInline()) return body;

            CommentInfo info;
            synchronized (COMMENTS) {
                info = COMMENTS.get(comment);
            }
            JSONObject metadata = info != null ? info.metadata : null;

            SpannableStringBuilder out = null;
            for (URLSpan link : links) {
                int start = body.getSpanStart(link);
                int end = body.getSpanEnd(link);
                if (start < 0 || end <= start) continue;
                String label = body.subSequence(start, end).toString().trim();
                if (!isBareLink(label)) continue;

                Media media = resolve(link.getURL(), metadata);
                if (media == null) continue;

                if (out == null) out = new SpannableStringBuilder(body);
                // Keep the address as the text: copying and screen readers still get it.
                out.removeSpan(link);
                out.setSpan(new URLSpan(media.openUrl), start, end, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                out.setSpan(new MediaSpan(media, info != null ? info.postName : null,
                        info != null && info.postNsfw), start, end, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
            }
            return out != null ? out : body;
        } catch (Throwable t) {
            Log.e(TAG, "inlineMedia", t);
            return body;
        }
    }

    /** Hook: {@code view} is about to show {@code text}. */
    public static void bindCommentBody(TextView view, CharSequence text) {
        try {
            if (view == null || !(text instanceof Spanned)) return;
            Spanned spanned = (Spanned) text;
            MediaSpan[] spans = spanned.getSpans(0, spanned.length(), MediaSpan.class);
            if (spans.length == 0) return;
            int width = view.getWidth() - view.getTotalPaddingLeft() - view.getTotalPaddingRight();
            for (MediaSpan span : spans) span.attach(view, width);
        } catch (Throwable t) {
            Log.e(TAG, "bindCommentBody", t);
        }
    }

    /**
     * Hook: the start of Relay's check for whether a touch on a comment's text is on a link.
     * Relay only asks which line was touched, so the room under a picture (and, when the
     * picture ends the comment, everything below the text) counted as the picture.
     *
     * @return true when the touch is below a picture on its line: not on a link, so the touch
     * goes to the comment.
     */
    public static boolean touchBelowPicture(TextView view, MotionEvent event) {
        try {
            if (view == null || event == null) return false;
            CharSequence text = view.getText();
            Layout layout = view.getLayout();
            if (!(text instanceof Spanned) || layout == null || layout.getLineCount() == 0) return false;
            Spanned spanned = (Spanned) text;
            float y = event.getY() - view.getTotalPaddingTop() + view.getScrollY();
            int last = layout.getLineCount() - 1;
            int line = y >= layout.getLineBottom(last) ? last : layout.getLineForVertical((int) y);
            int lineStart = layout.getLineStart(line);
            int lineEnd = layout.getLineEnd(line);
            for (MediaSpan span : spanned.getSpans(lineStart, lineEnd, MediaSpan.class)) {
                int start = spanned.getSpanStart(span);
                if (start >= lineStart && start < lineEnd) return y > layout.getLineBaseline(line);
            }
            return false;
        } catch (Throwable t) {
            Log.e(TAG, "touchBelowPicture", t);
            return false;
        }
    }

    /**
     * Where {@code view} draws pictures (not placeholders), in the view's own coordinates, or
     * null when it draws none. Their corners are rounded by {@link #pictureCornerRadius}.
     */
    public static List<RectF> pictureBounds(TextView view) {
        CharSequence text = view.getText();
        if (!(text instanceof Spanned)) return null;
        Spanned spanned = (Spanned) text;
        MediaSpan[] spans = spanned.getSpans(0, spanned.length(), MediaSpan.class);
        if (spans.length == 0) return null;
        Layout layout = view.getLayout();
        if (layout == null) return null;
        float dx = view.getTotalPaddingLeft() - view.getScrollX();
        float dy = view.getTotalPaddingTop() - view.getScrollY();
        int[] size = new int[2];
        List<RectF> out = null;
        for (MediaSpan span : spans) {
            if (!span.pictureDrawn()) continue;
            int start = spanned.getSpanStart(span);
            if (start < 0) continue;
            int line = layout.getLineForOffset(start);
            float x = dx + layout.getPrimaryHorizontal(start);
            float bottom = dy + layout.getLineBaseline(line);
            span.drawnSize(size);
            if (out == null) out = new ArrayList<>(spans.length);
            out.add(new RectF(x, bottom - size[1], x + size[0], bottom));
        }
        return out;
    }

    public static float pictureCornerRadius() {
        return MediaSpan.dp(MediaSpan.CORNER_RADIUS_DP);
    }

    /** Link text that is the address itself, or Relay's label for a Giphy picture. */
    private static boolean isBareLink(String label) {
        if (label.isEmpty()) return false;
        String lower = label.toLowerCase(Locale.ROOT);
        return lower.equals("(gif)") || lower.startsWith("http://") || lower.startsWith("https://")
                || lower.startsWith("www.") || lower.startsWith("i.redd.it/")
                || lower.startsWith("preview.redd.it/");
    }

    /** What a picture link should draw and open, or null when it is not one. */
    static Media resolve(String url, JSONObject metadata) {
        if (url == null) return null;
        Uri uri = Uri.parse(url);
        String host = uri.getHost();
        String last = uri.getLastPathSegment();
        if (host == null || last == null) return null;
        host = host.toLowerCase(Locale.ROOT);
        String lastLower = last.toLowerCase(Locale.ROOT);

        if (host.equals("giphy.com") || host.equals("www.giphy.com")) {
            // https://giphy.com/gifs/<title>-<id>, written by Reddit for ![gif](giphy|<id>).
            String id = giphyId(last);
            if (id == null) return null;
            JSONObject source = sourceOf(entryOf(metadata, "giphy|" + id));
            String gif = urlIn(source, "gif");
            if (gif.isEmpty()) gif = "https://media.giphy.com/media/" + id + "/giphy.gif";
            String mp4 = urlIn(source, "mp4");
            if (mp4.isEmpty()) mp4 = "https://media.giphy.com/media/" + id + "/giphy.mp4";
            // Giphy's own still of the first frame, at full size.
            String still = "https://media.giphy.com/media/" + id + "/giphy_s.gif";
            return new Media(gif, mp4, still, width(source), height(source), true);
        }

        if (host.equals("i.redd.it") || host.equals("preview.redd.it")
                || host.equals("external-preview.redd.it")) {
            String extension = extensionOf(lastLower);
            if (extension == null) return null;
            int dot = last.lastIndexOf('.');
            String id = dot > 0 ? last.substring(0, dot) : last;
            JSONObject entry = entryOf(metadata, id);
            if (entry == null) {
                // Relay rewrites a Giphy picture's link to Reddit's copy of it, labelled "(GIF)".
                entry = entryWithGif(metadata, url);
            }
            JSONObject source = sourceOf(entry);
            int width = width(source);
            int height = height(source);
            if (width <= 0) {
                width = queryInt(uri, "width");
                height = queryInt(uri, "height");
            }

            if (extension.equals("gif")) {
                String gif = urlIn(source, "gif");
                if (gif.isEmpty()) {
                    String format = uri.getQueryParameter("format");
                    gif = host.equals("preview.redd.it") && format != null
                            ? "https://i.redd.it/" + last : url;
                }
                // Open the MP4 Reddit makes of it: Relay plays that with video controls, and it
                // is a fraction of the GIF's size.
                String mp4 = urlIn(source, "mp4");
                // Reddit's stills of a Giphy picture are tiny thumbnails; Giphy's own is full size.
                String still = null;
                if (entry != null && "giphy".equals(entry.optString("t"))) {
                    String giphy = giphyId(Uri.parse(entry.optString("ext", "")).getLastPathSegment());
                    if (giphy != null) still = "https://media.giphy.com/media/" + giphy + "/giphy_s.gif";
                }
                if (still == null) still = largestPreview(entry);
                return new Media(gif, mp4.isEmpty() ? gif : mp4, still, width, height, true);
            }

            // The same address tapping opens, so Relay's viewer finds it in Glide's cache.
            return new Media(url, url, null, width, height, false);
        }

        if (host.equals("i.imgur.com")) {
            String extension = extensionOf(lastLower);
            if (extension == null) return null;
            if (!extension.equals("gif")) return new Media(url, url, null, 0, 0, false);
            // Imgur's "l" thumbnail (640 px) of a GIF is its first frame.
            String id = last.substring(0, last.lastIndexOf('.'));
            return new Media(url, url, "https://i.imgur.com/" + id + "l.jpg", 0, 0, true);
        }

        return null;
    }

    /** The id in a giphy.com/gifs/ path segment, written {@code <id>} or {@code <title>-<id>}. */
    private static String giphyId(String segment) {
        if (segment == null) return null;
        String id = segment.substring(segment.lastIndexOf('-') + 1);
        return id.isEmpty() ? null : id;
    }

    private static String extensionOf(String lowerSegment) {
        for (String extension : new String[]{"jpg", "jpeg", "png", "webp", "gif"}) {
            if (lowerSegment.endsWith("." + extension)) return extension;
        }
        return null;
    }

    /** A picture's {@code media_metadata} entry, if Reddit has it ready. */
    private static JSONObject entryOf(JSONObject metadata, String id) {
        if (metadata == null) return null;
        JSONObject entry = metadata.optJSONObject(id);
        if (entry == null || !"valid".equals(entry.optString("status"))) return null;
        return entry;
    }

    private static JSONObject sourceOf(JSONObject entry) {
        return entry != null ? entry.optJSONObject("s") : null;
    }

    private static JSONObject entryWithGif(JSONObject metadata, String gif) {
        if (metadata == null) return null;
        JSONArray names = metadata.names();
        if (names == null) return null;
        for (int i = 0; i < names.length(); i++) {
            JSONObject entry = entryOf(metadata, names.optString(i));
            if (entry != null && gif.equals(urlIn(sourceOf(entry), "gif"))) return entry;
        }
        return null;
    }

    /** An address from {@code media_metadata}, which is HTML escaped unless asked for raw. */
    private static String urlIn(JSONObject object, String name) {
        if (object == null) return "";
        return object.optString(name, "").replace("&amp;", "&");
    }

    /** The widest still preview Reddit made of an animated picture (a PNG of its first frame). */
    private static String largestPreview(JSONObject entry) {
        JSONArray previews = entry != null ? entry.optJSONArray("p") : null;
        if (previews == null) return null;
        String best = null;
        int bestWidth = 0;
        for (int i = 0; i < previews.length(); i++) {
            JSONObject preview = previews.optJSONObject(i);
            if (preview == null) continue;
            String address = urlIn(preview, "u");
            if (!address.isEmpty() && preview.optInt("x") > bestWidth) {
                best = address;
                bestWidth = preview.optInt("x");
            }
        }
        return best;
    }

    private static int width(JSONObject source) {
        return source != null ? source.optInt("x") : 0;
    }

    private static int height(JSONObject source) {
        return source != null ? source.optInt("y") : 0;
    }

    private static int queryInt(Uri uri, String name) {
        try {
            String value = uri.getQueryParameter(name);
            return value != null ? Integer.parseInt(value) : 0;
        } catch (RuntimeException e) {
            return 0;
        }
    }

    static int screenWidth() {
        DisplayMetrics metrics = Resources.getSystem().getDisplayMetrics();
        return Math.min(metrics.widthPixels, metrics.heightPixels);
    }

    /** A picture to draw: where to fetch it, what tapping it opens, and its size if known. */
    static final class Media {
        final String loadUrl;
        final String openUrl;
        /** For a GIF, a small still of its first frame to show first, or null. */
        final String stillUrl;
        final int width;
        final int height;
        final boolean animated;

        Media(String loadUrl, String openUrl, String stillUrl, int width, int height, boolean animated) {
            this.loadUrl = loadUrl;
            this.openUrl = openUrl;
            this.stillUrl = stillUrl;
            this.width = width;
            this.height = height;
            this.animated = animated;
        }
    }
}
