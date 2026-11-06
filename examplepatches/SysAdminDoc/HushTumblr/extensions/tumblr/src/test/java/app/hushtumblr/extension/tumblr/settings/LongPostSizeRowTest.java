/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import android.app.Activity;
import android.preference.Preference;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.Utils;

/** The row under Collapse long posts that picks how much of a long post stays. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class LongPostSizeRowTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String ROW = HushTumblrPreferenceFragment.LONG_POST_SIZE_ROW;

    @Before
    public void startClean() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.capabilitiesForTests = null;
        TextSettings.LONG_POST_SIZE.resetToDefault();
    }

    @After
    public void restore() throws Exception {
        settle();
        TextSettings.LONG_POST_SIZE.resetToDefault();
        PatchFamily.inBuildForTests = null;
    }

    /** Each tap saves the next length at once and the row names it, back to the shortest after the longest. */
    @Test
    public void eachTapSavesTheNextLengthAndTheRowNamesIt() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            Preference row = page.findPreference(ROW);
            assertEquals("About a screen. Tap to change.", String.valueOf(row.getSummary()));
            SettingsL10nTest.openPageOf(page, ROW);
            String[] saved = {"80", "20", "40"};
            String[] summaries = {"About two screens. Tap to change.", "About half a screen. Tap to change.",
                    "About a screen. Tap to change."};
            for (int tap = 0; tap < saved.length; tap++) {
                row.getOnPreferenceClickListener().onPreferenceClick(row);
                settle();
                assertEquals(saved[tap], TextSettings.LONG_POST_SIZE.persistedValue());
                assertEquals(summaries[tap], String.valueOf(page.findPreference(ROW).getSummary()));
                assertNull(SettingsFeedbackTest.message(row));
            }
        }
    }

    /**
     * A tap made before the last one's save is done still moves one length further. Both saves wait
     * on the worker until both taps are in, so neither tap sees the other's length.
     */
    @Test
    public void twoQuickTapsMoveTwoLengths() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            Preference row = page.findPreference(ROW);
            List<Runnable> queued = new ArrayList<>();
            HushTumblrPreferenceFragment.editWorkerForTests = queued::add;
            try {
                row.getOnPreferenceClickListener().onPreferenceClick(row);
                row.getOnPreferenceClickListener().onPreferenceClick(row);
                assertEquals("both saves wait for the worker", 2, queued.size());
                assertEquals("nothing is saved before the worker runs", "40", TextSettings.LONG_POST_SIZE.persistedValue());
            } finally {
                HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
            }
            for (Runnable save : queued) save.run();
            settle();
            assertEquals("20", TextSettings.LONG_POST_SIZE.persistedValue());
            assertEquals("About half a screen. Tap to change.", String.valueOf(page.findPreference(ROW).getSummary()));
        }
    }

    /** A saved length its row never offers reads as about a screen, as Collapse long posts reads it. */
    @Test
    public void aLengthTheRowNeverOffersReadsAsAScreen() throws Exception {
        TextSettings.LONG_POST_SIZE.save("13");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            Preference row = page.findPreference(ROW);
            assertEquals("About a screen. Tap to change.", String.valueOf(row.getSummary()));
            row.getOnPreferenceClickListener().onPreferenceClick(row);
            settle();
            assertEquals("the tap moves on from about a screen", "80", TextSettings.LONG_POST_SIZE.persistedValue());
        }
    }

    private static void settle() throws Exception {
        for (int round = 0; round < 3; round++) {
            Utils.awaitBackgroundTasksForTests();
            ShadowLooper.idleMainLooper();
        }
    }
}
