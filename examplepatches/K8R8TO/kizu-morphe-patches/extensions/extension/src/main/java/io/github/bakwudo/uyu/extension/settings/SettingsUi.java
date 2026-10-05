package io.github.bakwudo.uyu.extension.settings;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Color;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import io.github.bakwudo.uyu.extension.Utils;

/**
 * Theme helpers for Kizu-owned UI.
 *
 * Twitch owns the application theme. These helpers only resolve that existing theme for
 * extension-owned preference/picker surfaces; they never alter Twitch's activity or view tree.
 */
public final class SettingsUi {
    private static final int FALLBACK_LIGHT = 0xFFF7F7F8;
    private static final int FALLBACK_DARK = 0xFF0E0E10;
    private static final int FALLBACK_SURFACE_LIGHT = Color.WHITE;
    private static final int FALLBACK_SURFACE_DARK = 0xFF18181B;
    private static final int FALLBACK_ALT_LIGHT = 0xFFF2F2F3;
    private static final int FALLBACK_ALT_DARK = 0xFF26262C;
    private static final int FALLBACK_TEXT_LIGHT = 0xFF0E0E10;
    private static final int FALLBACK_TEXT_DARK = 0xFFF0F0F0;
    private static final int FALLBACK_SECONDARY_LIGHT = 0xFF5C5C66;
    private static final int FALLBACK_SECONDARY_DARK = 0xFFADADB8;

    private SettingsUi() {}

    public static int dp(Context context, float dp) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP,
                dp,
                context.getResources().getDisplayMetrics()));
    }

    /**
     * Resolve Twitch's actual theme state rather than Android's system night-mode flag.
     * Twitch's ThemeManager is the authority because Twitch can be Light while Android itself
     * remains in a dark system configuration.
     */
    public static boolean isDark(Context context) {
        Context themeContext = themeResolutionContext(context);
        Boolean userTheme = twitchUserTheme(themeContext);
        if (userTheme != null) return userTheme;
        Boolean twitch = twitchNightMode(themeContext);
        if (twitch != null) return twitch;

        int raw = twitchColor(themeContext, "background_body");
        if (raw != Integer.MIN_VALUE) return luminance(raw) < 128d;

        TypedValue value = new TypedValue();
        if (themeContext != null && themeContext.getTheme().resolveAttribute(
                android.R.attr.colorBackground, value, true)) {
            if (value.type >= TypedValue.TYPE_FIRST_COLOR_INT &&
                    value.type <= TypedValue.TYPE_LAST_COLOR_INT) {
                return luminance(value.data) < 128d;
            }
        }

        return false;
    }

    /**
     * Returns a body background consistent with Twitch's resolved Light/Dark mode.
     */
    public static int backgroundColor(Context context) {
        boolean dark = isDark(context);
        int fallback = dark ? FALLBACK_DARK : FALLBACK_LIGHT;
        int raw = twitchColor(context, "background_body");
        return colorMatchesTheme(raw, dark) ? raw : fallback;
    }

    public static int surfaceColor(Context context) {
        boolean dark = isDark(context);
        int fallback = dark ? FALLBACK_SURFACE_DARK : FALLBACK_SURFACE_LIGHT;
        int raw = twitchColor(context, "background_base");
        return colorMatchesTheme(raw, dark) ? raw : fallback;
    }

    public static int alternateBackgroundColor(Context context) {
        boolean dark = isDark(context);
        int fallback = dark ? FALLBACK_ALT_DARK : FALLBACK_ALT_LIGHT;
        int raw = twitchColor(context, "background_alt");
        return colorMatchesTheme(raw, dark) ? raw : fallback;
    }

    public static int primaryTextColor(Context context) {
        boolean dark = isDark(context);
        int fallback = dark ? FALLBACK_TEXT_DARK : FALLBACK_TEXT_LIGHT;
        int raw = twitchColor(context, "text_base");
        return textMatchesTheme(raw, dark) ? raw : fallback;
    }

    public static int secondaryTextColor(Context context) {
        boolean dark = isDark(context);
        int fallback = dark ? FALLBACK_SECONDARY_DARK : FALLBACK_SECONDARY_LIGHT;
        int raw = twitchColor(context, "text_alt_2");
        if (raw == Integer.MIN_VALUE) raw = twitchColor(context, "text_alt");
        return textMatchesTheme(raw, dark) ? raw : fallback;
    }

    public static int dividerColor(Context context) {
        int base = primaryTextColor(context);
        return Color.argb(
                isDark(context) ? 0x26 : 0x1F,
                Color.red(base), Color.green(base), Color.blue(base));
    }

    /**
     * Creates preference controls with the resolved Light/Dark platform theme. Twitch uses its
     * own AppCompat/Compose theme, but platform Preference widgets otherwise follow stale system
     * styling when the user switches Twitch's theme independently.
     */
    public static Context preferenceContext(Context context) {
        if (context == null) return null;
        return new ContextThemeWrapper(
                context,
                isDark(context)
                        ? android.R.style.Theme_DeviceDefault
                        : android.R.style.Theme_DeviceDefault_Light);
    }

    /**
     * Styles only the Kizu preference fragment root. Twitch's activity and other native screens
     * are intentionally left untouched.
     */
    public static void applySettingsView(View root) {
        if (root == null) return;
        Context context = root.getContext();
        root.setBackgroundColor(backgroundColor(context));

        View list = root.findViewById(android.R.id.list);
        if (list != null) list.setBackgroundColor(backgroundColor(context));

        styleTextTree(root, context);
    }

    private static void styleTextTree(View view, Context context) {
        if (view instanceof TextView) {
            TextView text = (TextView) view;
            boolean summary = text.getId() == android.R.id.summary;
            text.setTextColor(summary ? secondaryTextColor(context) : primaryTextColor(context));
        }
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            styleTextTree(group.getChildAt(i), context);
        }
    }

    private static Context themeResolutionContext(Context context) {
        if (context == null) return null;
        try {
            Context application = context.getApplicationContext();
            return application != null ? application : context;
        } catch (Throwable ignored) {
            return context;
        }
    }

    private static Boolean twitchUserTheme(Context context) {
        if (context == null) return null;
        try {
            android.content.SharedPreferences prefs =
                    android.preference.PreferenceManager.getDefaultSharedPreferences(context);
            String value = prefs.getString("user_theme", null);
            if ("DARK".equalsIgnoreCase(value)) return true;
            if ("LIGHT".equalsIgnoreCase(value)) return false;
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static Boolean twitchNightMode(Context context) {
        if (context == null) return null;
        try {
            Class<?> manager = Class.forName("tv.twitch.android.app.core.ThemeManager");
            java.lang.reflect.Field companionField = manager.getDeclaredField("Companion");
            companionField.setAccessible(true);
            Object companion = companionField.get(null);
            if (companion == null) return null;

            java.lang.reflect.Method method =
                    companion.getClass().getMethod("isNightModeEnabled", Context.class);
            Object value = method.invoke(companion, context);
            return value instanceof Boolean ? (Boolean) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static int twitchColor(Context context, String name) {
        Context themeContext = themeResolutionContext(context);
        if (themeContext == null) return Integer.MIN_VALUE;
        try {
            int id = Utils.getResourceId(themeContext, name, "color");
            if (id != 0) return themeContext.getColor(id);
        } catch (Throwable ignored) {
        }
        return Integer.MIN_VALUE;
    }

    private static boolean colorMatchesTheme(int color, boolean dark) {
        if (color == Integer.MIN_VALUE) return false;
        return (luminance(color) < 128d) == dark;
    }

    private static boolean textMatchesTheme(int color, boolean dark) {
        if (color == Integer.MIN_VALUE) return false;
        return (luminance(color) < 160d) != dark;
    }

    private static double luminance(int color) {
        return 0.299d * Color.red(color)
                + 0.587d * Color.green(color)
                + 0.114d * Color.blue(color);
    }

    @SuppressWarnings("deprecation")
    public static AlertDialog.Builder dialog(Context context) {
        return new AlertDialog.Builder(context, isDark(context)
                ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert);
    }
}
