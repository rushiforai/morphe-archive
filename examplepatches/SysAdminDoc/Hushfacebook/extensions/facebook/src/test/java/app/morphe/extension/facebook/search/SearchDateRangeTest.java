/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.search;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Search date range (#279): with its switch on, the Posted date filter answers the date range
 * kind, the bottom sheet flag answers off for that same tap, and the filter sheet's own tap
 * callback is skipped for it. Every other filter, and every
 * answer with the switch off, paused, or before the settings are ready, is Facebook's own.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SearchDateRangeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stands in for Facebook's filter kind enum. */
    public enum Kind {
        MULTI_CHOICE, TOGGLE, DATE_RANGE_PICKER
    }

    /** Stands in for a filter: public, with the getName its interface keeps. */
    public static final class Filter {
        private final String name;

        public Filter(String name) {
            this.name = name;
        }

        public String getName() {
            return name;
        }
    }

    private static final Filter POSTED = new Filter(SearchDateRange.FILTER);

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.SEARCH_DATE_RANGE.resetToDefault();
        HookStatus.clear();
        // Leave no remapped tap behind for another class.
        SearchDateRange.bottomSheet(true);
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.SEARCH_DATE_RANGE + ":")) return line;
        }
        return null;
    }

    @Test
    public void onThePostedDateFilterOpensAsARangeAndTheSheetFlagGoesOff() {
        Settings.SEARCH_DATE_RANGE.save(true);
        assertSame(Kind.DATE_RANGE_PICKER, SearchDateRange.kind(POSTED, Kind.MULTI_CHOICE));
        assertFalse("the bottom sheet stayed on for the remapped tap", SearchDateRange.bottomSheet(true));
        assertTrue("the flag stayed off for the next tap", SearchDateRange.bottomSheet(true));
        assertEquals(FamilyNames.SEARCH_DATE_RANGE + ": invoked 1, 2 found, 0 missing. Counted: "
                + SearchDateRange.OPENED + " 1", statusLine());
    }

    @Test
    public void onAnotherFilterKeepsItsKindAndTheFlag() {
        Settings.SEARCH_DATE_RANGE.save(true);
        Filter other = new Filter("rp_author");
        assertSame(Kind.MULTI_CHOICE, SearchDateRange.kind(other, Kind.MULTI_CHOICE));
        assertTrue(SearchDateRange.bottomSheet(true));
        assertFalse(SearchDateRange.bottomSheet(false));
    }

    @Test
    public void anObjectWithNoNameKeepsItsKind() {
        Settings.SEARCH_DATE_RANGE.save(true);
        assertSame(Kind.TOGGLE, SearchDateRange.kind(new Object(), Kind.TOGGLE));
        assertSame(Kind.TOGGLE, SearchDateRange.kind(null, Kind.TOGGLE));
    }

    @Test
    public void aDateRangeKindIsLeftAlone() {
        Settings.SEARCH_DATE_RANGE.save(true);
        assertSame(Kind.DATE_RANGE_PICKER, SearchDateRange.kind(POSTED, Kind.DATE_RANGE_PICKER));
        assertTrue("the flag changed for a filter that was already a range", SearchDateRange.bottomSheet(true));
    }

    @Test
    public void offFacebooksOwnAnswersComeBack() {
        assertSame(Kind.MULTI_CHOICE, SearchDateRange.kind(POSTED, Kind.MULTI_CHOICE));
        assertTrue(SearchDateRange.bottomSheet(true));
    }

    @Test
    public void pausedFacebooksOwnAnswersComeBack() {
        Settings.SEARCH_DATE_RANGE.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertSame(Kind.MULTI_CHOICE, SearchDateRange.kind(POSTED, Kind.MULTI_CHOICE));
        assertTrue(SearchDateRange.bottomSheet(true));
    }

    @Test
    public void beforeTheSettingsAreReadyFacebooksOwnAnswersComeBack() {
        Settings.SEARCH_DATE_RANGE.save(true);
        SettingsContextRule.withoutContext(() -> {
            assertSame(Kind.MULTI_CHOICE, SearchDateRange.kind(POSTED, Kind.MULTI_CHOICE));
            assertTrue(SearchDateRange.bottomSheet(true));
        });
    }

    @Test
    public void inTheFilterSheetThePostedDateFilterSkipsTheSheetsOwnCallback() {
        Settings.SEARCH_DATE_RANGE.save(true);
        Object callback = new Object();
        assertNull("the date filter stayed in the sheet", SearchDateRange.callback(POSTED, Kind.MULTI_CHOICE, callback));
        assertSame(callback, SearchDateRange.callback(new Filter("rp_author"), Kind.MULTI_CHOICE, callback));
        assertSame(callback, SearchDateRange.callback(POSTED, Kind.DATE_RANGE_PICKER, callback));
        assertNull("a tap with no callback gained one", SearchDateRange.callback(POSTED, Kind.MULTI_CHOICE, null));
    }

    @Test
    public void offOrPausedTheSheetKeepsItsCallback() {
        Object callback = new Object();
        assertSame(callback, SearchDateRange.callback(POSTED, Kind.MULTI_CHOICE, callback));
        Settings.SEARCH_DATE_RANGE.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertSame(callback, SearchDateRange.callback(POSTED, Kind.MULTI_CHOICE, callback));
    }

    @Test
    public void aKindThatIsNotAnEnumComesBack() {
        Settings.SEARCH_DATE_RANGE.save(true);
        Object notAnEnum = "kind";
        assertSame(notAnEnum, SearchDateRange.kind(POSTED, notAnEnum));
    }
}
