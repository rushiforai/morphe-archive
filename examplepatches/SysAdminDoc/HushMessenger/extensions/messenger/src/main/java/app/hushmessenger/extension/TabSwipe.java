package app.hushmessenger.extension;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Picture;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

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
            if (root == null || home == null || root.getParent() != null || !(Settings.tabSwipe() || TabSlide.on())) return root;
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

    /**
     * The frame around the home screen. Every touch goes straight through until a drag is clearly sideways. One that
     * starts on the tab bar with Slide along the tab bar on slides along it instead ([TabSlide]).
     */
    static final class SwipeFrame extends FrameLayout {
        private final Route route;
        private final Object home;
        private final int slop;
        private float downX;
        private float downY;
        private boolean taken;
        /** The bar the finger went down on, with Slide along the tab bar on, or null. */
        private TabSlide.Bar bar;
        private boolean sliding;
        /** The page following the finger, with Page follows your finger on, or null. */
        private TabFollow.Drag follow;
        private boolean tabAfter;
        private boolean tabBefore;
        /** Which tab each page Messenger built belongs to, learnt as each one shows when a swipe or a tab tap starts. */
        private final Map<View, Object> pagesBuilt = new WeakHashMap<>();
        /** A picture of each tab's page the last time it was left, for Page follows your finger. */
        private final Map<Object, TabFollow.Shot> pictures = new HashMap<>();
        /** Set when this touch went down on a swipe still changing the tab, so the page on screen may not be its own. */
        private boolean cutShort;

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
                    cutShort = endFollow(true);
                    endSlide();
                    bar = TabSlide.on() ? barAt(Math.round(event.getRawX()), Math.round(event.getRawY())) : null;
                    onTabBar(event);
                } else if (action == MotionEvent.ACTION_MOVE && !taken && event.getPointerCount() == 1 && bar != null) {
                    float sideways = Math.abs(event.getX() - downX);
                    // Nothing on the bar scrolls, so a slop is enough to tell a slide from a tap.
                    if (TabSlide.on() && sideways >= slop && sideways > Math.abs(event.getY() - downY)) {
                        taken = sliding = true;
                        bar.slideTo(event.getRawX());
                        Settings.activeAt.put(TabSlide.KEY, System.currentTimeMillis());
                    }
                } else if (action == MotionEvent.ACTION_MOVE && !taken && event.getPointerCount() == 1
                        && Settings.enabled(KEY)) {
                    float sideways = Math.abs(event.getX() - downX);
                    // A child that scrolls sideways asks to keep the gesture as it starts dragging, which stops this
                    // from being called at all, so the extra slop here is what keeps those lists working.
                    taken = sideways >= (long) slop * TAKE_SLOPS && sideways > Math.abs(event.getY() - downY) * SIDEWAYS;
                    if (taken) startFollow();
                }
            } catch (Throwable error) {
                Settings.hookFailedPrivately(sliding || bar != null ? TabSlide.KEY : KEY, "Can't read the swipe", error);
                taken = false;
                endSlide();
            }
            return taken || super.onInterceptTouchEvent(event);
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            if (sliding) return slide(event);
            if (!taken) return super.onTouchEvent(event);
            int action = event.getActionMasked();
            float moved = event.getX() - downX;
            if (action == MotionEvent.ACTION_MOVE) {
                if (follow != null) followTo(moved);
            } else if (action == MotionEvent.ACTION_POINTER_DOWN && follow != null) {
                // A second finger isn't a swipe between tabs any more, so the page goes back and the gesture is let be.
                taken = false;
                letGo(false, 0);
            } else if (action == MotionEvent.ACTION_UP) {
                taken = false;
                float floor = COMMIT_DP * getResources().getDisplayMetrics().density;
                boolean commits = Math.abs(moved) >= Math.max(getWidth() * COMMIT_WIDTH, floor);
                int direction = moved < 0 ? 1 : -1;
                if (follow == null) {
                    if (commits) step(direction);
                } else {
                    letGo(commits && (direction > 0 ? tabAfter : tabBefore), direction);
                }
            } else if (action == MotionEvent.ACTION_CANCEL) {
                taken = false;
                if (follow != null) letGo(false, 0);
            }
            return true;
        }

        @Override
        protected void onDetachedFromWindow() {
            endFollow(false);
            super.onDetachedFromWindow();
        }

        /** The side beside the moving page goes over everything the home screen drew, the tab bar left out. */
        @Override
        protected void dispatchDraw(Canvas canvas) {
            super.dispatchDraw(canvas);
            TabFollow.Drag drag = follow;
            if (drag != null) drag.draw(canvas);
        }

        /** Pictures taken at another size don't fit any more. */
        @Override
        protected void onSizeChanged(int width, int height, int oldWidth, int oldHeight) {
            super.onSizeChanged(width, height, oldWidth, oldHeight);
            pictures.clear();
        }

        /** Nor do ones taken with another theme. */
        @Override
        protected void onConfigurationChanged(Configuration configuration) {
            super.onConfigurationChanged(configuration);
            pictures.clear();
        }

        /** With Page follows your finger on, the views that move along with this swipe, and which ways a tab is left. */
        private void startFollow() {
            try {
                if (!TabFollow.on()) {
                    pictures.clear();
                    return;
                }
                List<View> moving = TabFollow.pages(this);
                if (moving.isEmpty()) return;
                Object after = next(1);
                Object before = next(-1);
                tabAfter = after != null;
                tabBefore = before != null;
                // The page this swipe may leave, still at rest, for the next time a swipe heads back to its tab.
                if (!cutShort) keepPicture(moving);
                follow = new TabFollow.Drag(this, moving, pagesBuilt, pictures, route.current(home), before, after);
            } catch (Throwable error) {
                Settings.hookFailedPrivately(TabFollow.KEY, "Can't move the page with the finger", error);
                follow = null;
            }
        }

        /** A finger going down on the tab bar may be about to leave the open tab, so its page's picture is taken now. */
        private void onTabBar(MotionEvent event) {
            if (!TabFollow.on()) {
                pictures.clear();
                return;
            }
            if (cutShort) return;
            try {
                View tabBar = TabFollow.bar(this);
                if (tabBar == null || !TabFollow.box(this, tabBar).contains(Math.round(event.getX()), Math.round(event.getY()))) {
                    return;
                }
                keepPicture(TabFollow.pages(this));
            } catch (Throwable error) {
                Settings.hookFailedPrivately(TabFollow.KEY, "Can't take a picture of the page", error);
            }
        }

        /** Takes the open tab's picture from [moving], and learns which of Messenger's pages is that tab's. */
        private void keepPicture(List<View> moving) {
            try {
                Object tab = route.current(home);
                if (tab == null || moving.isEmpty()) return;
                View page = TabFollow.openPage(this, moving);
                if (page != null) pagesBuilt.put(page, tab);
                TabFollow.Shot shot = TabFollow.Shot.of(this, moving);
                if (shot == null) return;
                pictures.put(tab, shot);
                TabFollow.keepPictures(this, pictures);
            } catch (Throwable error) {
                // The swipe still works without it: the tab's page or colour comes in beside instead.
                Settings.hookFailedPrivately(TabFollow.KEY, "Can't take a picture of the page", error);
            }
        }

        /** A picture kept for [tab], or null. Tests read it. */
        Picture pictureOf(Object tab) {
            TabFollow.Shot shot = pictures.get(tab);
            return shot == null ? null : shot.picture;
        }

        private void followTo(float moved) {
            try {
                // Switched off mid-swipe: everything goes back, and the swipe ends the plain way.
                if (!TabFollow.on()) {
                    pictures.clear();
                    endFollow(false);
                    return;
                }
                follow.follow(moved, moved < 0 ? tabAfter : tabBefore);
            } catch (Throwable error) {
                Settings.hookFailedPrivately(TabFollow.KEY, "Can't move the page with the finger", error);
                endFollow(false);
            }
        }

        /** The finger came up: the page goes on to the next tab when the swipe committed and there is one, or springs back. */
        private void letGo(boolean commits, int direction) {
            try {
                if (commits) follow.commit(direction, () -> step(direction));
                else follow.back();
            } catch (Throwable error) {
                Settings.hookFailedPrivately(TabFollow.KEY, "Can't move the page with the finger", error);
                endFollow(false);
            }
        }

        /**
         * Ends a page still sliding with every view back in place, and with [changeTab] the tab it was changing to. True
         * when that tab was still changing.
         */
        private boolean endFollow(boolean changeTab) {
            TabFollow.Drag was = follow;
            follow = null;
            if (was == null) return false;
            invalidate();
            try {
                return was.finish(changeTab);
            } catch (Throwable error) {
                Settings.hookFailedPrivately(TabFollow.KEY, "Can't put the page back", error);
                return true;
            }
        }

        /** The page following the finger, or null. Tests read it. */
        TabFollow.Drag following() {
            return follow;
        }

        /** A slide along the bar: the highlight follows the finger, and letting go opens the tab under it. */
        private boolean slide(MotionEvent event) {
            int action = event.getActionMasked();
            try {
                if (action == MotionEvent.ACTION_MOVE) {
                    bar.slideTo(event.getRawX());
                } else if (action == MotionEvent.ACTION_UP) {
                    Object tab = bar.tabs.get(bar.indexAt(event.getRawX()));
                    endSlide();
                    if (route.current(home) != tab) route.select(home, tab);
                } else if (action == MotionEvent.ACTION_CANCEL) {
                    endSlide();
                }
            } catch (Throwable error) {
                Settings.hookFailedPrivately(TabSlide.KEY, "Can't change the tab", error);
                endSlide();
            }
            return true;
        }

        /** The bar under the point on screen, matched to the tabs the home screen has. */
        private TabSlide.Bar barAt(int x, int y) throws Throwable {
            List<?> all = route.tabs(home);
            if (all == null || all.isEmpty()) return null;
            List<Object> every = new ArrayList<Object>(all);
            return TabSlide.barAt(this, x, y, Settings.visibleTabs(new ArrayList<Object>(all)), every);
        }

        private void endSlide() {
            if (bar != null) bar.end();
            bar = null;
            if (sliding) taken = false;
            sliding = false;
        }

        /** The slide's bar while a finger slides along it, or null. Tests read it. */
        TabSlide.Bar sliding() {
            return sliding ? bar : null;
        }

        /** One tab along the bar, or nothing at either end. */
        private void step(int direction) {
            try {
                Object tab = next(direction);
                if (tab != null) route.select(home, tab);
            } catch (Throwable error) {
                Settings.hookFailedPrivately(KEY, "Can't change the tab", error);
            }
        }

        /** The tab one along the bar from the open one, or null at that end. */
        private Object next(int direction) throws Throwable {
            Object open = route.current(home);
            List<?> all = route.tabs(home);
            if (open == null || all == null || all.isEmpty()) return null;
            // The bar leaves out the tabs Hush hides, and a swipe should land where a tap can.
            List<Object> shown = Settings.visibleTabs(new ArrayList<Object>(all));
            int at = at(shown, open);
            if (at < 0) {
                shown = new ArrayList<Object>(all);
                at = at(shown, open);
            }
            int next = at + direction;
            if (at < 0 || next < 0 || next >= shown.size()) return null;
            return shown.get(next);
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
