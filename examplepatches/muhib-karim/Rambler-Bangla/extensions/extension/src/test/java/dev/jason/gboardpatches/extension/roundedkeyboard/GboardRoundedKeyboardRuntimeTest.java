package dev.jason.gboardpatches.extension.roundedkeyboard;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

@RunWith(RobolectricTestRunner.class)
public final class GboardRoundedKeyboardRuntimeTest {
    private static final String MAIN_SELECTOR =
            ".keyboard-base-area.keyboard-outline";
    private static final String BOTTOM_SELECTOR =
            ".keyboard-body-area.keyboard-outline-bottom.clip-to-outline-for-old-android";

    private Context context;
    private SharedPreferences preferences;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        preferences = context.getSharedPreferences(
                GboardPatchesSettings.PREF_FILE,
                Context.MODE_PRIVATE);
        preferences.edit().clear().commit();
    }

    @Test
    public void defaultsAreDisabledAllCornersAndThirtyTwoDp() {
        GboardRoundedKeyboardConfig snapshot =
                GboardRoundedKeyboardSettings.readSnapshot(preferences);

        Assert.assertFalse(snapshot.isEnabled());
        Assert.assertEquals(GboardRoundedKeyboardConfig.Mode.ALL, snapshot.getMode());
        Assert.assertEquals(32, snapshot.getTopRadiusDp());
        Assert.assertEquals(32, snapshot.getBottomRadiusDp());
        Assert.assertFalse(GboardRoundedKeyboardRuntime.applyThemeAdmission(false));
        Assert.assertNull(GboardRoundedKeyboardRuntime.resolveEffectiveRadiiDp(MAIN_SELECTOR));
    }

    @Test
    public void modeAndIndependentRadiiResolveForBothSelectors() {
        GboardRoundedKeyboardSettings.writeEnabled(preferences, true);
        GboardRoundedKeyboardSettings.writeMode(
                preferences, GboardRoundedKeyboardConfig.Mode.TOP);
        GboardRoundedKeyboardSettings.writeTopRadiusDp(preferences, 48);
        GboardRoundedKeyboardSettings.writeBottomRadiusDp(preferences, 17);

        Assert.assertTrue(GboardRoundedKeyboardRuntime.applyThemeAdmission(false));
        Assert.assertArrayEquals(
                new float[] {48.0f, 48.0f, 0.0f, 0.0f},
                GboardRoundedKeyboardRuntime.resolveEffectiveRadiiDp(MAIN_SELECTOR),
                0.0f);
        Assert.assertArrayEquals(
                new float[] {0.0f, 0.0f, 0.0f, 0.0f},
                GboardRoundedKeyboardRuntime.resolveEffectiveRadiiDp(BOTTOM_SELECTOR),
                0.0f);

        GboardRoundedKeyboardSettings.writeMode(
                preferences, GboardRoundedKeyboardConfig.Mode.BOTTOM);
        Assert.assertArrayEquals(
                new float[] {0.0f, 0.0f, 17.0f, 17.0f},
                GboardRoundedKeyboardRuntime.resolveEffectiveRadiiDp(MAIN_SELECTOR),
                0.0f);
        Assert.assertArrayEquals(
                new float[] {0.0f, 0.0f, 17.0f, 17.0f},
                GboardRoundedKeyboardRuntime.resolveEffectiveRadiiDp(BOTTOM_SELECTOR),
                0.0f);
        Assert.assertNull(GboardRoundedKeyboardRuntime.resolveEffectiveRadiiDp("unknown"));
    }

    @Test
    public void resetPreservesEnabledAndMode() {
        GboardRoundedKeyboardSettings.writeEnabled(preferences, true);
        GboardRoundedKeyboardSettings.writeMode(
                preferences, GboardRoundedKeyboardConfig.Mode.BOTTOM);
        GboardRoundedKeyboardSettings.writeTopRadiusDp(preferences, 12);
        GboardRoundedKeyboardSettings.writeBottomRadiusDp(preferences, 28);

        Assert.assertTrue(GboardRoundedKeyboardSettings.restoreDefaultRadii(preferences));

        GboardRoundedKeyboardConfig snapshot =
                GboardRoundedKeyboardSettings.readSnapshot(preferences);
        Assert.assertTrue(snapshot.isEnabled());
        Assert.assertEquals(GboardRoundedKeyboardConfig.Mode.BOTTOM, snapshot.getMode());
        Assert.assertEquals(32, snapshot.getTopRadiusDp());
        Assert.assertEquals(32, snapshot.getBottomRadiusDp());
    }

    @Test
    public void rowSummaryAndResetTitleMatchThePublicContract() {
        Assert.assertEquals(
                "Customize which corners of the keyboard panel are rounded, "
                        + "and set the top and bottom radii separately.",
                GboardSettingsText.get(
                        context, R.string.gboard_patches_rounded_keyboard_summary));
        Assert.assertEquals(
                "Restore corner radii to 32 dp",
                GboardSettingsText.get(
                        context, R.string.gboard_patches_rounded_keyboard_reset_title));
    }
}
