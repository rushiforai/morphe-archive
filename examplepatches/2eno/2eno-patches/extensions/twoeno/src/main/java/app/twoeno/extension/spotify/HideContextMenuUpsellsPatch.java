package app.twoeno.extension.spotify;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import app.twoeno.extension.shared.Logger;
import app.twoeno.extension.shared.Reflection;

/**
 * Removes "Premium" upsell entries from context menus (long press menus of songs, albums, ...).
 */
@SuppressWarnings("unused")
public final class HideContextMenuUpsellsPatch {
    private HideContextMenuUpsellsPatch() {
    }

    /**
     * Replaced by the bytecode patch with a read of the {@code isPremiumUpsell} field of the item view model.
     */
    private static boolean isPremiumUpsell(Object viewModel) {
        return false;
    }

    /**
     * Injection point: List parameter of the {@code ContextMenuViewModel} constructor.
     */
    public static List<?> filterContextMenuItems(List<?> items) {
        return filterContextMenuItems(items, null);
    }

    /**
     * @param isPremiumUpsell The {@code isPremiumUpsell} field of the item view model,
     *                        or null if {@link #isPremiumUpsell(Object)} was patched instead.
     */
    public static List<?> filterContextMenuItems(List<?> items, Field isPremiumUpsell) {
        if (items == null || items.isEmpty()) return items;

        try {
            List<Object> filtered = new ArrayList<>(items.size());
            for (Object item : items) {
                Object viewModel = item == null ? null : Reflection.call(item, "getViewModel");
                if (viewModel != null) {
                    boolean isUpsell = isPremiumUpsell != null
                            ? isPremiumUpsell.getBoolean(viewModel)
                            : isPremiumUpsell(viewModel);
                    if (isUpsell) continue;
                }
                filtered.add(item);
            }
            return filtered;
        } catch (Throwable ex) {
            Logger.error("filterContextMenuItems failure", ex);
            return items;
        }
    }
}
