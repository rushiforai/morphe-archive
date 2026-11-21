package app.windowshopper.extension.meesho;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

final class NavTabs {
    static final int MAX = 5;
    private static final String ACCOUNT = "action_account";
    private static final Map<Menu, Map<Integer, Tab>> stock = new WeakHashMap<>();

    private static final class Tab {
        CharSequence title;
        Drawable icon;
        Tab(CharSequence title, Drawable icon) { this.title = title; this.icon = icon; }
    }

    private NavTabs() {}

    static void apply(Activity activity) {
        if (!Unclutter.hideNavTabs()) return;
        try {
            int id = activity.getResources().getIdentifier("bottom_navigation", "id", activity.getPackageName());
            View bar = id == 0 ? null : activity.findViewById(id);
            if (bar == null) return;
            Menu menu = menu(bar);
            if (menu == null) throw new IllegalStateException("Bottom navigation menu not found");
            update(activity, bar, menu);
            if (bar.getTag(id) == null) {
                bar.setTag(id, "window-shopper-nav-tabs");
                activity.getWindow().getDecorView().getViewTreeObserver()
                    .addOnGlobalLayoutListener(() -> update(activity, bar, menu));
            }
        } catch (IllegalAccessException | RuntimeException error) {
            Log.e("WindowShopper", "Cannot update bottom navigation tabs", error);
        }
    }

    private static void update(Activity activity, View bar, Menu menu) {
        Resources res = activity.getResources();
        String pkg = activity.getPackageName();
        View header = activity.findViewById(res.getIdentifier("header_layout", "id", pkg));
        if (header != null && Settings.enabled(Settings.Feature.HEADER_ACCOUNT)) header.setVisibility(View.GONE);
        Map<Integer, Tab> tabs = stock.get(menu);
        if (tabs == null) stock.put(menu, tabs = new LinkedHashMap<>());
        for (int i = 0; i < menu.size(); i++) {
            MenuItem item = menu.getItem(i);
            if (!item.isVisible()) continue;
            Tab tab = tabs.get(item.getItemId());
            if (tab == null) tabs.put(item.getItemId(), new Tab(item.getTitle(), item.getIcon()));
            else { tab.title = item.getTitle(); tab.icon = item.getIcon(); }
        }
        int accountId = res.getIdentifier(ACCOUNT, "id", pkg);
        if (!tabs.containsKey(accountId)) tabs.put(accountId, new Tab(res.getString(
            res.getIdentifier("account", "string", pkg)), activity.getDrawable(
            res.getIdentifier("menu_account_selector", "drawable", pkg))));
        LinkedHashMap<String, String> known = new LinkedHashMap<>();
        for (Map.Entry<Integer, Tab> tab : tabs.entrySet()) {
            known.put(res.getResourceEntryName(tab.getKey()), String.valueOf(tab.getValue().title));
        }
        Settings.rememberTabs(known);

        List<Integer> wanted = new ArrayList<>();
        for (String name : Settings.tabs()) {
            int tabId = res.getIdentifier(name, "id", pkg);
            if (tabs.containsKey(tabId) && wanted.size() < MAX) wanted.add(tabId);
        }
        if (!wanted.isEmpty() && !wanted.equals(ids(menu))) {
            int checked = 0;
            for (int i = 0; i < menu.size(); i++) if (menu.getItem(i).isChecked()) checked = menu.getItem(i).getItemId();
            // Removing first keeps BottomNavigationView under its 5-item cap.
            for (int tabId : ids(menu)) menu.removeItem(tabId);
            for (int i = 0; i < wanted.size(); i++) {
                Tab tab = tabs.get(wanted.get(i));
                MenuItem item = menu.add(Menu.NONE, wanted.get(i), i, tab.title).setIcon(tab.icon).setCheckable(true);
                if (wanted.get(i) == checked) item.setChecked(true);
            }
        }
        View tab = bar.findViewById(accountId);
        if (tab != null) tab.setOnClickListener(v -> activity.startActivity(new Intent()
            .setClassName(activity, "com.meesho.account.impl.AccountActivity")));
    }

    private static List<Integer> ids(Menu menu) {
        Integer[] ids = new Integer[menu.size()];
        for (int i = 0; i < ids.length; i++) ids[i] = menu.getItem(i).getItemId();
        return Arrays.asList(ids);
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
