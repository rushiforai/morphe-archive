package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.preference.Preference;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.charset.StandardCharsets;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Feeds flags read from real patched APKs into the UI's existing test seams. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class CompiledSelectionUiTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void resetBuildAndPause() {
        PatchFamily.inBuildForTests = null;
        PatchFamily.capabilitiesForTests = null;
        PauseForTests.resume();
        SettingsEntry.onClosedByUser();
    }

    private static JSONArray compiledCases() throws Exception {
        String path = System.getenv("HUSHTELEGRAM_SELECTION_FACTS");
        if (path == null || path.isEmpty()) {
            JSONObject flags = new JSONObject();
            for (PatchFamily family : PatchFamily.values()) {
                flags.put(family.statusMethod, SettingsStatus.class.getMethod(family.statusMethod).invoke(null));
            }
            for (PatchFamily.Capability capability : PatchFamily.Capability.values()) {
                flags.put(capability.statusMethod, SettingsStatus.class.getMethod(capability.statusMethod).invoke(null));
            }
            // Ordinary unit runs still exercise the uninjected settings-only screen.
            return new JSONArray().put(new JSONObject().put("case", "settings-only")
                    .put("passed", true).put("refused", false).put("settings", true).put("flags", flags));
        }
        JSONArray cases = new JSONArray(new String(Files.readAllBytes(Paths.get(path)), StandardCharsets.UTF_8));
        assertEquals("both complete bounded fixture matrices are required", 128, cases.length());
        Set<String> identities = new HashSet<>();
        int web = 0, beta = 0;
        for (int i = 0; i < cases.length(); i++) {
            JSONObject item = cases.getJSONObject(i);
            assertTrue(item.getBoolean("passed"));
            String target = item.getString("packageName");
            assertTrue(identities.add(target + "/" + item.getString("case")));
            if (target.equals("org.telegram.messenger.web")) web++;
            else if (target.equals("org.telegram.messenger.beta")) beta++;
            else throw new AssertionError("undeclared compiled target");
        }
        assertEquals(64, web);
        assertEquals(64, beta);
        return cases;
    }

    private static Set<PatchFamily> useCompiledFlags(JSONObject flags) throws Exception {
        Set<PatchFamily> families = EnumSet.noneOf(PatchFamily.class);
        Set<PatchFamily.Capability> capabilities = EnumSet.noneOf(PatchFamily.Capability.class);
        for (PatchFamily family : PatchFamily.values()) {
            if (flags.getBoolean(family.statusMethod)) families.add(family);
        }
        for (PatchFamily.Capability capability : PatchFamily.Capability.values()) {
            if (flags.getBoolean(capability.statusMethod)) {
                assertTrue("a capability cannot outlive its omitted family", families.contains(capability.family));
                capabilities.add(capability);
            }
        }
        PatchFamily.inBuildForTests = families;
        PatchFamily.capabilitiesForTests = capabilities;
        assertEquals(families, PatchFamily.inThisBuild());
        return families;
    }

    @Test
    public void compiledFamiliesShowOnlyTheirControlsAndKeepPauseEffective() throws Exception {
        JSONArray cases = compiledCases();
        int screens = 0;
        for (int i = 0; i < cases.length(); i++) {
            JSONObject item = cases.getJSONObject(i);
            if (item.getBoolean("refused")) continue;
            if (!item.getBoolean("settings")) {
                assertEquals("credential-only selections do not inject an extension", 0, item.getInt("addedMethods"));
                assertEquals(0, item.getJSONObject("flags").length());
                continue;
            }
            Set<PatchFamily> families = useCompiledFlags(item.getJSONObject("flags"));
            PauseForTests.resume();
            try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
                SettingsEntry.openFromNative(controller.get());
                SettingsEntry.openFromNative(controller.get());
                ShadowLooper.idleMainLooper();
                List<android.app.Fragment> dialogs = controller.get().getFragmentManager().getFragments();
                assertEquals(1, dialogs.stream().filter(fragment -> fragment instanceof SettingsDialog).count());
                SettingsDialog dialog = (SettingsDialog) dialogs.stream()
                        .filter(fragment -> fragment instanceof SettingsDialog).findFirst().get();
                HushTelegramPreferenceFragment page = (HushTelegramPreferenceFragment) dialog.getChildFragmentManager()
                        .findFragmentById(SettingsDialog.CONTAINER_ID);
                assertNotNull(page);
                for (PatchFamily family : PatchFamily.values()) {
                    for (BooleanSetting setting : family.switches) {
                        Preference row = page.findPreference(setting.key);
                        assertEquals(item.getString("case") + "/" + setting.key, families.contains(family), row != null);
                        if (row != null) {
                            assertNotNull(row.getTitle());
                            BooleanSetting.privateSetValue(setting, true);
                            assertTrue(setting.get());
                        }
                    }
                }
                assertEquals(families.contains(PatchFamily.REPAIR_FIREBASE_PUSH),
                        page.findPreference("local_notification_status") != null);
                PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
                for (PatchFamily family : families) {
                    for (BooleanSetting setting : family.switches) {
                        assertFalse("Pause did not reach a compiled family's switch", setting.get());
                        assertTrue("Pause changed the saved switch", setting.savedValue());
                    }
                }
                PauseForTests.resume();
                for (PatchFamily family : families) for (BooleanSetting setting : family.switches) assertTrue(setting.get());
                screens++;
                SettingsEntry.onClosedByUser();
            }
        }
        String evidencePath = System.getenv("HUSHTELEGRAM_SELECTION_FACTS");
        assertEquals(evidencePath == null || evidencePath.isEmpty() ? 1 : 96, screens);
    }

    @Test
    public void compiledCapabilitiesStayTruthfulInCoverageReports() throws Exception {
        JSONArray cases = compiledCases();
        for (int i = 0; i < cases.length(); i++) {
            JSONObject item = cases.getJSONObject(i);
            if (item.getBoolean("refused") || !item.getBoolean("settings")) continue;
            JSONObject flags = item.getJSONObject("flags");
            Set<PatchFamily> families = useCompiledFlags(flags);
            List<String> report = PatchFamily.reportLines(families, false);
            for (PatchFamily family : PatchFamily.values()) {
                Set<PatchFamily.Capability> installed = EnumSet.noneOf(PatchFamily.Capability.class);
                for (PatchFamily.Capability capability : family.expectedCapabilities()) {
                    if (flags.getBoolean(capability.statusMethod)) installed.add(capability);
                }
                assertEquals(installed, family.installedCapabilities());
                if (!families.contains(family) || family.expectedCapabilities().isEmpty()) continue;
                String prefix = family.patchName + " coverage: ";
                String coverage = report.stream().filter(line -> line.startsWith(prefix)).findFirst().orElseThrow(AssertionError::new);
                for (PatchFamily.Capability capability : installed) assertTrue(coverage.contains(capability.label));
                assertEquals(installed.size() < family.expectedCapabilities().size(), coverage.contains("; missing: "));
            }
        }
    }
}
