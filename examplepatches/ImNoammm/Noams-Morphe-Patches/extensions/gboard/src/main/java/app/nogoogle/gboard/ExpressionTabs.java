package app.nogoogle.gboard;

import app.nogoogle.gboard.gif.GifBridge;

/**
 * The expression panel's tabs come from Gboard's "enabled_expression_keyboard_types" flag (a comma
 * list): the GIF tab stays only once a GIF source is set in No-Google settings, the sticker tab
 * (Google servers) unless it is hidden there; a hidden sticker tab also leaves the toolbar.
 */
public final class ExpressionTabs {
    static final String FLAG = "enabled_expression_keyboard_types";
    private static final String GIF = "gif_search_result";
    private static final String STICKER = "sticker_search_result";
    private static final String STICKER_ACCESS_POINT = "sticker"; // its toolbar item id

    private ExpressionTabs() {
    }

    /**
     * Patched over the ids of the toolbar's items (read once per keyboard start): no sticker item while
     * the sticker tab is hidden.
     */
    public static String[] accessPoints(String[] ids) {
        if (ids == null || !FlagOverrides.onlineRules || !NoGoogleSettings.bool(NoGoogleSettings.HIDE_STICKER_TAB)) {
            return ids;
        }
        java.util.List<String> kept = new java.util.ArrayList<>(ids.length);
        for (String id : ids) if (!STICKER_ACCESS_POINT.equals(id)) kept.add(id);
        return kept.size() == ids.length ? ids : kept.toArray(new String[0]);
    }

    static String filter(String types) {
        boolean hideGif = !GifBridge.enabled();
        boolean hideSticker = NoGoogleSettings.bool(NoGoogleSettings.HIDE_STICKER_TAB);
        if (!hideGif && !hideSticker) return types;
        StringBuilder kept = new StringBuilder();
        for (String t : types.split(",")) {
            String type = t.trim();
            if (type.isEmpty() || (hideGif && type.equals(GIF)) || (hideSticker && type.equals(STICKER))) continue;
            if (kept.length() > 0) kept.append(',');
            kept.append(type);
        }
        return kept.toString();
    }
}
