/*
 * Copyright (C) 2026 johninnl
 * SPDX-License-Identifier: GPL-3.0-only
 */
package nl.johninnl.aliexpress;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/** Filter final native view models, including restored AHE snapshot models. */
@SuppressWarnings("unused")
public final class RenderedItems {
    private RenderedItems() { }

    public static List<?> filterIfEnabled(List<?> source) {
        return filter(source, PatchSettings.removeSponsoredItems(), PatchSettings.removePromotionsAndGames());
    }

    public static List<?> filterSectionsIfEnabled(List<?> source) {
        return filterSections(source, PatchSettings.removeSponsoredItems(), PatchSettings.removePromotionsAndGames());
    }

    public static Object filterOneIfEnabled(Object item) {
        return filterOne(item, PatchSettings.removeSponsoredItems(), PatchSettings.removePromotionsAndGames());
    }

    static Object filterOne(Object item, boolean sponsored, boolean promotions) {
        return ContentFilter.removeProductModel(itemData(item), productData(item), itemName(item),
                sponsored && isPaid(item), sponsored, promotions) ? null : item;
    }

    static List<?> filter(List<?> source, boolean sponsored, boolean promotions) {
        if (source == null || (!sponsored && !promotions)) return source;
        ArrayList<Object> filtered = null;
        for (int index = 0; index < source.size(); index++) {
            Object item = source.get(index);
            Map<?, ?> data = itemData(item);
            Map<?, ?> product = productData(item);
            if (ContentFilter.removeProductModel(data, product, itemName(item),
                    sponsored && isPaid(item), sponsored, promotions)) {
                if (filtered == null) filtered = new ArrayList<>(source.subList(0, index));
            } else if (filtered != null) {
                filtered.add(item);
            }
        }
        return filtered == null ? source : filtered;
    }

    static List<?> filterSections(List<?> source, boolean sponsored, boolean promotions) {
        if (source == null || (!sponsored && !promotions)) return source;
        ArrayList<Object> filtered = null;
        for (int index = 0; index < source.size(); index++) {
            Object section = source.get(index);
            Object result = section instanceof List<?> ? filter((List<?>) section, sponsored, promotions) : section;
            if (result != section && filtered == null) filtered = new ArrayList<>(source.subList(0, index));
            if (filtered != null) filtered.add(result);
        }
        return filtered == null ? source : filtered;
    }

    // The patch binds exported IAncItemModel and IDMComponent getters for the checked APK.
    private static Map<?, ?> itemData(Object item) {
        return item instanceof Map<?, ?> ? (Map<?, ?>) item : null;
    }

    private static Map<?, ?> productData(Object item) {
        return null;
    }

    private static boolean isPaid(Object item) {
        return false;
    }

    private static String itemName(Object item) {
        return null;
    }
}
