package app.badfella.extension.linkedin;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Swiping sideways on a screen of the bottom bar switches to the next or previous tab. The activity's window callback
 * is wrapped once, so every touch is watched without a hook in the app's own touch handling, and each touch still
 * reaches the screen as before.
 */
final class SwipeTabs {
    /** Shortest swipe, in dp. Anything shorter is a tap or a scroll that drifted. */
    private static final float MIN_DISTANCE_DP = 64;
    /** A swipe this long, as a fraction of the screen width, counts even when it is slow. */
    private static final float LONG_DISTANCE = 0.25f;
    /** A swipe this fast, in dp per second, counts even when it is short. */
    private static final float FLING_SPEED_DP = 350;
    /**
     * How far sideways the finger goes before the swipe is taken from the app, in dp. Just past the touch slop, so
     * items that reveal an action when dragged sideways (every notification) are cancelled before it shows.
     */
    private static final float INTERCEPT_DP = 10;
    /** How much longer than tall a swipe must be. */
    private static final float HORIZONTAL_RATIO = 1.5f;
    /** The edge where the app's own side menu opens, in dp: a swipe that starts there is the menu's. */
    private static final float MENU_EDGE_DP = 28;

    private static final WeakHashMap<Activity, Boolean> wrapped = new WeakHashMap<>();

    private SwipeTabs() {
    }

    /** Starts watching the touches of the bar's activity. Does nothing a second time for the same activity. */
    static void install(View bar, ViewGroup tabs) {
        Activity activity = activity(bar.getContext());
        if (activity == null || wrapped.put(activity, true) != null) return;
        Window window = activity.getWindow();
        Window.Callback original = window.getCallback();
        if (original == null) return;
        Gesture gesture = new Gesture(new WeakReference<>(bar), new WeakReference<>(tabs), original);
        window.setCallback((Window.Callback) Proxy.newProxyInstance(Window.Callback.class.getClassLoader(),
                new Class<?>[]{Window.Callback.class}, (proxy, method, args) -> {
                    if (method.getName().equals("dispatchTouchEvent") && args != null && args.length == 1
                            && args[0] instanceof MotionEvent) {
                        return gesture.handle((MotionEvent) args[0], window.getDecorView());
                    }
                    try {
                        return method.invoke(original, args);
                    } catch (InvocationTargetException e) {
                        throw e.getCause();
                    }
                }));
    }

    private static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    /** The state of the touch being watched. */
    private static final class Gesture {
        private final WeakReference<View> bar;
        private final WeakReference<ViewGroup> tabs;
        private final Window.Callback original;
        private float downX;
        private float downY;
        private VelocityTracker velocity;
        private boolean valid;
        /** Whether the swipe is ours: the app got a cancel and does not see the rest of the touch. */
        private boolean intercepting;
        /** Whether something under the finger at the start can scroll sideways, by direction: [back, forward]. */
        private boolean[] scrollable;

        Gesture(WeakReference<View> bar, WeakReference<ViewGroup> tabs, Window.Callback original) {
            this.bar = bar;
            this.tabs = tabs;
            this.original = original;
        }

        /** Returns whether the touch was handled; when it was not ours it goes to the app as before. */
        boolean handle(MotionEvent event, View decor) {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                if (velocity != null) velocity.recycle();
                velocity = VelocityTracker.obtain();
                intercepting = false;
                View b = bar.get();
                valid = b != null && b.isShown() && Settings.swipeTabs();
                downX = event.getRawX();
                downY = event.getRawY();
                scrollable = null;
            }
            if (velocity != null) velocity.addMovement(event);
            if (action == MotionEvent.ACTION_POINTER_DOWN) valid = false;
            if (intercepting) {
                if (action == MotionEvent.ACTION_UP) {
                    intercepting = false;
                    finish(event);
                } else if (action == MotionEvent.ACTION_CANCEL) {
                    intercepting = false;
                }
                return true;
            }
            if (action == MotionEvent.ACTION_CANCEL) valid = false;
            if (valid && action == MotionEvent.ACTION_MOVE && isSwipe(event, decor)) {
                // Compose treats letting go inside the element as a click, so a swipe that starts on a post header
                // would open the profile. The app is told the touch is over, and the swipe is handled here.
                MotionEvent cancel = MotionEvent.obtain(event);
                cancel.setAction(MotionEvent.ACTION_CANCEL);
                try {
                    original.dispatchTouchEvent(cancel);
                } finally {
                    cancel.recycle();
                }
                intercepting = true;
                return true;
            }
            return original.dispatchTouchEvent(event);
        }

        /** Whether the finger has gone far enough sideways, and no screen under it wants the swipe. */
        private boolean isSwipe(MotionEvent event, View decor) {
            View b = bar.get();
            if (b == null) return false;
            float density = b.getResources().getDisplayMetrics().density;
            float dx = event.getRawX() - downX;
            float dy = event.getRawY() - downY;
            if (Math.abs(dx) < INTERCEPT_DP * density || Math.abs(dx) < HORIZONTAL_RATIO * Math.abs(dy)) return false;
            boolean forward = dx < 0;
            // Asked now, not at the start: a Compose screen answers for the position of the touch it has seen, and
            // it has not seen this one yet when it begins.
            if (scrollable == null) scrollable = scrollableUnder(decor, downX, downY);
            if (scrollable[forward ? 1 : 0]) return false;
            // A swipe to the right from the very edge opens the app's own side menu.
            if (dx > 0 && downX < MENU_EDGE_DP * density) return false;
            return targetTab(forward) != null;
        }

        /** The tab next to the selected one in a direction, or null at the ends. */
        private View targetTab(boolean forward) {
            ViewGroup row = tabs.get();
            if (row == null) return null;
            int current = -1;
            for (int i = 0; i < row.getChildCount(); i++) {
                if (row.getChildAt(i).isSelected()) current = i;
            }
            int target = current + (forward ? 1 : -1);
            if (current < 0 || target < 0 || target >= row.getChildCount()) return null;
            View tab = row.getChildAt(target);
            return tab.getVisibility() == View.VISIBLE ? tab : null;
        }

        /** Lifting the finger: switches the tab when the swipe was long or fast enough. */
        private void finish(MotionEvent event) {
            try {
                float dx = event.getRawX() - downX;
                float dy = event.getRawY() - downY;
                View b = bar.get();
                if (b == null || !b.isShown() || velocity == null) return;
                float density = b.getResources().getDisplayMetrics().density;
                float width = b.getRootView().getWidth();
                velocity.computeCurrentVelocity(1000);
                float speed = Math.abs(velocity.getXVelocity()) / density;
                float distance = Math.abs(dx);
                boolean far = distance >= width * LONG_DISTANCE;
                boolean fast = distance >= MIN_DISTANCE_DP * density && speed >= FLING_SPEED_DP;
                if (!(far || fast) || distance < HORIZONTAL_RATIO * Math.abs(dy)) {
                    Settings.debugLog("swipe ignored: dx=" + (int) (dx / density) + "dp dy=" + (int) (dy / density)
                            + "dp speed=" + (int) speed + "dp/s");
                    return;
                }
                // Moving the finger left scrolls content forward.
                boolean forward = dx < 0;
                View tab = targetTab(forward);
                if (tab == null) return;
                tab.performClick();
                slideIn(b, forward);
            } catch (Throwable t) {
                Diagnostics.error("swipe between tabs failed", t);
            }
        }

        /**
         * The app swaps the screen without a transition, so the new screen slides in from the side the swipe came
         * from. The swap is committed right after the click, so the offset is set before the next frame.
         */
        private static void slideIn(View bar, boolean forward) {
            View content = NavigationBar.child(bar.getRootView(), "home_nav_item_fragment_container");
            if (content == null) return;
            content.animate().cancel();
            content.setTranslationX((forward ? 1 : -1) * content.getWidth() * 0.25f);
            content.setAlpha(0.4f);
            content.animate().translationX(0).alpha(1).setDuration(260)
                    .setInterpolator(new android.view.animation.DecelerateInterpolator()).start();
        }

        /** Whether the views under a point, from the innermost out, can scroll back or forward sideways. */
        private static boolean[] scrollableUnder(View decor, float x, float y) {
            boolean[] result = new boolean[2];
            View view = viewAt(decor, x, y);
            for (View v = view; v != null; v = v.getParent() instanceof View ? (View) v.getParent() : null) {
                if (v.getClass().getName().endsWith("AndroidComposeView")) {
                    // Its own answer is for the last place the screen saw a touch go down, which is not always this
                    // one, so the scrolling rows under the point are asked directly.
                    int[] screen = new int[2];
                    int[] window = new int[2];
                    v.getLocationOnScreen(screen);
                    v.getLocationInWindow(window);
                    composeScrollable(v, x - (screen[0] - window[0]), y - (screen[1] - window[1]), result);
                } else {
                    result[0] |= v.canScrollHorizontally(-1);
                    result[1] |= v.canScrollHorizontally(1);
                }
            }
            return result;
        }

        /** Adds what the sideways scrolling nodes of a Compose screen under a point (window coordinates) can do. */
        private static void composeScrollable(View composeView, float x, float y, boolean[] result) {
            try {
                Object owner = composeView.getClass().getMethod("getSemanticsOwner").invoke(composeView);
                Object root = owner.getClass().getMethod("getUnmergedRootSemanticsNode").invoke(owner);
                scrollRanges(root, x, y, composeView.getHeight() * 0.7f, 0, result);
            } catch (Throwable t) {
                Diagnostics.error("semantics tree unreadable", t);
            }
        }

        /** The number the lambda held by a field of a scroll range returns. */
        private static float call(Object range, String field) throws Exception {
            Field f = range.getClass().getDeclaredField(field);
            f.setAccessible(true);
            Object lambda = f.get(range);
            Method invoke = lambda.getClass().getDeclaredMethod("invoke");
            invoke.setAccessible(true);
            return (Float) invoke.invoke(lambda);
        }

        private static void scrollRanges(Object node, float x, float y, float pageHeight, int depth, boolean[] result)
                throws Exception {
            if (depth > 60) return;
            Object rect = node.getClass().getMethod("getBoundsInWindow").invoke(node);
            Class<?> r = rect.getClass();
            if (x < r.getField("left").getFloat(rect) || x > r.getField("right").getFloat(rect)
                    || y < r.getField("top").getFloat(rect) || y > r.getField("bottom").getFloat(rect)) return;
            Object config = node.getClass().getMethod("getConfig").invoke(node);
            Iterator<?> it = (Iterator<?>) config.getClass().getMethod("iterator").invoke(config);
            // A node as tall as the screen is the pager of the screen's own pages (Network's Grow and Catch up), not
            // a row of content, and it does not take a swipe from the bar.
            boolean page = r.getField("bottom").getFloat(rect) - r.getField("top").getFloat(rect) >= pageHeight;
            while (it.hasNext() && !page) {
                Map.Entry<?, ?> entry = (Map.Entry<?, ?>) it.next();
                Object key = entry.getKey();
                if (!"HorizontalScrollAxisRange".equals(key.getClass().getField("name").get(key))) continue;
                Object range = entry.getValue();
                float value = call(range, "value");
                float max = call(range, "maxValue");
                result[0] |= value > 0;
                result[1] |= value < max;
            }
            Method children = node.getClass().getMethod("getChildren$ui", boolean.class, boolean.class, boolean.class);
            for (Object child : (List<?>) children.invoke(node, true, false, false)) {
                scrollRanges(child, x, y, pageHeight, depth + 1, result);
            }
        }

        /** The innermost visible view that contains a point in screen coordinates. */
        private static View viewAt(View view, float x, float y) {
            if (!(view instanceof ViewGroup)) return view;
            ViewGroup group = (ViewGroup) view;
            Rect rect = new Rect();
            int[] location = new int[2];
            for (int i = group.getChildCount() - 1; i >= 0; i--) {
                View child = group.getChildAt(i);
                if (child.getVisibility() != View.VISIBLE) continue;
                child.getLocationOnScreen(location);
                rect.set(location[0], location[1], location[0] + child.getWidth(), location[1] + child.getHeight());
                if (rect.contains((int) x, (int) y)) return viewAt(child, x, y);
            }
            return view;
        }
    }
}
