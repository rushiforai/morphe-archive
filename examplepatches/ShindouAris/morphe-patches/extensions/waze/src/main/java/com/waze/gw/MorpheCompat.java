package com.waze.gw;

/**
 * Entry points the Morphe patch calls where the Mod's own build changes a method's register count. A patch cannot
 * widen a method's registers (the parameters would move), so these take the values straight from the hook and keep
 * what is left over in a static until the matching hook later in the same method.
 */
public final class MorpheCompat {
    private static volatile Object settingsRoot;

    private MorpheCompat() { }

    /** AverageSpeedCameraNativeManager.c(update): hands over the update, the Gateway wants three numbers of it. */
    public static void onAvgSpeedZoneUpdate(Object update) {
        try {
            Class<?> c = update.getClass();
            int left = ((Number) c.getMethod("getLeftDistance").invoke(update)).intValue();
            int speed = ((Number) c.getMethod("getRecommendedSpeed").invoke(update)).intValue();
            int percent = ((Number) c.getMethod("getPercent").invoke(update)).intValue();
            Gateway.onAvgSpeedZone(left, speed, percent);
        } catch (Throwable ignored) { }
    }

    private static volatile Object aaSubReportCategory;

    /** Android Auto report sub-menu, start of dz.a(category): the category the Mod needs again at the end. */
    public static void rememberAaSubReportCategory(Object category) {
        aaSubReportCategory = category;
    }

    /** Android Auto report sub-menu, end of dz.a: the screen state, patched with the remembered category. */
    public static Object patchAaSubReportState(Object state) {
        Object category = aaSubReportCategory;
        aaSubReportCategory = null;
        return Gateway.patchAaSubReportState(category, state);
    }

    /**
     * The id of a drawable the Mod added to Waze, 0 for any other name. Waze finds icons through the fields of its R
     * class, which the Mod's own icons have no entry in.
     */
    public static int modDrawableId(String name) {
        if (name == null || !(name.startsWith("mod_") || name.startsWith("icon_speed_limit_world_")
                || name.equals("icon_alerter_break_coffee"))) {
            return 0;
        }
        return Gateway.modResourceId(Gateway.ctx(), name, "drawable");
    }

    /** Waze's settings page builder, early: the root view the settings button will be added to later. */
    public static void rememberSettingsRoot(Object root) {
        settingsRoot = root;
    }

    /** Waze's settings page builder, at its end. */
    public static void attachRememberedSettingsButton() {
        Object root = settingsRoot;
        settingsRoot = null;
        if (root instanceof android.view.View) Gateway.attachSettingsButton((android.view.View) root);
    }
}