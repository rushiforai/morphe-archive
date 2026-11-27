package dev.srwi.gintype.extension.settings;

import android.content.Context;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

import dev.srwi.gintype.extension.R;

@RunWith(RobolectricTestRunner.class)
public final class GboardSettingsTextTest {
    @Test
    public void nullContextRemainsSafeForStaticFeatureInitialization() {
        Assert.assertEquals("MultiGlide settings", GboardSettingsText.get(
                null, R.string.gboard_patches_header_title));
    }

    @Test
    public void runtimeTextFollowsPatchLanguagePreference() {
        Context context = RuntimeEnvironment.getApplication();

        Assert.assertEquals("MultiGlide Multi-Touch", GboardSettingsText.get(context,
                R.string.gboard_patches_multiglide_title));
        Assert.assertEquals("Thicc Top Bar", GboardSettingsText.get(context,
                R.string.gboard_patches_thicc_top_bar_title));
    }

    @Test
    public void authoritativeCopyResolvesEnglishWithoutCallerFallback() {
        Assert.assertEquals(
                "MultiGlide settings",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_header_title,
                        "en"));
    }

    @Test
    public void localeNormalizationAndFormattingStayBehindTheSeam() {
        Assert.assertEquals(
                "English: Swipe",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_search_english_match,
                        "en",
                        "Swipe"));
    }

    @Test
    public void authorityEliminatesLegacyCallerFallbackDrift() {
        Assert.assertEquals(
                "",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_header_summary,
                        "en"));
    }

    @Test
    public void quantityProjectionUsesTheSameLocaleAuthority() {
        Assert.assertEquals(
                "1 minute",
                GboardSettingsText.resolveStableQuantityForTesting(
                        R.plurals.gboard_patches_minutes,
                        "en",
                        1));
        Assert.assertEquals(
                "2 minutes",
                GboardSettingsText.resolveStableQuantityForTesting(
                        R.plurals.gboard_patches_minutes,
                        "en",
                        2));
    }

    @Test
    public void everyGeneratedSettingsStringHasEnglishCoverage()
            throws Exception {
        for (Field field : R.string.class.getDeclaredFields()) {
            if (!Modifier.isStatic(field.getModifiers()) || field.getType() != int.class) {
                continue;
            }
            int resId = field.getInt(null);
            Assert.assertNotNull(
                field.getName() + " missing English settings text",
                GboardSettingsText.resolveStableTextForTesting(resId, "en"));
        }
    }
}
