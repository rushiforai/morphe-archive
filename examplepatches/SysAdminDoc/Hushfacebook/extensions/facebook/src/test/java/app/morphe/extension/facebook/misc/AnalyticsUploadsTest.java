/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * The hooks before XAnalytics' upload calls and on the Papaya job's gate: they hold both back while
 * the switch is on, and every other time leave Facebook's own answer standing.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AnalyticsUploadsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HOLD_ANALYTICS_UPLOADS.resetToDefault();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static String counterLine() {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(AnalyticsUploads.ROUTE + ":")) return line;
        }
        return null;
    }

    private static String statusLine() {
        for (String line : HookStatus.report("")) {
            if (line.startsWith(FamilyNames.ANALYTICS_UPLOADS + ":")) return line;
        }
        return null;
    }

    @Test
    public void theSwitchStartsOnAndHoldsBothSendersBack() {
        assertTrue("the switch starts off", Settings.HOLD_ANALYTICS_UPLOADS.get());
        assertTrue("an XAnalytics upload went out", AnalyticsUploads.holdXAnalyticsUpload());
        assertFalse("a Papaya job ran", AnalyticsUploads.papayaOn(true));
        assertEquals(AnalyticsUploads.ROUTE + ": 2 lists, 2 items, 2 removed. Last reason: " + AnalyticsUploads.PAPAYA
                + ". Removed: " + AnalyticsUploads.PAPAYA + " 1, " + AnalyticsUploads.XANALYTICS + " 1", counterLine());
        assertEquals(FamilyNames.ANALYTICS_UPLOADS + ": invoked 2, 0 found, 0 missing", statusLine());
    }

    @Test
    public void offFacebookUploadsAndRunsItsJobs() {
        Settings.HOLD_ANALYTICS_UPLOADS.save(false);
        assertFalse(AnalyticsUploads.holdXAnalyticsUpload());
        assertTrue(AnalyticsUploads.papayaOn(true));
        assertEquals(AnalyticsUploads.ROUTE + ": 2 lists, 2 items, 0 removed", counterLine());
    }

    /** Facebook's own off answer stands whatever the switch says, and isn't counted as held. */
    @Test
    public void papayaOffInFacebooksConfigStaysOff() {
        assertFalse(AnalyticsUploads.papayaOn(false));
        Settings.HOLD_ANALYTICS_UPLOADS.save(false);
        assertFalse(AnalyticsUploads.papayaOn(false));
        assertNull("a job Facebook had off was counted", counterLine());
        assertEquals(FamilyNames.ANALYTICS_UPLOADS + ": invoked 2, 0 found, 0 missing", statusLine());
    }

    @Test
    public void pausedFacebookUploads() {
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(AnalyticsUploads.holdXAnalyticsUpload());
        assertTrue(AnalyticsUploads.papayaOn(true));
        PauseForTests.pause(HushfacebookPause.Reason.CRASH_LOOP);
        assertFalse(AnalyticsUploads.holdXAnalyticsUpload());
        PauseForTests.resume();
        assertTrue(AnalyticsUploads.holdXAnalyticsUpload());
    }

    /** Every upload in a session is held, not only the first. */
    @Test
    public void everyUploadIsHeldNotOnlyTheFirst() {
        for (int i = 0; i < 3; i++) assertTrue(AnalyticsUploads.holdXAnalyticsUpload());
        assertEquals(AnalyticsUploads.ROUTE + ": 3 lists, 3 items, 3 removed. Last reason: " + AnalyticsUploads.XANALYTICS
                + ". Removed: " + AnalyticsUploads.XANALYTICS + " 3", counterLine());
    }
}
