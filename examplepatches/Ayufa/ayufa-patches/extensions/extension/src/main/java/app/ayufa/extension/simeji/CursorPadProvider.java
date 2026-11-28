package app.ayufa.extension.simeji;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * A control-panel item for cursor movement, presented to Simeji as
 * a regular plus/launcher provider so it takes part in the stock
 * toolbar customization exactly like the built-in items (keyboard
 * switch, copy, clipboard, ...): the toolbar settings list it under
 * "カーソル移動" (catalogue index 19, see {@link CursorPadCatalog}),
 * the user places it in any of the four customizable slots, and the
 * stock {@code BaseLauncher} builds its icon view from it.
 *
 * <p>The provider object is a dynamic proxy implementing the host
 * app's {@code IPlus} and {@code ILauchable} interfaces: the
 * extension is compiled without the host app on its classpath, so
 * the interfaces are loaded reflectively from the plus manager's
 * class loader and every call is answered by the handler below.
 * Only the handful of methods the launcher actually uses carry
 * behaviour; the rest (mostly lifecycle callbacks) return defaults.
 *
 * <p>The icon is Simeji for iPhone's cursor key: an I-beam text
 * cursor flanked by two chevron strokes ("&lt;I&gt;"). It is drawn
 * in solid black and reported as needing the theme colour filter,
 * so the stock icon view tints it with the current theme's
 * candidate icon colour, like the built-in items' fallback icons.
 */
public final class CursorPadProvider {

    /** Key reported to the launcher (recorded for provider panels). */
    static final String KEY = "AyufaCursorPad";
    /** Index in the toolbar customization catalogue (see the patch). */
    public static final int TOOLBAR_INDEX = 19;
    private static final String TITLE = "カーソル移動";
    /** Same icon size as the built-in helper-created providers. */
    private static final int ICON_AUTO_SIZE = 23;

    private CursorPadProvider() {
    }

    /**
     * Creates the provider for the given plus manager. Called from
     * the patched {@code BaseLauncher.getIconByIndex} when the
     * toolbar configuration asks for index {@link #TOOLBAR_INDEX};
     * the declared return type is Object because the host interfaces
     * are not on the extension's compile classpath (the caller casts
     * to ILauchable in the patched code).
     */
    public static Object create(Object plusManager) {
        if (plusManager == null) {
            return null;
        }
        try {
            ClassLoader loader = plusManager.getClass().getClassLoader();
            Class<?> iPlus = Class.forName(
                    "com.adamrocker.android.input.simeji.framework.IPlus",
                    false, loader);
            Class<?> iLauchable = Class.forName(
                    "com.adamrocker.android.input.simeji.framework.ILauchable",
                    false, loader);
            return Proxy.newProxyInstance(
                    loader,
                    new Class<?>[]{iPlus, iLauchable},
                    new Handler(plusManager));
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Whether a launcher icon view's tag is one of these providers. */
    public static boolean isCursorPad(Object tag) {
        if (tag == null || !Proxy.isProxyClass(tag.getClass())) {
            return false;
        }
        try {
            return Proxy.getInvocationHandler(tag) instanceof Handler;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static final class Handler implements InvocationHandler {

        private final Object plusManager;

        Handler(Object plusManager) {
            this.plusManager = plusManager;
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) {
            String name = method.getName();
            switch (name) {
                case "getKey":
                    return KEY;
                case "getPlusManager":
                    return plusManager;
                case "getContentDescription":
                    return TITLE;
                case "getIconAutoSize":
                    return ICON_AUTO_SIZE;
                case "getIconNeedFilter":
                    return Boolean.TRUE;
                case "getLauncherIcon":
                    return new CursorIconDrawable();
                case "onLaunch":
                case "run":
                case "onRegister":
                case "onUnregister":
                    return null;
                case "equals":
                    return proxy == (args != null && args.length > 0 ? args[0] : null);
                case "hashCode":
                    return System.identityHashCode(proxy);
                case "toString":
                    return KEY;
                default:
                    return defaultValue(method.getReturnType());
            }
        }

        private static Object defaultValue(Class<?> type) {
            if (!type.isPrimitive() || type == void.class) {
                return null;
            }
            if (type == boolean.class) {
                return Boolean.FALSE;
            }
            if (type == char.class) {
                return (char) 0;
            }
            if (type == byte.class) {
                return (byte) 0;
            }
            if (type == short.class) {
                return (short) 0;
            }
            if (type == int.class) {
                return 0;
            }
            if (type == long.class) {
                return 0L;
            }
            if (type == float.class) {
                return 0f;
            }
            return 0d;
        }
    }

    /**
     * The cursor key glyph of Simeji for iPhone, as seen on its
     * control panel: an I-beam text cursor (a vertical stroke with
     * a serif at each end) flanked by two chevron strokes, "&lt;I&gt;".
     * Drawn as round-capped strokes in solid black; the stock icon
     * view applies the theme colour filter on top because the
     * provider reports getIconNeedFilter(). The geometry lives in a
     * 24-unit box and matches the settings icon the resource patch
     * generates, so both renderings of the item agree.
     */
    static final class CursorIconDrawable extends Drawable {

        // Segments of the glyph in a 24-unit box: I-beam, then the
        // two chevrons. Kept in sync with the PNG the patch adds
        // for the toolbar settings screens.
        private static final float[][] SEGMENTS = {
                {12f, 4.7f, 12f, 19.3f},
                {9.9f, 4.7f, 14.1f, 4.7f},
                {9.9f, 19.3f, 14.1f, 19.3f},
                {7.5f, 7.6f, 4.0f, 12f},
                {4.0f, 12f, 7.5f, 16.4f},
                {16.5f, 7.6f, 20.0f, 12f},
                {20.0f, 12f, 16.5f, 16.4f},
        };
        private static final float STROKE_WIDTH = 0.9f;

        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();

        CursorIconDrawable() {
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setColor(0xFF000000);
        }

        @Override
        public int getIntrinsicWidth() {
            return 96;
        }

        @Override
        public int getIntrinsicHeight() {
            return 96;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            if (bounds.width() <= 0 || bounds.height() <= 0) {
                return;
            }
            float scaleX = bounds.width() / 24.0f;
            float scaleY = bounds.height() / 24.0f;
            paint.setStrokeWidth(STROKE_WIDTH * Math.min(scaleX, scaleY));
            path.reset();
            for (float[] segment : SEGMENTS) {
                path.moveTo(
                        bounds.left + segment[0] * scaleX,
                        bounds.top + segment[1] * scaleY);
                path.lineTo(
                        bounds.left + segment[2] * scaleX,
                        bounds.top + segment[3] * scaleY);
            }
            canvas.drawPath(path, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public int getAlpha() {
            return paint.getAlpha();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
