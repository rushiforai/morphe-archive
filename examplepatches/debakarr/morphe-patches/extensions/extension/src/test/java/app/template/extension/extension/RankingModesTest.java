package app.template.extension.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** Sort modes (most rated / top rated), the 4★+ filter and the cross-page ranked store. */
public class RankingModesTest {

    private static final SortState.Mode OFF = SortState.Mode.OFF;
    private static final SortState.Mode COUNT = SortState.Mode.COUNT;
    private static final SortState.Mode RATING = SortState.Mode.RATING;

    @Before
    public void reset() {
        RankedStore.clear();
        SortState.forTest(OFF, false, false);
    }

    private static Product p(String id, double rating, int count) {
        return new Product(id, "item " + id, 100, rating, count, "https://example.test/" + id);
    }

    private static String ids(List<Product> list) {
        StringBuilder sb = new StringBuilder();
        for (Product x : list) sb.append(sb.length() == 0 ? "" : ",").append(x.id);
        return sb.toString();
    }

    /* ---------------------------------------------------------------- Ranker */

    @Test
    public void mostRatedFirstTiesGoToTheHigherAverage() {
        List<Product> in = Arrays.asList(p("a", 4.9, 12), p("b", 4.2, 9000), p("c", 4.6, 9000), p("d", 4.0, 500));
        assertEquals("c,b,d,a", ids(Ranker.rank(in, COUNT, false)));
    }

    @Test
    public void topRatedFirstTiesGoToMoreRatings() {
        List<Product> in = Arrays.asList(p("a", 4.5, 12), p("b", 4.5, 9000), p("c", 4.9, 3), p("d", 4.1, 500));
        assertEquals("c,b,a,d", ids(Ranker.rank(in, RATING, false)));
    }

    @Test
    public void unknownGoesLastInOriginalOrderAndIsNeverZero() {
        List<Product> in = Arrays.asList(p("x", -1, -1), p("a", 3.0, 10), p("y", -1, -1), p("b", 4.0, 5));
        assertEquals("a,b,x,y", ids(Ranker.rank(in, COUNT, false)));
        assertEquals("b,a,x,y", ids(Ranker.rank(in, RATING, false)));
        // a count without a rating (and vice versa) still ranks in the mode that knows it
        List<Product> mixed = Arrays.asList(p("only-rating", 5.0, -1), p("only-count", -1, 800));
        assertEquals("only-count,only-rating", ids(Ranker.rank(mixed, COUNT, false)));
        assertEquals("only-rating,only-count", ids(Ranker.rank(mixed, RATING, false)));
    }

    @Test
    public void offKeepsTheCollectedOrder() {
        List<Product> in = Arrays.asList(p("a", 1, 1), p("b", 5, 5000));
        assertEquals("a,b", ids(Ranker.rank(in, OFF, false)));
    }

    @Test
    public void fourStarFilterDropsBelowFourButKeepsUnrated() {
        List<Product> in = Arrays.asList(p("low", 3.9, 5000), p("exact", 4.0, 10), p("none", -1, -1), p("high", 4.8, 20));
        assertEquals("exact,none,high", ids(Ranker.rank(in, OFF, true)));
        assertTrue(Ranker.belowMin(3.99));
        assertFalse(Ranker.belowMin(4.0));
        assertFalse(Ranker.belowMin(-1));
    }

    @Test
    public void productNeverStoresZeroOrOutOfRangeNumbers() {
        Product z = new Product("z", "", 0, 0, 0, null);
        assertEquals(-1, z.rating, 0);
        assertEquals(-1, z.count);
        assertEquals(-1, z.price, 0);
        assertEquals("Product", z.title);
        assertEquals(-1, new Product("q", "t", 1, 7.5, 1, null).rating, 0);
    }

    @Test
    public void sortButtonCyclesOffMostRatedTopRatedOff() {
        assertEquals(COUNT, OFF.next());
        assertEquals(RATING, COUNT.next());
        assertEquals(OFF, RATING.next());
        assertEquals(RATING, SortState.Mode.parse("RATING"));
        assertNull(SortState.Mode.parse("nonsense"));
        assertNull(SortState.Mode.parse(null));
    }

    /* ----------------------------------------------------------- RankedStore */

    @Test
    public void storeDedupesAndKeepsTheCopyThatKnowsMore() {
        RankedStore.add(p("a", -1, -1), 1000);
        RankedStore.add(p("a", 4.4, 300), 2000); // a later page fills in the rating
        RankedStore.add(p("a", -1, -1), 3000);   // ...and an emptier copy never erases it
        assertEquals(1, RankedStore.size());
        assertEquals(4.4, RankedStore.snapshot().get(0).rating, 0);
    }

    @Test
    public void storeRanksAcrossPagesAsOneList() {
        RankedStore.add(p("page1-weak", 3.2, 40), 1);
        RankedStore.add(p("page1-ok", 4.1, 900), 2);
        RankedStore.add(p("page3-star", 4.9, 15000), 3);
        assertEquals("page3-star,page1-ok,page1-weak", ids(RankedStore.ranked(COUNT, false)));
        assertEquals("page3-star,page1-ok", ids(RankedStore.ranked(RATING, true)));
    }

    @Test
    public void storeStartsFreshAfterALongIdleGap() {
        RankedStore.add(p("old", 4, 10), 1_000);
        RankedStore.add(p("new", 4, 20), 1_000 + RankedStore.IDLE_RESET_MS + 1);
        assertEquals("new", ids(RankedStore.snapshot()));
        RankedStore.add(p("next", 4, 30), 1_000 + RankedStore.IDLE_RESET_MS + 5);
        assertEquals(2, RankedStore.size());
    }

    @Test
    public void storeIsBoundedAndIgnoresProductsWithoutAnId() {
        for (int i = 0; i < 3100; i++) RankedStore.add(p("p" + i, 4, i + 1), 5);
        assertEquals(3000, RankedStore.size());
        assertEquals("p100", RankedStore.snapshot().get(0).id); // oldest 100 dropped
        RankedStore.clear();
        RankedStore.add(null, 1);
        RankedStore.add(new Product("", "no id", 1, 4, 1, null), 1);
        assertEquals(0, RankedStore.size());
    }

    /* ---------------------------------------------------------------- Myntra */

    private static JSONObject tile(int id, double rating, String count, boolean ad) throws Exception {
        JSONObject info = new JSONObject();
        if (rating > 0) info.put("rating", rating);
        if (count != null) info.put("count", count);
        JSONObject data = new JSONObject().put("productId", id).put("brand", "Brand").put("name", "Heels " + id)
            .put("discountedPrice", 600 + id).put("landingPageUrl", "heels/brand/h" + id + "/" + id + "/buy");
        if (info.length() > 0) data.put("ratingInfo", info);
        if (ad) data.put("adLabel", "AD");
        return new JSONObject().put("id", String.valueOf(id)).put("itemType", "WIDGET")
            .put("itemData", new JSONObject().put("widgetType", "PRODUCT_TILE").put("data", data));
    }

    private static String myntraPage() throws Exception {
        return new JSONObject().put("components", new JSONArray()
            .put(tile(1, 4.9, "12", false))        // best average, tiny sample
            .put(tile(2, 4.1, "27.4k", false))
            .put(tile(3, 3.8, "172.8k", false))    // most ratings, below 4
            .put(tile(4, -1, null, false))         // unrated
            .put(tile(5, 4.6, "5.2k", true))).toString();
    }

    private static String componentIds(String json) throws Exception {
        JSONArray c = new JSONObject(json).getJSONArray("components");
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < c.length(); i++) sb.append(sb.length() == 0 ? "" : ",").append(c.getJSONObject(i).optString("id"));
        return sb.toString();
    }

    @Test
    public void myntraTopRatedOrdersByAverageWithUnratedLast() throws Exception {
        SortState.forTest(RATING, false, true);
        assertEquals("1,2,3,4", componentIds(MyntraListing.process(myntraPage())));
    }

    @Test
    public void myntraMostRatedStillOrdersByCount() throws Exception {
        SortState.forTest(COUNT, false, true);
        assertEquals("3,2,1,4", componentIds(MyntraListing.process(myntraPage())));
    }

    @Test
    public void myntraFourStarFilterDropsSubFourButKeepsUnrated() throws Exception {
        SortState.forTest(COUNT, true, true);
        // 3 (3.8★) is dropped even though it has the most ratings; 4 is unrated and stays
        assertEquals("2,1,4", componentIds(MyntraListing.process(myntraPage())));
    }

    @Test
    public void myntraCollectsEveryOrganicProductEvenWithEverythingOff() throws Exception {
        String page = myntraPage();
        String out = MyntraListing.process(page);
        assertEquals(page, out); // nothing asked for: the response is untouched
        List<Product> got = RankedStore.snapshot();
        assertEquals("1,2,3,4", ids(got)); // the sponsored tile (5) is never collected
        Product two = got.get(1);
        assertEquals(4.1, two.rating, 0);
        assertEquals(27400, two.count);
        assertEquals(602, two.price, 0);
        assertEquals("Brand Heels 2", two.title);
        assertEquals("https://www.myntra.com/heels/brand/h2/2/buy", two.url);
        assertEquals(-1, got.get(3).rating, 0);
    }

    /** A PRODUCT_TILE_V2 tile in the shape captured from the real app (Myntra 4.2609.30). */
    @Test
    public void myntraDescribesARealV2Tile() throws Exception {
        JSONObject data = new JSONObject().put("type", "PRODUCT_TILE_V2").put("styleId", 9364379)
            .put("productImage", new JSONObject().put("adLabel", "").put("ratingInfo",
                new JSONObject().put("rating", "4.4").put("count", "1k")))
            .put("productInfo", new JSONObject().put("brand", "Shoetopia").put("additionalInfo", "Women Heels")
                .put("priceInfo", new JSONObject().put("mrp", "\u20B9999").put("price", "\u20B9558")))
            .put("onPress", new JSONObject().put("type", "NAVIGATION")
                .put("route", "/9364379?isMnowCalloutDisplayedInSrc=false"))
            .put("onLongPress", new JSONObject().put("modalData", new JSONObject()
                .put("productName", "Shoetopia Women Tan Solid Heels").put("mrp", 999).put("price", 558)));
        JSONObject tile = new JSONObject().put("id", "9364379").put("itemType", "WIDGET")
            .put("itemData", new JSONObject().put("widgetType", "PRODUCT_TILE_V2").put("data", data));
        MyntraListing.process(new JSONObject().put("components", new JSONArray().put(tile))
            .put("pad", "x".repeat(100)).toString());
        Product p = RankedStore.snapshot().get(0);
        assertEquals("9364379", p.id);
        assertEquals("Shoetopia Women Tan Solid Heels", p.title);
        assertEquals(558, p.price, 0);
        assertEquals(4.4, p.rating, 0);
        assertEquals(1000, p.count);
        assertEquals("https://www.myntra.com/9364379", p.url);
    }

    @Test
    public void numbersAreReadFromStringsWithCurrencySignsAndGrouping() {
        assertEquals(558, ListingSorter.toDouble("\u20B9558"), 0);
        assertEquals(1299, ListingSorter.toDouble("\u20B91,299"), 0);
        assertEquals(4, ListingSorter.toDouble("4"), 0);
        assertEquals(-1, ListingSorter.toDouble("free"), 0);
        assertEquals(-1, ListingSorter.toDouble(0), 0);
    }

    /* ---------------------------------------------------------------- Meesho */

    private static JSONObject catalog(int id, double avg, int count, boolean ad) throws Exception {
        JSONObject summary = new JSONObject();
        if (count > 0) summary.put("rating_count", count);
        if (avg > 0) summary.put("average_rating", avg);
        JSONObject c = new JSONObject().put("id", id).put("hero_pid", 559982115L + id).put("name", "item " + id)
            .put("min_catalog_price", 200 + id).put("catalog_reviews_summary", summary);
        if (ad) c.put("ad", new JSONObject().put("active", true));
        return c;
    }

    private static String meeshoPage() throws Exception {
        return new JSONObject().put("catalogs", new JSONArray()
            .put(catalog(10, 4.0, 4534, false))
            .put(catalog(11, 4.8, 9, false))
            .put(catalog(12, 3.5, 30000, false))
            .put(catalog(13, 4.4, 800, true))).toString();
    }

    private static String catalogIds(String json) throws Exception {
        JSONArray c = new JSONObject(json).getJSONArray("catalogs");
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < c.length(); i++) sb.append(sb.length() == 0 ? "" : ",").append(c.getJSONObject(i).optInt("id"));
        return sb.toString();
    }

    @Test
    public void meeshoTopRatedUsesTheAverageField() throws Exception {
        SortState.forTest(RATING, false, true);
        assertEquals("11,10,12", catalogIds(MeeshoListing.process(meeshoPage())));
    }

    @Test
    public void meeshoLinkMatchesTheWebCodeForARealHeroPid() throws Exception {
        // From the real app: hero_pid 559982115 is the product the web links as /p/99ecyr.
        JSONObject c = catalog(7, 4.3, 4534, false).put("hero_pid", 559982115L);
        MeeshoListing.process(new JSONObject().put("catalogs", new JSONArray().put(c)).put("pad", "x".repeat(80)).toString());
        assertEquals("https://www.meesho.com/s/p/99ecyr", RankedStore.snapshot().get(0).url);
    }

    @Test
    public void meeshoFilterAndCollection() throws Exception {
        SortState.forTest(COUNT, true, true);
        assertEquals("10,11", catalogIds(MeeshoListing.process(meeshoPage())));
        // collected even though the filter then hid one of them
        assertEquals("10,11,12", ids(RankedStore.snapshot()));
        Product ten = RankedStore.snapshot().get(0);
        assertEquals(4.0, ten.rating, 0);
        assertEquals(4534, ten.count);
        // the link code is the base-36 of hero_pid, not of the catalog id
        assertEquals("https://www.meesho.com/s/p/" + Long.toString(559982115L + 10, 36), ten.url);
    }

    /* ---------------------------------------------------------------- Flipkart */

    private static final String GRID_VIEW = "ATLAS_PRODUCT_SUMMARY_GRID_ELECTRONICS";

    private static JSONObject card(String id, double rating, String reviewText, boolean sponsored) throws Exception {
        JSONObject rd = new JSONObject();
        if (rating > 0) rd.put("rating", rating);
        if (reviewText != null) rd.put("reviewText", reviewText);
        JSONObject text = new JSONObject()
            .put("label_0", new JSONObject().put("value", new JSONObject().put("text", "Brand " + id)))
            .put("label_1", new JSONObject().put("value", new JSONObject().put("text", "Heels for women")))
            // the struck-through MRP (label_3) is higher than the selling price (label_4)
            .put("label_3", new JSONObject().put("value", new JSONObject().put("text", "₹1,999")))
            .put("label_4", new JSONObject().put("value", new JSONObject().put("text", "₹" + (500 + id.charAt(0)))));
        if (rd.length() > 0) text.put("ratingData_0", new JSONObject().put("value", rd));
        if (sponsored) text.put("label_2", new JSONObject().put("value", new JSONObject().put("text", "Sponsored")));
        return new JSONObject().put("value", new JSONObject()
            .put("trackerData_0", new JSONObject().put("tracking", new JSONObject()
                .put("viewType", GRID_VIEW).put("productId", id)))
            .put("fk_electronics_grid_text_1", new JSONObject().put("value", text)));
    }

    private static JSONObject slot(JSONObject... cards) throws Exception {
        JSONArray arr = new JSONArray();
        for (JSONObject c : cards) arr.put(c);
        return new JSONObject().put("widget", new JSONObject().put("data", new JSONObject()
            .put("dlsData", new JSONObject().put("gridData_0", new JSONObject().put("value", arr)))));
    }

    private static String feed(JSONObject... slots) throws Exception {
        JSONArray arr = new JSONArray();
        for (JSONObject s : slots) arr.put(s);
        return new JSONObject().put("RESPONSE", new JSONObject().put("slots", arr)).toString();
    }

    private static List<String> flipkartIds(String json) throws Exception {
        List<String> out = new ArrayList<>();
        JSONArray slots = new JSONObject(json).getJSONObject("RESPONSE").getJSONArray("slots");
        for (int i = 0; i < slots.length(); i++) {
            JSONArray cards = slots.getJSONObject(i).getJSONObject("widget").getJSONObject("data")
                .getJSONObject("dlsData").getJSONObject("gridData_0").getJSONArray("value");
            StringBuilder sb = new StringBuilder();
            for (int j = 0; j < cards.length(); j++) {
                sb.append(sb.length() == 0 ? "" : ",").append(cards.getJSONObject(j).getJSONObject("value")
                    .getJSONObject("trackerData_0").getJSONObject("tracking").getString("productId"));
            }
            out.add(sb.toString());
        }
        return out;
    }

    private static String flipkartFeed() throws Exception {
        return feed(
            slot(card("a", 4.9, "| 12", false), card("b", 3.7, "| 1.2L+", false)),
            slot(card("c", 4.2, "| 44.9K+", false), card("d", -1, null, false)),
            slot(card("e", 4.6, "| 5.5K+", true), card("f", 4.4, "| 2.1K+", false)));
    }

    @Test
    public void flipkartTopRatedSortsByAverageAndKeepsRowSizes() throws Exception {
        SortState.forTest(RATING, false, true);
        // organic: a(4.9) f(4.4) c(4.2) b(3.7) d(unrated); the sponsored card e is dropped
        assertEquals(Arrays.asList("a,f", "c,b", "d"),
            flipkartIds(SortByRatingsHelper.processFlipkartResponseJson(flipkartFeed())));
    }

    @Test
    public void flipkartFourStarFilterDropsBelowFourAndShrinksTheRows() throws Exception {
        SortState.forTest(COUNT, true, true);
        // b (3.7★) is dropped; by count: c(44.9K) f(2.1K) a(12) d(unrated)
        assertEquals(Arrays.asList("c,f", "a,d"),
            flipkartIds(SortByRatingsHelper.processFlipkartResponseJson(flipkartFeed())));
    }

    @Test
    public void flipkartCollectsProductsWhenNothingIsSwitchedOn() throws Exception {
        String in = flipkartFeed();
        assertEquals(in, SortByRatingsHelper.processFlipkartResponseJson(in));
        assertEquals("a,b,c,d,f", ids(RankedStore.snapshot())); // sponsored e never collected
        Product c = null;
        for (Product x : RankedStore.snapshot()) if (x.id.equals("c")) c = x;
        assertNotNull(c);
        assertEquals(4.2, c.rating, 0);
        assertEquals(44900, c.count);
        assertEquals("Brand c Heels for women", c.title);
        assertEquals(599, c.price, 0); // the selling price (500 + 'c'), not the 1,999 MRP
        assertEquals("https://www.flipkart.com/product/p/item?pid=c", c.url);
    }

    @Test
    public void panelMetaLeavesOutWhatIsUnknown() {
        assertEquals("₹1,234  ·  ★ 4.5  ·  12,345 ratings", RankedPanel.meta(new Product("m", "t", 1234, 4.5, 12345, null)));
        assertEquals("no rating shown", RankedPanel.meta(new Product("n", "t", -1, -1, -1, null)));
        assertEquals("★ 4.0", RankedPanel.meta(new Product("o", "t", -1, 4.0, -1, null)));
    }
}
