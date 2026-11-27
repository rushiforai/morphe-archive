package app.amazonamoled.extension;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableContainer;
import android.graphics.drawable.DrawableWrapper;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Build;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsetsController;
import android.webkit.WebView;
import android.widget.ImageView;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Repaints the native (non-web) views of an activity for an AMOLED screen.
 *
 * Android's own darkening (enabled by the patch through android:forceDarkAllowed and the
 * app night mode) only produces dark gray, and does nothing for views that opted out of it.
 * This class walks the view tree after every layout and scroll and:
 *   - turns light backgrounds black (keeping colored buttons and badges),
 *   - turns dark text light when it sits on a dark background,
 *   - turns dark monochrome icons light.
 * Every change is idempotent, so running it again on the same views changes nothing.
 */
final class NativeDarkener {
    private static final Map<Activity, Session> sessions = new WeakHashMap<>();

    /** Cache of icon analysis results, per drawable constant state. */
    private static final Map<Object, Boolean> darkIconCache = new WeakHashMap<>();

    /** Cache of background analysis results, per drawable constant state. */
    private static final Map<Object, int[]> backgroundCache = new WeakHashMap<>();

    /** getFillColor/setFillColor pair per drawable class, or an empty array if it has none. */
    private static final Map<Class<?>, Method[]> fillColorMethods = new HashMap<>();

    /** Lightness inversion that keeps the hue (invert, then rotate the hue by 180 degrees). */
    private static final ColorMatrixColorFilter LIGHTEN_ICON = new ColorMatrixColorFilter(new float[]{
            0.574f, -1.430f, -0.144f, 0, 255,
            -0.426f, -0.430f, -0.144f, 0, 255,
            -0.426f, -1.430f, 0.856f, 0, 255,
            0, 0, 0, 1, 0,
    });

    private static final int NO_COLOR = 0;

    private static final int[][] COMMON_STATES = {
            {android.R.attr.state_selected},
            {android.R.attr.state_checked},
            {android.R.attr.state_activated},
            {android.R.attr.state_pressed},
            {android.R.attr.state_focused},
            {-android.R.attr.state_enabled},
    };

    private NativeDarkener() {
    }

    static void attach(Activity activity) {
        Session session = sessions.get(activity);
        if (session == null) {
            Window window = activity.getWindow();
            if (window == null) return;
            session = new Session(window);
            sessions.put(activity, session);
            session.start();
        }
        session.schedule();
    }

    static void detach(Activity activity) {
        Session session = sessions.remove(activity);
        if (session != null) session.stop();
    }

    /**
     * Runs the repaint right after each layout pass and each scroll, which both happen before
     * the next frame is drawn, so new views never show up light. Throttled so long animations
     * and flings cost at most one pass every {@link #MIN_INTERVAL_MS}.
     */
    private static final class Session implements ViewTreeObserver.OnGlobalLayoutListener,
            ViewTreeObserver.OnScrollChangedListener, Runnable {
        private static final long MIN_INTERVAL_MS = 32;

        private final WeakReference<Window> window;
        private final WeakReference<View> decor;
        private boolean scheduled;
        private long lastRun;

        Session(Window window) {
            this.window = new WeakReference<>(window);
            this.decor = new WeakReference<>(window.getDecorView());
        }

        void start() {
            View view = decor.get();
            if (view == null) return;
            ViewTreeObserver observer = view.getViewTreeObserver();
            observer.addOnGlobalLayoutListener(this);
            observer.addOnScrollChangedListener(this);
        }

        void stop() {
            View view = decor.get();
            if (view == null) return;
            view.removeCallbacks(this);
            ViewTreeObserver observer = view.getViewTreeObserver();
            if (observer.isAlive()) {
                observer.removeOnGlobalLayoutListener(this);
                observer.removeOnScrollChangedListener(this);
            }
        }

        void schedule() {
            View view = decor.get();
            if (view == null || scheduled) return;
            scheduled = true;
            view.postDelayed(this, MIN_INTERVAL_MS + 8);
        }

        @Override
        public void onGlobalLayout() {
            runThrottled();
        }

        @Override
        public void onScrollChanged() {
            runThrottled();
        }

        private void runThrottled() {
            if (SystemClock.uptimeMillis() - lastRun >= MIN_INTERVAL_MS) {
                repaint();
            } else {
                schedule();
            }
        }

        @Override
        public void run() {
            scheduled = false;
            repaint();
        }

        private void repaint() {
            lastRun = SystemClock.uptimeMillis();
            try {
                Window w = window.get();
                View view = decor.get();
                if (w == null || view == null) return;
                styleWindow(w, view);
                walk(view, Color.BLACK, view.getResources().getDisplayMetrics().density);
            } catch (Throwable t) {
                Log.e(AmoledTheme.TAG, "Native darkening failed", t);
            }
        }
    }

    // region Window.

    @SuppressWarnings("deprecation")
    private static void styleWindow(Window window, View decor) {
        Drawable background = decor.getBackground();
        if (!(background instanceof ColorDrawable)
                || ((ColorDrawable) background).getColor() != Color.BLACK) {
            window.setBackgroundDrawable(new ColorDrawable(Color.BLACK));
        }
        if (Build.VERSION.SDK_INT < 35) {
            // Ignored from Android 15 on, where apps draw behind the system bars themselves.
            if (window.getStatusBarColor() != Color.BLACK && !isTransparent(window.getStatusBarColor())) {
                window.setStatusBarColor(Color.BLACK);
            }
            if (window.getNavigationBarColor() != Color.BLACK
                    && !isTransparent(window.getNavigationBarColor())) {
                window.setNavigationBarColor(Color.BLACK);
            }
        }
        // Light status and navigation bar icons on the black background.
        if (Build.VERSION.SDK_INT >= 30) {
            WindowInsetsController controller = window.getInsetsController();
            if (controller != null) {
                int light = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                        | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                if ((controller.getSystemBarsAppearance() & light) != 0) {
                    controller.setSystemBarsAppearance(0, light);
                }
            }
        } else if (Build.VERSION.SDK_INT >= 23) {
            int flags = decor.getSystemUiVisibility();
            int light = View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
            if (Build.VERSION.SDK_INT >= 26) light |= View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
            if ((flags & light) != 0) decor.setSystemUiVisibility(flags & ~light);
        }
    }

    private static boolean isTransparent(int color) {
        return Color.alpha(color) < 24;
    }

    // endregion

    // region View tree.

    /**
     * @param parentBackground the opaque color drawn behind this view (after darkening).
     */
    private static void walk(View view, int parentBackground, float density) {
        if (view.getVisibility() != View.VISIBLE) return;
        // Web pages have their own stylesheet (WebDarkener).
        if (view instanceof WebView) return;

        int own = darkenBackground(view);
        int background = own != NO_COLOR ? own : parentBackground;

        if (view instanceof TextView) {
            darkenText((TextView) view, background);
        } else if (view instanceof ImageView) {
            lightenIcon((ImageView) view, background, density);
        }

        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0, n = group.getChildCount(); i < n; i++) {
                View child = group.getChildAt(i);
                if (child != null) walk(child, background, density);
            }
        }
    }

    /** Darkens the background of a view and returns the opaque color it now shows, if known. */
    private static int darkenBackground(View view) {
        ColorStateList tint = view.getBackgroundTintList();
        if (tint != null && view.getBackground() != null) {
            int color = tint.getDefaultColor();
            ColorStateList mapped = mapStateList(tint, true);
            if (mapped != tint) view.setBackgroundTintList(mapped);
            int shown = mapped.getDefaultColor();
            return Color.alpha(color) > 200 ? shown : NO_COLOR;
        }
        Drawable background = view.getBackground();
        if (background == null) return NO_COLOR;
        return darkenDrawable(background, 0);
    }

    private static int darkenDrawable(Drawable drawable, int depth) {
        if (drawable == null || depth > 4) return NO_COLOR;

        if (drawable instanceof ColorDrawable) {
            ColorDrawable colorDrawable = (ColorDrawable) drawable;
            int color = colorDrawable.getColor();
            int mapped = Colors.darkSurface(color);
            if (mapped != color) {
                colorDrawable.mutate();
                colorDrawable.setColor(mapped);
            }
            return Color.alpha(mapped) > 200 ? mapped : NO_COLOR;
        }

        if (Build.VERSION.SDK_INT >= 24 && drawable instanceof GradientDrawable) {
            GradientDrawable gradient = (GradientDrawable) drawable;
            int[] colors = gradient.getColors();
            if (colors != null && colors.length > 0) {
                int[] mapped = new int[colors.length];
                boolean changed = false;
                for (int i = 0; i < colors.length; i++) {
                    mapped[i] = Colors.darkSurface(colors[i]);
                    changed |= mapped[i] != colors[i];
                }
                if (changed) {
                    gradient.mutate();
                    gradient.setColors(mapped);
                }
                return Color.alpha(mapped[0]) > 200 ? mapped[0] : NO_COLOR;
            }
            ColorStateList fill = gradient.getColor();
            if (fill != null) {
                ColorStateList mapped = mapStateList(fill, true);
                if (mapped != fill) {
                    gradient.mutate();
                    gradient.setColor(mapped);
                }
                int shown = mapped.getDefaultColor();
                return Color.alpha(shown) > 200 ? shown : NO_COLOR;
            }
            return NO_COLOR;
        }

        if (drawable instanceof LayerDrawable) { // Includes RippleDrawable.
            LayerDrawable layers = (LayerDrawable) drawable;
            int shown = NO_COLOR;
            for (int i = 0, n = layers.getNumberOfLayers(); i < n; i++) {
                if (Build.VERSION.SDK_INT >= 23 && layers.getId(i) == android.R.id.mask) continue;
                int color = darkenDrawable(layers.getDrawable(i), depth + 1);
                if (color != NO_COLOR) shown = color;
            }
            return shown;
        }

        if (drawable instanceof DrawableContainer) { // StateListDrawable, LevelListDrawable...
            Drawable current = drawable.getCurrent();
            return current != drawable ? darkenDrawable(current, depth + 1) : NO_COLOR;
        }

        if (Build.VERSION.SDK_INT >= 23 && drawable instanceof DrawableWrapper) { // Inset, Scale...
            return darkenDrawable(((DrawableWrapper) drawable).getDrawable(), depth + 1);
        }

        int fill = darkenFillColor(drawable);
        if (fill != NO_COLOR) return fill;
        return darkenUnknown(drawable);
    }

    /**
     * Nine-patches, bitmaps and other drawables without a readable color: draw them small and
     * look at the pixels. A flat light background (a white text field, a speech bubble) gets
     * a lightness-inverting color filter; anything with detail (a banner photo) is left alone,
     * but its average color still tells whether the text on top of it must stay dark.
     */
    private static int darkenUnknown(Drawable drawable) {
        if (drawable.getColorFilter() == LIGHTEN_ICON) return Color.BLACK;
        Drawable.ConstantState state = drawable.getConstantState();
        Object key = state != null ? state : drawable;
        int[] analysis = backgroundCache.get(key);
        if (analysis == null) {
            analysis = analyzeBackground(drawable);
            backgroundCache.put(key, analysis);
        }
        int average = analysis[0];
        boolean flat = analysis[1] != 0;
        if (average == NO_COLOR) return NO_COLOR;
        if (flat && Colors.darkSurface(average) != average && Colors.luminance(average) > 0.3) {
            drawable.mutate();
            drawable.setColorFilter(LIGHTEN_ICON);
            return Color.BLACK;
        }
        return Color.alpha(average) > 200 ? average : NO_COLOR;
    }

    /** Returns {average opaque color or NO_COLOR, 1 if the drawable is flat}. */
    private static int[] analyzeBackground(Drawable drawable) {
        try {
            final int size = 16;
            Bitmap bitmap = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmap);
            Rect old = drawable.copyBounds();
            drawable.setBounds(0, 0, size, size);
            drawable.draw(canvas);
            drawable.setBounds(old);
            int[] pixels = new int[size * size];
            bitmap.getPixels(pixels, 0, size, 0, 0, size, size);
            bitmap.recycle();

            double r = 0;
            double g = 0;
            double b = 0;
            double lumSum = 0;
            double lumSquares = 0;
            int opaque = 0;
            for (int p : pixels) {
                if (Color.alpha(p) < 200) continue;
                opaque++;
                r += Color.red(p);
                g += Color.green(p);
                b += Color.blue(p);
                double l = Colors.luminance(p);
                lumSum += l;
                lumSquares += l * l;
            }
            if (opaque < pixels.length / 2) return new int[]{NO_COLOR, 0};
            double mean = lumSum / opaque;
            double deviation = Math.sqrt(Math.max(0, lumSquares / opaque - mean * mean));
            int average = Color.rgb((int) (r / opaque), (int) (g / opaque), (int) (b / opaque));
            return new int[]{average, deviation < 0.06 ? 1 : 0};
        } catch (Throwable t) {
            return new int[]{NO_COLOR, 0};
        }
    }

    /** Material components (cards, sheets, buttons) draw with a shape drawable that has a fill color. */
    private static int darkenFillColor(Drawable drawable) {
        try {
            Class<?> type = drawable.getClass();
            Method[] pair = fillColorMethods.get(type);
            if (pair == null) {
                pair = new Method[0];
                try {
                    Method getter = type.getMethod("getFillColor");
                    Method setter = type.getMethod("setFillColor", ColorStateList.class);
                    if (getter.getReturnType() == ColorStateList.class) pair = new Method[]{getter, setter};
                } catch (NoSuchMethodException ignored) {
                    // Not a shape drawable.
                }
                fillColorMethods.put(type, pair);
            }
            if (pair.length == 0) return NO_COLOR;
            ColorStateList fill = (ColorStateList) pair[0].invoke(drawable);
            if (fill == null) return NO_COLOR;
            ColorStateList mapped = mapStateList(fill, true);
            if (mapped != fill) pair[1].invoke(drawable, mapped);
            int shown = mapped.getDefaultColor();
            return Color.alpha(shown) > 200 ? shown : NO_COLOR;
        } catch (Throwable t) {
            return NO_COLOR;
        }
    }

    private static void darkenText(TextView text, int background) {
        if (!Colors.isDark(background)) return; // Dark text on a kept light surface stays.

        ColorStateList colors = text.getTextColors();
        if (colors != null) {
            ColorStateList mapped = mapStateList(colors, false);
            if (mapped != colors) text.setTextColor(mapped);
        }
        ColorStateList hint = text.getHintTextColors();
        if (hint != null) {
            ColorStateList mapped = mapStateList(hint, false);
            if (mapped != hint) text.setHintTextColor(mapped);
        }
        ColorStateList links = text.getLinkTextColors();
        if (links != null) {
            ColorStateList mapped = mapStateList(links, false);
            if (mapped != links) text.setLinkTextColor(mapped);
        }

        // Icons drawn next to the text.
        if (Build.VERSION.SDK_INT >= 23 && text.getCompoundDrawableTintList() == null) {
            Drawable[] drawables = text.getCompoundDrawablesRelative();
            for (Drawable d : drawables) {
                if (d != null && isDarkMonochromeIcon(d)) {
                    text.setCompoundDrawableTintList(
                            ColorStateList.valueOf(Colors.lightForeground(text.getCurrentTextColor())));
                    // Android's darkening would see a light icon and invert it back to dark.
                    if (Build.VERSION.SDK_INT >= 29) text.setForceDarkAllowed(false);
                    break;
                }
            }
        }
    }

    private static void lightenIcon(ImageView image, int background, float density) {
        if (!Colors.isDark(background)) return;
        Drawable drawable = image.getDrawable();
        if (drawable == null) return;
        // Android's darkening inverts light bitmaps (white product photos) and would invert our
        // lightened icons back to dark: images are handled here instead.
        if (Build.VERSION.SDK_INT >= 29 && image.isForceDarkAllowed()) image.setForceDarkAllowed(false);
        int maxSize = (int) (72 * density);
        int width = image.getWidth();
        int height = image.getHeight();
        if (width == 0 || height == 0 || width > maxSize || height > maxSize) return;

        ColorStateList tint = image.getImageTintList();
        if (tint != null) {
            ColorStateList mapped = mapStateList(tint, false);
            if (mapped != tint) image.setImageTintList(mapped);
            return;
        }
        if (image.getColorFilter() != null) return; // Already tinted (by the app or by us).
        if (isDarkMonochromeIcon(drawable)) image.setColorFilter(LIGHTEN_ICON);
    }

    /**
     * True for dark, mostly gray drawables with transparent areas: icons. Photos are opaque
     * and colorful, so they are never touched.
     */
    private static boolean isDarkMonochromeIcon(Drawable drawable) {
        Drawable.ConstantState state = drawable.getConstantState();
        Object key = state != null ? state : drawable;
        Boolean cached = darkIconCache.get(key);
        if (cached != null) return cached;

        boolean result = false;
        try {
            final int size = 24;
            Bitmap bitmap = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmap);
            Rect old = drawable.copyBounds();
            drawable.setBounds(0, 0, size, size);
            drawable.draw(canvas);
            drawable.setBounds(old);

            int[] pixels = new int[size * size];
            bitmap.getPixels(pixels, 0, size, 0, 0, size, size);
            bitmap.recycle();

            double weight = 0;
            double lum = 0;
            double saturation = 0;
            int transparent = 0;
            for (int p : pixels) {
                int a = Color.alpha(p);
                if (a < 16) {
                    transparent++;
                    continue;
                }
                double w = a / 255.0;
                weight += w;
                lum += Colors.luminance(p | 0xFF000000) * w;
                saturation += Colors.toHsl(p)[1] * w;
            }
            if (weight > 0) {
                lum /= weight;
                saturation /= weight;
                result = transparent >= pixels.length / 4 && lum < 0.2 && saturation < 0.3;
            }
        } catch (Throwable ignored) {
            result = false;
        }
        darkIconCache.put(key, result);
        return result;
    }

    // endregion

    /**
     * Maps every color of a state list, keeping the differences between the common states
     * (selected tab, checked box, disabled button...). Returns the same instance when
     * nothing changes, so callers can skip the setter.
     */
    private static ColorStateList mapStateList(ColorStateList list, boolean surface) {
        int base = list.getDefaultColor();
        int mappedBase = map(base, surface);
        if (!list.isStateful()) {
            return mappedBase == base ? list : ColorStateList.valueOf(mappedBase);
        }
        int count = 0;
        int[][] states = new int[COMMON_STATES.length + 1][];
        int[] colors = new int[COMMON_STATES.length + 1];
        boolean changed = mappedBase != base;
        for (int[] state : COMMON_STATES) {
            int color = list.getColorForState(state, base);
            if (color == base) continue;
            int mapped = map(color, surface);
            changed |= mapped != color;
            states[count] = state;
            colors[count] = mapped;
            count++;
        }
        if (!changed) return list;
        states[count] = new int[0];
        colors[count] = mappedBase;
        count++;
        int[][] finalStates = new int[count][];
        int[] finalColors = new int[count];
        System.arraycopy(states, 0, finalStates, 0, count);
        System.arraycopy(colors, 0, finalColors, 0, count);
        return new ColorStateList(finalStates, finalColors);
    }

    private static int map(int color, boolean surface) {
        return surface ? Colors.darkSurface(color) : Colors.lightForeground(color);
    }
}
