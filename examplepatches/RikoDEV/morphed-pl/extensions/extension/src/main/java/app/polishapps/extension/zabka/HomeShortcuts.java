package app.polishapps.extension.zabka;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

/**
 * Drops chosen tiles from the tile lists of the home service and option tile sections. The tile classes
 * are obfuscated, so a tile is matched by reading its String fields (title, id, link, badge): it is hidden
 * when any of them contains one of the words from the patch option.
 */
@SuppressWarnings("unused")
public final class HomeShortcuts {

    private static List<String> words;

    private HomeShortcuts() {
    }

    /** Replaced by the patch with the comma separated words from its "Tiles to hide" option. */
    private static String hidden() {
        return "";
    }

    public static void hide(ArrayList<?> tiles) {
        if (tiles == null) return;
        List<String> hidden = words();
        if (hidden.isEmpty()) return;
        Iterator<?> iterator = tiles.iterator();
        while (iterator.hasNext()) {
            if (matches(iterator.next(), hidden)) iterator.remove();
        }
    }

    private static synchronized List<String> words() {
        if (words == null) {
            List<String> parsed = new ArrayList<>();
            for (String word : hidden().split("[,;\\n]")) {
                String trimmed = word.trim().toLowerCase(Locale.ROOT);
                if (!trimmed.isEmpty()) parsed.add(trimmed);
            }
            words = parsed;
        }
        return words;
    }

    private static boolean matches(Object tile, List<String> hidden) {
        if (tile == null) return false;
        try {
            for (Field field : tile.getClass().getDeclaredFields()) {
                if (field.getType() != String.class) continue;
                field.setAccessible(true);
                String value = (String) field.get(tile);
                if (value == null) continue;
                String lower = value.toLowerCase(Locale.ROOT);
                for (String word : hidden) {
                    if (lower.contains(word)) return true;
                }
            }
        } catch (Throwable ignored) {
            // Keep the tile if it cannot be inspected.
        }
        return false;
    }
}
