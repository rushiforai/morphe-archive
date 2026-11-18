// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThrows;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONObject;
import org.junit.Test;

public class ImgurTest {
    private static final String PROXY = "https://api.redditisfun.com/api/imgur/3/";
    private static final String IMAGE_JSON =
            "{\"data\":{\"id\":\"AbC1234\",\"link\":\"https://i.imgur.com/AbC1234.png\",\"animated\":false,"
                    + "\"title\":null},\"success\":true,\"status\":200}";

    /** Imgur's API with fixed answers per path; records what was asked. */
    private static final class FakeApi implements Imgur.Api {
        final Map<String, Http.Reply> replies = new HashMap<>();
        final List<String> asked = new ArrayList<>();

        FakeApi answer(String path, int status, String body) {
            replies.put(path, new Http.Reply(status, body.getBytes(StandardCharsets.UTF_8), new HashMap<>()));
            return this;
        }

        @Override
        public Http.Reply get(String path) {
            asked.add(path);
            Http.Reply reply = replies.get(path);
            return reply != null ? reply : new Http.Reply(404, new byte[0], new HashMap<>());
        }
    }

    private static String album(String id, FakeApi api) throws Exception {
        return new String(Imgur.album(id, api), StandardCharsets.UTF_8);
    }

    @Test
    public void readsTheAlbumIdOfTheViewersProxyUrl() {
        assertEquals("AbC1234", Imgur.proxyAlbumId(PROXY + "album/AbC1234"));
        assertEquals("AbC1234", Imgur.proxyAlbumId(PROXY + "gallery/album/AbC1234"));
        assertEquals("aBc12", Imgur.proxyAlbumId(PROXY + "album/aBc12"));
        // The viewer takes a titled link's whole segment for the ID.
        assertEquals("rIDUyCA", Imgur.proxyAlbumId(PROXY + "gallery/album/purrfect-gallery-rIDUyCA"));
    }

    @Test
    public void rejectsOtherProxyUrls() {
        assertThrows(IllegalArgumentException.class, () -> Imgur.proxyAlbumId(PROXY + "album/AbC1234/cover"));
        assertThrows(IllegalArgumentException.class, () -> Imgur.proxyAlbumId(PROXY + "image/AbC1234"));
        assertThrows(IllegalArgumentException.class, () -> Imgur.proxyAlbumId("https://api.redditisfun.com/album/AbC1234"));
        assertThrows(IllegalArgumentException.class, () -> Imgur.proxyAlbumId(PROXY + "album/"));
        assertThrows(IllegalArgumentException.class, () -> Imgur.proxyAlbumId(PROXY + "album/..%2Fx"));
        assertThrows(IllegalArgumentException.class, () -> Imgur.proxyAlbumId("null"));
    }

    @Test
    public void readsTheAlbumIdOfAlbumLinks() {
        assertEquals("AbC1234", Imgur.linkAlbumId("https://imgur.com/a/AbC1234"));
        assertEquals("AbC1234", Imgur.linkAlbumId("https://m.imgur.com/a/AbC1234/"));
        assertEquals("AbC1234", Imgur.linkAlbumId("http://imgur.com/gallery/AbC1234?lr=0"));
        assertEquals("aBc12", Imgur.linkAlbumId("https://imgur.com/gallery/aBc12.json"));
        assertEquals("AbC1234", Imgur.linkAlbumId("https://imgur.com/t/funny/AbC1234"));
        assertEquals("rIDUyCA", Imgur.linkAlbumId("https://imgur.com/a/purrfect-gallery-rIDUyCA"));
        assertEquals("kU6UtqW", Imgur.linkAlbumId("https://imgur.com/gallery/06-lander-kU6UtqW"));
    }

    @Test
    public void rejectsOtherLinks() {
        assertThrows(IllegalArgumentException.class, () -> Imgur.linkAlbumId("https://imgur.com/AbC1234"));
        assertThrows(IllegalArgumentException.class, () -> Imgur.linkAlbumId("https://imgur.com/a/"));
        assertThrows(IllegalArgumentException.class, () -> Imgur.linkAlbumId("https://imgur.com/t/funny"));
        assertThrows(IllegalArgumentException.class, () -> Imgur.linkAlbumId("https://imgur.com/a/my-cats"));
    }

    @Test
    public void cutsTheTitleOffIds() {
        assertEquals("AbC1234", Imgur.withoutTitle("funny-cat-AbC1234"));
        assertEquals("aBc12", Imgur.withoutTitle("old-post-aBc12"));
        assertEquals("AbC1234.jpg", Imgur.withoutTitle("funny-cat-AbC1234.jpg"));
        assertEquals("AbC1234", Imgur.withoutTitle("AbC1234"));
        // Not an ID after the last dash: left as it was.
        assertEquals("100yq-224", Imgur.withoutTitle("100yq-224"));
        assertEquals("my-cats", Imgur.withoutTitle("my-cats"));
        assertEquals("-AbC1234", Imgur.withoutTitle("-AbC1234"));
    }

    @Test
    public void loadsTheAlbum() throws Exception {
        String body = "{\"data\":{\"id\":\"AbC1234\",\"images\":[]}}";
        FakeApi api = new FakeApi().answer("album/AbC1234", 200, body);
        assertEquals(body, album("AbC1234", api));
        assertEquals(Arrays.asList("album/AbC1234"), api.asked);
    }

    @Test
    public void loadsAGalleryImageAsAnAlbumOfOne() throws Exception {
        FakeApi api = new FakeApi().answer("image/AbC1234", 200, IMAGE_JSON);
        JSONObject data = new JSONObject(album("AbC1234", api)).getJSONObject("data");
        assertEquals("AbC1234", data.getJSONArray("images").getJSONObject(0).getString("id"));
        assertEquals(1, data.getJSONArray("images").length());
        // The viewer keys the album by its ID: without one it crashes.
        assertEquals("AbC1234", data.getString("id"));
        assertEquals("AbC1234", data.getString("cover"));
        assertEquals(Arrays.asList("album/AbC1234", "image/AbC1234"), api.asked);
    }

    @Test
    public void failsForAGalleryImageWithoutAnId() {
        FakeApi api = new FakeApi().answer("image/AbC1234", 200, "{\"data\":{\"id\":null}}");
        assertThrows(org.json.JSONException.class, () -> album("AbC1234", api));
        api.answer("image/AbC1234", 200, "{\"data\":{\"id\":\"../x\"}}");
        assertThrows(org.json.JSONException.class, () -> album("AbC1234", api));
    }

    @Test
    public void failsForAMissingAlbum() {
        assertThrows(IllegalStateException.class, () -> album("AbC1234", new FakeApi()));
    }

    @Test
    public void failsWithoutTryingTheImageWhenImgurRefuses() {
        FakeApi api = new FakeApi().answer("album/AbC1234", 429, "{}").answer("image/AbC1234", 200, IMAGE_JSON);
        assertThrows(IllegalStateException.class, () -> album("AbC1234", api));
        assertEquals(Arrays.asList("album/AbC1234"), api.asked);
    }

    @Test
    public void coverIsTheAlbumsCover() throws Exception {
        FakeApi api = new FakeApi()
                .answer("album/AbC1234", 200, "{\"data\":{\"cover\":\"CoVeR12\",\"images\":[{\"id\":\"FiRsT12\"}]}}");
        assertEquals("CoVeR12", Imgur.cover("AbC1234", api));
    }

    @Test
    public void coverIsTheFirstImageWithoutOne() throws Exception {
        FakeApi api = new FakeApi()
                .answer("album/AbC1234", 200, "{\"data\":{\"cover\":null,\"images\":[{\"id\":\"FiRsT12\"}]}}");
        assertEquals("FiRsT12", Imgur.cover("AbC1234", api));
        api.answer("album/AbC1234", 200, "{\"data\":{\"cover\":\"\",\"images\":[{\"id\":\"FiRsT12\"}]}}");
        assertEquals("FiRsT12", Imgur.cover("AbC1234", api));
    }

    @Test
    public void coverOfAGalleryImageIsTheImage() throws Exception {
        FakeApi api = new FakeApi().answer("image/AbC1234", 200, IMAGE_JSON);
        assertEquals("AbC1234", Imgur.cover("AbC1234", api));
    }

    @Test
    public void noCoverForAnEmptyOrMissingAlbum() {
        FakeApi empty = new FakeApi().answer("album/AbC1234", 200, "{\"data\":{\"cover\":null,\"images\":[]}}");
        assertThrows(IllegalStateException.class, () -> Imgur.cover("AbC1234", empty));
        assertThrows(IllegalStateException.class, () -> Imgur.cover("AbC1234", new FakeApi()));
        FakeApi refused = new FakeApi().answer("album/AbC1234", 403, "{}");
        assertThrows(IllegalStateException.class, () -> Imgur.cover("AbC1234", refused));
    }

    @Test
    public void neverPutsAnUnsafeIdInTheThumbnailUrl() {
        FakeApi api = new FakeApi()
                .answer("album/AbC1234", 200, "{\"data\":{\"cover\":\"../x\",\"images\":[{\"id\":\"a/b\"}]}}");
        assertThrows(IllegalStateException.class, () -> Imgur.cover("AbC1234", api));
    }
}
