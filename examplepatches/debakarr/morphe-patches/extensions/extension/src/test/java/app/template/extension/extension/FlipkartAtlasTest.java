package app.template.extension.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Before;
import org.junit.Test;

/** Flipkart 9.15 ATLAS search feed: gridData_0 rows, nested ratings, Sponsored labels. */
public class FlipkartAtlasTest {

    @Before
    public void bothTogglesOn() {
        SortState.forTest(true, true);
    }

    private static final String GRID_VIEW = "ATLAS_PRODUCT_SUMMARY_GRID_ELECTRONICS";

    private static JSONObject card(String id, String reviewText, boolean sponsored) throws Exception {
        JSONObject text = new JSONObject()
            .put("ratingData_0", new JSONObject().put("value",
                new JSONObject().put("rating", 4.1).put("reviewText", reviewText)))
            .put("label_0", new JSONObject().put("value", new JSONObject().put("text", "Brand " + id)));
        if (sponsored) {
            text.put("label_2", new JSONObject().put("value", new JSONObject().put("text", "Sponsored")));
        }
        return new JSONObject().put("value", new JSONObject()
            // template placeholder that must not shadow the real rating
            .put("fk_electronics_grid_image_0", new JSONObject().put("value",
                new JSONObject().put("ratingData_0", new JSONObject())))
            .put("trackerData_0", new JSONObject().put("tracking", new JSONObject()
                .put("viewType", GRID_VIEW).put("productId", id)))
            .put("fk_electronics_grid_text_1", new JSONObject().put("value", text)));
    }

    private static JSONObject gridSlot(JSONObject... cards) throws Exception {
        JSONArray arr = new JSONArray();
        for (JSONObject c : cards) arr.put(c);
        return new JSONObject().put("widget", new JSONObject().put("data", new JSONObject()
            .put("dlsData", new JSONObject().put("gridData_0", new JSONObject().put("value", arr)))));
    }

    private static String productId(JSONObject card) {
        return card.optJSONObject("value").optJSONObject("trackerData_0")
            .optJSONObject("tracking").optString("productId");
    }

    private static String feed(JSONObject... slots) throws Exception {
        JSONArray arr = new JSONArray();
        for (JSONObject s : slots) arr.put(s);
        return new JSONObject().put("RESPONSE", new JSONObject().put("slots", arr)).toString();
    }

    @Test
    public void sortsAcrossRowsRemovesSponsoredAndKeepsRowSize() throws Exception {
        String in = feed(
            gridSlot(card("a", "| 44.9K+", false), card("b", "| 71.9K+", true)),
            gridSlot(card("c", "| 2.2L+", false), card("d", "| 3.9K+", false)),
            gridSlot(card("e", "| 1.2L+", true), card("f", "| 21.3K+", false)));

        JSONArray slots = new JSONObject(SortByRatingsHelper.processFlipkartResponseJson(in))
            .getJSONObject("RESPONSE").getJSONArray("slots");

        // organic, by count: c(220000) a(44900) f(21300) d(3900) -> two rows of two
        assertEquals(2, slots.length());
        JSONArray row1 = slots.optJSONObject(0).optJSONObject("widget").optJSONObject("data")
            .optJSONObject("dlsData").optJSONObject("gridData_0").optJSONArray("value");
        JSONArray row2 = slots.optJSONObject(1).optJSONObject("widget").optJSONObject("data")
            .optJSONObject("dlsData").optJSONObject("gridData_0").optJSONArray("value");
        assertEquals("c", productId(row1.optJSONObject(0)));
        assertEquals("a", productId(row1.optJSONObject(1)));
        assertEquals("f", productId(row2.optJSONObject(0)));
        assertEquals("d", productId(row2.optJSONObject(1)));
    }

    @Test
    public void sortOnlyKeepsSponsoredCardsInPlace() throws Exception {
        SortState.forTest(true, false);
        String in = feed(
            gridSlot(card("a", "| 10", false), card("s", "| 999", true)),
            gridSlot(card("b", "| 500", false), card("c", "| 90", false)));

        JSONArray slots = new JSONObject(SortByRatingsHelper.processFlipkartResponseJson(in))
            .getJSONObject("RESPONSE").getJSONArray("slots");

        JSONArray row1 = slots.optJSONObject(0).optJSONObject("widget").optJSONObject("data")
            .optJSONObject("dlsData").optJSONObject("gridData_0").optJSONArray("value");
        JSONArray row2 = slots.optJSONObject(1).optJSONObject("widget").optJSONObject("data")
            .optJSONObject("dlsData").optJSONObject("gridData_0").optJSONArray("value");
        // organic sorted: b(500) c(90) a(10); sponsored s stays in slot 1
        assertEquals("b", productId(row1.optJSONObject(0)));
        assertEquals("s", productId(row1.optJSONObject(1)));
        assertEquals("c", productId(row2.optJSONObject(0)));
        assertEquals("a", productId(row2.optJSONObject(1)));
    }

    private static JSONObject widgetWithAdLabel(String labelKey, String listKey) throws Exception {
        JSONObject dls = new JSONObject()
            .put(labelKey, new JSONObject().put("value", new JSONObject().put("text", "AD")));
        if (listKey != null) dls.put(listKey, new JSONObject().put("value", new JSONArray()));
        return new JSONObject().put("widget", new JSONObject().put("data",
            new JSONObject().put("dlsData", dls)));
    }

    @Test
    public void removesAnyNonGridWidgetLabelledAd() throws Exception {
        String in = feed(
            widgetWithAdLabel("label_1", null),
            widgetWithAdLabel("label_2", "horizontalListData_0"),
            gridSlot(card("a", "| 10", true), card("b", "| 20", false)));

        JSONArray slots = new JSONObject(SortByRatingsHelper.processFlipkartResponseJson(in))
            .getJSONObject("RESPONSE").getJSONArray("slots");

        // both AD widgets are gone; the grid row survives with its organic card
        assertEquals(1, slots.length());
        JSONArray row = slots.optJSONObject(0).optJSONObject("widget").optJSONObject("data")
            .optJSONObject("dlsData").optJSONObject("gridData_0").optJSONArray("value");
        assertEquals(1, row.length());
        assertEquals("b", productId(row.optJSONObject(0)));
    }

    @Test
    public void untouchedWhenBothTogglesAreOff() throws Exception {
        SortState.forTest(false, false);
        String in = feed(gridSlot(card("a", "| 10", false), card("b", "| 500", true)));
        assertSame(in, SortByRatingsHelper.processFlipkartResponseJson(in));
    }

    @Test
    public void removesPlaCarouselWidget() throws Exception {
        JSONObject pla = new JSONObject().put("widget", new JSONObject().put("data", new JSONObject()
            .put("dlsData", new JSONObject()
                .put("horizontalListData_0", new JSONObject().put("value", new JSONArray()))
                .put("serach_pla_ads_navigation_button_0", new JSONObject()))));
        String in = feed(pla, gridSlot(card("a", "| 10", false), card("b", "| 20", false)));

        JSONArray slots = new JSONObject(SortByRatingsHelper.processFlipkartResponseJson(in))
            .getJSONObject("RESPONSE").getJSONArray("slots");

        assertEquals(1, slots.length());
        assertTrue(slots.optJSONObject(0).toString().contains("gridData_0"));
    }

    @Test
    public void untouchedWhenNothingToDo() {
        String json = "{\"RESPONSE\":{\"pageMeta\":{\"x\":1}},\"pad\":\"" + "p".repeat(40) + "\"}";
        assertSame(json, SortByRatingsHelper.processFlipkartResponseJson(json));
    }
}
