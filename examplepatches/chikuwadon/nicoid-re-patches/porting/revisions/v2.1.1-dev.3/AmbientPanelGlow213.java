package e.e.a;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Compose each animated ambient plane ABOVE solid panel backgrounds but BELOW
 * all view children (text, glyphs and thumbnails). Neither the foreground nor
 * the source video's pixels are modified. Works with full-screen spread ON/OFF.
 */
public final class AmbientPanelGlow213 {
    private static final WeakHashMap<View, Saved> PANELS = new WeakHashMap<>();
    private static final WeakHashMap<View, Long> SCANS = new WeakHashMap<>();
    private static final int LIMIT = 1200;
    private AmbientPanelGlow213() { }

    private static final class Saved {
        final WeakReference<View> page;
        final Drawable original;
        final LayerDrawable overlay;
        final Drawable glow;
        final int[] padding;
        Saved(View parent, View view, Drawable old, LayerDrawable installed, Drawable light) {
            page = new WeakReference<>(parent);
            original = old;
            overlay = installed;
            glow = light;
            padding = new int[] { view.getPaddingLeft(), view.getPaddingTop(),
                    view.getPaddingRight(), view.getPaddingBottom() };
        }
    }

    private static Field field(Class<?> cls, String key) throws Exception {
        Field f = cls.getDeclaredField(key);
        f.setAccessible(true);
        return f;
    }

    private static void syncGlow(Drawable target, Object reference, View page, View panel)
            throws Exception {
        Class<?> cls = reference.getClass();
        // Match the regular page's palette, direction, alpha and fade behaviour.
        for (String name : new String[] {"colors", "sides", "cornerSources", "spread",
                "softness", "alpha", "inner", "corners", "normalFade", "sharedFade"}) {
            Field f = field(cls, name);
            f.set(target, f.get(reference));
        }
        Field video = field(cls, "video");
        Rect relative = (Rect) video.get(reference);
        Rect position = (Rect) video.get(target);
        position.set(relative);
        int[] a = new int[2], b = new int[2];
        page.getLocationOnScreen(a);
        panel.getLocationOnScreen(b);
        position.offset(a[0] - b[0], a[1] - b[1]);
        target.setBounds(0, 0, panel.getWidth(), panel.getHeight());
        target.invalidateSelf();
    }

    private static Drawable newGlow(Object source) throws Exception {
        Constructor<?> ctor = source.getClass().getDeclaredConstructor();
        ctor.setAccessible(true);
        return (Drawable) ctor.newInstance();
    }

    private static boolean dark(int c) {
        if (Color.alpha(c) < 235) return false;
        int r = Color.red(c), g = Color.green(c), b = Color.blue(c);
        return Math.max(r, Math.max(g, b)) <= 112
                && Math.max(r, Math.max(g, b)) - Math.min(r, Math.min(g, b)) <= 48;
    }

    private static boolean panelBackground(Drawable source, View v) {
        if (source instanceof ColorDrawable)
            return dark(((ColorDrawable) source).getColor());
        if (source instanceof GradientDrawable) {
            android.content.res.ColorStateList state = ((GradientDrawable) source).getColor();
            if (state != null) return dark(state.getColorForState(v.getDrawableState(), state.getDefaultColor()));
        }
        // Native card backgrounds can be a RippleDrawable or LayerDrawable.
        // Sample a clone, never the actual drawable callback or foreground.
        Drawable.ConstantState state = source.getConstantState();
        if (state == null) return false;
        Bitmap bitmap = null;
        try {
            Drawable probe = state.newDrawable(v.getResources()).mutate();
            bitmap = Bitmap.createBitmap(7, 7, Bitmap.Config.ARGB_8888);
            probe.setBounds(0, 0, 7, 7);
            probe.draw(new Canvas(bitmap));
            return dark(bitmap.getPixel(3, 3));
        } catch (Exception ignored) {
            return false;
        } finally {
            if (bitmap != null) bitmap.recycle();
        }
    }

    private static void restore(View view, Saved state) {
        if (view.getBackground() == state.overlay) {
            view.setBackground(state.original);
            view.setPadding(state.padding[0], state.padding[1],
                    state.padding[2], state.padding[3]);
        }
    }

    public static void clear(View page) {
        if (page == null) return;
        SCANS.remove(page);
        for (Iterator<Map.Entry<View, Saved>> it = PANELS.entrySet().iterator(); it.hasNext();) {
            Map.Entry<View, Saved> entry = it.next();
            Saved s = entry.getValue();
            if (s.page.get() != page) continue;
            if (entry.getKey() != null) restore(entry.getKey(), s);
            it.remove();
        }
    }

    private static void scan(View page, View v, Object source, int[] budget, int depth) {
        if (v == null || depth > 23 || budget[0]-- <= 0 || !v.isShown()) return;
        if (v instanceof android.view.SurfaceView || v instanceof android.view.TextureView
                || v instanceof android.webkit.WebView) return;
        if (v != page && !(v instanceof ImageView)) {
            float density = v.getResources().getDisplayMetrics().density;
            if (v.getWidth() >= 70 * density && v.getHeight() >= 24 * density) {
                Drawable original = v.getBackground();
                Saved prior = PANELS.get(v);
                if (prior != null && prior.overlay != original) PANELS.remove(v);
                if ((prior == null || prior.overlay != original)
                        && original != null && panelBackground(original, v)) {
                    try {
                        Drawable light = newGlow(source);
                        LayerDrawable layers = new LayerDrawable(new Drawable[] {original, light});
                        Saved saved = new Saved(page, v, original, layers, light);
                        v.setBackground(layers);
                        v.setPadding(saved.padding[0], saved.padding[1],
                                saved.padding[2], saved.padding[3]);
                        PANELS.put(v, saved);
                    } catch (Exception error) {
                        android.util.Log.w("nicoid-ambient", "Unable to layer panel background", error);
                    }
                }
            }
        }
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount() && budget[0] > 0; i++)
                scan(page, g.getChildAt(i), source, budget, depth + 1);
        }
    }

    public static void update(View page, Object source) {
        if (page == null || source == null || !page.isShown()) return;
        long now = SystemClock.uptimeMillis();
        Long next = SCANS.get(page);
        if (next == null || now >= next) {
            SCANS.put(page, now + 300);
            scan(page, page, source, new int[]{LIMIT}, 0);
        }
        for (Iterator<Map.Entry<View, Saved>> it = PANELS.entrySet().iterator(); it.hasNext();) {
            Map.Entry<View, Saved> entry = it.next();
            Saved saved = entry.getValue();
            if (saved.page.get() != page) continue;
            View v = entry.getKey();
            if (v == null || v.getBackground() != saved.overlay) {it.remove();continue;}
            if (!v.isShown()) continue;
            try { syncGlow(saved.glow, source, page, v); }
            catch (Exception error) {
                restore(v, saved);
                it.remove();
                android.util.Log.w("nicoid-ambient", "Unable to sync panel glow", error);
            }
        }
    }
}