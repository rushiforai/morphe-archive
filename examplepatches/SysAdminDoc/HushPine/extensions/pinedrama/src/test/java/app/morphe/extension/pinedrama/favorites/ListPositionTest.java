package app.morphe.extension.pinedrama.favorites;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;

import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.pinedrama.settings.Settings;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/** Issue #2: a list you scrolled keeps its place, and one you didn't still refreshes. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class ListPositionTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final Context context = RuntimeEnvironment.getApplication();

    @After public void resetSwitch() {
        Settings.KEEP_LIST_POSITION.resetToDefault();
    }

    /** A list that answers the two questions PineDrama's real list answers. */
    private static final class FakeList extends View {
        private final boolean up;
        private final boolean down;

        FakeList(Context context, boolean up, boolean down) {
            super(context);
            this.up = up;
            this.down = down;
        }

        @Override public boolean canScrollVertically(int direction) {
            return direction < 0 ? up : down;
        }
    }

    /** Stands in for a ViewPager: the neighboring tabs sit under it. */
    private static final class ViewPager extends FrameLayout {
        ViewPager(Context context) {
            super(context);
        }
    }

    private View scrolledList() {
        return new FakeList(context, true, true);
    }

    private View topList() {
        return new FakeList(context, false, true);
    }

    @Test public void aScrolledListHoldsItsPlaceAndATopListStillRefreshes() {
        Object scrolledGate = new Object();
        assertFalse("the gate must not mark itself dirty",
                ListPosition.track(scrolledGate, scrolledList(), true));
        assertFalse(ListPosition.wantsRefresh(scrolledGate));

        Object topGate = new Object();
        assertFalse(ListPosition.track(topGate, topList(), true));
        assertTrue(ListPosition.wantsRefresh(topGate));
    }

    @Test public void theSwitchOffChangesNothing() {
        Settings.KEEP_LIST_POSITION.save(false);
        Object gate = new Object();
        assertTrue("the original answer must pass through",
                ListPosition.track(gate, scrolledList(), true));
        assertFalse("the gate is not this class's to answer", ListPosition.wantsRefresh(gate));
    }

    @Test public void aGateThatNeverAskedToRefreshIsLeftAlone() {
        Object gate = new Object();
        assertFalse(ListPosition.track(gate, topList(), false));
        assertFalse(ListPosition.wantsRefresh(gate));
    }

    @Test public void aWatchedChildFindsTheListItSitsIn() {
        FrameLayout list = new FrameLayout(context) {
            @Override public boolean canScrollVertically(int direction) {
                return true;
            }
        };
        View row = new View(context);
        list.addView(row);
        assertTrue(ListPosition.scrolled(row));
    }

    @Test public void aWatchedWrapperFindsTheListInsideIt() {
        FrameLayout wrapper = new FrameLayout(context);
        FrameLayout inner = new FrameLayout(context);
        wrapper.addView(new View(context));
        inner.addView(scrolledList());
        wrapper.addView(inner);
        assertTrue(ListPosition.scrolled(wrapper));
    }

    @Test public void aHiddenListCountsForNothing() {
        FrameLayout wrapper = new FrameLayout(context);
        View hidden = scrolledList();
        hidden.setVisibility(View.GONE);
        wrapper.addView(hidden);
        wrapper.addView(topList());
        assertFalse(ListPosition.scrolled(wrapper));
    }

    @Test public void aNeighboringTabsListIsNotThisOne() {
        ViewPager pager = new ViewPager(context);
        FrameLayout mine = new FrameLayout(context);
        View row = new View(context);
        mine.addView(row);
        pager.addView(mine);
        pager.addView(scrolledList());
        assertFalse("the search has to stop at the pager", ListPosition.scrolled(row));
    }

    @Test public void nothingThatScrollsMeansNotScrolled() {
        assertFalse(ListPosition.scrolled(new View(context)));
    }
}
