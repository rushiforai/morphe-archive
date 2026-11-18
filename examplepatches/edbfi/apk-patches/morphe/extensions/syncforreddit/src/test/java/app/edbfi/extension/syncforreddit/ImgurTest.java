// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

public class ImgurTest {
    private static final String ALBUM = "https://images.syncforreddit.com/a/0123456789abcdef0123456789abcdef/";
    private static final String IMAGE = "https://images.syncforreddit.com/image/0123456789abcdef0123456789abcdef/";
    private static final String UPLOAD = "https://imgur-apiv3.p.rapidapi.com/3/image";
    private static final String UPLOAD_SWITCH =
            "https://raw.githubusercontent.com/laurencedawson/reddit-sync-development/master/api/upload.json";
    private static final String PREVIEW = "https://ap.syncforreddit.com/image?url=imgur-album-";
    private static final String IMAGE_JSON =
            "{\"data\":{\"id\":\"AbC1234\",\"link\":\"https://i.imgur.com/AbC1234.png\",\"mp4\":\"\","
                    + "\"width\":640,\"height\":480,\"title\":null},\"success\":true,\"status\":200}";

    /** Imgur's API with fixed answers per path; records what was asked. */
    private static final class FakeApi implements Imgur.Api {
        final Map<String, Http.Reply> replies = new HashMap<>();
        final List<String> asked = new ArrayList<>();
        byte[] body;
        String contentType;

        FakeApi answer(String path, int status, String body) {
            replies.put(path, new Http.Reply(status, body.getBytes(StandardCharsets.UTF_8), new HashMap<>()));
            return this;
        }

        @Override
        public Http.Reply send(String method, String path, byte[] body, String contentType) {
            asked.add(method + " " + path);
            this.body = body;
            this.contentType = contentType;
            Http.Reply reply = replies.get(path);
            return reply != null ? reply : new Http.Reply(404, new byte[0], new HashMap<>());
        }
    }

    @Test
    public void ownsOnlyTheAppsImgurRequests() {
        assertTrue(Imgur.handles(ALBUM + "AbC1234"));
        assertTrue(Imgur.handles(IMAGE + "AbC1234"));
        assertTrue(Imgur.handles(UPLOAD));
        assertTrue(Imgur.handles(UPLOAD_SWITCH));
        assertFalse(Imgur.handles(UPLOAD_SWITCH + "?x"));
        assertFalse(Imgur.handles("https://i.imgur.com/AbC1234.png"));
        assertFalse(Imgur.handles("https://api.imgur.com/3/image"));
        assertFalse(Imgur.handles("https://ap.syncforreddit.com/image?url=imgur-album-x"));
        assertFalse(Imgur.handles(null));
    }

    @Test
    public void readsTheIdFromTheMirrorUrlKeepingItsCase() {
        assertEquals("AbC1234", Imgur.mirrorId(ALBUM + "AbC1234"));
        assertEquals("xIolo", Imgur.mirrorId(IMAGE + "xIolo"));
        assertNull(Imgur.mirrorId(ALBUM));
        assertNull(Imgur.mirrorId(ALBUM + "a b"));
        assertNull(Imgur.mirrorId(UPLOAD));
    }

    @Test
    public void loadsAnAlbumFromTheApi() throws Exception {
        FakeApi api = new FakeApi().answer("album/AbC1234", 200, "{\"data\":{\"images\":[]}}");
        Http.Reply reply = Imgur.reply(ALBUM + "AbC1234", null, null, api);
        assertEquals(200, reply.status);
        assertArrayEquals(api.replies.get("album/AbC1234").body, reply.body);
        assertEquals(Imgur.CACHE_CONTROL, reply.header("cache-control"));
        assertEquals(Arrays.asList("GET album/AbC1234"), api.asked);
    }

    @Test
    public void answersAnImageLinkedAsAnAlbumAsAnAlbumOfOne() throws Exception {
        FakeApi api = new FakeApi().answer("album/AbC1234", 404, "{\"data\":{\"error\":\"album not found\"}}")
                .answer("image/AbC1234", 200, IMAGE_JSON);
        Http.Reply reply = Imgur.reply(ALBUM + "AbC1234", null, null, api);
        assertEquals(200, reply.status);
        assertEquals(Arrays.asList("GET album/AbC1234", "GET image/AbC1234"), api.asked);
        // What the app's album parser reads.
        JSONArray images = new JSONObject(new String(reply.body, StandardCharsets.UTF_8)).getJSONObject("data")
                .getJSONArray("images");
        assertEquals(1, images.length());
        assertEquals("https://i.imgur.com/AbC1234.png", images.getJSONObject(0).getString("link"));
        assertEquals(640, images.getJSONObject(0).getInt("width"));
        assertEquals(480, images.getJSONObject(0).getInt("height"));
        assertEquals("application/json", reply.header("content-type"));
        assertEquals(Imgur.CACHE_CONTROL, reply.header("cache-control"));
    }

    @Test
    public void keepsTheAlbumsAnswerWhenNeitherExists() throws Exception {
        FakeApi api = new FakeApi().answer("album/AbC1234", 404, "{\"data\":{\"error\":\"album not found\"}}");
        Http.Reply reply = Imgur.reply(ALBUM + "AbC1234", null, null, api);
        assertSame(api.replies.get("album/AbC1234"), reply);
        assertNull(reply.header("cache-control"));
    }

    @Test
    public void doesNotTryAnImageWhenTheAlbumFailsOtherwise() throws Exception {
        FakeApi api = new FakeApi().answer("album/AbC1234", 429, "{}").answer("image/AbC1234", 200, IMAGE_JSON);
        Http.Reply reply = Imgur.reply(ALBUM + "AbC1234", null, null, api);
        assertEquals(429, reply.status);
        assertNull(reply.header("cache-control"));
        assertEquals(Arrays.asList("GET album/AbC1234"), api.asked);
    }

    @Test
    public void loadsASingleImageFromTheApi() throws Exception {
        FakeApi api = new FakeApi().answer("image/AbC1234", 200, IMAGE_JSON);
        Http.Reply reply = Imgur.reply(IMAGE + "AbC1234", null, null, api);
        assertArrayEquals(api.replies.get("image/AbC1234").body, reply.body);
        assertEquals(Imgur.CACHE_CONTROL, reply.header("cache-control"));
        assertEquals(Arrays.asList("GET image/AbC1234"), api.asked);
    }

    @Test
    public void uploadsTheAppsFormToTheApi() throws Exception {
        byte[] form = "image=aGVsbG8%3D".getBytes(StandardCharsets.UTF_8);
        FakeApi api = new FakeApi().answer("image", 200, IMAGE_JSON);
        Http.Reply reply = Imgur.reply(UPLOAD, form, "application/x-www-form-urlencoded; charset=UTF-8", api);
        assertEquals(200, reply.status);
        assertEquals(Arrays.asList("POST image"), api.asked);
        assertEquals("no-store", reply.header("cache-control"));
        assertArrayEquals(form, api.body);
        assertEquals("application/x-www-form-urlencoded; charset=UTF-8", api.contentType);
    }

    @Test(expected = IllegalArgumentException.class)
    public void rejectsAnUploadWithoutABody() throws Exception {
        Imgur.reply(UPLOAD, null, null, new FakeApi());
    }

    @Test(expected = IllegalArgumentException.class)
    public void rejectsAMirrorUrlWithoutAnId() throws Exception {
        Imgur.reply(ALBUM, null, null, new FakeApi());
    }

    @Test
    public void takesTheIdFromTheEndOfATitledLink() {
        assertEquals("ughL505", Imgur.withoutTitle("demand-experienced-linux-gurus-is-steep-march-2000-ughL505"));
        assertEquals("gjUctpc", Imgur.withoutTitle("theosophy-figures-gjUctpc"));
        assertEquals("gjUctpc?x=1#2", Imgur.withoutTitle("theosophy-figures-gjUctpc?x=1#2"));
        assertEquals("gjUctpc.jpg", Imgur.withoutTitle("theosophy-figures-gjUctpc.jpg"));
        // Old posts' IDs have 5 characters.
        assertEquals("nEGrc", Imgur.withoutTitle("some-title-nEGrc"));
    }

    @Test
    public void leavesOtherSegmentsAsTheyWere() {
        assertEquals("AbC1234", Imgur.withoutTitle("AbC1234"));
        assertEquals("AbC1234.jpg", Imgur.withoutTitle("AbC1234.jpg"));
        assertEquals("xIolo_d.jpg", Imgur.withoutTitle("xIolo_d.jpg"));
        // Not a 5- or 7-character ID after the dash.
        assertEquals("AbC1234-mobile", Imgur.withoutTitle("AbC1234-mobile"));
        assertEquals("a-AbC123", Imgur.withoutTitle("a-AbC123"));
        assertEquals("-AbC1234", Imgur.withoutTitle("-AbC1234"));
        assertEquals("a-b", Imgur.withoutTitle("a-b"));
        // A dash after the ID's end is not part of the name.
        assertEquals("AbC1234?q=a-bcdefgh", Imgur.withoutTitle("AbC1234?q=a-bcdefgh"));
        assertEquals("", Imgur.withoutTitle(""));
        assertNull(Imgur.withoutTitle(null));
    }

    @Test
    public void albumOfOneKeepsTheImage() throws Exception {
        JSONObject album = new JSONObject(new String(Imgur.albumOf(IMAGE_JSON.getBytes(StandardCharsets.UTF_8)),
                StandardCharsets.UTF_8));
        JSONObject image = album.getJSONObject("data").getJSONArray("images").getJSONObject(0);
        assertEquals("AbC1234", image.getString("id"));
        assertEquals("", image.getString("mp4"));
    }

    @Test
    public void turnsUploadsOnWithoutAsking() throws Exception {
        FakeApi api = new FakeApi();
        Http.Reply reply = Imgur.reply(UPLOAD_SWITCH, null, null, api);
        assertEquals(200, reply.status);
        assertTrue(new JSONObject(new String(reply.body, StandardCharsets.UTF_8)).getBoolean("enabled"));
        assertEquals("no-store", reply.header("Cache-Control"));
        assertTrue(api.asked.isEmpty());
    }

    @Test
    public void previewsAnAlbumWithItsCover() throws Exception {
        FakeApi api = new FakeApi().answer("album/AlbCov1", 200, "{\"data\":{\"cover\":\"CoVeR12\",\"images\":[{\"id\":\"First12\"}]}}");
        assertEquals("https://i.imgur.com/CoVeR12m.jpg", Imgur.albumPreview(PREVIEW + "AlbCov1", api));
        assertEquals(Arrays.asList("GET album/AlbCov1"), api.asked);
    }

    @Test
    public void previewsAnAlbumWithoutACoverWithItsFirstImage() throws Exception {
        FakeApi api = new FakeApi().answer("album/AlbNoCv", 200, "{\"data\":{\"cover\":null,\"images\":[{\"id\":\"First12\"}]}}");
        assertEquals("https://i.imgur.com/First12m.jpg", Imgur.albumPreview(PREVIEW + "AlbNoCv", api));
    }

    @Test
    public void previewsAnImageLinkedAsAnAlbum() throws Exception {
        FakeApi api = new FakeApi().answer("image/ImgLnk1", 200, IMAGE_JSON.replace("AbC1234", "ImgLnk1"));
        assertEquals("https://i.imgur.com/ImgLnk1m.jpg", Imgur.albumPreview(PREVIEW + "ImgLnk1", api));
        assertEquals(Arrays.asList("GET album/ImgLnk1", "GET image/ImgLnk1"), api.asked);
    }

    @Test(expected = IllegalStateException.class)
    public void failsAPreviewWhenNeitherExists() throws Exception {
        Imgur.albumPreview(PREVIEW + "Gone123", new FakeApi());
    }

    @Test(expected = IllegalStateException.class)
    public void failsAPreviewOfAnEmptyAlbum() throws Exception {
        Imgur.albumPreview(PREVIEW + "Empty12", new FakeApi().answer("album/Empty12", 200, "{\"data\":{\"images\":[]}}"));
    }

    @Test
    public void doesNotTryAnImageWhenTheAlbumPreviewFailsOtherwise() throws Exception {
        FakeApi api = new FakeApi().answer("album/Limit12", 429, "");
        try {
            Imgur.albumPreview(PREVIEW + "Limit12", api);
        } catch (IllegalStateException expected) {
            assertEquals(Arrays.asList("GET album/Limit12"), api.asked);
            return;
        }
        throw new AssertionError("Expected a failure");
    }

    @Test
    public void leavesOtherPreviewsAlone() throws Exception {
        FakeApi api = new FakeApi();
        assertNull(Imgur.albumPreview("https://ap.syncforreddit.com/image?url=https://tenor.com/view/x", api));
        assertNull(Imgur.albumPreview("https://ap.syncforreddit.com/image?url=gfycat-x", api));
        assertNull(Imgur.albumPreview(null, api));
        assertTrue(api.asked.isEmpty());
    }

    @Test(expected = IllegalArgumentException.class)
    public void rejectsAPreviewWithABadId() throws Exception {
        Imgur.albumPreview(PREVIEW + "../x", new FakeApi());
    }
}
