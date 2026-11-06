package dev.jason.gboardpatches.extension.frostedglass;

import android.content.SharedPreferences;
import dev.jason.gboardpatches.extension.flagsettings.GboardFlagRuntimeContext;

public final class GboardFrostedGlassSettingsRuntime {
    private GboardFrostedGlassSettingsRuntime() {}
    private static SharedPreferences prefs() { return GboardFlagRuntimeContext.preferencesOrNull(); }
    public static boolean isEnabled() {
        return GboardFrostedGlassSettings.readEnabled(prefs());
    }
    public static int blurRadiusPx() {
        int strength = GboardFrostedGlassSettings.readBlurStrength(prefs());
        return GboardFrostedGlassSettings.blurStrengthToRadiusPx(strength);
    }
    public static int customOpacityPercent() {
        SharedPreferences p=prefs();
        if (GboardFrostedGlassSettings.TRANSPARENCY_MODE_CUSTOM.equals(GboardFrostedGlassSettings.readTransparencyMode(p))) return Math.round((100-GboardFrostedGlassSettings.readCustomOpacity(p))*255f/100f);
        return -1;
    }
}
