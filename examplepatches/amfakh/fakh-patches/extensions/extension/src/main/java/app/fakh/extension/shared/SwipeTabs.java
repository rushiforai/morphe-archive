package app.fakh.extension.shared;

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
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Swiping sideways on a screen of the bottom bar switches to the next or previous tab. The activity's window callback
 * is wrapped once, so every touch is watched without a hook in the app's own touch handling, and each touch still
 * reaches the screen as before.
 *
 * A view under the finger that can still scroll sideways keeps the swipe, so a pager of the screen's own pages
 * turns first and the bar's tab changes once its last page in that direction is open. A Compose screen with pages
 * of its own turns them by tapping the page's tab.
 */
public final class SwipeTabs {
    /** What differs between apps: the swipe's switch, the screen it animates, and where its messages go. */
    public interface Host {
        /** Whether the swipe is on, asked at the start of each touch. */
        boolean enabled();

        /** The view that holds the open tab's screen, which slides in after a switch, or null for no animation. */
        View content(View bar);

        /** Width in dp of the left edge where a swipe belongs to the app's own side menu; 0 when it has none. */
        float menuEdgeDp();

        /** Notes why a swipe did nothing, for the app's debug log. */
        void log(String message);

        /** Reports a failure; the touch has already gone on to the app. */
        void error(String message, Throwable failure);

        /**
         * Whether a ViewPager whose own swipe the app turned off still turns its pages first, as its tabs would.
         * Off unless an app asks: a pager is locked for a reason in some apps.
         */
        default boolean turnsLockedPagers() {
            return false;
        }
    }

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

    private static final WeakHashMap<Activity, Gesture> gestures = new WeakHashMap<>();

    private SwipeTabs() {
    }

    /**
     * Starts watching the touches of the bar's activity. The window callback is wrapped once per activity, but the
     * app builds its bar again when a screen opened over it is closed, so every call points the watch at the bar in
     * use.
     */
    public static void install(View bar, ViewGroup tabs, Host host) {
        Activity activity = activity(bar.getContext());
        if (activity == null) return;
        Gesture existing = gestures.get(activity);
        if (existing != null) {
            existing.bind(bar, tabs);
            return;
        }
        Window window = activity.getWindow();
        Window.Callback original = window.getCallback();
        if (original == null) return;
        Gesture gesture = new Gesture(host);
        gesture.bind(bar, tabs);
        gestures.put(activity, gesture);
        window.setCallback((Window.Callback) Proxy.newProxyInstance(Window.Callback.class.getClassLoader(),
                new Class<?>[]{Window.Callback.class}, (proxy, method, args) -> {
                    if (method.getName().equals("dispatchTouchEvent") && args != null && args.length == 1
                            && args[0] instanceof MotionEvent) {
                        return gesture.handle((MotionEvent) args[0], window.getDecorView(), original);
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
        private WeakReference<View> bar = new WeakReference<>(null);
        private WeakReference<ViewGroup> tabs = new WeakReference<>(null);
        private final Host host;
        private float downX;
        private float downY;
        private VelocityTracker velocity;
        private boolean valid;
        /** Whether the swipe is ours: the app got a cancel and does not see the rest of the touch. */
        private boolean intercepting;
        /**
         * Whether something under the finger at the start can scroll sideways, by direction: [back, forward], then
         * whether the screen's pager can turn a page: [back, forward].
         */
        private boolean[] scrollable;
        /** Window bounds of the screen's pager under the finger (left, top, right, bottom), or null. */
        private float[] pager;
        /** The locked ViewPager under the finger, which the swipe turns, or null. */
        private WeakReference<View> lockedPager = new WeakReference<>(null);

        Gesture(Host host) {
            this.host = host;
        }

        /** Points the watch at the bar that is on screen. */
        void bind(View bar, ViewGroup tabs) {
            this.bar = new WeakReference<>(bar);
            this.tabs = new WeakReference<>(tabs);
        }

        /**
         * Returns whether the touch was handled; when it was not ours it goes to the app through {@code original}.
         * The callback is passed in, not kept: it is the activity, which the map of gestures must not hold on to.
         */
        boolean handle(MotionEvent event, View decor, Window.Callback original) {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                if (velocity != null) velocity.recycle();
                velocity = VelocityTracker.obtain();
                intercepting = false;
                View b = bar.get();
                valid = b != null && b.isShown() && host.enabled();
                downX = event.getRawX();
                downY = event.getRawY();
                scrollable = null;
                pager = null;
                lockedPager = new WeakReference<>(null);
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
            if (scrollable == null) {
                pager = new float[4];
                scrollable = scrollableUnder(decor, downX, downY, pager);
            }
            if (scrollable[forward ? 1 : 0]) return false;
            // A swipe to the right from the very edge opens the app's own side menu.
            if (dx > 0 && downX < host.menuEdgeDp() * density) return false;
            return scrollable[forward ? 3 : 2] || targetTab(forward) != null;
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
                    host.log("swipe ignored: dx=" + (int) (dx / density) + "dp dy=" + (int) (dy / density)
                            + "dp speed=" + (int) speed + "dp/s");
                    return;
                }
                // Moving the finger left scrolls content forward.
                boolean forward = dx < 0;
                if (scrollable != null && scrollable[forward ? 3 : 2]) {
                    View locked = lockedPager.get();
                    if (locked != null && turnLocked(locked, forward)) return;
                    if (turnPage(b.getRootView(), pager, forward)) return;
                    host.log("swipe: page tab not found, switching the bar's tab");
                }
                View tab = targetTab(forward);
                if (tab == null) return;
                tab.performClick();
                slideIn(b, forward);
            } catch (Throwable t) {
                host.error("swipe between tabs failed", t);
            }
        }

        /**
         * The app swaps the screen without a transition, so the new screen slides in from the side the swipe came
         * from. The swap is committed right after the click, so the offset is set before the next frame.
         */
        private void slideIn(View bar, boolean forward) {
            View content = host.content(bar);
            if (content == null) return;
            content.animate().cancel();
            content.setTranslationX((forward ? 1 : -1) * content.getWidth() * 0.25f);
            content.setAlpha(0.4f);
            content.animate().translationX(0).alpha(1).setDuration(260)
                    .setInterpolator(new android.view.animation.DecelerateInterpolator()).start();
        }

        /**
         * Opens the screen's next or previous page by tapping its tab: of the rows of tabs above the pager, the one
         * closest to it, ordered from left to right.
         *
         * @return whether a tab was tapped.
         */
        private boolean turnPage(View root, float[] pager, boolean forward) throws Exception {
            List<View> composeViews = new ArrayList<>();
            composeViews(root, composeViews);
            List<Object[]> tabs = new ArrayList<>();
            for (View view : composeViews) {
                Object owner = view.getClass().getMethod("getSemanticsOwner").invoke(view);
                collectTabs(owner.getClass().getMethod("getUnmergedRootSemanticsNode").invoke(owner), 0, tabs);
            }
            // The row of tabs closest above the pager's top; tabs within a few pixels of each other are one row.
            float rowBottom = -1;
            for (Object[] tab : tabs) {
                float bottom = ((float[]) tab[0])[3];
                if (bottom <= pager[1] + 8 && bottom > rowBottom) rowBottom = bottom;
            }
            List<Object[]> row = new ArrayList<>();
            for (Object[] tab : tabs) {
                if (rowBottom >= 0 && Math.abs(((float[]) tab[0])[3] - rowBottom) < 8) row.add(tab);
            }
            row.sort((a, c) -> Float.compare(((float[]) a[0])[0], ((float[]) c[0])[0]));
            int current = -1;
            for (int i = 0; i < row.size(); i++) if ((Boolean) row.get(i)[1]) current = i;
            int target = current + (forward ? 1 : -1);
            host.log("swipe: " + row.size() + " page tabs, open " + current + ", to " + target);
            if (current < 0 || target < 0 || target >= row.size()) return false;
            Object click = actionOf(row.get(target)[2]);
            if (click == null) return false;
            for (Method method : click.getClass().getDeclaredMethods()) {
                // The tab's click lambda (a Function0): its one method without parameters, named invoke when R8 left it.
                if (method.getParameterTypes().length != 0 || method.isSynthetic()
                        || java.lang.reflect.Modifier.isStatic(method.getModifiers())) continue;
                method.setAccessible(true);
                method.invoke(click);
                return true;
            }
            return false;
        }

        /** The lambda of a Compose AccessibilityAction(label, action): its field that is not the label. */
        private static Object actionOf(Object accessibilityAction) throws IllegalAccessException {
            for (Field field : accessibilityAction.getClass().getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(field.getModifiers()) || field.getType() == String.class) continue;
                field.setAccessible(true);
                Object value = field.get(accessibilityAction);
                if (value != null) return value;
            }
            return null;
        }

        private static void composeViews(View view, List<View> out) {
            if (view.getClass().getName().endsWith("AndroidComposeView") && view.isShown()) out.add(view);
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) composeViews(group.getChildAt(i), out);
            }
        }

        /** Adds every node with the Tab role as {bounds in window, selected, its OnClick action}. */
        private static void collectTabs(Object node, int depth, List<Object[]> out) throws Exception {
            if (depth > 60) return;
            Object config = node.getClass().getMethod("getConfig").invoke(node);
            Iterator<?> it = (Iterator<?>) config.getClass().getMethod("iterator").invoke(config);
            boolean tab = false;
            boolean selected = false;
            Object click = null;
            while (it.hasNext()) {
                Map.Entry<?, ?> entry = (Map.Entry<?, ?>) it.next();
                Object key = entry.getKey();
                Object name = key.getClass().getField("name").get(key);
                if ("Role".equals(name)) tab = "Tab".equals(String.valueOf(entry.getValue()));
                else if ("Selected".equals(name)) selected = Boolean.TRUE.equals(entry.getValue());
                else if ("OnClick".equals(name)) click = entry.getValue();
            }
            if (tab && click != null) {
                Object rect = node.getClass().getMethod("getBoundsInWindow").invoke(node);
                Class<?> r = rect.getClass();
                float[] bounds = {r.getField("left").getFloat(rect), r.getField("top").getFloat(rect),
                        r.getField("right").getFloat(rect), r.getField("bottom").getFloat(rect)};
                if (bounds[2] > bounds[0]) out.add(new Object[]{bounds, selected, click});
            }
            Method children = node.getClass().getMethod("getChildren$ui", boolean.class, boolean.class, boolean.class);
            for (Object child : (List<?>) children.invoke(node, true, false, false)) collectTabs(child, depth + 1, out);
        }

        /**
         * Whether the views under a point, from the innermost out, can scroll back or forward sideways, then whether
         * a pager of the screen's own pages can: [back, forward, page back, page forward]. The pager's bounds go into
         * [pager].
         */
        private boolean[] scrollableUnder(View decor, float x, float y, float[] pager) {
            boolean[] result = new boolean[4];
            View view = viewAt(decor, x, y);
            for (View v = view; v != null; v = v.getParent() instanceof View ? (View) v.getParent() : null) {
                if (v.getClass().getName().endsWith("AndroidComposeView")) {
                    // Its own answer is for the last place the screen saw a touch go down, which is not always this
                    // one, so the scrolling rows under the point are asked directly.
                    int[] screen = new int[2];
                    int[] window = new int[2];
                    v.getLocationOnScreen(screen);
                    v.getLocationInWindow(window);
                    composeScrollable(v, x - (screen[0] - window[0]), y - (screen[1] - window[1]), result, pager);
                } else {
                    result[0] |= v.canScrollHorizontally(-1);
                    result[1] |= v.canScrollHorizontally(1);
                    int[] pages = host.turnsLockedPagers() && lockedPager.get() == null ? pages(v) : null;
                    if (pages != null) {
                        lockedPager = new WeakReference<>(v);
                        result[2] |= pages[0] > 0;
                        result[3] |= pages[0] < pages[1] - 1;
                    }
                }
            }
            return result;
        }

        /** Adds what the sideways scrolling nodes of a Compose screen under a point (window coordinates) can do. */
        private void composeScrollable(View composeView, float x, float y, boolean[] result, float[] pager) {
            try {
                Object owner = composeView.getClass().getMethod("getSemanticsOwner").invoke(composeView);
                Object root = owner.getClass().getMethod("getUnmergedRootSemanticsNode").invoke(owner);
                scrollRanges(root, x, y, composeView.getHeight() * 0.7f, 0, result, pager);
            } catch (Throwable t) {
                host.error("semantics tree unreadable", t);
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

        private static void scrollRanges(Object node, float x, float y, float pageHeight, int depth, boolean[] result,
                float[] pager) throws Exception {
            if (depth > 60) return;
            Object rect = node.getClass().getMethod("getBoundsInWindow").invoke(node);
            Class<?> r = rect.getClass();
            if (x < r.getField("left").getFloat(rect) || x > r.getField("right").getFloat(rect)
                    || y < r.getField("top").getFloat(rect) || y > r.getField("bottom").getFloat(rect)) return;
            Object config = node.getClass().getMethod("getConfig").invoke(node);
            Iterator<?> it = (Iterator<?>) config.getClass().getMethod("iterator").invoke(config);
            // A node as tall as the screen is the pager of the screen's own pages (LinkedIn's Grow and Catch up), not
            // a row of content: its pages are turned by the swipe, through their tabs.
            boolean page = r.getField("bottom").getFloat(rect) - r.getField("top").getFloat(rect) >= pageHeight;
            while (it.hasNext()) {
                Map.Entry<?, ?> entry = (Map.Entry<?, ?>) it.next();
                Object key = entry.getKey();
                if (!"HorizontalScrollAxisRange".equals(key.getClass().getField("name").get(key))) continue;
                Object range = entry.getValue();
                float value = call(range, "value");
                float max = call(range, "maxValue");
                int offset = page ? 2 : 0;
                result[offset] |= value > 0;
                result[offset + 1] |= value < max;
                if (page) {
                    pager[0] = r.getField("left").getFloat(rect);
                    pager[1] = r.getField("top").getFloat(rect);
                    pager[2] = r.getField("right").getFloat(rect);
                    pager[3] = r.getField("bottom").getFloat(rect);
                }
            }
            Method children = node.getClass().getMethod("getChildren$ui", boolean.class, boolean.class, boolean.class);
            for (Object child : (List<?>) children.invoke(node, true, false, false)) {
                scrollRanges(child, x, y, pageHeight, depth + 1, result, pager);
            }
        }

        /** The open page and the number of pages of a ViewPager, or null when the view is not one. */
        private static int[] pages(View view) {
            boolean pager = false;
            for (Class<?> c = view.getClass(); c != null && !pager; c = c.getSuperclass()) {
                pager = c.getName().equals("androidx.viewpager.widget.ViewPager");
            }
            if (!pager) return null;
            try {
                Object adapter = view.getClass().getMethod("getAdapter").invoke(view);
                if (adapter == null) return null;
                int count = (Integer) adapter.getClass().getMethod("getCount").invoke(adapter);
                int current = (Integer) view.getClass().getMethod("getCurrentItem").invoke(view);
                return new int[]{current, count};
            } catch (ReflectiveOperationException | RuntimeException failure) {
                return null;
            }
        }

        /**
         * Opens the next or previous page of a locked ViewPager, as its tabs do.
         *
         * @return whether the page changed.
         */
        private boolean turnLocked(View pager, boolean forward) {
            int[] pages = pages(pager);
            if (pages == null) return false;
            int target = pages[0] + (forward ? 1 : -1);
            if (target < 0 || target >= pages[1]) return false;
            try {
                pager.getClass().getMethod("setCurrentItem", int.class, boolean.class).invoke(pager, target, true);
                return true;
            } catch (ReflectiveOperationException | RuntimeException failure) {
                host.error("locked pager did not turn", failure);
                return false;
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
                // A bare View that takes no touch is a placeholder (a TabHost's tab content): touches go past it to
                // the views under it, and so does this search.
                if (child.getClass() == View.class && !child.isClickable() && !child.isLongClickable()) continue;
                child.getLocationOnScreen(location);
                rect.set(location[0], location[1], location[0] + child.getWidth(), location[1] + child.getHeight());
                if (rect.contains((int) x, (int) y)) return viewAt(child, x, y);
            }
            return view;
        }
    }
}
