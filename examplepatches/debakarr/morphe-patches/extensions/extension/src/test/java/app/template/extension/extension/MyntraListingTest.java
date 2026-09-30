package app.template.extension.extension;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Before;
import org.junit.Test;

import java.nio.charset.StandardCharsets;

public class MyntraListingTest {

    @Before
    public void bothTogglesOn() {
        SortState.forTest(true, true);
    }

    private static JSONObject tile(int id, String count, boolean ad) throws Exception {
        JSONObject data = new JSONObject().put("productId", id)
            .put("ratingInfo", new JSONObject().put("rating", 4.5).put("count", count));
        if (ad) data.put("adLabel", "AD");
        return new JSONObject().put("id", String.valueOf(id)).put("itemType", "WIDGET")
            .put("itemData", new JSONObject().put("widgetType", "PRODUCT_TILE").put("data", data));
    }

    private static JSONObject banner(String id) throws Exception {
        return new JSONObject().put("id", id).put("itemType", "WIDGET")
            .put("itemData", new JSONObject().put("widgetType", "BANNER"));
    }

    private static String ids(JSONArray components) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < components.length(); i++) {
            if (i > 0) sb.append(',');
            sb.append(components.optJSONObject(i).optString("id"));
        }
        return sb.toString();
    }

    private static String page() throws Exception {
        return new JSONObject().put("paginationContext", new JSONObject().put("pageNum", 3))
            .put("components", new JSONArray()
                .put(tile(1, "12.3k", true))
                .put(tile(2, "27.4k", false))
                .put(banner("b1"))
                .put(tile(3, "172.8k", false))
                .put(tile(4, "5.2k", false))
                .put(tile(5, "106.7k", true))).toString();
    }

    @Test
    public void sortsTilesDropsAdsAndKeepsBannerSlot() throws Exception {
        JSONObject out = new JSONObject(MyntraListing.process(page()));
        // organic by count: 3 (172.8k), 2 (27.4k), 4 (5.2k); banner keeps index 2
        assertEquals("3,2,b1,4", ids(out.getJSONArray("components")));
        assertEquals(3, out.getJSONObject("paginationContext").getInt("pageNum"));
    }

    private static JSONObject tileV2(int id, String count, boolean ad) throws Exception {
        JSONObject image = new JSONObject().put("ratingInfo", new JSONObject().put("rating", 4.1).put("count", count));
        if (ad) image.put("adLabel", "AD");
        JSONObject data = new JSONObject().put("styleId", id).put("productImage", image);
        return new JSONObject().put("id", "T" + id).put("itemType", "WIDGET")
            .put("itemData", new JSONObject().put("widgetType", "PRODUCT_TILE_V2").put("data", data));
    }

    @Test
    public void sortsSearchPageV2Layout() throws Exception {
        String json = new JSONObject().put("uri", "/v3/layout/search/tshirt").put("layout",
            new JSONObject().put("components", new JSONArray()
                .put(banner("b0"))
                .put(tileV2(1, "36.9k", true))
                .put(tileV2(2, "303", false))
                .put(tileV2(3, "1.6k", false))
                .put(tileV2(4, "55", false)))).toString();

        JSONObject out = new JSONObject(MyntraListing.process(json));
        assertEquals("b0,T3,T2,T4", ids(out.getJSONObject("layout").getJSONArray("components")));
    }

    @Test
    public void blobBytesArePathToo() throws Exception {
        String json = page();
        String padded = json.substring(0, json.length() - 1) + ",\"pad\":\"" + "x".repeat(2500) + "\"}";
        byte[] out = MyntraListing.processBytes(padded.getBytes(StandardCharsets.UTF_8));
        JSONObject parsed = new JSONObject(new String(out, StandardCharsets.UTF_8));
        assertEquals("3,2,b1,4", ids(parsed.getJSONArray("components")));
    }

    @Test
    public void nonJsonAndSmallBodiesPassThrough() {
        byte[] small = "{\"a\":1}".getBytes(StandardCharsets.UTF_8);
        assertSame(small, MyntraListing.processBytes(small));
        byte[] png = new byte[5000];
        png[0] = (byte) 0x89;
        assertSame(png, MyntraListing.processBytes(png));
        assertArrayEquals(null, MyntraListing.processBytes(null));
    }
}
