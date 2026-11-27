// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.imgur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
import org.json.JSONObject;
import org.junit.Test;
import static org.junit.Assert.*;

public final class AlbumRequestsTest {
    private static final String ALBUM = "https://api.imgur.com/3/gallery/album/AbC1234";
    private static final String IMAGE = "https://api.imgur.com/3/image/AbC1234";

    private static Response response(Request request, int status, String json) {
        return new Response.Builder().request(request).protocol(Protocol.HTTP_1_1)
                .code(status).message("fixture").body(ResponseBody.create(json, null)).build();
    }

    private static Response get(Interceptor fixture) throws IOException {
        OkHttpClient stock = new OkHttpClient.Builder().addInterceptor(fixture).build();
        return AlbumRequests.forMetadata(stock).newCall(new Request.Builder().url(ALBUM)
                .header("If-None-Match", "album-tag").build()).execute();
    }

    @Test
    public void cachesSuccessfulImageAsAnAlbumUnderTheOriginalRequest() throws Exception {
        List<String> urls = new ArrayList<>();
        try (Response answer = get(chain -> {
            Request request = chain.request();
            urls.add(request.url().toString());
            if (urls.size() == 1) return response(request, 404, "{}");
            assertNull(request.header("If-None-Match"));
            return response(request, 200, "{\"data\":{\"id\":\"Picture\",\"link\":\"https://i.imgur.com/Picture.jpg\"}}")
                    .newBuilder().header("ETag", "image-only").build();
        })) {
            assertEquals(List.of(ALBUM, IMAGE), urls);
            assertEquals(ALBUM, answer.request().url().toString());
            assertEquals(200, answer.code());
            assertEquals("max-age=3600", answer.header("Cache-Control"));
            assertNull(answer.header("ETag"));
            assertEquals("Picture", new JSONObject(answer.body().string()).getJSONObject("data")
                    .getJSONArray("images").getJSONObject(0).getString("id"));
        }
    }

    @Test
    public void doesNotCacheAnImageWhenAnyPolicyForbidsStorage() throws Exception {
        try (Response answer = get(chain -> {
            Request request = chain.request();
            if (request.url().toString().equals(ALBUM)) return response(request, 404, "{}");
            return response(request, 200, "{\"data\":{\"id\":\"Picture\"}}").newBuilder()
                    .addHeader("Cache-Control", "No-Store").addHeader("Cache-Control", "max-age=3600").build();
        })) {
            assertEquals(List.of("no-store"), answer.headers("Cache-Control"));
        }
    }

    @Test
    public void preservesReadPolicyAndDoesNotRetryOtherFailures() throws Exception {
        for (int status : new int[]{200, 403, 429, 503}) {
            List<String> urls = new ArrayList<>();
            try (Response answer = get(chain -> {
                urls.add(chain.request().url().toString());
                return response(chain.request(), status, "{}").newBuilder().header("Cache-Control", "no-store").build();
            })) {
                assertEquals(List.of(ALBUM), urls);
                assertEquals(status, answer.code());
                assertEquals("no-store", answer.header("Cache-Control"));
            }
        }
    }
}
