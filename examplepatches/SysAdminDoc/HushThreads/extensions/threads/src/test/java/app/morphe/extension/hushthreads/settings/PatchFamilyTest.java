/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.settings;

import java.util.Collections;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
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
import java.util.EnumSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

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
        PauseForTests.resume();
        Settings.HIDE_ADS.resetToDefault();
        Settings.SANITIZE_SHARING_LINKS.resetToDefault();
        Settings.DISABLE_ANALYTICS.resetToDefault();
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
        }
        assertEquals(flags, named);
    }

    /** The names are Morphe Manager's, so a report and the patch list say the same thing. */
    @Test
    public void everyPatchButTheSettingsEntryIsAFamily() throws Exception {
        JSONArray patches = new JSONObject(new String(Files.readAllBytes(patchesList().toPath()),
                StandardCharsets.UTF_8)).getJSONArray("patches");
        Set<String> listed = new TreeSet<>();
        for (int i = 0; i < patches.length(); i++) listed.add(patches.getJSONObject(i).getString("name"));
        assertTrue("the settings entry left the patch list", listed.remove("HushThreads settings"));

        Set<String> families = new TreeSet<>();
        for (PatchFamily family : PatchFamily.values()) families.add(family.patchName);
        assertEquals(listed, families);
    }

    // Contracts ported from Hushfacebook 814acd23.
    /**
     * The overview and the report name the default patches a build lacks from this list, so it has
     * to be Morphe Manager's own default selection: a new default patch fails here until it's listed.
     */
    @Test
    public void theDefaultSelectionIsTheOneManagerMakes() throws Exception {
        JSONArray patches = new JSONObject(new String(Files.readAllBytes(patchesList().toPath()),
                StandardCharsets.UTF_8)).getJSONArray("patches");
        Set<String> selected = new TreeSet<>();
        for (int i = 0; i < patches.length(); i++) {
            JSONObject patch = patches.getJSONObject(i);
            if (patch.getBoolean("use")) selected.add(patch.getString("name"));
        }
        assertTrue("the settings entry left the default selection", selected.remove("HushThreads settings"));

        Set<String> listed = new TreeSet<>();
        for (PatchFamily family : PatchFamily.DEFAULT_SELECTION) listed.add(family.patchName);
        assertEquals(selected, listed);
        // The check can fail: an opt-in patch isn't in either list.
        assertFalse(selected.contains(PatchFamily.VIDEO_AUTOPLAY.patchName));
        assertFalse(PatchFamily.DEFAULT_SELECTION.contains(PatchFamily.VIDEO_AUTOPLAY));
        assertFalse(selected.contains(PatchFamily.PURE_BLACK.patchName));
        assertFalse(PatchFamily.DEFAULT_SELECTION.contains(PatchFamily.PURE_BLACK));
    }

    /**
     * A build that lacks default patches names them, in the order the report lists families, and
     * one with every default patch names none. Opt-in patches left out are never named.
     */
    @Test
    public void theMissingDefaultsAreTheDefaultPatchesABuildLacks() {
        Set<PatchFamily> build = EnumSet.allOf(PatchFamily.class);
        assertEquals(Collections.emptyList(), PatchFamily.missingDefaults(build));
        build.remove(PatchFamily.VIDEO_AUTOPLAY);
        build.remove(PatchFamily.RETURN_REFRESH);
        build.remove(PatchFamily.PURE_BLACK);
        assertEquals(Collections.emptyList(), PatchFamily.missingDefaults(build));
        for (String line : PatchFamily.reportLines(build, false)) {
            assertFalse(line, line.startsWith("left out of Manager's default selection"));
        }

        build.remove(PatchFamily.HIDE_SUGGESTED_USERS);
        build.remove(PatchFamily.HIDE_ADS);
        assertEquals(Arrays.asList("Hide ads", "Hide suggested users"), PatchFamily.missingDefaults(build));
        List<String> lines = PatchFamily.reportLines(build, false);
        assertEquals("left out of Manager's default selection: Hide ads, Hide suggested users",
                lines.get(lines.size() - 1));
        assertEquals("not in this build: Hide ads, Hide suggested users, Block background-return feed refresh, Disable video autoplay, "
                + "Pure black dark mode", lines.get(lines.size() - 2));
    }

    /** The new line goes through the redactor like the rest of the section and comes out whole. */
    @Test
    public void theExportCarriesTheMissingDefaultsWhole() {
        Set<PatchFamily> build = EnumSet.allOf(PatchFamily.class);
        build.remove(PatchFamily.RESTORE_TRUST);
        build.remove(PatchFamily.REMOVE_AD_ID);
        PatchFamily.inBuildForTests = build;
        LogBufferManager.registerReportSection(PatchFamily.REPORT);
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);

        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("\nleft out of Manager's default selection: Remove the advertising ID, Restore screens on re-signed builds\n"));
    }

    @Test
    public void aPatchWithNoSwitchSaysWhatOfItStaysIn() {
        for (PatchFamily family : PatchFamily.values()) {
            if (family.switches.isEmpty()) {
                assertNotNull(family.patchName + " has no switch, so Pause can't reach it", family.staysWhilePaused);
            }
        }
    }

    @Test
    public void theStaysRowNamesWhatPauseCantReach() {
        assertNull("a build of switches alone has nothing that stays in",
                PatchFamily.staysWhilePausedSummary(EnumSet.of(PatchFamily.HIDE_ADS,
                        PatchFamily.SANITIZE_SHARING_LINKS, PatchFamily.DISABLE_ANALYTICS)));
        // Each item names the patch Morphe Manager lists it under, so the reader knows which one
        // to leave out.
        assertEquals("The removed advertising ID permission (" + L10n.isolate("Remove the advertising ID")
                        + "). It was set when you patched, so Pause can't turn it off. To rule it out, patch again "
                        + "and leave out that patch.",
                PatchFamily.staysWhilePausedSummary(EnumSet.of(PatchFamily.REMOVE_AD_ID)));
        assertEquals("The removed advertising ID permission (" + L10n.isolate("Remove the advertising ID")
                        + ") and the re-signed build fix (" + L10n.isolate("Restore screens on re-signed builds")
                        + "). They were set when you patched, so Pause can't turn them off. To rule one out, patch "
                        + "again and leave out the patch in brackets after it.",
                PatchFamily.staysWhilePausedSummary(EnumSet.of(PatchFamily.REMOVE_AD_ID, PatchFamily.RESTORE_TRUST,
                        PatchFamily.HIDE_ADS)));

        String everything = PatchFamily.staysWhilePausedSummary(EnumSet.allOf(PatchFamily.class));
        for (PatchFamily family : PatchFamily.values()) {
            if (family.staysWhilePaused == null) continue;
            assertTrue(family.patchName + " is missing from: " + everything,
                    everything.toLowerCase().contains(family.staysWhilePaused.toLowerCase()));
            assertTrue(family.patchName + " isn't named in: " + everything,
                    everything.contains("(" + L10n.isolate(family.patchName) + ")"));
        }
    }

    @Test
    public void theReportSaysWhatASwitchRunsAndWhatStaysIn() {
        Set<PatchFamily> build = EnumSet.of(PatchFamily.HIDE_ADS, PatchFamily.SANITIZE_SHARING_LINKS,
                PatchFamily.REMOVE_AD_ID);
        Settings.SANITIZE_SHARING_LINKS.save(false);

        List<String> running = PatchFamily.reportLines(build, false);
        assertEquals(Arrays.asList(
                "Hide ads: on (hushthreads_hide_ads=on)",
                "Sanitize sharing links: disabled by its switch (hushthreads_sanitize_sharing_links=off)",
                "Remove the advertising ID: no switch, stays in while paused: the removed advertising ID permission",
                "not in this build: Hide suggested users, Block background-return feed refresh, Disable video autoplay, Open links in browser, Disable analytics, "
                        + "Pure black dark mode, Restore screens on re-signed builds",
                "left out of Manager's default selection: Hide suggested users, Open links in browser, Disable analytics, Restore screens on re-signed builds"),
                running);
        assertEquals("Restore screens on re-signed builds: no switch, stays in while paused: the re-signed build fix",
                PatchFamily.reportLines(EnumSet.of(PatchFamily.RESTORE_TRUST), false).get(0));

        List<String> paused = PatchFamily.reportLines(build, true);
        assertEquals("Hide ads: disabled while paused (saved hushthreads_hide_ads=on)", paused.get(0));
        assertEquals("Sanitize sharing links: disabled while paused (saved hushthreads_sanitize_sharing_links=off)",
                paused.get(1));
        assertEquals("a patch with no switch reads the same paused", running.get(2), paused.get(2));
        assertEquals(running.get(3), paused.get(3));
        assertEquals(running.get(4), paused.get(4));
    }

    /**
     * A paused export marks the Hook status lines of the families a switch runs, and leaves the
     * ones with no switch alone: they keep working, and a mark would tell a reader otherwise.
     */
    @Test
    public void aPausedExportMarksOnlyTheFamiliesASwitchRuns() {
        HookStatus.clear();
        PatchFamily.registerDiagnostics();
        HookStatus.invoked(FamilyNames.HIDE_ADS);
        HookStatus.invoked(FamilyNames.RESTORE_TRUST);

        List<String> lines = HookStatus.report(" (paused)");
        assertTrue(String.join("\n", lines),
                lines.contains("Hide ads: invoked 1, 0 found, 0 missing (paused)"));
        assertTrue(String.join("\n", lines),
                lines.contains("Restore screens on re-signed builds: invoked 1, 0 found, 0 missing"));
    }

    /** The section goes through the redactor like every other one, and has to come out whole. */
    @Test
    public void theExportCarriesTheSectionWhole() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        LogBufferManager.registerReportSection(PatchFamily.REPORT);
        // A paused process always makes a report, so nothing else has to go wrong first.
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);

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
