/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.EnumSet;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.fakes.RoboMenuItem;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * #24: Explore's search bar and a blog's Follow button are white in every theme. Three switches,
 * each on its own: a dark bar, a bar with no label, a dark Follow button.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class DarkControlsTest {
    /** The black Tumblr draws the bar's label in, and the black of the Follow button's text. */
    private static final int TUMBLRS_TEXT = 0xFF000000;

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Context context;
    private LinearLayout bar;
    private ImageView icon;
    private TextView label;

    @Before
    public void aBuildWithThePatchAndExploresBar() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        HookStatus.clear();
        context = Utils.getContext();
        // The pill as Tumblr's layout builds it: an icon, then the Search Tumblr label.
        bar = new LinearLayout(context);
        icon = new ImageView(context);
        label = new TextView(context);
        label.setTextColor(TUMBLRS_TEXT);
        bar.addView(icon);
        bar.addView(label);
    }

    @After
    public void restore() {
        PauseForTests.resume();
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        Settings.DARK_SEARCH_BAR.resetToDefault();
        Settings.HIDE_SEARCH_BAR_LABEL.resetToDefault();
        Settings.DARK_BLOG_FOLLOW_BUTTON.resetToDefault();
        HookStatus.clear();
    }

    private Button followButton() {
        Button button = new Button(context);
        button.setTextColor(TUMBLRS_TEXT);
        return button;
    }

    private MenuItem followItem(View button) {
        MenuItem item = new RoboMenuItem(context);
        item.setActionView(button);
        return item;
    }

    private void assertTumblrsBar() {
        assertNull("the pill keeps Tumblr's white", bar.getBackgroundTintList());
        assertNull(icon.getImageTintList());
        assertEquals(TUMBLRS_TEXT, label.getCurrentTextColor());
        assertEquals(View.VISIBLE, label.getVisibility());
    }

    private void assertTumblrsButton(Button button) {
        assertNull("the button keeps Tumblr's white", button.getBackgroundTintList());
        assertEquals(TUMBLRS_TEXT, button.getCurrentTextColor());
    }

    @Test
    public void everySwitchStartsOffSoTumblrsLookStands() {
        assertFalse(Settings.DARK_SEARCH_BAR.defaultValue);
        assertFalse(Settings.HIDE_SEARCH_BAR_LABEL.defaultValue);
        assertFalse(Settings.DARK_BLOG_FOLLOW_BUTTON.defaultValue);
        assertTrue("Explore finds its bar once", Settings.DARK_SEARCH_BAR.rebootApp);
        assertTrue("Explore finds its bar once", Settings.HIDE_SEARCH_BAR_LABEL.rebootApp);
        assertFalse("a blog reads it each time it opens", Settings.DARK_BLOG_FOLLOW_BUTTON.rebootApp);

        DarkControls.exploreSearchBar(bar);
        assertTumblrsBar();
        Button button = followButton();
        DarkControls.blogFollowButton(followItem(button));
        assertTumblrsButton(button);
    }

    @Test
    public void theDarkBarSwitchDarkensThePillAndLightensWhatIsOnIt() {
        Settings.DARK_SEARCH_BAR.save(true);
        DarkControls.exploreSearchBar(bar);
        assertEquals(DarkControls.DARK, bar.getBackgroundTintList().getDefaultColor());
        assertEquals(DarkControls.SOFT_WHITE, icon.getImageTintList().getDefaultColor());
        assertEquals(DarkControls.SOFT_WHITE, label.getCurrentTextColor());
        assertEquals("the label stays unless its own switch is on", View.VISIBLE, label.getVisibility());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(DarkControls.BAR_DARKENED + " 1"));
        assertFalse(report, report.contains(DarkControls.LABEL_HIDDEN));
    }

    @Test
    public void theLabelSwitchTakesTheLabelOffAndLeavesTheRest() {
        Settings.HIDE_SEARCH_BAR_LABEL.save(true);
        DarkControls.exploreSearchBar(bar);
        assertEquals(View.GONE, label.getVisibility());
        assertEquals(View.VISIBLE, icon.getVisibility());
        assertNull("the pill stays white unless its own switch is on", bar.getBackgroundTintList());
        assertNull(icon.getImageTintList());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(DarkControls.LABEL_HIDDEN + " 1"));
        assertFalse(report, report.contains(DarkControls.BAR_DARKENED));
    }

    @Test
    public void bothBarSwitchesTogetherGiveADarkBarWithOnlyItsIcon() {
        Settings.DARK_SEARCH_BAR.save(true);
        Settings.HIDE_SEARCH_BAR_LABEL.save(true);
        DarkControls.exploreSearchBar(bar);
        assertEquals(DarkControls.DARK, bar.getBackgroundTintList().getDefaultColor());
        assertEquals(DarkControls.SOFT_WHITE, icon.getImageTintList().getDefaultColor());
        assertEquals(View.GONE, label.getVisibility());
    }

    @Test
    public void theFollowSwitchDarkensTheButtonAndLeavesTheBarAlone() {
        Settings.DARK_BLOG_FOLLOW_BUTTON.save(true);
        Button button = followButton();
        DarkControls.blogFollowButton(followItem(button));
        assertEquals(DarkControls.DARK, button.getBackgroundTintList().getDefaultColor());
        assertEquals(DarkControls.WHITE, button.getCurrentTextColor());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(DarkControls.FOLLOW_DARKENED + " 1"));

        DarkControls.exploreSearchBar(bar);
        assertTumblrsBar();
    }

    @Test
    public void theBarSwitchesLeaveTheFollowButtonAlone() {
        Settings.DARK_SEARCH_BAR.save(true);
        Settings.HIDE_SEARCH_BAR_LABEL.save(true);
        Button button = followButton();
        DarkControls.blogFollowButton(followItem(button));
        assertTumblrsButton(button);
    }

    @Test
    public void whatIsNoBarOrButtonIsLeftAlone() {
        Settings.DARK_SEARCH_BAR.save(true);
        Settings.HIDE_SEARCH_BAR_LABEL.save(true);
        Settings.DARK_BLOG_FOLLOW_BUTTON.save(true);
        View plain = new View(context);
        DarkControls.exploreSearchBar(plain);
        assertNull(plain.getBackgroundTintList());
        DarkControls.exploreSearchBar(null);

        DarkControls.blogFollowButton(null);
        DarkControls.blogFollowButton(new RoboMenuItem(context));
        ImageView other = new ImageView(context);
        DarkControls.blogFollowButton(followItem(other));
        assertNull("an action view that's no button keeps its look", other.getBackgroundTintList());
        assertTrue("nothing here is a failure to report", HookStatus.missing().isEmpty());
    }

    @Test
    public void aPausedHushTumblrAndABuildWithoutThePatchChangeNothing() {
        Settings.DARK_SEARCH_BAR.save(true);
        Settings.HIDE_SEARCH_BAR_LABEL.save(true);
        Settings.DARK_BLOG_FOLLOW_BUTTON.save(true);
        Button button = followButton();

        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        DarkControls.exploreSearchBar(bar);
        DarkControls.blogFollowButton(followItem(button));
        assertTumblrsBar();
        assertTumblrsButton(button);
        PauseForTests.resume();

        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        DarkControls.exploreSearchBar(bar);
        DarkControls.blogFollowButton(followItem(button));
        assertTumblrsBar();
        assertTumblrsButton(button);
    }
}
