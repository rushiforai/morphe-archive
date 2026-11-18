package app.hushmessenger.extension;

import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;

/**
 * Changing tab with a sideways swipe on the home screen. Messenger swaps one tab's page in and out of the same
 * fragment instead of holding them in a pager, so there is nothing there to swipe. The home screen's view goes inside
 * a frame that watches for a sideways drag and then makes the same call a tab button makes, for the tab next to the
 * open one in the bar's own order. Hidden tabs are skipped, so a swipe lands where a tap would.
 */
public final class TabSwipe {
    static final String KEY = "tab_swipe";
    /** How far sideways, as a share of the screen's width, commits the swipe. */
    private static final float COMMIT_WIDTH = 0.15f;
    /** The floor under that share, in dp, so a short screen still needs a real drag. */
    private static final float COMMIT_DP = 56f;
    /** Slops before the drag counts, which leaves a list that scrolls sideways time to claim the gesture first. */
    private static final int TAKE_SLOPS = 3;
    /** How much more sideways than up and down the drag has to be. */
    private static final float SIDEWAYS = 1.5f;

    private TabSwipe() {}

    /**
     * The patched view builder calls this with the view it was about to hand back and the fragment that built it. The
     * frame goes on only while the switch is on, so with it off Messenger keeps the view hierarchy it always had.
     */
    public static View wrap(View root, Object home) {
        return wrap(root, home, HostScreens.tabSwipeRoute());
    }

    /** The same work against a route given to it, which is how a test drives it without a patched stub. */
    static View wrap(View root, Object home, String route) {
        try {
            if (root == null || home == null || root.getParent() != null || !Settings.tabSwipe()) return root;
            // The extension alone, or a patch that didn't prove the route, leaves the home screen stock.
            if (route == null || route.isEmpty()) return root;
            Route target = Route.of(route, home.getClass());
            SwipeFrame frame = new SwipeFrame(root.getContext(), target, home);
            ViewGroup.LayoutParams params = root.getLayoutParams();
            if (params != null) {
                frame.setLayoutParams(params);
                root.setLayoutParams(new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            }
            frame.addView(root);
            return frame;
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't watch the home screen for a swipe", error);
            return root;
        }
    }

    /** The frame around the home screen. Every touch goes straight through until a drag is clearly sideways. */
    static final class SwipeFrame extends FrameLayout {
        private final Route route;
        private final Object home;
        private final int slop;
        private float downX;
        private float downY;
        private boolean taken;

        SwipeFrame(Context context, Route route, Object home) {
            super(context);
            this.route = route;
            this.home = home;
            this.slop = ViewConfiguration.get(context).getScaledTouchSlop();
        }

        @Override
        public boolean onInterceptTouchEvent(MotionEvent event) {
            try {
                int action = event.getActionMasked();
                if (action == MotionEvent.ACTION_DOWN) {
                    downX = event.getX();
                    downY = event.getY();
                    taken = false;
                } else if (action == MotionEvent.ACTION_MOVE && !taken && event.getPointerCount() == 1
                        && Settings.enabled(KEY)) {
                    float sideways = Math.abs(event.getX() - downX);
                    // A child that scrolls sideways asks to keep the gesture as it starts dragging, which stops this
                    // from being called at all, so the extra slop here is what keeps those lists working.
                    taken = sideways >= (long) slop * TAKE_SLOPS && sideways > Math.abs(event.getY() - downY) * SIDEWAYS;
                }
            } catch (Throwable error) {
                Settings.hookFailedPrivately(KEY, "Can't read the swipe", error);
                taken = false;
            }
            return taken || super.onInterceptTouchEvent(event);
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            if (!taken) return super.onTouchEvent(event);
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_UP) {
                taken = false;
                float moved = event.getX() - downX;
                float floor = COMMIT_DP * getResources().getDisplayMetrics().density;
                if (Math.abs(moved) >= Math.max(getWidth() * COMMIT_WIDTH, floor)) step(moved < 0 ? 1 : -1);
            } else if (action == MotionEvent.ACTION_CANCEL) {
                taken = false;
            }
            return true;
        }

        /** One tab along the bar, or nothing at either end. */
        private void step(int direction) {
            try {
                Object open = route.current(home);
                List<?> all = route.tabs(home);
                if (open == null || all == null || all.isEmpty()) return;
                // The bar leaves out the tabs Hush hides, and a swipe should land where a tap can.
                List<Object> shown = Settings.visibleTabs(new ArrayList<Object>(all));
                int at = at(shown, open);
                if (at < 0) {
                    shown = new ArrayList<Object>(all);
                    at = at(shown, open);
                }
                int next = at + direction;
                if (at < 0 || next < 0 || next >= shown.size()) return;
                route.select(home, shown.get(next));
            } catch (Throwable error) {
                Settings.hookFailedPrivately(KEY, "Can't change the tab", error);
            }
        }

        private static int at(List<?> tabs, Object open) {
            for (int i = 0; i < tabs.size(); i++) if (tabs.get(i) == open) return i;
            return -1;
        }
    }

    /**
     * The patch's proof, "Lhome;->open()LTab;|Lhome;->config:LConfig;|LConfig;->tabs:Ljava/util/List;|Lhome;->select(LTab;)V",
     * bound to the fragment's own class and checked against it again here.
     */
    static final class Route {
        private final Method current;
        private final Field config;
        private final Field tabs;
        private final Method select;

        private Route(Method current, Field config, Field tabs, Method select) {
            this.current = current;
            this.config = config;
            this.tabs = tabs;
            this.select = select;
        }

        static Route of(String route, Class<?> owner) throws ReflectiveOperationException {
            String[] parts = route.split("\\|", -1);
            if (parts.length != 4) throw new IllegalStateException("The tab route doesn't name four members");
            String[] open = member(parts[0]), held = member(parts[1]), list = member(parts[2]), pick = member(parts[3]);
            String type = descriptor(owner);
            if (!type.equals(open[0]) || !type.equals(held[0]) || !type.equals(pick[0])) {
                throw new IllegalStateException("The tab route doesn't name this home screen");
            }
            Method current = owner.getDeclaredMethod(open[1]);
            Field config = owner.getDeclaredField(held[1]);
            Class<?> tab = current.getReturnType();
            Method select = owner.getDeclaredMethod(pick[1], tab);
            Field tabs = config.getType().getDeclaredField(list[1]);
            if (!open[2].equals("()" + descriptor(tab)) || !held[2].equals(":" + descriptor(config.getType()))
                    || !list[0].equals(descriptor(config.getType())) || !list[2].equals(":Ljava/util/List;")
                    || !pick[2].equals("(" + descriptor(tab) + ")V") || tabs.getType() != List.class
                    || Modifier.isStatic(current.getModifiers()) || Modifier.isStatic(select.getModifiers())
                    || Modifier.isStatic(config.getModifiers()) || Modifier.isStatic(tabs.getModifiers())) {
                throw new IllegalStateException("The tab route has the wrong shape");
            }
            current.setAccessible(true);
            select.setAccessible(true);
            config.setAccessible(true);
            tabs.setAccessible(true);
            return new Route(current, config, tabs, select);
        }

        /** A member descriptor split into its owner, its name and the rest: ":Ltype;" or "(arguments)answer". */
        private static String[] member(String part) {
            int arrow = part.indexOf("->");
            String rest = arrow < 0 ? "" : part.substring(arrow + 2);
            int field = rest.indexOf(':'), call = rest.indexOf('(');
            int cut = field < 0 ? call : call < 0 ? field : Math.min(field, call);
            if (arrow <= 0 || cut <= 0) throw new IllegalStateException("The tab route isn't made of members");
            return new String[] {part.substring(0, arrow), rest.substring(0, cut), rest.substring(cut)};
        }

        private static String descriptor(Class<?> type) {
            return "L" + type.getName().replace('.', '/') + ";";
        }

        Object current(Object home) throws Throwable {
            return call(current, home);
        }

        List<?> tabs(Object home) throws IllegalAccessException {
            Object held = config.get(home);
            return held == null ? null : (List<?>) tabs.get(held);
        }

        void select(Object home, Object tab) throws Throwable {
            call(select, home, tab);
        }

        private static Object call(Method method, Object on, Object... arguments) throws Throwable {
            try {
                return method.invoke(on, arguments);
            } catch (InvocationTargetException error) {
                throw error.getCause() != null ? error.getCause() : error;
            }
        }
    }
}
