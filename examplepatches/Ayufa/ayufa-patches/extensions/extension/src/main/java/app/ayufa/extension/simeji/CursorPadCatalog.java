package app.ayufa.extension.simeji;

import android.content.Context;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Adds the cursor-move item to Simeji's toolbar customization
 * catalogue. Called from the patched
 * {@code ToolbarItem.Companion.getToobarDatas()}: the stock method
 * simply returns the catalogue list, and every consumer (the
 * settings screen's adapter, the lookup that resolves a saved
 * configuration back to items, the default configuration) goes
 * through it, so returning an extended copy here is enough for the
 * item to appear in the settings list and for configurations
 * containing its index ("19") to resolve.
 *
 * <p>The item is a genuine {@code ToolbarItem} built reflectively
 * with the resource ids of the string and drawable the patch's
 * resource half adds to the app (both named
 * {@code toolbar_cursor_move}, resolved by name because their ids
 * are only assigned when the patched app is built). If anything is
 * unavailable the stock list is returned unchanged; this method
 * never returns null, because the patched stock method's callers
 * iterate the result unconditionally.
 */
public final class CursorPadCatalog {

    private static final String ITEM_ID = "19";
    private static final String RESOURCE_NAME = "toolbar_cursor_move";
    private static final String TOOLBAR_ITEM_CLASS =
            "jp.baidu.simeji.home.vip.toolbar.ToolbarItem";

    private static List<Object> cachedExtended;

    private CursorPadCatalog() {
    }

    public static List<Object> extended() {
        try {
            if (cachedExtended != null) {
                return cachedExtended;
            }
            List<Object> original = originalList();
            if (original == null) {
                return Collections.emptyList();
            }
            Class<?> toolbarItem = Class.forName(TOOLBAR_ITEM_CLASS);
            Method getId = toolbarItem.getMethod("getId");
            for (Object item : original) {
                if (ITEM_ID.equals(getId.invoke(item))) {
                    cachedExtended = original;
                    return original;
                }
            }
            Context context = appContext();
            if (context == null) {
                return original;
            }
            String pkg = context.getPackageName();
            int titleId = context.getResources()
                    .getIdentifier(RESOURCE_NAME, "string", pkg);
            int iconId = context.getResources()
                    .getIdentifier(RESOURCE_NAME, "drawable", pkg);
            if (titleId == 0 || iconId == 0) {
                return original;
            }
            Constructor<?> constructor = toolbarItem.getConstructor(
                    String.class, int.class, int.class, int.class);
            Object item = constructor.newInstance(ITEM_ID, titleId, iconId, iconId);
            List<Object> extended = new ArrayList<>(original);
            extended.add(item);
            cachedExtended = extended;
            return extended;
        } catch (Throwable ignored) {
            List<Object> original = originalList();
            return original != null ? original : Collections.emptyList();
        }
    }

    /** The stock catalogue list, read from its private static field. */
    @SuppressWarnings("unchecked")
    private static List<Object> originalList() {
        try {
            Class<?> toolbarItem = Class.forName(TOOLBAR_ITEM_CLASS);
            Field field = toolbarItem.getDeclaredField("toobarDatas");
            field.setAccessible(true);
            Object value = field.get(null);
            return value instanceof List ? (List<Object>) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** The application context, resolved the same way NavBarColor does. */
    private static Context appContext() {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Method currentApplication = activityThread.getMethod("currentApplication");
            Object application = currentApplication.invoke(null);
            if (application instanceof Context) {
                return (Context) application;
            }
        } catch (Throwable ignored) {
            // No context yet: the caller keeps the stock list.
        }
        return null;
    }
}
