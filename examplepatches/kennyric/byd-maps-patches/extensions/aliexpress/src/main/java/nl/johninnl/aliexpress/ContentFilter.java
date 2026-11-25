/*
 * Copyright (C) 2026 johninnl
 * SPDX-License-Identifier: GPL-3.0-only
 */
package nl.johninnl.aliexpress;

import java.net.URI;
import java.util.List;
import java.util.Map;

/** Source-identified paid cards and campaign components, independent of translated UI text. */
final class ContentFilter {
    private ContentFilter() { }

    static void filterArray(List<?> items, boolean sponsored, boolean promotions) {
        if (items == null || (!sponsored && !promotions)) {
            return;
        }
        for (int index = items.size() - 1; index >= 0; index--) {
            Object item = items.get(index);
            if (!(item instanceof Map<?, ?>)) {
                continue;
            }
            Map<?, ?> card = (Map<?, ?>) item;
            if ((sponsored && isSponsored(card, 0))
                    || (promotions && (isPromotion(card) || isChannelProduct(card, 0)))) {
                items.remove(index);
            }
        }
    }

    static boolean removeProductModel(Map<?, ?> presentation, Map<?, ?> product, String floorName,
            boolean decodedPaidMarker, boolean sponsored, boolean promotions) {
        filterEmbeddedProducts(presentation, sponsored, promotions);
        return (sponsored && decodedPaidMarker)
                || removeRenderedItem(presentation, floorName, sponsored, promotions)
                || (product != presentation && removeRenderedItem(product, null, sponsored, promotions));
    }

    // Home also submits outer Ultron floors before their separate recommendation parser runs.
    // Filter only the source-identified product payload; leave protocol targets and templates intact.
    static void filterEmbeddedProducts(Map<?, ?> component, boolean sponsored, boolean promotions) {
        if (component == null || (!sponsored && !promotions)) return;
        Map<?, ?> fields = map(component.get("fields"));
        Object data = fields == null ? null : fields.get("data");
        if (data instanceof List<?>) {
            for (Object page : (List<?>) data) filterProductPage(map(page), sponsored, promotions);
        } else {
            filterProductPage(map(data), sponsored, promotions);
        }
    }

    private static void filterProductPage(Map<?, ?> page, boolean sponsored, boolean promotions) {
        Map<?, ?> mods = page == null ? null : map(page.get("mods"));
        Object items = mods == null ? null : mods.get("listItems");
        if (items instanceof List<?>) filterArray((List<?>) items, sponsored, promotions);
    }

    @SuppressWarnings("unchecked")
    static boolean sanitizeAccountHeader(Map<?, ?> component, String floorName) {
        if (component == null) return false;
        if (!"myae_native_header".equals(floorName) && !"myae.main.topbar".equals(floorName)) return false;
        Map<?, ?> fields = map(component.get("fields"));
        // The native header owns sign-in/profile/settings separately from this campaign artwork.
        if (fields != null) {
            fields.remove("bgImg");
            Map<String, Object> nativeFields = (Map<String, Object>) fields;
            if (fields.get("signTip") == null) nativeFields.put("signTip", "Sign in/Register");
            if (fields.get("signUrl") == null) nativeFields.put("signUrl", "https://m.aliexpress.com/index.htm?_login=YES");
        }
        return true;
    }

    static void sanitizePriceBanner(Map<?, ?> priceFields) {
        if (priceFields != null) priceFields.remove("bannerInfo");
    }

    static boolean removeRenderedItem(Map<?, ?> data, String floorName, boolean sponsored, boolean promotions) {
        if (sponsored && data != null && isSponsored(data, 0)) return true;
        return promotions && (promotionalTemplate(floorName) || removePromotionalComponent(data));
    }

    private static boolean isSponsored(Map<?, ?> card, int depth) {
        // P4P is the app's paid-placement contract, including the Ad disclosure.
        // Do not infer sponsorship from prices, titles, brands or ordinary sale badges.
        if (card.get("p4p") instanceof Map<?, ?>) {
            return true;
        }
        // The shipped AHE card's DSA Ad disclosure also reads this paid-placement
        // extension when the normal p4p/adTag object is absent (EU Home responses).
        Map<?, ?> trace = map(card.get("trace"));
        Map<?, ?> custom = trace == null ? null : map(trace.get("custom"));
        Object extension = custom == null ? null : custom.get("p4pExtendParam");
        if (extension instanceof String && !((String) extension).trim().isEmpty()) return true;
        if (extension instanceof Map<?, ?> && !((Map<?, ?>) extension).isEmpty()) return true;
        if (depth < 3) {
            for (String key : new String[]{"model", "fields", "data"}) {
                Object nested = card.get(key);
                if (nested instanceof Map<?, ?> && isSponsored((Map<?, ?>) nested, depth + 1)) {
                    return true;
                }
            }
        }
        return false;
    }

    static boolean removePromotionalComponent(Map<?, ?> component) {
        if (component == null) {
            return false;
        }
        if (isPromotion(component) || isChannelProduct(component, 0)) {
            return true;
        }
        Map<?, ?> fields = map(component.get("fields"));
        if (fields != null && isPromotion(fields)) return true;
        Object horizontal = fields == null ? null : fields.get("horizontalItems");
        if (horizontal instanceof List<?>) {
            List<?> shortcuts = (List<?>) horizontal;
            boolean hadItems = !shortcuts.isEmpty();
            filterArray(shortcuts, false, true);
            return hadItems && shortcuts.isEmpty();
        }
        return false;
    }

    private static boolean isChannelProduct(Map<?, ?> card, int depth) {
        Map<?, ?> rainbow = map(card.get("rainbow"));
        if (card.get("productId") != null && rainbow != null
                && ("channelProduct".equals(rainbow.get("rainbowType"))
                    || bundleCampaignRoute(rainbow.get("url")))) return true;
        if (depth < 3) {
            for (String key : new String[]{"model", "fields", "data"}) {
                Map<?, ?> nested = map(card.get(key));
                if (nested != null && isChannelProduct(nested, depth + 1)) return true;
            }
        }
        return false;
    }

    private static boolean bundleCampaignRoute(Object value) {
        if (!(value instanceof String)) return false;
        try {
            URI uri = URI.create(((String) value).trim());
            String host = uri.getHost();
            if (host == null || !(host.equalsIgnoreCase("aliexpress.com")
                    || host.toLowerCase(java.util.Locale.ROOT).endsWith(".aliexpress.com"))) return false;
            String path = uri.getPath();
            return path != null && path.startsWith("/ssr/") && path.endsWith("/BundleDealsDutyCovered");
        } catch (IllegalArgumentException ex) {
            return false;
        }
    }

    private static boolean isPromotion(Map<?, ?> card) {
        for (String key : new String[]{"compName", "templateName", "tItemType", "type", "name"}) {
            if (promotionalTemplate(card.get(key))) {
                return true;
            }
        }
        Object types = card.get("type");
        if (types instanceof List<?>) {
            for (Object type : (List<?>) types) if (promotionalTemplate(type)) return true;
        }
        if ("MTL-Tab".equals(card.get("modelBizType"))) return true;
        if ("new_entertainment".equals(card.get("spmc"))) {
            return true;
        }
        Map<?, ?> extension = map(card.get("extension"));
        if (extension != null && "new_entertainment".equals(extension.get("spmc"))) {
            return true;
        }
        return gameRoute(card.get("url")) || gameRoute(card.get("actionUrl"));
    }

    static boolean promotionalTemplate(Object value) {
        if (!(value instanceof String)) {
            return false;
        }
        String name = (String) value;
        int namespace = name.indexOf('$');
        if (namespace >= 0) {
            name = name.substring(namespace + 1);
        }
        if (name.equals("nt_rcmd_tab") || name.equals("bigSaleBanner")) return true;
        // Detail's offer-only floors are separate from its actual price, SKU and shipping floors.
        if (name.equals("galaxy_coupon_block") || name.equals("galaxy_kr_coupon_merge")
                || name.equals("galaxy_non_coupon_interest") || name.equals("galaxy_kr_interest_merge")
                || name.equals("galaxy_price_extend") || name.equals("price_extend")
                || name.equals("galaxy_main_mind") || name.equals("coupon_block")
                || name.equals("main_kr_coupon_merge") || name.equals("non_coupon_interest")
                || name.equals("main_kr_interest_merge") || name.equals("main_mind")) return true;
        // Native configuration carries ordinary icons and message state as well as campaign artwork.
        if (name.equals("ae_home_kr_topBar")) return false;
        // Home's ordinary feed is more_to_love_product_list; retain search and category navigation.
        if (name.startsWith("ae_home_") && !name.startsWith("ae_home_searchbar")
                && !name.startsWith("ae_home_tabbar")) {
            return true;
        }
        return name.equals("myae_business") || name.equals("myae_prime") || name.equals("myae_banner") || name.equals("myae_coin") || name.equals("myae_coin_us")
                || name.startsWith("myae_unlogin_tips") || name.startsWith("myae_coupon_banner")
                || name.equals("MyAE_Native__top_sticky__")
                || name.equals("marketingFloorChoice") || name.equals("ahe_ae_rcmd_coupon_card")
                || name.startsWith("home-coupon-package-") || name.startsWith("home-bundle-deals-card-") || name.startsWith("home-row-two-")
                || name.startsWith("new_banner._home_") || name.startsWith("new_home_mind_bar.")
                || name.startsWith("usp_home_");
    }

    private static boolean gameRoute(Object value) {
        if (!(value instanceof String)) {
            return false;
        }
        try {
            URI uri = URI.create(((String) value).trim());
            String host = uri.getHost();
            if (host == null || !(host.equalsIgnoreCase("aliexpress.com")
                    || host.toLowerCase(java.util.Locale.ROOT).endsWith(".aliexpress.com"))) {
                return false;
            }
            String path = uri.getPath();
            return path != null && (path.startsWith("/p/ae-gamecenter/")
                    || path.startsWith("/p/gogo-match-cc/") || path.startsWith("/p/merge-market/")
                    || path.startsWith("/p/aefarm/") || path.startsWith("/p/coin-index/")
                    || path.startsWith("/p/sharer-msite/"));
        } catch (IllegalArgumentException ex) {
            return false;
        }
    }

    private static Map<?, ?> map(Object value) {
        return value instanceof Map<?, ?> ? (Map<?, ?>) value : null;
    }
}
