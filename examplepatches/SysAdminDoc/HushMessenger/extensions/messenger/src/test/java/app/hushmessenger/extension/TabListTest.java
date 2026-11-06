package app.hushmessenger.extension;

import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
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
 * The bottom bar marks the open tab by its place in Messenger's full tab list, so the list loses the tabs a Hush switch
 * hides. With People hidden, opening Notifications lit up Menu before this.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class TabListTest {
    /** Messenger's tab enum, by the constant names 584 uses. */
    enum Tab { INBOX, PEOPLE, AI, JEWEL, SEARCH, MORE }

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        restart();
    }

    /** What a Messenger restart clears: the answers each tab held for the run. */
    @After public void restart() {
        Settings.metaAiTab = null;
        Settings.bottomTabs.clear();
    }

    private static List<Tab> bar() { return new ArrayList<>(Arrays.asList(Tab.values())); }

    @Test public void withNothingHiddenMessengerKeepsItsOwnList() {
        List<Tab> tabs = bar();
        assertSame(tabs, Settings.visibleTabs(tabs));
        assertTrue("A tab the bar keeps isn't a use", Settings.activeAt.isEmpty());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void eachSwitchTakesOnlyItsOwnTabAndTheRestKeepTheirOrder() {
        Settings.preferences.edit().putBoolean("tab_people", true).commit();
        assertEquals(List.of(Tab.INBOX, Tab.AI, Tab.JEWEL, Tab.SEARCH, Tab.MORE), Settings.visibleTabs(bar()));
        assertTrue(Settings.lastActive("tab_people") > 0);

        restart();
        Settings.preferences.edit().putBoolean("tab_people", false).putBoolean("tab_notifications", true).putBoolean("meta_ai", true).commit();
        assertEquals(List.of(Tab.INBOX, Tab.PEOPLE, Tab.SEARCH, Tab.MORE), Settings.visibleTabs(bar()));
        assertTrue(Settings.lastActive("tab_notifications") > 0);
        assertTrue(Settings.lastActive("meta_ai") > 0);
    }

    @Test public void theListHoldsTheSameAnswerAsTheTabItselfUntilARestart() {
        Settings.preferences.edit().putBoolean("tab_people", true).commit();
        assertTrue(Settings.hidePeopleTab());
        Settings.preferences.edit().putBoolean("tab_people", false).commit();
        assertFalse("The tab stays hidden until a restart, so the list leaves it out too", Settings.visibleTabs(bar()).contains(Tab.PEOPLE));
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertFalse(Settings.visibleTabs(bar()).contains(Tab.PEOPLE));

        restart();
        assertTrue("Pause brings the tab back after the restart", Settings.visibleTabs(bar()).contains(Tab.PEOPLE));

        restart();
        Settings.preferences.edit().putBoolean("paused", false).putBoolean("meta_ai", true).commit();
        assertTrue(Settings.hideMetaAiTab());
        Settings.preferences.edit().putBoolean("meta_ai", false).commit();
        assertFalse("The Meta AI tab keeps its own answer for the run too", Settings.visibleTabs(bar()).contains(Tab.AI));

        restart();
        assertTrue(Settings.visibleTabs(bar()).contains(Tab.AI));
        Settings.preferences.edit().putBoolean("paused", false).putBoolean("tab_people", true).commit();
        Settings.installed = Collections.emptySet();
        restart();
        assertEquals("Without the patch nothing is hidden", bar(), Settings.visibleTabs(bar()));
    }

    /** The bar on accounts where Messenger puts MUSE, its AI agent tab, in Meta AI's place. */
    enum MuseBar { INBOX, PEOPLE, MUSE, JEWEL, SEARCH, MORE }

    private static List<MuseBar> museBar() { return new ArrayList<>(Arrays.asList(MuseBar.values())); }

    @Test public void hideMetaAiTakesTheMuseVersionOfTheTabToo() {
        List<MuseBar> stock = museBar();
        assertSame("Off leaves the MUSE tab where Messenger put it", stock, Settings.visibleTabs(stock));

        restart();
        Settings.preferences.edit().putBoolean("meta_ai", true).commit();
        assertEquals(List.of(MuseBar.INBOX, MuseBar.PEOPLE, MuseBar.JEWEL, MuseBar.SEARCH, MuseBar.MORE), Settings.visibleTabs(museBar()));
        assertTrue(Settings.lastActive("meta_ai") > 0);

        restart();
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertEquals("Pause keeps it after the restart", museBar(), Settings.visibleTabs(museBar()));
    }

    /** The bar on accounts where the server leaves People out (#136): Chats, Meta AI, Notifications, Search, Menu. */
    private static List<Tab> withoutPeople() { return new ArrayList<>(List.of(Tab.INBOX, Tab.AI, Tab.JEWEL, Tab.SEARCH, Tab.MORE)); }

    @Test public void showPeopleTabPutsPeopleRightAfterChatsWhenMessengerLeftItOut() {
        List<Tab> stock = withoutPeople();
        assertSame("Off leaves Messenger's bar alone", stock, Settings.visibleTabs(stock));
        assertNull(Settings.hookErrors.get(Settings.SHOW_PEOPLE_TAB));

        restart();
        Settings.preferences.edit().putBoolean(Settings.SHOW_PEOPLE_TAB, true).commit();
        assertEquals(List.of(Tab.INBOX, Tab.PEOPLE, Tab.AI, Tab.JEWEL, Tab.SEARCH, Tab.MORE), Settings.visibleTabs(withoutPeople()));
        assertTrue(Settings.lastActive(Settings.SHOW_PEOPLE_TAB) > 0);
        assertTrue(Settings.hookErrors.isEmpty());

        Settings.activeAt.clear();
        List<Tab> full = bar();
        assertSame("A bar that already has People keeps its own list", full, Settings.visibleTabs(full));
        assertNull("Nothing was added, so it isn't a use", Settings.activeAt.get(Settings.SHOW_PEOPLE_TAB));

        assertEquals("Other switches still take their tabs", List.of(Tab.INBOX, Tab.PEOPLE, Tab.SEARCH, Tab.MORE),
            visibleWith(withoutPeople(), "tab_notifications", "meta_ai"));
    }

    private List<Tab> visibleWith(List<Tab> tabs, String... keys) {
        restart();
        var edit = Settings.preferences.edit();
        for (String key : keys) edit.putBoolean(key, true);
        edit.commit();
        return Settings.visibleTabs(tabs);
    }

    @Test public void hidePeopleTabWinsOverShowPeopleTab() {
        Settings.preferences.edit().putBoolean(Settings.SHOW_PEOPLE_TAB, true).putBoolean("tab_people", true).commit();
        List<Tab> stock = withoutPeople();
        assertSame(stock, Settings.visibleTabs(stock));
        assertNull(Settings.activeAt.get(Settings.SHOW_PEOPLE_TAB));
        assertNull("Hide had no People tab to take either", Settings.activeAt.get("tab_people"));
        assertEquals(List.of(Tab.INBOX, Tab.AI, Tab.JEWEL, Tab.SEARCH, Tab.MORE), Settings.visibleTabs(bar()));
    }

    @Test public void showPeopleTabHoldsItsAnswerUntilARestart() {
        Settings.preferences.edit().putBoolean(Settings.SHOW_PEOPLE_TAB, true).commit();
        assertTrue(Settings.visibleTabs(withoutPeople()).contains(Tab.PEOPLE));
        Settings.preferences.edit().putBoolean(Settings.SHOW_PEOPLE_TAB, false).commit();
        assertTrue("The bar keeps the tab it counted first", Settings.visibleTabs(withoutPeople()).contains(Tab.PEOPLE));
        assertEquals(Boolean.TRUE, Settings.heldUntilRestart(Settings.SHOW_PEOPLE_TAB));

        restart();
        assertFalse(Settings.visibleTabs(withoutPeople()).contains(Tab.PEOPLE));
        Settings.preferences.edit().putBoolean(Settings.SHOW_PEOPLE_TAB, true).putBoolean("paused", true).commit();
        restart();
        assertFalse("Pause takes it away after the restart", Settings.visibleTabs(withoutPeople()).contains(Tab.PEOPLE));
    }

    /** Messenger's tab enum if a build drops its People constant. */
    enum NoPeopleBar { INBOX, AI, MORE }

    @Test public void withNoPeopleTabToAddTheBarStaysAsBuiltAndTheRowSaysSo() {
        Settings.preferences.edit().putBoolean(Settings.SHOW_PEOPLE_TAB, true).commit();
        List<NoPeopleBar> noConstant = new ArrayList<>(Arrays.asList(NoPeopleBar.values()));
        assertSame(noConstant, Settings.visibleTabs(noConstant));
        assertNotNull(Settings.hookErrors.get(Settings.SHOW_PEOPLE_TAB));
        assertNull(Settings.activeAt.get(Settings.SHOW_PEOPLE_TAB));

        Settings.hookErrors.clear();
        List<Tab> noChats = new ArrayList<>(List.of(Tab.AI, Tab.JEWEL, Tab.MORE));
        assertSame("No Chats tab to stand next to", noChats, Settings.visibleTabs(noChats));
        assertEquals(List.of(Tab.AI, Tab.JEWEL, Tab.MORE), noChats);
        assertNotNull(Settings.hookErrors.get(Settings.SHOW_PEOPLE_TAB));
    }

    @Test public void somethingThatIsntATabConstantStays() {
        Settings.preferences.edit().putBoolean("tab_people", true).commit();
        List<Object> odd = new ArrayList<>(Arrays.asList("PEOPLE", null, Tab.PEOPLE));
        assertEquals(Arrays.asList("PEOPLE", null), Settings.visibleTabs(odd));
    }

    /** A list that breaks on its first tab, before any tab could say whose switch it is. */
    private static List<Tab> broken() {
        return new AbstractList<Tab>() {
            @Override public Tab get(int index) { throw new IllegalStateException("moved"); }
            @Override public int size() { return 4; }
        };
    }

    @Test public void aFailureHandsBackMessengersListAndGoesOnTheSwitchesThatAreOn() {
        Settings.preferences.edit().putBoolean("meta_ai", true).commit();
        List<Tab> tabs = broken();
        assertSame(tabs, Settings.visibleTabs(tabs));
        assertEquals("Only Meta AI is on, so only its row says so", Collections.singleton("meta_ai"), Settings.hookErrors.keySet());

        Settings.hookErrors.clear();
        Settings.preferences.edit().putBoolean("meta_ai", false).putBoolean("tab_people", true).putBoolean("tab_notifications", true).commit();
        Settings.visibleTabs(broken());
        assertEquals(new HashSet<>(List.of("tab_people", "tab_notifications")), Settings.hookErrors.keySet());

        Settings.hookErrors.clear();
        Settings.preferences.edit().clear().putBoolean(Settings.SHOW_PEOPLE_TAB, true).commit();
        Settings.visibleTabs(broken());
        assertEquals(Collections.singleton(Settings.SHOW_PEOPLE_TAB), Settings.hookErrors.keySet());

        Settings.hookErrors.clear();
        Settings.preferences.edit().clear().commit();
        assertNotNull(Settings.visibleTabs(broken()));
        assertTrue("With every switch off no row takes the blame", Settings.hookErrors.isEmpty());
    }
}
