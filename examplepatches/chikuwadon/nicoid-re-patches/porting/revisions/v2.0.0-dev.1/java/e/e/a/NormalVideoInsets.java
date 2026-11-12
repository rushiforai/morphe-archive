package e.e.a;

import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowInsets;
import java.util.WeakHashMap;

public final class NormalVideoInsets {
    private static final WeakHashMap<View, Alignment> ACTIVE = new WeakHashMap<>();

    public static void schedule(View root) {
        if (root == null || !root.isAttachedToWindow()) return;
        if (root.getResources().getConfiguration().orientation != Configuration.ORIENTATION_LANDSCAPE) return;
        if (ACTIVE.containsKey(root)) return;
        Alignment alignment = new Alignment(root);
        ACTIVE.put(root, alignment);
        root.addOnAttachStateChangeListener(alignment);
        root.getViewTreeObserver().addOnPreDrawListener(alignment);
        root.requestApplyInsets();
    }

    public static void clear(View root) {
        Alignment alignment = ACTIVE.remove(root);
        if (alignment != null) alignment.remove(root);
    }

    static int requiredMargin(int baseline, int current, int top, int statusBottom) {
        return baseline + Math.max(0, statusBottom - (top - (current - baseline)));
    }

    private static final class Alignment implements ViewTreeObserver.OnPreDrawListener, View.OnAttachStateChangeListener {
        final java.lang.ref.WeakReference<View> target;
        final Rect visible = new Rect();
        final int[] point = new int[2];
        ViewGroup.MarginLayoutParams adjusted;
        int baseline;

        Alignment(View root) { target = new java.lang.ref.WeakReference<>(root); }

        @Override public boolean onPreDraw() {
            View root = target.get();
            if (root == null || !root.isAttachedToWindow()) return true;
            if (root.getResources().getConfiguration().orientation != Configuration.ORIENTATION_LANDSCAPE) {
                clear(root);
                return true;
            }
            if (!(root.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return true;
            ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams) root.getLayoutParams();
            if (adjusted != margins) {
                adjusted = margins;
                baseline = margins.topMargin;
            }
            WindowInsets insets = root.getRootWindowInsets();
            int status = 0;
            if (insets != null) {
                if (Build.VERSION.SDK_INT >= 30) {
                    status = insets.getInsets(WindowInsets.Type.statusBars()).top;
                } else {
                    status = insets.getSystemWindowInsetTop();
                }
            }
            root.getWindowVisibleDisplayFrame(visible);
            root.getRootView().getLocationOnScreen(point);
            int statusBottom = Math.max(visible.top, point[1] + status);
            root.getLocationOnScreen(point);
            int margin = requiredMargin(baseline, margins.topMargin, point[1], statusBottom);
            if (margin == margins.topMargin) return true;
            margins.topMargin = margin;
            root.setLayoutParams(margins);
            return false;
        }

        void remove(View root) {
            ViewTreeObserver observer = root.getViewTreeObserver();
            if (observer.isAlive()) observer.removeOnPreDrawListener(this);
            root.removeOnAttachStateChangeListener(this);
            if (adjusted != null && root.getLayoutParams() == adjusted && adjusted.topMargin != baseline) {
                adjusted.topMargin = baseline;
                root.setLayoutParams(adjusted);
            }
        }

        @Override public void onViewAttachedToWindow(View view) {}
        @Override public void onViewDetachedFromWindow(View view) { clear(view); }
    }
}
