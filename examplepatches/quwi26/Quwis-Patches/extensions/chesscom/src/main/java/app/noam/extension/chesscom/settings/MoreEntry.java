package app.noam.extension.chesscom.settings;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;

import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.List;

import app.noam.extension.chesscom.Utils;

/**
 * The Quwi's Patches row atop the More tab. The patch adds a NOAM_PATCHES More key (title and icon
 * from {@link #titleRes()} and {@link #iconRes()}), puts the row first and sends its taps here.
 */
public final class MoreEntry {
    public static final String KEY = "NOAM_PATCHES";
    private static final String KEY_CLASS = "com.chess.home.more.MoreMenuItemKey";
    private static final String ROW_PRINT = "MoreMenuItemUiModel(";

    private static Object key;
    private static boolean looked;

    private MoreEntry() {}

    /** The row's title: the "Quwi's Patches" string the patch adds. */
    public static int titleRes() {
        int id = Utils.resourceId("morphe_settings_title", "string");
        return id != 0 ? id : android.R.string.untitled;
    }

    /** The row's icon: the glowing sparkle the patch adds. */
    public static int iconRes() {
        int id = Utils.resourceId("morphe_patches_icon", "drawable");
        return id != 0 ? id : android.R.drawable.ic_menu_preferences;
    }

    /** The NOAM_PATCHES key, or null when the patch could not add it. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    static Object key() {
        if (!looked) {
            looked = true;
            try {
                key = Enum.valueOf((Class) Class.forName(KEY_CLASS), KEY);
            } catch (Throwable throwable) {
                key = null;
            }
        }
        return key;
    }

    /** The More list (MoreMenuUiState items), with our row first. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static List items(List items) {
        if (items == null || items.isEmpty()) return items;
        try {
            Object ourKey = key();
            if (ourKey == null) return items;
            Class<?> rowClass = null;
            for (Object item : items) {
                String printed = String.valueOf(item);
                if (printed.startsWith(ROW_PRINT + "key=" + KEY + ",")) return items;
                if (rowClass == null && printed.startsWith(ROW_PRINT)) rowClass = item.getClass();
            }
            if (rowClass == null) return items;
            Object row = row(rowClass, ourKey);
            if (row != null) {
                List result = new ArrayList(items);
                result.add(0, row);
                return result;
            }
        } catch (Throwable throwable) {
            Utils.logError("Could not add the Quwi's Patches row", throwable);
        }
        return items;
    }

    /**
     * The model's row for the key. 4.10.18 has the plain constructor (key, enabled, badge,
     * chipData, imageUrl); 4.10.23 keeps only Kotlin's synthetic one, whose last parameter is the
     * default mask, so the extra fields are filled from its defaults.
     */
    private static Object row(Class<?> rowClass, Object key) {
        Constructor<?> masked = null;
        for (Constructor<?> constructor : rowClass.getConstructors()) {
            Class<?>[] types = constructor.getParameterTypes();
            if (types.length < 3 || types[0] != key.getClass() || types[1] != boolean.class) continue;
            boolean hasMask = types.length >= 4 && types[types.length - 1] == int.class;
            if (!hasMask) {
                Object[] args = new Object[types.length];
                args[0] = key;
                args[1] = true;
                for (int i = 2; i < types.length; i++) {
                    if (types[i].isPrimitive()) throw new IllegalArgumentException("Unexpected row field");
                    args[i] = null;
                }
                try {
                    return constructor.newInstance(args);
                } catch (Throwable throwable) {
                    Utils.logError("Could not build the Quwi's Patches row", throwable);
                }
            } else {
                masked = constructor;
            }
        }
        if (masked == null) return null;
        Class<?>[] types = masked.getParameterTypes();
        int end = types.length - 1;
        Object[] args = new Object[types.length];
        args[0] = key;
        args[1] = true;
        int defaults = 0;
        for (int i = 2; i < end; i++) {
            // A primitive field cannot take null; its zero is what the model's own rows use.
            args[i] = java.lang.reflect.Array.get(java.lang.reflect.Array.newInstance(types[i], 1), 0);
            if (!types[i].isPrimitive()) defaults |= 1 << i;
        }
        args[end] = defaults;
        try {
            return masked.newInstance(args);
        } catch (Throwable throwable) {
            Utils.logError("Could not build the Quwi's Patches row", throwable);
            return null;
        }
    }

    /** A tapped More row; true when it was ours. */
    public static boolean onClick(Object key) {
        if (!(key instanceof Enum) || !KEY.equals(((Enum<?>) key).name())) return false;
        Context context = Utils.resumedActivity();
        if (context == null) context = Utils.context();
        if (context == null) return true;
        Intent intent = new Intent(context, MorpheSettingsActivity.class);
        if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
        return true;
    }
}
