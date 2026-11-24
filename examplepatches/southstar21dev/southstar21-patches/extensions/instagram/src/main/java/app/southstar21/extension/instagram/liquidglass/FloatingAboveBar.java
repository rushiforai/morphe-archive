package app.southstar21.extension.instagram.liquidglass;

import android.os.SystemClock;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import java.lang.ref.WeakReference;

/**
 * A view Instagram pins to the bottom corner of a page, kept above the glass bar. With content
 * behind the bar, pages reach down to the bottom of the screen, and so does what they pin there:
 * the DM inbox's Instants stack ended up half under the bar and its blur. Its wrapper's bottom
 * margin is raised just enough to clear them, and given back when the bar isn't shown.
 */
final class FloatingAboveBar {
    /** Passed as the limit when there is no bar to keep clear of. */
    static final int NO_LIMIT = Integer.MIN_VALUE;
    private static final long LOOKUP_MS = 500;

    private final View root;
    private final int id;
    private final int[] location = new int[2];
    private WeakReference<View> found;
    private long lookedUpAt;
    /** The margin Instagram gave the wrapper, and the one we last set. */
    private int baseMargin;
    private int appliedMargin = Integer.MIN_VALUE;

    /** @param id the pinned view; its parent, a bottom aligned child of the page, is what moves */
    FloatingAboveBar(View root, int id) {
        this.root = root;
        this.id = id;
    }

    /**
     * Keeps the pinned view's bottom at or above {@code limitY} (window coordinates).
     *
     * @return whether the layout changed, so the frame about to be drawn is stale
     */
    boolean enforce(int limitY) {
        View wrapper = wrapper();
        if (wrapper == null) return false;
        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) wrapper.getLayoutParams();
        // A margin we didn't set is Instagram's own: lift from there.
        if (lp.bottomMargin != appliedMargin) baseMargin = lp.bottomMargin;
        int lift = 0;
        if (limitY != NO_LIMIT) {
            // Not while hidden (another tab) or mid layout: the position isn't final then.
            if (!wrapper.isShown() || wrapper.isLayoutRequested()) return false;
            // Layout positions, so the bar shrinking and the wrapper's own animations don't
            // move it: where its bottom would be without our lift.
            ((View) wrapper.getParent()).getLocationInWindow(location);
            int bottom = location[1] + wrapper.getBottom() + (lp.bottomMargin - baseMargin);
            lift = Math.max(0, bottom - limitY);
        }
        int margin = baseMargin + lift;
        appliedMargin = margin;
        if (lp.bottomMargin == margin) return false;
        lp.bottomMargin = margin;
        wrapper.setLayoutParams(lp);
        return true;
    }

    /** The pinned view's wrapper, when it is a bottom aligned child of a FrameLayout page. */
    private View wrapper() {
        View view = found != null ? found.get() : null;
        if (view == null || !view.isAttachedToWindow()) {
            long now = SystemClock.uptimeMillis();
            if (id == 0 || now - lookedUpAt < LOOKUP_MS) return null;
            lookedUpAt = now;
            view = root.findViewById(id);
            found = view != null ? new WeakReference<>(view) : null;
            appliedMargin = Integer.MIN_VALUE;
            if (view == null) return null;
        }
        if (!(view.getParent() instanceof View)) return null;
        View wrapper = (View) view.getParent();
        if (!(wrapper.getParent() instanceof FrameLayout)
                || !(wrapper.getLayoutParams() instanceof FrameLayout.LayoutParams)) {
            return null;
        }
        int gravity = ((FrameLayout.LayoutParams) wrapper.getLayoutParams()).gravity;
        if (gravity == FrameLayout.LayoutParams.UNSPECIFIED_GRAVITY
                || (gravity & Gravity.VERTICAL_GRAVITY_MASK) != Gravity.BOTTOM) {
            return null;
        }
        return wrapper;
    }
}
