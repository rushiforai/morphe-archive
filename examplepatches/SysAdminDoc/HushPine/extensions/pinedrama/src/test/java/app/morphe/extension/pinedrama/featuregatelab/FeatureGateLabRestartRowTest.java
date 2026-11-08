package app.morphe.extension.pinedrama.featuregatelab;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import app.morphe.extension.shared.BuildNames;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.pinedrama.settings.SettingsActivityRecreationTest.SettingsActivity;
import app.morphe.extension.pinedrama.settings.SettingsReturn;
import app.morphe.extension.pinedrama.settings.preference.RestartPendingPreference;
import app.morphe.extension.pinedrama.settings.preference.PineDramaPreferenceFragment;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

/**
 * The Lab's restart button.
 *
 * <p>A Lab change PineDrama had already read took only after a restart, and the Lab said so in a
 * toast with nothing to press. The Lab page now carries the settings pages' restart row while a
 * change waits on one, and the restart comes back to the Lab. A rule saved while overrides are
 * off changes nothing PineDrama has read, so it owes no restart and shows no row.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, qualifiers = "w480dp-h960dp-night-mdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class FeatureGateLabRestartRowTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private final List<Context> restarted = new ArrayList<>();

    @Before public void setup() throws Exception {
        Utils.awaitBackgroundTasksForTests();
        FeatureGateLabFragment.awaitFileIoForTests();
        FeatureGateCatalog.awaitForTests();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        FeatureGateCatalog.resetForTests();
        FeatureGateLabFragment.resetForTests();
        FeatureGateLabUndo.resetForTests();
        SettingsManagerObservationRecorder.clear();
        FeatureGateLabStore.resetAllLabData();
        FeatureGateLabSession.resetForTests();
        FeatureGateLabSession.begin();
        RestartPendingPreference.setRestarterForTests(restarted::add);
        var gate = entry("gate");
        var cached = FeatureGateCatalog.class.getDeclaredField("cachedSnapshot");
        cached.setAccessible(true);
        cached.set(null, new FeatureGateCatalog.Snapshot(List.of(gate),
                Map.of(gate.identity(), gate), 1, 0, true));
    }

    /** The restarter, the debt, the return marker and the fake catalogue stay with this class. */
    @After public void cleanup() throws Exception {
        Utils.awaitBackgroundTasksForTests();
        FeatureGateLabFragment.awaitFileIoForTests();
        FeatureGateCatalog.awaitForTests();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        RestartPendingPreference.setRestarterForTests(null);
        FeatureGateLabStore.resetAllLabData();
        FeatureGateLabUndo.resetForTests();
        FeatureGateCatalog.resetForTests();
        FeatureGateLabSession.resetForTests();
        BuildNames.setRunningBuildForTests(null);
        Setting.preferences.preferences.edit()
                .remove(SettingsReturn.PAGE_KEY).remove(SettingsReturn.AT_KEY).commit();
    }

    @Test public void aForcedGateShowsTheRestartRowAndItsRestartComesBackToTheLab() throws Exception {
        FeatureGateLabStore.setMasterEnabled(true);
        FeatureGateLabSession.resetForTests();
        try (var owner = Robolectric.buildActivity(LabActivity.class).setup().visible()) {
            FeatureGateLabFragment lab = attach(owner.get());
            settle();
            assertEquals("a restart is offered before anything changed",
                    View.GONE, row(lab).getVisibility());

            assertTrue(lab.runLabChangeForTests(() -> {
                FeatureGateLabUndo.forceBoolean(List.of(entry("gate")), true);
                return "";
            }));
            settle();
            TextView row = row(lab);
            assertTrue(FeatureGateLabSession.restartNeeded());
            assertEquals("the forced gate offers no restart", View.VISIBLE, row.getVisibility());
            assertEquals("Restart PineDrama to apply this change", row.getText().toString());

            assertTrue(row.performClick());
            assertEquals(1, restarted.size());
            assertEquals("the restart doesn't come back to the Lab", PineDramaPreferenceFragment.PAGE_LAB,
                    Setting.preferences.preferences.getString(SettingsReturn.PAGE_KEY, null));
        }
    }

    @Test public void aPresetSavedWithOverridesOffOwesNoRestartUntilOverridesGoOn() throws Exception {
        Map<String, FeatureGateCatalog.Entry> catalog = presetCatalog();
        try (var owner = Robolectric.buildActivity(LabActivity.class).setup().visible()) {
            FeatureGateLabFragment lab = attach(owner.get());
            settle();

            assertTrue(lab.runLabChangeForTests(() -> {
                FeatureGateLabUndo.applyPreset("47.6.3", "comment_emoji", catalog);
                return "";
            }));
            settle();
            assertFalse("the preset wrote nothing", FeatureGateLabStore.rules().isEmpty());
            assertFalse(FeatureGateLabStore.masterEnabled());
            assertFalse("rules PineDrama never read owe a restart", FeatureGateLabSession.restartNeeded());
            assertEquals(View.GONE, row(lab).getVisibility());

            // Turning overrides on hands those rules to PineDrama, which does owe one.
            assertTrue(lab.runLabChangeForTests(() -> {
                FeatureGateLabStore.setMasterEnabled(true);
                return "";
            }));
            settle();
            assertEquals(View.VISIBLE, row(lab).getVisibility());
        }
    }

    /**
     * After the restart the settings screen opens on the Lab, over the home page, so Back still
     * lands where it would have. The new process owes nothing, so the row is gone.
     */
    @Test public void aRestartFromTheLabReopensTheLabOverTheHomePage() throws Exception {
        Intent intent = new Intent().setAction("morphe_settings").putExtra("morphe", true)
                .putExtra("hushpine_settings_page", PineDramaPreferenceFragment.PAGE_LAB);
        try (var owner = Robolectric.buildActivity(SettingsActivity.class, intent).setup().visible()) {
            SettingsActivity activity = owner.get();
            settle();
            Fragment open = activity.getFragmentManager().findFragmentById(container(activity).getId());
            assertTrue("the settings screen didn't open on the Lab: " + open,
                    open instanceof FeatureGateLabFragment);
            assertEquals(1, activity.getFragmentManager().getBackStackEntryCount());
            assertEquals(View.GONE, row((FeatureGateLabFragment) open).getVisibility());

            activity.onBackPressed();
            settle();
            assertTrue("Back from the Lab didn't land on the home page",
                    activity.getFragmentManager().findFragmentById(container(activity).getId())
                            instanceof PineDramaPreferenceFragment);
            assertFalse(activity.isFinishing());
        }
    }

    private static TextView row(FeatureGateLabFragment lab) {
        View row = lab.getView().findViewWithTag(RestartPendingPreference.ROW_TAG);
        assertNotNull("the Lab has no restart row", row);
        return (TextView) row;
    }

    /** The shipped 47.6.3 entry the comment emoji preset writes, as FeatureGateTypedPresetsTest reads it. */
    private static Map<String, FeatureGateCatalog.Entry> presetCatalog() throws Exception {
        BuildNames.setRunningBuildForTests("47.6.3");
        Map<String, FeatureGateCatalog.Entry> catalog = new LinkedHashMap<>();
        Map<String, String> types = new LinkedHashMap<>();
        for (FeatureGateCatalog.Entry entry : FeatureGateCatalog.readStaticCatalog("47.6.3")) {
            if (entry.manager.equals("abmock") && entry.key.equals("tt_cmt_new_emoji")) {
                catalog.put(entry.identity(), entry);
                types.put(entry.key, entry.type);
            }
        }
        assertEquals("the emoji preset's key must exist in the shipped catalog", 1, catalog.size());
        var cachedTypes = FeatureGateCatalog.class.getDeclaredField("cachedAbTypes");
        cachedTypes.setAccessible(true);
        cachedTypes.set(null, Map.copyOf(types));
        return catalog;
    }

    private static ViewGroup container(Activity activity) {
        ViewGroup content = activity.findViewById(android.R.id.content);
        ViewGroup surface = (ViewGroup) content.getChildAt(0);
        return (ViewGroup) surface.getChildAt(0);
    }

    private static void settle() throws Exception {
        FeatureGateLabFragment.awaitFileIoForTests();
        Utils.awaitBackgroundTasksForTests();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    private static FeatureGateLabFragment attach(Activity activity) {
        var fragment = new FeatureGateLabFragment();
        activity.getFragmentManager().beginTransaction().replace(android.R.id.content, fragment).commit();
        activity.getFragmentManager().executePendingTransactions();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        return fragment;
    }

    private static FeatureGateCatalog.Entry entry(String key) {
        return new FeatureGateCatalog.Entry(key, key, "abmock", "BOOLEAN", true, true,
                List.of("false"), List.of(), List.of(), "", "", true, "false", "BOOLEAN");
    }

    public static class LabActivity extends Activity {
        @Override protected void onCreate(android.os.Bundle state) {
            setTheme(android.R.style.Theme_Material_NoActionBar);
            super.onCreate(state);
        }
    }
}
