package app.pablobaro.extension.spotify;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.ArrayList;
import java.util.List;

import app.pablobaro.extension.shared.Logger;
import app.pablobaro.extension.shared.Reflection;

/**
 * Removes "Premium" upsell entries from context menus (long press menus of songs, albums, ...).
 */
@SuppressWarnings("unused")
public final class HideContextMenuUpsellsPatch {
    private HideContextMenuUpsellsPatch() {
    }

    /**
     * Replaced by the bytecode patch with a read of the {@code isPremiumUpsell} field of the item view model.
     */
    private static boolean isPremiumUpsell(Object viewModel) {
        // Not replaced: getViewModel is obfuscated in this Spotify version. Read the field by reflection.
        try {
            Field field = secondBooleanField(viewModel.getClass());
            return field != null && field.getBoolean(viewModel);
        } catch (Throwable ex) {
            return false;
        }
    }

    private static final Map<Class<?>, Object> VIEW_MODEL_ACCESSORS = new ConcurrentHashMap<>();
    private static final Object NONE = new Object();

    /** A view model has at least three boolean fields: available, enabled, isPremiumUpsell. */
    private static boolean looksLikeViewModel(Class<?> type) {
        if (type == null || type.isPrimitive() || type.getName().startsWith("java.")) return false;
        int booleans = 0;
        for (Field field : type.getDeclaredFields()) {
            if (field.getType() == boolean.class && !Modifier.isStatic(field.getModifiers())) booleans++;
        }
        return booleans >= 3;
    }

    private static Field secondBooleanField(Class<?> type) {
        int seen = 0;
        for (Field field : type.getDeclaredFields()) {
            if (field.getType() != boolean.class || Modifier.isStatic(field.getModifiers())) continue;
            if (++seen == 2) {
                field.setAccessible(true);
                return field;
            }
        }
        return null;
    }

    /** Finds the item's view model: getViewModel if it exists, else an obfuscated getter or field. */
    private static Object viewModelOf(Object item) throws ReflectiveOperationException {
        Class<?> type = item.getClass();
        Object accessor = VIEW_MODEL_ACCESSORS.get(type);
        if (accessor == null) {
            accessor = NONE;
            try {
                accessor = Reflection.findMethod(type, "getViewModel");
            } catch (NoSuchMethodException ignored) {
                for (Method method : type.getMethods()) {
                    if (method.getParameterTypes().length == 0 && !Modifier.isStatic(method.getModifiers())
                            && looksLikeViewModel(method.getReturnType())) {
                        method.setAccessible(true);
                        accessor = method;
                        break;
                    }
                }
                if (accessor == NONE) {
                    for (Field field : type.getDeclaredFields()) {
                        if (!Modifier.isStatic(field.getModifiers()) && looksLikeViewModel(field.getType())) {
                            field.setAccessible(true);
                            accessor = field;
                            break;
                        }
                    }
                }
            }
            VIEW_MODEL_ACCESSORS.put(type, accessor);
        }
        if (accessor instanceof Method) return ((Method) accessor).invoke(item);
        if (accessor instanceof Field) return ((Field) accessor).get(item);
        return null;
    }

    /**
     * Injection point: List parameter of the {@code ContextMenuViewModel} constructor.
     */
    public static List<?> filterContextMenuItems(List<?> items) {
        return filterContextMenuItems(items, null);
    }

    /**
     * @param isPremiumUpsell The {@code isPremiumUpsell} field of the item view model,
     *                        or null if {@link #isPremiumUpsell(Object)} was patched instead.
     */
    public static List<?> filterContextMenuItems(List<?> items, Field isPremiumUpsell) {
        if (items == null || items.isEmpty()) return items;

        try {
            List<Object> filtered = new ArrayList<>(items.size());
            for (Object item : items) {
                Object viewModel = item == null ? null : viewModelOf(item);
                if (viewModel != null) {
                    boolean isUpsell = isPremiumUpsell != null
                            ? isPremiumUpsell.getBoolean(viewModel)
                            : isPremiumUpsell(viewModel);
                    if (isUpsell) continue;
                }
                filtered.add(item);
            }
            return filtered;
        } catch (Throwable ex) {
            Logger.error("filterContextMenuItems failure", ex);
            return items;
        }
    }
}
