/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.feedfilter;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.settings.Settings;

import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * The Ask Tako surfaces on the search results page: the pill at the head of the tab strip, a view
 * of its own found by the real id name its text keeps and hidden with its column, and the served
 * tab list the strip is built from, filtered at its two reads for a build that serves the tab as
 * data. The tab keys met go into the export as a marker and, with logging on, a line.
 *
 * <p>The export names a family with the count of what its hooks bound, never the markers'
 * names: for the list, the read, the keys met and the tab's fate make three, a strip without the
 * tab two, a read the strip refuses one found and one missing; for the pill, one each way.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class TakoSearchTabTest {
    /** A served tab info: the extension reads its key by the getter TikTok's model has. */
    public static final class Tab {
        private final String tabKey;
        public Tab(String tabKey) { this.tabKey = tabKey; }
        public String getTabKey() { return tabKey; }
        @Override public String toString() { return tabKey; }
    }

    /** A served tab info with its name too, for a build that keys the tab by something else. */
    public static final class NamedTab {
        private final String tabKey;
        private final String tabName;
        public NamedTab(String tabKey, String tabName) { this.tabKey = tabKey; this.tabName = tabName; }
        public String getTabKey() { return tabKey; }
        public String getTabName() { return tabName; }
    }

    @Before public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        HookStatus.clear();
        Settings.HIDE_TAKO_AI.save(false);
    }

    @After public void tearDown() {
        Settings.HIDE_TAKO_AI.resetToDefault();
        HookStatus.clear();
    }

    private static List tabs(String... keys) {
        List list = new ArrayList();
        for (String key : keys) list.add(new Tab(key));
        return list;
    }

    private static List keys(List tabs) {
        List keys = new ArrayList();
        for (Object tab : tabs) keys.add(((Tab) tab).getTabKey());
        return keys;
    }

    private static String report() {
        return String.join("\n", HookStatus.report());
    }

    private static Context context() {
        return RuntimeEnvironment.getApplication();
    }

    // The served list.

    @Test public void theAskTakoTabIsDroppedAndTheOthersKeepTheirOrder() {
        Settings.HIDE_TAKO_AI.save(true);
        List served = tabs("tako", "general", "video", "user");
        List shown = TakoAiFilter.filterSearchTabs(served);
        assertNotSame("a new list, the served one untouched", served, shown);
        assertEquals(Arrays.asList("general", "video", "user"), keys(shown));
        assertEquals("the served list is as it came", 4, served.size());
        // The read, the keys met and the tab hidden.
        assertTrue(report(), report().contains("tako AI: 3 found, 0 missing"));
    }

    @Test public void withTheSwitchOffTheStripGoesThroughAsServed() {
        List served = tabs("tako", "general", "video");
        assertSame(served, TakoAiFilter.filterSearchTabs(served));
        // The read, the keys met and the tab left.
        assertTrue(report(), report().contains("tako AI: 3 found, 0 missing"));
    }

    @Test public void aStripWithoutTheTabIsHandedBackAsItself() {
        Settings.HIDE_TAKO_AI.save(true);
        List served = tabs("general", "video", "user");
        assertSame(served, TakoAiFilter.filterSearchTabs(served));
        assertNull(TakoAiFilter.filterSearchTabs(null));
        List none = new ArrayList();
        assertSame(none, TakoAiFilter.filterSearchTabs(none));
        // The read and the keys met; nothing to hide or leave.
        assertTrue(report(), report().contains("tako AI: 2 found, 0 missing"));
    }

    @Test public void theKeysMetAreOneMarkerPerSetHoweverOftenTheStripIsRead() {
        Settings.HIDE_TAKO_AI.save(true);
        TakoAiFilter.filterSearchTabs(tabs("tako", "general"));
        TakoAiFilter.filterSearchTabs(tabs("tako", "general"));
        assertTrue(report(), report().contains("tako AI: 3 found, 0 missing"));
        TakoAiFilter.filterSearchTabs(tabs("general", "video"));
        // A new set of keys is one more marker; a repeat of one already met is not.
        assertTrue(report(), report().contains("tako AI: 4 found, 0 missing"));
    }

    @Test public void theKeyIsMatchedWhateverItsCaseOrSpacingAndTheNameCountsToo() {
        Settings.HIDE_TAKO_AI.save(true);
        assertEquals(Arrays.asList("general"), keys(TakoAiFilter.filterSearchTabs(tabs(" Tako ", "general"))));
        assertEquals(Arrays.asList("general"), keys(TakoAiFilter.filterSearchTabs(tabs("general", "ASK_TAKO"))));
        assertTrue(TakoAiFilter.isTakoTab(new Tab("tako_tab")));
        assertFalse(TakoAiFilter.isTakoTab(new Tab("general")));
        assertFalse(TakoAiFilter.isTakoTab(new Object()));
        // A build that keys the tab by something else still names it.
        assertTrue(TakoAiFilter.isTakoTab(new NamedTab("smart_search", "Ask Tako")));
        assertFalse(TakoAiFilter.isTakoTab(new NamedTab("general", "Top")));
    }

    @Test public void aFailingStripReadNeverReachesTheViewModel() {
        Settings.HIDE_TAKO_AI.save(true);
        // Not empty, so the read gets past the guard, and refusing its first touch inside the try.
        // An empty ArrayList that throws from size() never gets there: isEmpty() reads the field,
        // and the guard hands the list back before the catch is reached.
        List hostile = new AbstractList() {
            @Override public int size() { return 1; }
            @Override public Object get(int index) { throw new IllegalStateException("host list refused"); }
            @Override public Iterator iterator() { throw new IllegalStateException("host list refused"); }
            // A failed assertion prints its operands, and the collection's own toString iterates.
            @Override public String toString() { return "the hostile strip"; }
        };
        assertSame("the view model got its own list back", hostile, TakoAiFilter.filterSearchTabs(hostile));
        // The read found, the hook's throw the one thing missing, and the export names it.
        assertTrue(report(), report().contains("tako AI: 1 found, 1 missing"));
        assertTrue(report(), report().contains("'search tabs' hook (it threw java.lang.IllegalStateException)"));
    }

    // The pill.

    @Test public void thePillsColumnGoesGoneAndTheTabRowStays() {
        Settings.HIDE_TAKO_AI.save(true);
        // The strip as 47.0.3 inflates it: the text in a pill (with a GONE icon), in a frame, in a
        // column beside the tab row.
        FrameLayout root = new FrameLayout(context());
        FrameLayout row = new FrameLayout(context());
        LinearLayout column = new LinearLayout(context());
        FrameLayout frame = new FrameLayout(context());
        LinearLayout pill = new LinearLayout(context());
        View icon = new View(context());
        icon.setVisibility(View.GONE);
        TextView text = new TextView(context());
        text.setText("Ask Tako");
        View tabs = new View(context());
        pill.addView(icon);
        pill.addView(text);
        frame.addView(pill);
        column.addView(frame);
        row.addView(column);
        row.addView(tabs);
        root.addView(row);
        TakoAiFilter.hideSearchTabEntrance(root, text);
        assertEquals("the column beside the tab row", View.GONE, column.getVisibility());
        assertEquals("the row that holds the tabs", View.VISIBLE, row.getVisibility());
        assertEquals("the tabs", View.VISIBLE, tabs.getVisibility());
        assertTrue(report(), report().contains("tako AI: 1 found, 0 missing"));
    }

    @Test public void theClimbStopsShortOfTheRootAndAtItsCap() {
        FrameLayout root = new FrameLayout(context());
        LinearLayout pill = new LinearLayout(context());
        TextView text = new TextView(context());
        pill.addView(text);
        root.addView(pill);
        root.addView(new View(context()));
        // The pill right under the root: the pill goes, the root and its other child stay.
        assertSame(pill, TakoAiFilter.searchTabEntranceColumn(root, text));

        FrameLayout deep = new FrameLayout(context());
        FrameLayout level = deep;
        for (int i = 0; i < 8; i++) {
            FrameLayout next = new FrameLayout(context());
            level.addView(next);
            level = next;
        }
        TextView deepText = new TextView(context());
        level.addView(deepText);
        View stopped = TakoAiFilter.searchTabEntranceColumn(deep, deepText);
        assertNotSame("never the root", deep, stopped);
        int climbed = 0;
        for (View view = deepText; view != stopped; view = (View) view.getParent()) climbed++;
        assertEquals("more wrappers than the climb allows: it stops at its cap", 4, climbed);
    }

    @Test public void aStripInflatedWithoutThePillIsLeftAlone() {
        Settings.HIDE_TAKO_AI.save(true);
        FrameLayout root = new FrameLayout(context());
        TakoAiFilter.hideSearchTabEntrance(root, null);
        assertEquals(View.VISIBLE, root.getVisibility());
        // Absent, and nothing missing.
        assertTrue(report(), report().contains("tako AI: 1 found, 0 missing"));
    }

    @Test public void withTheSwitchOffThePillIsLeftAndNothingIsLookedUp() {
        FrameLayout root = new FrameLayout(context());
        TakoAiFilter.hideSearchTabEntrance(root);
        // Left, and no miss for the id this test app does not have: the lookup never ran.
        assertTrue(report(), report().contains("tako AI: 1 found, 0 missing"));
    }

    @Test public void aBuildWithoutTheIdNameIsNamedInTheExport() {
        Settings.HIDE_TAKO_AI.save(true);
        FrameLayout root = new FrameLayout(context());
        TakoAiFilter.hideSearchTabEntrance(root);
        assertTrue(report(), report().contains(
                "tako AI: 0 found, 1 missing. First missing: view id 'tv_tab_tako_entrance'"));
    }
}
