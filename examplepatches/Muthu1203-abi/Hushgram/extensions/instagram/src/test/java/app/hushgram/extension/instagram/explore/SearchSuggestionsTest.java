/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.explore;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.diagnostics.FeedFilterCounters;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;

/** What Hide suggested accounts in search leaves out of the screen under the search bar: the suggested accounts, nothing else. */
@RunWith(RobolectricTestRunner.class)
public class SearchSuggestionsTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    /** Named like 450's kinds of search screen item. */
    enum Kind { RECENTS, SUGGESTED_USERS, FOLLOW_REQUESTS }

    /** An item of the newer search screen, keeping its kind in an enum field as 450's does. */
    static final class Item {
        final Kind kind;

        Item(Kind kind) {
            this.kind = kind;
        }
    }

    @Before
    public void start() {
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        Settings.HIDE_SEARCH_SUGGESTIONS.resetToDefault();
        HookStatus.clear();
        FeedFilterCounters.snapshotAndClear();
    }

    @After
    public void restore() {
        Settings.HIDE_SEARCH_SUGGESTIONS.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        HookStatus.clear();
        FeedFilterCounters.snapshotAndClear();
    }

    /** The switch starts off, and then the older screen's section stays and the newer screen gets its own list back. */
    @Test
    public void theSwitchStartsOffAndEverythingStays() {
        assertFalse(Settings.HIDE_SEARCH_SUGGESTIONS.get());
        assertFalse(SearchSuggestions.hideSection());
        List<Item> items = Arrays.asList(new Item(Kind.RECENTS), new Item(Kind.SUGGESTED_USERS));
        assertSame(items, SearchSuggestions.items(items));
        assertTrue(HookStatus.missing(FamilyNames.EXPLORE_GRID).toString(), HookStatus.missing(FamilyNames.EXPLORE_GRID).isEmpty());
    }

    /** On, the suggested accounts go, in order, and recent searches and every other kind stay; Instagram's list isn't changed. */
    @Test
    public void onTheSuggestedAccountsAreLeftOut() {
        Settings.HIDE_SEARCH_SUGGESTIONS.save(true);
        Item recent = new Item(Kind.RECENTS);
        Item other = new Item(Kind.FOLLOW_REQUESTS);
        Item later = new Item(Kind.RECENTS);
        List<Item> items = Arrays.asList(recent, new Item(Kind.SUGGESTED_USERS), other, new Item(Kind.SUGGESTED_USERS), later);
        List<Item> before = new ArrayList<>(items);

        List<?> kept = SearchSuggestions.items(items);

        assertEquals(Arrays.asList(recent, other, later), kept);
        assertEquals("Instagram's list", before, items);
        assertTrue(SearchSuggestions.hideSection());
        String report = FeedFilterCounters.report().toString();
        assertTrue(report, report.contains(SearchSuggestions.ROUTE));
        assertTrue(report, report.contains("3 removed"));
        assertTrue(report, report.contains(SearchSuggestions.ITEMS + " 2"));
        assertTrue(report, report.contains(SearchSuggestions.SECTION + " 1"));
        assertTrue(HookStatus.missing(FamilyNames.EXPLORE_GRID).toString(), HookStatus.missing(FamilyNames.EXPLORE_GRID).isEmpty());
    }

    /** On, a list with no suggested accounts, an empty one and null come back as they are. */
    @Test
    public void aListWithoutSuggestionsComesBackAsItIs() {
        Settings.HIDE_SEARCH_SUGGESTIONS.save(true);
        List<Item> recents = Collections.singletonList(new Item(Kind.RECENTS));
        assertSame(recents, SearchSuggestions.items(recents));
        List<Item> empty = Collections.emptyList();
        assertSame(empty, SearchSuggestions.items(empty));
        assertNull(SearchSuggestions.items(null));
    }

    /** Paused, or before the settings are read, the suggestions stay. */
    @Test
    public void pausedAndUnreadyLeaveTheSuggestions() {
        Settings.HIDE_SEARCH_SUGGESTIONS.save(true);
        List<Item> items = Arrays.asList(new Item(Kind.RECENTS), new Item(Kind.SUGGESTED_USERS));

        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertFalse("paused", SearchSuggestions.hideSection());
        assertSame("paused", items, SearchSuggestions.items(items));
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();

        SettingsContextRule.withoutContext(() -> {
            assertFalse("no context", SearchSuggestions.hideSection());
            assertSame("no context", items, SearchSuggestions.items(items));
        });

        assertEquals("back on", 1, SearchSuggestions.items(items).size());
    }

    /** A switch that throws leaves Instagram's answer and is reported. */
    @Test
    public void aThrowingSwitchFailsOpenAndIsReported() {
        List<Item> items = Arrays.asList(new Item(Kind.RECENTS), new Item(Kind.SUGGESTED_USERS));
        assertFalse(SearchSuggestions.hideSection(() -> {
            throw new IllegalStateException("section");
        }));
        assertSame(items, SearchSuggestions.items(items, () -> {
            throw new IllegalStateException("items");
        }));
        String missing = HookStatus.missing(FamilyNames.EXPLORE_GRID).toString();
        assertTrue(missing, missing.contains("'" + SearchSuggestions.SECTION + "'"));
        assertTrue(missing, missing.contains("'" + SearchSuggestions.ITEMS + "'"));
    }
}
