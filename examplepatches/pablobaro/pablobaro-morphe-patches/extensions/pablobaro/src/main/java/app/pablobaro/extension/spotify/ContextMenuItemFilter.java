package app.pablobaro.extension.spotify;

import java.util.ArrayList;
import java.util.List;

/**
 * Removes premium upsell entries from the item list of a context menu.
 */
final class ContextMenuItemFilter {
    private ContextMenuItemFilter() {
    }

    interface UpsellCheck {
        boolean isPremiumUpsell(Object item) throws Exception;
    }

    /**
     * @return The items without the premium upsells, or {@code items} itself if none was found.
     * Null items are kept as they are.
     * @throws Exception If {@code check} fails for any item.
     */
    static <T> List<T> withoutPremiumUpsells(List<T> items, UpsellCheck check) throws Exception {
        if (items == null || items.isEmpty()) return items;

        List<T> filtered = new ArrayList<>(items.size());
        for (T item : items) {
            if (item != null && check.isPremiumUpsell(item)) continue;
            filtered.add(item);
        }
        return filtered.size() == items.size() ? items : filtered;
    }
}
