package app.windowshopper.extension.meesho;

import android.app.Activity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

final class NavTabs {
    private static final String LISTENER_TAG = "window-shopper-nav-tabs";
    private static final Set<MenuItem> hidden = Collections.newSetFromMap(new WeakHashMap<>());

    private NavTabs() {}

    static void apply(Activity activity) {
        if (!Unclutter.hideNavTabs()) return;
        try {
            int id = activity.getResources().getIdentifier("bottom_navigation", "id", activity.getPackageName());
            View bar = id == 0 ? null : activity.findViewById(id);
            if (bar == null) return;
            Menu menu = menu(bar);
            if (menu == null) throw new IllegalStateException("Bottom navigation menu not found");
            update(menu);
            if (bar.getTag(id) == null) {
                bar.setTag(id, LISTENER_TAG);
                bar.addOnLayoutChangeListener((view, l, t, r, b, ol, ot, or, ob) -> update(menu));
            }
        } catch (IllegalAccessException | IllegalStateException error) {
            Log.e("WindowShopper", "Cannot update bottom navigation tabs", error);
        }
    }

    // ponytail: matches English tab titles; add item-id matching if Meesho localizes this bar.
    private static void update(Menu menu) {
        for (int i = 0; i < menu.size(); i++) {
            MenuItem item = menu.getItem(i);
            Settings.Feature feature = feature(String.valueOf(item.getTitle()));
            if (feature == null) continue;
            boolean hide = Settings.enabled(feature);
            if (hide && item.isVisible()) {
                hidden.add(item);
                item.setVisible(false);
            } else if (!hide && hidden.remove(item)) {
                item.setVisible(true);
            }
        }
    }

    static Settings.Feature feature(String title) {
        switch (title.trim().toLowerCase(java.util.Locale.ROOT)) {
            case "categories": return Settings.Feature.NAV_CATEGORIES;
            case "mall": return Settings.Feature.NAV_MALL;
            case "video finds": return Settings.Feature.NAV_VIDEO;
            default: return null;
        }
    }

    private static Menu menu(View bar) throws IllegalAccessException {
        for (Class<?> type = bar.getClass(); type != null && type != View.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (!Menu.class.isAssignableFrom(field.getType())) continue;
                field.setAccessible(true);
                Object value = field.get(bar);
                if (value != null) return (Menu) value;
            }
        }
        if (bar instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) bar;
            for (int i = 0; i < group.getChildCount(); i++) {
                Menu menu = menu(group.getChildAt(i));
                if (menu != null) return menu;
            }
        }
        return null;
    }
}
