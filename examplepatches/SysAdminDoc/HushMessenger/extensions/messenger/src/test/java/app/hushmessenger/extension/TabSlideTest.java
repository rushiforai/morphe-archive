package app.hushmessenger.extension;

import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

/**
 * Slide along the tab bar (#194). A finger that goes down on one of the bar's tab buttons and moves sideways drags a
 * highlight along the bar, and letting go opens the tab under it through the call the tab's own button makes.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36}, qualifiers = "w1080dp-h1920dp-mdpi")
public class TabSlideTest {
    private static final String HOME = "Lapp/hushmessenger/extension/TabSwipeTest$Home;";
    private static final String BAR = "Lapp/hushmessenger/extension/TabSwipeTest$Bar;";
    private static final String TAB = "Lapp/hushmessenger/extension/TabSwipeTest$Tab;";
    private static final String ROUTE = HOME + "->current()" + TAB + "|" + HOME + "->bar:" + BAR + "|"
        + BAR + "->tabs:Ljava/util/List;|" + HOME + "->select(" + TAB + ")V";
    private static final int BAR_HEIGHT = 150;

    private ActivityController<Activity> screen;
    private Activity activity;
    private TabSwipe.SwipeFrame frame;
    private LinearLayout bar;
    /** The bar the touches go to, plain or floating. */
    private View row;
    private final List<Integer> clicks = new ArrayList<>();
    private long down;

    @Test public void theFrameGoesOnWithOnlyTheSlideOn() {
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        View stock = new View(activity);
        assertSame("Both off leaves Messenger the hierarchy it built", stock, TabSwipe.wrap(stock, home, ROUTE));

        slideOn();
        View root = new View(activity);
        assertTrue("The slide needs the frame even with Swipe between tabs off",
            TabSwipe.wrap(root, home, ROUTE) instanceof TabSwipe.SwipeFrame);

        // A bundle without Swipe between tabs has no switch for the slide to sit under.
        Set<String> installed = Settings.installed;
        try {
            Settings.installed = Collections.emptySet();
            assertFalse(TabSlide.on());
            View plain = new View(activity);
            assertSame(plain, TabSwipe.wrap(plain, home, ROUTE));
        } finally {
            Settings.installed = installed;
        }

        // Paused Hush leaves the bar alone too.
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertFalse(TabSlide.on());
    }

    @Test public void aSlideFromTheFirstTabToTheThirdOpensTheThirdWhenTheFingerLifts() {
        slideOn();
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        homeScreen(home, 4, Gravity.BOTTOM);

        press(button(0));
        move(middle(0) + 60);
        TabSlide.Bar sliding = frame.sliding();
        assertNotNull("A sideways move from a tab button is a slide", sliding);
        Rect lens = sliding.lens();
        assertNotNull("with the highlight on the bar", lens);
        assertEquals("as wide as a tab", 270, lens.width());
        assertEquals(BAR_HEIGHT, lens.height());
        assertEquals("on the bar's row", barTop(), lens.top);
        assertEquals("centered on the finger", middle(0) + 60 - 135, lens.left);

        move(middle(2));
        assertEquals("following the finger", middle(2) - 135, frame.sliding().lens().left);
        assertNull("Nothing opens while the finger is still down", home.picked);

        lift(middle(2));
        assertSame(TabSwipeTest.Tab.JEWEL, home.picked);
        assertNull("The highlight goes with the finger", frame.sliding());
        assertNull(sliding.lens());
        idle();
        assertEquals("The button the finger went down on isn't tapped too", List.of(), clicks);
        assertTrue(Settings.lastActive(TabSlide.KEY) > 0);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aTapOnTheBarStillLandsOnItsButton() {
        slideOn();
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        homeScreen(home, 4, Gravity.BOTTOM);

        press(button(1));
        lift(middle(1));
        idle();
        assertEquals(List.of(1), clicks);
        assertNull("The tap is the button's own, so Hush opens nothing", home.picked);
        assertNull(frame.sliding());

        // Up and down on a button is a press that wandered, not a slide.
        press(button(2));
        drag(middle(2), barY() - 100);
        assertNull(frame.sliding());
        lift(middle(2));
        assertNull(home.picked);
    }

    @Test public void theHighlightStaysOnTheBarPastEitherEnd() {
        slideOn();
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        homeScreen(home, 4, Gravity.BOTTOM);

        press(button(2));
        move(1070);
        assertEquals("kept at the bar's right end", 1080, frame.sliding().lens().right);
        move(-200);
        assertEquals("and its left end", 0, frame.sliding().lens().left);
        move(1500);
        lift(1500);
        assertSame("Past the end is the last tab", TabSwipeTest.Tab.MORE, home.picked);
    }

    @Test public void slidingBackToTheOpenTabOpensNothing() {
        slideOn();
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        homeScreen(home, 4, Gravity.BOTTOM);

        press(button(0));
        move(middle(2));
        move(middle(0));
        lift(middle(0));
        assertNull("The open tab stays as it is", home.picked);
        assertNull(frame.sliding());
    }

    @Test public void aCancelTakesTheHighlightOffAndOpensNothing() {
        slideOn();
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        homeScreen(home, 4, Gravity.BOTTOM);

        press(button(0));
        move(middle(3));
        TabSlide.Bar sliding = frame.sliding();
        assertNotNull(sliding);
        send(MotionEvent.ACTION_CANCEL, middle(3), barY());
        assertNull(frame.sliding());
        assertNull(sliding.lens());
        assertNull(home.picked);

        // The frame let go of the gesture, so the next slide works.
        press(button(0));
        move(middle(1));
        lift(middle(1));
        assertSame(TabSwipeTest.Tab.PEOPLE, home.picked);
    }

    @Test public void aHiddenTabIsLeftOutTheWayTheBarLeavesItOut() {
        slideOn();
        Settings.preferences.edit().putBoolean("tab_people", true).commit();
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        homeScreen(home, 3, Gravity.BOTTOM);

        press(button(0));
        move(middle(1));
        lift(middle(1));
        assertSame("The bar's second button is the third tab with People hidden", TabSwipeTest.Tab.JEWEL, home.picked);
    }

    @Test public void aRowThatIsntTheTabBarIsLeftAlone() {
        slideOn();
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        // Three buttons for four tabs.
        homeScreen(home, 3, Gravity.BOTTOM);
        press(button(0));
        move(middle(2));
        assertNull(frame.sliding());
        lift(middle(2));
        assertNull(home.picked);

        // Four buttons, but at the top of the screen, like a row of chips.
        screen.close();
        screen = Robolectric.buildActivity(Activity.class).setup();
        activity = screen.get();
        homeScreen(home, 4, Gravity.TOP);
        press(button(0));
        move(middle(2));
        assertNull(frame.sliding());
        lift(middle(2));
        assertNull(home.picked);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void withTheSlideOffADragOnTheBarIsStillASwipe() {
        Settings.preferences.edit().putBoolean(TabSwipe.KEY, true).commit();
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        homeScreen(home, 4, Gravity.BOTTOM);

        // From the fourth button to the third: one tab along, the way a swipe goes.
        press(button(3));
        for (int step = 1; step <= 4; step++) move(middle(3) - 270 * step / 4);
        assertNull(frame.sliding());
        lift(middle(2));
        assertSame(TabSwipeTest.Tab.PEOPLE, home.picked);

        // The same drag with the slide on opens the tab under the finger. The switch is read on the touch.
        slideOn();
        home.open = TabSwipeTest.Tab.INBOX;
        home.picked = null;
        press(button(3));
        for (int step = 1; step <= 4; step++) move(middle(3) - 270 * step / 4);
        lift(middle(2));
        assertSame(TabSwipeTest.Tab.JEWEL, home.picked);

        // And off again stops it at once.
        Settings.preferences.edit().putBoolean(TabSlide.KEY, false).commit();
        home.open = TabSwipeTest.Tab.INBOX;
        home.picked = null;
        press(button(0));
        move(middle(0) + 60);
        assertNull(frame.sliding());
        lift(middle(0) + 60);
        assertNull(home.picked);
    }

    @Test public void messengerRefusingTheTabIsAFailureHushKeepsToItself() {
        slideOn();
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        homeScreen(home, 4, Gravity.BOTTOM, ROUTE.replace("->current()", "->refuses()"));
        press(button(0));
        move(middle(2));
        lift(middle(2));
        assertTrue(Settings.hookErrors.containsKey(TabSlide.KEY));
        assertNull(home.picked);
        assertNull(frame.sliding());
    }

    @Test public void onTheFloatingBarASlideOpensTheTabUnderTheFinger() {
        slideOn();
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        DrawnBar pill = floatingHomeScreen(home, 4, Gravity.BOTTOM);

        press(spot(pill, 0));
        move(spot(pill, 0) + 60);
        TabSlide.Bar sliding = frame.sliding();
        assertNotNull("The floating bar has no tab buttons, and a slide still finds its tabs", sliding);
        Rect lens = sliding.lens();
        assertEquals("as wide as one of its tabs", pill.tabWidth(), lens.width());
        assertEquals("on the bar's row", pill.getTop(), lens.top);
        assertEquals(BAR_HEIGHT, lens.height());
        assertEquals("centered on the finger", spot(pill, 0) + 60 - pill.tabWidth() / 2, lens.left);

        move(1070);
        assertEquals("kept on the bar's last tab, not the edge of the screen",
            pill.getLeft() + pill.tab(3).right, frame.sliding().lens().right);
        move(spot(pill, 2));
        lift(spot(pill, 2));
        assertSame(TabSwipeTest.Tab.JEWEL, home.picked);
        assertNull(frame.sliding());
        idle();
        assertEquals("The bar's own tap doesn't go off as well", List.of(), clicks);
        assertTrue(Settings.hookErrors.isEmpty());

        // A tap on the floating bar is still the bar's own.
        home.picked = null;
        press(spot(pill, 1));
        lift(spot(pill, 1));
        idle();
        assertEquals(List.of(1), clicks);
        assertNull(home.picked);
    }

    @Test public void aDrawnRowThatIsntTheTabBarIsLeftAlone() {
        slideOn();
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        // Three drawn tabs for four.
        DrawnBar pill = floatingHomeScreen(home, 3, Gravity.BOTTOM);
        press(spot(pill, 0));
        move(spot(pill, 2));
        assertNull(frame.sliding());
        lift(spot(pill, 2));
        assertNull(home.picked);

        // Four, but at the top of the screen.
        screen.close();
        screen = Robolectric.buildActivity(Activity.class).setup();
        activity = screen.get();
        pill = floatingHomeScreen(home, 4, Gravity.TOP);
        press(spot(pill, 0));
        move(spot(pill, 2));
        assertNull(frame.sliding());
        lift(spot(pill, 2));
        assertNull(home.picked);

        // Four at the bottom that accessibility numbers some other way, so where each one sits isn't known.
        screen.close();
        screen = Robolectric.buildActivity(Activity.class).setup();
        activity = screen.get();
        pill = floatingHomeScreen(home, 4, Gravity.BOTTOM);
        pill.firstId = 100;
        press(spot(pill, 0));
        move(spot(pill, 2));
        assertNull(frame.sliding());
        lift(spot(pill, 2));
        assertNull(home.picked);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void theSwitchSitsUnderSwipeBetweenTabsAndGoesInTheBackup() {
        assertEquals(TabSwipe.KEY, Settings.SUB_SWITCHES.get(TabSlide.KEY));
        try (var page = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = page.get().getWindow().getDecorView();
            View title = root.findViewWithTag("title_line_" + TabSlide.KEY);
            assertNotNull("Its row is in settings", title);
            View owner = root.findViewWithTag("title_line_" + TabSwipe.KEY);
            assertNotNull(owner);
            ViewGroup meet = (ViewGroup) owner.getParent();
            while (!isAncestor(meet, title)) meet = (ViewGroup) meet.getParent();
            assertEquals("in the block Swipe between tabs heads, beside Page follows your finger", 3, meet.getChildCount());
            View follow = root.findViewWithTag("title_line_" + TabFollow.KEY);
            assertNotNull(follow);
            assertTrue(isAncestor(meet, follow));
            assertEquals(TabSwipe.KEY, Settings.SUB_SWITCHES.get(TabFollow.KEY));
        }
    }

    private static boolean isAncestor(ViewGroup group, View view) {
        for (View at = view; at != null; at = at.getParent() instanceof View ? (View) at.getParent() : null) {
            if (at == group) return true;
        }
        return false;
    }

    private void slideOn() {
        Settings.preferences.edit().putBoolean(TabSlide.KEY, true).commit();
    }

    /** The home screen Messenger builds: the chats, and a bar of [buttons] tab buttons along the [edge]. */
    private void homeScreen(TabSwipeTest.Home home, int buttons, int edge) {
        homeScreen(home, buttons, edge, ROUTE);
    }

    private void homeScreen(TabSwipeTest.Home home, int buttons, int edge, String route) {
        clicks.clear();
        FrameLayout root = new FrameLayout(activity);
        View chats = new View(activity) {
            @Override public boolean onTouchEvent(MotionEvent event) { return true; }
        };
        root.addView(chats, new FrameLayout.LayoutParams(-1, -1));
        bar = new LinearLayout(activity);
        int width = 1080 / buttons;
        for (int i = 0; i < buttons; i++) {
            View button = new View(activity);
            int index = i;
            button.setOnClickListener(view -> clicks.add(index));
            bar.addView(button, new LinearLayout.LayoutParams(width, -1));
        }
        root.addView(bar, new FrameLayout.LayoutParams(-1, BAR_HEIGHT, edge));
        row = bar;
        show(root, home, route);
    }

    /** The home screen with Messenger 588's floating bar: [tabs] tabs drawn in one view, floating along the [edge]. */
    private DrawnBar floatingHomeScreen(TabSwipeTest.Home home, int tabs, int edge) {
        clicks.clear();
        FrameLayout root = new FrameLayout(activity);
        View chats = new View(activity) {
            @Override public boolean onTouchEvent(MotionEvent event) { return true; }
        };
        root.addView(chats, new FrameLayout.LayoutParams(-1, -1));
        DrawnBar pill = new DrawnBar(activity, tabs, clicks);
        FrameLayout.LayoutParams place = new FrameLayout.LayoutParams(1000, BAR_HEIGHT, edge | Gravity.CENTER_HORIZONTAL);
        place.topMargin = place.bottomMargin = 40;
        root.addView(pill, place);
        row = pill;
        show(root, home, ROUTE);
        return pill;
    }

    private void show(FrameLayout root, TabSwipeTest.Home home, String route) {
        root.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        View wrapped = TabSwipe.wrap(root, home, route);
        assertTrue(wrapped instanceof TabSwipe.SwipeFrame);
        frame = (TabSwipe.SwipeFrame) wrapped;
        activity.setContentView(frame);
        idle();
        assertEquals(1080, frame.getWidth());
        assertTrue("a phone-sized home screen", frame.getHeight() > 1500);
    }

    private int barTop() {
        return bar.getTop();
    }

    /** The bar's middle, up and down, on screen. */
    private int barY() {
        int[] at = new int[2];
        row.getLocationOnScreen(at);
        return at[1] + row.getHeight() / 2;
    }

    /** The middle of the floating bar's [index]th tab, across, on screen. */
    private static int spot(DrawnBar pill, int index) {
        int[] at = new int[2];
        pill.getLocationOnScreen(at);
        return at[0] + pill.tab(index).centerX();
    }

    /**
     * Messenger 588's floating bar: one view that draws its tabs and handles their taps itself, so it has no tab
     * buttons, and tells accessibility where each tab is, one virtual node per tab numbered from [firstId].
     */
    private static final class DrawnBar extends FrameLayout {
        private static final int INSET = 10;
        private final int tabs;
        private final List<Integer> taps;
        int firstId;

        DrawnBar(Context context, int tabs, List<Integer> taps) {
            super(context);
            this.tabs = tabs;
            this.taps = taps;
            setClickable(true);
        }

        int tabWidth() {
            return (getWidth() - 2 * INSET) / tabs;
        }

        /** Tab [index] in the bar's own coordinates. */
        Rect tab(int index) {
            return new Rect(INSET + index * tabWidth(), 0, INSET + (index + 1) * tabWidth(), getHeight());
        }

        @Override public boolean onTouchEvent(MotionEvent event) {
            super.onTouchEvent(event);
            if (event.getActionMasked() == MotionEvent.ACTION_UP) taps.add((Math.round(event.getX()) - INSET) / tabWidth());
            return true;
        }

        @SuppressWarnings("deprecation")
        @Override public AccessibilityNodeProvider getAccessibilityNodeProvider() {
            return new AccessibilityNodeProvider() {
                @Override public AccessibilityNodeInfo createAccessibilityNodeInfo(int id) {
                    if (id == View.NO_ID) {
                        AccessibilityNodeInfo host = AccessibilityNodeInfo.obtain(DrawnBar.this);
                        for (int i = 0; i < tabs; i++) host.addChild(DrawnBar.this, firstId + i);
                        return host;
                    }
                    int index = id - firstId;
                    if (index < 0 || index >= tabs) return null;
                    AccessibilityNodeInfo node = AccessibilityNodeInfo.obtain(DrawnBar.this, id);
                    int[] at = new int[2];
                    getLocationOnScreen(at);
                    Rect place = tab(index);
                    place.offset(at[0], at[1]);
                    node.setBoundsInScreen(place);
                    node.setClickable(true);
                    return node;
                }
            };
        }
    }

    /** The middle of the bar's [index]th button, across, on screen. */
    private int middle(int index) {
        int[] at = new int[2];
        bar.getChildAt(index).getLocationOnScreen(at);
        return at[0] + bar.getChildAt(index).getWidth() / 2;
    }

    private int button(int index) {
        return middle(index);
    }

    private void press(int x) {
        down = SystemClock.uptimeMillis();
        send(MotionEvent.ACTION_DOWN, x, barY());
    }

    private void move(int x) {
        send(MotionEvent.ACTION_MOVE, x, barY());
    }

    private void drag(int x, int y) {
        send(MotionEvent.ACTION_MOVE, x, y);
    }

    private void lift(int x) {
        send(MotionEvent.ACTION_UP, x, barY());
    }

    /** Through the window, the way the phone hands a touch to the home screen, at a point on screen. */
    private void send(int action, int x, int y) {
        MotionEvent event = MotionEvent.obtain(down, SystemClock.uptimeMillis(), action, x, y, 0);
        activity.getWindow().getDecorView().dispatchTouchEvent(event);
        event.recycle();
    }

    private static void idle() {
        shadowOf(Looper.getMainLooper()).idle();
    }

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        Settings.tabSwiping = null;
        Settings.bottomTabs.clear();
        screen = Robolectric.buildActivity(Activity.class).setup();
        activity = screen.get();
    }

    @After public void restart() {
        if (screen != null) screen.close();
        Settings.tabSwiping = null;
        Settings.bottomTabs.clear();
    }
}
