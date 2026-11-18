// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Test;

public class GalleriesTest {
    private static final String INFO = "https://oauth.reddit.com/api/info.json?raw_json=1&id=t3_";
    private static final String FAILED = "{\"status\":\"failed\"}";
    private static final String VALID = "{\"status\":\"valid\",\"e\":\"Image\",\"m\":\"image/jpg\","
            + "\"s\":{\"u\":\"https://preview.redd.it/ok.jpg\",\"x\":10,\"y\":10}}";

    /** Answers HEAD requests for the URLs it was given, and notes each one asked. */
    private static final class FakeProbe implements Galleries.Probe {
        final Set<String> existing;
        final List<String> asked = new ArrayList<>();
        boolean offline;

        FakeProbe(String... existing) {
            this.existing = new HashSet<>(Arrays.asList(existing));
        }

        @Override
        public boolean exists(String url) throws IOException {
            asked.add(url);
            if (offline) throw new IOException("offline");
            return existing.contains(url);
        }
    }

    private static JSONObject gallery(String media, String... ids) throws JSONException {
        JSONArray items = new JSONArray();
        for (String id : ids) items.put(new JSONObject().put("media_id", id));
        return new JSONObject().put("id", "1xnx8tw").put("thumbnail", "self")
                .put("media_metadata", new JSONObject("{" + media + "}"))
                .put("gallery_data", new JSONObject().put("items", items));
    }

    private static List<String> items(JSONObject post) throws JSONException {
        JSONArray items = post.getJSONObject("gallery_data").getJSONArray("items");
        List<String> ids = new ArrayList<>();
        for (int i = 0; i < items.length(); i++) ids.add(items.getJSONObject(i).getString("media_id"));
        return ids;
    }

    @Test
    public void takesOnlyRequestsForOnePost() {
        assertEquals("1xnx8tw", Galleries.postId(INFO + "1xnx8tw"));
        assertEquals("1xnx8tw", Galleries.postId("https://oauth.reddit.com/api/info.json?id=t3_1XNX8TW"));
        assertEquals("1xnx8tw", Galleries.postId("https://www.reddit.com/api/info.json?id=t3_1xnx8tw"));
        // Several posts, comments and lookups by URL keep going to Reddit as the app sent them.
        assertNull(Galleries.postId("https://oauth.reddit.com/api/info.json?id=t3_a%2Ct3_b"));
        assertNull(Galleries.postId("https://oauth.reddit.com/api/info.json?id=t3_a,t3_b"));
        assertNull(Galleries.postId("https://oauth.reddit.com/api/info.json?id=t3_a&id=t3_b"));
        assertNull(Galleries.postId("https://oauth.reddit.com/api/info.json?id=t1_abc"));
        assertNull(Galleries.postId("https://oauth.reddit.com/api/info.json?url=https://i.redd.it/x.jpg"));
        assertNull(Galleries.postId("https://oauth.reddit.com/api/info.json?id=t3_abc&url=x"));
        assertNull(Galleries.postId("https://oauth.reddit.com/api/info.json?id=t3_../me"));
        assertNull(Galleries.postId("https://oauth.reddit.com/api/info.json"));
        assertNull(Galleries.postId("https://oauth.reddit.com/r/pics/api/info.json?id=t3_abc"));
        assertNull(Galleries.postId("https://oauth.reddit.com/comments/abc.json"));
        assertNull(Galleries.postId("not a url"));
        assertNull(Galleries.postId(null));
    }

    @Test
    public void asksForThePostsPageOnTheAppsHost() throws Exception {
        assertEquals("https://oauth.reddit.com/comments/1xnx8tw.json?limit=1&raw_json=1",
                Galleries.pageUrl(INFO + "1xnx8tw", "1xnx8tw"));
        assertEquals("https://oauth.reddit.com/comments/1xnx8tw.json?limit=1",
                Galleries.pageUrl("https://oauth.reddit.com/api/info.json?id=t3_1xnx8tw", "1xnx8tw"));
    }

    @Test
    public void rewritesTheRequestToThePostsPage() throws Exception {
        RequestHook.Request request = new RequestHook.Request(INFO + "1xnx8tw", "token", null);
        assertTrue(Galleries.HANDLER.handles(request));
        Galleries.HANDLER.rewrite(request);
        assertEquals("https://oauth.reddit.com/comments/1xnx8tw.json?limit=1&raw_json=1", request.url);
        assertTrue(request.sendsForm());
        assertFalse(Galleries.HANDLER.handles(new RequestHook.Request("https://oauth.reddit.com/hot.json", "token", null)));
        // Off as built, so the hook leaves the request alone without the patch.
        assertFalse(Galleries.HANDLER.isOn());
    }

    @Test
    public void answersWithThePagesListing() throws JSONException {
        JSONArray page = new JSONArray("[{\"kind\":\"Listing\",\"data\":{\"children\":[{\"kind\":\"t3\",\"data\":{\"id\":\"abc\"}}]}},"
                + "{\"kind\":\"Listing\",\"data\":{\"children\":[{\"kind\":\"t1\",\"data\":{\"id\":\"c\"}}]}}]");
        assertSame(page.getJSONObject(0), Galleries.listing(page, "abc"));
    }

    @Test
    public void answersWithTheRepairedListingAlone() throws Exception {
        String post = "{\"kind\":\"t3\",\"data\":" + gallery("\"a\":" + VALID + ",\"b\":" + FAILED, "a", "b") + "}";
        String page = "[{\"kind\":\"Listing\",\"data\":{\"children\":[" + post + "]}},"
                + "{\"kind\":\"Listing\",\"data\":{\"children\":[{\"kind\":\"t1\",\"data\":{\"id\":\"c\"}}]}}]";
        FakeProbe probe = new FakeProbe("https://i.redd.it/b.png");
        byte[] answer = Galleries.answer(page.getBytes(StandardCharsets.UTF_8), "1xnx8tw", probe);
        // The listing the app's parsers read, as /api/info sends it: data.children[0].data, without the comments.
        JSONObject listing = new JSONObject(new String(answer, StandardCharsets.UTF_8));
        JSONArray children = listing.getJSONObject("data").getJSONArray("children");
        assertEquals(1, children.length());
        JSONObject data = children.getJSONObject(0).getJSONObject("data");
        assertEquals("1xnx8tw", data.getString("id"));
        assertEquals("https://i.redd.it/b.png",
                data.getJSONObject("media_metadata").getJSONObject("b").getJSONObject("s").getString("u"));
    }

    @Test
    public void refusesAnAnswerAboutAnotherPost() {
        String page = "[{\"kind\":\"Listing\",\"data\":{\"children\":[{\"kind\":\"t3\",\"data\":{\"id\":\"other\"}}]}}]";
        try {
            Galleries.answer(page.getBytes(StandardCharsets.UTF_8), "abc", new FakeProbe());
            fail("Answered for another post");
        } catch (JSONException expected) {
            // The app treats the request as failed.
        }
    }

    @Test
    public void refusesAPageAboutAnotherPost() throws JSONException {
        for (String children : new String[] {
            "[{\"kind\":\"t3\",\"data\":{\"id\":\"other\"}}]",
            "[{\"kind\":\"t1\",\"data\":{\"id\":\"abc\"}}]",
            "[{\"kind\":\"t3\",\"data\":{\"id\":\"abc\"}},{\"kind\":\"t3\",\"data\":{\"id\":\"x\"}}]",
        }) {
            JSONArray page = new JSONArray("[{\"kind\":\"Listing\",\"data\":{\"children\":" + children + "}}]");
            try {
                Galleries.listing(page, "abc");
                fail("Accepted " + children);
            } catch (JSONException expected) {
                // The app reports the gallery as failed instead of showing another post.
            }
        }
    }

    @Test
    public void leavesAGalleryWithAllImagesAlone() throws JSONException {
        JSONObject post = gallery("\"a\":" + VALID + ",\"b\":" + VALID, "a", "b");
        String before = post.toString();
        FakeProbe probe = new FakeProbe();
        Galleries.repair(post, probe);
        assertEquals(before, post.toString());
        assertTrue(probe.asked.isEmpty());
    }

    @Test
    public void leavesAPostThatIsntAGalleryAlone() throws JSONException {
        JSONObject post = new JSONObject().put("media_metadata", new JSONObject("{\"v\":" + FAILED + "}"));
        String before = post.toString();
        Galleries.repair(post, new FakeProbe());
        assertEquals(before, post.toString());
    }

    @Test
    public void findsFailedImagesTheLastExtensionThatWorkedFirst() throws JSONException {
        JSONObject post = gallery("\"a\":" + VALID + ",\"b\":" + FAILED + ",\"c\":" + FAILED, "a", "b", "c");
        FakeProbe probe = new FakeProbe("https://i.redd.it/b.png", "https://i.redd.it/c.png");
        Galleries.repair(post, probe);
        assertEquals(Arrays.asList("a", "b", "c"), items(post));
        JSONObject b = post.getJSONObject("media_metadata").getJSONObject("b");
        assertEquals("https://i.redd.it/b.png", b.getJSONObject("s").getString("u"));
        assertEquals("Image", b.getString("e"));
        assertEquals("image/png", b.getString("m"));
        assertTrue(Galleries.hasImage(b));
        assertEquals(Arrays.asList("https://i.redd.it/b.jpg", "https://i.redd.it/b.jpeg", "https://i.redd.it/b.png",
                "https://i.redd.it/c.png"), probe.asked);
    }

    @Test
    public void takesTheExtensionFromWhatRedditSentWithoutLookups() throws JSONException {
        JSONObject post = gallery("\"d9rxacv8cnzh1\":" + FAILED + ",\"b\":{\"status\":\"failed\",\"m\":\"image/gif\"}",
                "d9rxacv8cnzh1", "b");
        post.put("thumbnail", "https://preview.redd.it/d9rxacv8cnzh1.jpeg?width=140&height=140&crop=1:1,smart&s=x");
        FakeProbe probe = new FakeProbe();
        Galleries.repair(post, probe);
        assertTrue(probe.asked.isEmpty());
        JSONObject media = post.getJSONObject("media_metadata");
        assertEquals("https://i.redd.it/d9rxacv8cnzh1.jpeg", media.getJSONObject("d9rxacv8cnzh1").getJSONObject("s").getString("u"));
        JSONObject gif = media.getJSONObject("b");
        assertEquals("AnimatedImage", gif.getString("e"));
        assertEquals("https://i.redd.it/b.gif", gif.getJSONObject("s").getString("gif"));
    }

    @Test
    public void ignoresAThumbnailOfAnotherImageOrHost() {
        assertNull(Galleries.extension(null, "a", "https://preview.redd.it/b.jpeg?s=x"));
        assertNull(Galleries.extension(null, "a", "https://example.com/a.jpeg"));
        assertNull(Galleries.extension(null, "a", "https://preview.redd.it/a.exe"));
        assertNull(Galleries.extension(null, "a", "nsfw"));
        assertNull(Galleries.extension(null, "a", null));
        assertNull(Galleries.extension(new JSONObject(), "a", "self"));
        assertEquals("png", Galleries.extension(null, "a", "https://i.redd.it/a.png"));
    }

    @Test
    public void leavesOutImagesNotFoundAndBrokenEntriesNoItemShows() throws JSONException {
        JSONObject post = gallery("\"a\":" + VALID + ",\"b\":" + FAILED + ",\"x\":" + FAILED, "a", "b", "a");
        Galleries.repair(post, new FakeProbe());
        assertEquals(Arrays.asList("a", "a"), items(post));
        JSONObject media = post.getJSONObject("media_metadata");
        assertFalse(media.has("b"));
        assertFalse(media.has("x"));
        assertTrue(media.has("a"));
    }

    @Test
    public void leavesAGalleryWithNoImageFoundForTheAppToReport() throws JSONException {
        JSONObject post = gallery("\"b\":" + FAILED + ",\"c\":{\"status\":\"unprocessed\"}", "b", "c");
        String before = post.toString();
        Galleries.repair(post, new FakeProbe());
        assertEquals(before, post.toString());
    }

    @Test
    public void neverProbesAMediaIdThatIsntAPlainName() throws JSONException {
        JSONObject post = gallery("\"a\":" + VALID + ",\"../x\":" + FAILED, "a", "../x");
        FakeProbe probe = new FakeProbe();
        Galleries.repair(post, probe);
        assertTrue(probe.asked.isEmpty());
        assertEquals(Arrays.asList("a"), items(post));
    }

    @Test
    public void stopsLookingWithoutANetwork() throws JSONException {
        JSONObject post = gallery("\"a\":" + VALID + ",\"b\":" + FAILED + ",\"c\":" + FAILED, "a", "b", "c");
        FakeProbe probe = new FakeProbe();
        probe.offline = true;
        Galleries.repair(post, probe);
        assertEquals(1, probe.asked.size());
        assertEquals(Arrays.asList("a"), items(post));
    }

    @Test
    public void capsTheLookupsPerGallery() throws JSONException {
        StringBuilder media = new StringBuilder("\"a\":" + VALID);
        List<String> ids = new ArrayList<>(Arrays.asList("a"));
        for (int i = 0; i < 20; i++) {
            media.append(",\"f").append(i).append("\":").append(FAILED);
            ids.add("f" + i);
        }
        FakeProbe probe = new FakeProbe();
        Galleries.repair(gallery(media.toString(), ids.toArray(new String[0])), probe);
        assertEquals(Galleries.MAX_PROBES, probe.asked.size());
    }

    @Test
    public void seesAnImageInASourceOrASizedPreview() throws JSONException {
        assertTrue(Galleries.hasImage(new JSONObject(VALID)));
        assertTrue(Galleries.hasImage(new JSONObject("{\"p\":[{\"x\":0,\"y\":0},{\"x\":108,\"y\":50}]}")));
        assertFalse(Galleries.hasImage(new JSONObject("{\"p\":[{\"x\":0,\"y\":0}]}")));
        assertFalse(Galleries.hasImage(new JSONObject(FAILED)));
    }
}
