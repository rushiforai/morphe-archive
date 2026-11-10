package dev.utaa.linimal.extension.features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.Arrays;
import java.util.List;

/** 隠すタブの page を、画面外で作らないための hook の判定を検証します。 */
public final class MainTabPageHooksTest {
    private enum Tab {
        HOME,
        TIMELINE,
        NEWS,
        WALLET,
        MINI
    }

    private static final List<Tab> TABS = Arrays.asList(Tab.HOME, Tab.TIMELINE, Tab.NEWS, Tab.WALLET, Tab.MINI);

    private static MainTabHooks.HiddenTabs hidden(boolean news, boolean wallet, boolean shopping, boolean mini) {
        return new MainTabHooks.HiddenTabs(news, wallet, shopping, mini);
    }

    @Test
    public void timelinePageIsAlwaysReplacedAndOthersAreKept() {
        MainTabHooks.HiddenTabs allOff = hidden(false, false, false, false);

        assertTrue(MainTabHooks.hidesPageForState(TABS, 1, allOff));
        assertFalse(MainTabHooks.hidesPageForState(TABS, 0, allOff));
        assertFalse(MainTabHooks.hidesPageForState(TABS, 2, allOff));
        assertFalse(MainTabHooks.hidesPageForState(TABS, 3, allOff));
    }

    @Test
    public void eachSettingReplacesOnlyItsOwnPage() {
        assertTrue(MainTabHooks.hidesPageForState(TABS, 2, hidden(true, false, false, false)));
        assertFalse(MainTabHooks.hidesPageForState(TABS, 3, hidden(true, false, false, false)));
        assertTrue(MainTabHooks.hidesPageForState(TABS, 3, hidden(false, true, false, false)));
        assertTrue(MainTabHooks.hidesPageForState(TABS, 4, hidden(false, false, false, true)));
        assertFalse(MainTabHooks.hidesPageForState(TABS, 4, hidden(true, true, true, false)));
    }

    @Test
    public void unexpectedArgumentsKeepTheOfficialPage() {
        MainTabHooks.HiddenTabs all = hidden(true, true, true, true);

        assertFalse(MainTabHooks.hidesPageForState(null, 1, all));
        assertFalse(MainTabHooks.hidesPageForState(TABS, -1, all));
        assertFalse(MainTabHooks.hidesPageForState(TABS, TABS.size(), all));
        assertFalse(MainTabHooks.hidesPageForState(Arrays.asList("TIMELINE", null), 0, all));
        assertFalse(MainTabHooks.hidesPageForState(Arrays.asList(Tab.HOME, null), 1, all));
    }

    @Test
    public void unavailableConfigStillReplacesOnlyTheTimelinePage() {
        assertTrue(MainTabHooks.hidesPage(TABS, 1));
        assertFalse(MainTabHooks.hidesPage(TABS, 2));
        assertFalse(MainTabHooks.hidesPage(TABS, 3));
        assertFalse(MainTabHooks.hidesPage(null, 0));
        assertFalse(MainTabHooks.hidesPage(TABS, 99));
    }

    @Test
    public void shownPagesKeepTheOfficialIdAndHiddenPagesGetADistinctOne() {
        MainTabHooks.HiddenTabs wallet = hidden(false, true, false, false);

        for (Tab tab : Tab.values()) {
            int official = tab.ordinal();
            int id = MainTabHooks.pageItemOrdinalForState(tab, wallet);
            if (tab == Tab.TIMELINE || tab == Tab.WALLET) {
                assertEquals(official + MainTabHooks.HIDDEN_PAGE_ID_OFFSET, id);
            } else {
                assertEquals(official, id);
            }
        }
    }

    @Test
    public void hiddenPageIdNeverCollidesWithAnyOfficialId() {
        MainTabHooks.HiddenTabs all = hidden(true, true, true, true);
        for (Tab tab : Tab.values()) {
            if (tab == Tab.HOME) {
                continue;
            }
            int hiddenId = MainTabHooks.pageItemOrdinalForState(tab, all);
            for (Tab other : Tab.values()) {
                assertNotEquals(other.ordinal(), hiddenId);
            }
        }
    }

    @Test
    public void pageItemOrdinalFallsBackToTheOfficialIdWithoutConfig() {
        assertEquals(Tab.TIMELINE.ordinal() + MainTabHooks.HIDDEN_PAGE_ID_OFFSET,
                MainTabHooks.pageItemOrdinal(Tab.TIMELINE));
        assertEquals(Tab.NEWS.ordinal(), MainTabHooks.pageItemOrdinal(Tab.NEWS));
    }
}
