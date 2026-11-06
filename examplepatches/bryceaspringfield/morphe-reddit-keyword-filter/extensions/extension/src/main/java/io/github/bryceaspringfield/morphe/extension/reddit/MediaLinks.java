package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.*;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Color;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Log;
import android.view.ViewGroup;
import android.view.Window;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.Toast;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Shows the media a link post points to (an imgur, Streamable, RedGIFs, Giphy, or v.redd.it address, or a direct
 * image or video file) in a full-screen player inside Reddit, for older posts the app shows as plain links.
 */
final class MediaLinks {
    private static final String TAG = "RedditKeywordFilter";
    private static final Pattern IMGUR = Pattern.compile(
            "^https?://(?:i\\.|m\\.|www\\.)?imgur\\.com/([A-Za-z0-9]{5,8})(\\.[a-z0-9]+)?(?:[?#].*)?$");
    private static final Pattern STREAMABLE = Pattern.compile("^https?://(?:www\\.)?streamable\\.com/(?:e/|o/)?([a-z0-9]+)",
            Pattern.CASE_INSENSITIVE);
    private static final Pattern REDGIFS = Pattern.compile(
            "^https?://(?:www\\.|v3\\.|i\\.)?redgifs\\.com/(?:watch/|ifr/|i/)?([A-Za-z]+)", Pattern.CASE_INSENSITIVE);
    private static final Pattern GFYCAT = Pattern.compile(
            "^https?://(?:www\\.|thumbs\\.|giant\\.|zippy\\.)?gfycat\\.com/(?:gifs/detail/|ifr/)?([A-Za-z]+)",
            Pattern.CASE_INSENSITIVE);
    private static final Pattern GIPHY = Pattern.compile(
            "^https?://(?:www\\.|media\\d?\\.|i\\.)?giphy\\.com/(?:gifs/|media/)?(?:[\\w-]*-)?([A-Za-z0-9]{8,})",
            Pattern.CASE_INSENSITIVE);
    private static final Pattern VREDDIT = Pattern.compile("^https?://v\\.redd\\.it/([a-z0-9]+)", Pattern.CASE_INSENSITIVE);
    private static final Pattern VIDEO_FILE = Pattern.compile("\\.(mp4|webm|m4v|mov|m3u8)(?:[?#].*)?$",
            Pattern.CASE_INSENSITIVE);
    private static final Pattern IMAGE_FILE = Pattern.compile("\\.(jpe?g|png|gif|webp|bmp)(?:[?#].*)?$",
            Pattern.CASE_INSENSITIVE);

    private MediaLinks() {
    }

    /** The media a link shows: a video or an image address. */
    private static final class Media {
        final String url;
        final boolean video;

        Media(String url, boolean video) {
            this.url = url;
            this.video = video;
        }
    }

    /**
     * Injection point, at the start of the step opening a feed post's link: true when the link's media opened in
     * the player, which then replaces the browser.
     */
    static boolean onLinkClick(Object step) {
        try {
            if (!getBoolean(MEDIA_LINKS) || step == null) return false;
            if (Boolean.TRUE.equals(field(step, "$navigatesToPostDetail"))) return false;
            Object context = field(step, "$context");
            String url = linkUrl(field(step, "$link"));
            if (url == null) url = eventUrl(field(step, "$event"));
            if (!(context instanceof Context) || url == null || !isMediaLink(url)) return false;
            open((Context) context, url);
            return true;
        } catch (Throwable ex) {
            Log.e(TAG, "media link failure", ex);
            return false;
        }
    }

    private static Object field(Object owner, String name) {
        for (Class<?> type = owner.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(owner);
            } catch (NoSuchFieldException ignored) {
            } catch (Exception ex) {
                return null;
            }
        }
        return null;
    }

    private static String linkUrl(Object link) {
        if (link == null) return null;
        try {
            Object url = link.getClass().getMethod("getUrl").invoke(link);
            return url instanceof String && !((String) url).isEmpty() ? (String) url : null;
        } catch (Exception ex) {
            return null;
        }
    }

    private static String eventUrl(Object event) {
        if (event == null) return null;
        String text = String.valueOf(event);
        int start = text.indexOf(", url=");
        if (start < 0) return null;
        start += 6;
        int end = text.indexOf(", ", start);
        return end < 0 ? null : text.substring(start, end);
    }

    /** Whether a link points at media this player shows. */
    static boolean isMediaLink(String url) {
        String lower = url.toLowerCase(Locale.ROOT);
        if (lower.contains("imgur.com/a/") || lower.contains("imgur.com/gallery/")) return false;
        return IMGUR.matcher(url).find() || STREAMABLE.matcher(url).find() || REDGIFS.matcher(url).find()
                || GFYCAT.matcher(url).find() || GIPHY.matcher(url).find() || VREDDIT.matcher(url).find()
                || VIDEO_FILE.matcher(url).find() || IMAGE_FILE.matcher(url).find();
    }

    private static void open(Context context, String url) {
        Handler main = new Handler(Looper.getMainLooper());
        Toast.makeText(context, Strings.t("Loading media"), Toast.LENGTH_SHORT).show();
        new Thread(() -> {
            Media media = null;
            try {
                media = resolve(url);
            } catch (Throwable ex) {
                Log.e(TAG, "media link resolve failure " + url, ex);
            }
            Media found = media;
            main.post(() -> {
                if (found == null) {
                    Toast.makeText(context, Strings.t("The media is no longer available; opening the link"),
                            Toast.LENGTH_SHORT).show();
                    openInBrowser(context, url);
                } else {
                    show(context, found);
                }
            });
        }, "MediaLinks").start();
    }

    /** The media address of a link, asking the host's API where the link names a page. */
    static Media resolve(String url) throws Exception {
        Matcher m = IMGUR.matcher(url);
        if (m.find()) {
            String id = m.group(1);
            String ext = m.group(2) == null ? "" : m.group(2).toLowerCase(Locale.ROOT);
            if (ext.equals(".gifv") || ext.equals(".mp4") || ext.equals(".webm") || ext.equals(".gif")) {
                return available("https://i.imgur.com/" + id + ".mp4") ? new Media("https://i.imgur.com/" + id + ".mp4", true) : null;
            }
            if (!ext.isEmpty()) return available(url) ? new Media(url, false) : null;
            if (available("https://i.imgur.com/" + id + ".mp4")) return new Media("https://i.imgur.com/" + id + ".mp4", true);
            return available("https://i.imgur.com/" + id + ".jpg") ? new Media("https://i.imgur.com/" + id + ".jpg", false) : null;
        }
        m = STREAMABLE.matcher(url);
        if (m.find()) {
            JSONObject video = new JSONObject(get("https://api.streamable.com/videos/" + m.group(1), null));
            JSONObject files = video.optJSONObject("files");
            JSONObject mp4 = files == null ? null : files.optJSONObject("mp4");
            if (mp4 == null && files != null) mp4 = files.optJSONObject("mp4-mobile");
            String file = mp4 == null ? "" : mp4.optString("url");
            if (file.startsWith("//")) file = "https:" + file;
            return file.isEmpty() ? null : new Media(file, true);
        }
        m = REDGIFS.matcher(url);
        if (m.find()) return redgifs(m.group(1));
        // Gfycat closed in 2023; RedGIFs keeps many of its clips under the same names.
        m = GFYCAT.matcher(url);
        if (m.find()) return redgifs(m.group(1));
        m = GIPHY.matcher(url);
        if (m.find()) {
            String mp4 = "https://media.giphy.com/media/" + m.group(1) + "/giphy.mp4";
            return available(mp4) ? new Media(mp4, true) : null;
        }
        m = VREDDIT.matcher(url);
        if (m.find()) return new Media("https://v.redd.it/" + m.group(1) + "/HLSPlaylist.m3u8", true);
        if (VIDEO_FILE.matcher(url).find()) return available(url) ? new Media(url, true) : null;
        if (IMAGE_FILE.matcher(url).find()) return available(url) ? new Media(url, false) : null;
        return null;
    }

    private static Media redgifs(String id) throws Exception {
        JSONObject auth = new JSONObject(get("https://api.redgifs.com/v2/auth/temporary", null));
        String token = auth.optString("token");
        if (token.isEmpty()) return null;
        JSONObject gif = new JSONObject(get("https://api.redgifs.com/v2/gifs/" + id.toLowerCase(Locale.ROOT),
                token)).optJSONObject("gif");
        JSONObject urls = gif == null ? null : gif.optJSONObject("urls");
        if (urls == null) return null;
        String file = urls.optString("hd", urls.optString("sd"));
        return file.isEmpty() ? null : new Media(file, true);
    }

    private static HttpURLConnection connect(String url, String token, String method) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setRequestMethod(method);
        connection.setConnectTimeout(10000);
        connection.setReadTimeout(15000);
        connection.setInstanceFollowRedirects(true);
        connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 Chrome/130 Mobile Safari/537.36");
        if (token != null) connection.setRequestProperty("Authorization", "Bearer " + token);
        return connection;
    }

    private static String get(String url, String token) throws Exception {
        HttpURLConnection connection = connect(url, token, "GET");
        try (InputStream in = connection.getInputStream()) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int n;
            while ((n = in.read(buffer)) > 0) out.write(buffer, 0, n);
            return out.toString("UTF-8");
        } finally {
            connection.disconnect();
        }
    }

    /**
     * Whether an address answers with media: imgur sends a removed file to its removed.png placeholder, which the
     * final address shows.
     */
    private static boolean available(String url) {
        try {
            HttpURLConnection connection = connect(url, null, "HEAD");
            try {
                int code = connection.getResponseCode();
                String end = String.valueOf(connection.getURL());
                return code >= 200 && code < 300 && !end.contains("removed.png") && !end.endsWith("imgur.com/");
            } finally {
                connection.disconnect();
            }
        } catch (Exception ex) {
            return false;
        }
    }

    private static void openInBrowser(Context context, String url) {
        try {
            android.content.Intent intent = new android.content.Intent(android.content.Intent.ACTION_VIEW, Uri.parse(url));
            if (!(context instanceof Activity)) intent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Exception ex) {
            Log.e(TAG, "media link browser failure", ex);
        }
    }

    private static Context activityContext(Context context) {
        Context c = context;
        while (c instanceof ContextWrapper && !(c instanceof Activity)) c = ((ContextWrapper) c).getBaseContext();
        return c instanceof Activity ? c : context;
    }

    /** A full-screen black dialog with the media in a web view, which plays MP4, WebM, and HLS and animates GIFs. */
    private static void show(Context context, Media media) {
        Context host = activityContext(context);
        Dialog dialog = new Dialog(host, android.R.style.Theme_Black_NoTitleBar_Fullscreen);
        WebView web = new WebView(host);
        web.setBackgroundColor(Color.BLACK);
        WebSettings settings = web.getSettings();
        settings.setMediaPlaybackRequiresUserGesture(false);
        settings.setLoadWithOverviewMode(true);
        settings.setUseWideViewPort(true);
        settings.setBuiltInZoomControls(!media.video);
        settings.setDisplayZoomControls(false);
        web.setWebChromeClient(new WebChromeClient());
        String src = TextUtils.htmlEncode(media.url);
        String body = media.video
                ? "<video src=\"" + src + "\" autoplay loop controls playsinline></video>"
                : "<img src=\"" + src + "\">";
        String html = "<!DOCTYPE html><html><head><meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">"
                + "<style>html,body{margin:0;height:100%;background:#000;display:flex;align-items:center;"
                + "justify-content:center}video,img{max-width:100%;max-height:100%}</style></head><body>" + body
                + "</body></html>";
        web.loadDataWithBaseURL("https://www.reddit.com/", html, "text/html", "UTF-8", null);
        dialog.setContentView(web, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        dialog.setOnDismissListener(d -> web.destroy());
        Window window = dialog.getWindow();
        if (window != null) window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        dialog.show();
    }
}
