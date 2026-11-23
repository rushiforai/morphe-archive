package dev.jason.gboardpatches.extension.hiddenflags;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

@RunWith(RobolectricTestRunner.class)
public class GboardHiddenFlagSettingsTest {
    private static final String FLAG = "enable_dcontext_biasing";

    @Test
    public void defaultIsOnWithoutWritingAPreference() {
        SharedPreferences preferences = preferences();
        assertTrue(GboardHiddenFlagSettings.readEnabled(preferences, FLAG));
        assertTrue(preferences.getAll().isEmpty());
    }

    @Test
    public void legacyScreenDefaultDoesNotOverrideAnExplicitChoice() {
        SharedPreferences preferences = preferences();
        preferences.edit().putBoolean(GboardHiddenFlagSettings.preferenceKey(FLAG), false).commit();
        assertTrue(GboardHiddenFlagSettings.readEnabled(preferences, FLAG));

        assertTrue(GboardHiddenFlagSettings.writeEnabled(preferences, FLAG, false));
        assertFalse(GboardHiddenFlagSettings.readEnabled(preferences, FLAG));

        assertTrue(GboardHiddenFlagSettings.writeEnabled(preferences, FLAG, true));
        assertTrue(GboardHiddenFlagSettings.readEnabled(preferences, FLAG));
    }

    private static SharedPreferences preferences() {
        SharedPreferences preferences = RuntimeEnvironment.getApplication()
                .getSharedPreferences("hidden-flag-defaults", Context.MODE_PRIVATE);
        preferences.edit().clear().commit();
        return preferences;
    }
}
