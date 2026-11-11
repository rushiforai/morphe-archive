package app.polishapps.extension.lidl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Removes server-driven entries from the lists that Lidl Plus uses to build its home screen and
 * bottom bar. The lists arrive as plain module names, so dropping a name makes the app behave as if
 * the server had never configured it: no view is built and no request for its data is made.
 */
@SuppressWarnings("unused")
public final class ModuleFilters {

    /** Home modules `brandDeals_slot_a` / `_b` are the sponsored (brand deals) ad slots. */
    private static final Set<String> SPONSORED = set("brandDeals_slot_a", "brandDeals_slot_b");

    /** The recipes carousel plus the product showcase ("inspiration") carousels. */
    private static final Set<String> RECIPES_AND_INSPIRATIONS = set(
            "recipes", "productShowcase1", "productShowcase2", "productShowcase3");

    /**
     * The round "bubble" category row at the top of the home screen (`WorldOfNeeds`: promotions, kitchen,
     * home, pets), the product catalog categories (`productCatalog`) and the small blue business model
     * chips under the store header (`businessModels`: Benefit Plus, kitchen, wine, e-mobility).
     */
    private static final Set<String> SHORTCUTS = set("WorldOfNeeds", "productCatalog", "businessModels");

    /** The online shop "Deal of the Day" card with its countdown, and its content-stack variant. */
    private static final Set<String> PRODUCT_OF_THE_DAY = set("onlineshop1cx_DoD", "onlineshop1cx_DoD_CS");

    /** Every online shop card on the home screen: the combined module and its variants. */
    private static final Set<String> ONLINE_SHOP_CARDS = set(
            "onlineshop1cx", "onlineshop1cx_CS", "onlineshop1cx_search",
            "onlineshop1cx_DoD", "onlineshop1cx_DoD_CS");

    /** The offers and promotions (coupon and deal) carousels. */
    private static final Set<String> OFFERS_AND_PROMOTIONS = set("offers", "promotions");

    /** Dismissible info cards (verify your data, enable notifications, location, ...). */
    private static final Set<String> TIPCARDS = set("tipcards");

    /** Featured and recommended product carousels and the product catalog starting page. */
    private static final Set<String> PRODUCTS = set(
            "featuredProducts", "recommendedProducts", "productCatalogStartingPage");

    /** Weekly leaflets (brochures) and the digital leaflet carousels. */
    private static final Set<String> LEAFLETS = set(
            "brochures", "brochuresCombined", "digitalLeafletv2_carrousel", "digitalLeafletv2_combined");

    /** The "your store" header with the usual store, opening hours and store picker. */
    private static final Set<String> STORE = set("usualStoreHeader", "usualStoreV2");

    /** Lidl's own promo banners, video banners and the greeting / home message. */
    private static final Set<String> BANNERS_AND_MESSAGES = set("banners", "bannersVideo", "homeMessage");

    /** Bottom bar entry that opens the Lidl online shop. */
    private static final Set<String> ONLINE_SHOP_TAB = set("onlineshop1cx");

    private ModuleFilters() {
    }

    public static List<String> hideSponsored(List<String> modules) {
        return without(modules, SPONSORED);
    }

    public static List<String> hideRecipesAndInspirations(List<String> modules) {
        return without(modules, RECIPES_AND_INSPIRATIONS);
    }

    public static List<String> hideShortcuts(List<String> modules) {
        return without(modules, SHORTCUTS);
    }

    public static List<String> hideProductOfTheDay(List<String> modules) {
        return without(modules, PRODUCT_OF_THE_DAY);
    }

    public static List<String> hideOnlineShopCards(List<String> modules) {
        return without(modules, ONLINE_SHOP_CARDS);
    }

    public static List<String> hideOffersAndPromotions(List<String> modules) {
        return without(modules, OFFERS_AND_PROMOTIONS);
    }

    public static List<String> hideTipcards(List<String> modules) {
        return without(modules, TIPCARDS);
    }

    public static List<String> hideProducts(List<String> modules) {
        return without(modules, PRODUCTS);
    }

    public static List<String> hideLeaflets(List<String> modules) {
        return without(modules, LEAFLETS);
    }

    public static List<String> hideStore(List<String> modules) {
        return without(modules, STORE);
    }

    public static List<String> hideBannersAndMessages(List<String> modules) {
        return without(modules, BANNERS_AND_MESSAGES);
    }

    public static List<String> hideOnlineShopTab(List<String> tabs) {
        return without(tabs, ONLINE_SHOP_TAB);
    }

    private static Set<String> set(String... names) {
        return new HashSet<>(Arrays.asList(names));
    }

    /** Returns [source] itself when nothing is removed, so the common case allocates nothing. */
    private static List<String> without(List<String> source, Set<String> hidden) {
        if (source == null) {
            return null;
        }
        List<String> filtered = null;
        for (int i = 0; i < source.size(); i++) {
            String name = source.get(i);
            if (hidden.contains(name)) {
                if (filtered == null) {
                    filtered = new ArrayList<>(source.subList(0, i));
                }
            } else if (filtered != null) {
                filtered.add(name);
            }
        }
        return filtered == null ? source : filtered;
    }
}
