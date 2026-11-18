// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Test;

public class GalleriesTest {
    private static final String URL = "https://oauth.reddit.com/api/info.json?id=t3_";

    /** A post page as Reddit sends it: the post's listing, then its comments. */
    private static JSONArray page(String kind, String id) throws JSONException {
        JSONObject media = new JSONObject().put("abc", new JSONObject().put("status", "valid")
                .put("s", new JSONObject().put("u", "https://preview.redd.it/abc.jpg?width=640&amp;s=x")));
        JSONObject post = new JSONObject().put("kind", kind).put("data", new JSONObject().put("id", id)
                .put("media_metadata", media)
                .put("gallery_data", new JSONObject().put("items",
                        new JSONArray().put(new JSONObject().put("media_id", "abc")))));
        JSONObject listing = new JSONObject().put("kind", "Listing")
                .put("data", new JSONObject().put("children", new JSONArray().put(post)));
        JSONObject comments = new JSONObject().put("kind", "Listing")
                .put("data", new JSONObject().put("children", new JSONArray()));
        return new JSONArray().put(listing).put(comments);
    }

    @Test
    public void ownsOnlyTheGalleryRequest() {
        assertTrue(Galleries.handles(URL + "1xqmxz2"));
        assertFalse(Galleries.handles("https://oauth.reddit.com/api/info/?id=t1_abc"));
        assertFalse(Galleries.handles("https://oauth.reddit.com/comments/1xqmxz2"));
        assertFalse(Galleries.handles(null));
    }

    @Test
    public void readsThePostIdFromTheAppsUrl() {
        assertEquals("1xqmxz2", Galleries.postId(URL + "1xqmxz2"));
        assertEquals("1xqmxz2", Galleries.postId(URL + "1XQMXZ2"));
        assertNull(Galleries.postId(URL));
        assertNull(Galleries.postId(URL + "1xqmxz2,t3_other"));
        assertNull(Galleries.postId(URL + "../me"));
    }

    @Test
    public void asksForThePostsPage() {
        assertEquals("https://oauth.reddit.com/comments/1xqmxz2.json?limit=1", Galleries.pageUrl("1xqmxz2"));
    }

    @Test
    public void answersWithThePagesListingAsTheInfoEndpointWould() throws JSONException {
        JSONArray page = page("t3", "1xqmxz2");
        JSONObject listing = Galleries.listing(page, "1xqmxz2");
        assertSame(page.getJSONObject(0), listing);
        // What the app's gallery parser reads.
        JSONObject post = listing.getJSONObject("data").getJSONArray("children").getJSONObject(0).getJSONObject("data");
        assertEquals("abc", post.getJSONObject("gallery_data").getJSONArray("items").getJSONObject(0).getString("media_id"));
        assertTrue(post.getJSONObject("media_metadata").getJSONObject("abc").has("s"));
    }

    @Test(expected = JSONException.class)
    public void rejectsAPageAboutAnotherPost() throws JSONException {
        Galleries.listing(page("t3", "other"), "1xqmxz2");
    }

    @Test(expected = JSONException.class)
    public void rejectsAPageThatDoesNotStartWithAPost() throws JSONException {
        Galleries.listing(page("t1", "1xqmxz2"), "1xqmxz2");
    }

    @Test(expected = JSONException.class)
    public void rejectsAnEmptyPage() throws JSONException {
        Galleries.listing(new JSONArray(), "1xqmxz2");
    }
}
