package local.privacy;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/** Filters only the verified DC Inside home adapter item types. */
public final class HomeFilter {
    private static volatile Method typeGetter;

    private HomeFilter() { }

    public static List<?> filter(List<?> items) {
        int mask = SettingsState.homeMask();
        if (items == null || items.isEmpty() || mask == 0) return items;
        ArrayList<Object> result = null;
        int index = 0;
        for (Object item : items) {
            int type = itemType(item);
            if (hidden(type, mask)) {
                if (result == null) {
                    result = new ArrayList<>(items.size());
                    result.addAll(items.subList(0, index));
                }
            } else if (result != null) {
                result.add(item);
            }
            index++;
        }
        return result == null ? items : result;
    }

    /** Removes only verified ad rows from the repackaged 5.3.27 home adapter. */
    public static List<?> filterAds(List<?> items) {
        if (!SettingsState.get("block_app_ad_loaders") || items == null || items.isEmpty()) return items;
        ArrayList<Object> result = null;
        int index = 0;
        for (Object item : items) {
            if (adOnly(itemType(item))) {
                if (result == null) {
                    result = new ArrayList<>(items.size());
                    result.addAll(items.subList(0, index));
                }
            } else if (result != null) {
                result.add(item);
            }
            index++;
        }
        return result == null ? items : result;
    }

    private static boolean adOnly(int type) {
        // 4 and 5 are the native ad holders. 41 and 45 are real dividers and
        // remain in the list so normal section spacing is preserved.
        return type == 4 || type == 5;
    }

    private static int itemType(Object item) {
        if (item == null) return Integer.MIN_VALUE;
        try {
            Method getter = typeGetter;
            if (getter == null || getter.getDeclaringClass() != item.getClass()) {
                getter = item.getClass().getDeclaredMethod("h");
                getter.setAccessible(true);
                typeGetter = getter;
            }
            return ((Number) getter.invoke(item)).intValue();
        } catch (ReflectiveOperationException | RuntimeException error) {
            // A changed item class must remain visible rather than breaking the home screen.
            return Integer.MIN_VALUE;
        }
    }

    private static boolean hidden(int type, int mask) {
        return (mask & 1) != 0 && type == 1
            || (mask & 2) != 0 && type == 2
            || (mask & 4) != 0 && type == 9
            || (mask & 8) != 0 && type == 3
            || (mask & 16) != 0 && (type == 50 || type == 36 || type == 37 || type == 38)
            || (mask & 32) != 0 && (type == 35 || type == 39);
    }
}
