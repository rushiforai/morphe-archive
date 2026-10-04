/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtelegram.extension.telegram.settings;

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

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.preference.LogBufferManager;

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
        Settings.HIDE_ADS.resetToDefault();
        Settings.DISABLE_ANALYTICS.resetToDefault();
        Settings.DISABLE_UPDATE_CHECKS.resetToDefault();
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
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.CHANNEL_ADS,
                PatchFamily.Capability.SEARCH_ADS, PatchFamily.Capability.READ_METRICS);
        Set<PatchFamily.Capability> expectedAds = EnumSet.of(PatchFamily.Capability.CHANNEL_ADS,
                PatchFamily.Capability.VIDEO_ADS, PatchFamily.Capability.SEARCH_ADS);
        Set<PatchFamily.Capability> installedAds = EnumSet.of(PatchFamily.Capability.CHANNEL_ADS,
                PatchFamily.Capability.SEARCH_ADS);
        assertEquals(expectedAds, PatchFamily.HIDE_ADS.expectedCapabilities());
        assertEquals(installedAds, PatchFamily.HIDE_ADS.installedCapabilities());
        assertEquals(EnumSet.of(PatchFamily.Capability.DEVICE_STATS, PatchFamily.Capability.READ_METRICS,
                        PatchFamily.Capability.PREMIUM_PROMO_SHOW, PatchFamily.Capability.PREMIUM_PROMO_TAP,
                        PatchFamily.Capability.PREMIUM_PROMO_ACCEPT, PatchFamily.Capability.PREMIUM_PROMO_FAIL),
                PatchFamily.DISABLE_ANALYTICS.expectedCapabilities());
        assertEquals(EnumSet.of(PatchFamily.Capability.READ_METRICS),
                PatchFamily.DISABLE_ANALYTICS.installedCapabilities());
        assertTrue(PatchFamily.DISABLE_UPDATE_CHECKS.expectedCapabilities().isEmpty());
        assertEquals(EnumSet.of(PatchFamily.Capability.FIREBASE_CERTIFICATE_HEADER, PatchFamily.Capability.FIREBASE_LOCAL_STATUS),
                PatchFamily.REPAIR_FIREBASE_PUSH.expectedCapabilities());
        assertThrows(UnsupportedOperationException.class, () -> PatchFamily.HIDE_ADS.expectedCapabilities().clear());
        assertThrows(UnsupportedOperationException.class, () -> PatchFamily.HIDE_ADS.installedCapabilities().clear());

        Settings.HIDE_ADS.save(false);
        Settings.DISABLE_ANALYTICS.save(false);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertEquals(installedAds, PatchFamily.HIDE_ADS.installedCapabilities());
        assertEquals(EnumSet.of(PatchFamily.Capability.READ_METRICS),
                PatchFamily.DISABLE_ANALYTICS.installedCapabilities());
        assertEquals("capabilities must never become saved settings", 0, SettingsStatus.class.getDeclaredFields().length);
    }

    /** The names are Morphe Manager's, so a report and the patch list say the same thing. */
    @Test
    public void everyRuntimePatchButTheSettingsEntryIsAFamily() throws Exception {
        JSONArray patches = new JSONObject(new String(Files.readAllBytes(patchesList().toPath()),
                StandardCharsets.UTF_8)).getJSONArray("patches");
        Set<String> listed = new TreeSet<>();
        for (int i = 0; i < patches.length(); i++) {
            JSONObject patch = patches.getJSONObject(i);
            String name = patch.getString("name");
            if ("Use registered Telegram API credentials".equals(name) || "Use registered Maps API key".equals(name)) {
                assertFalse("patch-time credentials must be optional", patch.getBoolean("use"));
                JSONArray options = patch.getJSONArray("options");
                Set<String> keys = new TreeSet<>();
                for (int option = 0; option < options.length(); option++) {
                    JSONObject input = options.getJSONObject(option);
                    assertFalse(input.getBoolean("required"));
                    assertTrue(input.isNull("default"));
                    keys.add(input.getString("key"));
                }
                Set<String> expected = "Use registered Telegram API credentials".equals(name)
                        ? new TreeSet<>(Arrays.asList("apiId", "apiHash"))
                        : Collections.singleton("apiKey");
                assertEquals(expected, keys);
                assertEquals(expected.size(), options.length());
            } else listed.add(patch.getString("name"));
        }
        assertTrue("the settings entry left the patch list", listed.remove("HushTelegram settings"));

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

    /**
     * Every family in this build has a switch, so none has a {@link PatchFamily#staysWhilePaused}
     * of its own, and a real build's summary is always null (asserted first, below). The rest of
     * this test substitutes one through {@link PatchFamily#staysWhilePausedForTests} to keep the
     * sentence-building logic, including its pluralization, covered.
     */
    @Test
    public void theStaysRowNamesWhatPauseCantReach() {
        assertNull("a build of switches alone has nothing that stays in",
                PatchFamily.staysWhilePausedSummary(EnumSet.of(PatchFamily.HIDE_ADS,
                        PatchFamily.DISABLE_ANALYTICS, PatchFamily.DISABLE_UPDATE_CHECKS)));

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
        two.put(PatchFamily.DISABLE_ANALYTICS, "the device stats endpoint rewritten when you patched");
        PatchFamily.staysWhilePausedForTests = two;
        assertEquals("The sponsored message cache cleared when you patched (" + L10n.isolate("Hide ads")
                        + ") and the device stats endpoint rewritten when you patched ("
                        + L10n.isolate("Disable analytics")
                        + "). They were set when you patched, so Pause can't turn them off. To rule one out, patch "
                        + "again and leave out the patch in brackets after it.",
                PatchFamily.staysWhilePausedSummary(EnumSet.of(PatchFamily.HIDE_ADS, PatchFamily.DISABLE_ANALYTICS)));

        String everything = PatchFamily.staysWhilePausedSummary(EnumSet.allOf(PatchFamily.class));
        for (Map.Entry<PatchFamily, String> entry : two.entrySet()) {
            assertTrue(entry.getKey().patchName + " is missing from: " + everything,
                    everything.toLowerCase().contains(entry.getValue().toLowerCase()));
            assertTrue(entry.getKey().patchName + " isn't named in: " + everything,
                    everything.contains("(" + L10n.isolate(entry.getKey().patchName) + ")"));
        }
        // DISABLE_UPDATE_CHECKS has no override here, so it contributes nothing of its own.
        assertFalse(everything, everything.contains(L10n.isolate(PatchFamily.DISABLE_UPDATE_CHECKS.patchName)));
    }

    @Test
    public void theReportSaysWhatASwitchRunsAndWhatStaysIn() {
        Set<PatchFamily> build = EnumSet.of(PatchFamily.HIDE_ADS, PatchFamily.DISABLE_ANALYTICS);
        PatchFamily.inBuildForTests = build;
        Settings.DISABLE_ANALYTICS.save(false);

        List<String> running = PatchFamily.reportLines(build, false);
        assertEquals(Arrays.asList(
                "Hide ads: on (hushtelegram_hide_ads=on)",
                "Disable analytics: disabled by its switch (hushtelegram_disable_analytics=off)",
                "not in this build: Hide Stories, Hide recommendations, Hide Premium, gifts and Stars, Hide promotional banners, Hide sponsored proxy channel, Hide popular apps, Disable chat swipe actions, Disable pull to next channel, Quiet contacts nag, Holiday look all year, Disable call debug upload, Disable draft link previews, Gallery camera on tap, Open links externally, Strip link tracking, Disable update checks, Repair Firebase push registration",
                "Hide ads coverage: channel ads, video ads, search ads",
                "Disable analytics coverage: device statistics reports, channel read metrics, Premium promo views, Premium promo taps, Premium promo accepts, Premium promo failures"),
                running);

        // Every family in this build has a switch, but the line still has room, after the switch's
        // own state, for something a patch set that Pause can't reach. staysWhilePausedForTests
        // substitutes one, since no family here needs it for real.
        PatchFamily.staysWhilePausedForTests = Collections.singletonMap(PatchFamily.HIDE_ADS,
                "the sponsored message cache cleared when you patched");
        assertEquals("Hide ads: on (hushtelegram_hide_ads=on); stays in while paused: "
                        + "the sponsored message cache cleared when you patched",
                PatchFamily.reportLines(build, false).get(0));

        List<String> paused = PatchFamily.reportLines(build, true);
        assertEquals("Hide ads: disabled while paused (saved hushtelegram_hide_ads=on); stays in while paused: "
                + "the sponsored message cache cleared when you patched", paused.get(0));
        assertEquals("Disable analytics: disabled while paused (saved hushtelegram_disable_analytics=off)",
                paused.get(1));
        assertEquals(running.get(2), paused.get(2));
        assertEquals("Pause must keep patch-time coverage facts", running.subList(3, 5), paused.subList(3, 5));
    }

    @Test
    public void partialCoverageNamesEveryMissingTargetInTheReportWhileOffAndPaused() {
        Set<PatchFamily> build = EnumSet.of(PatchFamily.HIDE_ADS, PatchFamily.DISABLE_ANALYTICS);
        PatchFamily.inBuildForTests = build;
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.CHANNEL_ADS,
                PatchFamily.Capability.READ_METRICS);
        List<String> running = PatchFamily.reportLines(build, false);
        assertTrue(running.toString(), running.contains("Hide ads coverage: channel ads; missing: video ads, search ads"));
        assertTrue(running.toString(), running.contains("Disable analytics coverage: channel read metrics; missing: device statistics reports, Premium promo views, Premium promo taps, Premium promo accepts, Premium promo failures"));
        Settings.HIDE_ADS.save(false);
        Settings.DISABLE_ANALYTICS.save(false);
        List<String> disabled = PatchFamily.reportLines(build, false);
        assertEquals(running.subList(3, 5), disabled.subList(3, 5));
        assertEquals(running.subList(3, 5), PatchFamily.reportLines(build, true).subList(3, 5));

        PatchFamily.capabilitiesForTests = EnumSet.noneOf(PatchFamily.Capability.class);
        List<String> none = PatchFamily.reportLines(build, false);
        assertTrue(none.toString(), none.contains("Hide ads coverage: none; missing: channel ads, video ads, search ads"));
        assertTrue(none.toString(), none.contains("Disable analytics coverage: none; missing: device statistics reports, channel read metrics, Premium promo views, Premium promo taps, Premium promo accepts, Premium promo failures"));
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
        HookStatus.invoked(FamilyNames.HIDE_ADS);
        HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);

        List<String> lines = HookStatus.report(" (paused)");
        assertTrue(String.join("\n", lines),
                lines.contains("Hide ads: invoked 1, 0 found, 0 missing (paused)"));
        assertTrue(String.join("\n", lines),
                lines.contains("Disable analytics: invoked 1, 0 found, 0 missing (paused)"));
    }

    /** The section goes through the redactor like every other one, and has to come out whole. */
    @Test
    public void theExportCarriesTheSectionWhole() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        LogBufferManager.registerReportSection(PatchFamily.REPORT);
        // A paused process always makes a report, so nothing else has to go wrong first.
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);

        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("\n[PATCHES]\n"));
        assertTrue(report, report.contains("what was set when patching stays in"));
        for (String line : PatchFamily.reportLines(EnumSet.allOf(PatchFamily.class), true)) {
            assertTrue("the export changed or lost \"" + line + "\":\n" + report, report.contains("\n" + line + "\n"));
        }
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
