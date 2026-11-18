/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.widget.ListAdapter;

import java.util.ArrayList;
import java.util.Arrays;
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

import app.hushpinterest.extension.pinterest.ui.BoardTabs;
import app.hushpinterest.extension.shared.SettingsContextRule;

/** #42: the choice of where a board tab's name sits. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class BoardTabPositionPreferenceTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private static final String REST = ". Moves the board name on the picture at the top of a board tab on Home. "
            + "The change shows the next time the tab opens.";

    @After public void reset() {
        BoardTabs.POSITION.resetToDefault();
    }

    private interface Check {
        void run(BoardTabPositionPreference row) throws Exception;
    }

    private static void onRow(Check check) throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            check.run(new BoardTabPositionPreference(controller.get()));
        }
    }

    @Test public void itStartsWherePinterestPutsTheName() throws Exception {
        onRow(row -> {
            assertEquals("Board name position", row.getTitle());
            assertEquals("Where Pinterest puts it" + REST, row.getSummary());
            assertEquals("", BoardTabs.POSITION.get());
        });
    }

    @Test public void aChoiceIsSavedAndShown() throws Exception {
        onRow(row -> {
            row.choose(BoardTabs.TOP_CENTER);
            assertEquals(BoardTabs.TOP_CENTER, BoardTabs.POSITION.get());
            assertEquals("Top center" + REST, row.getSummary());
        });
    }

    @Test public void aTapListsEveryPlace() throws Exception {
        onRow(row -> {
            row.getOnPreferenceClickListener().onPreferenceClick(row);
            ShadowLooper.idleMainLooper();
            AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
            ListAdapter adapter = dialog.getListView().getAdapter();
            List<String> shown = new ArrayList<>();
            for (int index = 0; index < adapter.getCount(); index++) shown.add(String.valueOf(adapter.getItem(index)));
            assertTrue(shown.toString(), shown.containsAll(Arrays.asList("Where Pinterest puts it", "Top left", "Top center",
                    "Middle", "Bottom center", "Bottom right")));
            assertEquals(BoardTabs.POSITIONS.length, shown.size());
            dialog.dismiss();
        });
    }
}
