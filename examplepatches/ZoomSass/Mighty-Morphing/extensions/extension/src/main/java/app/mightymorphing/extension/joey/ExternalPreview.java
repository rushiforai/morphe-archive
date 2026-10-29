package app.mightymorphing.extension.joey;

import android.net.Uri;
import android.util.Log;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Turns comment links from other sites into image addresses. Video hosts supply a
 * still from that video. Imgur albums and galleries stay as links. The original link
 * stays the tap target.
 */
final class ExternalPreview {
    private static final Pattern YOUTUBE = Pattern.compile(
            "(?:youtube\\.com/(?:watch\\?v=|embed/|shorts/)|youtu\\.be/)([A-Za-z0-9_-]{11})");
    private static final Pattern GIPHY = Pattern.compile("(?:/gifs/|/media/)(?:[\\w-]+-)?([A-Za-z0-9]+)(?:/|$)");

    final List<String> images = new ArrayList<>();
    final boolean play;
    final boolean animate;

    private ExternalPreview(boolean play, boolean animate) {
        this.play = play;
        this.animate = animate;
    }

    static boolean supported(String href) {
        return immediate(href) != null || needsFetch(href);
    }

    /** A preview address known without a network call, or null. */
    static ExternalPreview immediate(String href) {
        if (href == null) return null;
        String lower = href.toLowerCase();
        Matcher youtube = YOUTUBE.matcher(href);
        if (lower.contains("youtube.com") || lower.contains("youtu.be")) {
            if (!MorpheSettings.youtubeInline() || !youtube.find()) return null;
            ExternalPreview preview = new ExternalPreview(true, false);
            preview.images.add("https://i.ytimg.com/vi/" + youtube.group(1) + "/hqdefault.jpg");
            return preview;
        }
        Matcher giphy = GIPHY.matcher(href);
        if (lower.contains("giphy.com") && giphy.find()) {
            ExternalPreview preview = new ExternalPreview(false, true);
            preview.images.add("https://media.giphy.com/media/" + giphy.group(1) + "/giphy.gif");
            return preview;
        }
        String imgurId = imgurSingle(href);
        if (imgurId != null) {
            boolean gifv = lower.contains(".gifv");
            boolean gif = lower.contains(".gif") && !gifv;
            ExternalPreview preview = new ExternalPreview(gifv, gif);
            preview.images.add("https://i.imgur.com/" + imgurId + (gifv ? ".jpg" : imageExt(lower, imgurId)));
            return preview;
        }
        return null;
    }

    static boolean needsFetch(String href) {
        if (href == null || immediate(href) != null) return false;
        if (imgurAlbum(href) != null) return false;
        String lower = href.toLowerCase();
        return lower.contains("redgifs.com/")
                || lower.contains("gfycat.com/")
                || lower.contains("streamable.com/")
                || lower.contains("tenor.com/")
                || freeimage(href);
    }

    static ExternalPreview fetch(String href) {
        try {
            if (imgurAlbum(href) != null) return null;
            String lower = href.toLowerCase();
            if (lower.contains("redgifs.com/") || lower.contains("gfycat.com/")) return redgifs(href);
            if (lower.contains("streamable.com/")) return streamable(href);
            if (lower.contains("tenor.com/")) return tenor(href);
            if (freeimage(href)) return freeimagePreview(href);
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static String imageExt(String lower, String id) {
        if (lower.contains(".png")) return ".png";
        if (lower.contains(".jpeg")) return ".jpeg";
        if (lower.contains(".jpg")) return ".jpg";
        if (lower.contains(".webp")) return ".webp";
        if (lower.contains(".gif")) return ".gif";
        return ".jpg";
    }

    private static String imgurSingle(String href) {
        Uri uri = Uri.parse(href);
        String host = uri.getHost() == null ? "" : uri.getHost().toLowerCase();
        if (!host.endsWith("imgur.com")) return null;
        String path = uri.getPath() == null ? "" : uri.getPath();
        if (path.contains("/a/") || path.contains("/gallery/") || path.contains("/upload")) return null;
        String id = path.substring(path.lastIndexOf('/') + 1);
        int dot = id.indexOf('.');
        if (dot > 0) id = id.substring(0, dot);
        if (id.length() < 5 || id.length() > 12) return null;
        return id;
    }

    private static String imgurAlbum(String href) {
        Uri uri = Uri.parse(href);
        String host = uri.getHost() == null ? "" : uri.getHost().toLowerCase();
        if (!host.endsWith("imgur.com")) return null;
        String path = uri.getPath() == null ? "" : uri.getPath();
        int at = path.indexOf("/a/");
        if (at < 0) at = path.indexOf("/gallery/");
        if (at < 0) return null;
        String rest = path.substring(path.indexOf('/', at + 1) + 1);
        int slash = rest.indexOf('/');
        if (slash >= 0) rest = rest.substring(0, slash);
        int dot = rest.indexOf('.');
        if (dot > 0) rest = rest.substring(0, dot);
        return rest.isEmpty() ? null : rest;
    }

    /** freeimage.host viewer pages hide the file at iili.io. */
    private static boolean freeimage(String href) {
        Uri uri = Uri.parse(href);
        String host = uri.getHost() == null ? "" : uri.getHost().toLowerCase();
        if (!host.equals("freeimage.host") && !host.endsWith(".freeimage.host")) return false;
        String path = uri.getPath() == null ? "" : uri.getPath();
        return path.startsWith("/i/") && path.length() > 3;
    }

    private static ExternalPreview freeimagePreview(String href) throws Exception {
        String html = http(href, null);
        Matcher image = Pattern.compile("property=\"og:image\" content=\"(https://iili.io/[^\"]+)\"").matcher(html);
        if (!image.find()) return null;
        String url = image.group(1);
        Log.i("MightyMedia", "freeimage " + url);
        boolean gif = url.toLowerCase().contains(".gif");
        ExternalPreview preview = new ExternalPreview(false, gif);
        preview.images.add(url);
        return preview;
    }

    private static ExternalPreview redgifs(String href) throws Exception {
        String id = lastSegment(href);
        if (id.isEmpty()) return null;
        String tokenBody = http("https://api.redgifs.com/v2/auth/temporary", null);
        String token = new JSONObject(tokenBody).optString("token", "");
        if (token.isEmpty()) return null;
        String gifBody = http("https://api.redgifs.com/v2/gifs/" + id, "Bearer " + token);
        JSONObject urls = new JSONObject(gifBody).getJSONObject("gif").getJSONObject("urls");
        String poster = first(urls, "poster", "thumbnail", "jpg");
        if (poster.isEmpty()) return null;
        ExternalPreview preview = new ExternalPreview(true, false);
        preview.images.add(poster);
        return preview;
    }

    private static ExternalPreview streamable(String href) throws Exception {
        String id = lastSegment(href);
        if (id.isEmpty()) return null;
        JSONObject root = new JSONObject(http("https://api.streamable.com/videos/" + id, null));
        String thumb = root.optString("thumbnail_url", "");
        if (thumb.isEmpty()) return null;
        ExternalPreview preview = new ExternalPreview(true, false);
        preview.images.add(thumb);
        return preview;
    }

    private static ExternalPreview tenor(String href) throws Exception {
        String html = http(href, null);
        Matcher image = Pattern.compile("property=\"og:image\" content=\"([^\"]+)\"").matcher(html);
        if (!image.find()) {
            image = Pattern.compile("https://media\\.tenor.com/[^\"'\\s]+").matcher(html);
            if (!image.find()) return null;
        }
        String url = image.groupCount() > 0 && image.group(1) != null ? image.group(1) : image.group();
        boolean gif = url.toLowerCase().contains(".gif");
        ExternalPreview preview = new ExternalPreview(!gif, gif);
        preview.images.add(url);
        return preview;
    }

    private static String lastSegment(String href) {
        String path = Uri.parse(href).getPath();
        if (path == null || path.isEmpty()) return "";
        String id = path.substring(path.lastIndexOf('/') + 1);
        int dot = id.indexOf('.');
        if (dot > 0) id = id.substring(0, dot);
        return id;
    }

    private static String first(JSONObject object, String... keys) {
        for (String key : keys) {
            String value = object.optString(key, "");
            if (!value.isEmpty()) return value;
        }
        return "";
    }

    private static String http(String url, String authorization) throws Exception {
        HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
        conn.setConnectTimeout(15000);
        conn.setReadTimeout(20000);
        conn.setRequestProperty("User-Agent", "Joey");
        if (authorization != null) conn.setRequestProperty("Authorization", authorization);
        try {
            if (conn.getResponseCode() / 100 != 2) return "";
            try (InputStream in = conn.getInputStream()) {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buf = new byte[8192];
                int n;
                while ((n = in.read(buf)) > 0 && out.size() < 2 * 1024 * 1024) out.write(buf, 0, n);
                return out.toString("UTF-8");
            }
        } finally {
            conn.disconnect();
        }
    }
}
