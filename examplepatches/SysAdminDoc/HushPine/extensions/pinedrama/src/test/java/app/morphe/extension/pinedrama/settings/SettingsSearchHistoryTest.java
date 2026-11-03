package app.morphe.extension.pinedrama.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

import app.morphe.extension.pinedrama.SettingsContextRule;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** #232: what settings search was used for, newest first, ten at most, once each. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class SettingsSearchHistoryTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After public void tearDown() {
        Settings.RECENT_SETTINGS_SEARCHES.resetToDefault();
    }

    @Test public void theNewestSearchComesFirstAndARepeatMovesUp() {
        SettingsSearchHistory.add("speed");
        SettingsSearchHistory.add("  comment ");
        SettingsSearchHistory.add("speed");
        assertEquals(List.of("speed", "comment"), SettingsSearchHistory.recent());
    }

    @Test public void blankSearchesAreNotKept() {
        SettingsSearchHistory.add("");
        SettingsSearchHistory.add("   ");
        SettingsSearchHistory.add(null);
        assertEquals(List.of(), SettingsSearchHistory.recent());
    }

    @Test public void onlyTheLastTenAreKept() {
        List<String> newestFirst = new ArrayList<>();
        for (int i = 0; i < SettingsSearchHistory.MAX_RECENTS + 3; i++) {
            SettingsSearchHistory.add("query " + i);
            newestFirst.add(0, "query " + i);
        }
        assertEquals(newestFirst.subList(0, SettingsSearchHistory.MAX_RECENTS), SettingsSearchHistory.recent());
    }

    @Test public void oneSearchCanBeForgottenOrAllOfThem() {
        SettingsSearchHistory.add("speed");
        SettingsSearchHistory.add("comment");
        SettingsSearchHistory.remove("speed");
        assertEquals(List.of("comment"), SettingsSearchHistory.recent());
        SettingsSearchHistory.remove("never searched");
        assertEquals(List.of("comment"), SettingsSearchHistory.recent());
        SettingsSearchHistory.clear();
        assertEquals(List.of(), SettingsSearchHistory.recent());
    }

    @Test public void anUnreadableHistoryStartsOverInsteadOfFailing() {
        Settings.RECENT_SETTINGS_SEARCHES.save("not json");
        assertEquals(List.of(), SettingsSearchHistory.recent());
        SettingsSearchHistory.add("speed");
        assertEquals(List.of("speed"), SettingsSearchHistory.recent());
    }

    /** What someone searched for is theirs, so it stays off the backup file a backup shares. */
    @Test public void theHistoryStaysOutOfBackups() {
        assertFalse(Settings.RECENT_SETTINGS_SEARCHES.includeWithImportExport);
    }
}
