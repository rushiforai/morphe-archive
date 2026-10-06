/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.BooleanSetting;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;
import app.hushpinterest.extension.shared.settings.preference.LogBufferManager;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class UiHooksTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();

    private enum Tab { HOME, SEARCH, CREATE, NOTIFICATIONS, PROFILE, UNKNOWN }

    private static final BooleanSetting[] SWITCHES = {
            Settings.HIDE_SCREENSHOT_SHARE, Settings.HIDE_SEARCH_HISTORY,
            Settings.HIDE_NAV_CREATE, Settings.HIDE_NAV_NOTIFICATIONS, Settings.HIDE_NAV_SEARCH, Settings.HIDE_HEADER_BUTTONS,
            Settings.HIDE_PIN_MENU_COLLAGE, Settings.HIDE_PIN_MENU_VISUAL_SEARCH, Settings.HIDE_PIN_MENU_PIN_BOOST,
            Settings.HIDE_COMMENTS, Settings.QUIET_EMAIL_REMINDER, Settings.HIDE_SAVE_TOASTS, Settings.ORIGINAL_IMAGES, Settings.DISABLE_UPDATE_NAG
    };

    @After public void restore() {
        PauseForTests.resume();
        for (BooleanSetting setting : SWITCHES) setting.resetToDefault();
        HookStatus.clear();
    }

    @Test public void everyOptionalControlStartsOffAndLeavesHostValuesAlone() {
        for (BooleanSetting setting : SWITCHES) assertFalse(setting.key, setting.defaultValue);
        assertFalse(UiHooks.hideScreenshotShare());
        assertFalse(UiHooks.quietEmailReminder());
        assertFalse(UiHooks.disableUpdateNag());
        assertFalse(UiHooks.originalImages());
        assertEquals(View.INVISIBLE, UiHooks.searchHistoryVisibility(View.INVISIBLE));
        assertEquals(312, UiHooks.searchHistoryMeasureSpec(312));
        assertEquals(View.VISIBLE, UiHooks.commentsVisibility(View.VISIBLE));
        assertTrue(UiHooks.commentsVisible(true));
    }

    @Test public void screenshotAndOptionalRemindersRestoreWhenPaused() {
        Settings.HIDE_SCREENSHOT_SHARE.save(true);
        Settings.QUIET_EMAIL_REMINDER.save(true);
        Settings.DISABLE_UPDATE_NAG.save(true);
        Settings.ORIGINAL_IMAGES.save(true);
        assertTrue(UiHooks.hideScreenshotShare());
        assertTrue(UiHooks.quietEmailReminder());
        assertTrue(UiHooks.disableUpdateNag());
        assertTrue(UiHooks.originalImages());
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertFalse(UiHooks.hideScreenshotShare());
        assertFalse(UiHooks.quietEmailReminder());
        assertFalse(UiHooks.disableUpdateNag());
        assertFalse(UiHooks.originalImages());
        assertTrue(Settings.HIDE_SCREENSHOT_SHARE.savedValue());
    }

    @Test public void saveToastsDropOnlyTheNamedModelsWhileTheSwitchIsOn() {
        StringBuilder saved = new StringBuilder();
        UiHooks.saveToastForTests = StringBuilder.class;
        try {
            assertFalse(UiHooks.hideSaveToast(saved));
            Settings.HIDE_SAVE_TOASTS.save(true);
            assertTrue(UiHooks.hideSaveToast(saved));
            assertFalse(UiHooks.hideSaveToast("another toast"));
            assertFalse(UiHooks.hideSaveToast(null));
            PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
            assertFalse(UiHooks.hideSaveToast(saved));
            PauseForTests.resume();
        } finally {
            UiHooks.saveToastForTests = null;
        }
        assertFalse("the unpatched stub names no toast", UiHooks.hideSaveToast(saved));
    }

    @Test public void searchHistoryAndCommentsFoldToZeroAndRestoreTheirRequestedSize() {
        int spec = View.MeasureSpec.makeMeasureSpec(200, View.MeasureSpec.AT_MOST);
        Settings.HIDE_SEARCH_HISTORY.save(true);
        Settings.HIDE_COMMENTS.save(true);
        assertEquals(View.GONE, UiHooks.searchHistoryVisibility(View.VISIBLE));
        assertEquals(0, View.MeasureSpec.getSize(UiHooks.searchHistoryMeasureSpec(spec)));
        assertEquals(View.MeasureSpec.EXACTLY, View.MeasureSpec.getMode(UiHooks.searchHistoryMeasureSpec(spec)));
        assertEquals(View.GONE, UiHooks.commentsVisibility(View.VISIBLE));
        assertEquals(0, View.MeasureSpec.getSize(UiHooks.commentsMeasureSpec(spec)));
        assertFalse(UiHooks.commentsVisible(true));
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertEquals(View.INVISIBLE, UiHooks.searchHistoryVisibility(View.INVISIBLE));
        assertEquals(spec, UiHooks.searchHistoryMeasureSpec(spec));
        assertEquals(spec, UiHooks.commentsMeasureSpec(spec));
        assertTrue(UiHooks.commentsVisible(true));
    }

    @Test public void navigationSwitchesHideOnlyTheirNamedTabsAndRestoreTheHostVisibility() {
        Settings.HIDE_NAV_CREATE.save(true);
        Settings.HIDE_NAV_NOTIFICATIONS.save(false);
        assertTrue(InterfaceControls.hideNavigation("CREATE"));
        assertFalse(InterfaceControls.hideNavigation("NOTIFICATIONS"));
        assertFalse(InterfaceControls.hideNavigation("HOME"));
        assertFalse(InterfaceControls.hideNavigation("PROFILE"));
        assertFalse(InterfaceControls.hideNavigation("SEARCH"));
        assertFalse(InterfaceControls.hideNavigation("UNKNOWN"));
        Settings.HIDE_NAV_SEARCH.save(true);
        assertTrue(InterfaceControls.hideNavigation("SEARCH"));
        assertFalse(InterfaceControls.hideNavigation("HOME"));
        assertFalse(InterfaceControls.hideNavigation("PROFILE"));
        Settings.HIDE_NAV_SEARCH.save(false);
        LinearLayout root = new LinearLayout(RuntimeEnvironment.getApplication());
        LinearLayout nested = new LinearLayout(RuntimeEnvironment.getApplication());
        View create = new View(RuntimeEnvironment.getApplication());
        View profile = new View(RuntimeEnvironment.getApplication());
        create.setVisibility(View.INVISIBLE);
        nested.addView(create);
        nested.addView(profile);
        root.addView(nested);
        InterfaceControls.bindNavigation(create, Tab.CREATE);
        InterfaceControls.bindNavigation(profile, Tab.PROFILE);
        assertEquals(View.GONE, create.getVisibility());
        assertEquals(View.VISIBLE, profile.getVisibility());
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        InterfaceControls.refreshNavigation(root);
        assertEquals(View.INVISIBLE, create.getVisibility());
        assertEquals(View.VISIBLE, profile.getVisibility());
        assertEquals(2, nested.getChildCount());
    }

    @Test public void unknownNavigationModelsLeaveTheViewAlone() {
        Settings.HIDE_NAV_CREATE.save(true);
        View view = new View(RuntimeEnvironment.getApplication());
        view.setVisibility(View.INVISIBLE);
        InterfaceControls.bindNavigation(view, new Object());
        assertEquals(View.INVISIBLE, view.getVisibility());
    }

    @Test public void headerControlNamesExcludeLeadingActionsTextAndAvatar() {
        assertTrue(InterfaceControls.headerAction("end_container_icon_bt"));
        assertTrue(InterfaceControls.headerAction("end_container_icon_buttons"));
        assertFalse(InterfaceControls.headerAction("start_container_icon_bt"));
        assertFalse(InterfaceControls.headerAction("start_container_icon_buttons"));
        assertFalse(InterfaceControls.headerAction("end_container_text_button"));
        assertFalse(InterfaceControls.headerAction("end_container_avatar"));
        assertFalse(InterfaceControls.headerAction("header_static_search_bar"));
    }

    @Test public void menuChoicesAreIndependentAndKeepDownloadShareCopyReportAndSave() {
        Settings.HIDE_PIN_MENU_COLLAGE.save(true);
        assertTrue(InterfaceControls.hidePinMenuItem("overflow_menu_add_to_collage"));
        assertTrue(InterfaceControls.hidePinMenuItem("overflow_menu_remix_collage"));
        assertFalse(InterfaceControls.hidePinMenuItem("contextmenu_visual_search_image"));
        assertFalse(InterfaceControls.hidePinMenuItem("overflow_menu_pin_boost"));
        Settings.HIDE_PIN_MENU_VISUAL_SEARCH.save(true);
        Settings.HIDE_PIN_MENU_PIN_BOOST.save(true);
        assertTrue(InterfaceControls.hidePinMenuItem("contextmenu_visual_search_image"));
        assertTrue(InterfaceControls.hidePinMenuItem("overflow_menu_pin_boost"));
        for (String key : new String[] {"save_to_device", "overflow_menu_share", "copy_link",
                "grid_actions_report_pin", "save_pin", "overflow_menu_edit", "unknown"}) {
            assertFalse(key, InterfaceControls.hidePinMenuItem(key));
        }
        View row = new View(RuntimeEnvironment.getApplication());
        InterfaceControls.pinMenuItem(row, "overflow_menu_add_to_collage");
        assertEquals(View.GONE, row.getVisibility());
        Settings.HIDE_PIN_MENU_COLLAGE.save(false);
        InterfaceControls.pinMenuItem(row, "overflow_menu_add_to_collage");
        assertEquals(View.VISIBLE, row.getVisibility());
    }

    @Test public void menuCensusRecordsFixedRowsAndPauseWithoutReadingTheirText() {
        String[] keys = {"overflow_menu_add_to_collage", "overflow_menu_remix_collage",
                "contextmenu_visual_search_image", "overflow_menu_pin_boost"};
        for (String key : keys) {
            TextView row = new TextView(RuntimeEnvironment.getApplication());
            row.setText("private-person pin_id=987654321 https://private.example/token");
            InterfaceControls.pinMenuItem(row, key);
            assertEquals(View.VISIBLE, row.getVisibility());
        }
        Settings.HIDE_PIN_MENU_COLLAGE.save(true);
        Settings.HIDE_PIN_MENU_VISUAL_SEARCH.save(true);
        Settings.HIDE_PIN_MENU_PIN_BOOST.save(true);
        for (String key : keys) {
            View row = new View(RuntimeEnvironment.getApplication());
            InterfaceControls.pinMenuItem(row, key);
            assertEquals(View.GONE, row.getVisibility());
            PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
            InterfaceControls.pinMenuItem(row, key);
            assertEquals(View.VISIBLE, row.getVisibility());
            PauseForTests.resume();
        }
        String report = LogBufferManager.buildExportText();
        for (String key : keys) {
            assertTrue(report, report.contains(key + " visible 2"));
            assertTrue(report, report.contains(key + " hidden by fixed switch 1"));
        }
        assertFalse(report, report.contains("private-person"));
        assertFalse(report, report.contains("987654321"));
        assertFalse(report, report.contains("private.example"));
    }

    @Test public void menuCensusIgnoresEssentialAndUnknownRowsEvenWhenAllFiltersAreOn() {
        Settings.HIDE_PIN_MENU_COLLAGE.save(true);
        Settings.HIDE_PIN_MENU_VISUAL_SEARCH.save(true);
        Settings.HIDE_PIN_MENU_PIN_BOOST.save(true);
        String[] essential = {"save_to_device", "overflow_menu_share", "copy_link",
                "grid_actions_report_pin", "save_pin"};
        View row = new View(RuntimeEnvironment.getApplication());
        for (String key : essential) {
            InterfaceControls.pinMenuItem(row, key);
            assertEquals(View.VISIBLE, row.getVisibility());
        }
        for (int i = 0; i < 1000; i++) InterfaceControls.pinMenuItem(row, "private_unknown_" + i);
        InterfaceControls.pinMenuItem(row, null);
        InterfaceControls.pinMenuItem(null, "overflow_menu_add_to_collage");
        String report = LogBufferManager.buildExportText();
        for (String key : essential) assertFalse(report, report.contains(key));
        assertFalse(report, report.contains("private_unknown"));
        assertFalse(report, report.contains("Counted:"));
        assertEquals(View.VISIBLE, row.getVisibility());
    }

    @Test public void menuCensusDistinguishesNativeHiddenRowsFromFilterDecisions() {
        View row = new View(RuntimeEnvironment.getApplication());
        row.setVisibility(View.INVISIBLE);
        InterfaceControls.pinMenuItem(row, "overflow_menu_add_to_collage");
        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("overflow_menu_add_to_collage not visible in native layout 1"));
        assertFalse(report, report.contains("overflow_menu_add_to_collage visible"));
        assertFalse(report, report.contains("hidden by fixed switch"));
        assertEquals(View.INVISIBLE, row.getVisibility());
    }
}
