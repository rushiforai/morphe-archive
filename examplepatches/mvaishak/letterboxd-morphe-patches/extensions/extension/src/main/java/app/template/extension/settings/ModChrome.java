package app.template.extension.settings;

import android.content.res.ColorStateList;
import android.view.View;

import java.lang.reflect.Method;

/**
 * Runtime chrome tweaks that used to be baked in by resource patches, now gated on {@link Prefs}
 * so the "Mod settings" screen can toggle them. Applied once per screen setup; a change takes
 * effect on the next app start.
 */
public final class ModChrome {

    private ModChrome() {}

    /** Injected at the top of {@code MainActivity.setup} with the {@code BottomNavigationView}. */
    public static void applyBottomNav(View bottomNav) {
        try {
            if (bottomNav == null) return;
            Prefs.load(bottomNav.getContext());

            // The Material You theme patch styles the nav bar itself — don't paint over it.
            boolean materialYou = bottomNav.getContext().getResources().getIdentifier(
                    "morphe_my_surface", "color", bottomNav.getContext().getPackageName()) != 0;

            if (!materialYou && Prefs.getBoolean(Prefs.KEY_MATCH_BOTTOM_NAV, true)) {
                bottomNav.setBackgroundColor(0xFF000000); // @color/black100, the top bar colour
            }

            applyIndicator(bottomNav, Prefs.getString(Prefs.KEY_NAV_INDICATOR, "stock"));
        } catch (Throwable ignored) {
        }
    }

    /** The selected-icon colour is handled by an overlay in {@link ModThemeApi31}; this does the pill. */
    private static void applyIndicator(View nav, String style) {
        if ("stock".equals(style)) return;

        if ("accentPill".equals(style)) {
            android.content.Context ctx = nav.getContext();
            int accent = AccentPresets.previewColor(ctx,
                    Prefs.getString(Prefs.KEY_THEME_ACCENT, AccentPresets.defaultAccent(ctx)),
                    Prefs.getString(Prefs.KEY_THEME_ACCENT_HEX, ""));
            // ~22% alpha tint behind the selected icon
            int pill = (0x38 << 24) | (accent & 0xFFFFFF);
            invoke(nav, "setItemActiveIndicatorColor", ColorStateList.class,
                    ColorStateList.valueOf(pill));
        } else {
            // nopill / white / accent — drop the pill entirely
            invoke(nav, "setItemActiveIndicatorEnabled", boolean.class, Boolean.FALSE);
        }
    }

    private static void invoke(View target, String name, Class<?> paramType, Object arg) {
        try {
            Method m = target.getClass().getMethod(name, paramType);
            m.invoke(target, arg);
        } catch (Throwable ignored) {
        }
    }
}
