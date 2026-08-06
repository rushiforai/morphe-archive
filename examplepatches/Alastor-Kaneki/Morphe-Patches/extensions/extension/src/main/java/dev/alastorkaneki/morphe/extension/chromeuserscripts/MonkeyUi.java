package dev.alastorkaneki.morphe.extension.chromeuserscripts;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.TextView;

/** Chrome/Material You styling resolved from the patched app's current theme. */
final class MonkeyUi {
    private MonkeyUi() { }

    static boolean dark(Activity activity) {
        return (activity.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }

    static int bg(Activity activity) {
        return color(activity,
                dark(activity) ? 0xFF202124 : 0xFFF8F9FA,
                "colorSurface", "colorBackground", "windowBackground");
    }

    static int surface(Activity activity) {
        return color(activity,
                dark(activity) ? 0xFF292A2D : Color.WHITE,
                "colorSurfaceContainer", "colorSurface", "colorBackgroundFloating");
    }

    static int surfaceVariant(Activity activity) {
        return color(activity,
                dark(activity) ? 0xFF3C4043 : 0xFFE8EAED,
                "colorSurfaceContainerHigh", "colorSurfaceVariant", "colorControlHighlight");
    }

    static int primary(Activity activity) {
        return color(activity,
                dark(activity) ? 0xFFA8C7FA : 0xFF0B57D0,
                "colorPrimary", "colorAccent", "colorControlActivated");
    }

    static int secondary(Activity activity) {
        return color(activity,
                dark(activity) ? 0xFFC2E7FF : 0xFF146C94,
                "colorSecondary", "colorPrimaryVariant", "colorAccent");
    }

    static int onPrimary(Activity activity) {
        return color(activity,
                readableOn(primary(activity)),
                "colorOnPrimary", "textColorPrimaryInverse");
    }

    static int text(Activity activity) {
        return color(activity,
                dark(activity) ? 0xFFE8EAED : 0xFF202124,
                "colorOnSurface", "textColorPrimary");
    }

    static int muted(Activity activity) {
        return color(activity,
                dark(activity) ? 0xFFBDC1C6 : 0xFF5F6368,
                "colorOnSurfaceVariant", "textColorSecondary");
    }

    static int outline(Activity activity) {
        return color(activity,
                dark(activity) ? 0xFF5F6368 : 0xFFDADCE0,
                "colorOutlineVariant", "colorOutline", "colorControlNormal");
    }

    static void window(Activity activity) {
        int background = bg(activity);
        activity.getWindow().setStatusBarColor(background);
        activity.getWindow().setNavigationBarColor(background);
        activity.getWindow().getDecorView().setBackgroundColor(background);

        int flags = activity.getWindow().getDecorView().getSystemUiVisibility();
        if (isLight(background)) {
            flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
            flags |= View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
        } else {
            flags &= ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
            flags &= ~View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
        }
        activity.getWindow().getDecorView().setSystemUiVisibility(flags);
    }

    static TextView button(Activity activity, String label, boolean primary) {
        TextView view = new TextView(activity);
        view.setText(label);
        view.setTextColor(primary ? onPrimary(activity) : text(activity));
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        view.setTypeface(Typeface.DEFAULT_BOLD);
        view.setGravity(Gravity.CENTER);
        view.setMinHeight(dp(activity, 48));
        view.setPadding(dp(activity, 18), dp(activity, 10), dp(activity, 18), dp(activity, 10));
        view.setClickable(true);
        view.setFocusable(true);

        GradientDrawable shape = new GradientDrawable();
        shape.setColor(primary ? primary(activity) : surfaceVariant(activity));
        if (!primary) shape.setStroke(dp(activity, 1), outline(activity));
        shape.setCornerRadius(dp(activity, 24));

        int ripple = withAlpha(primary ? onPrimary(activity) : text(activity), 0x28);
        view.setBackground(new RippleDrawable(ColorStateList.valueOf(ripple), shape, null));
        return view;
    }

    static GradientDrawable card(Activity activity) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(surface(activity));
        drawable.setCornerRadius(dp(activity, 20));
        drawable.setStroke(dp(activity, 1), outline(activity));
        return drawable;
    }

    static GradientDrawable input(Activity activity) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(surface(activity));
        drawable.setCornerRadius(dp(activity, 14));
        drawable.setStroke(dp(activity, 1), outline(activity));
        return drawable;
    }

    static int dp(Activity activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    private static int color(Activity activity, int fallback, String... names) {
        for (String name : names) {
            int attr = activity.getResources().getIdentifier(name, "attr", activity.getPackageName());
            if (attr == 0) attr = activity.getResources().getIdentifier(name, "attr", "com.android.chrome");
            if (attr == 0) attr = activity.getResources().getIdentifier(name, "attr", "android");
            if (attr == 0) continue;

            TypedValue value = new TypedValue();
            if (!activity.getTheme().resolveAttribute(attr, value, true)) continue;
            try {
                if (value.resourceId != 0) return activity.getColor(value.resourceId);
            } catch (Throwable ignored) { }
            if (value.type >= TypedValue.TYPE_FIRST_COLOR_INT
                    && value.type <= TypedValue.TYPE_LAST_COLOR_INT) {
                return value.data;
            }
        }
        return fallback;
    }

    private static int readableOn(int color) {
        return isLight(color) ? 0xFF202124 : Color.WHITE;
    }

    private static boolean isLight(int color) {
        double r = channel(Color.red(color));
        double g = channel(Color.green(color));
        double b = channel(Color.blue(color));
        return 0.2126 * r + 0.7152 * g + 0.0722 * b > 0.48;
    }

    private static double channel(int value) {
        double c = value / 255.0;
        return c <= 0.03928 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4);
    }

    private static int withAlpha(int color, int alpha) {
        return Color.argb(alpha, Color.red(color), Color.green(color), Color.blue(color));
    }
}
