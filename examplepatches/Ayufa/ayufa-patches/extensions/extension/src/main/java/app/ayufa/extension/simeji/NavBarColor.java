package app.ayufa.extension.simeji;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;

import java.lang.reflect.Method;

/**
 * Resolves the colour for the strip below the keyboard (the
 * navigation-bar area the IME window paints on Android 15+).
 *
 * <p>Stock Simeji asks the current theme for a navigation-bar colour
 * via {@code ITheme.getNavigationBarBackColor()}, but only store
 * themes whose skin file defines {@code theme2022navigationbarbackcolor}
 * answer with a colour; every other theme returns null and the strip
 * is painted black (hard-coded fallback in
 * {@code SimejiKeyboardRootView.onDraw}, the IME window colour logic
 * in {@code ThemeManager.updateThemeNavBarColor} and an Android 15
 * compatibility block in {@code OpenWnn}). The patched call sites
 * always consult this helper: a non-null stock colour is returned
 * unchanged, and for a null colour this helper samples the theme's
 * keyboard background (falling back to the control-panel stuffer
 * background, then the emoji background colour, then black) and
 * returns that colour. There is no runtime setting for this; it is
 * simply built into the settings patch.
 *
 * <p>All Simeji classes are reached reflectively, like the rest of
 * the extension, so nothing here depends on the host app at compile
 * time. Sampling is cached per theme instance because the root
 * view's {@code onDraw} runs on every frame.
 */
public final class NavBarColor {

    private static final int BLACK = 0xFF000000;

    private static Object cachedTheme;
    private static Integer cachedColor;

    private NavBarColor() {
    }

    /**
     * The colour the patched call sites should use: [stockColor]
     * itself when the theme defines one, a sampled theme colour
     * when it does not, or null to keep the stock null handling
     * (any failure).
     */
    public static Integer resolveNavBarColor(Integer stockColor, Context context) {
        try {
            if (stockColor != null) {
                return stockColor;
            }
            Object theme = currentTheme();
            if (theme == null) {
                return null;
            }
            Integer themed = navigationBarBackColor(theme);
            if (themed != null) {
                return themed;
            }
            synchronized (NavBarColor.class) {
                if (theme == cachedTheme && cachedColor != null) {
                    return cachedColor;
                }
            }
            Context ctx = context != null ? context : appContext();
            Integer sampled = ctx != null ? sampleThemeColor(theme, ctx) : null;
            if (sampled == null) {
                sampled = BLACK;
            }
            synchronized (NavBarColor.class) {
                cachedTheme = theme;
                cachedColor = sampled;
            }
            return sampled;
        } catch (Throwable ignored) {
            // Any failure keeps the stock behaviour.
            return null;
        }
    }

    private static Object currentTheme() throws Exception {
        Class<?> themeManager = Class.forName("jp.baidu.simeji.theme.ThemeManager");
        Object instance = themeManager.getMethod("getInstance").invoke(null);
        if (instance == null) {
            return null;
        }
        return themeManager.getMethod("getCurTheme").invoke(instance);
    }

    private static Integer navigationBarBackColor(Object theme) {
        try {
            Object value = invokeTheme(theme, "getNavigationBarBackColor");
            return value instanceof Integer ? (Integer) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /**
     * Derives a representative colour from the theme's backgrounds:
     * the keyboard background first (its bottom-centre pixel, so the
     * strip continues the keyboard visually), then the control-panel
     * stuffer background, then the emoji background colour.
     */
    private static Integer sampleThemeColor(Object theme, Context context) {
        Drawable background = drawableThemeValue(theme, "getKeyboardBackground", context);
        if (background == null) {
            background = drawableThemeValue(
                    theme, "getControlPanelStufferBackground", context);
        }
        Integer sampled = sampleBottomCenter(background);
        if (sampled != null) {
            return sampled;
        }
        try {
            Object value = invokeTheme(theme, "getEmojiBackgroundColor", context);
            if (value instanceof Integer && (Integer) value != 0) {
                return (Integer) value | BLACK;
            }
        } catch (Throwable ignored) {
            // Fall through to the final fallback.
        }
        return null;
    }

    private static Drawable drawableThemeValue(
            Object theme, String methodName, Context context) {
        try {
            Object value = invokeTheme(theme, methodName, context);
            return value instanceof Drawable ? (Drawable) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /**
     * Renders the drawable into a small bitmap (the same trick
     * {@code AbstractTheme.getCandidateHeaderBackgroundColor} uses
     * with a 1x1 bitmap) and reads the bottom-centre pixel. Fully
     * transparent results are rejected so video skins, whose stuffer
     * background is transparent, fall through to the next source.
     */
    private static Integer sampleBottomCenter(Drawable drawable) {
        if (drawable == null) {
            return null;
        }
        Bitmap bitmap = null;
        try {
            int width = drawable.getIntrinsicWidth();
            int height = drawable.getIntrinsicHeight();
            if (width <= 0) {
                width = 32;
            }
            if (height <= 0) {
                height = 32;
            }
            width = Math.min(width, 64);
            height = Math.min(height, 64);
            bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmap);
            drawable.setBounds(0, 0, width, height);
            drawable.draw(canvas);
            int pixel = bitmap.getPixel(width / 2, height - 1);
            if ((pixel >>> 24) == 0) {
                return null;
            }
            return pixel | BLACK;
        } catch (Throwable ignored) {
            return null;
        } finally {
            if (bitmap != null) {
                bitmap.recycle();
            }
        }
    }

    /** Invokes a no-argument method of {@code jp.baidu.simeji.theme.ITheme}. */
    private static Object invokeTheme(Object theme, String methodName) throws Exception {
        return themeMethod(theme, methodName).invoke(theme);
    }

    /** Invokes a {@code Context}-argument method of the theme interface. */
    private static Object invokeTheme(
            Object theme, String methodName, Context context) throws Exception {
        return themeMethod(theme, methodName, Context.class).invoke(theme, context);
    }

    private static Method themeMethod(
            Object theme, String methodName, Class<?>... params) throws Exception {
        try {
            return theme.getClass().getMethod(methodName, params);
        } catch (NoSuchMethodException ignored) {
            // Some implementations only expose the method through the
            // interface; retry there before giving up.
            Class<?> iTheme = Class.forName("jp.baidu.simeji.theme.ITheme");
            return iTheme.getMethod(methodName, params);
        }
    }

    /**
     * Resolves the application context for call sites that have no
     * context of their own to pass in.
     */
    private static Context appContext() {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Method currentApplication = activityThread.getMethod("currentApplication");
            Object application = currentApplication.invoke(null);
            if (application instanceof Context) {
                return (Context) application;
            }
        } catch (Throwable ignored) {
            // No context available: callers fall back to black.
        }
        return null;
    }
}
