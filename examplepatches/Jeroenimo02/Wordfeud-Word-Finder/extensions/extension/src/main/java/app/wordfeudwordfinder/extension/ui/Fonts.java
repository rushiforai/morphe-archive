package app.wordfeudwordfinder.extension.ui;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Typeface;

/**
 * Inter and Droid Sans Mono from the host app's Flutter assets (spec section 9).
 * In a Flutter release APK the assets live under assets/flutter_assets/..., which AssetManager sees as
 * "flutter_assets/...". Loaded once and cached; any failure falls back to the system fonts.
 */
public final class Fonts {
    static final String INTER = "flutter_assets/fonts/InterVariable.ttf";
    static final String MONO = "flutter_assets/fonts/DroidSansMono.ttf";

    private static volatile Typeface inter;
    private static volatile Typeface mono;

    private Fonts() {}

    /** Inter, or {@link Typeface#DEFAULT} if it cannot be loaded. */
    public static Typeface inter(Context ctx) {
        Typeface t = inter;
        if (t == null) {
            t = load(ctx, INTER, Typeface.DEFAULT);
            inter = t;
        }
        return t;
    }

    /** Inter in bold (synthetic bold if the variable font has no bold instance). */
    public static Typeface interBold(Context ctx) {
        try {
            return Typeface.create(inter(ctx), Typeface.BOLD);
        } catch (Throwable e) {
            return Typeface.DEFAULT_BOLD;
        }
    }

    /** Droid Sans Mono, or {@link Typeface#MONOSPACE} if it cannot be loaded. */
    public static Typeface mono(Context ctx) {
        Typeface t = mono;
        if (t == null) {
            t = load(ctx, MONO, Typeface.MONOSPACE);
            mono = t;
        }
        return t;
    }

    private static Typeface load(Context ctx, String path, Typeface fallback) {
        try {
            if (ctx == null) return fallback;
            AssetManager am = ctx.getAssets();
            if (am == null) return fallback;
            Typeface t = Typeface.createFromAsset(am, path);
            return t != null ? t : fallback;
        } catch (Throwable e) {
            return fallback;
        }
    }
}
