// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.imgur;

import app.reseam.runtime.Export;
import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import okhttp3.CacheControl;
import okhttp3.HttpUrl;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public final class AlbumRequests {
    private static final Pattern ALBUM = Pattern.compile("/3/(?:gallery/)?album/([A-Za-z0-9]{1,32})");
    private static final int MAX_IMAGE_METADATA = 2 * 1024 * 1024;

    private AlbumRequests() {}

    @Export
    public static OkHttpClient forMetadata(OkHttpClient client) {
        OkHttpClient.Builder builder = client.newBuilder();
        builder.interceptors().add(0, AlbumRequests::read);
        return builder.build();
    }

    private static Response read(Interceptor.Chain chain) throws IOException {
        Request request = chain.request();
        Response response = chain.proceed(request);
        HttpUrl url = request.url();
        if (!url.isHttps() || !"api.imgur.com".equals(url.host()) || url.port() != 443
                || !request.method().equals("GET") || !url.equals(response.request().url())) {
            return response;
        }
        Matcher album = ALBUM.matcher(url.encodedPath());
        if (response.code() == 404 && album.matches()) {
            response.close();
            Request imageRequest = request.newBuilder()
                    .url(url.newBuilder().encodedPath("/3/image/" + album.group(1)).build())
                    .removeHeader("If-None-Match").removeHeader("If-Modified-Since").build();
            Response image = chain.proceed(imageRequest);
            if (image.code() != 200) return image;
            try (image; ResponseBody body = image.peekBody(MAX_IMAGE_METADATA + 1L)) {
                if (body.contentLength() > MAX_IMAGE_METADATA) throw new IOException("Imgur image metadata too large");
                JSONObject item = new JSONObject(body.string()).getJSONObject("data");
                JSONObject data = new JSONObject().put("images", new JSONArray().put(item));
                String json = new JSONObject().put("data", data).toString();
                // The response is cached under the album URL. The image's validators apply to its own URL.
                response = image.newBuilder().request(request).removeHeader("ETag").removeHeader("Last-Modified")
                        .removeHeader("Content-Length").removeHeader("Content-Encoding")
                        .body(ResponseBody.create(json, body.contentType())).build();
            } catch (JSONException invalidImage) {
                throw new IOException("Invalid Imgur image metadata", invalidImage);
            }
        }
        // Sync's Volley transport keeps only the last field with a given name.
        CacheControl policy = response.cacheControl();
        // Volley also compares these directives case-sensitively. Use OkHttp's parsed
        // policy so even a mixed-case directive prevents reuse of the response.
        if (policy.noStore() || policy.noCache()) {
            return response.newBuilder().header("Cache-Control", policy.noStore() ? "no-store" : "no-cache").build();
        }
        List<String> policies = response.headers("Cache-Control");
        if (policies.size() > 1) {
            StringBuilder combined = new StringBuilder(policies.get(0));
            for (int i = 1; i < policies.size(); i++) combined.append(", ").append(policies.get(i));
            return response.newBuilder().header("Cache-Control", combined.toString()).build();
        }
        if (response.code() == 200 && response.header("Cache-Control") == null
                && response.header("Expires") == null && response.header("Pragma") == null) {
            return response.newBuilder().header("Cache-Control", "max-age=3600").build();
        }
        return response;
    }
}
