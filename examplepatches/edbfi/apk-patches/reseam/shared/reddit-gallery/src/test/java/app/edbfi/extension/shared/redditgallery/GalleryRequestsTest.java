// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.shared.redditgallery;

import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;
import org.json.JSONObject;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

public final class GalleryRequestsTest {
    @Test
    public void keepsItemOrderAndUsesLargestValidPreviewForFailedImage() throws Exception {
        String listing = """
                {"data":{"children":[{"data":{
                  "gallery_data":{"items":[{"media_id":"good","caption":"first"},{"media_id":"gone"},
                    {"media_id":"preview","caption":"last"}]},
                  "media_metadata":{
                    "good":{"status":"valid","e":"Image","s":{"u":"https://i.redd.it/good.jpg","x":1000,"y":800}},
                    "gone":{"status":"failed","e":"Image"},
                    "preview":{"status":"failed","e":"Image","p":[
                      {"u":"https://preview.redd.it/preview-small.jpg","x":200,"y":100},
                      {"u":"https://preview.redd.it/preview-large.jpg","x":400,"y":200}]}
                  }}}]}}
                """;
        try (var input = new ByteArrayInputStream(listing.getBytes(StandardCharsets.UTF_8));
                var normalized = GalleryRequests.normalizeGalleryResponse(input)) {
            JSONObject post = new JSONObject(new String(normalized.readAllBytes(), StandardCharsets.UTF_8))
                    .getJSONObject("data").getJSONArray("children").getJSONObject(0).getJSONObject("data");
            var items = post.getJSONObject("gallery_data").getJSONArray("items");
            var metadata = post.getJSONObject("media_metadata");
            assertEquals(2, items.length());
            assertEquals("first", items.getJSONObject(0).getString("caption"));
            assertEquals("last", items.getJSONObject(1).getString("caption"));
            assertFalse(metadata.has("gone"));
            assertEquals("https://preview.redd.it/preview-large.jpg",
                    metadata.getJSONObject("preview").getJSONObject("s").getString("u"));
            assertEquals("https://i.redd.it/good.jpg", metadata.getJSONObject("good").getJSONObject("s").getString("u"));
        }
    }

    @Test
    public void rewritesTheListingOnItsOriginalRedditHost() {
        for (String host : new String[] {"oauth.reddit.com", "api.reddit.com", "www.reddit.com"}) {
            assertEquals("https://" + host + "/by_id/t3_abc123.json?raw_json=1",
                    GalleryRequests.byIdUrl("https://" + host + "/api/info.json?raw_json=1&id=t3_abc123"));
        }
        assertEquals("https://www.reddit.com/by_id/t3_abc123.json?raw_json=1",
                GalleryRequests.byIdUrl("https://www.reddit.com/api/info.json?id=t3_abc123"));
        for (String original : new String[] {"https://oauth.reddit.com.example.org/api/info.json?id=t3_abc123",
                "https://oauth.reddit.com/api/info.json?id=t3_one,t3_two",
                "https://oauth.reddit.com/api/info.json?id=t1_abc123"}) {
            assertEquals(original, GalleryRequests.byIdUrl(original));
        }
    }
}
