package dev.jason.gboardpatches.extension.quickinsert;

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
import java.util.List;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;

@RunWith(RobolectricTestRunner.class)
public final class GboardQuickInsertContractTest {
    @Test
    public void exactFlagsDefaultOnAndPreserveStockWhenDisabledOrPreferencesFail() {
        Context context = RuntimeEnvironment.getApplication();
        SharedPreferences preferences = context.getSharedPreferences(
                "quick-insert-test",
                Context.MODE_PRIVATE);
        preferences.edit().clear().commit();

        Assert.assertEquals("super_insert", GboardQuickInsertPolicy.SUPER_INSERT_FLAG);
        Assert.assertEquals("super_insert_vk", GboardQuickInsertPolicy.SUPER_INSERT_VK_FLAG);
        Assert.assertTrue(GboardQuickInsertSettings.DEFAULT_ENABLED);
        Assert.assertEquals(Boolean.TRUE,
                GboardQuickInsertRuntime.applyFlagValue(
                        GboardQuickInsertPolicy.SUPER_INSERT_FLAG,
                        Boolean.FALSE,
                        preferences));
        Assert.assertEquals(Boolean.TRUE,
                GboardQuickInsertRuntime.applyFlagValue(
                        GboardQuickInsertPolicy.SUPER_INSERT_VK_FLAG,
                        Boolean.FALSE,
                        preferences));

        preferences.edit().putBoolean(
                GboardQuickInsertSettings.PREF_KEY_ENABLED,
                false).commit();
        Assert.assertSame(Boolean.FALSE,
                GboardQuickInsertRuntime.applyFlagValue(
                        GboardQuickInsertPolicy.SUPER_INSERT_FLAG,
                        Boolean.FALSE,
                        preferences));
        Assert.assertSame(Boolean.FALSE,
                GboardQuickInsertRuntime.applyFlagValue(
                        "unrelated",
                        Boolean.FALSE,
                        preferences));
        Assert.assertSame(Boolean.FALSE,
                GboardQuickInsertRuntime.applyFlagValue(
                        GboardQuickInsertPolicy.SUPER_INSERT_FLAG,
                        Boolean.FALSE,
                        throwingPreferences()));
    }

    @Test
    public void patchesScreenHasOneSummarylessDefaultOnToggleAndTwoStackedPreviews() {
        GboardQuickInsertSettingsFeature feature = new GboardQuickInsertSettingsFeature(
                RuntimeEnvironment.getApplication());
        GboardPatchesSettingsContract.Screen screen = feature.buildScreenForState(
                true,
                enabled -> { });

        Assert.assertEquals("Quick Insert", feature.getEntryTitle());
        Assert.assertEquals("", feature.getEntrySummary());
        Assert.assertEquals(1, screen.getRows().size());
        GboardPatchesSettingsContract.ToggleRow row =
                (GboardPatchesSettingsContract.ToggleRow) screen.getRows().get(0);
        Assert.assertTrue(row.isChecked());
        Assert.assertEquals("", row.getSummary());
        Assert.assertEquals(
                GboardPatchesSettingsContract.PreviewLayout.STACKED,
                row.getPreviewSpec().getLayout());
        List<GboardPatchesSettingsContract.PreviewMedia> media =
                row.getPreviewSpec().getMediaItems();
        Assert.assertEquals(2, media.size());
        Assert.assertEquals(
                "settings-previews/quickinsert/01_quick_insert_panel.png",
                ((GboardPatchesSettingsContract.PreviewImage) media.get(0)).getAssetPath());
        Assert.assertEquals(
                "settings-previews/quickinsert/02_quick_insert_access_point.png",
                ((GboardPatchesSettingsContract.PreviewImage) media.get(1)).getAssetPath());
        for (GboardPatchesSettingsContract.PreviewMedia item : media) {
            Assert.assertTrue(Files.exists(Path.of(
                    "..", "..", "patches", "src", "main", "resources",
                    ((GboardPatchesSettingsContract.PreviewImage) item).getAssetPath())));
        }
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
