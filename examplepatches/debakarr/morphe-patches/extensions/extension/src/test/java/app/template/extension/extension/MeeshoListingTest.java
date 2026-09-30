package app.template.extension.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Before;
import org.junit.Test;

public class MeeshoListingTest {

    @Before
    public void bothTogglesOn() {
        SortState.forTest(true, true);
    }

    private static JSONObject catalog(int id, int ratings, boolean ad) throws Exception {
        JSONObject c = new JSONObject()
            .put("id", id)
            .put("name", "item " + id)
            .put("catalog_reviews_summary", new JSONObject().put("rating_count", ratings));
        if (ad) c.put("ad", new JSONObject().put("active", true).put("tag", "Ad"));
        return c;
    }

    private static int[] ids(JSONArray arr) {
        int[] out = new int[arr.length()];
        for (int i = 0; i < arr.length(); i++) out[i] = arr.optJSONObject(i).optInt("id", -1);
        return out;
    }

    @Test
    public void sortsByRatingCountAndDropsAds() throws Exception {
        JSONObject root = new JSONObject().put("cursor", "abc").put("catalogs", new JSONArray()
            .put(catalog(1, 93, false))
            .put(catalog(2, 5000, true))
            .put(catalog(3, 36568, false))
            .put(catalog(4, 2114, false)));

        JSONObject out = new JSONObject(MeeshoListing.process(root.toString()));

        org.junit.Assert.assertArrayEquals(new int[]{3, 4, 1}, ids(out.getJSONArray("catalogs")));
        assertEquals("abc", out.getString("cursor"));
    }

    @Test
    public void everythingIsUntouchedWhenBothTogglesAreOff() throws Exception {
        SortState.forTest(false, false);
        String json = new JSONObject().put("catalogs", new JSONArray()
            .put(catalog(1, 10, false)).put(catalog(2, 500, true)).put(catalog(3, 900, false))).toString();
        assertSame(json, MeeshoListing.process(json));
    }

    @Test
    public void sortOnlyKeepsAdsInTheirSlot() throws Exception {
        SortState.forTest(true, false);
        JSONObject root = new JSONObject().put("catalogs", new JSONArray()
            .put(catalog(1, 10, false)).put(catalog(2, 500, true))
            .put(catalog(3, 900, false)).put(catalog(4, 50, false)));

        JSONArray out = new JSONObject(MeeshoListing.process(root.toString())).getJSONArray("catalogs");

        // organic sorted (3, 4, 1) into slots 0,2,3; the ad (2) stays at index 1
        org.junit.Assert.assertArrayEquals(new int[]{3, 2, 4, 1}, ids(out));
    }

    @Test
    public void hideAdsOnlyKeepsServerOrder() throws Exception {
        SortState.forTest(false, true);
        JSONObject root = new JSONObject().put("catalogs", new JSONArray()
            .put(catalog(1, 10, false)).put(catalog(2, 500, true)).put(catalog(3, 900, false)));

        JSONArray out = new JSONObject(MeeshoListing.process(root.toString())).getJSONArray("catalogs");

        org.junit.Assert.assertArrayEquals(new int[]{1, 3}, ids(out));
    }

    @Test
    public void nonProductItemsKeepTheirSlot() throws Exception {
        JSONObject banner = new JSONObject().put("id", 99).put("type", "banner");
        JSONObject root = new JSONObject().put("catalogs", new JSONArray()
            .put(catalog(1, 10, false))
            .put(banner)
            .put(catalog(2, 20, false))
            .put(catalog(3, 30, false)));

        JSONArray out = new JSONObject(MeeshoListing.process(root.toString())).getJSONArray("catalogs");

        org.junit.Assert.assertArrayEquals(new int[]{3, 99, 2, 1}, ids(out));
    }

    @Test
    public void webFeedAdFlagIsHonoured() throws Exception {
        JSONObject ad = catalog(2, 900, false).put("isAdProduct", true);
        JSONObject root = new JSONObject().put("catalogs", new JSONArray()
            .put(catalog(1, 10, false)).put(ad).put(catalog(3, 30, false)));

        JSONArray out = new JSONObject(MeeshoListing.process(root.toString())).getJSONArray("catalogs");

        org.junit.Assert.assertArrayEquals(new int[]{3, 1}, ids(out));
    }

    @Test
    public void unrelatedResponsesAreReturnedUntouched() {
        String json = "{\"user\":{\"name\":\"x\"},\"padding\":\"" + "y".repeat(100) + "\"}";
        assertSame(json, MeeshoListing.process(json));
        String broken = "not json at all, but mentions \"catalogs\" " + "z".repeat(64);
        assertSame(broken, MeeshoListing.process(broken));
    }

    @Test
    public void parsesCompactCounts() {
        assertEquals(4700, ListingSorter.parseCountText("| 4.7K+"));
        assertEquals(110000, ListingSorter.parseCountText("1.1L"));
        assertEquals(12345, ListingSorter.parseCountText("12,345 ratings"));
        assertEquals(-1, ListingSorter.parseCountText("no ratings"));
    }
}
