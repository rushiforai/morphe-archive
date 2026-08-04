package dev.jason.gboardpatches.extension.settings;

import org.junit.Assert;
import org.junit.Test;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

import dev.jason.gboardpatches.extension.R;

public final class GboardSettingsTextTest {
    @Test
    public void authoritativeCopyResolvesBothLocalesWithoutCallerFallback() {
        Assert.assertEquals(
                "Patch settings",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_header_title,
                        "en"));
        Assert.assertEquals(
                "Patch 設定",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_header_title,
                        "zh-Hant"));
    }

    @Test
    public void localeNormalizationAndFormattingStayBehindTheSeam() {
        Assert.assertEquals(
                "跟隨系統（繁體中文）",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_language_system_value,
                        "zh-TW",
                        "繁體中文"));
        Assert.assertEquals(
                "System default (English)",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_language_system_value,
                        "fr-FR",
                        "English"));
    }

    @Test
    public void authorityEliminatesLegacyCallerFallbackDrift() {
        Assert.assertEquals(
                "",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_group_keyboard_header_summary,
                        "en"));
        Assert.assertEquals(
                "Controls Gboard AI Writing Tools availability, keyboard support, "
                        + "and backend routing.",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_ai_writing_tools_summary,
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
        Assert.assertEquals(
                "2 分鐘",
                GboardSettingsText.resolveStableQuantityForTesting(
                        R.plurals.gboard_patches_minutes,
                        "zh-Hant",
                        2));
    }

    @Test
    public void everyGeneratedSettingsStringHasEnglishAndTraditionalChineseCoverage()
            throws Exception {
        for (Field field : R.string.class.getDeclaredFields()) {
            if (!Modifier.isStatic(field.getModifiers()) || field.getType() != int.class) {
                continue;
            }
            int resId = field.getInt(null);
            Assert.assertNotNull(
                    field.getName() + " missing English settings text",
                    GboardSettingsText.resolveStableTextForTesting(resId, "en"));
            Assert.assertNotNull(
                    field.getName() + " missing zh-Hant settings text",
                    GboardSettingsText.resolveStableTextForTesting(resId, "zh-Hant"));
        }
    }
}
