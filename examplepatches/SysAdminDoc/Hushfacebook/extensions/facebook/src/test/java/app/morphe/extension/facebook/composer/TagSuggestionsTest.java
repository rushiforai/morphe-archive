/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.composer;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * The hook right after a text box reads its flag for a word without @: it skips the lookup while
 * the switch is on, closes a list of people an earlier @ left open, and every other time gives
 * Facebook back its own answer.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TagSuggestionsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void startClean() {
        FeedFilterCounters.clear();
        HookStatus.clear();
        TagSuggestions.forget();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.TAG_SUGGESTIONS_ONLY_AFTER_AT.resetToDefault();
        BaseSettings.DEBUG.resetToDefault();
        FeedFilterCounters.clear();
        HookStatus.clear();
        TagSuggestions.forget();
    }

    private static String counterLine() {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(TagSuggestions.ROUTE + ":")) return line;
        }
        return null;
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.TAG_SUGGESTIONS + ":")) return line;
        }
        return null;
    }

    private static int occurrences(String text, String part) {
        int count = 0;
        for (int at = text.indexOf(part); at >= 0; at = text.indexOf(part, at + part.length())) count++;
        return count;
    }

    @Test
    public void theSwitchStartsOnAndAWordWithoutAtLooksNobodyUp() {
        assertTrue("the switch doesn't start on", Settings.TAG_SUGGESTIONS_ONLY_AFTER_AT.get());
        assertTrue(TagSuggestions.skipsWordWithoutAt(false, TagSuggestionsForTests.box()));
        assertEquals(TagSuggestions.ROUTE + ": 1 lists, 1 items, 1 removed. Last reason: " + TagSuggestions.SKIPPED
                + ". Removed: " + TagSuggestions.SKIPPED + " 1", counterLine());
        assertEquals(FamilyNames.TAG_SUGGESTIONS + ": invoked 1, 0 found, 0 missing", statusLine());
    }

    /**
     * A list of people from an earlier @ that's still open when you type on is closed through the
     * box's own dismissDropDown, as Facebook closes it after a lookup that finds nobody. A closed
     * list is left alone.
     */
    @Test
    public void aListLeftOpenIsClosedAndAClosedOneIsLeftAlone() {
        TagSuggestionsForTests.Box box = TagSuggestionsForTests.box();
        box.setText("Lunch with Sam");
        box.open = true;
        assertTrue(TagSuggestions.skipsWordWithoutAt(false, box));
        assertEquals(1, box.closes);
        assertFalse(box.open);
        assertTrue(TagSuggestions.skipsWordWithoutAt(false, box));
        assertEquals("a closed list was closed again", 1, box.closes);
        assertEquals("the text changed", "Lunch with Sam", box.getText().toString());
    }

    /** Something that isn't a text box, or no box at all, still skips the lookup. */
    @Test
    public void withoutABoxTheLookupIsStillSkipped() {
        assertTrue(TagSuggestions.skipsWordWithoutAt(false, null));
        assertTrue(TagSuggestions.skipsWordWithoutAt(false, new Object()));
        assertEquals(TagSuggestions.ROUTE + ": 2 lists, 2 items, 2 removed. Last reason: " + TagSuggestions.SKIPPED
                + ". Removed: " + TagSuggestions.SKIPPED + " 2", counterLine());
    }

    /** A box Facebook set to skip words without @ keeps skipping them, switch on or off. */
    @Test
    public void facebooksOwnSkipStands() {
        TagSuggestionsForTests.Box box = TagSuggestionsForTests.box();
        box.open = true;
        assertTrue(TagSuggestions.skipsWordWithoutAt(true, box));
        Settings.TAG_SUGGESTIONS_ONLY_AFTER_AT.save(false);
        assertTrue(TagSuggestions.skipsWordWithoutAt(true, box));
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertTrue(TagSuggestions.skipsWordWithoutAt(true, box));
        assertEquals("Facebook's own skip closed a list", 0, box.closes);
        assertEquals(TagSuggestions.ROUTE + ": 3 lists, 3 items, 0 removed", counterLine());
    }

    @Test
    public void offTheLookupIsFacebooks() {
        TagSuggestionsForTests.Box box = TagSuggestionsForTests.box();
        box.open = true;
        Settings.TAG_SUGGESTIONS_ONLY_AFTER_AT.save(false);
        assertFalse(TagSuggestions.skipsWordWithoutAt(false, box));
        assertEquals("the list was closed with the switch off", 0, box.closes);
        // Counted with the switch off too, so the report shows the box asked.
        assertEquals(TagSuggestions.ROUTE + ": 1 lists, 1 items, 0 removed", counterLine());
        Settings.TAG_SUGGESTIONS_ONLY_AFTER_AT.save(true);
        assertTrue(TagSuggestions.skipsWordWithoutAt(false, box));
        assertEquals(1, box.closes);
    }

    @Test
    public void pausedTheLookupComesBack() {
        TagSuggestionsForTests.Box box = TagSuggestionsForTests.box();
        box.open = true;
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(TagSuggestions.skipsWordWithoutAt(false, box));
        PauseForTests.pause(HushfacebookPause.Reason.CRASH_LOOP);
        assertFalse(TagSuggestions.skipsWordWithoutAt(false, box));
        assertEquals(0, box.closes);
        PauseForTests.resume();
        assertTrue(TagSuggestions.skipsWordWithoutAt(false, box));
        assertEquals(1, box.closes);
    }

    /** Until the settings are ready, the box asks its own question and no list is touched. */
    @Test
    public void untilTheSettingsAreReadyTheLookupIsFacebooks() {
        TagSuggestionsForTests.Box box = TagSuggestionsForTests.box();
        box.open = true;
        boolean[] skipped = {true, true};
        SettingsContextRule.withoutContext(() -> skipped[0] = TagSuggestions.skipsWordWithoutAt(false, box));
        SettingsContextRule.beforeThePauseIsDecided(() -> skipped[1] = TagSuggestions.skipsWordWithoutAt(false, box));
        assertFalse(skipped[0]);
        assertFalse(skipped[1]);
        assertEquals(0, box.closes);
        assertTrue(TagSuggestions.skipsWordWithoutAt(false, box));
    }

    /**
     * A failure while closing the list gives Facebook its own answer back, so the lookup runs as
     * it would without the patch, and the report names the hook.
     */
    @Test
    public void aFailureLeavesTheLookupAndTheReportSaysSo() {
        TagSuggestionsForTests.Box box = TagSuggestionsForTests.box();
        box.failure = new IllegalStateException("the popup failed");
        assertFalse(TagSuggestions.skipsWordWithoutAt(false, box));
        assertTrue("a failure turned Facebook's own skip into a lookup", TagSuggestions.skipsWordWithoutAt(true, box));
        List<String> missing = HookStatus.missing(FamilyNames.TAG_SUGGESTIONS);
        assertEquals(missing.toString(), 1, missing.size());
        assertTrue(missing.get(0), missing.get(0).contains(
                "'tag suggestion' hook (it threw " + IllegalStateException.class.getName() + ")"));
        box.failure = null;
        assertTrue(TagSuggestions.skipsWordWithoutAt(false, box));
    }

    /** Every question is counted under the patch's name. */
    @Test
    public void theHookReportsUnderThePatchsName() {
        TagSuggestions.skipsWordWithoutAt(false, null);
        Settings.TAG_SUGGESTIONS_ONLY_AFTER_AT.save(false);
        TagSuggestions.skipsWordWithoutAt(false, null);
        assertEquals(FamilyNames.TAG_SUGGESTIONS + ": invoked 2, 0 found, 0 missing", statusLine());
        assertEquals("Tag suggestions only after @", FamilyNames.TAG_SUGGESTIONS);
    }

    /**
     * With Debug logging on, each skip has a line for the phone check, up to forty, then one line
     * per fifty. No line holds the text.
     */
    @Test
    public void debugLoggingSaysWhatEachSkipDid() {
        BaseSettings.DEBUG.save(true);
        LogBufferManager.clearLogBuffer();
        TagSuggestionsForTests.Box box = TagSuggestionsForTests.box();
        box.setText("Dinner at Marguerite's");
        box.open = true;
        TagSuggestions.skipsWordWithoutAt(false, box);
        TagSuggestions.skipsWordWithoutAt(false, box);
        String report = LogBufferManager.buildExportText();
        assertEquals(report, 1, occurrences(report,
                "Tag suggestions: skipped the lookup for a word without @ and closed the list of people left open."));
        assertEquals(report, 1, occurrences(report, "Tag suggestions: skipped the lookup for a word without @."));
        assertEquals(report, 0, occurrences(report, "Marguerite"));

        LogBufferManager.clearLogBuffer();
        for (int i = 2; i < TagSuggestions.LOGGED_ONE_BY_ONE + 2 * TagSuggestions.SUMMED_UP_BY; i++) {
            TagSuggestions.skipsWordWithoutAt(false, null);
        }
        report = LogBufferManager.buildExportText();
        assertEquals(report, TagSuggestions.LOGGED_ONE_BY_ONE - 2,
                occurrences(report, "Tag suggestions: skipped the lookup"));
        assertEquals(report, 1, occurrences(report, "Tag suggestions: 50 lookups for words without @ skipped so far."));
        assertEquals(report, 1, occurrences(report, "Tag suggestions: 100 lookups for words without @ skipped so far."));
    }
}
