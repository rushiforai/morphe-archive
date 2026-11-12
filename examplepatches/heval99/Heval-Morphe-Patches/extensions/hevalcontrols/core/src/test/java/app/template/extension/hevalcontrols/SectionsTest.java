package app.template.extension.hevalcontrols;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/** The Patch settings section rules and the "shows as on" state behind the row marker. */
public class SectionsTest {
    /** sw (switch, on), off.sw (switch, off), list (list), fixed (patch time), needs (needs sw). */
    private static final String REGISTRY = "hevalcontrols-registry:1\n"
            + "sw\tSwitch\t\tA\t1\t0\t0\t\n"
            + "off.sw\tOff switch\t\tA\t0\t0\t0\t\n"
            + "list\tList\t\tA\t0\t0\t0\t\tlist\n"
            + "fixed\tFixed\t\tA\t0\t0\t1\t\n"
            + "needs\tNeeds\t\tA\t1\t0\t0\tsw\n";

    private FakeStore store;

    @Before
    public void setUp() {
        HevalSettings.resetForTests();
        Registry.install(REGISTRY);
        store = new FakeStore();
        HevalSettings.synchronousOptionsFlush = true;
    }

    @After
    public void tearDown() {
        HevalSettings.resetForTests();
        Registry.install(null);
    }

    private static Feature feature(String id) {
        return Registry.get().feature(id);
    }

    @Test
    public void spoilerCategoriesGoFirst() {
        assertTrue(Sections.isFirst("Spoiler-free"));
        assertTrue(Sections.isFirst("Scores and spoilers"));
        assertTrue(Sections.isFirst("SPOILERS"));
        assertFalse(Sections.isFirst("Match page"));
        assertFalse(Sections.isFirst(""));
        assertFalse(Sections.isFirst(null));
    }

    @Test
    public void sectionsStartCollapsedOnlyWhenNothingIsOn() {
        assertTrue(Sections.startsCollapsed(true, 0));
        assertFalse(Sections.startsCollapsed(true, 1));
        // Small apps (no search field) keep every section open.
        assertFalse(Sections.startsCollapsed(false, 0));
        assertFalse(Sections.startsCollapsed(false, 3));
    }

    @Test
    public void headerCounts() {
        assertEquals("2 of 9 on", Sections.onCount(2, 9));
        assertEquals("0 of 1 on", Sections.onCount(0, 1));
        assertEquals("9 settings, 2 on", Sections.spokenCount(2, 9));
        assertEquals("1 setting, none on", Sections.spokenCount(0, 1));
    }

    @Test
    public void showsOnFollowsTheChoiceNotPauseOrDependencies() {
        // Before the engine starts: the defaults.
        assertTrue(HevalSettings.showsOn(feature("sw")));
        assertFalse(HevalSettings.showsOn(feature("off.sw")));
        assertTrue(HevalSettings.showsOn(feature("fixed")));
        assertFalse(HevalSettings.showsOn(null));

        HevalSettings.initForTests(store);
        assertTrue(HevalSettings.showsOn(feature("sw")));
        assertFalse(HevalSettings.showsOn(feature("off.sw")));
        assertFalse(HevalSettings.showsOn(feature("list")));
        // A patch-time change is always in effect.
        assertTrue(HevalSettings.showsOn(feature("fixed")));

        assertTrue(HevalSettings.setEnabled("off.sw", true));
        assertTrue(HevalSettings.showsOn(feature("off.sw")));
        assertTrue(HevalSettings.setHidden("list", java.util.Collections.singleton("ES")));
        assertTrue(HevalSettings.showsOn(feature("list")));

        // The marker shows the user's choice: pause and a switched-off dependency leave it on.
        assertTrue(HevalSettings.setPaused(true));
        assertTrue(HevalSettings.showsOn(feature("sw")));
        assertTrue(HevalSettings.setPaused(false));
        assertTrue(HevalSettings.setEnabled("sw", false));
        assertFalse(HevalSettings.showsOn(feature("sw")));
        assertTrue(HevalSettings.showsOn(feature("needs")));
        assertFalse(HevalSettings.isEnabled("needs"));
    }
}
