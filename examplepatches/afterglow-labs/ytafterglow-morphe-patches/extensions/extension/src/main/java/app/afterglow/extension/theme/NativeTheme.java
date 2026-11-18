package app.afterglow.extension.theme;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.NativeThemeColors;
import app.afterglow.extension.settings.ThemePalette;
import app.afterglow.extension.settings.ThemeStore;
import app.afterglow.extension.settings.ThemeRole;

/** Native views cache resolved colors: one consistent palette until the requested app restart. */
public final class NativeTheme {
    private static volatile ThemePalette palette;
    private static boolean failed;
    private static volatile Boolean nativeDark;

    private NativeTheme() {}

    public static ThemePalette activePalette() {
        return InstalledTweaks.has("theme-studio") ? palette : null;
    }

    /** YouTube can select dark appearance independently of Android's system night mode. */
    public static boolean isDark(Configuration configuration) {
        Boolean known = nativeDark;
        return known != null ? known
                : (configuration.uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }

    public static int foregroundColor(int original) {
        ThemePalette active = activePalette();
        if (active == null) return original;
        return NativeThemeColors.foreground(active, original, nativeDark != null ? nativeDark : !active.lightFoundation);
    }

    public static void onMainActivityCreate(Activity activity) {
        wrapContext(activity);
    }

    public static Context wrapContext(Context base) {
        if (base == null || !InstalledTweaks.has("theme-studio") || Build.VERSION.SDK_INT < 34) return base;
        if (android.app.Application.getProcessName().endsWith(":afterglow_restart")) return base;
        try {
            Afterglow.onBaseContext(base);
            synchronized (NativeTheme.class) {
                if (failed) return base;
                if (palette == null) {
                    ThemePalette next = ThemeStore.snapshot().palette;
                    ThemeOverlay.initialize(base, next);
                    palette = next;
                }
                ThemeOverlay.apply(base);
            }
        } catch (Throwable error) {
            synchronized (NativeTheme.class) { failed = true; }
            Afterglow.error("NativeTheme.wrapContext", error);
        }
        return base;
    }

    public static Enum<?> appearance(Enum<?> original) {
        if (original != null && ("DARK".equals(original.name()) || "LIGHT".equals(original.name())))
            nativeDark = "DARK".equals(original.name());
        if (!InstalledTweaks.has("theme-studio") || Build.VERSION.SDK_INT < 34) return original;
        try {
            ThemePalette active = palette;
            Enum<?> result = NativeThemeColors.appearance(active != null ? active : ThemeStore.snapshot().palette, original);
            if (result != null) nativeDark = "DARK".equals(result.name());
            return result;
        } catch (Throwable error) {
            Afterglow.error("NativeTheme.appearance", error);
            return original;
        }
    }

    /** The Litho drawable hook only; never applied to arbitrary Paint.setColor calls. */
    public static int lithoColor(int original) {
        ThemePalette active = palette;
        if (active == null || !InstalledTweaks.has("theme-studio")) return original;
        try {
            Activity activity = Afterglow.mainActivity();
            Context context = activity != null ? activity : Afterglow.context();
            if (context == null) return original;
            Boolean known = nativeDark;
            boolean dark = known != null ? known
                    : (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                    == Configuration.UI_MODE_NIGHT_YES;
            return NativeThemeColors.lithoBackground(active, original, dark);
        } catch (Throwable error) {
            Afterglow.error("NativeTheme.lithoColor", error);
            return original;
        }
    }
}
