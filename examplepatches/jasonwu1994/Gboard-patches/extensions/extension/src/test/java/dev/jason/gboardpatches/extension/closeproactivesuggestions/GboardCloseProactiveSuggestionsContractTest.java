package dev.jason.gboardpatches.extension.closeproactivesuggestions;

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
public final class GboardCloseProactiveSuggestionsContractTest {
    @Test
    public void exactFlagDefaultsOnAndPreservesStockWhenDisabledOrPreferencesFail() {
        Context context = RuntimeEnvironment.getApplication();
        SharedPreferences preferences = context.getSharedPreferences(
                "close-proactive-suggestions-test",
                Context.MODE_PRIVATE);
        preferences.edit().clear().commit();

        Assert.assertEquals(
                "enable_close_proactive_suggestions_access_point",
                GboardCloseProactiveSuggestionsPolicy.FLAG_NAME);
        Assert.assertTrue(GboardCloseProactiveSuggestionsSettings.DEFAULT_ENABLED);
        Assert.assertEquals(Boolean.TRUE,
                GboardCloseProactiveSuggestionsRuntime.applyFlagValue(
                        GboardCloseProactiveSuggestionsPolicy.FLAG_NAME,
                        Boolean.FALSE,
                        preferences));

        preferences.edit().putBoolean(
                GboardCloseProactiveSuggestionsSettings.PREF_KEY_ENABLED,
                false).commit();
        Assert.assertSame(Boolean.FALSE,
                GboardCloseProactiveSuggestionsRuntime.applyFlagValue(
                        GboardCloseProactiveSuggestionsPolicy.FLAG_NAME,
                        Boolean.FALSE,
                        preferences));
        Assert.assertSame(Boolean.FALSE,
                GboardCloseProactiveSuggestionsRuntime.applyFlagValue(
                        "unrelated",
                        Boolean.FALSE,
                        preferences));
        Assert.assertEquals("false",
                GboardCloseProactiveSuggestionsRuntime.applyFlagValue(
                        GboardCloseProactiveSuggestionsPolicy.FLAG_NAME,
                        "false",
                        preferences));
        Assert.assertSame(Boolean.FALSE,
                GboardCloseProactiveSuggestionsRuntime.applyFlagValue(
                        GboardCloseProactiveSuggestionsPolicy.FLAG_NAME,
                        Boolean.FALSE,
                        throwingPreferences()));
    }

    @Test
    public void patchesScreenHasOneSummarylessDefaultOnToggleAndOnePreviewImage() {
        GboardCloseProactiveSuggestionsSettingsFeature feature =
                new GboardCloseProactiveSuggestionsSettingsFeature(
                        RuntimeEnvironment.getApplication());
        GboardPatchesSettingsContract.Screen screen = feature.buildScreenForState(
                true,
                enabled -> { });

        Assert.assertEquals("Dismiss Suggestions Button", feature.getEntryTitle());
        Assert.assertEquals("", feature.getEntrySummary());
        Assert.assertEquals(1, screen.getRows().size());
        GboardPatchesSettingsContract.ToggleRow row =
                (GboardPatchesSettingsContract.ToggleRow) screen.getRows().get(0);
        Assert.assertTrue(row.isChecked());
        Assert.assertEquals("", row.getSummary());
        Assert.assertEquals(1, row.getPreviewSpec().getMediaItems().size());
        GboardPatchesSettingsContract.PreviewImage preview =
                (GboardPatchesSettingsContract.PreviewImage)
                        row.getPreviewSpec().getMediaItems().get(0);
        Assert.assertEquals(
                "settings-previews/closeproactivesuggestions/"
                        + "01_close_proactive_suggestions.png",
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
