package app.morphe.extension.tiktok.navigation;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.tiktok.settings.Settings;

/** Handles the configured startup feed and remembers a selected tab when TikTok exposes that state. */
public final class StartupTabController {
    public static final String DEFAULT = "default";
    public static final String LAST_USED = "last";

    private static volatile boolean startupHandled;

    private StartupTabController() {
    }

    public static void observeSelection(List<?> tabs) {
        if (!startupHandled || tabs == null) {
            return;
        }

        try {
            for (Object tab : tabs) {
                if (!isSelected(tab)) {
                    continue;
                }
                String key = NavigationTabOptions.normalizeRuntimeTag(getTag(tab));
                if (key != null && !key.equals(Settings.LAST_USED_FEED_TAB.get())) {
                    Settings.LAST_USED_FEED_TAB.save(key);
                }
                return;
            }
        } catch (Throwable throwable) {
            Logger.printException(() -> "BlueIT startup tab selection observation failed", throwable);
        }
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static List<?> applyStartup(List<?> tabs) {
        if (tabs == null || startupHandled) {
            return tabs;
        }
        startupHandled = true;

        String configured = Settings.STARTUP_FEED_TAB.get();
        if (configured == null || DEFAULT.equals(configured)) {
            return tabs;
        }

        String target = LAST_USED.equals(configured)
                ? Settings.LAST_USED_FEED_TAB.get()
                : configured;
        if (target == null || target.isEmpty()) {
            target = NavigationTabOptions.HOT;
        }

        int targetIndex = -1;
        for (int index = 0; index < tabs.size(); index++) {
            String key = NavigationTabOptions.normalizeRuntimeTag(getTag(tabs.get(index)));
            if (target.equals(key)) {
                targetIndex = index;
                break;
            }
        }

        if (targetIndex < 0 && !NavigationTabOptions.HOT.equals(target)) {
            for (int index = 0; index < tabs.size(); index++) {
                String key = NavigationTabOptions.normalizeRuntimeTag(getTag(tabs.get(index)));
                if (NavigationTabOptions.HOT.equals(key)) {
                    targetIndex = index;
                    break;
                }
            }
        }

        if (targetIndex <= 0) {
            return tabs;
        }

        ArrayList reordered = new ArrayList(tabs);
        Object targetTab = reordered.remove(targetIndex);
        reordered.add(0, targetTab);
        markSelectedBestEffort(reordered, targetTab);
        return reordered;
    }

    private static String getTag(Object tab) {
        if (tab == null) return null;
        for (String name : new String[]{"tag", "getTag"}) {
            try {
                Method method = tab.getClass().getMethod(name);
                Object value = method.invoke(tab);
                if (value instanceof String) return (String) value;
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static boolean isSelected(Object tab) {
        if (tab == null) return false;
        for (String name : new String[]{"isSelected", "getSelected", "isActive", "getActive", "isCurrent", "getCurrent"}) {
            try {
                Method method = tab.getClass().getMethod(name);
                if (method.getParameterTypes().length == 0) {
                    Object value = method.invoke(tab);
                    if (value instanceof Boolean && (Boolean) value) return true;
                }
            } catch (Throwable ignored) {
            }
        }
        for (String name : new String[]{"selected", "isSelected", "active", "isActive", "current", "isCurrent"}) {
            try {
                Field field = tab.getClass().getDeclaredField(name);
                if (field.getType() == boolean.class || field.getType() == Boolean.class) {
                    field.setAccessible(true);
                    Object value = field.get(tab);
                    if (Boolean.TRUE.equals(value)) return true;
                }
            } catch (Throwable ignored) {
            }
        }
        return false;
    }

    private static void markSelectedBestEffort(List<?> tabs, Object target) {
        for (Object tab : tabs) {
            boolean selected = tab == target;
            for (String name : new String[]{"setSelected", "setActive", "setCurrent"}) {
                try {
                    Method method = tab.getClass().getMethod(name, boolean.class);
                    method.invoke(tab, selected);
                    break;
                } catch (Throwable ignored) {
                }
            }
        }
    }
}
