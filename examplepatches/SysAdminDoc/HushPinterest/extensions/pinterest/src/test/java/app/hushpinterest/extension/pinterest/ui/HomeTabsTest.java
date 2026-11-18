/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import static org.junit.Assert.assertEquals;

import android.view.View;
import android.view.View.MeasureSpec;
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

/** Home's row of tabs, All and the board names (#43). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class HomeTabsTest {
    private static final int OFFERED = MeasureSpec.makeMeasureSpec(120, MeasureSpec.AT_MOST);
    private static final int NO_HEIGHT = MeasureSpec.makeMeasureSpec(0, MeasureSpec.EXACTLY);

    @Rule public final SettingsContextRule context = new SettingsContextRule();

    private View tabs;
    private View tuner;
    private View loading;

    @Before public void page() {
        FrameLayout page = UiHooksForTests.namedFrame("home_page");
        FrameLayout row = UiHooksForTests.namedFrame("home_feed_view_pager_tab_layout_container");
        tabs = UiHooksForTests.named("home_feed_view_pager_tab_layout");
        tuner = UiHooksForTests.named("hf_tuner_icon");
        loading = UiHooksForTests.named("home_feed_tabs_placeholder_loading_layout");
        row.addView(tabs);
        row.addView(tuner);
        page.addView(row);
        page.addView(loading);
    }

    @After public void restore() {
        Settings.HIDE_HOME_TABS.resetToDefault();
    }

    private int measured() {
        return InterfaceControls.homeTabsHeight(tabs, 0, OFFERED);
    }

    @Test public void offLeavesTheRowAsPinterestBuiltIt() {
        assertEquals(OFFERED, measured());
        assertEquals(View.VISIBLE, tuner.getVisibility());
        assertEquals(View.VISIBLE, loading.getVisibility());
    }

    @Test public void onTakesTheRowsHeightAndWhatSitsBesideIt() {
        Settings.HIDE_HOME_TABS.save(true);
        assertEquals(NO_HEIGHT, measured());
        assertEquals(View.GONE, tuner.getVisibility());
        assertEquals(View.GONE, loading.getVisibility());
        assertEquals("the row itself stays for Pinterest's pager", View.VISIBLE, tabs.getVisibility());
    }

    @Test public void anotherTabLayoutKeepsItsHeight() {
        Settings.HIDE_HOME_TABS.save(true);
        View other = UiHooksForTests.named("profile_tab_layout");
        assertEquals(OFFERED, InterfaceControls.homeTabsHeight(other, 0, OFFERED));
    }

    @Test public void turningItOffBringsBackTheTunerButNotAFinishedShimmer() {
        Settings.HIDE_HOME_TABS.save(true);
        measured();
        Settings.HIDE_HOME_TABS.save(false);
        assertEquals(OFFERED, measured());
        assertEquals(View.VISIBLE, tuner.getVisibility());
        assertEquals("Pinterest shows it again when it next loads", View.GONE, loading.getVisibility());
    }
}
