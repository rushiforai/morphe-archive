package com.akshaykadam.pixelboard.extension.settings;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

@RunWith(RobolectricTestRunner.class)
public final class GboardRoundedKeysSettingsTest {

    @Test
    public void defaultRoundedKeysIsTrue() {
        Context context = RuntimeEnvironment.getApplication();
        SharedPreferences preferences = GboardRoundedKeysSettings.preferences(context);
        preferences.edit().clear().commit();
        GboardRoundedKeysSettings.invalidateCache();

        Assert.assertTrue(GboardRoundedKeysSettings.readEnabled(preferences));
        Assert.assertTrue(GboardRoundedKeysSettings.isEnabled(context));
    }

    @Test
    public void readAndWriteTogglesPreferenceAndInvalidatesCache() {
        Context context = RuntimeEnvironment.getApplication();
        SharedPreferences preferences = GboardRoundedKeysSettings.preferences(context);

        Assert.assertTrue(GboardRoundedKeysSettings.writeEnabled(preferences, true));
        Assert.assertTrue(GboardRoundedKeysSettings.readEnabled(preferences));
        Assert.assertTrue(GboardRoundedKeysSettings.isEnabled(context));

        Assert.assertTrue(GboardRoundedKeysSettings.writeEnabled(preferences, false));
        Assert.assertFalse(GboardRoundedKeysSettings.readEnabled(preferences));
        Assert.assertFalse(GboardRoundedKeysSettings.isEnabled(context));
    }

    @Test
    public void isRoundedKeyPhenotypeFlagRecognizesAllBelkaFlags() {
        Assert.assertTrue(GboardRoundedKeysSettings.isRoundedKeyPhenotypeFlag("belka_rounded_keyboard"));
        Assert.assertTrue(GboardRoundedKeysSettings.isRoundedKeyPhenotypeFlag("belka_ui"));
        Assert.assertTrue(GboardRoundedKeysSettings.isRoundedKeyPhenotypeFlag("belka_background"));
        Assert.assertTrue(GboardRoundedKeysSettings.isRoundedKeyPhenotypeFlag("more_pill_keys"));
        Assert.assertTrue(GboardRoundedKeysSettings.isRoundedKeyPhenotypeFlag("enable_rounded_key_by_default"));
        Assert.assertTrue(GboardRoundedKeysSettings.isRoundedKeyPhenotypeFlag("enable_rounded_keys"));

        Assert.assertFalse(GboardRoundedKeysSettings.isRoundedKeyPhenotypeFlag("writing_tools"));
        Assert.assertFalse(GboardRoundedKeysSettings.isRoundedKeyPhenotypeFlag("enable_device_intelligence"));
        Assert.assertFalse(GboardRoundedKeysSettings.isRoundedKeyPhenotypeFlag(null));
    }

    @Test
    public void applyToGboardPreferencesSetsAndRemovesPreferenceKey() {
        Context context = RuntimeEnvironment.getApplication();
        SharedPreferences gboardPrefs = context.getSharedPreferences(
                context.getPackageName() + "_preferences", Context.MODE_PRIVATE);

        GboardRoundedKeysSettings.applyToGboardPreferences(context, true);
        Assert.assertTrue(gboardPrefs.getBoolean("enable_rounded_keys", false));

        GboardRoundedKeysSettings.applyToGboardPreferences(context, false);
        Assert.assertFalse(gboardPrefs.contains("enable_rounded_keys"));
    }
}
