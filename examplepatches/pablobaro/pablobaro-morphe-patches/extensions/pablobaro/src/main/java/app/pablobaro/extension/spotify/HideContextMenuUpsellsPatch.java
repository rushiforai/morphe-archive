package app.pablobaro.extension.spotify;

import java.util.List;

import app.pablobaro.extension.shared.Logger;

/**
 * Removes "Premium" upsell entries from context menus (long press menus of songs, albums, ...).
 */
@SuppressWarnings("unused")
public final class HideContextMenuUpsellsPatch {
    private HideContextMenuUpsellsPatch() {
    }

    /**
     * Replaced by the bytecode patch with a check of the context menu item,
     * because the getters and fields it reads are obfuscated.
     */
    private static boolean isPremiumUpsell(Object item) {
        return false;
    }

    /**
     * Injection point: List parameter of the {@code ContextMenuViewModel} constructor.
     */
    public static List<?> filterContextMenuItems(List<?> items) {
        try {
            return ContextMenuItemFilter.withoutPremiumUpsells(items, HideContextMenuUpsellsPatch::isPremiumUpsell);
        } catch (Throwable ex) {
            Logger.error("filterContextMenuItems failure", ex);
            return items;
        }
    }
}
