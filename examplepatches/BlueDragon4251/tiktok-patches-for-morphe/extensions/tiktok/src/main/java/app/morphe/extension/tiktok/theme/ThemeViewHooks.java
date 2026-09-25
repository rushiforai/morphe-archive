package app.morphe.extension.tiktok.theme;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.view.View;
import android.view.ViewParent;

import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.shared.Logger;

/**
 * Narrow native-view hooks for TikTok 46.7.3 surfaces that do not reliably repaint through the
 * generic TUX resolver alone.
 *
 * These hooks are exact and bounded: the bytecode patch calls them only from verified bottom-tab,
 * profile-sidebar and SettingsComposeRvmpFragment lifecycle paths. Every operation is fail-open.
 */
@SuppressWarnings({"unused", "deprecation"})
public final class ThemeViewHooks {
    private static final AtomicBoolean SETTINGS_COMPOSE_LOGGED = new AtomicBoolean(false);

    private ThemeViewHooks() {}

    /** Called from MainPageBusinessAssem after TikTok has assigned/animated its bottom-tab view. */
    public static void styleBottomNavigation(View backgroundView) {
        ThemeNativeTargets.navigation(backgroundView);
    }

    /**
     * Exact root hook for SettingsComposeRvmpFragment. TUX token replacement styles semantic
     * content; this hook supplies the missing page/root backdrop that Compose otherwise paints with
     * TikTok's stock container color.
     */
    public static void styleSettingsCompose(View composeRoot) {
        try {
            if (composeRoot == null) return;
            Context context = composeRoot.getContext();
            if (!themeActive(context)) return;

            applySettingsCompose(composeRoot);
            composeRoot.post(() -> applySettingsCompose(composeRoot));
            composeRoot.postDelayed(() -> applySettingsCompose(composeRoot), 100L);
            composeRoot.postDelayed(() -> applySettingsCompose(composeRoot), 320L);
            composeRoot.postDelayed(() -> applySettingsCompose(composeRoot), 800L);
            ThemeEngine.requestReapply();

            if (SETTINGS_COMPOSE_LOGGED.compareAndSet(false, true)) {
                Logger.printInfo(() -> "[BlueIT Theme View] SettingsComposeRvmpFragment root styled");
            }
        } catch (Throwable ignored) {
        }
    }

    private static void applySettingsCompose(View composeRoot) {
        try {
            Context context = composeRoot.getContext();
            if (!themeActive(context)) return;

            int background = ThemeEngine.backgroundColor(context);
            int surface = ThemeEngine.surfaceColor(context);
            int accent = ThemeEngine.accentColor(context);
            int divider = ThemeEngine.dividerColor(context);
            boolean glass = ThemeStateStore.isLiquidGlass(context);

            // Give the translucent Compose root something visible to reveal underneath it. This is
            // intentionally scoped to the verified SettingsComposeRvmpFragment parent only.
            ViewParent parent = composeRoot.getParent();
            if (parent instanceof View) {
                View parentView = (View) parent;
                if (glass) {
                    GradientDrawable backdrop = new GradientDrawable(
                            GradientDrawable.Orientation.TL_BR,
                            new int[]{
                                    mixOpaque(background, accent, 0.14f),
                                    mixOpaque(background, Color.WHITE, 0.035f),
                                    mixOpaque(background, accent, 0.055f)
                            }
                    );
                    parentView.setBackground(backdrop);
                } else {
                    parentView.setBackgroundColor(opaque(background));
                }
            }

            GradientDrawable root = new GradientDrawable();
            root.setShape(GradientDrawable.RECTANGLE);
            root.setColor(glass ? surface : background);
            if (glass || Color.alpha(surface) < 250) {
                root.setStroke(Math.max(1, Math.round(dp(context, 1))), divider);
            }
            composeRoot.setBackground(root);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                composeRoot.setBackgroundTintList(null);
            }
        } catch (Throwable ignored) {
        }
    }

    public static void styleProfileSidebar(View sidebarRoot) {
        ThemeNativeTargets.sidebar(sidebarRoot);
    }

    private static boolean themeActive(Context context) {
        try {
            return context != null && !"default".equals(ThemeStateStore.currentPreset(context));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static int opaque(int color) {
        return Color.rgb(Color.red(color), Color.green(color), Color.blue(color));
    }

    private static int mixOpaque(int source, int target, float amount) {
        float t = Math.max(0f, Math.min(1f, amount));
        int red = Math.round(Color.red(source) * (1f - t) + Color.red(target) * t);
        int green = Math.round(Color.green(source) * (1f - t) + Color.green(target) * t);
        int blue = Math.round(Color.blue(source) * (1f - t) + Color.blue(target) * t);
        return Color.rgb(red, green, blue);
    }

    private static float dp(Context context, int value) {
        try {
            return value * context.getResources().getDisplayMetrics().density;
        } catch (Throwable ignored) {
            return value;
        }
    }
}
