/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import com.ss.android.ugc.aweme.feed.model.Aweme;
import com.ss.android.ugc.aweme.feed.model.AwemeStatistics;
import com.ss.android.ugc.aweme.feed.model.PhotoModeImageInfo;
import com.ss.android.ugc.aweme.feed.model.PhotoModeTextInfo;

import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.settings.preference.categories.InterfacePreferenceCategory;

import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowDialog;
import org.robolectric.util.ReflectionHelpers;
import org.robolectric.util.ReflectionHelpers.ClassParameter;

/**
 * Sorting the videos a profile or Liked grid has loaded (#180): every order, pinned videos kept
 * in front, videos with no value last, ties and missing values in TikTok's order, new pages
 * sorted in without repeats, TikTok's own list left alone, a sorted grid loading its next pages
 * by itself up to the cap, and the chip that changes the order in place.
 */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class GridSortTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    public static final class Counts extends AwemeStatistics {
        final long plays;
        final long likes;
        Counts(long plays, long likes) { this.plays = plays; this.likes = likes; }
        @Override public long getPlayCount() { return plays; }
        @Override public long getDiggCount() { return likes; }
    }

    public static final class Clip {
        final long duration;
        Clip(long duration) { this.duration = duration; }
        public Object getDuration() { return duration; }
    }

    /** A grid cell's post: id, posted time, length in ms, views, likes and whether it is pinned. */
    public static final class Post extends Aweme {
        final String id;
        final long created;
        final Clip clip;
        final Counts counts;
        final int top;

        Post(String id, long created, long length, long views, long likes, boolean pinned) {
            this.id = id;
            this.created = created;
            this.clip = new Clip(length);
            this.counts = new Counts(views, likes);
            this.top = pinned ? 1 : 0;
        }

        public Object getVideo() { return clip; }
        public int getIsTop() { return top; }
        @Override public String getAid() { return id; }
        @Override public long getCreateTime() { return created; }
        @Override public AwemeStatistics getStatistics() { return counts; }
        @Override public List getImageInfos() { return null; }
        @Override public PhotoModeImageInfo getPhotoModeImageInfo() { return null; }
        @Override public PhotoModeTextInfo getPhotoModeTextInfo() { return null; }
        @Override public String toString() { return id; }
    }

    /** The adapter, as far as the extension knows it: something with notifyDataSetChanged. */
    public static final class Adapter {
        int refreshes;
        public void notifyDataSetChanged() { refreshes++; }
    }

    private boolean gridSortEnabled;

    @Before public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        gridSortEnabled = SettingsStatus.gridSortEnabled;
    }

    @After public void tearDown() {
        setPaused(false);
        Settings.PROFILE_GRID_SORT.resetToDefault();
        SettingsStatus.gridSortEnabled = gridSortEnabled;
        SettingsStatus.alwaysShowPublishDateEnabled = false;
        HookStatus.clear();
        GridSort.resetForTests();
    }

    private static void setPaused(boolean value) {
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess",
                ClassParameter.from(boolean.class, value));
    }

    /** a is pinned; b has no length or counts; c and d tie on every number; e is the biggest. */
    private static List<Aweme> grid() {
        return new ArrayList<>(Arrays.asList(
                new Post("a", 100, 30_000, 10, 1, true),
                new Post("b", 0, 0, 0, 0, false),
                new Post("c", 300, 20_000, 500, 50, false),
                new Post("d", 300, 20_000, 500, 50, false),
                new Post("e", 900, 90_000, 9_000, 800, false),
                new Post("f", 200, 5_000, 70, 90, false),
                new Post("p", 50, 1_000, 5, 5, true)));
    }

    private static String ids(List<?> list) {
        StringBuilder out = new StringBuilder();
        for (Object item : list) out.append(item);
        return out.toString();
    }

    private static String order(String choice, List<Aweme> grid) {
        Settings.PROFILE_GRID_SORT.save(choice);
        return ids(GridSort.data(null,grid));
    }

    @Test public void theSortStartsOffAndLeavesTheListAlone() {
        assertEquals("profile_grid_sort", Settings.PROFILE_GRID_SORT.key);
        assertEquals("off", Settings.PROFILE_GRID_SORT.defaultValue);
        List<Aweme> grid = grid();
        assertSame("off, TikTok's own list", grid, GridSort.data(null,grid));
        Settings.PROFILE_GRID_SORT.save("off");
        assertSame(grid, GridSort.data(null,grid));
    }

    @Test public void newestAndOldest() {
        // Pinned a and p stay first as TikTok has them, then the rest by time, 0 (no time) last.
        assertEquals("apecdfb", order("newest", grid()));
        assertEquals("apfcdeb", order("oldest", grid()));
    }

    @Test public void longestAndShortest() {
        assertEquals("apecdfb", order("longest", grid()));
        assertEquals("apfcdeb", order("shortest", grid()));
    }

    @Test public void mostViewedAndMostLiked() {
        assertEquals("apecdfb", order("most_viewed", grid()));
        assertEquals("apefcdb", order("most_liked", grid()));
    }

    @Test public void leastViewedAndLeastLikedPutTheQuietVideosFirstAndUncountedOnesLast() {
        // Views: f 70, c and d 500, e 9000. b has no counts at all, so it goes last, not first.
        assertEquals("apfcdeb", order("least_viewed", grid()));
        // Likes: c and d 50 (TikTok's order between them), f 90, e 800, b last again.
        assertEquals("apcdfeb", order("least_liked", grid()));
    }

    @Test public void everyOrderHasALabelAndAComparator() {
        assertEquals(GridSort.ORDERS.length, GridSort.LABELS.length);
        assertEquals("off", GridSort.ORDERS[0]);
        assertEquals("Original order", GridSort.LABELS[0]);
        for (int i = 1; i < GridSort.ORDERS.length; i++) {
            assertTrue(GridSort.ORDERS[i], GridSort.comparator(GridSort.ORDERS[i]) != null);
            assertEquals(i, GridSort.indexOf(GridSort.ORDERS[i]));
        }
        assertEquals(-1, GridSort.indexOf("sideways"));
    }

    @Test public void theNextPageIsWantedOnlyForARealOrderOnScreenUnderTheCapWhilePagesAddVideos() {
        assertTrue(GridSort.wantsNextPage("newest", 0, 30, true));
        assertTrue(GridSort.wantsNextPage("least_liked", 30, 60, true));
        assertTrue("one under the cap", GridSort.wantsNextPage("oldest", 270, 299, true));

        assertFalse("Original order is TikTok's own loading", GridSort.wantsNextPage("off", 0, 30, true));
        assertFalse("a choice this build doesn't know", GridSort.wantsNextPage("sideways", 0, 30, true));
        assertFalse(GridSort.wantsNextPage(null, 0, 30, true));
        assertFalse("a grid off screen doesn't load", GridSort.wantsNextPage("newest", 0, 30, false));
        assertFalse("the cap", GridSort.wantsNextPage("newest", 270, GridSort.LOAD_CAP, true));
        assertFalse("past the cap", GridSort.wantsNextPage("newest", 300, 330, true));
        assertFalse("a page that added nothing ends the chain", GridSort.wantsNextPage("newest", 60, 60, true));
        assertFalse("a list that shrank", GridSort.wantsNextPage("newest", 60, 40, true));
        assertFalse("an empty grid", GridSort.wantsNextPage("newest", 0, 0, true));
        assertEquals(300, GridSort.LOAD_CAP);
    }

    /** The grid's own load more listener, as the adapter's footer calls it. */
    public static final class Listener {
        int calls;
        public void loadMore() { calls++; }
    }

    /** TikTok's grid adapter, with the members the base adapter class names in the clear. */
    public static final class GridAdapter {
        public List<?> mmItems;
        public View mmRecyclerView;
        final Listener listener = new Listener();
        int refreshes;
        public Listener getLoadMoreListener() { return listener; }
        public void notifyDataSetChanged() { refreshes++; }
    }

    private static List<Aweme> posts(int count) {
        List<Aweme> out = new ArrayList<>();
        for (int i = 0; i < count; i++) out.add(new Post("v" + i, 1_000 + i, 1_000, 1 + i, 1 + i, false));
        return out;
    }

    private static void idle(long millis) {
        Shadows.shadowOf(android.os.Looper.getMainLooper()).idleFor(Duration.ofMillis(millis));
    }

    /** A grid on screen in its own FrameLayout, as TikTok's profile page holds it. */
    private static GridAdapter gridOnScreen(Activity activity) {
        FrameLayout frame = new FrameLayout(activity);
        View grid = new View(activity);
        frame.addView(grid, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        activity.setContentView(frame);
        idle(50);
        GridAdapter adapter = new GridAdapter();
        adapter.mmRecyclerView = grid;
        return adapter;
    }

    private static TextView chip(GridAdapter adapter) {
        FrameLayout frame = (FrameLayout) adapter.mmRecyclerView.getParent();
        for (int i = 0; i < frame.getChildCount(); i++) {
            View child = frame.getChildAt(i);
            if (GridSort.CHIP_TAG.equals(child.getTag())) return (TextView) child;
        }
        return null;
    }

    @Test public void aSortedGridOnScreenLoadsItsNextPagesUntilAPageAddsNothing() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            GridAdapter adapter = gridOnScreen(controller.get());
            Settings.PROFILE_GRID_SORT.save("newest");

            List<Aweme> model = posts(30);
            adapter.mmItems = GridSort.data(adapter, model);
            idle(0);
            assertEquals("not before the pause", 0, adapter.listener.calls);
            // A little past the pause: Robolectric's frame callbacks move its clock on by a frame.
            idle(GridSort.NEXT_PAGE_DELAY_MS + 100);
            assertEquals("the first page asks for the second", 1, adapter.listener.calls);

            model.addAll(posts(30));
            adapter.mmItems = GridSort.page(adapter, model);
            idle(GridSort.NEXT_PAGE_DELAY_MS + 100);
            assertEquals("a page that added videos asks for the next", 2, adapter.listener.calls);

            adapter.mmItems = GridSort.page(adapter, model);
            idle(GridSort.NEXT_PAGE_DELAY_MS + 100);
            assertEquals("a page that added nothing stops", 2, adapter.listener.calls);
            idle(5_000);
            assertEquals(2, adapter.listener.calls);
        }
    }

    @Test public void oneAskAtATimeAndNoneOffScreenOrAtTheCapOrInOriginalOrder() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            GridAdapter adapter = gridOnScreen(controller.get());
            Settings.PROFILE_GRID_SORT.save("most_viewed");
            List<Aweme> model = posts(30);
            GridSort.data(adapter, model);
            GridSort.data(adapter, model);
            idle(GridSort.NEXT_PAGE_DELAY_MS * 2);
            assertEquals("two lists before the answer still ask once", 1, adapter.listener.calls);

            GridAdapter full = gridOnScreen(controller.get());
            GridSort.data(full, posts(GridSort.LOAD_CAP));
            idle(GridSort.NEXT_PAGE_DELAY_MS * 2);
            assertEquals("the cap", 0, full.listener.calls);

            GridAdapter hidden = gridOnScreen(controller.get());
            hidden.mmRecyclerView.setVisibility(View.GONE);
            GridSort.data(hidden, posts(30));
            idle(GridSort.NEXT_PAGE_DELAY_MS * 2);
            assertEquals("off screen", 0, hidden.listener.calls);

            GridAdapter stock = gridOnScreen(controller.get());
            Settings.PROFILE_GRID_SORT.save("off");
            GridSort.data(stock, posts(30));
            idle(GridSort.NEXT_PAGE_DELAY_MS * 2);
            assertEquals("Original order", 0, stock.listener.calls);
            assertNull("no chip on a stock grid", chip(stock));

            GridAdapter switched = gridOnScreen(controller.get());
            Settings.PROFILE_GRID_SORT.save("newest");
            GridSort.data(switched, posts(30));
            idle(0);
            Settings.PROFILE_GRID_SORT.save("off");
            idle(GridSort.NEXT_PAGE_DELAY_MS);
            assertEquals("switched off while the ask waited", 0, switched.listener.calls);
        }
    }

    @Test public void theChipNamesTheOrderAndChangesItInPlace() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            GridAdapter adapter = gridOnScreen(controller.get());
            Settings.PROFILE_GRID_SORT.save("newest");
            List<Aweme> model = grid();
            String tikToks = ids(model);
            adapter.mmItems = GridSort.data(adapter, model);
            idle(0);
            assertEquals("apecdfb", ids(adapter.mmItems));
            TextView chip = chip(adapter);
            assertNotNull("a chip over the grid", chip);
            assertEquals("Newest first", String.valueOf(chip.getText()));
            FrameLayout.LayoutParams layout = (FrameLayout.LayoutParams) chip.getLayoutParams();
            assertEquals(Gravity.TOP | Gravity.END, layout.gravity);

            chip.performClick();
            idle(0);
            AlertDialog dialog = (AlertDialog) ShadowDialog.getLatestDialog();
            assertNotNull("the chip opens the choices", dialog);
            assertTrue(dialog.isShowing());
            assertEquals(GridSort.ORDERS.length, dialog.getListView().getCount());
            assertEquals("Least liked first", String.valueOf(dialog.getListView().getItemAtPosition(8)));
            Shadows.shadowOf(dialog).clickOnItem(GridSort.indexOf("least_liked"));
            idle(0);

            assertEquals("least_liked", Settings.PROFILE_GRID_SORT.get());
            assertEquals("the grid re-sorted from TikTok's list", "apcdfeb", ids(adapter.mmItems));
            assertEquals("TikTok's list keeps its order", tikToks, ids(model));
            assertTrue(adapter.refreshes >= 1);
            assertEquals("Least liked first", String.valueOf(chip(adapter).getText()));
            assertSame("one chip, updated", chip, chip(adapter));

            GridSort.apply(adapter, "off");
            idle(0);
            assertSame("Original order hands the grid TikTok's own list", model, adapter.mmItems);
            assertNull("and takes the chip away", chip(adapter));
        }
    }

    @Test public void aGridInAnythingButAFrameLayoutGetsNoChipButStillSorts() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            android.widget.LinearLayout column = new android.widget.LinearLayout(activity);
            View grid = new View(activity);
            column.addView(grid, new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            activity.setContentView(column);
            idle(50);
            GridAdapter adapter = new GridAdapter();
            adapter.mmRecyclerView = grid;
            Settings.PROFILE_GRID_SORT.save("newest");
            adapter.mmItems = GridSort.data(adapter, grid());
            idle(0);
            assertEquals("apecdfb", ids(adapter.mmItems));
            assertEquals(1, column.getChildCount());
        }
    }

    @Test public void tiesAndMissingValuesKeepTikToksOrder() {
        List<Aweme> grid = new ArrayList<>(Arrays.asList(
                new Post("x", 0, 0, 0, 0, false),
                new Post("y", 5, 5_000, 5, 5, false),
                new Post("z", 0, 0, 0, 0, false),
                new Post("w", 5, 5_000, 5, 5, false)));
        assertEquals("ywxz", order("newest", grid));
        assertEquals("ywxz", order("longest", grid));
        assertEquals("ywxz", order("most_viewed", grid));
        // The same call twice gives the same grid.
        assertEquals(ids(GridSort.data(null,grid)), ids(GridSort.data(null,grid)));
    }

    @Test public void theListTikTokOwnsIsNeverChangedAndNothingIsLostOrRepeated() {
        List<Aweme> grid = grid();
        String before = ids(grid);
        Settings.PROFILE_GRID_SORT.save("newest");
        List<?> sorted = GridSort.data(null,grid);
        assertNotSame(grid, sorted);
        assertEquals("TikTok's list keeps its order", before, ids(grid));
        assertEquals(grid.size(), sorted.size());
        for (Aweme post : grid) assertTrue("same post objects", sorted.contains(post));
    }

    @Test public void aNewPageIsSortedInWithTheRestWithoutRepeats() {
        List<Aweme> model = new ArrayList<>(Arrays.asList(
                new Post("a", 10, 1_000, 1, 1, false),
                new Post("b", 30, 1_000, 1, 1, false)));
        Settings.PROFILE_GRID_SORT.save("newest");
        assertEquals("ba", ids(GridSort.data(null,model)));
        // TikTok appends the next page to its own list and hands the whole list over again.
        model.add(new Post("c", 20, 1_000, 1, 1, false));
        model.add(new Post("d", 40, 1_000, 1, 1, false));
        Adapter adapter = new Adapter();
        List<?> kept = GridSort.page(adapter, model);
        assertEquals("dbca", ids(kept));
        assertEquals("a refresh is queued behind TikTok's own call", 0, adapter.refreshes);
        Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        assertEquals(1, adapter.refreshes);
    }

    @Test public void aPageThatMovesNothingIsNotRefreshedAndOffLeavesTikToksAnnouncement() {
        List<Aweme> model = new ArrayList<>(Arrays.asList(
                new Post("b", 30, 1_000, 1, 1, false),
                new Post("a", 10, 1_000, 1, 1, false)));
        Settings.PROFILE_GRID_SORT.save("newest");
        Adapter adapter = new Adapter();
        GridSort.page(adapter, model);
        Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        assertEquals("already in order, nothing moved", 0, adapter.refreshes);

        Settings.PROFILE_GRID_SORT.save("off");
        Adapter quiet = new Adapter();
        assertSame(model, GridSort.page(quiet, model));
        Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        assertEquals("off, TikTok's own announcement stands", 0, quiet.refreshes);
    }

    @Test public void pausedHushfeedAndUnknownChoicesLeaveTikToksOrder() {
        List<Aweme> grid = grid();
        Settings.PROFILE_GRID_SORT.save("newest");
        setPaused(true);
        assertSame("paused", grid, GridSort.data(null,grid));
        setPaused(false);
        assertNotSame(grid, GridSort.data(null,grid));

        Settings.PROFILE_GRID_SORT.save("sideways");
        assertSame("a choice this build doesn't know", grid, GridSort.data(null,grid));
        assertSame(null, GridSort.data(null,null));
        List<Aweme> one = new ArrayList<>(List.of(new Post("a", 1, 1, 1, 1, false)));
        Settings.PROFILE_GRID_SORT.save("newest");
        assertSame("one video has no order", one, GridSort.data(null,one));
    }

    @Test public void thingsThatAreNotPostsStayWhereTheyAre() {
        List<Object> mixed = new ArrayList<>(Arrays.asList("note", new Post("a", 5, 1, 1, 1, false), 7,
                new Post("b", 9, 1, 1, 1, false)));
        Settings.PROFILE_GRID_SORT.save("newest");
        assertEquals("banote7", ids(GridSort.data(null,mixed)));
    }

    public static final class TestActivity extends PreferenceActivity {
        @Override public void onCreate(android.os.Bundle state) {
            setTheme(android.R.style.Theme_Material_NoActionBar);
            super.onCreate(state);
        }
    }

    @Test public void theRowSaysLoadedVideosAndShowsOnlyWhereTheAdapterWasHooked() {
        try (var controller = Robolectric.buildActivity(TestActivity.class).setup()) {
            var activity = controller.get();
            Utils.setContext(activity);
            SettingsStatus.alwaysShowPublishDateEnabled = true;

            SettingsStatus.gridSortEnabled = false;
            assertEquals(null, build(activity).findPreference(Settings.PROFILE_GRID_SORT.key));

            SettingsStatus.gridSortEnabled = true;
            Preference row = build(activity).findPreference(Settings.PROFILE_GRID_SORT.key);
            assertTrue(row instanceof ListPreference);
            assertEquals("Sort loaded videos on profile grids", String.valueOf(row.getTitle()));
            ListPreference list = (ListPreference) row;
            assertEquals("Original order", String.valueOf(list.getEntries()[0]));
            assertEquals("off", String.valueOf(list.getEntryValues()[0]));
            assertEquals(9, list.getEntryValues().length);
            for (int i = 0; i < GridSort.ORDERS.length; i++) {
                assertEquals("the row and the grid's chip list the same orders",
                        GridSort.ORDERS[i], String.valueOf(list.getEntryValues()[i]));
                assertEquals(GridSort.LABELS[i], String.valueOf(list.getEntries()[i]));
            }
            String summary = String.valueOf(row.getSummary());
            assertTrue(summary, summary.contains("pinned") && summary.contains("up to 300 videos")
                    && summary.contains("top corner"));
        }
    }

    private static PreferenceScreen build(PreferenceActivity activity) {
        PreferenceScreen screen = activity.getPreferenceManager().createPreferenceScreen(activity);
        new InterfacePreferenceCategory(activity, screen);
        return screen;
    }
}
