package app.morphe.extension.shared.patches;

import android.content.Context;
import android.content.SharedPreferences;
import android.view.View;
import app.morphe.extension.shared.Logger;

public final class FloatingTabBarHelper {
    public static final String PREF_BAR_MODE = "morphe_floating_bar_mode";

    public static final String MODE_STOCK = "stock";
    public static final String MODE_COMPACT = "compact";
    public static final String MODE_ICON_ONLY = "icon_only";

    private static String sDefaultMode = MODE_STOCK;

    private FloatingTabBarHelper() {}

    /**
     * Default mode determined at patch time (stock by default, can be hooked via returnEarly).
     */
    public static String getDefaultMode() {
        return sDefaultMode;
    }

    public static void setDefaultMode(String mode) {
        if (mode != null && !mode.trim().isEmpty()) {
            sDefaultMode = mode.trim().toLowerCase();
        }
    }

    /**
     * Retrieves the current floating bar mode from preferences, falling back to getDefaultMode().
     */
    public static String getCurrentMode(Context context) {
        if (context == null) return getDefaultMode();
        try {
            SharedPreferences prefs = context.getSharedPreferences(
                    "com.google.android.apps.photos.phenotype",
                    Context.MODE_PRIVATE
            );
            return prefs.getString(PREF_BAR_MODE, getDefaultMode());
        } catch (Throwable t) {
            return getDefaultMode();
        }
    }

    /**
     * Sets the floating bar mode in preferences.
     */
    public static void setBarMode(Context context, String mode) {
        if (context == null || mode == null) return;
        try {
            SharedPreferences prefs = context.getSharedPreferences(
                    "com.google.android.apps.photos.phenotype",
                    Context.MODE_PRIVATE
            );
            prefs.edit().putString(PREF_BAR_MODE, mode.trim().toLowerCase()).apply();
        } catch (Throwable t) {
            Logger.printException(() -> "Error saving floating bar mode", t);
        }
    }

    public static String getModeDisplayName(Context context) {
        String mode = getCurrentMode(context);
        if (MODE_COMPACT.equalsIgnoreCase(mode)) {
            return "Compact (Modern UI) • Unselected tabs as icons";
        } else if (MODE_ICON_ONLY.equalsIgnoreCase(mode)) {
            return "Minimal (Icon Only) • All tabs as icons";
        } else {
            return "Stock (Expanded) • Classic text labels";
        }
    }

    public static String getModeChipName(Context context) {
        String mode = getCurrentMode(context);
        if (MODE_COMPACT.equalsIgnoreCase(mode)) {
            return "Compact";
        } else if (MODE_ICON_ONLY.equalsIgnoreCase(mode)) {
            return "Minimal";
        } else {
            return "Stock";
        }
    }

    /**
     * Resolves the initial display mode enum for FloatingTabBarLayout.onMeasure().
     * If the user selected Stock, this returns stockDefault (EXPANDED).
     * If Compact or Icon-Only is selected, it dynamically finds the matching enum constant
     * from stockDefault's declaring class without hardcoding obfuscated class names.
     */
    public static Enum<?> getInitialMode(Enum<?> stockDefault, View view) {
        if (stockDefault == null) return null;
        try {
            Context context = view != null ? view.getContext() : null;
            String mode = getCurrentMode(context);

            if (MODE_STOCK.equalsIgnoreCase(mode) || "expanded".equalsIgnoreCase(mode)) {
                return stockDefault;
            }

            Class<?> enumClass = stockDefault.getDeclaringClass();
            Object[] constants = enumClass.getEnumConstants();
            if (constants == null || constants.length == 0) return stockDefault;

            String targetName;
            if (MODE_ICON_ONLY.equalsIgnoreCase(mode)) {
                targetName = "ICON_ONLY";
            } else {
                targetName = "COMPACT";
            }

            for (Object obj : constants) {
                if (obj instanceof Enum<?> && ((Enum<?>) obj).name().equalsIgnoreCase(targetName)) {
                    return (Enum<?>) obj;
                }
            }
        } catch (Throwable t) {
            Logger.printException(() -> "Error resolving floating tab bar mode", t);
        }
        return stockDefault;
    }
}
