package app.morphe.extension.pinedrama.favorites;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.Context;
import android.os.Looper;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

import androidx.recyclerview.widget.RecyclerView;

import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.pinedrama.settings.Settings;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowDialog;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

/**
 * Issue #11: tapping the tab you're on takes its list back to the top, and a search bar above
 * History and Favorites finds a title anywhere in the list, loading the rest as it looks.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class ListToolsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Activity activity;
    private View dramas;
    private View posts;
    private RecyclerView list;
    private LinearLayout column;

    @Before public void page() {
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        // The History page: a row of tabs, then a pager whose page holds the list.
        column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        LinearLayout tabs = new LinearLayout(activity);
        dramas = tab(true);
        posts = tab(false);
        tabs.addView(dramas, new LinearLayout.LayoutParams(200, 100));
        tabs.addView(posts, new LinearLayout.LayoutParams(200, 100));
        column.addView(tabs, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 100));
        FrameLayout pager = new FrameLayout(activity);
        list = new RecyclerView(activity);
        list.addRows(30, "Drama");
        list.scrollToPosition(12);
        list.scrolledTo = -1;
        pager.addView(list, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 600));
        column.addView(pager, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        activity.setContentView(column, new ViewGroup.LayoutParams(1080, 1900));
        idle();
    }

    @After public void reset() {
        Settings.LIST_TAB_TO_TOP.resetToDefault();
        Settings.LIST_SEARCH.resetToDefault();
    }

    private View tab(boolean selected) {
        View tab = new View(activity);
        tab.setClickable(true);
        tab.setSelected(selected);
        tab.setOnClickListener(view -> {
            dramas.setSelected(view == dramas);
            posts.setSelected(view == posts);
        });
        return tab;
    }

    private static void idle() {
        shadowOf(Looper.getMainLooper()).idle();
    }

    private static void idleFor(long millis) {
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(millis));
    }

    private void tap(View view) {
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        float x = at[0] + view.getWidth() / 2f;
        float y = at[1] + view.getHeight() / 2f;
        long now = SystemClock.uptimeMillis();
        MotionEvent down = MotionEvent.obtain(now, now, MotionEvent.ACTION_DOWN, x, y, 0);
        MotionEvent up = MotionEvent.obtain(now, now + 60, MotionEvent.ACTION_UP, x, y, 0);
        activity.getWindow().getCallback().dispatchTouchEvent(down);
        activity.getWindow().getCallback().dispatchTouchEvent(up);
        down.recycle();
        up.recycle();
        idle();
    }

    @Test public void tappingTheTabYouAreOnTakesItsListToTheTop() {
        ListTools.attach(list);
        idle();
        tap(dramas);
        assertEquals("the list under the tab you're on goes back to its first row", 0, list.scrolledTo);
    }

    @Test public void switchingTabsLeavesTheListAlone() {
        ListTools.attach(list);
        idle();
        tap(posts);
        assertTrue("the tap still switched tabs", posts.isSelected());
        assertEquals("a tab you weren't on only switches", -1, list.scrolledTo);
    }

    @Test public void theSwitchOffLeavesATapAsItWas() {
        Settings.LIST_TAB_TO_TOP.save(false);
        ListTools.attach(list);
        idle();
        tap(dramas);
        assertEquals(-1, list.scrolledTo);
    }

    @Test public void aListAboveTheTabIsNotTheTabsList() {
        // The bottom bar's selected Profile tab sits under the list, so its tap is no reason to move it.
        LinearLayout bottom = new LinearLayout(activity);
        View profile = tab(true);
        bottom.addView(profile, new LinearLayout.LayoutParams(200, 100));
        bottom.addView(tab(false), new LinearLayout.LayoutParams(200, 100));
        column.addView(bottom, 2, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 100));
        ((LinearLayout.LayoutParams) column.getChildAt(1).getLayoutParams()).height = 600;
        column.requestLayout();
        idle();
        ListTools.attach(list);
        idle();
        tap(profile);
        assertEquals(-1, list.scrolledTo);
    }

    @Test public void theSearchBarGoesBetweenTheTabsAndTheList() {
        ListTools.attach(list);
        idle();
        View bar = ListSearch.barIn(column);
        assertNotNull("History gets a search bar", bar);
        assertEquals("right under the row of tabs", 1, column.indexOfChild(bar));
        ListTools.attach(list);
        idle();
        int bars = 0;
        for (int index = 0; index < column.getChildCount(); index++) {
            if (ListSearch.isBar(column.getChildAt(index))) bars++;
        }
        assertEquals("a page built again doesn't get a second one", 1, bars);
        LinearLayout.LayoutParams pager = (LinearLayout.LayoutParams) column.getChildAt(2).getLayoutParams();
        assertEquals("the pager makes room for the bar rather than running off the bottom",
                1f, pager.weight, 0f);
        assertEquals(0, pager.height);
    }

    @Test public void theSearchReadsTheListOnThePageNotThePagerAroundIt() {
        // PineDrama's pager is a list too, with a tab's whole page in each row, and it covers
        // more of the screen than the list on the page it shows. Both get handed over.
        ViewGroup oldPager = (ViewGroup) column.getChildAt(1);
        oldPager.removeView(list);
        column.removeView(oldPager);
        RecyclerView pager = new RecyclerView(activity);
        pager.setOrientation(LinearLayout.HORIZONTAL);
        FrameLayout page = new FrameLayout(activity);
        page.addView(list, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 600));
        pager.addView(page, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        column.addView(pager, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        idle();
        ListTools.attach(pager);
        ListTools.attach(list);
        idle();
        View bar = ListSearch.barIn(column);
        assertNotNull(bar);
        assertSame("the search reads the drama grid, not the pages around it", list, ListSearch.listUnder(bar));
    }

    @Test public void theSearchBarSwitchOffAddsNothing() {
        Settings.LIST_SEARCH.save(false);
        ListTools.attach(list);
        idle();
        assertNull(ListSearch.barIn(column));
    }

    @Test public void aTitleMatchesItsWordsInAnyOrderWithoutAccents() {
        assertTrue(ListSearch.matches("Salah nikah dengan CEO", "ceo salah"));
        assertTrue(ListSearch.matches("Café de l'Amour", "cafe amo"));
        assertTrue("half a word still finds it while typing", ListSearch.matches("The Demon Inside Me", "demo"));
        assertFalse(ListSearch.matches("The Demon Inside Me", "demon king"));
        assertTrue("nothing typed matches nothing", !ListSearch.matches("Anything", "  "));
    }

    @Test public void aRowsTitleIsItsLongestTextAndTheRestIsDetail() {
        ListSearch.Item item = ListSearch.Item.of(7, java.util.Arrays.asList("New", "My Dowry Brought a Secret CEO", "EP 1/60"));
        assertEquals(7, item.position);
        assertEquals("My Dowry Brought a Secret CEO", item.title);
        assertEquals("New · EP 1/60", item.detail);
    }

    @Test public void theSearchLooksThroughTheWholeListAndLoadsTheRest() {
        list.onEnd = () -> list.addRows(40, "Later");
        List<ListSearch.Item> seen = new ArrayList<>();
        ListScan scan = new ListScan(list, () -> {});
        scan.start();
        idleFor(20_000);
        assertTrue("it says when it has seen it all", scan.done());
        seen.addAll(scan.items());
        assertEquals("every row, the page that loaded while it looked included", 70, seen.size());
        assertEquals("Drama 0", seen.get(0).title);
        assertEquals("Later 69", seen.get(69).title);
    }

    @Test public void aGridThatKeepsSayingThereIsMoreStillFinishes() {
        // PineDrama's grid answers that it can scroll down at its very end when the last row
        // isn't full, which left the search page on "so far" for two minutes.
        list.saysMoreAtTheEnd = true;
        ListScan scan = new ListScan(list, () -> {});
        scan.start();
        idleFor(20_000);
        assertTrue("it's done once scrolling stops moving the list", scan.done());
        assertEquals(30, scan.items().size());
    }

    @Test public void aGridThatKeepsSayingThereIsMoreStillLoadsTheRest() {
        list.saysMoreAtTheEnd = true;
        list.onEnd = () -> list.addRows(40, "Later");
        ListScan scan = new ListScan(list, () -> {});
        scan.start();
        idleFor(20_000);
        assertTrue(scan.done());
        assertEquals("the page that loaded at the end is read too", 70, scan.items().size());
    }

    @Test public void openingTheSearchBringsUpTheKeyboard() {
        ListTools.attach(list);
        idle();
        ListSearch.barIn(column).performClick();
        idle();
        InputMethodManager keyboard = (InputMethodManager)
                activity.getSystemService(Context.INPUT_METHOD_SERVICE);
        assertTrue("the box is ready to type in", shadowOf(keyboard).isSoftInputVisible());
        ShadowDialog.getLatestDialog().dismiss();
        idle();
    }

    @Test public void choosingAResultOpensThatRow() {
        ListScan scan = new ListScan(list, () -> {});
        scan.start();
        idleFor(20_000);
        scan.open(23);
        idleFor(1_000);
        assertEquals("the row the result came from is the one opened", java.util.Collections.singletonList(23), list.clicked);
    }

    @Test public void leavingTheSearchPutsTheListBackWhereItWas() {
        ListScan scan = new ListScan(list, () -> {});
        scan.start();
        idleFor(20_000);
        scan.cancel();
        idle();
        assertEquals("the list returns to the row it showed before", 12, list.first);
        assertSame(list, scan.list());
    }
}
