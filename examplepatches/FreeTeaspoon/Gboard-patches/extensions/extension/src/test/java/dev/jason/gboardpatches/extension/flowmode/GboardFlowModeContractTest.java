package dev.jason.gboardpatches.extension.flowmode;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

import java.lang.reflect.Proxy;
import java.nio.file.Files;
import java.nio.file.Path;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;

@RunWith(RobolectricTestRunner.class)
public final class GboardFlowModeContractTest {
    @Test
    public void exactFlagsDefaultOffAndEnabledStateForcesOnlyExpectedTypedValues() {
        Context context = RuntimeEnvironment.getApplication();
        SharedPreferences preferences = context.getSharedPreferences(
                "flow-mode-test",
                Context.MODE_PRIVATE);
        preferences.edit().clear().commit();

        Assert.assertEquals("enable_llm_pc", GboardFlowModePolicy.ENABLE_LLM_PC_FLAG);
        Assert.assertEquals(
                "enable_llm_pc_flow_mode",
                GboardFlowModePolicy.ENABLE_FLOW_MODE_FLAG);
        Assert.assertEquals(
                "llm_pc_supported_language_tags",
                GboardFlowModePolicy.SUPPORTED_LANGUAGE_TAGS_FLAG);
        Assert.assertFalse(GboardFlowModeSettings.DEFAULT_ENABLED);
        Assert.assertSame(Boolean.FALSE,
                GboardFlowModeRuntime.applyFlagValue(
                        GboardFlowModePolicy.ENABLE_LLM_PC_FLAG,
                        Boolean.FALSE,
                        preferences));

        preferences.edit().putBoolean(GboardFlowModeSettings.PREF_KEY_ENABLED, true).commit();
        Assert.assertEquals(Boolean.TRUE,
                GboardFlowModeRuntime.applyFlagValue(
                        GboardFlowModePolicy.ENABLE_LLM_PC_FLAG,
                        Boolean.FALSE,
                        preferences));
        Assert.assertEquals(Boolean.TRUE,
                GboardFlowModeRuntime.applyFlagValue(
                        GboardFlowModePolicy.ENABLE_FLOW_MODE_FLAG,
                        Boolean.FALSE,
                        preferences));
        Assert.assertEquals("*",
                GboardFlowModeRuntime.applyFlagValue(
                        GboardFlowModePolicy.SUPPORTED_LANGUAGE_TAGS_FLAG,
                        "en-US",
                        preferences));
        Assert.assertEquals(Integer.valueOf(1),
                GboardFlowModeRuntime.applyFlagValue(
                        GboardFlowModePolicy.ENABLE_LLM_PC_FLAG,
                        Integer.valueOf(1),
                        preferences));
        Assert.assertSame(Boolean.FALSE,
                GboardFlowModeRuntime.applyFlagValue(
                        "unrelated",
                        Boolean.FALSE,
                        preferences));
    }

    @Test
    public void keyMapperBridgesPositiveTextKeysButPreservesControlsAndInternalEvents() {
        Assert.assertEquals(-10043, GboardFlowModePolicy.mapKeyCode(11, true));
        Assert.assertEquals(-10043, GboardFlowModePolicy.mapKeyCode(48, true));
        for (int keyCode : new int[]{55, 56, 59, 60, 62, 66, 67}) {
            Assert.assertEquals(keyCode, GboardFlowModePolicy.mapKeyCode(keyCode, true));
        }
        Assert.assertEquals(-10043, GboardFlowModePolicy.mapKeyCode(-10043, true));
        Assert.assertEquals(-10002, GboardFlowModePolicy.mapKeyCode(-10002, true));
        Assert.assertEquals(0, GboardFlowModePolicy.mapKeyCode(0, true));
        Assert.assertEquals(11, GboardFlowModePolicy.mapKeyCode(11, false));
    }

    @Test
    public void preferenceFailurePreservesStockAndDisablesTheHotPathState() {
        Context context = RuntimeEnvironment.getApplication();
        SharedPreferences preferences = context.getSharedPreferences(
                "flow-mode-runtime-failure-test",
                Context.MODE_PRIVATE);
        preferences.edit().putBoolean(GboardFlowModeSettings.PREF_KEY_ENABLED, true).commit();
        GboardFlowModeRuntime.applyFlagValue(
                GboardFlowModePolicy.ENABLE_FLOW_MODE_FLAG,
                Boolean.FALSE,
                preferences);
        Assert.assertEquals(-10043, GboardFlowModeRuntime.mapKeyCode(11));

        Assert.assertSame(Boolean.FALSE,
                GboardFlowModeRuntime.applyFlagValue(
                        GboardFlowModePolicy.ENABLE_FLOW_MODE_FLAG,
                        Boolean.FALSE,
                        throwingPreferences()));
        Assert.assertEquals(11, GboardFlowModeRuntime.mapKeyCode(11));
    }

    @Test
    public void patchesScreenUsesExactCopyWithOneDefaultOffVideoToggle() {
        GboardFlowModeSettingsFeature feature = new GboardFlowModeSettingsFeature(
                "Hyperspeed Typing Animation",
                "Shows the animation during sustained fast typing.",
                "Gboard",
                "Hyperspeed typing animation unavailable",
                "Unable to load settings.",
                "Behavior",
                "Enable",
                "Shows the animation during sustained fast typing. Force-stop and restart "
                        + "Gboard for the change to take effect.");
        GboardPatchesSettingsContract.Screen screen = feature.buildScreenForState(
                false,
                enabled -> { });

        Assert.assertEquals(
                "Shows the animation during sustained fast typing.",
                feature.getEntrySummary());
        Assert.assertEquals(1, screen.getRows().size());
        GboardPatchesSettingsContract.ToggleRow row =
                (GboardPatchesSettingsContract.ToggleRow) screen.getRows().get(0);
        Assert.assertFalse(row.isChecked());
        Assert.assertEquals("Enable", row.getTitle());
        Assert.assertEquals(
                "Shows the animation during sustained fast typing. Force-stop and restart "
                        + "Gboard for the change to take effect.",
                row.getSummary());
        Assert.assertEquals(1, row.getPreviewSpec().getMediaItems().size());
        GboardPatchesSettingsContract.PreviewVideo preview =
                (GboardPatchesSettingsContract.PreviewVideo)
                        row.getPreviewSpec().getMediaItems().get(0);
        Assert.assertEquals(
                "settings-previews/keyboard/gboard_flow_mode_enabled_preview.mp4",
                preview.getAssetPath());
        Assert.assertTrue(Files.exists(Path.of(
                "..", "..", "patches", "src", "main", "resources",
                preview.getAssetPath())));
    }

    private static SharedPreferences throwingPreferences() {
        return (SharedPreferences) Proxy.newProxyInstance(
                SharedPreferences.class.getClassLoader(),
                new Class<?>[]{SharedPreferences.class},
                (proxy, method, arguments) -> {
                    throw new AssertionError("preferences failure");
                });
    }
}
