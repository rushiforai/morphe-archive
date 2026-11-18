package nl.johninnl.aliexpress;

import org.junit.Test;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import static org.junit.Assert.*;

public class ContentFilterTest {
    private static Map<String, Object> object(Object... pairs) {
        Map<String, Object> result = new LinkedHashMap<>();
        for (int i = 0; i < pairs.length; i += 2) result.put((String) pairs[i], pairs[i + 1]);
        return result;
    }
    private static List<Object> array(Object... items) {
        return new ArrayList<>(Arrays.asList(items));
    }

    @Test public void removesPaidCardsWithoutRerankingOrChangingOrganicProducts() {
        Map<String, Object> organic = object("productId", "1", "price", "21.06", "sale", "11.11");
        Map<String, Object> second = object("productId", "2", "brand", "Choice");
        List<Object> products = array(organic, object("p4p", object("adTag", object("tagText", "Ad"))),
                second, object("model", object("productId", "3", "p4p", object("sessionId", "paid"))));
        ContentFilter.filterArray(products, true, false);
        assertEquals(array(organic, second), products);
        assertSame(organic, products.get(0));
        assertSame(second, products.get(1));
        assertEquals("21.06", organic.get("price"));
        ContentFilter.filterArray(products, true, false);
        assertEquals(2, products.size());
    }

    @Test public void disabledFiltersPreservePaidAndPromotionalCards() {
        List<Object> items = array(object("p4p", object()), object("tItemType", "ae_home_rcmd_banner"));
        ContentFilter.filterArray(items, false, false);
        assertEquals(2, items.size());
        ContentFilter.filterArray(items, true, false);
        assertEquals(1, items.size());
        ContentFilter.filterArray(items, false, true);
        assertTrue(items.isEmpty());
    }

    @Test public void keepsUnknownShapesProductTextAndComplianceCards() {
        List<Object> items = array(null, "Ad", 1, object("p4p", null), object("title", "Merge Boss"),
                object("templateName", "ahe_ae_rcmd_bottom_compliance"),
                object("tItemType", "ahe_app_rcmd_new_card", "productId", "organic"),
                object("name", "ae_home_searchbar_v4_us"), object("name", "ae_home_tabbar"));
        List<Object> expected = new ArrayList<>(items);
        ContentFilter.filterArray(items, true, true);
        assertEquals(expected, items);
    }

    @Test public void removesCampaignFloorsAndOnlyGenuineGameRoutes() {
        Object help = object("url", "https://so.aliexpress.com/s/Byrmyae");
        Object wishlist = object("url", "https://my.aliexpress.com/wishlist/wish_list_product_list.htm");
        Object lookalike = object("url", "https://aliexpress.com.example.org/p/aefarm/index.html");
        List<Object> items = array(object("type", "ahe$myae_coin_us"), object("compName", "myae_banner"),
                object("name", "ae_home_new_big_sale_mixed_many_codes_v2"),
                object("tItemType", "ahe_ae_rcmd_coupon_card"), object("spmc", "new_entertainment"),
                object("url", " https://m.aliexpress.com/p/aefarm/index.html?_hideProgress=true"),
                object("actionUrl", "https://m.aliexpress.com/p/merge-market/index.html"), help, wishlist, lookalike);
        ContentFilter.filterArray(items, false, true);
        assertEquals(array(help, wishlist, lookalike), items);
    }

    @Test public void normalizedFloorsPreserveParserStateAcrossFullAndDeltaUpdates() {
        Map<String, Object> search = object("compName", "ae_home_searchbar");
        Map<String, Object> sale = object("type", "ahe$ae_home_banner");
        Map<String, Object> feed = object("compName", "more_to_love_product_list");
        Map<String, Object> components = object("search", search, "sale", sale, "feed", feed);
        List<Object> nativeStructure = array("search", "sale", "feed");
        List<Object> delta = array(object("opType", "replace", "target", "sale"));
        List<Map<String, Object>> rendered = new ArrayList<>(Arrays.asList(search, sale, feed));
        rendered.removeIf(ContentFilter::removePromotionalComponent);
        assertEquals(Arrays.asList(search, feed), rendered);
        // Native parsing keeps all its targets; a later reload cannot dereference an omitted component.
        assertSame(sale, components.get("sale"));
        assertEquals(array("search", "sale", "feed"), nativeStructure);
        assertEquals("replace", ((Map<?, ?>) delta.get(0)).get("opType"));
        // A delta-only insert is filtered at the same displayed-list boundary as a full response.
        Map<String, Object> coupon = object("compName", "myae_banner");
        rendered.add(coupon);
        rendered.removeIf(ContentFilter::removePromotionalComponent);
        assertEquals(Arrays.asList(search, feed), rendered);
    }

    @Test public void mixedAccountServicesRetainHistoryAndRemoveGameShortcuts() {
        Map<String, Object> history = object("url", "https://m.aliexpress.com/p/history/detail.html");
        List<Object> shortcuts = array(object("url", "https://m.aliexpress.com/p/ae-gamecenter/index.html"), history);
        Map<String, Object> services = object("type", "ahe$myae_grid_common", "fields", object("horizontalItems", shortcuts));
        assertFalse(ContentFilter.removePromotionalComponent(services));
        assertEquals(array(history), shortcuts);
        assertFalse(ContentFilter.removePromotionalComponent(services));
        assertTrue(ContentFilter.removePromotionalComponent(object("type", "ahe$myae_four_grid", "spmc", "new_entertainment")));
        List<Object> allGames = array(object("url", "https://m.aliexpress.com/p/gogo-match-cc/index.html"));
        assertTrue(ContentFilter.removePromotionalComponent(object("type", "ahe$myae_grid_common", "fields", object("horizontalItems", allGames))));
        assertTrue(allGames.isEmpty());
    }

    @Test public void separateRecommendationMarketingFloorIsRemovedWithoutLosingCategoryTabs() {
        assertTrue(ContentFilter.promotionalTemplate("marketingFloorChoice"));
        assertFalse(ContentFilter.promotionalTemplate("sceondThemeTabs"));
        assertFalse(ContentFilter.promotionalTemplate("ahe_app_rcmd_new_card"));
    }

    @Test public void malformedAndUnrelatedComponentsRemainUnchanged() {
        Map<String, Object> checkout = object("total", "37.05", "coupon", "valid");
        Map<String, Object> before = new LinkedHashMap<>(checkout);
        assertFalse(ContentFilter.removePromotionalComponent(checkout));
        assertFalse(ContentFilter.removePromotionalComponent(null));
        ContentFilter.filterArray(null, true, true);
        assertEquals(before, checkout);
    }
    @Test public void filtersRestoredModelsWithoutChangingTheOriginalListOrOrdinaryPrices() {
        Map<String, Object> organic = object("productId", "1", "prices", object("salePrice", "13.59"));
        Map<String, Object> paidSnapshot = object("type", "biz", "fields", object("data",
                object("productId", "2", "p4p", object("adTag", object("tagText", "Ad")))));
        Map<String, Object> channel = object("productId", "3", "rainbow",
                object("rainbowType", "channelProduct", "title", "Bundle deals"));
        List<Object> original = java.util.Collections.unmodifiableList(array(organic, paidSnapshot, channel));
        List<?> result = RenderedItems.filter(original, true, true);
        assertEquals(array(organic), result);
        assertEquals(3, original.size());
        assertSame(organic, result.get(0));
        assertEquals("13.59", ((Map<?, ?>) organic.get("prices")).get("salePrice"));
        assertSame(original, RenderedItems.filter(original, false, false));
        assertEquals(array(organic, channel), RenderedItems.filter(original, true, false));
        assertEquals(array(organic, paidSnapshot), RenderedItems.filter(original, false, true));
    }

    @Test public void sourceIdentifiedCouponAndRecommendationHeadersAreFiltered() {
        assertTrue(ContentFilter.removeRenderedItem(object("type", "biz"),
                "home-coupon-package-832197", false, true));
        assertTrue(ContentFilter.removeRenderedItem(object("modelBizType", "MTL-Tab"), "", false, true));
        assertTrue(ContentFilter.promotionalTemplate("ahe$home-coupon-package-832197"));
        assertFalse(ContentFilter.promotionalTemplate("ae_home_tabbar_choice"));
        assertFalse(ContentFilter.promotionalTemplate("ae_home_kr_topBar"));
        assertFalse(ContentFilter.promotionalTemplate("ae_home_tabbar_categories"));
        assertFalse(ContentFilter.removeRenderedItem(object("type", "biz"),
                "home-coupon-package-832197", false, false));
    }

    @Test public void preservesSectionMembershipAndUnknownObjectsWhenFilteringSnapshots() {
        Map<String, Object> organic = object("productId", "1");
        Map<String, Object> paid = object("productId", "2", "p4p", object());
        List<Object> untouched = array(organic, new Object(), null);
        assertSame(untouched, RenderedItems.filter(untouched, true, true));
        List<Object> first = java.util.Collections.unmodifiableList(array(paid));
        List<Object> second = java.util.Collections.unmodifiableList(array(organic));
        List<Object> sections = java.util.Collections.unmodifiableList(array(first, second));
        List<?> result = RenderedItems.filterSections(sections, true, true);
        assertEquals(2, result.size());
        assertTrue(((List<?>) result.get(0)).isEmpty());
        assertSame(second, result.get(1));
        assertEquals(1, first.size());
        assertSame(sections, RenderedItems.filterSections(sections, false, false));
        assertNull(RenderedItems.filter(null, true, true));
        assertNull(RenderedItems.filterSections(null, true, true));
    }

    @Test public void channelClassificationDoesNotGuessFromTitlesOrOrdinaryColorData() {
        Map<String, Object> ordinary = object("productId", "1", "title", "Bundle deals rainbow light",
                "rainbow", object("rainbowType", "color", "title", "Rainbow"));
        assertFalse(ContentFilter.removeRenderedItem(ordinary, "ahe_app_rcmd_new_card", false, true));
        assertFalse(ContentFilter.removeRenderedItem(object("rainbow", object("rainbowType", "channelProduct")),
                "", false, true));
    }

    @Test public void canonicalProductDataWorksBeforeThePresentationComponentExists() {
        Map<String, Object> paid = object("productId", "2", "p4p", object("adTag", object("tagText", "Ad")));
        Map<String, Object> channel = object("productId", "3", "prices", object("salePrice", "4.07"),
                "rainbow", object("rainbowType", "channelProduct"));
        Map<String, Object> presentation = object("id", "snapshot");
        assertTrue(ContentFilter.removeProductModel(null, paid, "", false, true, false));
        assertTrue(ContentFilter.removeProductModel(presentation, channel, "", false, false, true));
        assertFalse(ContentFilter.removeProductModel(presentation, paid, "", false, false, true));
        assertEquals("4.07", ((Map<?, ?>) channel.get("prices")).get("salePrice"));
        assertTrue(ContentFilter.removeProductModel(paid, object(), "", false, true, false));
    }

    @Test public void decodedNativePaidMarkerIsIndependentOfTheRawJsonRepresentation() {
        Map<String, Object> serialized = object("productId", "2", "p4p", "{encoded}");
        assertTrue(ContentFilter.removeProductModel(null, serialized, "", true, true, false));
        assertFalse(ContentFilter.removeProductModel(null, serialized, "", true, false, true));
        assertFalse(ContentFilter.removeProductModel(null, null, "", false, true, true));
    }

    @Test public void outerHomePayloadFiltersBeforeNativeRecommendationParsing() {
        Map<String, Object> organic = object("productId", "organic", "prices", object("salePrice", "13.59"));
        Map<String, Object> paid = object("productId", "paid", "p4p", object("adTag", object("tagText", "Ad")));
        Map<String, Object> channel = object("productId", "channel", "rainbow", object("rainbowType", "channelProduct"));
        List<Object> products = array(paid, organic, channel);
        Map<String, Object> templates = object("paid-template", object("p4p", object()));
        Map<String, Object> page = object("mods", object("listItems", products), "templates", templates);
        Map<String, Object> component = object("type", "ahe", "fields", object("data", array(page)));
        ContentFilter.filterEmbeddedProducts(component, false, false);
        assertEquals(3, products.size());
        ContentFilter.filterEmbeddedProducts(component, true, false);
        assertEquals(array(organic, channel), products);
        ContentFilter.filterEmbeddedProducts(component, false, true);
        assertEquals(array(organic), products);
        assertSame(organic, products.get(0));
        assertSame(templates, page.get("templates"));
        assertEquals(1, templates.size());
        assertEquals("13.59", ((Map<?, ?>) organic.get("prices")).get("salePrice"));
        ContentFilter.filterEmbeddedProducts(component, true, true);
        assertEquals(array(organic), products);
    }

    @Test public void payloadFilteringDoesNotWalkUnrelatedListsOrRequireAnArrayEnvelope() {
        List<Object> products = array(object("p4p", object()), object("productId", "organic"));
        List<Object> unrelated = array(object("p4p", object()));
        Map<String, Object> component = object("fields", object("data",
                object("mods", object("listItems", products), "unrelated", unrelated)));
        assertFalse(ContentFilter.removeProductModel(component, null, "", false, true, true));
        assertEquals(1, products.size());
        assertEquals(1, unrelated.size());
        assertTrue(ContentFilter.removePromotionalComponent(object("fields", object("templateName", "nt_rcmd_tab"))));
        assertFalse(ContentFilter.removePromotionalComponent(object("fields", object("templateName", "ahe_app_rcmd_new_card"))));
    }

    @Test public void removesDsaAdCardsWhoseNormalPaidObjectIsAbsent() {
        Map<String, Object> disclosure = object("productId", "ad", "trace", object("custom",
                object("p4pExtendParam", "{\"company_name\":\"seller\",\"store_name\":\"store\"}")));
        Map<String, Object> organic = object("productId", "organic", "trace",
                object("custom", object("tracking", "ordinary")), "prices", object("salePrice", "13.59"));
        List<Object> products = array(disclosure, organic);
        ContentFilter.filterArray(products, false, true);
        assertEquals(2, products.size());
        ContentFilter.filterArray(products, true, false);
        assertEquals(array(organic), products);
        assertSame(organic, products.get(0));
        assertEquals("13.59", ((Map<?, ?>) organic.get("prices")).get("salePrice"));
        assertTrue(ContentFilter.removeProductModel(null, disclosure, "", false, true, false));
        assertFalse(ContentFilter.removeProductModel(null, object("trace", object("custom",
                object("p4pExtendParam", "  "))), "", false, true, true));
        assertFalse(ContentFilter.removeProductModel(null, object("trace", object("custom",
                object("p4pExtendParam", object()))), "", false, true, true));
    }

    @Test public void detailOffersAndArrayEncodedAccountFloorsPreserveShoppingControls() {
        assertTrue(ContentFilter.removePromotionalComponent(object("type", array("ahe$galaxy_coupon_block"))));
        assertTrue(ContentFilter.removePromotionalComponent(object("type", array("ahe$galaxy_non_coupon_interest"))));
        assertTrue(ContentFilter.removePromotionalComponent(object("type", array("native$myae_coin_us"))));
        for (String floor : Arrays.asList("galaxy_main_price_banner", "galaxy_price_banner_kr_v2",
                "galaxy_main_sku_tile", "galaxy_main_shipping", "galaxy_star_sold")) {
            assertFalse(ContentFilter.removePromotionalComponent(object("type", array("ahe$" + floor))));
            assertFalse(ContentFilter.promotionalTemplate(floor));
        }
        assertTrue(ContentFilter.removeRenderedItem(null, "galaxy_kr_coupon_merge", false, true));
        assertFalse(ContentFilter.removeRenderedItem(null, "galaxy_kr_coupon_merge", false, false));
    }

    @Test public void priceCampaignAdornmentIsRemovedWithoutChangingThePricePayload() {
        Map<String, Object> price = object("salePrice", "7.99", "tax", object("content", "VAT included"));
        List<Object> ladder = array(object("quantity", 5, "price", "6.50"));
        Map<String, Object> minimum = object("price", "8.29");
        Map<String, Object> fields = object("price", price, "ladderPriceList", ladder,
                "minimumPriceInfo", minimum, "bannerInfo", object("endTimer", object("timeout", 100)));
        ContentFilter.sanitizePriceBanner(fields);
        assertFalse(fields.containsKey("bannerInfo"));
        assertSame(price, fields.get("price"));
        assertSame(ladder, fields.get("ladderPriceList"));
        assertSame(minimum, fields.get("minimumPriceInfo"));
        assertEquals("7.99", price.get("salePrice"));
        assertTrue(ContentFilter.promotionalTemplate("ahe$galaxy_price_extend"));
        assertTrue(ContentFilter.promotionalTemplate("ahe$price_extend"));
        assertFalse(ContentFilter.removeRenderedItem(null, "galaxy_price_extend", false, false));
        ContentFilter.sanitizePriceBanner(null);
    }

    @Test public void accountHeaderRemovesOnlyCampaignArtworkAndKeepsSignInAndProfileData() {
        Map<String, Object> fields = object("bgImg", "campaign-artwork", "signUrl", "native-sign-in",
                "signTip", "Sign in/Register", "userID", "profile", "welcomeText", "Welcome to AliExpress");
        Map<String, Object> component = object("fields", fields);
        ContentFilter.sanitizeAccountHeader(component, "unrelated");
        assertTrue(fields.containsKey("bgImg"));
        ContentFilter.sanitizeAccountHeader(component, "myae.main.topbar");
        assertFalse(fields.containsKey("bgImg"));
        assertEquals("native-sign-in", fields.get("signUrl"));
        assertEquals("profile", fields.get("userID"));
        assertEquals("Sign in/Register", fields.get("signTip"));
        assertEquals("Welcome to AliExpress", fields.get("welcomeText"));
        fields.put("bgImg", "fallback-artwork");
        ContentFilter.sanitizeAccountHeader(component, "myae_native_header");
        assertFalse(fields.containsKey("bgImg"));
        Map<String, Object> fallback = object("fields", object());
        assertTrue(ContentFilter.sanitizeAccountHeader(fallback, "myae.main.topbar"));
        assertEquals("Sign in/Register", ((Map<?, ?>) fallback.get("fields")).get("signTip"));
        assertEquals("https://m.aliexpress.com/index.htm?_login=YES",
                ((Map<?, ?>) fallback.get("fields")).get("signUrl"));
        assertFalse(ContentFilter.sanitizeAccountHeader(fallback, "unrelated"));
    }

    @Test public void remoteAccountGuestAndSaleFloorsRemainSeparateFromNativeAccountControls() {
        assertTrue(ContentFilter.removeRenderedItem(null, "myae_unlogin_tips_us", false, true));
        assertTrue(ContentFilter.removeRenderedItem(null, "MyAE_Native__top_sticky__", false, true));
        assertTrue(ContentFilter.promotionalTemplate("ahe$myae_coupon_banner_v2"));
        assertFalse(ContentFilter.removeRenderedItem(null, "myae_unlogin_tips_us", false, false));
        for (String floor : Arrays.asList("myae_native_header", "myae_numbers", "myae_grid_common", "myae_appeal")) {
            assertFalse(ContentFilter.promotionalTemplate(floor));
        }
    }

    @Test public void searchCampaignAppBarKeepsOrdinaryFiltersAndOptionalModels() {
        assertTrue(ContentFilter.removeRenderedItem(null, "bigSaleBanner", false, true));
        assertFalse(ContentFilter.removeRenderedItem(null, "bigSaleBanner", true, false));
        for (String floor : Arrays.asList("rapidFilterBar", "categoryFilterBar", "sortBar", "appBarAhe")) {
            assertFalse(ContentFilter.removeRenderedItem(null, floor, true, true));
        }
        Object filter = object("name", "rapidFilterBar");
        Object banner = object("name", "bigSaleBanner");
        assertSame(filter, RenderedItems.filterOne(filter, true, true));
        assertNull(RenderedItems.filterOne(banner, false, true));
        assertSame(banner, RenderedItems.filterOne(banner, true, false));
        assertNull(RenderedItems.filterOne(null, true, true));
    }

    @Test public void bundleCampaignRouteIsRecognizedWithoutRelyingOnItsPresentationType() {
        Map<String, Object> campaign = object("productId", "bundle", "prices", object("salePrice", "2.02"),
                "rainbow", object("url", "https://www.aliexpress.com/ssr/300000512/BundleDealsDutyCovered?source=search"));
        assertTrue(ContentFilter.removeProductModel(null, campaign, "", false, false, true));
        assertFalse(ContentFilter.removeProductModel(null, campaign, "", false, true, false));
        assertEquals("2.02", ((Map<?, ?>) campaign.get("prices")).get("salePrice"));
        Map<String, Object> lookalike = object("productId", "ordinary", "rainbow",
                object("url", "https://aliexpress.com.example.org/ssr/300000512/BundleDealsDutyCovered"));
        assertFalse(ContentFilter.removeProductModel(null, lookalike, "", false, true, true));
        assertFalse(ContentFilter.removeProductModel(null, object("productId", "ordinary", "rainbow",
                object("url", "https://www.aliexpress.com/item/ordinary.html")), "", false, true, true));
    }

}
