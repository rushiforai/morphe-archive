package app.noam.extension.chesscom.settings;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;

import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.List;

import app.noam.extension.chesscom.Utils;

/**
 * The Noam's Patches row atop the More tab. The patch adds a NOAM_PATCHES More key (title and icon
 * from {@link #titleRes()} and {@link #iconRes()}), puts the row first and sends its taps here.
 */
public final class MoreEntry {
    public static final String KEY = "NOAM_PATCHES";
    private static final String KEY_CLASS = "com.chess.home.more.MoreMenuItemKey";
    private static final String ROW_PRINT = "MoreMenuItemUiModel(";

    private static Object key;
    private static boolean looked;

    private MoreEntry() {}

    /** The row's title: the "Noam's Patches" string the patch adds. */
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
            for (Constructor<?> constructor : rowClass.getConstructors()) {
                Class<?>[] types = constructor.getParameterTypes();
                if (types.length == 5 && types[0] == ourKey.getClass() && types[1] == boolean.class) {
                    List result = new ArrayList(items);
                    result.add(0, constructor.newInstance(ourKey, true, null, null, null));
                    return result;
                }
            }
        } catch (Throwable throwable) {
            Utils.logError("Could not add the Noam's Patches row", throwable);
        }
        return items;
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
