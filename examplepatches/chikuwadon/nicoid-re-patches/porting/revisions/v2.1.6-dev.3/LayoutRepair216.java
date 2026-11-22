package e.e.a;

import android.app.Activity;
import android.util.Log;
import android.view.Choreographer;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Correct parent-specific LayoutParams before the UI traversal measures children.
 * Reparented Media3 video rows must retain the same decoder and playback queue.
 */
public final class LayoutRepair216 {
    private static final WeakHashMap<Activity, Guard> GUARDS = new WeakHashMap<>();
    private LayoutRepair216() {}

    public static ViewGroup.LayoutParams compatible(ViewGroup parent, ViewGroup.LayoutParams original) {
        if (parent == null || original == null) return original;
        if (parent instanceof FrameLayout && !(original instanceof FrameLayout.LayoutParams)) {
            FrameLayout.LayoutParams next = new FrameLayout.LayoutParams(original);
            if (original instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams) original;
                next.setMargins(margins.leftMargin, margins.topMargin,
                        margins.rightMargin, margins.bottomMargin);
            }
            return next;
        }
        if (parent instanceof LinearLayout && !(original instanceof LinearLayout.LayoutParams))
            return new LinearLayout.LayoutParams(original);
        if (parent instanceof RelativeLayout && !(original instanceof RelativeLayout.LayoutParams))
            return new RelativeLayout.LayoutParams(original);
        return original;
    }

    /** Recursively repair the activity content root as well as the mini subtree. */
    public static void sanitize(View root) {
        if (!(root instanceof ViewGroup)) return;
        ViewGroup parent = (ViewGroup) root;
        for (int i = 0; i < parent.getChildCount(); i++) {
            View child = parent.getChildAt(i);
            ViewGroup.LayoutParams current = child.getLayoutParams();
            ViewGroup.LayoutParams next = compatible(parent, current);
            if (current != next) {
                child.setLayoutParams(next);
                Log.w("nicoid-mini", "Corrected "
                        + child.getClass().getSimpleName() + " params "
                        + current.getClass().getSimpleName() + " -> "
                        + next.getClass().getSimpleName()
                        + " in " + parent.getClass().getSimpleName());
            }
            if (child instanceof ViewGroup) sanitize(child);
        }
    }

    /** Choreographer animation callbacks precede the measure/traversal phase.
     * Only inspect the tree if Android has requested a layout. The observer
     * retires automatically when the mini panel is detached or the host ends.
     */
    public static void watch(Activity activity, View panel) {
        if (activity == null || panel == null || activity.isFinishing() || activity.isDestroyed())
            return;
        View decor = activity.getWindow().getDecorView();
        sanitize(decor);
        Guard prior = GUARDS.remove(activity);
        if (prior != null) prior.cancel();
        Guard guard = new Guard(activity, panel);
        GUARDS.put(activity, guard);
        guard.schedule();
    }

    private static final class Guard implements Choreographer.FrameCallback {
        final WeakReference<Activity> activity;
        final WeakReference<View> panel;
        final Choreographer frames = Choreographer.getInstance();
        boolean cancelled;

        Guard(Activity host, View attachedPanel) {
            activity = new WeakReference<>(host);
            panel = new WeakReference<>(attachedPanel);
        }
        void cancel() {
            cancelled = true;
            frames.removeFrameCallback(this);
        }
        void schedule() {
            if (!cancelled) frames.postFrameCallback(this);
        }
        @Override public void doFrame(long frameTimeNanos) {
            Activity a = activity.get();
            View mini = panel.get();
            if (cancelled || a == null || a.isFinishing() || a.isDestroyed()
                    || mini == null || mini.getParent() == null) {
                cancel();
                if (a != null && GUARDS.get(a) == this) GUARDS.remove(a);
                return;
            }
            View decor = a.getWindow().getDecorView();
            if (decor != null && decor.isLayoutRequested()) sanitize(decor);
            schedule();
        }
    }
}
