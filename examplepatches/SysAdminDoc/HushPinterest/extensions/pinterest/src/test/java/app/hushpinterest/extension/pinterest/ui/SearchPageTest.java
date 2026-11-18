/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import static org.junit.Assert.assertEquals;

import android.view.View;
import android.widget.FrameLayout;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;

/** The Search tab's page with nothing under its bar (#44). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SearchPageTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();

    private FrameLayout page;
    private View list;
    private View spinner;
    private View header;
    private View back;

    @Before public void page() {
        page = UiHooksForTests.namedFrame("loading_container");
        spinner = new View(page.getContext());
        list = UiHooksForTests.named("swipe_container");
        header = UiHooksForTests.named("header_bar");
        back = UiHooksForTests.named("slp_back_button_container");
        page.addView(spinner);
        page.addView(list);
        page.addView(header);
        page.addView(back);
    }

    @After public void restore() {
        Settings.BLANK_SEARCH_PAGE.resetToDefault();
    }

    @Test public void offLeavesThePageAlone() {
        InterfaceControls.searchLanding(page);
        assertEquals(View.VISIBLE, list.getVisibility());
        assertEquals(View.VISIBLE, spinner.getVisibility());
    }

    @Test public void onLeavesOnlyTheSearchBar() {
        Settings.BLANK_SEARCH_PAGE.save(true);
        InterfaceControls.searchLanding(page);
        assertEquals(View.GONE, list.getVisibility());
        assertEquals(View.GONE, spinner.getVisibility());
        assertEquals(View.VISIBLE, header.getVisibility());
        assertEquals(View.VISIBLE, back.getVisibility());
    }

    @Test public void whatPinterestShowsAgainFoldsOnTheNextLayout() {
        Settings.BLANK_SEARCH_PAGE.save(true);
        InterfaceControls.searchLanding(page);
        list.setVisibility(View.VISIBLE);
        page.layout(0, 0, 100, 100);
        assertEquals(View.GONE, list.getVisibility());
    }

    @Test public void turningItOffBringsThePageBackOnTheNextLayout() {
        Settings.BLANK_SEARCH_PAGE.save(true);
        InterfaceControls.searchLanding(page);
        Settings.BLANK_SEARCH_PAGE.save(false);
        page.layout(0, 0, 100, 100);
        assertEquals(View.VISIBLE, list.getVisibility());
        assertEquals(View.VISIBLE, spinner.getVisibility());
    }

    @Test public void aSecondCallAddsNoSecondWatcherAndKeepsWorking() {
        Settings.BLANK_SEARCH_PAGE.save(true);
        InterfaceControls.searchLanding(page);
        InterfaceControls.searchLanding(page);
        Settings.BLANK_SEARCH_PAGE.save(false);
        InterfaceControls.searchLanding(page);
        assertEquals(View.VISIBLE, list.getVisibility());
    }
}
