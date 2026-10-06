/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.io.File;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collectors;

import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.BooleanSetting;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;
import app.hushpinterest.extension.shared.settings.preference.LogBufferManager;

/**
 * The one list the settings screen and the diagnostic report read to say what Pause turns off
 * and what it can't reach. It has to cover every switch, every patch and every status flag, or
 * one of them goes unmentioned.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PatchFamilyTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PatchFamily.inBuildForTests = null;
        PatchFamily.staysWhilePausedForTests = null;
        PatchFamily.capabilitiesForTests = null;
        PauseForTests.resume();
        for (BooleanSetting setting : PausedHooksTest.settingsSwitches()) setting.resetToDefault();
        HookStatus.clear();
    }

    /**
     * A switch is a family's, or the settings entry's own (the release check), and never both: a
     * switch in neither list goes unmentioned by the screen and the tests that hold Pause to it.
     */
    @Test
    public void everySwitchBelongsToExactlyOneFamily() {
        Map<BooleanSetting, String> owners = new HashMap<>();
        for (PatchFamily family : PatchFamily.values()) {
            for (BooleanSetting setting : family.switches) {
                String earlier = owners.put(setting, family.name());
                assertNull(setting.key + " belongs to " + earlier + " and to " + family, earlier);
            }
        }
        for (BooleanSetting setting : PatchFamily.ENTRY_SWITCHES) {
            String earlier = owners.put(setting, "the settings entry");
            assertNull(setting.key + " belongs to " + earlier + " and to the settings entry", earlier);
        }
        assertEquals(new HashSet<>(PausedHooksTest.settingsSwitches()), owners.keySet());
        assertTrue("the release check is the settings entry's own",
                PatchFamily.ENTRY_SWITCHES.contains(Settings.CHECK_FOR_RELEASES));
    }

    @Test
    public void everyStatusFlagBelongsToExactlyOneFamily() {
        Set<String> flags = new TreeSet<>();
        for (Method method : SettingsStatus.class.getDeclaredMethods()) {
            int modifiers = method.getModifiers();
            if (Modifier.isPublic(modifiers) && Modifier.isStatic(modifiers)
                    && method.getReturnType() == boolean.class && method.getParameterCount() == 0) {
                flags.add(method.getName());
            }
        }
        Set<String> named = new TreeSet<>();
        for (PatchFamily family : PatchFamily.values()) {
            assertTrue("two families share " + family.statusMethod, named.add(family.statusMethod));
            for (PatchFamily.Capability capability : family.expectedCapabilities()) {
                assertEquals("a target belongs to the wrong family", family, capability.family);
                assertTrue("two targets share " + capability.statusMethod, named.add(capability.statusMethod));
            }
        }
        assertEquals(flags, named);
    }

    @Test
    public void capabilityListsAreImmutableBuildFactsIndependentOfSavedSwitchesAndPause() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.FEED_ADS);
        Set<PatchFamily.Capability> expectedAds = EnumSet.of(PatchFamily.Capability.FEED_ADS,
                PatchFamily.Capability.AD_VIEWS, PatchFamily.Capability.GOOGLE_ADS);
        Set<PatchFamily.Capability> installedAds = EnumSet.of(PatchFamily.Capability.FEED_ADS);
        assertEquals(expectedAds, PatchFamily.HIDE_ADS.expectedCapabilities());
        assertEquals(installedAds, PatchFamily.HIDE_ADS.installedCapabilities());
        assertEquals(EnumSet.of(PatchFamily.Capability.FEED_AI_PINS), PatchFamily.HIDE_AI_PINS.expectedCapabilities());
        assertTrue(PatchFamily.HIDE_AI_PINS.installedCapabilities().isEmpty());
        assertThrows(UnsupportedOperationException.class, () -> PatchFamily.HIDE_ADS.expectedCapabilities().clear());
        assertThrows(UnsupportedOperationException.class, () -> PatchFamily.HIDE_ADS.installedCapabilities().clear());

        Settings.HIDE_ADS.save(false);
        Settings.HIDE_AI_PINS.save(false);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertEquals(installedAds, PatchFamily.HIDE_ADS.installedCapabilities());
        assertTrue(PatchFamily.HIDE_AI_PINS.installedCapabilities().isEmpty());
        assertEquals("capabilities must never become saved settings", 0, SettingsStatus.class.getDeclaredFields().length);
    }

    /** The names are Morphe Manager's, so a report and the patch list say the same thing. */
    @Test
    public void everyPatchButTheSettingsEntryIsAFamily() throws Exception {
        JSONArray patches = new JSONObject(new String(Files.readAllBytes(patchesList().toPath()),
                StandardCharsets.UTF_8)).getJSONArray("patches");
        Set<String> listed = new TreeSet<>();
        for (int i = 0; i < patches.length(); i++) listed.add(patches.getJSONObject(i).getString("name"));
        assertTrue("the settings entry left the patch list", listed.remove("HushPinterest settings"));

        Set<String> families = new TreeSet<>();
        for (PatchFamily family : PatchFamily.values()) families.add(family.patchName);
        assertEquals(listed, families);
    }

    @Test
    public void aPatchWithNoSwitchSaysWhatOfItStaysIn() {
        for (PatchFamily family : PatchFamily.values()) {
            if (family.switches.isEmpty()) {
                assertNotNull(family.patchName + " has no switch, so Pause can't reach it", family.staysWhilePaused);
            }
        }
    }

    /** Firebase's manifest flag stays set even when its runtime upload switch answers off. */
    @Test
    public void firebaseManifestDeactivationIsDisclosedWithAnalyticsOnOffAndPaused() {
        Set<PatchFamily> build = EnumSet.of(PatchFamily.DISABLE_ANALYTICS);
        String permanent = "Firebase Analytics collection is disabled";
        String summary = permanent + " (" + L10n.isolate("Disable analytics")
                + "). It was set when you patched, so Pause can't turn it off. To rule it out, patch again "
                + "and leave out that patch.";
        assertEquals(permanent, PatchFamily.DISABLE_ANALYTICS.staysWhilePaused);
        assertTrue(PatchFamily.DISABLE_ANALYTICS.switches.contains(Settings.DISABLE_ANALYTICS));
        assertEquals(summary, PatchFamily.staysWhilePausedSummary(build));
        assertEquals(summary, PatchFamily.staysWhilePausedSummary(EnumSet.allOf(PatchFamily.class)));
        Set<PatchFamily> withoutAnalytics = EnumSet.allOf(PatchFamily.class);
        withoutAnalytics.remove(PatchFamily.DISABLE_ANALYTICS);
        assertNull(PatchFamily.staysWhilePausedSummary(withoutAnalytics));

        Settings.DISABLE_ANALYTICS.save(true);
        assertEquals("Disable analytics: on (hushpinterest_disable_analytics=on); stays in while paused: "
                + permanent, PatchFamily.reportLines(build, false).get(0));
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertFalse(Settings.DISABLE_ANALYTICS.get());
        assertTrue(Settings.DISABLE_ANALYTICS.savedValue());
        assertEquals("Disable analytics: disabled while paused (saved hushpinterest_disable_analytics=on); "
                + "stays in while paused: " + permanent, PatchFamily.reportLines(build, true).get(0));
        assertEquals(summary, PatchFamily.staysWhilePausedSummary(build));

        PauseForTests.resume();
        Settings.DISABLE_ANALYTICS.save(false);
        assertEquals("Disable analytics: disabled by its switch (hushpinterest_disable_analytics=off); "
                + "stays in while paused: " + permanent, PatchFamily.reportLines(build, false).get(0));
        assertEquals(summary, PatchFamily.staysWhilePausedSummary(build));
    }

    /** Synthetic exceptions keep singular and plural disclosure wording covered. */
    @Test
    public void theStaysRowNamesWhatPauseCantReach() {
        assertNull("ads and AI filtering have no permanent patch-time behavior",
                PatchFamily.staysWhilePausedSummary(EnumSet.of(PatchFamily.HIDE_ADS, PatchFamily.HIDE_AI_PINS)));

        // Each item names the patch Morphe Manager lists it under, so the reader knows which one
        // to leave out.
        PatchFamily.staysWhilePausedForTests = Collections.singletonMap(PatchFamily.HIDE_ADS,
                "the sponsored message cache cleared when you patched");
        assertEquals("The sponsored message cache cleared when you patched (" + L10n.isolate("Hide ads")
                        + "). It was set when you patched, so Pause can't turn it off. To rule it out, patch again "
                        + "and leave out that patch.",
                PatchFamily.staysWhilePausedSummary(EnumSet.of(PatchFamily.HIDE_ADS)));

        Map<PatchFamily, String> two = new LinkedHashMap<>();
        two.put(PatchFamily.HIDE_ADS, "the sponsored message cache cleared when you patched");
        two.put(PatchFamily.HIDE_AI_PINS, "the label filter set when you patched");
        PatchFamily.staysWhilePausedForTests = two;
        assertEquals("The sponsored message cache cleared when you patched (" + L10n.isolate("Hide ads")
                        + ") and the label filter set when you patched ("
                        + L10n.isolate("Hide AI-labeled pins")
                        + "). They were set when you patched, so Pause can't turn them off. To rule one out, patch "
                        + "again and leave out the patch in brackets after it.",
                PatchFamily.staysWhilePausedSummary(EnumSet.of(PatchFamily.HIDE_ADS, PatchFamily.HIDE_AI_PINS)));

        String everything = PatchFamily.staysWhilePausedSummary(EnumSet.allOf(PatchFamily.class));
        assertTrue(everything, everything.contains("Firebase Analytics collection is disabled ("
                + L10n.isolate("Disable analytics") + ")"));
        for (Map.Entry<PatchFamily, String> entry : two.entrySet()) {
            assertTrue(entry.getKey().patchName + " is missing from: " + everything,
                    everything.toLowerCase().contains(entry.getValue().toLowerCase()));
            assertTrue(entry.getKey().patchName + " isn't named in: " + everything,
                    everything.contains("(" + L10n.isolate(entry.getKey().patchName) + ")"));
        }
    }

    @Test
    public void theReportSaysWhatASwitchRunsAndWhatStaysIn() {
        Set<PatchFamily> build = EnumSet.of(PatchFamily.HIDE_ADS, PatchFamily.HIDE_AI_PINS);
        PatchFamily.inBuildForTests = build;
        Settings.HIDE_AI_PINS.save(false);

        List<String> running = PatchFamily.reportLines(build, false);
        assertEquals(Arrays.asList(
                "Hide ads: on (hushpinterest_hide_ads=on)",
                "Hide AI-labeled pins: disabled by its switch (hushpinterest_hide_ai_pins=off)"),
                running.subList(0, 2));
        assertEquals(Arrays.asList(
                "Hide ads coverage: promoted pins in lists, ad-only views, Google ad SDK start",
                "Hide AI-labeled pins coverage: AI-labeled pins in lists"),
                coverageLines(running));
        assertTrue(PatchFamily.reportLines(EnumSet.of(PatchFamily.HIDE_ADS), false)
                .stream().anyMatch(line -> line.startsWith("not in this build: Hide AI-labeled pins")));

        // A simulated permanent ads change remains disclosed alongside its runtime switch.
        PatchFamily.staysWhilePausedForTests = Collections.singletonMap(PatchFamily.HIDE_ADS,
                "the sponsored panel override set when you patched");
        assertEquals("Hide ads: on (hushpinterest_hide_ads=on); stays in while paused: "
                        + "the sponsored panel override set when you patched",
                PatchFamily.reportLines(build, false).get(0));

        List<String> paused = PatchFamily.reportLines(build, true);
        assertEquals("Hide ads: disabled while paused (saved hushpinterest_hide_ads=on); stays in while paused: "
                + "the sponsored panel override set when you patched", paused.get(0));
        assertEquals("Hide AI-labeled pins: disabled while paused (saved hushpinterest_hide_ai_pins=off)",
                paused.get(1));
        assertEquals("Pause must keep patch-time coverage facts", coverageLines(running), coverageLines(paused));
    }

    @Test
    public void partialCoverageNamesEveryMissingTargetInTheReportWhileOffAndPaused() {
        Set<PatchFamily> build = EnumSet.of(PatchFamily.HIDE_ADS, PatchFamily.HIDE_AI_PINS);
        PatchFamily.inBuildForTests = build;
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.FEED_ADS);
        List<String> running = PatchFamily.reportLines(build, false);
        assertTrue(running.toString(), running.contains("Hide ads coverage: promoted pins in lists; missing: ad-only views, Google ad SDK start"));
        assertTrue(running.toString(), running.contains("Hide AI-labeled pins coverage: none; missing: AI-labeled pins in lists"));
        Settings.HIDE_ADS.save(false);
        Settings.HIDE_AI_PINS.save(false);
        List<String> disabled = PatchFamily.reportLines(build, false);
        assertEquals(coverageLines(running), coverageLines(disabled));
        assertEquals(coverageLines(running), coverageLines(PatchFamily.reportLines(build, true)));

        PatchFamily.capabilitiesForTests = EnumSet.noneOf(PatchFamily.Capability.class);
        List<String> none = PatchFamily.reportLines(build, false);
        assertTrue(none.toString(), none.contains("Hide ads coverage: none; missing: promoted pins in lists, ad-only views, Google ad SDK start"));
        assertTrue(none.toString(), none.contains("Hide AI-labeled pins coverage: none; missing: AI-labeled pins in lists"));
    }

    /**
     * A paused export marks the Hook status lines of the families a switch runs. Every family in
     * this build has one, so registerDiagnostics() exempts none of them: each invoked family's line
     * gets the mark. The exemption itself, for a family with no switch, is HookStatus's own and is
     * covered directly in HookStatusTest, since no family here can drive it.
     */
    @Test
    public void aPausedExportMarksEveryFamilyASwitchRuns() {
        HookStatus.clear();
        PatchFamily.registerDiagnostics();
        for (PatchFamily family : PatchFamily.values()) HookStatus.invoked(family.patchName);

        List<String> lines = HookStatus.report(" (paused)");
        for (PatchFamily family : PatchFamily.values()) {
            assertTrue(String.join("\n", lines),
                    lines.contains(family.patchName + ": invoked 1, 0 found, 0 missing (paused)"));
        }
    }

    /** The section goes through the redactor like every other one, and has to come out whole. */
    @Test
    public void theExportCarriesTheSectionWhole() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        LogBufferManager.registerReportSection(PatchFamily.REPORT);
        // A paused process always makes a report, so nothing else has to go wrong first.
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);

        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("\n[PATCHES]\n"));
        assertTrue(report, report.contains("what was set when patching stays in"));
        for (String line : PatchFamily.reportLines(EnumSet.allOf(PatchFamily.class), true)) {
            assertTrue("the export changed or lost \"" + line + "\":\n" + report, report.contains("\n" + line + "\n"));
        }
    }

    private static List<String> coverageLines(List<String> lines) {
        return lines.stream().filter(line -> line.contains(" coverage: ")).collect(Collectors.toList());
    }

    /** patches-list.json at the repository root, found from wherever Gradle runs the test. */
    private static File patchesList() {
        for (File dir = new File("").getAbsoluteFile(); dir != null; dir = dir.getParentFile()) {
            File candidate = new File(dir, "patches-list.json");
            if (candidate.isFile()) return candidate;
        }
        throw new AssertionError("no patches-list.json above " + new File("").getAbsolutePath());
    }
}
