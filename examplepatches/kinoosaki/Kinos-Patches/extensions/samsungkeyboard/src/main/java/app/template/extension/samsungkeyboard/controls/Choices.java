package app.template.extension.samsungkeyboard.controls;

import app.template.extension.hevalcontrols.HevalSettings;

/**
 * The number choices of Patch settings. A choice is a group of switches that share a title (the screen shows them as one
 * row with "Normal" plus one entry per value); each switch here stands for one value, and "Normal" is every switch off.
 * Every answer falls back to the keyboard's own value (or -1 for "none chosen") when no switch is on, when Patch settings
 * is paused or in safe mode, and on any error, so the stock code always stays reachable.
 *
 * The ids and values must match the registry written by the patches (samsungkeyboard/features/FeaturePatches.kt).
 */
@SuppressWarnings("unused")
public final class Choices {
    static final String CLIPBOARD_SIZE_PREFIX = "samsungkeyboard.clipboard_size_";
    static final String CLIPBOARD_COLUMNS_PREFIX = "samsungkeyboard.clipboard_columns_";
    static final String TOOLBAR_ITEMS_PREFIX = "samsungkeyboard.toolbar_items_";

    static final int[] CLIPBOARD_SIZES = {100, 200, 500, 1000};
    static final int[] CLIPBOARD_COLUMNS = {1, 2, 3, 4, 5, 6};
    static final int[] TOOLBAR_ITEMS = {8, 9, 10, 11, 12};

    private static final String[] CLIPBOARD_SIZE_IDS = ids(CLIPBOARD_SIZE_PREFIX, CLIPBOARD_SIZES);
    private static final String[] CLIPBOARD_COLUMN_IDS = ids(CLIPBOARD_COLUMNS_PREFIX, CLIPBOARD_COLUMNS);
    private static final String[] TOOLBAR_ITEM_IDS = ids(TOOLBAR_ITEMS_PREFIX, TOOLBAR_ITEMS);

    /**
     * The clipboard history cap, passed through where the keyboard's class initializer stores it. [stock] is the
     * keyboard's own value, kept while no size is chosen. [extra] is the patch's Manager size when it is not one of
     * CLIPBOARD_SIZES (0 otherwise); its switch has the id prefix + extra, and the patch passes it in because that id
     * cannot be listed here.
     */
    public static int clipboardCap(int stock, int extra) {
        int result = chosen(CLIPBOARD_SIZE_IDS, CLIPBOARD_SIZES, -1);
        if (result >= 0) return result;
        if (extra > 0 && isOn(CLIPBOARD_SIZE_PREFIX + extra)) return extra;
        return stock;
    }

    /** The clipboard panel's column count, or -1 for the keyboard's own. */
    public static int clipboardColumns() {
        return chosen(CLIPBOARD_COLUMN_IDS, CLIPBOARD_COLUMNS, -1);
    }

    /**
     * How many items the toolbar's top row holds. The keyboard answers 7 or 8 in the normal modes and 4 in the small
     * ones; only 7 and 8 become the chosen count, whatever else it answers stays.
     */
    public static int toolbarItems(int stock) {
        if (stock != 7 && stock != 8) return stock;
        return chosen(TOOLBAR_ITEM_IDS, TOOLBAR_ITEMS, stock);
    }

    private static boolean isOn(String id) {
        try {
            return HevalSettings.isEnabled(id);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static int chosen(String[] ids, int[] values, int stock) {
        try {
            for (int i = 0; i < ids.length; i++) {
                if (HevalSettings.isEnabled(ids[i])) return values[i];
            }
        } catch (Throwable ignored) {
            // Stock behaviour on any error.
        }
        return stock;
    }

    private static String[] ids(String prefix, int[] values) {
        String[] ids = new String[values.length];
        for (int i = 0; i < values.length; i++) ids[i] = prefix + values[i];
        return ids;
    }

    private Choices() { }
}
