package app.hushmessenger.extension;

import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/**
 * Swipe between tabs. Messenger's home screen has no pager, so the frame around its view watches for a sideways drag
 * and then makes the same call the tab's own button makes, for the tab next to the open one in the bar's order.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class TabSwipeTest {
    /** Messenger's tab enum, by the constant names 587 uses. */
    enum Tab { INBOX, PEOPLE, JEWEL, MORE }

    /** What the home fragment reads the tabs out of. */
    public static final class Bar {
        List<Tab> tabs = new ArrayList<>(Arrays.asList(Tab.values()));
        static List<Tab> shared = new ArrayList<>();
        Object notAList = new Object();
    }

    /** Stands in for the home fragment: the tab on screen, the configuration it came from and the switch. */
    public static final class Home {
        Bar bar = new Bar();
        Tab open = Tab.INBOX;
        Tab picked;

        Tab current() { return open; }
        void select(Tab tab) { picked = tab; open = tab; }
        static Tab staticCurrent() { return Tab.INBOX; }
        Tab refuses() { throw new IllegalStateException("Messenger refused"); }
    }

    private static final String HOME = "Lapp/hushmessenger/extension/TabSwipeTest$Home;";
    private static final String BAR = "Lapp/hushmessenger/extension/TabSwipeTest$Bar;";
    private static final String TAB = "Lapp/hushmessenger/extension/TabSwipeTest$Tab;";
    private static final String ROUTE = HOME + "->current()" + TAB + "|" + HOME + "->bar:" + BAR + "|"
        + BAR + "->tabs:Ljava/util/List;|" + HOME + "->select(" + TAB + ")V";

    @Test public void theRouteReachesTheTabOnScreenTheTabListAndTheSwitch() throws Throwable {
        Home home = new Home();
        TabSwipe.Route route = TabSwipe.Route.of(ROUTE, Home.class);
        assertSame(Tab.INBOX, route.current(home));
        assertEquals(List.of(Tab.values()), route.tabs(home));
        route.select(home, Tab.JEWEL);
        assertSame(Tab.JEWEL, home.picked);
        assertSame("The switch is what moved the tab, not the test", Tab.JEWEL, route.current(home));

        // An empty configuration is a home screen with no tabs to swipe between, not a crash.
        home.bar = null;
        assertNull(route.tabs(home));
    }

    @Test public void aRouteThatDoesntDescribeThisHomeScreenIsRefused() {
        String[] refused = {
            "",
            ROUTE + "|" + HOME + "->select(" + TAB + ")V",
            HOME + "->current()" + TAB,
            // A name the home screen doesn't declare, and one that belongs to another class.
            ROUTE.replace("->current()", "->missing()"),
            ROUTE.replace(HOME + "->bar:", HOME + "->gone:"),
            ROUTE.replace(BAR + "->tabs:", BAR + "->missing:"),
            ROUTE.replace("->select(", "->pick("),
            ROUTE.replace(HOME + "->current()", BAR + "->current()"),
            ROUTE.replace(HOME + "->select(", BAR + "->select("),
            // The right names with the wrong shape.
            ROUTE.replace("->current()" + TAB, "->staticCurrent()" + TAB),
            ROUTE.replace("->current()" + TAB, "->current()" + BAR),
            ROUTE.replace(BAR + "->tabs:Ljava/util/List;", BAR + "->notAList:Ljava/util/List;"),
            ROUTE.replace("->tabs:Ljava/util/List;", "->tabs:Ljava/util/Collection;"),
            ROUTE.replace(BAR + "->tabs:", BAR + "->shared:"),
            ROUTE.replace("->select(" + TAB + ")V", "->select(" + TAB + ")" + TAB),
            // Members that aren't members at all.
            ROUTE.replace(HOME + "->bar:" + BAR, HOME + "bar:" + BAR),
            ROUTE.replace(HOME + "->bar:" + BAR, "->bar:" + BAR),
            ROUTE.replace(HOME + "->bar:" + BAR, HOME + "->:" + BAR),
        };
        for (String route : refused) {
            try {
                TabSwipe.Route.of(route, Home.class);
                fail("accepted " + route);
            } catch (ReflectiveOperationException | RuntimeException refusal) {
                assertNotNull(refusal.getMessage());
            }
        }
    }

    @Test public void theFrameGoesOnOnlyWithTheSwitchOnAndAProvedRoute() {
        Home home = new Home();
        View stock = view();
        assertSame("Off leaves Messenger the hierarchy it built", stock, wrap(stock, home, ROUTE));

        // The home screen holds that answer for the run, so the switch going on reaches it at the next restart.
        on();
        restart();
        View root = view();
        View wrapped = wrap(root, home, ROUTE);
        assertNotSame(root, wrapped);
        assertSame(root, ((ViewGroup) wrapped).getChildAt(0));
        assertEquals("The frame takes the view's place in its parent", 320, wrapped.getLayoutParams().width);
        assertEquals(480, wrapped.getLayoutParams().height);
        assertEquals("And the view fills the frame", ViewGroup.LayoutParams.MATCH_PARENT, root.getLayoutParams().width);
        assertEquals(ViewGroup.LayoutParams.MATCH_PARENT, root.getLayoutParams().height);

        // Nothing to wrap, nothing to wrap it onto, and a view that's already in a hierarchy.
        assertNull(wrap(null, home, ROUTE));
        View loose = view();
        assertSame(loose, wrap(loose, null, ROUTE));
        assertSame(root, wrap(root, home, ROUTE));

        // No proved route, and one the extension can't use.
        for (String route : new String[] {null, ""}) {
            View plain = view();
            assertSame(route, plain, wrap(plain, home, route));
        }
        assertFalse(Settings.hookErrors.containsKey(TabSwipe.KEY));
        View refused = view();
        assertSame(refused, wrap(refused, home, ROUTE.replace("->current()", "->missing()")));
        assertTrue("A route that doesn't fit is a quiet failure", Settings.hookErrors.containsKey(TabSwipe.KEY));
    }

    @Test public void aSidewaysSwipeMovesOneTabAlongTheBar() {
        on();
        Home home = new Home();
        TabSwipe.SwipeFrame frame = frame(home);

        swipe(frame, -300);
        assertSame("Towards the end of the bar", Tab.PEOPLE, home.picked);
        swipe(frame, 300);
        assertSame("And back", Tab.INBOX, home.picked);

        // Nothing past either end of the bar.
        home.picked = null;
        swipe(frame, 300);
        assertNull(home.picked);
        home.open = Tab.MORE;
        swipe(frame, -300);
        assertNull(home.picked);

        // Messenger throwing on the way is a failure Hush records, not a crash on the home screen.
        Home throwing = new Home();
        swipe(frame(throwing, ROUTE.replace("->current()", "->refuses()")), -300);
        assertNull(throwing.picked);
        assertTrue(Settings.hookErrors.containsKey(TabSwipe.KEY));
    }

    @Test public void aHiddenTabIsSkippedTheWayTheBarSkipsIt() {
        Settings.preferences.edit().putBoolean("tab_swipe", true).putBoolean("tab_people", true).commit();
        Home home = new Home();
        swipe(frame(home), -300);
        assertSame(Tab.JEWEL, home.picked);
        assertTrue(Settings.lastActive("tab_people") > 0);
    }

    @Test public void aShortOrUpAndDownDragKeepsTheTab() {
        on();
        Home home = new Home();
        TabSwipe.SwipeFrame frame = frame(home);

        // Over the slop it takes the gesture at, under the distance that commits it.
        swipe(frame, -40);
        assertNull(home.picked);
        // Sideways, but not enough more than up and down to be a sideways swipe.
        drag(frame, -300, 300);
        assertNull(home.picked);
        // Taken, then taken away: a far enough drag that the screen cancels changes nothing.
        frame.dispatchTouchEvent(MotionEvent.obtain(0, 0, MotionEvent.ACTION_DOWN, 900, 500, 0));
        frame.dispatchTouchEvent(MotionEvent.obtain(0, 10, MotionEvent.ACTION_MOVE, 600, 500, 0));
        frame.dispatchTouchEvent(MotionEvent.obtain(0, 20, MotionEvent.ACTION_CANCEL, 600, 500, 0));
        assertNull(home.picked);
        // And the next swipe still works, so the cancel didn't leave the frame holding the gesture.
        swipe(frame, -300);
        assertSame(Tab.PEOPLE, home.picked);
    }

    @Test public void theSwitchStopsTheSwipeAtOnceAndWaitsForARestartToStart() {
        on();
        Home home = new Home();
        TabSwipe.SwipeFrame frame = frame(home);
        Settings.preferences.edit().putBoolean("tab_swipe", false).commit();
        swipe(frame, -300);
        assertNull("Turning it off takes effect on the next touch", home.picked);
        assertNull("And asks for no restart", Settings.heldUntilRestart(TabSwipe.KEY));

        restart();
        assertFalse("A home screen built with it off has no frame", Settings.tabSwipe());
        Settings.preferences.edit().putBoolean("tab_swipe", true).commit();
        assertEquals("So turning it on waits for a restart", Boolean.FALSE, Settings.heldUntilRestart(TabSwipe.KEY));
        assertFalse(Settings.tabSwipe());
        restart();
        assertTrue(Settings.tabSwipe());
        assertNull(Settings.heldUntilRestart(TabSwipe.KEY));
    }

    private void on() {
        Settings.preferences.edit().putBoolean("tab_swipe", true).commit();
    }

    private View view() {
        View root = new View(RuntimeEnvironment.getApplication()) {
            @Override public boolean onTouchEvent(MotionEvent event) { return true; }
        };
        root.setLayoutParams(new ViewGroup.LayoutParams(320, 480));
        return root;
    }

    private static View wrap(View root, Object home, String route) {
        return TabSwipe.wrap(root, home, route);
    }

    private TabSwipe.SwipeFrame frame(Home home) {
        return frame(home, ROUTE);
    }

    /** A laid-out frame around a view that takes touches, the way the chat list does. */
    private TabSwipe.SwipeFrame frame(Home home, String route) {
        View wrapped = wrap(view(), home, route);
        assertTrue("The frame is what the swipe needs", wrapped instanceof TabSwipe.SwipeFrame);
        wrapped.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
            View.MeasureSpec.makeMeasureSpec(1920, View.MeasureSpec.EXACTLY));
        wrapped.layout(0, 0, 1080, 1920);
        assertEquals(1080, wrapped.getWidth());
        return (TabSwipe.SwipeFrame) wrapped;
    }

    private void swipe(TabSwipe.SwipeFrame frame, int sideways) {
        drag(frame, sideways, 0);
    }

    private void drag(TabSwipe.SwipeFrame frame, int sideways, int down) {
        float x = 900, y = 500;
        frame.dispatchTouchEvent(MotionEvent.obtain(0, 0, MotionEvent.ACTION_DOWN, x, y, 0));
        for (int step = 1; step <= 4; step++) {
            frame.dispatchTouchEvent(MotionEvent.obtain(0, step * 10L, MotionEvent.ACTION_MOVE,
                x + sideways * step / 4f, y + down * step / 4f, 0));
        }
        frame.dispatchTouchEvent(MotionEvent.obtain(0, 50, MotionEvent.ACTION_UP, x + sideways, y + down, 0));
    }

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        restart();
    }

    /** What a Messenger restart clears: the answer the home screen's frame held for the run. */
    @After public void restart() {
        Settings.tabSwiping = null;
        Settings.bottomTabs.clear();
    }
}
