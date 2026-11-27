package app.unlimited.sportsnet.extension;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Puts a chosen page first among the Watch tab's sub-tabs, so the Watch tab opens on it. The
 * sub-tab is added when the app's site map has the page, or moved to the front when the server
 * already lists it.
 */
@SuppressWarnings("unused")
public final class WatchSubTabs {
    private static final String MODEL = "com.rogers.sportsnet.common.model.";
    private static final String ITEM =
            "com.rogers.sportsnet.feature.snplus.ui.host.data.NavEntryPageRouteItem";
    private static final String SITE_MAP_UTIL = "com.rogers.sportsnet.common.util.SiteMapUtil";

    private static volatile Object navigationDetails;

    private WatchSubTabs() {
    }

    /** Replaced by the patch with the sub-tab, as "Label=/path". */
    private static String firstSubTab() {
        return "";
    }

    /** Called with the navigation the Watch tab's sub-tabs are built from. */
    public static void navigation(Object details) {
        navigationDetails = details;
    }

    /** Called with the Watch tab's sub-tabs; returns them with the chosen page first. */
    public static List<?> subTabs(List<?> items) {
        try {
            String[] setting = firstSubTab().split("=", 2);
            if (setting.length != 2 || items == null) return items;
            String label = setting[0].trim();
            String path = setting[1].trim();

            List<Object> result = new ArrayList<>(items);
            StringBuilder found = new StringBuilder();
            for (Object item : result) {
                Object entry = field(item, "navEntry");
                found.append(field(entry, "label")).append('=').append(field(entry, "path")).append(' ');
            }
            Logger.info("Watch sub-tabs: " + found + "(want " + label + "=" + path + ")");
            for (int i = 0; i < result.size(); i++) {
                Object entry = field(result.get(i), "navEntry");
                if (path.equalsIgnoreCase(String.valueOf(field(entry, "path")))) {
                    result.add(0, result.remove(i));
                    Logger.info("Moved Watch sub-tab " + path + " to the front");
                    return result;
                }
            }

            Object details = navigationDetails;
            if (details == null) return items;
            Object siteMap = field(details, "sitemap");
            Class<?> siteMapUtil = Class.forName(SITE_MAP_UTIL);
            Object route = siteMapUtil.getMethod("getPageRoute", List.class, String.class)
                    .invoke(siteMapUtil.getField("INSTANCE").get(null), siteMap, path);
            if (route == null) {
                Logger.info("Watch sub-tab " + path + " is not in the site map");
                return items;
            }

            int depth = result.isEmpty() ? 0 : (Integer) field(field(result.get(0), "navEntry"), "depth");
            Class<?> navEntryClass = Class.forName(MODEL + "NavEntry");
            Constructor<?> navEntryConstructor = navEntryClass.getConstructor(int.class, String.class,
                    String.class, String.class, Class.forName(MODEL + "NavContent"), List.class,
                    Boolean.class, java.util.Map.class);
            Object navEntry = navEntryConstructor.newInstance(depth, label, null, path, null,
                    Collections.emptyList(), null, Collections.emptyMap());
            Object item = Class.forName(ITEM)
                    .getConstructor(navEntryClass, Class.forName(MODEL + "PageRoute"))
                    .newInstance(navEntry, route);
            result.add(0, item);
            Logger.info("Added Watch sub-tab " + label + " (" + path + ")");
            return result;
        } catch (Exception e) {
            Logger.error("Could not add the Watch sub-tab", e);
            return items;
        }
    }

    private static Object field(Object object, String name) throws Exception {
        Field field = object.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(object);
    }
}
