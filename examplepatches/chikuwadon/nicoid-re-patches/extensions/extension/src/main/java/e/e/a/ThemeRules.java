package e.e.a;

/** Preference migration and mode resolution, independent of Android. */
public final class ThemeRules {
    public static String mode(String saved, boolean legacyMaterial) {
        if ("light".equals(saved) || "dark".equals(saved) || "material".equals(saved)) return saved;
        return legacyMaterial ? "material" : "light";
    }
    public static boolean night(String mode, boolean systemNight) {
        return "dark".equals(mode) || ("material".equals(mode) && systemNight);
    }
    public static String style(String mode, boolean systemNight, int sdk) {
        if ("material".equals(mode) && sdk >= 31) return "MyThemeMaterialYou";
        return night(mode, systemNight) ? "MyThemeDark" : "MyThemeLight";
    }
}
