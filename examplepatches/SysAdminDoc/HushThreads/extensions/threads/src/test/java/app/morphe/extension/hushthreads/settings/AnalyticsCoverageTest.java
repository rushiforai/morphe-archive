/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.SwitchPreference;

import app.morphe.extension.hushthreads.misc.Analytics;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;

import java.util.ArrayList;
import java.util.List;

/** The coverage written at patch time stays truthful in the screen and the exported report. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = AnalyticsCoverageTest.Status.class,
        instrumentedPackages = "app.morphe.extension.hushthreads.settings")
@SuppressWarnings("deprecation")
public class AnalyticsCoverageTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Implements(SettingsStatus.class)
    public static class Status {
        static boolean included;
        static int mask;

        @Implementation protected static boolean disableAnalytics() { return included; }
        @Implementation protected static int analyticsAddressMask() { return mask; }
    }

    @After
    public void restore() {
        Status.included = false;
        Status.mask = 0;
        PatchFamily.inBuildForTests = null;
        Settings.DISABLE_ANALYTICS.resetToDefault();
        PauseForTests.resume();
    }

    @Test
    public void allPartialSelectionsAndCompleteCoverageReachSettingsAndExport() {
        Status.included = true;
        for (int mask = 1; mask <= 7; mask++) {
            Status.mask = mask;
            List<String> matched = new ArrayList<>();
            List<String> missing = new ArrayList<>();
            String[] kinds = {"PIGEON", "DEFAULT", "MQTT"};
            for (int i = 0; i < kinds.length; i++) {
                ((mask & (1 << i)) != 0 ? matched : missing).add(kinds[i]);
            }
            String found = String.join(", ", matched);
            String absent = missing.isEmpty() ? "none" : String.join(", ", missing);
            try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
                PreferenceGroup screen = open(controller.get());
                Preference coverage = titled(screen, L10n.t("Analytics address coverage"));
                assertNotNull(coverage);
                assertEquals(L10n.f("Patched: %1$s. Missing: %2$s.", L10n.isolate(found),
                        missing.isEmpty() ? L10n.t("none") : L10n.isolate(absent)), coverage.getSummary());
                assertFalse(coverage.isSelectable());
            }
            PatchFamily.registerDiagnostics();
            PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
            String report = LogBufferManager.buildExportText();
            assertTrue(report, report.contains("\nanalytics addresses: matched=" + found + "; missing=" + absent + "\n"));
            PauseForTests.resume();
        }
    }

    @Test
    public void turningOffAndPausingRestoreAddressesWithoutErasingCoverage() {
        Status.included = true;
        Status.mask = 3;
        String original = "https://example.com/events";
        Settings.DISABLE_ANALYTICS.save(false);
        assertEquals(original, Analytics.endpoint(original));
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            PreferenceGroup screen = open(controller.get());
            SwitchPreference toggle = (SwitchPreference) titled(screen, L10n.t("Stop analytics uploads"));
            assertNotNull(toggle);
            assertFalse(toggle.isChecked());
            assertTrue(String.valueOf(titled(screen, L10n.t("Analytics address coverage")).getSummary()).contains("MQTT"));
        }
        assertTrue(PatchFamily.reportLines(PatchFamily.inThisBuild(), false).get(0).contains("disabled by its switch"));
        Settings.DISABLE_ANALYTICS.save(true);
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        assertEquals(original, Analytics.endpoint(original));
        List<String> paused = PatchFamily.reportLines(PatchFamily.inThisBuild(), true);
        assertTrue(paused.get(0).contains("disabled while paused"));
        assertTrue(paused.contains("analytics addresses: matched=PIGEON, DEFAULT; missing=MQTT"));
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            assertNotNull(titled(open(controller.get()), L10n.t("Analytics address coverage")));
        }
    }

    @Test
    public void omittingThePatchDoesNotShowPartialCoverage() {
        Status.included = false;
        Status.mask = 7;
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            PreferenceGroup screen = open(controller.get());
            assertNull(titled(screen, L10n.t("Analytics address coverage")));
            assertNull(titled(screen, L10n.t("Stop analytics uploads")));
        }
        List<String> report = PatchFamily.reportLines(PatchFamily.inThisBuild(), false);
        // Upstream 814acd23 also discloses omitted Manager defaults.
        assertEquals(2, report.size());
        assertTrue(report.get(0).contains("not in this build:"));
        assertTrue(report.get(0).contains("Disable analytics"));
        assertFalse(report.get(0).contains("analytics addresses:"));
        assertTrue(report.get(1).startsWith("left out of Manager's default selection: "));
        assertTrue(report.get(1).contains("Disable analytics"));
        assertFalse(report.get(1).contains("analytics addresses:"));
    }

    @Test
    public void anUnrecordedOrUnknownMaskDoesNotClaimCompleteCoverage() {
        Status.included = true;
        for (int mask : new int[]{0, 8}) {
            Status.mask = mask;
            try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
                Preference row = titled(open(controller.get()), L10n.t("Analytics address coverage"));
                assertNotNull(row);
                assertEquals(L10n.t("Coverage wasn't recorded in this build. Patch again to see the matched address kinds."),
                        row.getSummary());
            }
            assertTrue(PatchFamily.reportLines(PatchFamily.inThisBuild(), false)
                    .contains("analytics addresses: coverage not recorded"));
        }
    }

    private static PreferenceGroup open(Activity activity) {
        HushThreadsPreferenceFragment page = new HushThreadsPreferenceFragment();
        activity.getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
        return page.getPreferenceScreen();
    }

    private static Preference titled(PreferenceGroup group, CharSequence title) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference row = group.getPreference(i);
            if (title.toString().contentEquals(String.valueOf(row.getTitle()))) return row;
            if (row instanceof PreferenceGroup) {
                Preference found = titled((PreferenceGroup) row, title);
                if (found != null) return found;
            }
        }
        return null;
    }
}
