// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.shared.imgur;

import android.net.Uri;
import app.reseam.runtime.Export;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.net.ssl.HttpsURLConnection;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public final class Imgur {
    private static final String API = "https://api.imgur.com/3/";
    private static final int MAX_RESPONSE_BYTES = 2 * 1024 * 1024;
    private static final Pattern TITLED_ALBUM_PATH = Pattern.compile("/(a|gallery)/[^/]+-([A-Za-z0-9]{1,32})/*");

    private Imgur() {}

    @Export
    public static Map<String, String> headers(String url, Map<String, String> original, String clientId) {
        Map<String, String> headers = new LinkedHashMap<>(original);
        Iterator<String> names = headers.keySet().iterator();
        while (names.hasNext()) {
            String name = names.next();
            if (name.equalsIgnoreCase("Authorization") || name.equalsIgnoreCase("X-RapidAPI-Key")
                    || name.equalsIgnoreCase("X-RapidAPI-Host")) {
                names.remove();
            }
        }
        if (isApiUrl(url)) {
            headers.put("Authorization", "Client-ID " + clientId);
        }
        return headers;
    }

    @Export
    public static boolean isApiUrl(String url) {
        if (url == null) {
            return false;
        }
        try {
            URI uri = new URI(url);
            return "https".equalsIgnoreCase(uri.getScheme()) && "api.imgur.com".equalsIgnoreCase(uri.getHost())
                    && uri.getRawUserInfo() == null && (uri.getPort() == -1 || uri.getPort() == 443)
                    && uri.getRawPath().startsWith("/3/");
        } catch (URISyntaxException ignored) {
            return false;
        }
    }

    @Export
    public static String albumUrl(String link) {
        URI page = page(link);
        return albumEndpoint(id(link), page != null && page.getRawPath().startsWith("/gallery/"));
    }

    @Export
    public static Uri albumUri(String link, boolean gallery) {
        return Uri.parse(albumEndpoint(id(link), gallery));
    }

    @Export
    public static String imageUrl(String link) {
        return API + "image/" + id(link);
    }

    @Export
    public static String normalizeAlbumLink(String link) {
        URI parsed = page(link);
        if (parsed == null) {
            return link;
        }
        String path = parsed.getRawPath();
        boolean gallery = path.startsWith("/gallery/");
        if (!gallery && !path.startsWith("/a/")) {
            return link;
        }
        String id = id(link);
        return id.isEmpty() ? link : "https://imgur.com" + (gallery ? "/gallery/" : "/a/") + id;
    }

    @Export
    public static String titledCommentCoverModel(String link, String stockModel) {
        URI parsed = page(link);
        if (parsed == null) {
            return stockModel;
        }
        Matcher titled = TITLED_ALBUM_PATH.matcher(parsed.getRawPath());
        if (!titled.matches() || !isId(titled.group(2))) {
            return stockModel;
        }
        return "https://imgur.com/" + titled.group(1) + "/" + titled.group(2);
    }

    @Export
    public static String postCoverModel(JSONObject post, String original) {
        if (original != null || post == null || post.optBoolean("over_18") || post.optBoolean("spoiler")) {
            return original;
        }
        String thumbnail = post.optString("thumbnail");
        if (!thumbnail.isEmpty() && !thumbnail.equals("default")) {
            return original;
        }
        String url = post.optString("url");
        URI parsed = page(url);
        if (parsed == null || !isAlbumPath(parsed.getRawPath()) || id(url).isEmpty()) {
            return original;
        }
        return normalizeAlbumLink(url);
    }

    @Export
    public static String resolveCoverModel(String url, String clientId) {
        URI parsed = page(url);
        if (parsed == null || !isAlbumPath(parsed.getRawPath())) {
            return url;
        }
        String cover = coverUrl(url, parsed.getRawPath().startsWith("/gallery/"), clientId, true);
        return cover != null ? cover : url;
    }

    @Export
    public static String coverUrl(Uri page, boolean gallery, String clientId) {
        return coverUrl(page.toString(), gallery, clientId, false);
    }

    private static String coverUrl(String page, boolean gallery, String clientId, boolean retryImage) {
        String albumId = id(page);
        if (albumId.isEmpty()) {
            return null;
        }
        try {
            String album = readMetadata(albumEndpoint(albumId, gallery), clientId);
            if (album != null) {
                return coverFromJson(album);
            }
            if (retryImage) {
                String image = readMetadata(API + "image/" + albumId, clientId);
                if (image != null) {
                    return imageCoverFromJson(image);
                }
            }
        } catch (IOException | JSONException ignored) {
            // The original Glide model remains available when metadata cannot be resolved.
        }
        return null;
    }

    // Only a missing album can be a gallery submission containing a single image.
    private static String readMetadata(String url, String clientId) throws IOException {
        HttpsURLConnection request = (HttpsURLConnection) new URL(url).openConnection();
        try {
            request.setInstanceFollowRedirects(false);
            request.setConnectTimeout(4000);
            request.setReadTimeout(4000);
            request.setRequestProperty("Authorization", "Client-ID " + clientId);
            request.setRequestProperty("Accept", "application/json");
            int status = request.getResponseCode();
            if (status == 404) {
                return null;
            }
            if (status != 200) {
                throw new IOException("Imgur metadata returned HTTP " + status);
            }
            try (InputStream body = request.getInputStream()) {
                return readResponse(body);
            }
        } finally {
            request.disconnect();
        }
    }

    static String imageCoverFromJson(String json) throws JSONException {
        JSONObject data = new JSONObject(json).optJSONObject("data");
        Object id = data == null ? null : data.opt("id");
        return id instanceof String && isId((String) id) ? "https://i.imgur.com/" + id + "m.jpg" : null;
    }

    static String coverFromJson(String json) throws JSONException {
        JSONObject data = new JSONObject(json).optJSONObject("data");
        if (data == null) {
            return null;
        }
        String cover = data.optString("cover");
        if (isId(cover)) {
            return "https://i.imgur.com/" + cover + "m.jpg";
        }
        JSONArray images = data.optJSONArray("images");
        if (images == null) {
            return null;
        }
        for (int index = 0; index < images.length(); index++) {
            JSONObject image = images.optJSONObject(index);
            String id = image == null ? "" : image.optString("id");
            if (isId(id)) {
                return "https://i.imgur.com/" + id + "m.jpg";
            }
        }
        return null;
    }

    static String id(String link) {
        if (link == null) {
            return "";
        }
        String segment = link;
        URI parsed = page(link);
        if (parsed != null) {
            String path = parsed.getRawPath().replaceFirst("/+$", "");
            segment = path.substring(path.lastIndexOf('/') + 1);
        }
        segment = segment.substring(segment.lastIndexOf('-') + 1)
                .replaceFirst("(?i)\\.(jpg|jpeg|png|gifv?|mp4|webp)$", "");
        return isId(segment) ? segment : "";
    }

    private static boolean isAlbumPath(String path) {
        return path.startsWith("/a/") || path.startsWith("/gallery/");
    }

    private static boolean isId(String value) {
        return value.matches("[A-Za-z0-9]{1,32}") && !value.equals("null");
    }

    private static URI page(String link) {
        if (link == null) {
            return null;
        }
        try {
            URI uri = new URI(link);
            String host = uri.getHost();
            if (("https".equalsIgnoreCase(uri.getScheme()) || "http".equalsIgnoreCase(uri.getScheme()))
                    && ("imgur.com".equalsIgnoreCase(host) || "www.imgur.com".equalsIgnoreCase(host)
                    || "i.imgur.com".equalsIgnoreCase(host)) && uri.getPort() == -1 && uri.getRawUserInfo() == null) {
                return uri;
            }
        } catch (URISyntaxException ignored) {
            // A bare ID is resolved separately.
        }
        return null;
    }

    private static String albumEndpoint(String id, boolean gallery) {
        return API + (gallery ? "gallery/album/" : "album/") + id;
    }

    private static String readResponse(InputStream input) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        byte[] chunk = new byte[8192];
        int count;
        while ((count = input.read(chunk)) >= 0) {
            if (buffer.size() + count > MAX_RESPONSE_BYTES) {
                throw new IOException("Imgur album response exceeded the size limit");
            }
            buffer.write(chunk, 0, count);
        }
        return new String(buffer.toByteArray(), StandardCharsets.UTF_8);
    }
}
