package pl.dudek.extension.tiktok;

import android.os.SystemClock;
import android.view.View;
import android.view.ViewTreeObserver;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Installed only on TikTok's InnerChatLinearLayoutManager message list. */
public final class KeepDmScrollPosition {
    // Weak values are essential: State -> View -> LayoutManager must not retain a key.
    private static final WeakHashMap<RecyclerView, WeakReference<State>> states = new WeakHashMap<>();
    private KeepDmScrollPosition() {}

    public static void attach(RecyclerView list) {
        if (list == null || state(list) != null) return;
        State state = new State(list);
        states.put(list, new WeakReference<>(state));
        list.getViewTreeObserver().addOnPreDrawListener(state);
        list.addOnAttachStateChangeListener(state);
    }

    public static void detach(RecyclerView list) {
        State state = state(list);
        if (state != null) state.dispose();
    }

    private static State state(RecyclerView list) {
        WeakReference<State> ref = states.get(list);
        return ref == null ? null : ref.get();
    }

    private static boolean inHistory(RecyclerView list) {
        RecyclerView.LayoutManager manager = list.getLayoutManager();
        return manager instanceof LinearLayoutManager &&
                ((LinearLayoutManager) manager).findFirstVisibleItemPosition() > 0;
    }

    /** Called at the actual dataset-commit scroll, after consuming its queue. */
    public static boolean shouldSkipAutoScroll(RecyclerView list) {
        if (list == null || !list.isAttachedToWindow() || list.getChildCount() == 0) return false;
        State state = state(list);
        if (state != null && state.allowBottom) {
            state.allowBottom = false;
            state.anchor = null;
            return false;
        }
        // The last drawn frame precedes insertion at position zero. Checking only
        // the new adapter positions would mistake normal bottom sending for history.
        if (state != null && state.drawn && list.getScrollState() == 0) {
            if (state.history) state.resizeUntil = SystemClock.uptimeMillis() + 1000;
            return state.history;
        }
        return inHistory(list);
    }

    /** Exact user-facing scroll-to-bottom action, including its load-newest path. */
    public static void requestLatest() {
        for (WeakReference<State> ref : states.values()) {
            State state = ref.get();
            if (state != null && state.list.isShown() && state.list.hasWindowFocus()) {
                state.anchor = null;
                state.resizeUntil = 0;
                state.allowBottom = true;
            }
        }
    }

    /** Explicit message navigation must never be mistaken for a resize. */
    public static void navigateToMessage() {
        for (WeakReference<State> ref : states.values()) {
            State state = ref.get();
            if (state != null && state.list.isShown() && state.list.hasWindowFocus()) {
                state.anchor = null;
                state.resizeUntil = 0;
                state.allowBottom = false;
            }
        }
    }

    private static final class State implements ViewTreeObserver.OnPreDrawListener,
            View.OnAttachStateChangeListener {
        final RecyclerView list;
        final ViewTreeObserver observer;
        final int[] location = new int[2];
        View anchor;
        long itemId, resizeUntil;
        int position, itemCount, anchorHeight, width, height, paddingTop, paddingBottom, screenTop;
        float anchorY;
        boolean drawn, history, allowBottom, disposed;

        State(RecyclerView list) {
            this.list = list;
            observer = list.getViewTreeObserver();
        }

        private int top() {
            list.getLocationOnScreen(location);
            return location[1];
        }

        private float visualY(View child) {
            return top() + child.getTop() + child.getTranslationY();
        }

        private boolean sameItem() {
            if (anchor == null || anchor.getParent() != list || anchor.getHeight() != anchorHeight) return false;
            int current = list.getChildAdapterPosition(anchor);
            RecyclerView.LayoutManager manager = list.getLayoutManager();
            if (current < 0 || manager == null) return false;
            // Prefer stable IDs. Without them, retain the attached view only;
            // explicit navigation and drag/fling invalidate it separately.
            return itemId != -1 ? list.getChildItemId(anchor) == itemId :
                    current == position || current == position + manager.getItemCount() - itemCount;
        }

        private void capture() {
            anchor = null;
            if (history && list.getScrollState() == 0 && !allowBottom) {
                for (int i = 0; i < list.getChildCount(); i++) {
                    View child = list.getChildAt(i);
                    if (child.getBottom() <= list.getPaddingTop() ||
                            child.getTop() >= list.getHeight() - list.getPaddingBottom() ||
                            list.getChildAdapterPosition(child) < 0) continue;
                    if (anchor == null || child.getTop() < anchor.getTop()) anchor = child;
                }
            }
            if (anchor != null) {
                anchorHeight = anchor.getHeight();
                itemId = list.getChildItemId(anchor);
                position = list.getChildAdapterPosition(anchor);
                itemCount = list.getLayoutManager().getItemCount();
                anchorY = visualY(anchor);
            }
        }

        public boolean onPreDraw() {
            if (disposed) return true;
            if (!list.isAttachedToWindow()) { dispose(); return true; }
            int currentTop = top();
            long now = SystemClock.uptimeMillis();
            boolean idle = list.getScrollState() == 0;
            if (list.getScrollState() == 1) allowBottom = false; // user takes control
            boolean resized = drawn && width == list.getWidth() &&
                    (height != list.getHeight() || screenTop != currentTop ||
                     paddingTop != list.getPaddingTop() || paddingBottom != list.getPaddingBottom());
            boolean valid = history && idle && !allowBottom && list.hasWindowFocus() &&
                    width == list.getWidth() && sameItem();
            if (valid && resized) resizeUntil = now + 1000;
            if (valid && now < resizeUntil) {
                int delta = Math.round(visualY(anchor) - anchorY);
                if (delta != 0) list.scrollBy(0, delta);
                // A boundary, changed item or clamped scroll retires this anchor.
                if (!sameItem() || Math.abs(visualY(anchor) - anchorY) > 1) {
                    resizeUntil = 0;
                }
            } else if (!valid || now >= resizeUntil) {
                resizeUntil = 0;
            }
            history = inHistory(list);
            if (!history) allowBottom = false;
            drawn = true;
            width = list.getWidth(); height = list.getHeight(); screenTop = top();
            paddingTop = list.getPaddingTop(); paddingBottom = list.getPaddingBottom();
            if (resizeUntil == 0) capture();
            return true;
        }

        void dispose() {
            disposed = true;
            if (observer.isAlive()) observer.removeOnPreDrawListener(this);
            list.removeOnAttachStateChangeListener(this);
            states.remove(list);
            anchor = null;
        }
        public void onViewAttachedToWindow(View view) {}
        public void onViewDetachedFromWindow(View view) { dispose(); }
    }
}
