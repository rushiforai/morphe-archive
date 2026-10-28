package app.immersivekeyboard.extension;

import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RadialGradient;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.SystemClock;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Gives the floating popups Gboard shows while a hardware keyboard is in use, the keyboard
 * switcher and the menu it opens, the same liquid glass as the keyboard: the system's
 * refracting glass material behind them, and the light that blooms from the finger when they
 * are touched. Popups over the on-screen keyboard already sit on its glass and are left alone.
 */
@SuppressWarnings("unused")
public final class GlassPopups {
    private static final String TAG = "ImmersiveKB";
    private static final int FALLBACK_BLUR_RADIUS_PX = 60;
    private static final float FALLBACK_CORNER_DP = 28;

    /** The view carrying each popup's glass, and its glass. */
    private static final Map<View, Glass> GLASS = new WeakHashMap<>();
    private static volatile boolean glowEnabled;

    private GlassPopups() {
    }

    /** Injection point. Called right after Gboard positions a floating popup's container. */
    public static void style(View container) {
        try {
            GlassPanel.enable();
            // Popups are filled in after they are positioned.
            container.post(() -> apply(container));
        } catch (Throwable ignored) {
            // Never get in the way of the keyboard.
        }
    }

    /** Injection point. Present only when the Glass Press Effect patch is applied. */
    public static void enableGlow() {
        glowEnabled = true;
    }

    /** Injection point. Called first thing when the popup layer receives a touch. */
    public static void onTouch(View layer, MotionEvent event) {
        try {
            int action = event.getActionMasked();
            if (!glowEnabled || (action != MotionEvent.ACTION_DOWN
                    && action != MotionEvent.ACTION_POINTER_DOWN)) {
                return;
            }
            int index = event.getActionIndex();
            float x = event.getRawX(index);
            float y = event.getRawY(index);
            int[] location = new int[2];
            for (Map.Entry<View, Glass> entry : new ArrayList<>(GLASS.entrySet())) {
                View view = entry.getKey();
                if (view == null || !view.isShown()) {
                    continue;
                }
                view.getLocationOnScreen(location);
                float localX = x - location[0];
                float localY = y - location[1];
                if (localX >= 0 && localY >= 0 && localX <= view.getWidth()
                        && localY <= view.getHeight()) {
                    entry.getValue().glow.flash(localX, localY);
                }
            }
        } catch (Throwable ignored) {
            // Feedback must never get in the way of typing.
        }
    }

    private static void apply(View container) {
        try {
            if (!(container instanceof ViewGroup) || ((ViewGroup) container).getChildCount() == 0) {
                return;
            }
            View content = ((ViewGroup) container).getChildAt(0);
            if (FloatingWidget.inputViewShown(container.getRootView())) {
                restore(content);
                return;
            }
            View surface = findSurface(content, content.getWidth() * 0.8f,
                    content.getHeight() * 0.8f);
            if (surface == null) {
                return;
            }
            boolean dark = (surface.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
            Glass glass = GLASS.get(surface);
            if (glass != null && surface.getBackground() == glass.background
                    && glass.dark == dark) {
                return;
            }
            Drawable original = glass != null && surface.getBackground() == glass.background
                    ? glass.original : surface.getBackground();
            float radius = cornerRadius(surface, original);
            Drawable blur = createBlur(surface);
            if (blur == null) {
                return;
            }
            int blurRadius = BottomBarOpacity.frostedBlurRadiusPx(surface.getContext());
            invoke(blur, "setBlurRadius", new Class<?>[]{int.class},
                    blurRadius > 0 ? blurRadius : FALLBACK_BLUR_RADIUS_PX);
            invoke(blur, "setCornerRadius", new Class<?>[]{float.class}, radius);
            GlassPanel.applySystemGlass(blur, dark);
            refresh(blur);
            Drawable background = original == null ? blur
                    : new LayerDrawable(new Drawable[]{original, blur});
            surface.setBackground(background);
            Glow glow = glass != null ? glass.glow : new Glow(radius);
            glow.radius = radius;
            surface.setForeground(glow);
            GLASS.put(surface, new Glass(original, background, glow, dark));
        } catch (Throwable failure) {
            Log.w(TAG, "popup glass failed: " + failure);
        }
    }

    /** Puts back the original background of a popup that had glass. */
    private static void restore(View content) {
        for (Map.Entry<View, Glass> entry : new ArrayList<>(GLASS.entrySet())) {
            View view = entry.getKey();
            if (view != null && isWithin(view, content)
                    && view.getBackground() == entry.getValue().background) {
                view.setBackground(entry.getValue().original);
                view.setForeground(null);
                GLASS.remove(view);
            }
        }
    }

    private static boolean isWithin(View view, View ancestor) {
        for (View current = view; current != null;
                current = current.getParent() instanceof View ? (View) current.getParent() : null) {
            if (current == ancestor) {
                return true;
            }
        }
        return false;
    }

    /** The outermost view that paints the popup's backdrop: its own panel, not a key. */
    private static View findSurface(View view, float minWidth, float minHeight) {
        if (view.getVisibility() != View.VISIBLE) {
            return null;
        }
        if (view.getBackground() != null && view.getWidth() >= minWidth
                && view.getHeight() >= minHeight) {
            return view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                View found = findSurface(group.getChildAt(index), minWidth, minHeight);
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }

    /** The corner radius of the popup's own shape, so the glass follows it exactly. */
    private static float cornerRadius(View view, Drawable background) {
        if (background != null && view.getWidth() > 0 && view.getHeight() > 0) {
            Rect bounds = new Rect(background.getBounds());
            background.setBounds(0, 0, view.getWidth(), view.getHeight());
            Outline outline = new Outline();
            background.getOutline(outline);
            background.setBounds(bounds);
            float radius = outline.getRadius();
            if (radius > 0) {
                return radius;
            }
        }
        float fallback = FALLBACK_CORNER_DP * view.getResources().getDisplayMetrics().density;
        return Math.min(fallback, view.getHeight() / 2f);
    }

    private static Drawable createBlur(View view) throws Exception {
        Method getViewRoot = View.class.getDeclaredMethod("getViewRootImpl");
        getViewRoot.setAccessible(true);
        Object viewRoot = getViewRoot.invoke(view);
        if (viewRoot == null) {
            return null;
        }
        Method create = viewRoot.getClass().getDeclaredMethod("createBackgroundBlurDrawable");
        create.setAccessible(true);
        Drawable blur = (Drawable) create.invoke(viewRoot);
        blur.setVisible(true, false);
        return blur;
    }

    private static void invoke(Object target, String name, Class<?>[] types, Object value)
            throws Exception {
        Method method = target.getClass().getDeclaredMethod(name, types);
        method.setAccessible(true);
        method.invoke(target, value);
    }

    /** Makes a blur drawable push its current settings to the compositor. */
    private static void refresh(Drawable blur) {
        try {
            Field field = blur.getClass().getDeclaredField("mAggregator");
            field.setAccessible(true);
            Object aggregator = field.get(blur);
            Method updated = aggregator.getClass()
                    .getDeclaredMethod("onBlurDrawableUpdated", blur.getClass());
            updated.setAccessible(true);
            updated.invoke(aggregator, blur);
            blur.invalidateSelf();
        } catch (Throwable ignored) {
            // The blur still works with its defaults.
        }
    }

    private static final class Glass {
        final Drawable original;
        final Drawable background;
        final Glow glow;
        final boolean dark;

        Glass(Drawable original, Drawable background, Glow glow, boolean dark) {
            this.original = original;
            this.background = background;
            this.glow = glow;
            this.dark = dark;
        }
    }

    /** The light that blooms from the finger, drawn over the popup within its shape. */
    private static final class Glow extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path shape = new Path();
        float radius;
        private float x;
        private float y;
        private long start = -1;

        Glow(float radius) {
            this.radius = radius;
        }

        void flash(float x, float y) {
            this.x = x;
            this.y = y;
            start = SystemClock.uptimeMillis();
            invalidateSelf();
        }

        @Override
        public void draw(Canvas canvas) {
            if (start < 0) {
                return;
            }
            long elapsed = SystemClock.uptimeMillis() - start;
            long rise = PressEffect.FLASH_RISE_MS;
            long fade = PressEffect.FLASH_FADE_MS;
            float strength;
            if (elapsed < rise) {
                strength = elapsed / (float) rise;
            } else if (elapsed < rise + fade) {
                float left = 1f - (elapsed - rise) / (float) fade;
                strength = left * left;
            } else {
                start = -1;
                return;
            }
            Rect bounds = getBounds();
            boolean dark = false;
            Callback callback = getCallback();
            if (callback instanceof View) {
                dark = (((View) callback).getResources().getConfiguration().uiMode
                        & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
            }
            int peak = dark ? PressEffect.FLASH_PEAK_ALPHA_DARK : PressEffect.FLASH_PEAK_ALPHA_LIGHT;
            int alpha = Math.round(peak * strength);
            float spread = 0.75f + 0.25f * Math.min(1f, elapsed / (float) (rise + fade));
            float reach = Math.max(1f, Math.max(bounds.width(), bounds.height()) * 0.55f * spread);
            paint.setShader(new RadialGradient(x, y, reach,
                    new int[]{Color.argb(alpha, 255, 255, 255),
                            Color.argb(alpha / 3, 255, 255, 255), Color.TRANSPARENT},
                    new float[]{0f, 0.45f, 1f}, Shader.TileMode.CLAMP));
            shape.rewind();
            shape.addRoundRect(bounds.left, bounds.top, bounds.right, bounds.bottom,
                    radius, radius, Path.Direction.CW);
            canvas.drawPath(shape, paint);
            paint.setShader(null);
            invalidateSelf();
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
