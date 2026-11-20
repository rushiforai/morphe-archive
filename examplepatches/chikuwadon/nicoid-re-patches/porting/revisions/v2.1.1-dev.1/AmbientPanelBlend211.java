package e.e.a;

import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import java.lang.ref.WeakReference;
import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Allows animated ambient light to show through dark *backgrounds* of detail
 * panels while drawing their text and icons normally on top.
 * All modified backgrounds are restored when ambient spread is switched off.
 */
public final class AmbientPanelBlend211 {
    private static final Map<View, Saved> MODIFIED = new WeakHashMap<>();
    private static final Map<View, Long> NEXT_SCAN = new WeakHashMap<>();
    private static final int MAX_VISITS = 600;
    private static final int PANEL_ALPHA = 132;

    private AmbientPanelBlend211() {}

    private static final class Saved {
        final WeakReference<View> root;
        final Drawable original;
        final Drawable adapted;
        final int left, top, right, bottom;
        Saved(View root, View view, Drawable original, Drawable adapted) {
            this.root = new WeakReference<>(root);
            this.original = original;
            this.adapted = adapted;
            left = view.getPaddingLeft(); top = view.getPaddingTop();
            right = view.getPaddingRight(); bottom = view.getPaddingBottom();
        }
    }

    public static void update(View root, boolean spreadEnabled) {
        if (root == null) return;
        if (!spreadEnabled) { clear(root); return; }
        long now = SystemClock.uptimeMillis();
        Long next = NEXT_SCAN.get(root);
        if (next != null && now < next) return;
        NEXT_SCAN.put(root, now + 400);
        int[] budget = { MAX_VISITS };
        visit(root, root, budget, 0);
    }

    public static void clear(View root) {
        if (root == null) return;
        NEXT_SCAN.remove(root);
        for (Iterator<Map.Entry<View,Saved>> i = MODIFIED.entrySet().iterator(); i.hasNext();) {
            Map.Entry<View,Saved> entry = i.next();
            Saved saved = entry.getValue();
            if (saved.root.get() != root) continue;
            View view = entry.getKey();
            if (view != null && view.getBackground() == saved.adapted) {
                view.setBackground(saved.original);
                view.setPadding(saved.left, saved.top, saved.right, saved.bottom);
            }
            i.remove();
        }
    }

    private static void visit(View root, View view, int[] budget, int depth) {
        if (budget[0]-- <= 0 || depth > 10 || !view.isShown()) return;
        // The video itself is never a panel background.
        if (view instanceof android.view.SurfaceView || view instanceof android.view.TextureView
                || view instanceof android.webkit.WebView) return;
        if (view != root) adapt(root, view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int n = 0; n < group.getChildCount() && budget[0] > 0; n++)
                visit(root, group.getChildAt(n), budget, depth + 1);
        }
    }

    private static void adapt(View root, View view) {
        if (view instanceof Button || view instanceof ImageView) return;
        int w = view.getWidth(), h = view.getHeight();
        float density = view.getResources().getDisplayMetrics().density;
        if (w < 72 * density || h < 22 * density) return;
        Saved old = MODIFIED.get(view);
        Drawable original = view.getBackground();
        if (old != null) {
            if (original == old.adapted && old.root.get() == root) return;
            MODIFIED.remove(view);
        }
        if (original == null || !darkOpaque(original)) return;
        Drawable.ConstantState state = original.getConstantState();
        if (state == null) return;
        Drawable adapted = state.newDrawable(view.getResources()).mutate();
        adapted.setAlpha(PANEL_ALPHA);
        Saved saved = new Saved(root, view, original, adapted);
        view.setBackground(adapted);
        view.setPadding(saved.left, saved.top, saved.right, saved.bottom);
        MODIFIED.put(view, saved);
    }

    private static boolean darkOpaque(Drawable drawable) {
        int color;
        if (drawable instanceof ColorDrawable) {
            color = ((ColorDrawable) drawable).getColor();
        } else if (drawable instanceof GradientDrawable) {
            ColorStateList fill = ((GradientDrawable) drawable).getColor();
            if (fill == null) return false;
            color = fill.getDefaultColor();
        } else {
            return false;
        }
        if (Color.alpha(color) < 240) return false;
        int r = Color.red(color), g = Color.green(color), b = Color.blue(color);
        return Math.max(r, Math.max(g, b)) < 102
                && Math.max(r, Math.max(g, b)) - Math.min(r, Math.min(g, b)) < 38;
    }
}