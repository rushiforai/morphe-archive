package app.template.extension.timemark;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;

/**
 * Builds the "Timemark patches" row inside Timemark's own settings list.
 * The settings patch calls appendRow() from the settings fragment's
 * onViewCreated right after the stock rows are copied into the list adapter,
 * so the row is a real NewSettingItem in the app's own RecyclerView — the
 * same entry approach hxreborn uses (a real row in the host settings list,
 * built from the host's own row type), constructed reflectively so the
 * extension carries no compile-time dependency on the host app.
 *
 * The fragment keeps its rows in the field o0 (ArrayList of NewSettingItem)
 * and the adapter keeps its own list in the field n; the item is added to
 * both (deduplicated by key) and refreshRow() keeps its value text current.
 * All failures are swallowed: worst case the row simply does not appear.
 */
public final class SettingsRows {

    static final String ROW_KEY = "morphe_timemark_patches";

    private static final String ROW_NAME = "Timemark patches";

    private static final String ITEM_CLASS = "com.xhey.xcamera.data.model.bean.settting.NewSettingItem";

    private SettingsRows() {
    }

    public static void appendRow(Object fragment) {
        try {
            if (fragment == null) {
                return;
            }
            final List<Object> fragmentRows = listField(fragment, "o0");
            if (fragmentRows != null && !containsRow(fragmentRows)) {
                final Object item = buildItem();
                if (item != null) {
                    fragmentRows.add(item);
                }
            }
            final Object adapter = invokeNoArg(fragment, "o");
            if (adapter != null) {
                final List<Object> adapterRows = listField(adapter, "n");
                if (adapterRows != null && adapterRows != fragmentRows && !containsRow(adapterRows)) {
                    final Object item = buildItem();
                    if (item != null) {
                        adapterRows.add(item);
                    }
                }
            }
        } catch (Throwable ignored) {
        }
    }

    public static void refreshRow(Object fragment) {
        try {
            if (fragment == null) {
                return;
            }
            updateValue(listField(fragment, "o0"));
            final Object adapter = invokeNoArg(fragment, "o");
            if (adapter != null) {
                updateValue(listField(adapter, "n"));
            }
        } catch (Throwable ignored) {
        }
    }

    private static void updateValue(List<Object> rows) throws Exception {
        if (rows == null) {
            return;
        }
        for (Object row : rows) {
            if (row != null && ROW_KEY.equals(invokeString(row, "getKey"))) {
                row.getClass().getMethod("setItemValue", String.class).invoke(row, valueText());
            }
        }
    }

    private static boolean containsRow(List<Object> rows) {
        for (Object row : rows) {
            try {
                if (row != null && ROW_KEY.equals(invokeString(row, "getKey"))) {
                    return true;
                }
            } catch (Throwable ignored) {
            }
        }
        return false;
    }

    private static Object buildItem() {
        try {
            final Class<?> itemClass = Class.forName(ITEM_CLASS);
            final Object item = itemClass.getDeclaredConstructor().newInstance();
            itemClass.getMethod("setKey", String.class).invoke(item, ROW_KEY);
            itemClass.getMethod("setItemName", String.class).invoke(item, ROW_NAME);
            itemClass.getMethod("setItemValue", String.class).invoke(item, valueText());
            itemClass.getMethod("setTopEmpty", boolean.class).invoke(item, true);
            return item;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String valueText() {
        final String summary = SpoofLocation.summary();
        return summary.isEmpty() ? "Off" : summary;
    }

    @SuppressWarnings("unchecked")
    private static List<Object> listField(Object target, String name) {
        try {
            Field field = findField(target.getClass(), name);
            if (field == null) {
                return null;
            }
            field.setAccessible(true);
            final Object value = field.get(target);
            return value instanceof List ? (List<Object>) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Field findField(Class<?> type, String name) {
        Class<?> current = type;
        while (current != null) {
            try {
                return current.getDeclaredField(name);
            } catch (NoSuchFieldException ignored) {
                current = current.getSuperclass();
            }
        }
        return null;
    }

    private static Object invokeNoArg(Object target, String name) {
        try {
            final Method method = target.getClass().getMethod(name);
            return method.invoke(target);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String invokeString(Object target, String name) throws Exception {
        final Object value = target.getClass().getMethod(name).invoke(target);
        return value instanceof String ? (String) value : null;
    }
}
