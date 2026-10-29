package app.mightymorphing.extension.joey;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.ImageDecoder;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.text.Layout;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ImageSpan;
import android.text.style.ReplacementSpan;
import android.text.style.URLSpan;
import android.util.Log;
import android.util.LruCache;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.ImageView;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Inline GIFs, images and emotes in Joey comments.
 *
 * Reddit only sends links or codes in body_html. The real files are in media_metadata,
 * parsed the same way as Infinity for Reddit (JSONUtils.parseMediaMetadata), including
 * the Giphy fallback for entries Reddit now marks "invalid".
 */
@SuppressWarnings("unused")
public final class CommentMedia {
    private static final String TAG = "MightyMedia";
    private static final String MARK = "#mmedia=";
    private static final int POSTER_BYTES = 4 * 1024 * 1024;

    private static final Pattern ANCHOR = Pattern.compile(
            "<a\\s[^>]*?href=\"([^\"]*)\"[^>]*>(.*?)</a>", Pattern.CASE_INSENSITIVE | Pattern.DOTALL);
    private static final Pattern IMG = Pattern.compile(
            "<img\\s[^>]*?src=\"([^\"]*)\"[^>]*>", Pattern.CASE_INSENSITIVE);
    private static final Pattern DIRECT = Pattern.compile(
            "https?://[^\\s\"?#]+?/([^/\\s\"?#]+)\\.(jpe?g|png|gif|webp)(\\?[^\\s\"#]*)?", Pattern.CASE_INSENSITIVE);
    private static final Pattern DIRECT_HINT = Pattern.compile("\\.(jpe?g|png|gif|webp)", Pattern.CASE_INSENSITIVE);
    private static final Pattern IMGUR = Pattern.compile(
            "https?://i\\.imgur\\.com/(\\w+)\\.(jpe?g|png|webp)", Pattern.CASE_INSENSITIVE);
    private static final Pattern MARKDOWN_IMAGE = Pattern.compile("!\\[[^\\]]*\\]\\(([^)\\s]+)\\)");
    private static final Pattern PROCESSING = Pattern.compile("Processing img ([A-Za-z0-9]+)");
    private static final Pattern REDDIT_PLAYER = Pattern.compile("/video/([A-Za-z0-9]+)/player");
    private static final Pattern REDDIT_LINK = Pattern.compile("/link/([A-Za-z0-9]+)/video/");

    private static final Map<String, String> VIDEO_FILE = new ConcurrentHashMap<>();
    private static final LruCache<String, Bitmap> VIDEO_FRAMES = new LruCache<String, Bitmap>(6 * 1024 * 1024) {
        @Override
        protected int sizeOf(String key, Bitmap value) {
            return value.getByteCount();
        }
    };
    private static final ExecutorService LOADER = Executors.newFixedThreadPool(3);
    private static final Map<String, String> YOUTUBE_TITLES = new ConcurrentHashMap<>();
    private static final Pattern YOUTUBE_ID = Pattern.compile(
            "(?:youtube\\.com/(?:watch\\?v=|embed/|shorts/)|youtu\\.be/)([A-Za-z0-9_-]{11})");
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final LruCache<String, byte[]> CACHE = new LruCache<String, byte[]>(24 * 1024 * 1024) {
        @Override
        protected int sizeOf(String key, byte[] value) {
            return value.length;
        }
    };

    private CommentMedia() {
    }

    private static final class Media {
        String key;
        boolean emote;
        boolean gif;
        boolean play;
        boolean lookup;
        String thumb;
        String full;
        int w;
        int h;
    }

    // region HTML

    /**
     * Returns body_html with media turned into marked img tags, or the original html when
     * nothing applies. Called from the comment row with the raw media_metadata json.
     */
    /** Pauses a post or thread GIF on its first frame and marks it, when autoplay is off. */
    public static void holdGif(ImageView view, Drawable gif) {
        if (view == null || gif == null || MorpheSettings.autoplay(view.getContext())) return;
        try {
            gif.getClass().getMethod("seekTo", int.class).invoke(gif, 0);
        } catch (Throwable ignored) {
        }
        if (gif instanceof Animatable) ((Animatable) gif).stop();
        view.setForeground(new KindBadge());
    }

    public static String html(TextView view, String html) {
        if (view != null && onProfile(view) && !MorpheSettings.profileComments(view.getContext())) return html;
        return html(html, null);
    }

    private static boolean onProfile(View view) {
        android.content.Context context = view.getContext();
        while (context instanceof android.content.ContextWrapper) {
            if ("o.o.joey.Activities.UserProfileActivity".equals(context.getClass().getName())) return true;
            context = ((android.content.ContextWrapper) context).getBaseContext();
        }
        return false;
    }

    public static String html(String html, String metadataJson) {
        if (html == null || !MorpheSettings.inlineComments()) return html;
        try {
            if (html.toLowerCase().contains("freeimage.host")) Log.i(TAG, "freeimage comment");
            Map<String, Media> media = metadataJson == null ? new HashMap<>() : sources(metadataJson);
            Matcher player = REDDIT_PLAYER.matcher(html);
            if (player.find() && !VIDEO_FILE.containsKey(player.group(1))) {
                Log.i(TAG, "video comment " + names(metadataJson));
            }
            boolean processing = html.contains("Processing img");
            if (media.isEmpty() && !processing && !REDDIT_PLAYER.matcher(html).find() && !DIRECT_HINT.matcher(html).find() && !ExternalPreview.supported(html) && !html.toLowerCase().contains("imgur.com") && !html.toLowerCase().contains("redgifs.com") && !html.toLowerCase().contains("gfycat.com") && !html.toLowerCase().contains("streamable.com") && !html.toLowerCase().contains("tenor.com") && !html.toLowerCase().contains("giphy.com") && !html.toLowerCase().contains("youtu") && !html.toLowerCase().contains("freeimage.host")) return html;

            boolean escaped = html.indexOf('<') < 0 && html.contains("&lt;");
            String work = escaped ? unescape(html) : html;
            String out = rewrite(work, media);
            if (out.equals(work)) {
                if (!media.isEmpty()) Log.d(TAG, "no match for " + media.keySet() + " in " + snippet(work));
                return html;
            }
            return escaped ? escape(out) : out;
        } catch (Throwable t) {
            Log.w(TAG, "html rewrite failed", t);
            return html;
        }
    }

    private static String rewrite(String html, Map<String, Media> media) {
        StringBuffer sb = new StringBuffer();
        Matcher m = ANCHOR.matcher(html);
        while (m.find()) {
            String href = unescape(m.group(1));
            Media item = matchUrl(href, media);
            if (item == null) item = matchText(unescape(m.group(2)), media);
            if (item == null) item = direct(href);
            if (item == null) item = redditPlayer(href, media);
            String external = item == null ? externalTag(href) : null;
            String replacement = item != null ? tag(item, item.emote ? null : href)
                    : external != null ? external : m.group(0);
            m.appendReplacement(sb, Matcher.quoteReplacement(replacement));
        }
        m.appendTail(sb);
        html = sb.toString();

        sb = new StringBuffer();
        m = MARKDOWN_IMAGE.matcher(html);
        while (m.find()) {
            Media item = media.get(unescape(m.group(1)));
            String replacement = item == null ? m.group(0) : tag(item, null);
            m.appendReplacement(sb, Matcher.quoteReplacement(replacement));
        }
        m.appendTail(sb);
        html = sb.toString();

        sb = new StringBuffer();
        m = IMG.matcher(html);
        while (m.find()) {
            String src = unescape(m.group(1));
            Media item = src.contains(MARK) ? null : matchUrl(src, media);
            String replacement = item == null ? m.group(0) : tag(item, null);
            m.appendReplacement(sb, Matcher.quoteReplacement(replacement));
        }
        m.appendTail(sb);
        html = sb.toString();

        sb = new StringBuffer();
        m = PROCESSING.matcher(html);
        while (m.find()) {
            Media item = media.get(m.group(1));
            if (item == null) {
                m.appendReplacement(sb, Matcher.quoteReplacement(m.group(0)));
                continue;
            }
            m.appendReplacement(sb, Matcher.quoteReplacement(tag(item, null)));
        }
        m.appendTail(sb);
        return attachVideo(sb.toString(), media);
    }

    private static String attachVideo(String html, Map<String, Media> media) {
        if (html.contains(MARK)) return html;
        for (Media item : media.values()) {
            if (!item.play || item.thumb == null || item.thumb.isEmpty()) continue;
            return html + tag(item, item.full);
        }
        return html;
    }

    private static Map<String, Media> sources(String json) throws Exception {
        JSONObject root = new JSONObject(json);
        rememberVideos(root);
        JSONObject meta = root.optJSONObject("media_metadata");
        Map<String, Media> out = meta != null ? parse(meta.toString()) : parse(json);
        redditVideo(root, out);
        String still = poster(root);
        if (!still.isEmpty()) {
            for (Media item : out.values()) {
                if (item.play && (item.thumb == null || item.thumb.isEmpty())) item.thumb = still;
            }
        }
        return out;
    }

    private static void rememberVideos(JSONObject root) {
        if (root == null) return;
        findVideoFiles(root);
        JSONObject video = videoOf(root);
        if (video != null) {
            String file = firstFile(video);
            if (!file.isEmpty()) remember(idOf(file), file);
        }
    }

    private static void findVideoFiles(Object node) {
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            Iterator<String> it = object.keys();
            while (it.hasNext()) {
                String key = it.next();
                Object value = object.opt(key);
                if (value instanceof String) {
                    String url = clean((String) value);
                    if (url.startsWith("http") && (url.contains("v.redd.it") || url.contains(".mp4") || url.contains(".mpd") || url.contains("m3u8"))) {
                        String id = idOf(url);
                        if (!id.isEmpty()) remember(id, url);
                    }
                } else if (value != null) {
                    findVideoFiles(value);
                }
            }
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) findVideoFiles(array.opt(i));
        }
    }

    private static String firstFile(JSONObject video) {
        String scrubber = firstHttp(video, "scrubber_media_url");
        if (!scrubber.isEmpty()) return scrubber;
        String fallback = firstHttp(video, "fallback_url");
        if (!fallback.isEmpty()) return fallback;
        return firstHttp(video, "dash_url", "hls_url");
    }

    private static String firstHttp(JSONObject object, String... keys) {
        if (object == null) return "";
        for (String key : keys) {
            String value = clean(object.optString(key, ""));
            if (value.startsWith("http")) return value;
        }
        return "";
    }

    private static void remember(String id, String url) {
        if (id == null || id.isEmpty() || url == null || url.isEmpty()) return;
        String existing = VIDEO_FILE.get(id);
        if (existing == null || url.contains("DASH_96") || url.contains("DASH_240") || existing.contains("DASHPlaylist")) {
            VIDEO_FILE.put(id, url);
        }
    }

    private static String idOf(String url) {
        if (url == null) return "";
        Matcher id = Pattern.compile("v\\.redd\\.it/([A-Za-z0-9]+)").matcher(url);
        return id.find() ? id.group(1) : "";
    }

    private static void redditVideo(JSONObject root, Map<String, Media> out) {
        JSONObject video = videoOf(root);
        if (video == null) return;
        String mp4 = firstFile(video);
        if (!mp4.isEmpty()) remember(idOf(mp4), mp4);
        String poster = poster(root);
        if (poster.isEmpty()) return;
        Media item = new Media();
        item.key = "reddit_video";
        item.play = true;
        item.thumb = poster;
        item.full = mp4.isEmpty() ? poster : mp4;
        item.w = video.optInt("width");
        item.h = video.optInt("height");
        out.put(item.key, item);
    }

    private static String previewFrame(JSONObject entry) {
        JSONArray frames = entry.optJSONArray("p");
        if (frames == null) return "";
        for (int i = 0; i < frames.length(); i++) {
            JSONObject candidate = frames.optJSONObject(i);
            if (candidate != null && candidate.optInt("x") >= 320) {
                String url = clean(candidate.optString("u", ""));
                if (!url.isEmpty()) return url;
            }
        }
        JSONObject last = frames.optJSONObject(frames.length() - 1);
        return last == null ? "" : clean(last.optString("u", ""));
    }

    private static String poster(JSONObject root) {
        JSONObject preview = root.optJSONObject("preview");
        JSONArray images = preview == null ? null : preview.optJSONArray("images");
        JSONObject image = images == null || images.length() == 0 ? null : images.optJSONObject(0);
        if (image == null) return "";
        JSONObject source = image.optJSONObject("source");
        String url = source == null ? "" : clean(source.optString("url", ""));
        JSONArray resolutions = image.optJSONArray("resolutions");
        if (resolutions != null) {
            for (int i = 0; i < resolutions.length(); i++) {
                JSONObject candidate = resolutions.optJSONObject(i);
                if (candidate != null && candidate.optInt("width") >= 320) {
                    String sized = clean(candidate.optString("url", ""));
                    if (!sized.isEmpty()) return sized;
                }
            }
        }
        return url;
    }

    private static boolean wholeParagraph(String html, int start, int end) {
        String before = html.substring(Math.max(0, start - 16), start).replaceAll("\\s+$", "");
        String after = html.substring(end, Math.min(html.length(), end + 16)).replaceAll("^\\s+", "");
        return before.toLowerCase().endsWith("<p>") && after.toLowerCase().startsWith("</p>");
    }

    /** A link that points straight at an image file. Its size is unknown until it loads. */
    private static Media direct(String href) {
        Matcher m = DIRECT.matcher(href);
        if (!m.matches()) return null;
        String ext = m.group(2).toLowerCase();
        Media item = new Media();
        item.key = href;
        item.gif = ext.equals("gif");
        item.full = href;
        item.thumb = href;
        Matcher imgur = IMGUR.matcher(href);
        if (!item.gif && imgur.matches()) {
            // Imgur's medium (320px) thumbnail.
            item.thumb = "https://i.imgur.com/" + imgur.group(1) + "m." + imgur.group(2);
        }
        return item;
    }

    private static Media matchUrl(String url, Map<String, Media> media) {
        if (url == null) return null;
        for (Media item : media.values()) {
            if (item.key.startsWith("giphy|")) {
                String id = item.key.split("\\|")[1];
                if (url.contains("giphy.com") && url.contains(id)) return item;
            } else if (item.key.startsWith("emote|")) {
                if (url.equals(item.thumb)) return item;
            } else if (url.contains("redd.it/" + item.key + ".") || url.contains("redd.it/" + item.key + "?")) {
                return item;
            }
        }
        return null;
    }

    private static Media matchText(String text, Map<String, Media> media) {
        if (text == null) return null;
        String trimmed = text.trim();
        Media item = media.get(trimmed);
        if (item != null) return item;
        Matcher m = MARKDOWN_IMAGE.matcher(trimmed);
        return m.matches() ? media.get(m.group(1)) : null;
    }

    private static Media redditPlayer(String href, Map<String, Media> media) {
        if (href == null) return null;
        Matcher player = REDDIT_PLAYER.matcher(href);
        if (!player.find()) return null;
        Media item = media.get(player.group(1));
        if (item == null) {
            for (Media candidate : media.values()) {
                if (candidate.play && candidate.thumb != null && !candidate.thumb.isEmpty()) {
                    item = candidate;
                    break;
                }
            }
        }
        if (item != null && item.thumb != null && !item.thumb.isEmpty()) {
            item.play = true;
            if (item.full == null || item.full.isEmpty()) item.full = href;
            return item;
        }
        return null;
    }

    private static final class Still {
        String url = "";
        int w;
        int h;
        String file = "";
    }

    /** Poster and pixel size for a desktop comment video. The player page itself is not an image. */
    private static Still redditPoster(Context context, String href) {
        Matcher link = REDDIT_LINK.matcher(href == null ? "" : href);
        if (!link.find() || context == null) {
            Log.i(TAG, "video still skipped");
            return null;
        }
        try {
            Context prefsContext = context.getApplicationContext() == null ? context : context.getApplicationContext();
            SharedPreferences prefs = prefsContext.getSharedPreferences("Authentication", 0);
            String raw = prefs.getString("access_token", "");
            if (raw == null) raw = "";
            String access = raw.startsWith("{") ? new JSONObject(raw).optString("access_token", "") : raw;
            long expiry = prefs.getLong("access_token_expiry", 0L);
            if (access.isEmpty() || expiry < System.currentTimeMillis()) {
                Log.i(TAG, "video still no token");
                return null;
            }
            String commentId = link.group(1);
            JSONObject data = oauthListing(access, "https://oauth.reddit.com/api/info?id=t1_" + commentId + "&raw_json=1");
            Still still = stillOf(data);
            if (still.url.isEmpty()) still = pageStill(access, data, commentId, still);
            if (still.url.isEmpty() && still.file != null && !still.file.isEmpty()) {
                remember(playerId(href), still.file);
            }
            Log.i(TAG, "video still " + (still.url.isEmpty() ? "missing" : hostOf(still.url)) + " " + still.w + "x" + still.h);
            return still;
        } catch (Throwable t) {
            Log.i(TAG, "video still failed " + t.getClass().getSimpleName());
            return null;
        }
    }

    private static Still pageStill(String access, JSONObject data, String commentId, Still soFar) throws Exception {
        String permalink = data == null ? "" : data.optString("permalink", "");
        if (permalink.isEmpty() && data != null) {
            String sub = data.optString("subreddit", "");
            String linkId = data.optString("link_id", "");
            if (!sub.isEmpty() && linkId.startsWith("t3_")) {
                permalink = "/r/" + sub + "/comments/" + linkId.substring(3) + "/_/" + commentId + "/";
            }
        }
        if (permalink.isEmpty()) return soFar;
        String body = oauthGet(access, "https://oauth.reddit.com" + permalink + ".json?raw_json=1");
        JSONArray listings = new JSONArray(body);
        for (int i = 0; i < listings.length(); i++) {
            JSONObject row = findComment(listings.optJSONObject(i), commentId);
            Still candidate = stillOf(row);
            if (!candidate.url.isEmpty()) return candidate;
        }
        return soFar;
    }

    /** The comment row only. The first listing on a thread is the post, and its picture is the thread thumbnail. */
    private static JSONObject findComment(JSONObject node, String commentId) {
        if (node == null) return null;
        JSONObject data = node.optJSONObject("data");
        if (data != null && data.has("children")) {
            JSONArray children = data.optJSONArray("children");
            if (children == null) return null;
            for (int i = 0; i < children.length(); i++) {
                JSONObject found = findComment(children.optJSONObject(i), commentId);
                if (found != null) return found;
            }
            return null;
        }
        if (data == null) return null;
        if (commentId.equals(data.optString("id"))) return data;
        JSONObject replies = data.optJSONObject("replies");
        return replies == null ? null : findComment(replies, commentId);
    }

    private static JSONObject oauthListing(String access, String url) throws Exception {
        JSONObject listing = new JSONObject(oauthGet(access, url));
        JSONObject data = listing.optJSONObject("data");
        JSONArray children = data == null ? null : data.optJSONArray("children");
        if (children == null || children.length() == 0) return null;
        JSONObject child = children.optJSONObject(0);
        return child == null ? null : child.optJSONObject("data");
    }

    private static String oauthGet(String access, String url) throws Exception {
        HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
        conn.setConnectTimeout(5000);
        conn.setReadTimeout(5000);
        conn.setRequestProperty("Authorization", "Bearer " + access);
        conn.setRequestProperty("User-Agent", "Joey:o.o.joey:2.1.6.5");
        conn.setRequestProperty("Accept", "application/json");
        int code = conn.getResponseCode();
        if (code / 100 != 2) {
            conn.disconnect();
            throw new IllegalStateException("http " + code);
        }
        StringBuilder body = new StringBuilder();
        try (InputStream in = conn.getInputStream()) {
            byte[] buf = new byte[4096];
            int n;
            while ((n = in.read(buf)) > 0) body.append(new String(buf, 0, n, java.nio.charset.StandardCharsets.UTF_8));
        } finally {
            conn.disconnect();
        }
        return body.toString();
    }

    private static Still stillOf(JSONObject data) {
        Still still = new Still();
        if (data == null) return still;
        findVideoFiles(data);
        JSONObject video = videoOf(data);
        if (video != null) {
            String file = firstFile(video);
            if (!file.isEmpty()) {
                remember(idOf(file), file);
                still.file = file;
            }
            still.w = video.optInt("width", video.optInt("x"));
            still.h = video.optInt("height", video.optInt("y"));
        }
        JSONObject meta = data.optJSONObject("media_metadata");
        if (meta != null) {
            Iterator<String> it = meta.keys();
            while (it.hasNext()) {
                String key = it.next();
                JSONObject entry = meta.optJSONObject(key);
                if (entry == null) continue;
                String file = firstHttp(entry, "dashUrl", "hlsUrl");
                if (!file.isEmpty()) remember(key, file);
            }
        }
        if (!isVideoComment(data) && (still.file == null || still.file.isEmpty())) return still;
        still.url = poster(data);
        if (still.url.isEmpty()) still.url = metadataImage(data.optJSONObject("media_metadata"));
        return still;
    }

    private static boolean isVideoComment(JSONObject data) {
        if (videoOf(data) != null) return true;
        JSONObject meta = data.optJSONObject("media_metadata");
        if (meta == null) return false;
        Iterator<String> it = meta.keys();
        while (it.hasNext()) {
            JSONObject entry = meta.optJSONObject(it.next());
            if (entry == null) continue;
            String kind = entry.optString("e", "");
            if ("RedditVideo".equalsIgnoreCase(kind) || "Video".equalsIgnoreCase(kind)) return true;
        }
        return false;
    }

    private static JSONObject videoOf(JSONObject data) {
        JSONObject video = redditVideoObject(data.optJSONObject("media"));
        if (video == null) video = redditVideoObject(data.optJSONObject("secure_media"));
        if (video != null) return video;
        JSONObject preview = data.optJSONObject("preview");
        return preview == null ? null : preview.optJSONObject("reddit_video_preview");
    }

    private static JSONObject redditVideoObject(JSONObject media) {
        return media == null ? null : media.optJSONObject("reddit_video");
    }

    private static String metadataImage(JSONObject meta) {
        if (meta == null) return "";
        Iterator<String> it = meta.keys();
        while (it.hasNext()) {
            JSONObject entry = meta.optJSONObject(it.next());
            if (entry == null) continue;
            String frame = previewFrame(entry);
            if (frame.startsWith("http")) return frame;
            JSONObject s = entry.optJSONObject("s");
            if (s == null) continue;
            String url = clean(s.optString("u", s.optString("gif", "")));
            if (url.startsWith("http") && !url.contains(".mp4") && !url.contains(".m3u8")) return url;
        }
        return "";
    }

    private static String names(String json) {
        if (json == null || json.isEmpty()) return "none";
        try {
            JSONObject root = new JSONObject(json);
            StringBuilder names = new StringBuilder();
            Iterator<String> it = root.keys();
            while (it.hasNext()) {
                if (names.length() > 0) names.append(',');
                names.append(it.next());
            }
            return names.toString();
        } catch (Throwable t) {
            return "unparsed";
        }
    }

    private static String hostOf(String url) {
        try {
            return new URL(url).getHost();
        } catch (Exception e) {
            return "bad";
        }
    }

    private static String playerId(String href) {
        Matcher player = REDDIT_PLAYER.matcher(href == null ? "" : href);
        return player.find() ? player.group(1) : "";
    }

    private static void attachPlayerLinks(TextView view, SpannableStringBuilder text) {
        boolean show = onProfile(view)
                ? MorpheSettings.profileComments(view.getContext())
                : MorpheSettings.inlineComments(view.getContext());
        if (!show) return;
        URLSpan[] links = text.getSpans(0, text.length(), URLSpan.class);
        if (links == null || links.length == 0) return;
        java.util.Arrays.sort(links, (a, b) -> text.getSpanStart(b) - text.getSpanStart(a));
        Resources res = view.getResources();
        float density = res.getDisplayMetrics().density;
        int screen = res.getDisplayMetrics().widthPixels;
        int sizeDp = MorpheSettings.sizeDp(view.getContext());
        int maxMediaH = Math.round(sizeDp * density);
        int maxMediaW = Math.min(Math.round(sizeDp * 280f / MorpheSettings.SIZE_SMALL * density),
                screen - Math.round(72 * density));
        for (URLSpan link : links) {
            String href = link.getURL();
            String videoId = playerId(href);
            if (videoId.isEmpty()) continue;
            int start = text.getSpanStart(link);
            int end = text.getSpanEnd(link);
            if (start < 0 || end <= start) continue;
            text.removeSpan(link);
            text.replace(start, end, "\uFFFC");
            Bitmap cached = VIDEO_FRAMES.get(videoId);
            boolean waiting = cached == null || cached.isRecycled();
            MediaSpan span = new MediaSpan(view, href, href, false, true, waiting,
                    waiting ? 0 : cached.getWidth(), waiting ? 0 : cached.getHeight(),
                    maxMediaH, maxMediaW, maxMediaH, true);
            text.setSpan(span, start, start + 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            if (!waiting) {
                span.use(cached);
                continue;
            }
            LOADER.execute(() -> {
                Bitmap frame = videoFrame(view.getContext(), videoId, href);
                MAIN.post(() -> {
                    if (frame == null) span.giveUp();
                    else span.use(frame);
                });
            });
        }
    }

    /** First frame of the playlist Joey plays. The link stays until this returns a picture. */
    private static Bitmap videoFrame(Context context, String videoId, String href) {
        Bitmap cached = VIDEO_FRAMES.get(videoId);
        if (cached != null && !cached.isRecycled()) return cached;
        if (context == null) return null;
        String file = VIDEO_FILE.get(videoId);
        if (file == null || file.isEmpty()) {
            Still still = redditPoster(context, href);
            if (still != null && still.file != null && !still.file.isEmpty()) file = still.file;
            else file = VIDEO_FILE.get(videoId);
        }
        if (file == null || file.isEmpty()) return hlsFrame(context, videoId);
        Log.i(TAG, "video load " + hostOf(file));
        String mp4 = file;
        if (file.contains(".mpd") || file.contains(".m3u8") || file.contains("DASHPlaylist")) {
            String body = httpText(file);
            mp4 = body == null ? null : mp4In(body, file);
            if (mp4 == null) return null;
        }
        File local = httpFile(context, mp4);
        if (local == null) return null;
        return rememberFrame(videoId, frameFile(local));
    }

    /** Lowest HLS rendition, then its first frames. Same idea as clipping a long GIF. */
    private static Bitmap hlsFrame(Context context, String videoId) {
        String master = httpText("https://v.redd.it/" + videoId + "/HLSPlaylist.m3u8?f=hd,subsAll,hlsSpecOrder&v=1");
        if (master == null) return null;
        String rendition = smallestRendition(master);
        if (rendition == null) return null;
        String mp4 = rendition.endsWith(".m3u8") ? rendition.substring(0, rendition.length() - 5) + ".mp4" : rendition;
        if (!mp4.startsWith("http")) mp4 = "https://v.redd.it/" + videoId + "/" + mp4;
        Log.i(TAG, "video load " + hostOf(mp4));
        File local = httpFile(context, mp4);
        if (local == null) return null;
        return rememberFrame(videoId, frameFile(local));
    }

    private static Bitmap rememberFrame(String videoId, Bitmap frame) {
        if (frame != null) VIDEO_FRAMES.put(videoId, frame);
        return frame;
    }

    private static String smallestRendition(String playlist) {
        String[] lines = playlist.split("\n");
        String best = null;
        int bestArea = Integer.MAX_VALUE;
        for (int i = 0; i < lines.length; i++) {
            int at = lines[i].indexOf("RESOLUTION=");
            if (at < 0) continue;
            String spec = lines[i].substring(at + "RESOLUTION=".length());
            int x = spec.indexOf('x');
            if (x <= 0) continue;
            int width;
            int height;
            try {
                width = Integer.parseInt(spec.substring(0, x).trim());
                String rest = spec.substring(x + 1);
                int end = 0;
                while (end < rest.length() && Character.isDigit(rest.charAt(end))) end++;
                height = Integer.parseInt(rest.substring(0, end));
            } catch (NumberFormatException e) {
                continue;
            }
            String name = null;
            for (int j = i + 1; j < lines.length; j++) {
                String line = lines[j].trim();
                if (line.isEmpty() || line.startsWith("#")) continue;
                name = line;
                break;
            }
            int area = width * height;
            if (name != null && area > 0 && area < bestArea) {
                bestArea = area;
                best = name;
            }
        }
        return best;
    }

    private static Bitmap frameFile(File local) {
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            retriever.setDataSource(local.getAbsolutePath());
            Bitmap frame = retriever.getFrameAtTime(0, MediaMetadataRetriever.OPTION_CLOSEST_SYNC);
            if (frame != null) Log.i(TAG, "video frame " + frame.getWidth() + "x" + frame.getHeight());
            return frame;
        } catch (Throwable t) {
            Log.i(TAG, "video frame failed " + t.getClass().getSimpleName());
            return null;
        } finally {
            try {
                retriever.release();
            } catch (Throwable ignored) {
            }
            local.delete();
        }
    }

    private static String mp4In(String body, String playlist) {
        String[] names = {"DASH_96.mp4", "DASH_240.mp4", "DASH_360.mp4", "DASH_480.mp4", "DASH_720.mp4"};
        for (String name : names) {
            int at = body.indexOf(name);
            if (at < 0) continue;
            int http = body.lastIndexOf("http", at);
            if (http >= 0 && at - http < 240) return body.substring(http, at + name.length());
            return resolveUrl(playlist, name);
        }
        Matcher absolute = Pattern.compile("https?://[^\\s\"<>]+\\.mp4[^\\s\"<>]*").matcher(body);
        if (absolute.find()) return absolute.group();
        return null;
    }

    private static String resolveUrl(String playlist, String name) {
        int slash = playlist.lastIndexOf('/');
        return slash < 0 ? name : playlist.substring(0, slash + 1) + name;
    }

    private static HttpURLConnection openVideo(String url) throws Exception {
        HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
        conn.setConnectTimeout(5000);
        conn.setReadTimeout(8000);
        conn.setInstanceFollowRedirects(true);
        conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0");
        conn.setRequestProperty("Referer", "https://www.reddit.com/");
        return conn;
    }

    private static String httpText(String url) {
        HttpURLConnection conn = null;
        try {
            conn = openVideo(url);
            int code = conn.getResponseCode();
            if (code / 100 != 2) {
                Log.i(TAG, "video http " + code);
                return null;
            }
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            try (InputStream in = conn.getInputStream()) {
                byte[] buf = new byte[4096];
                int n;
                while ((n = in.read(buf)) > 0 && out.size() < 256 * 1024) out.write(buf, 0, n);
            }
            return out.toString("UTF-8");
        } catch (Throwable t) {
            Log.i(TAG, "video http failed " + t.getClass().getSimpleName());
            return null;
        } finally {
            if (conn != null) conn.disconnect();
        }
    }

    private static File httpFile(Context context, String url) {
        HttpURLConnection conn = null;
        try {
            conn = openVideo(url);
            if (url.contains(".mp4")) conn.setRequestProperty("Range", "bytes=0-3145727");
            int code = conn.getResponseCode();
            if (code != 200 && code != 206) {
                Log.i(TAG, "video http " + code);
                return null;
            }
            File file = new File(context.getCacheDir(), "morphe-video-frame.mp4");
            try (InputStream in = conn.getInputStream(); FileOutputStream out = new FileOutputStream(file)) {
                byte[] buf = new byte[16 * 1024];
                int total = 0;
                int n;
                while ((n = in.read(buf)) > 0 && total < 3 * 1024 * 1024) {
                    out.write(buf, 0, n);
                    total += n;
                }
            }
            return file.length() > 0 ? file : null;
        } catch (Throwable t) {
            Log.i(TAG, "video http failed " + t.getClass().getSimpleName());
            return null;
        } finally {
            if (conn != null) conn.disconnect();
        }
    }

    private static String externalTag(String href) {
        if (ExternalPreview.needsFetch(href)) {
            return "<img src=\"" + attr(href + MARK + "u,0,0," + Uri.encode(href)) + "\">";
        }
        ExternalPreview preview = ExternalPreview.immediate(href);
        if (preview == null || preview.images.isEmpty()) return null;
        String kind = preview.play ? "p" : (preview.animate ? "g" : "i");
        String size = preview.play ? "320,180" : "0,0";
        return "<img src=\"" + attr(preview.images.get(0) + MARK + kind + "," + size + "," + Uri.encode(href)) + "\">";
    }

    private static String tag(Media item, String linkHref) {
        String href = item.emote ? "" : (linkHref != null && !linkHref.isEmpty() ? linkHref : item.full);
        String kind = item.lookup ? "r" : item.emote ? "e" : item.play ? "p" : (item.gif ? "g" : "i");
        String src = item.thumb + MARK + kind + "," + item.w + "," + item.h + "," + Uri.encode(href == null ? "" : href);
        return "<img src=\"" + attr(src) + "\">";
    }

    // endregion

    // region media_metadata

    private static Map<String, Media> parse(String json) throws Exception {
        Map<String, Media> out = new HashMap<>();
        JSONObject root = new JSONObject(json);
        for (Iterator<String> it = root.keys(); it.hasNext(); ) {
            String key = it.next();
            JSONObject entry = root.optJSONObject(key);
            if (entry == null) continue;

            if ("invalid".equals(entry.optString("status"))) {
                if (key.startsWith("giphy|")) {
                    String[] parts = key.split("\\|");
                    if (parts.length >= 2) {
                        Media item = new Media();
                        item.key = key;
                        item.gif = true;
                        item.thumb = "https://media.giphy.com/media/" + parts[1] + "/200.gif";
                        item.full = "https://giphy.com/gifs/" + parts[1];
                        item.w = 0;
                        item.h = 200;
                        out.put(key, item);
                    }
                }
                continue;
            }

            JSONObject s = entry.optJSONObject("s");
            String e = entry.optString("e", "Image");
            boolean video = "RedditVideo".equalsIgnoreCase(e) || "Video".equalsIgnoreCase(e);
            if (s == null && !video) continue;
            String id = entry.optString("id", key);

            Media item = new Media();
            item.key = id;
            item.emote = id.startsWith("emote|") || "emote".equalsIgnoreCase(entry.optString("t"));
            item.play = video;
            item.gif = !video && !"Image".equalsIgnoreCase(e);
            item.w = s == null ? entry.optInt("x") : s.optInt("x");
            item.h = s == null ? entry.optInt("y") : s.optInt("y");

            String poster = s == null ? "" : clean(s.optString("u", ""));
            String mp4 = s == null ? "" : clean(s.optString("mp4", ""));
            if (video && poster.isEmpty()) poster = previewFrame(entry);
            if (video && mp4.isEmpty()) mp4 = clean(entry.optString("hlsUrl", ""));
            String original = video ? poster : clean(item.gif ? (s == null ? "" : s.optString("gif", s.optString("u"))) : poster);
            if (!video && original.isEmpty()) continue;
            if (video && original.isEmpty() && mp4.isEmpty()) continue;
            item.full = video ? (mp4.isEmpty() ? original : mp4) : item.gif ? clean(s.optString("mp4", original)) : original;
            if (!video && item.full.isEmpty()) item.full = original;
            item.thumb = original;

            if (!item.gif && !item.emote) {
                JSONArray p = entry.optJSONArray("p");
                if (p != null && p.length() > 0) {
                    JSONObject pick = null;
                    for (int i = 0; i < p.length(); i++) {
                        JSONObject candidate = p.optJSONObject(i);
                        if (candidate != null && candidate.optInt("x") >= 320) {
                            pick = candidate;
                            break;
                        }
                    }
                    if (pick == null) pick = p.optJSONObject(p.length() - 1);
                    String u = pick == null ? "" : clean(pick.optString("u"));
                    if (!u.isEmpty()) item.thumb = u;
                }
            }
            if (key.startsWith("giphy|")) {
                String[] parts = key.split("\\|");
                if (parts.length >= 2) item.full = "https://giphy.com/gifs/" + parts[1];
            }
            item.key = key;
            out.put(key, item);
        }
        return out;
    }

    private static String clean(String url) {
        return url == null ? "" : url.replace("&amp;", "&");
    }

    // endregion

    // region spans

    /**
     * Replaces placeholder ImageSpans made from our img tags with sized, clickable media.
     * Called at the start of HTMLTextView.setSpannable.
     */
    public static void bind(TextView view, SpannableStringBuilder text) {
        if (view == null || text == null) return;
        try {
            ImageSpan[] spans = text.getSpans(0, text.length(), ImageSpan.class);
            attachPlayerLinks(view, text);
            if (spans == null || spans.length == 0) return;
            Resources res = view.getResources();
            float density = res.getDisplayMetrics().density;
            int screen = res.getDisplayMetrics().widthPixels;
            int sizeDp = MorpheSettings.sizeDp(view.getContext());
            int maxMediaH = Math.round(sizeDp * density);
            int maxMediaW = Math.min(Math.round(sizeDp * 280f / MorpheSettings.SIZE_SMALL * density),
                    screen - Math.round(72 * density));
            int emoteH = Math.round(view.getTextSize() * 1.35f);

            for (ImageSpan span : spans) {
                String source = span.getSource();
                if (source == null) continue;
                int at = source.indexOf(MARK);
                if (at < 0) continue;
                String url = source.substring(0, at);
                String[] meta = source.substring(at + MARK.length()).split(",", 4);
                if (meta.length < 4) continue;
                boolean emote = "e".equals(meta[0]);
                boolean gif = "g".equals(meta[0]);
                boolean playLink = "p".equals(meta[0]) || "r".equals(meta[0]);
                boolean unresolved = "u".equals(meta[0]) || "r".equals(meta[0]);
                int w = toInt(meta[1]);
                int h = toInt(meta[2]);
                String href = Uri.decode(meta[3]);

                int start = text.getSpanStart(span);
                int end = text.getSpanEnd(span);
                int flags = text.getSpanFlags(span);
                text.removeSpan(span);

                MediaSpan media = emote
                        ? new MediaSpan(view, url, null, false, false, false, w, h, emoteH, emoteH * 4, emoteH, false)
                        : new MediaSpan(view, url, href.isEmpty() ? null : href, gif, playLink, unresolved, w, h, maxMediaH, maxMediaW, maxMediaH, true);
                text.setSpan(media, start, end, flags);
                media.load();
            }
        } catch (Throwable t) {
            Log.w(TAG, "bind failed", t);
        }
    }

    private static final Map<String, Float> SCALES = new HashMap<>();
    private static final Map<String, Integer> NATIVE_WIDTH = new ConcurrentHashMap<>();
    private static WeakReference<TextView> pressedView;
    private static MediaSpan pressedSpan;
    private static float pressedX;
    private static float pressedY;
    private static boolean resizing;

    /**
     * Called first in Joey's comment link handler. Returns null when the touch is not on a GIF
     * or image, Boolean.TRUE to consume it, or a URLSpan to open when a tap on media completes.
     */
    public static Object touch(TextView view, Spannable text, MotionEvent event) {
        try {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                resizing = false;
                MediaSpan hit = hit(view, text, event);
                Log.d(TAG, "touch down resize=" + MorpheSettings.resizeEnabled(view.getContext())
                        + " media=" + (hit != null));
                if (hit == null) {
                    pressedSpan = null;
                    return null;
                }
                pressedView = new WeakReference<>(view);
                pressedSpan = hit;
                pressedX = event.getX();
                pressedY = event.getY();
                if (MorpheSettings.resizeEnabled(view.getContext())) {
                    // Joey posts the comment selection menu on press-down, before this runs.
                    view.setLongClickable(false);
                    view.cancelLongPress();
                    if (view.getParent() != null) view.getParent().requestDisallowInterceptTouchEvent(true);
                }
                return Boolean.TRUE;
            }
            if (pressedSpan == null || pressedView == null || pressedView.get() != view) return null;

            if (action == MotionEvent.ACTION_MOVE) {
                if (MorpheSettings.resizeEnabled(view.getContext())) {
                    int slop = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
                    if (!resizing) {
                        if (Math.abs(event.getX() - pressedX) <= slop && Math.abs(event.getY() - pressedY) <= slop) {
                            return Boolean.TRUE;
                        }
                        resizing = true;
                        pressedSpan.beginResize(pressedX);
                        Log.d(TAG, "resize begin width=" + pressedSpan.width);
                    }
                    view.cancelLongPress();
                    pressedSpan.dragTo(event.getX());
                    return Boolean.TRUE;
                }
                int slop = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
                if (Math.abs(event.getX() - pressedX) > slop || Math.abs(event.getY() - pressedY) > slop) {
                    pressedSpan = null;
                }
                return Boolean.TRUE;
            }
            if (resizing) {
                resizing = false;
                pressedSpan = null;
                view.setLongClickable(true);
                return Boolean.TRUE;
            }
            view.setLongClickable(true);
            MediaSpan pressed = pressedSpan;
            pressedSpan = null;
            if (action == MotionEvent.ACTION_UP && hit(view, text, event) == pressed) {
                return new URLSpan(pressed.href);
            }
            return Boolean.TRUE;
        } catch (Throwable t) {
            Log.w(TAG, "touch failed", t);
            pressedSpan = null;
            return null;
        }
    }

    private static MediaSpan hit(TextView view, Spannable text, MotionEvent event) {
        Layout layout = view.getLayout();
        if (layout == null || text == null) return null;
        int x = (int) event.getX() - view.getTotalPaddingLeft() + view.getScrollX();
        int y = (int) event.getY() - view.getTotalPaddingTop() + view.getScrollY();
        int line = layout.getLineForVertical(y);
        MediaSpan[] spans = text.getSpans(layout.getLineStart(line), layout.getLineEnd(line), MediaSpan.class);
        int baseline = layout.getLineBaseline(line);
        for (MediaSpan span : spans) {
            if (!span.framed) continue;
            int start = text.getSpanStart(span);
            if (start < layout.getLineStart(line) || start >= layout.getLineEnd(line)) continue;
            float left = layout.getPrimaryHorizontal(start);
            if (x >= left && x <= left + span.width && y >= baseline - span.height && y <= baseline) {
                return span;
            }
        }
        return null;
    }

    private static MediaSpan hitHandle(TextView view, Spannable text, MotionEvent event) {
        if (!MorpheSettings.resizeEnabled(view.getContext())) return null;
        Layout layout = view.getLayout();
        if (layout == null || text == null) return null;
        int x = (int) event.getX() - view.getTotalPaddingLeft() + view.getScrollX();
        int y = (int) event.getY() - view.getTotalPaddingTop() + view.getScrollY();
        int line = layout.getLineForVertical(y);
        MediaSpan[] spans = text.getSpans(layout.getLineStart(line), layout.getLineEnd(line), MediaSpan.class);
        int baseline = layout.getLineBaseline(line);
        float handle = 28 * view.getResources().getDisplayMetrics().density;
        for (MediaSpan span : spans) {
            if (!span.framed) continue;
            int start = text.getSpanStart(span);
            if (start < layout.getLineStart(line) || start >= layout.getLineEnd(line)) continue;
            float left = layout.getPrimaryHorizontal(start);
            float right = left + span.width;
            float bottom = baseline;
            float top = bottom - span.height;
            if (x >= right - handle && x <= right && y >= bottom - handle && y <= bottom
                    && x >= left && y >= top) {
                return span;
            }
        }
        return null;
    }

    private static int toInt(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    static final class MediaSpan extends ReplacementSpan implements Drawable.Callback {
        private final WeakReference<TextView> view;
        private final String url;
        final String href;
        private final boolean gif;
        private final boolean playLink;
        private final boolean unresolved;
        private final int targetH;
        private final int maxW;
        private final int maxH;
        final boolean framed;
        private final Paint placeholder = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint grip = new Paint(Paint.ANTI_ALIAS_FLAG);
        int width;
        int height;
        private boolean fixedHeight;
        private int drawH;
        private int baseW;
        private int baseH;
        private int intrinsicW;
        private float resizeStartX;
        private int resizeStartW;
        private Drawable drawable;
        private boolean previewOnly;
        private final boolean youtube;
        private String youtubeTitle;
        private List<Drawable> tiles;

        MediaSpan(TextView view, String url, String href, boolean gif, boolean playLink, boolean unresolved, int w, int h, int targetH, int maxW, int maxH, boolean framed) {
            this.view = new WeakReference<>(view);
            this.url = url;
            this.href = href;
            this.gif = gif;
            this.playLink = playLink;
            this.unresolved = unresolved;
            this.targetH = targetH;
            this.maxW = maxW;
            this.maxH = maxH;
            this.framed = framed;
            String lowerHref = href == null ? "" : href.toLowerCase();
            this.youtube = lowerHref.contains("youtube.com") || lowerHref.contains("youtu.be");
            if (youtube) loadYoutubeTitle(href);
            placeholder.setColor(0x33808080);
            grip.setColor(0xFFFFFFFF);
            grip.setStrokeWidth(2.5f * Resources.getSystem().getDisplayMetrics().density);
            grip.setStrokeCap(Paint.Cap.ROUND);
            grip.setStyle(Paint.Style.STROKE);
            // A comment video has no picture yet. Leave no grey box; the still fills this in when it loads.
            if (unresolved && playLink) {
                fixedHeight = false;
                width = 0;
                height = 0;
                drawH = 0;
            } else {
                fixedHeight = framed && (w <= 0 || h <= 0);
                fit(w, h);
            }
            captureBase();
            applySavedScale();
            drawH = Math.max(1, height - captionHeight());
        }

        private void captureBase() {
            baseW = Math.max(1, width);
            baseH = Math.max(1, height);
        }

        private void applySavedScale() {
            Float scale = SCALES.get(url);
            if (scale == null || scale <= 1f) return;
            int grown = Math.round(baseW * scale);
            resizeTo(grown);
        }

        void beginResize(float x) {
            resizeStartX = x;
            resizeStartW = width;
        }

        void dragTo(float x) {
            resizeTo(Math.round(resizeStartW + (x - resizeStartX)));
            SCALES.put(url, width / (float) baseW);
            relayout();
        }

        private void resizeTo(int requestedW) {
            int cap = Math.min(columnCap(), baseW * 4);
            int newW = Math.max(baseW, Math.min(cap, requestedW));
            int caption = captionHeight();
            int imageBase = Math.max(1, baseH - caption);
            int imageH = Math.max(1, Math.round(newW * (imageBase / (float) baseW)));
            width = newW;
            height = imageH + caption;
            drawH = imageH;
            fixedHeight = false;
        }

        private int captionHeight() {
            if (!youtube) return 0;
            return Math.round(18f * Resources.getSystem().getDisplayMetrics().density);
        }

        private int columnCap() {
            TextView tv = view.get();
            if (tv == null) return baseW;
            int inner = tv.getWidth() - tv.getTotalPaddingLeft() - tv.getTotalPaddingRight();
            if (inner > baseW) return inner;
            int screen = tv.getResources().getDisplayMetrics().widthPixels;
            return Math.max(baseW, screen - Math.round(72 * tv.getResources().getDisplayMetrics().density));
        }

        private void relayout() {
            TextView tv = view.get();
            if (tv == null) return;
            CharSequence current = tv.getText();
            if (current instanceof Spannable) {
                Spannable sp = (Spannable) current;
                int s = sp.getSpanStart(this);
                if (s >= 0) {
                    int e = sp.getSpanEnd(this);
                    int f = sp.getSpanFlags(this);
                    sp.removeSpan(this);
                    sp.setSpan(this, s, e, f);
                }
            }
            tv.requestLayout();
            tv.invalidate();
        }

        private void fit(int w, int h) {
            if (w <= 0 || h <= 0) {
                w = 1;
                h = 1;
            }
            float scale = Math.min((float) targetH / h, 1f * maxW / w);
            if (!framed) scale = (float) targetH / h;
            int fw = Math.max(1, Math.round(w * scale));
            int fh = Math.max(1, Math.round(h * scale));
            if (fw > maxW) {
                fh = Math.max(1, Math.round(fh * (1f * maxW / fw)));
                fw = maxW;
            }
            if (fh > maxH) {
                fw = Math.max(1, Math.round(fw * (1f * maxH / fh)));
                fh = maxH;
            }
            width = fw;
            drawH = fh;
            height = fh + captionHeight();
        }

        @Override
        public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
            if (fm != null) {
                Paint.FontMetricsInt base = paint.getFontMetricsInt();
                if (framed) {
                    fm.ascent = -height;
                    fm.descent = 0;
                } else {
                    int extra = Math.max(0, height - (base.descent - base.ascent));
                    fm.ascent = base.ascent - extra / 2;
                    fm.descent = base.descent + (extra - extra / 2);
                }
                fm.top = fm.ascent;
                fm.bottom = fm.descent;
            }
            return width;
        }

        @Override
        public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom, Paint paint) {
            int dy;
            if (framed) {
                dy = y - height;
            } else {
                Paint.FontMetricsInt base = paint.getFontMetricsInt();
                dy = y + (base.ascent + base.descent) / 2 - height / 2;
            }
            if (drawable == null) {
                if (width <= 0 || height <= 0) return;
                float r = framed ? 6 * Resources.getSystem().getDisplayMetrics().density : height / 4f;
                canvas.drawRoundRect(new RectF(x, dy, x + width, dy + height), r, r, placeholder);
                drawGrip(canvas, x, dy);
                return;
            }
            if (tiles != null && tiles.size() > 1) {
                int row = dy;
                int gap = Math.round(4 * Resources.getSystem().getDisplayMetrics().density);
                for (Drawable tile : tiles) {
                    int tileH = Math.max(1, tile.getBounds().height());
                    canvas.save();
                    canvas.translate(x, row);
                    tile.setBounds(0, 0, width, tileH);
                    tile.draw(canvas);
                    canvas.restore();
                    row += tileH + gap;
                }
                drawGrip(canvas, x, dy);
                return;
            }
            canvas.save();
            canvas.translate(x, dy + (height - drawH) / 2);
            drawable.setBounds(0, 0, width, drawH);
            drawable.draw(canvas);
            canvas.restore();
            drawGrip(canvas, x, dy);
            drawPlay(canvas, x, dy);
            if (previewOnly && !youtube && (gif || playLink)) drawKind(canvas, x, dy, gif ? "gif" : "video");
            if (youtube) drawYoutubeChrome(canvas, x, dy);
        }

        private void loadYoutubeTitle(String href) {
            Matcher id = YOUTUBE_ID.matcher(href == null ? "" : href);
            if (!id.find()) return;
            String video = id.group(1);
            String cached = YOUTUBE_TITLES.get(video);
            if (cached != null) {
                youtubeTitle = cached;
                return;
            }
            LOADER.execute(() -> {
                HttpURLConnection conn = null;
                try {
                    String query = "https://www.youtube.com/oembed?format=json&url="
                            + java.net.URLEncoder.encode("https://www.youtube.com/watch?v=" + video, "UTF-8");
                    conn = (HttpURLConnection) new URL(query).openConnection();
                    conn.setConnectTimeout(10000);
                    conn.setReadTimeout(10000);
                    conn.setRequestProperty("User-Agent", "Joey");
                    if (conn.getResponseCode() / 100 != 2) return;
                    ByteArrayOutputStream out = new ByteArrayOutputStream();
                    try (InputStream in = conn.getInputStream()) {
                        byte[] buf = new byte[2048];
                        int n;
                        while ((n = in.read(buf)) > 0 && out.size() < 65536) out.write(buf, 0, n);
                    }
                    JSONObject json = new JSONObject(out.toString("UTF-8"));
                    String title = json.optString("title", "");
                    String author = json.optString("author_name", "");
                    if (title.isEmpty() && author.isEmpty()) return;
                    String caption = author.isEmpty() ? title
                            : title.isEmpty() ? author
                            : author + " · " + title;
                    YOUTUBE_TITLES.put(video, caption);
                    MAIN.post(() -> {
                        youtubeTitle = caption;
                        relayout();
                    });
                } catch (Throwable ignored) {
                } finally {
                    if (conn != null) conn.disconnect();
                }
            });
        }

        private void drawYoutubeChrome(Canvas canvas, float x, int dy) {
            float density = Resources.getSystem().getDisplayMetrics().density;
            float inset = 1.5f * density;
            RectF box = new RectF(x + inset, dy + inset, x + width - inset, dy + drawH - inset);
            Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
            stroke.setStyle(Paint.Style.STROKE);
            stroke.setStrokeWidth(2.5f * density);
            stroke.setColor(0xF2000000);
            canvas.drawRoundRect(box, 4f * density, 4f * density, stroke);
            stroke.setStrokeWidth(1f * density);
            stroke.setColor(0xFFE8E8E8);
            float inner = 2.5f * density;
            canvas.drawRoundRect(new RectF(box.left + inner, box.top + inner, box.right - inner, box.bottom - inner), 2f * density, 2f * density, stroke);
            drawTypeBadge(canvas, x, dy, "video_outline");
            String label = youtubeTitle != null && !youtubeTitle.isEmpty()
                    ? youtubeTitle
                    : href.replaceFirst("^https?://", "");
            float textSize = 12f * density;
            Paint labelPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            labelPaint.setTextSize(textSize);
            labelPaint.setColor(0xFF6CB6FF);
            labelPaint.setUnderlineText(true);
            float maxWidth = width - 2f * density;
            String full = label;
            while (labelPaint.measureText(label) > maxWidth && label.length() > 4) {
                label = label.substring(0, label.length() - 2);
            }
            if (!full.equals(label)) label = label + "…";
            canvas.drawText(label, x, dy + drawH + textSize + density, labelPaint);
        }

        private void drawTypeBadge(Canvas canvas, float x, int dy, String drawableName) {
            TextView tv = view.get();
            if (tv == null) return;
            int id = tv.getResources().getIdentifier(drawableName, "drawable", tv.getContext().getPackageName());
            if (id == 0) return;
            android.graphics.drawable.Drawable icon = tv.getContext().getDrawable(id);
            if (icon == null) return;
            float density = Resources.getSystem().getDisplayMetrics().density;
            int box = Math.round(22f * density);
            int pad = Math.round(5f * density);
            int left = Math.round(x + width - box - pad);
            int top = dy + drawH - box - pad;
            Paint bg = new Paint(Paint.ANTI_ALIAS_FLAG);
            bg.setColor(0xCC000000);
            canvas.drawRoundRect(left, top, left + box, top + box, 4f * density, 4f * density, bg);
            icon = icon.mutate();
            icon.setTint(0xFFFFFFFF);
            int inset = Math.round(4f * density);
            icon.setBounds(left + inset, top + inset, left + box - inset, top + box - inset);
            icon.draw(canvas);
        }

        private void drawPlay(Canvas canvas, float x, int dy) {
            if (!previewOnly) return;
            float density = Resources.getSystem().getDisplayMetrics().density;
            float cx = x + width / 2f;
            float cy = dy + height / 2f;
            float radius = 22f * density;
            Paint disc = new Paint(Paint.ANTI_ALIAS_FLAG);
            disc.setColor(0xCC000000);
            canvas.drawCircle(cx, cy, radius, disc);
            android.graphics.Path triangle = new android.graphics.Path();
            triangle.moveTo(cx - radius * 0.28f, cy - radius * 0.42f);
            triangle.lineTo(cx - radius * 0.28f, cy + radius * 0.42f);
            triangle.lineTo(cx + radius * 0.46f, cy);
            triangle.close();
            disc.setColor(0xFFFFFFFF);
            canvas.drawPath(triangle, disc);
        }

        private void drawKind(Canvas canvas, float x, int dy, String label) {
            float density = Resources.getSystem().getDisplayMetrics().density;
            Paint measure = kindPaint(density);
            float textWidth = measure.measureText(label);
            drawKindLabel(canvas, label, x + width - textWidth - 8f * density, dy + 16f * density, density);
        }

        private void drawGrip(Canvas canvas, float x, int dy) {
            TextView tv = view.get();
            if (!framed || tv == null || !MorpheSettings.resizeEnabled(tv.getContext())) return;
            if (MorpheSettings.invisibleHand(tv.getContext())) return;
            float density = Resources.getSystem().getDisplayMetrics().density;
            float handle = 22 * density;
            float right = x + width - 4 * density;
            float bottom = dy + height - 4 * density;
            float white = grip.getStrokeWidth();
            grip.setStrokeWidth(white + 3f * density);
            grip.setColor(0xE6000000);
            canvas.drawLine(right - handle, bottom, right, bottom, grip);
            canvas.drawLine(right, bottom - handle, right, bottom, grip);
            grip.setStrokeWidth(white);
            grip.setColor(0xFFFFFFFF);
            canvas.drawLine(right - handle, bottom, right, bottom, grip);
            canvas.drawLine(right, bottom - handle, right, bottom, grip);
        }

        void use(Bitmap frame) {
            if (frame == null) return;
            useDrawable(new BitmapDrawable(Resources.getSystem(), frame));
        }

        void giveUp() {
            restoreLink();
        }

        private void useDrawable(BitmapDrawable drawable) {
            previewOnly = true;
            attach(drawable);
        }

        void load() {
            if (unresolved) {
                LOADER.execute(this::resolveLink);
                return;
            }
            final int decodeH = height;
            final boolean animated = gif;
            final boolean markPlay = playLink;
            TextView tv = view.get();
            final long limit = tv == null ? 50L * 1024 * 1024 : MorpheSettings.mediaLimitBytes(tv.getContext());
            LOADER.execute(() -> loadUrl(url, decodeH, animated, markPlay, limit));
        }

        private void resolveLink() {
            if (REDDIT_PLAYER.matcher(url).find()) {
                Matcher player = REDDIT_PLAYER.matcher(url);
                player.find();
                String videoId = player.group(1);
                TextView host = view.get();
                Still still = redditPoster(host == null ? null : host.getContext(), url);
                if (still != null && still.url != null && !still.url.isEmpty()) {
                    long limit = host == null ? 50L * 1024 * 1024 : MorpheSettings.mediaLimitBytes(host.getContext());
                    if (loadUrl(still.url, height, false, true, limit)) return;
                }
                Bitmap frame = videoFrame(host == null ? null : host.getContext(), videoId, url);
                if (frame == null) {
                    restoreLink();
                    return;
                }
                Resources res = host == null ? Resources.getSystem() : host.getResources();
                BitmapDrawable drawable = new BitmapDrawable(res, frame);
                MAIN.post(() -> {
                    previewOnly = true;
                    attach(drawable);
                });
                return;
            }
            ExternalPreview preview = ExternalPreview.fetch(url);
            if (preview == null || preview.images.isEmpty()) return;
            TextView tv = view.get();
            long limit = tv == null ? 50L * 1024 * 1024 : MorpheSettings.mediaLimitBytes(tv.getContext());
            if (preview.images.size() == 1) {
                loadUrl(preview.images.get(0), height, preview.animate, preview.play, limit);
                return;
            }
            List<Drawable> loaded = new ArrayList<>();
            int total = 0;
            int wide = 1;
            for (String image : preview.images) {
                Drawable tile = oneDrawable(image, maxH, false, limit);
                if (tile == null) continue;
                int tileW = Math.max(1, tile.getIntrinsicWidth());
                int tileH = Math.max(1, tile.getIntrinsicHeight());
                float scale = Math.min(1f, Math.min(maxW / (float) tileW, maxH / (float) tileH));
                int dw = Math.max(1, Math.round(tileW * scale));
                int dh = Math.max(1, Math.round(tileH * scale));
                tile.setBounds(0, 0, dw, dh);
                loaded.add(tile);
                wide = Math.max(wide, dw);
                total += dh;
            }
            if (loaded.isEmpty()) return;
            int gap = Math.round(4 * Resources.getSystem().getDisplayMetrics().density);
            total += gap * (loaded.size() - 1);
            int blockH = total;
            int blockW = wide;
            MAIN.post(() -> showGallery(loaded, blockW, blockH));
        }

        private void showGallery(List<Drawable> loaded, int blockW, int blockH) {
            tiles = loaded;
            drawable = loaded.get(0);
            int oldW = width;
            int oldH = height;
            width = blockW;
            height = blockH;
            drawH = blockH;
            TextView tv = view.get();
            if (tv == null) return;
            CharSequence current = tv.getText();
            if (current instanceof Spannable && (oldW != width || oldH != height)) {
                Spannable sp = (Spannable) current;
                int s = sp.getSpanStart(this);
                if (s >= 0) {
                    int e = sp.getSpanEnd(this);
                    int f = sp.getSpanFlags(this);
                    sp.removeSpan(this);
                    sp.setSpan(this, s, e, f);
                }
            }
            tv.invalidate();
        }

        private boolean loadUrl(String source, int decodeH, boolean animated, boolean markPlay, long limit) {
            try {
                Grab grab = fetch(source, limit);
                if (grab == null || grab.bytes == null) return false;
                if (grab.partial) {
                    if (!animated) return false;
                    Object preview = openingFrames(grab.bytes, decodeH);
                    if (preview == null) return false;
                    MAIN.post(() -> attachPreview(preview));
                    return true;
                }
                Object decoded = decode(source, grab.bytes, decodeH);
                if (decoded == null) return false;
                MAIN.post(() -> {
                    if (markPlay) previewOnly = true;
                    attach(decoded);
                });
                return true;
            } catch (Throwable t) {
                Log.d(TAG, "load failed " + t.getClass().getSimpleName());
                return false;
            }
        }

        private void restoreLink() {
            MAIN.post(() -> {
                TextView tv = view.get();
                if (tv == null || href == null || href.isEmpty()) return;
                CharSequence current = tv.getText();
                if (!(current instanceof Spannable)) return;
                Spannable sp = (Spannable) current;
                int start = sp.getSpanStart(this);
                if (start < 0) return;
                int end = sp.getSpanEnd(this);
                SpannableStringBuilder text = new SpannableStringBuilder(current);
                text.removeSpan(this);
                text.replace(start, end, href);
                text.setSpan(new URLSpan(href), start, start + href.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                tv.setText(text);
            });
        }

        private Drawable oneDrawable(String source, int decodeH, boolean animated, long limit) {
            try {
                Grab grab = fetch(source, limit);
                if (grab == null || grab.bytes == null || grab.partial) return null;
                Object decoded = decode(source, grab.bytes, decodeH);
                return decoded instanceof Drawable ? (Drawable) decoded : null;
            } catch (Throwable t) {
                Log.d(TAG, "load failed " + source + ": " + t);
                return null;
            }
        }

        private void attachPreview(Object decoded) {
            previewOnly = true;
            attach(decoded);
        }

        private void attach(Object decoded) {
            TextView tv = view.get();
            if (tv == null || !(decoded instanceof Drawable)) return;
            Drawable d = (Drawable) decoded;
            int oldW = width;
            int oldH = height;
            intrinsicW = Math.max(0, d.getIntrinsicWidth());
            fit(d.getIntrinsicWidth(), d.getIntrinsicHeight());
            captureBase();
            applySavedScale();
            if (fixedHeight) height = oldH;
            drawH = Math.max(1, height - captionHeight());
            drawable = d;
            d.setCallback(this);
            if (gif && !MorpheSettings.autoplay(tv.getContext())) previewOnly = true;
            if (d instanceof Animatable && !previewOnly) {
                ((Animatable) d).start();
            }

            CharSequence current = tv.getText();
            if (current instanceof Spannable) {
                Spannable sp = (Spannable) current;
                int s = sp.getSpanStart(this);
                if (s >= 0 && (oldW != width || oldH != height)) {
                    int e = sp.getSpanEnd(this);
                    int f = sp.getSpanFlags(this);
                    sp.removeSpan(this);
                    sp.setSpan(this, s, e, f);
                }
            }
            tv.invalidate();
        }

        private boolean shown(TextView tv) {
            CharSequence current = tv.getText();
            return current instanceof Spanned && ((Spanned) current).getSpanStart(this) >= 0;
        }

        @Override
        public void invalidateDrawable(Drawable who) {
            TextView tv = view.get();
            if (tv == null || !shown(tv)) {
                if (who instanceof Animatable) ((Animatable) who).stop();
                who.setCallback(null);
                return;
            }
            tv.invalidate();
        }

        @Override
        public void scheduleDrawable(Drawable who, Runnable what, long when) {
            MAIN.postAtTime(what, who, when);
        }

        @Override
        public void unscheduleDrawable(Drawable who, Runnable what) {
            MAIN.removeCallbacks(what, who);
        }
    }

    // endregion

    // region loading

    private static final class Grab {
        final byte[] bytes;
        final boolean partial;

        Grab(byte[] bytes, boolean partial) {
            this.bytes = bytes;
            this.partial = partial;
        }
    }

    private static Grab fetch(String url, long limit) throws Exception {
        String cacheKey = url + "#" + limit;
        byte[] cached = CACHE.get(cacheKey);
        if (cached != null) return new Grab(cached, false);
        long cap = limit < 0 ? Long.MAX_VALUE : limit;
        HttpURLConnection conn = connect(url, null);
        try {
            int code = conn.getResponseCode();
            if (code / 100 != 2 && code != HttpURLConnection.HTTP_PARTIAL) {
                Log.d(TAG, "http " + code + " for " + url);
                return null;
            }
            int length = conn.getContentLength();
            if (length > cap) {
                Log.d(TAG, length + " bytes is over the inline limit for " + url);
                conn.disconnect();
                conn = null;
                return new Grab(prefix(url), true);
            }
            ByteArrayOutputStream kept = new ByteArrayOutputStream();
            int total = 0;
            try (InputStream in = conn.getInputStream()) {
                byte[] buf = new byte[16 * 1024];
                int n;
                while ((n = in.read(buf)) > 0) {
                    if (kept.size() < POSTER_BYTES) {
                        int room = POSTER_BYTES - kept.size();
                        kept.write(buf, 0, Math.min(n, room));
                    }
                    total += n;
                    if (total > cap) {
                        Log.d(TAG, "passed the inline limit while reading " + url);
                        return new Grab(kept.toByteArray(), true);
                    }
                }
            }
            byte[] bytes = kept.toByteArray();
            if (total > POSTER_BYTES) {
                bytes = readFully(url, total);
            }
            if (bytes == null) return null;
            CACHE.put(cacheKey, bytes);
            return new Grab(bytes, false);
        } finally {
            if (conn != null) conn.disconnect();
        }
    }

    /** Files under the limit but over the poster window are read in full for real playback. */
    private static byte[] readFully(String url, int expected) throws Exception {
        HttpURLConnection conn = connect(url, null);
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream(expected);
            try (InputStream in = conn.getInputStream()) {
                byte[] buf = new byte[16 * 1024];
                int n;
                while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
            }
            return out.toByteArray();
        } finally {
            conn.disconnect();
        }
    }

    private static byte[] prefix(String url) throws Exception {
        HttpURLConnection conn = connect(url, "bytes=0-" + (POSTER_BYTES - 1));
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            try (InputStream in = conn.getInputStream()) {
                byte[] buf = new byte[16 * 1024];
                int n;
                while ((n = in.read(buf)) > 0 && out.size() < POSTER_BYTES) {
                    int room = POSTER_BYTES - out.size();
                    out.write(buf, 0, Math.min(n, room));
                }
            }
            return out.toByteArray();
        } finally {
            conn.disconnect();
        }
    }

    private static HttpURLConnection connect(String url, String range) throws Exception {
        HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
        conn.setConnectTimeout(15000);
        conn.setReadTimeout(20000);
        String host = new URL(url).getHost();
        if (host.contains("redd.it") || host.contains("redditmedia")) {
            conn.setRequestProperty("User-Agent", "Mozilla/5.0");
            conn.setRequestProperty("Referer", "https://www.reddit.com/");
        } else {
            conn.setRequestProperty("User-Agent", "Joey");
        }
        if (range != null) conn.setRequestProperty("Range", range);
        return conn;
    }

    private static Object openingFrames(byte[] bytes, int targetH) {
        byte[] clip = clipGif(bytes, 4);
        if (clip == null) {
            Log.d(TAG, "no complete opening frame in " + bytes.length + " bytes");
            return null;
        }
        android.graphics.Movie movie = android.graphics.Movie.decodeByteArray(clip, 0, clip.length);
        if (movie == null || movie.width() <= 0 || movie.height() <= 0) {
            Log.d(TAG, "opening frames did not decode");
            return null;
        }
        int duration = Math.max(movie.duration(), 0);
        int slots = 4;
        int step = duration > 80 ? Math.max(duration / slots, 40) : 0;
        java.util.List<Bitmap> frames = new java.util.ArrayList<>();
        for (int i = 0; i < slots; i++) {
            movie.setTime(step == 0 ? 0 : Math.min(Math.max(duration - 1, 0), i * step));
            Bitmap frame = Bitmap.createBitmap(movie.width(), movie.height(), Bitmap.Config.ARGB_8888);
            movie.draw(new Canvas(frame), 0, 0);
            if (!frames.isEmpty() && sameFrame(frames.get(frames.size() - 1), frame)) {
                frame.recycle();
                break;
            }
            frames.add(scaleFrame(frame, targetH));
            if (step == 0) break;
        }
        if (frames.isEmpty()) return null;
        if (frames.size() == 1) return new BitmapDrawable(Resources.getSystem(), frames.get(0));
        android.graphics.drawable.AnimationDrawable animation = new android.graphics.drawable.AnimationDrawable();
        int each = step == 0 ? 120 : step;
        for (Bitmap frame : frames) {
            animation.addFrame(new BitmapDrawable(Resources.getSystem(), frame), each);
        }
        animation.setOneShot(false);
        return animation;
    }

    private static Bitmap scaleFrame(Bitmap frame, int targetH) {
        int limit = Math.max(targetH * 4, 1);
        if (frame.getHeight() <= limit) return frame;
        int width = Math.max(1, frame.getWidth() * limit / frame.getHeight());
        Bitmap scaled = Bitmap.createScaledBitmap(frame, width, limit, true);
        if (scaled != frame) frame.recycle();
        return scaled;
    }

    /** Cuts a partial GIF after a few complete frames and adds the trailer Android needs to decode it. */
    private static byte[] clipGif(byte[] bytes, int frameLimit) {
        if (bytes == null || bytes.length < 13 || bytes[0] != 'G' || bytes[1] != 'I' || bytes[2] != 'F') return null;
        int i = 13;
        int packed = bytes[10] & 0xFF;
        if ((packed & 0x80) != 0) i += 3 * (1 << ((packed & 7) + 1));
        int frames = 0;
        int end = -1;
        while (i < bytes.length) {
            int marker = bytes[i] & 0xFF;
            if (marker == 0x3B) {
                end = i + 1;
                break;
            }
            if (marker == 0x21) {
                i += 2;
                while (i < bytes.length) {
                    int size = bytes[i] & 0xFF;
                    i++;
                    if (size == 0) break;
                    i += size;
                }
                continue;
            }
            if (marker != 0x2C) return frames == 0 ? null : finishGif(bytes, end);
            if (i + 10 > bytes.length) break;
            int imagePacked = bytes[i + 9] & 0xFF;
            i += 10;
            if ((imagePacked & 0x80) != 0) i += 3 * (1 << ((imagePacked & 7) + 1));
            if (i >= bytes.length) break;
            i++;
            boolean complete = false;
            while (i < bytes.length) {
                int size = bytes[i] & 0xFF;
                i++;
                if (size == 0) {
                    complete = true;
                    break;
                }
                i += size;
            }
            if (!complete) break;
            frames++;
            end = i;
            if (frames >= frameLimit) break;
        }
        return frames == 0 ? null : finishGif(bytes, end);
    }

    private static byte[] finishGif(byte[] bytes, int end) {
        if (end <= 0 || end > bytes.length) return null;
        byte[] clip = java.util.Arrays.copyOf(bytes, end + 1);
        clip[end] = 0x3B;
        return clip;
    }

    private static boolean sameFrame(Bitmap a, Bitmap b) {
        if (a.getWidth() != b.getWidth() || a.getHeight() != b.getHeight()) return false;
        int x = a.getWidth() / 2;
        int y = a.getHeight() / 2;
        return a.getPixel(x, y) == b.getPixel(x, y)
                && a.getPixel(Math.max(0, x / 2), Math.max(0, y / 2)) == b.getPixel(Math.max(0, x / 2), Math.max(0, y / 2));
    }

    private static Object decode(String url, byte[] bytes, int targetH) throws Exception {
        if (Build.VERSION.SDK_INT >= 28) {
            ImageDecoder.Source source = ImageDecoder.createSource(ByteBuffer.wrap(bytes));
            return ImageDecoder.decodeDrawable(source, (decoder, info, src) -> {
                int h = info.getSize().getHeight();
                int w = info.getSize().getWidth();
                NATIVE_WIDTH.put(url, w);
                int limit = Math.max(targetH * 4, 1);
                if (h > limit) {
                    decoder.setTargetSize(Math.max(1, w * limit / h), limit);
                }
            });
        }
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
        NATIVE_WIDTH.put(url, bounds.outWidth);
        BitmapFactory.Options opts = new BitmapFactory.Options();
        opts.inSampleSize = 1;
        while (bounds.outHeight / (opts.inSampleSize * 2) >= targetH * 4) opts.inSampleSize *= 2;
        Bitmap bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.length, opts);
        return bitmap == null ? null : new BitmapDrawable(Resources.getSystem(), bitmap);
    }

    // endregion

    // region text helpers

    private static String unescape(String s) {
        return s.replace("&lt;", "<").replace("&gt;", ">").replace("&quot;", "\"")
                .replace("&#39;", "'").replace("&#x27;", "'").replace("&amp;", "&");
    }

    private static String escape(String s) {
        return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;");
    }

    private static String attr(String s) {
        return s.replace("&", "&amp;").replace("\"", "&quot;").replace("<", "&lt;").replace(">", "&gt;");
    }

    private static Paint kindPaint(float density) {
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        paint.setTextSize(11f * density);
        paint.setTypeface(android.graphics.Typeface.SANS_SERIF);
        return paint;
    }

    private static void drawKindLabel(Canvas canvas, String label, float x, float y, float density) {
        Paint paint = kindPaint(density);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeJoin(Paint.Join.ROUND);
        paint.setStrokeWidth(1.6f * density);
        paint.setColor(0xFF000000);
        canvas.drawText(label, x, y, paint);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xFFFFFFFF);
        canvas.drawText(label, x, y, paint);
    }

    private static final class KindBadge extends Drawable {
        private final Paint disc = new Paint(Paint.ANTI_ALIAS_FLAG);

        KindBadge() {
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            if (bounds.isEmpty()) return;
            float density = Resources.getSystem().getDisplayMetrics().density;
            float cx = bounds.exactCenterX();
            float cy = bounds.exactCenterY();
            float radius = 22f * density;
            disc.setColor(0xCC000000);
            canvas.drawCircle(cx, cy, radius, disc);
            android.graphics.Path triangle = new android.graphics.Path();
            triangle.moveTo(cx - radius * 0.28f, cy - radius * 0.42f);
            triangle.lineTo(cx - radius * 0.28f, cy + radius * 0.42f);
            triangle.lineTo(cx + radius * 0.46f, cy);
            triangle.close();
            disc.setColor(0xFFFFFFFF);
            canvas.drawPath(triangle, disc);
            Paint measure = kindPaint(density);
            float textWidth = measure.measureText("gif");
            drawKindLabel(canvas, "gif", bounds.right - textWidth - 8f * density, bounds.top + 16f * density, density);
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(android.graphics.ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    private static String snippet(String s) {
        return s.length() > 600 ? s.substring(0, 600) + "…" : s;
    }

    // endregion
}
