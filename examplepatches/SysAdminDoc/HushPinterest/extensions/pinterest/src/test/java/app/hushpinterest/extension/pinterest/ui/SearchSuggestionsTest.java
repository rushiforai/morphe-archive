/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.json.JSONObject;
import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/**
 * #48: the row under the search bar on search results. Each module's JSON goes past the hook before
 * Pinterest reads it, and with the switch on the colored suggested searches are skipped while the
 * filter button and every other module go through.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SearchSuggestionsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** A colored chip as the row sends it: a query to search and a color to show it in. */
    static final String SUGGESTION = "{\"id\":\"1\",\"action\":{\"search_query\":\"cozy bedroom ideas\"},"
            + "\"display\":{\"display_text\":\"cozy bedroom ideas\",\"background_color_hex\":\"#E8DCCB\"}}";
    /** The filter button: no query of its own and no color. */
    static final String FILTER = "{\"id\":\"2\",\"action\":{\"filters\":[]},\"display\":{\"display_text\":\"\"}}";

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_SEARCH_SUGGESTIONS.resetToDefault();
        HookStatus.clear();
    }

    private static String line() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.HIDE_SEARCH_HISTORY + ":")) return line;
        }
        return "";
    }

    @Test public void offToStartEveryModuleGoesThrough() {
        assertFalse(Settings.HIDE_SEARCH_SUGGESTIONS.get());
        assertFalse(SearchSuggestions.drop(SUGGESTION));
        assertFalse(SearchSuggestions.drop(FILTER));
        assertFalse(line(), line().contains("suggested search hidden"));
    }

    @Test public void onTheColoredSuggestionsAreSkippedAndCounted() throws Exception {
        Settings.HIDE_SEARCH_SUGGESTIONS.save(true);
        assertTrue(SearchSuggestions.drop(SUGGESTION));
        // Pinterest hands the hook its own JSON object, which prints as the JSON it holds.
        assertTrue(SearchSuggestions.drop(new JSONObject(SUGGESTION)));
        assertTrue(line(), line().contains("suggested search hidden"));
    }

    @Test public void onTheFilterButtonAndOtherModulesStay() {
        Settings.HIDE_SEARCH_SUGGESTIONS.save(true);
        assertFalse(SearchSuggestions.drop(FILTER));
        // A query with no color, or a color with no query, isn't a suggested search.
        assertFalse(SearchSuggestions.drop("{\"action\":{\"search_query\":\"x\"},\"display\":{\"display_text\":\"x\"}}"));
        assertFalse(SearchSuggestions.drop("{\"action\":{},\"display\":{\"background_color_hex\":\"#111111\"}}"));
        assertFalse(SearchSuggestions.drop("{}"));
    }

    @Test public void anythingThatIsntJsonGoesThroughUntouched() {
        Settings.HIDE_SEARCH_SUGGESTIONS.save(true);
        assertFalse(SearchSuggestions.drop(null));
        assertFalse(SearchSuggestions.drop("not json"));
        assertFalse(SearchSuggestions.drop(new Object()));
    }

    @Test public void pausedEveryModuleGoesThrough() {
        Settings.HIDE_SEARCH_SUGGESTIONS.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertFalse(SearchSuggestions.drop(SUGGESTION));
    }
}
