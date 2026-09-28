package app.morphe.extension.tiktok.featuregatelab;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.ApplicationInfo;

import app.morphe.extension.shared.BuildNames;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.SettingsBackup;

import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * The Lab is for the TikTok build that is installed, and a rule moves between builds only where
 * both builds' catalogs carry its gate unchanged.
 *
 * <p>The gates below are ones the two declared builds' catalogs agree or disagree on:
 * 1005_max_limit_count_daily, AWEDanmakuSupportMask and the lynxview_command_blacklist read are
 * identical on 47.0.3 and 47.1.3; low_memory_kill_monitor's default moved from 25 to 89;
 * comment_cell_badge_dedup is gone from 47.1.3; and the SettingsManager read
 * drama_innerfeed_lynxcard_delete_card_on_error_config has a model R8 renamed.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class FeatureGateLabBuildChangeTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    @Before
    public void setUp() {
        BuildNames.setRunningBuildForTests("47.0.3");
        FeatureGateLabStore.resetAllLabData();
        FeatureGateLabStore.consumeMigrationNotice();
        FeatureGateLabRuntime.clearTriggered();
        FeatureGateLabRuntime.reloadRules();
    }

    @After
    public void tearDown() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        BuildNames.setRunningBuildForTests("47.0.3");
        FeatureGateLabStore.resetAllLabData();
        FeatureGateLabStore.consumeMigrationNotice();
        FeatureGateLabRuntime.reloadRules();
        BuildNames.setRunningBuildForTests(null);
    }

    @Test
    public void theTargetEveryExportNamesIsTheInstalledBuild() throws Exception {
        for (String build : new String[]{"47.0.3", "47.1.3"}) {
            BuildNames.setRunningBuildForTests(build);
            assertEquals(build, FeatureGateLabStore.targetVersion());
            assertEquals(build, new JSONObject(FeatureGateLabStore.exportProfile()).getString("tiktok_version"));
            JSONObject backup = new JSONObject(SettingsBackup.create(false));
            assertEquals(build, backup.getString("target"));
            assertEquals(build, backup.getJSONObject("lab").getString("tiktok_version"));
        }
    }

    @Test
    public void anUpgradeKeepsOnlyTheRulesWhoseGatesDidNotChange() {
        FeatureGateLabStore.setMasterEnabled(true);
        save("abmock", "1005_max_limit_count_daily", "INT", "9", true);
        save("player_config", "AWEDanmakuSupportMask", "BOOLEAN", "true", true);
        save("settings_manager", "lynxview_command_blacklist", "OBJECT", "{\"LIZ\":true}", true);
        save("abmock", "low_memory_kill_monitor", "INT", "50", true);
        save("abmock", "comment_cell_badge_dedup", "BOOLEAN", "true", true);
        save("settings_manager", "drama_innerfeed_lynxcard_delete_card_on_error_config", "OBJECT",
                "{\"LIZ\":true}", true);
        // The same gate under a type its catalog row doesn't carry, and one no catalog has.
        save("abmock", "1005_max_limit_count_daily", "LONG", "9", true);
        save("abmock", "only_seen_at_runtime", "BOOLEAN", "true", true);
        // Already off: left off, and not counted as turned off.
        save("abmock", "comment_cell_bind_dedup", "BOOLEAN", "true", false);
        assertEquals(9, FeatureGateLabRuntime.overrideInt("1005_max_limit_count_daily", 5));
        assertEquals(50, FeatureGateLabRuntime.overrideInt("low_memory_kill_monitor", 25));

        upgradeTo("47.1.3");

        assertTrue(enabled("abmock", "1005_max_limit_count_daily", "INT"));
        assertTrue(enabled("player_config", "AWEDanmakuSupportMask", "BOOLEAN"));
        assertTrue(enabled("settings_manager", "lynxview_command_blacklist", "OBJECT"));
        assertFalse("a gate whose default moved", enabled("abmock", "low_memory_kill_monitor", "INT"));
        assertFalse("a gate 47.1.3 dropped", enabled("abmock", "comment_cell_badge_dedup", "BOOLEAN"));
        assertFalse("a SettingsManager model R8 renamed",
                enabled("settings_manager", "drama_innerfeed_lynxcard_delete_card_on_error_config", "OBJECT"));
        assertFalse("a type the catalog doesn't carry", enabled("abmock", "1005_max_limit_count_daily", "LONG"));
        assertFalse("a gate no catalog has", enabled("abmock", "only_seen_at_runtime", "BOOLEAN"));
        assertFalse(enabled("abmock", "comment_cell_bind_dedup", "BOOLEAN"));
        // Every rule is still there to review, with the value it had.
        assertEquals("50", FeatureGateLabStore.rule("abmock", "low_memory_kill_monitor", "INT").value);
        assertTrue("the master switch keeps what carried over working", FeatureGateLabStore.masterEnabled());

        assertEquals(9, FeatureGateLabRuntime.overrideInt("1005_max_limit_count_daily", 5));
        assertEquals("a 47.0.3 rule applied on 47.1.3",
                89, FeatureGateLabRuntime.overrideInt("low_memory_kill_monitor", 89));

        assertEquals(5, FeatureGateLabStore.consumeMigrationNotice());
        assertEquals("the notice is shown once", 0, FeatureGateLabStore.consumeMigrationNotice());
    }

    @Test
    public void aBuildWithNoCatalogTurnsEveryRuleOff() {
        BuildNames.setRunningBuildForTests("47.1.3");
        FeatureGateLabStore.resetAllLabData();
        FeatureGateLabStore.setMasterEnabled(true);
        save("abmock", "1005_max_limit_count_daily", "INT", "9", true);
        save("player_config", "AWEDanmakuSupportMask", "BOOLEAN", "true", true);

        upgradeTo("47.2.1");

        assertEquals("47.2.1", FeatureGateLabStore.targetVersion());
        assertFalse(enabled("abmock", "1005_max_limit_count_daily", "INT"));
        assertFalse(enabled("player_config", "AWEDanmakuSupportMask", "BOOLEAN"));
        assertEquals(5, FeatureGateLabRuntime.overrideInt("1005_max_limit_count_daily", 5));
        assertEquals(2, FeatureGateLabStore.consumeMigrationNotice());
    }

    @Test
    public void aSecondaryProcessAppliesNoRuleBeforeTheMainProcessMovesThem() {
        FeatureGateLabStore.setMasterEnabled(true);
        save("abmock", "1005_max_limit_count_daily", "INT", "9", true);
        save("abmock", "low_memory_kill_monitor", "INT", "50", true);

        Context app = RuntimeEnvironment.getApplication();
        Utils.setContext(new ContextWrapper(app) {
            @Override public ApplicationInfo getApplicationInfo() {
                ApplicationInfo info = new ApplicationInfo(super.getApplicationInfo());
                info.processName = app.getPackageName() + ":push";
                return info;
            }
        });
        BuildNames.setRunningBuildForTests("47.1.3");
        FeatureGateLabRuntime.reloadRules();
        assertFalse(Utils.isMainProcess());
        assertEquals("a rule stored for 47.0.3 applied in a 47.1.3 process that hadn't checked it",
                89, FeatureGateLabRuntime.overrideInt("low_memory_kill_monitor", 89));
        assertEquals(5, FeatureGateLabRuntime.overrideInt("1005_max_limit_count_daily", 5));

        Utils.setContext(app);
        FeatureGateLabRuntime.reloadRules();
        assertEquals("the main process moved the rules and applies what carried over",
                9, FeatureGateLabRuntime.overrideInt("1005_max_limit_count_daily", 5));
        assertEquals(89, FeatureGateLabRuntime.overrideInt("low_memory_kill_monitor", 89));
    }

    @Test
    public void aBackupFromTheOtherDeclaredBuildRestoresOnlyCompatibleRulesOn() throws Exception {
        FeatureGateLabStore.setMasterEnabled(true);
        save("abmock", "1005_max_limit_count_daily", "INT", "9", true);
        save("abmock", "low_memory_kill_monitor", "INT", "50", true);
        String backup = SettingsBackup.create(false);
        assertEquals("47.0.3", new JSONObject(backup).getString("target"));

        BuildNames.setRunningBuildForTests("47.1.3");
        FeatureGateLabStore.resetAllLabData();
        FeatureGateLabStore.consumeMigrationNotice();
        SettingsBackup.restore(Utils.getContext(), backup, true);

        assertFalse("the Lab half was left out", SettingsBackup.labRulesWereSkipped(backup));
        assertTrue(enabled("abmock", "1005_max_limit_count_daily", "INT"));
        assertNotNull(FeatureGateLabStore.rule("abmock", "low_memory_kill_monitor", "INT"));
        assertFalse("a restore put a changed gate's rule back on",
                enabled("abmock", "low_memory_kill_monitor", "INT"));
        assertTrue(FeatureGateLabStore.masterEnabled());
        assertEquals(1, FeatureGateLabStore.consumeMigrationNotice());
        // What is stored now is 47.1.3's, and a backup of it says so.
        assertEquals("47.1.3", new JSONObject(SettingsBackup.create(false)).getString("target"));
    }

    private static void upgradeTo(String build) {
        BuildNames.setRunningBuildForTests(build);
        FeatureGateLabRuntime.reloadRules();
        // The first open of the store on the new build moves the rules.
        FeatureGateLabStore.rules();
    }

    private static void save(String manager, String key, String type, String value, boolean enabled) {
        assertTrue(key, FeatureGateLabStore.saveRule(manager, key, type, value, enabled));
    }

    private static boolean enabled(String manager, String key, String type) {
        FeatureGateLabStore.Rule rule = FeatureGateLabStore.rule(manager, key, type);
        assertNotNull(manager + "/" + key + ":" + type + " was dropped", rule);
        return rule.enabled;
    }
}
