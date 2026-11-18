package nl.johninnl.spotify;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Filters premium-only rows out of Spotify's context menu view model.
 * <p>
 * The row model keeps a stable analytics id in its first string field. Download and Jam rows use
 * those ids regardless of the account's current state (download vs remove download), so filtering
 * here removes both variants without touching playlist, album or track actions.
 */
@SuppressWarnings("unused")
public final class ContextMenuFilter {
    private static final Set<String> HIDDEN_IDS = new HashSet<>(Arrays.asList(
            "list_download_item",
            "start_jam",
            "list_start_jam",
            "create_menu_start_new_jam",
            "invite_friends_to_jam_row",
            "jam"
    ));

    /** Title resource ids for the same rows, used when the id field is not a stable string. */
    private static final Set<Integer> HIDDEN_TITLES = new HashSet<>(Arrays.asList(
            0x7f130aaa, // context_menu_download
            0x7f130aab, // context_menu_download_artist
            0x7f130ac5, // context_menu_offline_download
            0x7f1312da, // group_session_context_menu_start
            0x7f1312db, // group_session_context_menu_start_disabled
            0x7f131560  // label_start_a_jam
    ));

    private ContextMenuFilter() {
    }

    /**
     * Injection point: the item list of {@code ContextMenuViewModel}.
     */
    public static List filter(List items) {
        if (items == null) return null;

        List<Object> visible = new ArrayList<>(items.size());
        for (Object item : items) {
            String id = idOf(item);
            boolean hidden = id != null && HIDDEN_IDS.contains(id);
            if (!hidden) hidden = hasHiddenTitle(item);
            if (!hidden) visible.add(item);
        }
        return visible;
    }

    private static boolean hasHiddenTitle(Object item) {
        if (item == null) return false;
        for (Class<?> type = item.getClass(); type != null; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (field.getType() != int.class && field.getType() != Integer.class) continue;
                try {
                    field.setAccessible(true);
                    Object value = field.get(item);
                    if (value instanceof Integer && HIDDEN_TITLES.contains(value)) return true;
                } catch (Throwable ignored) {
                    // Keep looking.
                }
            }
        }
        return false;
    }

    private static String idOf(Object item) {
        if (item == null) return null;
        try {
            Field id = item.getClass().getField("a");
            Object value = id.get(item);
            return value instanceof String ? (String) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }
}
