package io.github.ilikeadofai.vocacolle.extension.settings;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;
import android.util.TypedValue;
import android.view.View;
import android.view.Window;

/** Resource-free Day/Night palette aligned with VocaColle's neutral settings surfaces. */
final class MorpheSettingsTheme {
    private static final int DEFAULT_ACCENT = rgb(0, 137, 123);

    private MorpheSettingsTheme() {
    }

    static Palette resolve(Context context) {
        boolean dark = isNightMode(context.getResources().getConfiguration().uiMode);
        return createPalette(dark, resolveColor(context, android.R.attr.colorAccent, DEFAULT_ACCENT));
    }

    static boolean isNightMode(int uiMode) {
        return (uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }

    static Palette createPalette(boolean dark, int accent) {
        if (dark) {
            return new Palette(
                    true,
                    rgb(18, 18, 18),
                    rgb(18, 18, 18),
                    rgb(245, 245, 245),
                    rgb(183, 183, 183),
                    argb(38, 255, 255, 255),
                    accent,
                    withAlpha(accent, 46)
            );
        }
        return new Palette(
                false,
                rgb(250, 250, 250),
                rgb(255, 255, 255),
                rgb(32, 33, 36),
                rgb(95, 99, 104),
                argb(24, 0, 0, 0),
                accent,
                withAlpha(accent, 30)
        );
    }

    static void applySystemBars(Activity activity, Palette palette) {
        Window window = activity.getWindow();
        window.setStatusBarColor(palette.appBar);
        window.setNavigationBarColor(palette.background);
        if (Build.VERSION.SDK_INT >= 28) {
            window.setNavigationBarDividerColor(palette.divider);
        }

        View decor = window.getDecorView();
        int flags = decor.getSystemUiVisibility();
        if (palette.dark) {
            flags &= ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
            if (Build.VERSION.SDK_INT >= 26) {
                flags &= ~View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
            }
        } else {
            flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
            if (Build.VERSION.SDK_INT >= 26) {
                flags |= View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
            }
        }
        decor.setSystemUiVisibility(flags);
    }

    private static int resolveColor(Context context, int attribute, int fallback) {
        TypedValue value = new TypedValue();
        if (!context.getTheme().resolveAttribute(attribute, value, true)) {
            return fallback;
        }
        if (value.type >= TypedValue.TYPE_FIRST_COLOR_INT
                && value.type <= TypedValue.TYPE_LAST_COLOR_INT) {
            return value.data;
        }
        if (value.resourceId != 0) {
            try {
                return context.getResources().getColor(value.resourceId, context.getTheme());
            } catch (RuntimeException ignored) {
                return fallback;
            }
        }
        return fallback;
    }

    private static int withAlpha(int color, int alpha) {
        return (color & 0x00ffffff) | ((alpha & 0xff) << 24);
    }

    private static int rgb(int red, int green, int blue) {
        return argb(255, red, green, blue);
    }

    private static int argb(int alpha, int red, int green, int blue) {
        return ((alpha & 0xff) << 24)
                | ((red & 0xff) << 16)
                | ((green & 0xff) << 8)
                | (blue & 0xff);
    }

    static final class Palette {
        final boolean dark;
        final int background;
        final int appBar;
        final int primaryText;
        final int secondaryText;
        final int divider;
        final int accent;
        final int pressed;

        private Palette(
                boolean dark,
                int background,
                int appBar,
                int primaryText,
                int secondaryText,
                int divider,
                int accent,
                int pressed
        ) {
            this.dark = dark;
            this.background = background;
            this.appBar = appBar;
            this.primaryText = primaryText;
            this.secondaryText = secondaryText;
            this.divider = divider;
            this.accent = accent;
            this.pressed = pressed;
        }
    }
}
