package app.template.extension.extension;

import java.util.ArrayList;
import java.util.List;

/**
 * Removes "Premium" upsell entries from context menus (long-press menus of
 * songs, albums, playlists, ...).
 */
@SuppressWarnings("unused")
public final class SpotifyContextMenuFilter {
    private SpotifyContextMenuFilter() {
    }

    interface UpsellCheck {
        boolean isPremiumUpsell(Object item) throws Exception;
    }

    /**
     * Replaced by the bytecode patch with a check of the context menu item,
     * because the getters and fields it reads are obfuscated.
     */
    private static boolean isPremiumUpsell(Object item) {
        return false;
    }

    /**
     * Injection point: List parameter of the {@code ContextMenuViewModel}
     * constructor.
     */
    public static List<?> filterContextMenuItems(List<?> items) {
        try {
            return withoutPremiumUpsells(items, SpotifyContextMenuFilter::isPremiumUpsell);
        } catch (Throwable ignored) {
            // A failed check keeps the stock menu.
            return items;
        }
    }

    /**
     * @return The items without the premium upsells, or {@code items} itself if
     * none was found. Null items are kept as they are.
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
