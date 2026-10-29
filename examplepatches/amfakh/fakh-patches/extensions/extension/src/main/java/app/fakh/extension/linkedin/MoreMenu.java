package app.fakh.extension.linkedin;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Lets each item of LinkedIn's "More" tab (Puzzle games, Groups, Events, Newsletters, ...) be hidden, and
 * optionally moves the items to the bottom of the native "Me" panel, above "Settings & Privacy", removing the tab.
 *
 * The items differ by region, so the ones the server sends on the More screen are remembered; until that
 * screen has been seen, the items known from 4.1.1264 are used.
 */
@SuppressWarnings("unused")
public final class MoreMenu {
    static final String MORE_SCREEN = "com.linkedin.sdui.impl.homenav.moreScreenContent";
    /** Tracking name of each item on the More screen, followed by its id. */
    private static final String ITEM_PREFIX = "nav-more-";
    private static final String LINK_PREFIX = "https://www.linkedin.com/";

    /** One More item: id from its tracking name, label and destination. */
    static final class Item {
        final String id;
        final String label;
        final String url;

        Item(String id, String label, String url) {
            this.id = id;
            this.label = label;
            this.url = url;
        }

        /** Preference key of the item's switch. */
        String key() {
            return Settings.MORE_ITEM_PREFIX + id;
        }
    }

    private static final Item[] DEFAULT_ITEMS = {
            new Item("games", "Puzzle games", "https://www.linkedin.com/games/"),
            new Item("groups", "Groups", "https://www.linkedin.com/groups/"),
            new Item("events", "Events", "https://www.linkedin.com/events/"),
            new Item("newsletters", "Newsletters", "https://www.linkedin.com/mynetwork/network-manager/newsletters/"),
    };

    private MoreMenu() {
    }

    /** The More items: the ones last seen on the More screen, or the defaults. */
    static List<Item> items() {
        List<Item> items = new ArrayList<>();
        try {
            String saved = Settings.getString(Settings.MORE_ITEMS, null);
            if (saved != null) {
                JSONArray array = new JSONArray(saved);
                for (int i = 0; i < array.length(); i++) {
                    JSONObject o = array.getJSONObject(i);
                    items.add(new Item(o.getString("id"), o.getString("label"), o.getString("url")));
                }
            }
        } catch (Exception e) {
            Diagnostics.error("more items unreadable", e);
            items.clear();
        }
        if (items.isEmpty()) Collections.addAll(items, DEFAULT_ITEMS);
        return items;
    }

    /** Items for the Me panel: none unless the items are moved there, then the ones not hidden. */
    private static List<Item> shownItems() {
        List<Item> shown = new ArrayList<>();
        if (!Settings.hideMoreTab()) return shown;
        for (Item item : items()) if (Settings.get(item.key(), true)) shown.add(item);
        return shown;
    }

    /** Called with the view name of every SDUI component: true for a hidden item row of the More screen. */
    static boolean hideItem(String viewName) {
        if (!Settings.moreMenu() || !viewName.startsWith(ITEM_PREFIX)) return false;
        return !Settings.get(Settings.MORE_ITEM_PREFIX + viewName.substring(ITEM_PREFIX.length()), true);
    }

    // region More screen

    /**
     * Called with the More screen component: remembers its items. Each item carries its link,
     * then its tracking name (nav-more-<id>), then its label.
     */
    static void capture(byte[] payload) {
        if (!Settings.isMoreMenuIncluded() || payload == null) return;
        List<String> strings = ProtoScanner.scan(payload).strings;
        JSONArray array = new JSONArray();
        String url = null;
        for (int i = 0; i < strings.size(); i++) {
            String s = strings.get(i);
            if (s.startsWith(LINK_PREFIX)) url = s;
            if (!s.startsWith(ITEM_PREFIX) || url == null) continue;
            String label = null;
            for (int j = i + 1; j < strings.size() && label == null; j++) {
                String next = strings.get(j);
                if (!next.isEmpty() && !next.endsWith("==") && !next.startsWith(ITEM_PREFIX)) label = next;
            }
            if (label == null) continue;
            try {
                array.put(new JSONObject().put("id", s.substring(ITEM_PREFIX.length())).put("label", label).put("url", url));
            } catch (Exception ignored) {
            }
            url = null;
        }
        if (array.length() == 0) return;
        String json = array.toString();
        if (!json.equals(Settings.getString(Settings.MORE_ITEMS, null))) {
            Settings.setString(Settings.MORE_ITEMS, json);
            Settings.debugLog("more items: " + json);
        }
    }

    // endregion

    // region Bottom bar

    /** Injected at the returns of HomeNavTabsManager.getHomeNavTabs(): drops the More tab when it is hidden. */
    public static List<Object> filterTabs(List<Object> tabs) {
        if (tabs == null || !Settings.hideMoreTab()) return tabs;
        try {
            Object more = Class.forName("com.linkedin.android.home.HomeTabInfo").getField("MORE").get(null);
            if (!tabs.contains(more)) return tabs;
            List<Object> result = new ArrayList<>(tabs);
            result.remove(more);
            return result;
        } catch (Throwable t) {
            Diagnostics.error("filterTabs failed", t);
            return tabs;
        }
    }

    // endregion

    // region Me panel

    private static final String PACKAGE = "com.linkedin.android.home.navpanel.";

    /**
     * Injected after HomeNavPanelFeature puts the divider in the list at the bottom of the Me panel (the divider,
     * then "Settings & Privacy"): adds the items as sections, like "Saved posts", above the divider.
     */
    public static void addToFooter(Object list) {
        List<Item> shown = shownItems();
        if (list == null || shown.isEmpty()) return;
        try {
            Class<?> viewData = Class.forName(PACKAGE + "HomeNavPanelSectionV2ViewData");
            Object savedPosts = Class.forName(PACKAGE + "SectionType").getField("SAVED_POSTS").get(null);
            Object chevronRight = Class.forName(PACKAGE + "HomeNavPanelSectionChevronType").getField("RIGHT").get(null);
            Method addItem = list.getClass().getMethod("addItem", int.class, Object.class);
            for (int i = 0; i < shown.size(); i++) {
                addItem.invoke(list, i, newSection(viewData, shown.get(i).label, savedPosts, chevronRight));
            }
        } catch (Throwable t) {
            Diagnostics.error("addToFooter failed", t);
        }
    }

    /**
     * Builds a section through whichever constructor this LinkedIn build has: a String title, SectionType and
     * ChevronType, followed by lists, ints and booleans that are left empty.
     */
    private static Object newSection(Class<?> viewData, String title, Object sectionType, Object chevron)
            throws Exception {
        for (Constructor<?> constructor : viewData.getConstructors()) {
            Class<?>[] types = constructor.getParameterTypes();
            if (types.length < 3 || !types[0].isAssignableFrom(String.class)
                    || !types[1].isInstance(sectionType) || !types[2].isInstance(chevron)) continue;
            Object[] args = new Object[types.length];
            args[0] = title;
            args[1] = sectionType;
            args[2] = chevron;
            for (int i = 3; i < types.length; i++) {
                if (types[i] == List.class) args[i] = Collections.emptyList();
                else if (types[i] == int.class) args[i] = 0;
                else if (types[i] == boolean.class) args[i] = false;
            }
            return constructor.newInstance(args);
        }
        throw new NoSuchMethodException(viewData.getName() + ".<init>(title, SectionType, ChevronType, ...)");
    }

    /**
     * Injected before every return of HomeNavPanelSectionV2Presenter.onBind(ViewDataBinding): opens the item, and
     * puts its icon before the title, since the panel's sections have no icon of their own.
     */
    public static void onSectionBind(Object presenter, Object binding) {
        try {
            Object viewData = Reflect.get(presenter, "viewData");
            String title = String.valueOf(Reflect.get(viewData, "title"));
            Object root = binding.getClass().getMethod("getRoot").invoke(binding);
            Item match = null;
            for (Item item : shownItems()) if (item.label.equals(title)) match = item;
            // Section views are recycled, so a view that showed an item's icon gets it cleared.
            if (root instanceof View) setIcon((View) root, match);
            if (root instanceof View && match != null) setMargins((View) root);
            if (match == null) return;
            String url = match.url;
            View.OnClickListener open = v -> open(v.getContext(), url);
            Field field = Reflect.field(presenter.getClass(), "sectionHeaderClickListener");
            if (field != null) field.set(presenter, open);
        } catch (Throwable t) {
            Diagnostics.error("onSectionBind failed", t);
        }
    }

    /** Draws the item's icon at the start of its title, in the title's color; null removes an icon set before. */
    private static void setIcon(View root, Item item) {
        int id = root.getResources().getIdentifier("title", "id", root.getContext().getPackageName());
        View view = id == 0 ? null : root.findViewById(id);
        if (!(view instanceof TextView)) return;
        TextView title = (TextView) view;
        if (item == null) {
            if (title.getCompoundDrawablesRelative()[0] instanceof IconDrawable) {
                title.setCompoundDrawablesRelative(null, null, null, null);
            }
            return;
        }
        float density = root.getResources().getDisplayMetrics().density;
        IconDrawable icon = new IconDrawable(icon(item.id), title.getCurrentTextColor());
        icon.setBounds(0, 0, (int) (24 * density), (int) (24 * density));
        title.setCompoundDrawablesRelative(icon, null, null, null);
        title.setCompoundDrawablePadding((int) (16 * density));
    }

    /**
     * The footer list has no spacing of its own, unlike the list above it, so the item cards get the margins of the
     * cards there ("Saved posts"): 17dp at the sides and 16dp between cards.
     */
    private static void setMargins(View root) {
        if (!(root.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return;
        ViewGroup.MarginLayoutParams params = (ViewGroup.MarginLayoutParams) root.getLayoutParams();
        float density = root.getResources().getDisplayMetrics().density;
        int side = Math.round(17 * density);
        params.setMarginStart(side);
        params.setMarginEnd(side);
        params.bottomMargin = Math.round(16 * density);
        root.setLayoutParams(params);
    }

    private static String icon(String id) {
        switch (id) {
            case "games":
                return IconDrawable.PUZZLE;
            case "groups":
                return IconDrawable.GROUPS;
            case "events":
                return IconDrawable.EVENTS;
            case "newsletters":
                return IconDrawable.ARTICLE;
            default:
                return IconDrawable.APPS;
        }
    }

    /** Opens a linkedin.com link inside LinkedIn, the way its own deep links are handled. */
    private static void open(Context context, String url) {
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url)).setPackage(context.getPackageName());
        if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }

    // endregion
}
