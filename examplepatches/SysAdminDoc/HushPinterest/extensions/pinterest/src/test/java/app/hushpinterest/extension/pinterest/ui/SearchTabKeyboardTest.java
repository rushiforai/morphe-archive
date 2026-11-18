/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import static org.junit.Assert.assertEquals;

import android.view.View;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.pinterest.ui.UiHooksForTests.Screen;
import app.hushpinterest.extension.pinterest.ui.UiHooksForTests.SearchWindow;
import app.hushpinterest.extension.shared.SettingsContextRule;

/** A second press on Search goes to the search bar (#42). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SearchTabKeyboardTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();

    private SearchWindow window;

    @Before public void window() {
        window = new SearchWindow();
        Settings.SEARCH_TAB_KEYBOARD.save(true);
    }

    @After public void restore() {
        Settings.SEARCH_TAB_KEYBOARD.resetToDefault();
    }

    @Test public void aSecondPressTapsTheMiddleOfTheSearchBar() {
        assertEquals(1, window.press(window.searchTab, Screen.SEARCH_LANDING));
        assertEquals(1, window.downs);
        assertEquals(1, window.ups);
        assertEquals("the holder's left, the bar's left, half its width", 10 + 30 + 100, window.x, 0.01f);
        assertEquals("the holder's top, the bar's top, half its height", 20 + 40 + 20, window.y, 0.01f);
    }

    @Test public void offLeavesThePressToPinterest() {
        Settings.SEARCH_TAB_KEYBOARD.save(false);
        assertEquals(0, window.press(window.searchTab, Screen.SEARCH_LANDING));
        assertEquals(0, window.downs);
    }

    @Test public void theFirstPressFromAnotherScreenStillNavigates() {
        assertEquals(0, window.press(window.searchTab, Screen.HOME_FEED));
        assertEquals(0, window.downs);
    }

    @Test public void anotherTabStillNavigates() {
        assertEquals(0, window.press(window.homeTab, Screen.SEARCH_LANDING));
        assertEquals(0, window.downs);
    }

    @Test public void aHiddenSearchBarLeavesThePressToPinterest() {
        window.holder.setVisibility(View.GONE);
        assertEquals(0, window.press(window.searchTab, Screen.SEARCH_LANDING));
        assertEquals(0, window.downs);
    }

    @Test public void aTapNothingTakesLeavesThePressToPinterest() {
        window.takesTouches = false;
        assertEquals(0, window.press(window.searchTab, Screen.SEARCH_LANDING));
        assertEquals("no lift after a press nothing took", 0, window.ups);
    }
}
