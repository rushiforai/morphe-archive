/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.assertEquals;

import android.app.Activity;
import android.app.AlertDialog;
import android.widget.ListAdapter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowLooper;

import app.hushpinterest.extension.pinterest.ads.SeenPins;
import app.hushpinterest.extension.pinterest.ads.SeenPinsForTests;
import app.hushpinterest.extension.shared.SettingsContextRule;

/** #52: how long a seen pin stays out, and the Forget row's count. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class SeenPinsForPreferenceTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private static final String AGAIN = ". After that, a pin you've seen can show up again.";

    /** A pin with an ID, which Hide pins you've already seen notes by. */
    static final class Pin {
        @PausedHooksTest.Json("id") String id;
        @PausedHooksTest.Json("grid_title") String gridTitle = "";

        Pin(String id) {
            this.id = id;
        }
    }

    @Before public void installed() {
        SeenPinsForTests.clear();
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.FEED_SEEN_PINS));
    }

    @After public void reset() {
        SeenPins.FOR.resetToDefault();
        Settings.HIDE_SEEN_PINS.resetToDefault();
        PatchFamilyForTests.capabilities(null);
        SeenPinsForTests.clear();
    }

    private interface Check {
        void run(SeenPinsForPreference row) throws Exception;
    }

    private static void onRow(Check check) throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            check.run(new SeenPinsForPreference(controller.get()));
        }
    }

    @Test public void itStartsAtForever() throws Exception {
        onRow(row -> {
            assertEquals("Hide seen pins for", row.getTitle());
            assertEquals("Forever. A pin you've seen stays out until you forget it.", row.getSummary());
            assertEquals(SeenPins.FOREVER, SeenPins.FOR.get());
        });
    }

    @Test public void aChoiceIsSavedAndShown() throws Exception {
        onRow(row -> {
            row.choose(SeenPins.WEEK);
            assertEquals(SeenPins.WEEK, SeenPins.FOR.get());
            assertEquals("A week" + AGAIN, row.getSummary());
            row.choose(SeenPins.DAY);
            assertEquals("A day" + AGAIN, row.getSummary());
            row.choose(SeenPins.MONTH);
            assertEquals("A month" + AGAIN, row.getSummary());
        });
    }

    /** A value no build wrote reads as forever, the way the filter reads it. */
    @Test public void anOddValueReadsAsForever() throws Exception {
        SeenPins.FOR.save("fortnight");
        onRow(row -> assertEquals("Forever. A pin you've seen stays out until you forget it.", row.getSummary()));
    }

    @Test public void aTapListsEveryLengthWithTheChosenOneChecked() throws Exception {
        SeenPins.FOR.save(SeenPins.MONTH);
        onRow(row -> {
            row.getOnPreferenceClickListener().onPreferenceClick(row);
            ShadowLooper.idleMainLooper();
            AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
            ListAdapter adapter = dialog.getListView().getAdapter();
            List<String> shown = new ArrayList<>();
            for (int index = 0; index < adapter.getCount(); index++) shown.add(String.valueOf(adapter.getItem(index)));
            assertEquals(Arrays.asList("A day", "A week", "A month", "Forever"), shown);
            assertEquals(2, dialog.getListView().getCheckedItemPosition());
        });
    }

    /** The Forget row counts what's remembered, and after a tap says how to bring it back. */
    @Test public void theForgetRowSaysWhatItHolds() {
        Settings.HIDE_SEEN_PINS.save(true);
        assertEquals("No pins remembered yet.", HushPinterestPreferenceFragment.forgetSeenPinsSummary());
        Pin one = new Pin("1");
        Pin two = new Pin("2");
        SeenPinsForTests.homePage(new ArrayList<>(Arrays.asList(one, two)));
        SeenPins.shown(one);
        assertEquals("Remembers one pin you've seen. Tap to forget it, so it can show again.",
                HushPinterestPreferenceFragment.forgetSeenPinsSummary());
        SeenPins.shown(two);
        assertEquals("Remembers 2 pins you've seen. Tap to forget them, so they can show again.",
                HushPinterestPreferenceFragment.forgetSeenPinsSummary());
        assertEquals(2, SeenPins.forget());
        assertEquals("Forgot 2 pins. Tap again to bring them back.", HushPinterestPreferenceFragment.forgetSeenPinsSummary());
        assertEquals(2, SeenPins.bringBack());
        assertEquals(0, SeenPins.forgotten());
        assertEquals("Remembers 2 pins you've seen. Tap to forget them, so they can show again.",
                HushPinterestPreferenceFragment.forgetSeenPinsSummary());
    }
}
