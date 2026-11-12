package app.badfella.extension.linkedin;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;

/**
 * "Icon-only post actions": the Like, Comment, Repost and Send buttons under feed posts without their labels.
 *
 * They are an SDUI button bar, which picks how its buttons are drawn from its width on every measure
 * (ButtonBarKt.ButtonBarLayout's measure policy): IconOnly when narrower than its label threshold, otherwise with
 * labels. The hook there passes the bar's view data ({@link #onBarMeasure}) and the chosen mode
 * ({@link #renderMode}), which becomes IconOnly for the feed's action bar. The bar's own layout handles that mode,
 * and the buttons keep their accessibility labels.
 */
@SuppressWarnings("unused")
public final class ActionBarStyle {
    private static final Map<String, Field> FIELDS = new ConcurrentHashMap<>();
    /** Button bars (ButtonBarViewData) to whether they are a post's action bar. */
    private static final Map<Object, Boolean> ACTION_BARS = new WeakHashMap<>();
    /** Whether the bar being measured is a post's action bar. Measuring runs on the main thread. */
    private static boolean measuringActionBar;

    private ActionBarStyle() {
    }

    static boolean isActionButton(String viewName) {
        switch (viewName) {
            case "reaction-button":
            case "feed-comment-button":
            case "feed-share-button":
            case "feed-combined-share-message":
                return true;
            default:
                return false;
        }
    }

    /** At the start of the button bar's measure: [policy] holds the bar's view data ($buttonBarViewData). */
    public static void onBarMeasure(Object policy) {
        measuringActionBar = false;
        if (!Settings.iconOnlyActions()) return;
        try {
            Object bar = field(policy, "$buttonBarViewData");
            if (bar == null) return;
            Boolean action;
            synchronized (ACTION_BARS) {
                action = ACTION_BARS.get(bar);
            }
            if (action == null) {
                action = isActionBar(bar);
                synchronized (ACTION_BARS) {
                    ACTION_BARS.put(bar, action);
                }
            }
            measuringActionBar = action;
        } catch (Throwable t) {
            Diagnostics.error("icon-only post actions failed", t);
        }
    }

    /** The render mode (ButtonRenderMode) the bar picked: IconOnly instead for a post's action bar. */
    public static Object renderMode(Object mode) {
        if (!measuringActionBar || !(mode instanceof Enum)) return mode;
        measuringActionBar = false;
        try {
            @SuppressWarnings({"unchecked", "rawtypes"})
            Object iconOnly = Enum.valueOf((Class) ((Enum<?>) mode).getDeclaringClass(), "IconOnly");
            return iconOnly;
        } catch (Throwable t) {
            Diagnostics.error("icon-only post actions failed", t);
            return mode;
        }
    }

    /** ButtonBarViewData.buttonList[].properties.currentViewTrackingNode.viewSpec.viewName */
    private static boolean isActionBar(Object bar) throws ReflectiveOperationException {
        Object buttons = field(bar, "buttonList");
        if (!(buttons instanceof List)) return false;
        for (Object button : (List<?>) buttons) {
            Object node = field(field(button, "properties"), "currentViewTrackingNode");
            Object viewName = field(field(node, "viewSpec"), "viewName");
            if (viewName instanceof String && isActionButton((String) viewName)) return true;
        }
        return false;
    }

    private static Object field(Object obj, String name) throws ReflectiveOperationException {
        if (obj == null) return null;
        Class<?> type = obj.getClass();
        String key = type.getName() + '.' + name;
        Field field = FIELDS.get(key);
        if (field == null) {
            field = type.getDeclaredField(name);
            field.setAccessible(true);
            FIELDS.put(key, field);
        }
        return field.get(obj);
    }
}
