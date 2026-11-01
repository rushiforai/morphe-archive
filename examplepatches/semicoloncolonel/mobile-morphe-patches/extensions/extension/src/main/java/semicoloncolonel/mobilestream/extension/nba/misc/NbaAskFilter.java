package semicoloncolonel.mobilestream.extension.nba.misc;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Removes the Ask NBA tile from server-driven menus such as the Discover tab.
 *
 * Menus arrive as com.nba.base.model.MenuItem lists. Each item has a "text"
 * label and an "href" (MenuInfo) whose "url" is a deep link. Ask NBA links
 * use the "asknba" host. The JSON field names survive R8 because Moshi reads
 * them, so they are read here by name.
 */
@SuppressWarnings("unused")
public final class NbaAskFilter {
    private NbaAskFilter() {
    }

    /** Called from MenuItem's constructor with its children list. */
    public static List<?> filterMenu(List<?> items) {
        if (items == null || items.isEmpty()) return items;
        List<Object> kept = null;
        for (int i = 0; i < items.size(); i++) {
            Object item = items.get(i);
            if (isAskNba(item)) {
                if (kept == null) kept = new ArrayList<>(items.subList(0, i));
            } else if (kept != null) {
                kept.add(item);
            }
        }
        return kept == null ? items : kept;
    }

    private static boolean isAskNba(Object item) {
        try {
            Object text = read(item, "text");
            if (text instanceof String && ((String) text).trim().toLowerCase(Locale.US).startsWith("ask nba")) {
                return true;
            }
            Object href = read(item, "href");
            Object url = href == null ? null : read(href, "url");
            if (url instanceof String) {
                String link = ((String) url).toLowerCase(Locale.US);
                return link.contains("asknba") || link.contains("ask-nba");
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static Object read(Object target, String name) throws Exception {
        Field field = target.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(target);
    }
}
