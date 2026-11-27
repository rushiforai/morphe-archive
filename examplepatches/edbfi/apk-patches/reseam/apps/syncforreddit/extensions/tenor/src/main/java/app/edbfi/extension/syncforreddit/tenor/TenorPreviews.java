// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.tenor;

import app.reseam.runtime.Export;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import javax.net.ssl.HttpsURLConnection;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;

public final class TenorPreviews {
    private static final int MAX_PAGE_BYTES = 512 * 1024;
    private static final int REQUEST_TIMEOUT = 2500;

    private TenorPreviews() {}

    @Export
    public static String commentModel(String link) {
        URI page = pageUri(link);
        return page == null ? null : page.toASCIIString();
    }

    @Export
    public static String postModel(JSONObject post, String original) {
        if (original != null || post == null || post.optBoolean("over_18") || post.optBoolean("spoiler")) {
            return original;
        }
        String thumbnail = post.optString("thumbnail");
        if (!thumbnail.isEmpty() && !thumbnail.equals("default")) {
            return original;
        }
        return commentModel(post.optString("url"));
    }

    @Export
    public static String imageUrl(String original) {
        URI page = pageUri(original);
        if (page == null) {
            return original;
        }

        // Glide invokes this on its background source loader.
        try {
            for (int redirects = 0; redirects <= 3; redirects++) {
                HttpsURLConnection request = (HttpsURLConnection) page.toURL().openConnection();
                try {
                    request.setInstanceFollowRedirects(false);
                    request.setConnectTimeout(REQUEST_TIMEOUT);
                    request.setReadTimeout(REQUEST_TIMEOUT);
                    request.setRequestProperty("Accept", "text/html");
                    int status = request.getResponseCode();
                    if (status == 301 || status == 302 || status == 303 || status == 307 || status == 308) {
                        String location = request.getHeaderField("Location");
                        page = location == null ? null : pageUri(page.resolve(location).toASCIIString());
                        if (page == null) {
                            break;
                        }
                    } else if (status == 200 && isHtml(request.getContentType())) {
                        try (InputStream body = request.getInputStream()) {
                            String image = imageFromHtml(readPage(body), page);
                            return image == null ? original : image;
                        }
                    } else {
                        break;
                    }
                } finally {
                    request.disconnect();
                }
            }
        } catch (IOException | IllegalArgumentException ignored) {
            // The original URL remains available as a link.
        }
        return original;
    }

    static String imageFromHtml(String html, URI page) {
        Element preview = Jsoup.parse(html).select("meta[property=og:image]").first();
        if (preview == null) {
            return null;
        }
        String content = preview.attr("content").trim();
        if (content.isEmpty()) {
            return null;
        }
        try {
            URI image = page.resolve(content);
            if (isHttps(image) && image.getHost().matches("(?i)media[0-9]*\\.tenor\\.com")
                    && image.getRawPath().startsWith("/m/")) {
                return image.toASCIIString();
            }
        } catch (IllegalArgumentException ignored) {
            // The page supplied a malformed image URL.
        }
        return null;
    }

    private static boolean isHtml(String type) {
        return type != null && (type.equalsIgnoreCase("text/html")
                || type.regionMatches(true, 0, "text/html;", 0, 10));
    }

    private static String readPage(InputStream input) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        byte[] chunk = new byte[8192];
        int count;
        while ((count = input.read(chunk)) >= 0) {
            if (buffer.size() + count > MAX_PAGE_BYTES) {
                throw new IOException("Tenor preview page exceeded the size limit");
            }
            buffer.write(chunk, 0, count);
        }
        return new String(buffer.toByteArray(), StandardCharsets.UTF_8);
    }

    private static URI pageUri(String link) {
        if (link == null) {
            return null;
        }
        try {
            URI uri = new URI(link);
            if (!isHttps(uri) || !("tenor.com".equalsIgnoreCase(uri.getHost())
                    || "www.tenor.com".equalsIgnoreCase(uri.getHost()))) {
                return null;
            }
            if (!uri.getRawPath().matches("/view/[A-Za-z0-9_-]+/?")) {
                return null;
            }
            return new URI("https", uri.getHost(), uri.getPath(), null);
        } catch (URISyntaxException ignored) {
            return null;
        }
    }

    private static boolean isHttps(URI uri) {
        return "https".equalsIgnoreCase(uri.getScheme()) && uri.getHost() != null
                && uri.getRawUserInfo() == null && (uri.getPort() == -1 || uri.getPort() == 443);
    }
}
