package dev.rikunode.settings;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.drawable.Drawable;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Reorders and hides the original drawer entries without changing their destinations. */
public final class HoshioriDrawerBridge {
    static final String ORDER = "drawer_order";
    static final String HIDDEN = "drawer_hidden";
    private HoshioriDrawerBridge() {}

    static final class Item {
        final int id, group, initial;
        final CharSequence title;
        final Drawable icon;
        final boolean checkable, checked, enabled;
        Item(MenuItem item, int initial) {
            id = item.getItemId();
            group = item.getGroupId();
            this.initial = initial;
            title = item.getTitle();
            icon = item.getIcon();
            checkable = item.isCheckable();
            checked = item.isChecked();
            enabled = item.isEnabled();
        }
    }

    static int configId(Context context) {
        return context.getResources().getIdentifier("nav_config", "id", context.getPackageName());
    }

    static List<Integer> savedOrder(SharedPreferences prefs) {
        String value = prefs.getString(ORDER, "");
        List<Integer> order = new ArrayList<>();
        if (value == null) return order;
        for (String part : value.split(",")) {
            try { order.add(Integer.parseInt(part)); }
            catch (NumberFormatException ignored) { /* stale or damaged entry */ }
        }
        return order;
    }

    static List<Item> sort(List<Item> items, SharedPreferences prefs) {
        final List<Integer> order = savedOrder(prefs);
        final Map<Integer, Integer> rank = new HashMap<>();
        for (int i = 0; i < order.size(); i++) rank.put(order.get(i), i);
        final Map<Integer, Integer> groups = new HashMap<>();
        for (Item item : items) if (!groups.containsKey(item.group))
            groups.put(item.group, groups.size());
        items.sort((a, b) -> {
            int group = Integer.compare(groups.get(a.group), groups.get(b.group));
            if (group != 0) return group;
            return Integer.compare(rank.getOrDefault(a.id, 10000 + a.initial),
                    rank.getOrDefault(b.id, 10000 + b.initial));
        });
        return items;
    }

    public static void apply(Activity activity) {
        try {
            SharedPreferences prefs = activity.getSharedPreferences(
                    HoshioriSettingsActivity.STORE, Context.MODE_PRIVATE);
            if (!prefs.contains(ORDER) && !prefs.contains(HIDDEN)) return;
            int viewId = activity.getResources().getIdentifier(
                    "nav_view", "id", activity.getPackageName());
            if (viewId == 0) return;
            View drawer = activity.findViewById(viewId);
            if (drawer == null) return;
            Method getMenu = drawer.getClass().getMethod("getMenu");
            Menu menu = (Menu) getMenu.invoke(drawer);
            if (menu == null) return;
            List<Item> items = new ArrayList<>();
            for (int i = 0; i < menu.size(); i++) items.add(new Item(menu.getItem(i), i));
            if (items.isEmpty()) return;
            sort(items, prefs);
            Set<String> hidden = prefs.getStringSet(HIDDEN, Collections.emptySet());
            int configId = configId(activity);
            menu.clear();
            for (int i = 0; i < items.size(); i++) {
                Item src = items.get(i);
                MenuItem item = menu.add(src.group, src.id, i, src.title);
                if (src.icon != null) item.setIcon(src.icon);
                item.setCheckable(src.checkable);
                item.setChecked(src.checked);
                item.setEnabled(src.enabled);
                item.setVisible(src.id == configId || !hidden.contains(Integer.toString(src.id)));
            }
            // The stock menu has three single-selection groups.
            Set<Integer> groups = new HashSet<>();
            for (Item item : items) groups.add(item.group);
            for (Integer group : groups) menu.setGroupCheckable(group, true, true);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // Never prevent the stock app from opening if menu API changes.
        }
    }
}
