package app.template.extension.settings;

import android.content.Context;

/**
 * Resolves the app's own real surface colours so the Mod settings screen and its dialogs follow
 * whatever theme is actually active — stock, "Pure black (OLED)", or the separate "Material You
 * theme" patch — instead of a fixed hardcoded dark palette of their own.
 *
 * <p>{@code windowBackground}/{@code gray181C20} and {@code gray202830}/{@code gray1C242C} are
 * exactly the resources both theming systems already repaint (OLED's runtime overlay, Material
 * You's patch-time palette), so simply reading their current value through this {@link Context}'s
 * {@code Resources} already reflects whichever is active — no special-casing needed.
 */
final class SurfaceColors {

    private SurfaceColors() {}

    /** The app's main background surface. */
    static int background(Context ctx) {
        return resolve(ctx, new String[]{"windowBackground", "gray181C20"}, 0xFF0D0D0D);
    }

    /** A slightly elevated surface, for cards and dialogs. */
    static int elevated(Context ctx) {
        return resolve(ctx, new String[]{"gray202830", "gray1C242C"}, 0xFF161616);
    }

    private static int resolve(Context ctx, String[] names, int fallback) {
        for (String name : names) {
            try {
                int id = ctx.getResources().getIdentifier(name, "color", ctx.getPackageName());
                if (id != 0) return ctx.getResources().getColor(id, ctx.getTheme());
            } catch (Throwable ignored) {
            }
        }
        return fallback;
    }
}
