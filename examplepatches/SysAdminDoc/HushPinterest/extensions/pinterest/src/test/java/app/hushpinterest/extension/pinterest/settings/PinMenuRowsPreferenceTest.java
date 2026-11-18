/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.widget.ListAdapter;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowLooper;

import app.hushpinterest.extension.pinterest.ui.PinMenuRows;
import app.hushpinterest.extension.shared.SettingsContextRule;

/** #43: the list of a pin menu's rows behind Pick pin menu rows. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class PinMenuRowsPreferenceTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private static final String REASON = "Why you're seeing this pin";

    @After public void reset() {
        PinMenuRows.PICKED.resetToDefault();
        Settings.HIDE_PIN_MENU_ROWS.resetToDefault();
        PatchFamily.capabilitiesForTests = null;
    }

    private interface Check {
        void run(Activity activity, PinMenuRowsPreference row) throws Exception;
    }

    private static void onRow(Check check) throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushPinterestPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            check.run(activity, new PinMenuRowsPreference(page, activity));
        }
    }

    @Test public void withNothingPickedTheRowSaysWhatItIsFor() throws Exception {
        onRow((activity, row) -> {
            assertEquals("Pick pin menu rows", row.getTitle());
            assertEquals("Pick the rows to take out of a pin's menu.", row.getSummary());
        });
    }

    @Test public void tickingARowSavesItAndTurnsTheSwitchOn() throws Exception {
        onRow((activity, row) -> {
            row.choose(PinMenuRows.REASON, true);
            assertTrue(PinMenuRows.picked().contains(PinMenuRows.REASON));
            assertTrue("a row just ticked is one people expect gone", Settings.HIDE_PIN_MENU_ROWS.savedValue());
            assertEquals("Hidden from pin menus: " + REASON + ". Tap to change.", row.getSummary());
        });
    }

    @Test public void unTickingLeavesTheSwitchAlone() throws Exception {
        onRow((activity, row) -> {
            row.choose(PinMenuRows.REASON, true);
            row.choose(PinMenuRows.REASON, false);
            assertFalse(PinMenuRows.picked().contains(PinMenuRows.REASON));
            assertTrue(Settings.HIDE_PIN_MENU_ROWS.savedValue());
        });
    }

    @Test public void withTheSwitchOffTheRowSaysThePickedRowsStillShow() throws Exception {
        onRow((activity, row) -> {
            PinMenuRows.PICKED.save(PinMenuRows.REASON);
            assertEquals("Picked: " + REASON + ". Hide pin menu rows is off, so they still show.", row.getSummary());
        });
    }

    @Test public void aTapListsTheRowsThisBuildHas() throws Exception {
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS);
        onRow((activity, row) -> {
            row.getOnPreferenceClickListener().onPreferenceClick(row);
            ShadowLooper.idleMainLooper();
            AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
            ListAdapter adapter = dialog.getListView().getAdapter();
            List<String> shown = new ArrayList<>();
            for (int index = 0; index < adapter.getCount(); index++) shown.add(String.valueOf(adapter.getItem(index)));
            assertTrue(shown.toString(), shown.contains("Download pin"));
            assertTrue(shown.toString(), shown.contains("Copy image"));
            assertTrue(shown.toString(), shown.contains(REASON));
            dialog.dismiss();
        });
    }
}
