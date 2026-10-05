package app.template.extension.settings;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;

/**
 * Runtime theme overlays for the "Mod settings" screen. Loads the user's chosen dark surface
 * theme ({@code oled} / {@code purple} / {@code midnight}, or none for {@code stock}) plus accent
 * and nav-icon overlays, via {@code ResourcesLoader} on Android 12+.
 *
 * <p>Toggling a pref triggers a restart (see {@link RestartHelper}), so there is no in-session
 * "remove overlay" path — at process start the overlay is either loaded everywhere or not at all.
 * On Android 11 and below {@code ResourcesLoader} doesn't exist, so this is a no-op and the theme
 * stays Stock.
 */
public final class ModTheme {

    private ModTheme() {}

    public static boolean isSupported() {
        return Build.VERSION.SDK_INT >= 31;
    }

    /** Injected at the top of {@code LetterboxdApplication.onCreate}. */
    public static void initialize(Context context) {
        try {
            if (!isSupported() || context == null) return;

            Prefs.load(context);
            String surface = Prefs.surface(); // stock | oled | purple | midnight
            // The Material You theme patch owns the surfaces; don't stack a surface overlay on it.
            if (context.getResources().getIdentifier("morphe_my_surface", "color",
                    context.getPackageName()) != 0) {
                surface = "stock";
            }
            String accent = Prefs.getString(Prefs.KEY_THEME_ACCENT, AccentPresets.defaultAccent(context));
            String navStyle = Prefs.getString(Prefs.KEY_NAV_INDICATOR, "stock");
            boolean hasSurface = surface != null && !"stock".equals(surface);
            boolean hasAccent = accent != null && !accent.isEmpty() && !"green".equals(accent);
            boolean hasNavIcon = "white".equals(navStyle) || "accent".equals(navStyle)
                    || "accentPill".equals(navStyle);
            if (!hasSurface && !hasAccent && !hasNavIcon) return;

            ModThemeApi31.prepare(context, surface, accent, navStyle);
            ModThemeApi31.applyTo(context.getResources());

            Context appContext = context.getApplicationContext();
            if (appContext instanceof Application) {
                ((Application) appContext).registerActivityLifecycleCallbacks(new Lifecycle());
            }
        } catch (Throwable ignored) {
        }
    }

    private static final class Lifecycle implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityPreCreated(Activity activity, Bundle savedInstanceState) {
            if (activity != null) ModThemeApi31.applyTo(activity.getResources());
        }

        @Override public void onActivityCreated(Activity a, Bundle b) {}
        @Override public void onActivityStarted(Activity a) {}
        @Override public void onActivityResumed(Activity a) {}
        @Override public void onActivityPaused(Activity a) {}
        @Override public void onActivityStopped(Activity a) {}
        @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
        @Override public void onActivityDestroyed(Activity a) {}
    }
}
