/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

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

import java.util.EnumSet;
import java.util.Locale;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment;

/** #23: the Size row under Text size, which picks how big Tumblr's text gets. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TextSizeRowTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String ROW = HushTumblrPreferenceFragment.TEXT_SIZE_ROW;
    private Locale before;

    @Before
    public void startClean() {
        before = Locale.getDefault();
        Locale.setDefault(Locale.US);
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.capabilitiesForTests = null;
        Settings.TEXT_SIZE.resetToDefault();
        TextSettings.TEXT_SIZE_PERCENT.resetToDefault();
        AbstractPreferenceFragment.restartPending.clear();
    }

    @After
    public void restore() throws Exception {
        settle();
        Settings.TEXT_SIZE.resetToDefault();
        TextSettings.TEXT_SIZE_PERCENT.resetToDefault();
        AbstractPreferenceFragment.restartPending.clear();
        PatchFamily.inBuildForTests = null;
        Locale.setDefault(before);
    }

    /** Each tap saves the next size at once and the row names it, back to the smallest after the largest. */
    @Test
    public void eachTapSavesTheNextSizeAndTheRowNamesIt() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            Preference row = page.findPreference(ROW);
            assertEquals("115% of your phone's text size. Tap to change.", String.valueOf(row.getSummary()));
            SettingsL10nTest.openPageOf(page, ROW);
            String[] saved = {"120", "130", "85", "90", "110", "115"};
            for (String size : saved) {
                row.getOnPreferenceClickListener().onPreferenceClick(row);
                settle();
                assertEquals(size, TextSettings.TEXT_SIZE_PERCENT.persistedValue());
                assertEquals(size + "% of your phone's text size. Tap to change.",
                        String.valueOf(page.findPreference(ROW).getSummary()));
                assertNull("with the switch off nothing waits for a restart", SettingsFeedbackTest.message(row));
            }
            assertFalse(AbstractPreferenceFragment.restartPending.contains(TextSettings.TEXT_SIZE_PERCENT.key));
        }
    }

    /** With the switch on, a new size waits for a restart, and the row says so. */
    @Test
    public void withTheSwitchOnANewSizeWaitsForARestart() throws Exception {
        Settings.TEXT_SIZE.save(true);
        AbstractPreferenceFragment.restartPending.clear();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            SettingsL10nTest.openPageOf(page, ROW);
            Preference row = page.findPreference(ROW);
            row.getOnPreferenceClickListener().onPreferenceClick(row);
            settle();
            assertEquals("120", TextSettings.TEXT_SIZE_PERCENT.persistedValue());
            assertTrue(AbstractPreferenceFragment.restartPending.contains(TextSettings.TEXT_SIZE_PERCENT.key));
            assertEquals("Saved. Restart Tumblr to apply this change.", SettingsFeedbackTest.message(page.findPreference(ROW)));

            // Back to the size Tumblr started with owes nothing.
            for (int tap = 0; tap < 5; tap++) {
                row.getOnPreferenceClickListener().onPreferenceClick(row);
                settle();
            }
            assertEquals("115", TextSettings.TEXT_SIZE_PERCENT.persistedValue());
            assertFalse(AbstractPreferenceFragment.restartPending.contains(TextSettings.TEXT_SIZE_PERCENT.key));
        }
    }

    /** A saved size its row never offers reads as the default, as Text size reads it. */
    @Test
    public void aSizeTheRowNeverOffersReadsAsTheDefault() throws Exception {
        TextSettings.TEXT_SIZE_PERCENT.save("95");
        assertEquals("115%", HushTumblrPreferenceFragment.textSizeShown("95"));
        assertEquals("120", HushTumblrPreferenceFragment.nextTextSize("95"));
        assertEquals("85", HushTumblrPreferenceFragment.nextTextSize("130"));
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            assertEquals("115% of your phone's text size. Tap to change.", String.valueOf(page.findPreference(ROW).getSummary()));
        }
    }

    private static void settle() throws Exception {
        for (int round = 0; round < 3; round++) {
            Utils.awaitBackgroundTasksForTests();
            ShadowLooper.idleMainLooper();
        }
    }
}
