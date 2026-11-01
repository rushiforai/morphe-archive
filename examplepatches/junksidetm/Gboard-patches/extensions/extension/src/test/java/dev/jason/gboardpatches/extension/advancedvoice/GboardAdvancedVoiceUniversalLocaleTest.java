package dev.jason.gboardpatches.extension.advancedvoice;

import org.junit.Assert;
import org.junit.Test;

import java.util.Collections;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

public final class GboardAdvancedVoiceUniversalLocaleTest {

    @Test
    public void universalSupportedLocaleSetContainsEveryLocaleAndLanguageTag() {
        Set<Object> stock = new HashSet<Object>();
        stock.add(Locale.US);

        GboardAdvancedVoiceRuntime.UniversalSupportedLocaleSet set =
                new GboardAdvancedVoiceRuntime.UniversalSupportedLocaleSet(stock);

        Locale[] testLocales = new Locale[] {
                Locale.US,
                Locale.UK,
                Locale.forLanguageTag("zh-TW"),
                Locale.forLanguageTag("zh-CN"),
                Locale.forLanguageTag("es-ES"),
                Locale.forLanguageTag("es-US"),
                Locale.forLanguageTag("fr-FR"),
                Locale.forLanguageTag("de-DE"),
                Locale.forLanguageTag("ja-JP"),
                Locale.forLanguageTag("hi-IN"),
                Locale.forLanguageTag("ru-RU"),
                Locale.forLanguageTag("pt-BR"),
                Locale.forLanguageTag("ar-SA")
        };

        for (Locale locale : testLocales) {
            Assert.assertTrue("Universal set must contain locale " + locale, set.contains(locale));
        }

        String[] testTags = new String[] {
                "en-US", "zh-TW", "es-ES", "fr-FR", "de-DE", "hi-IN", "ja-JP", "ru-RU"
        };
        for (String tag : testTags) {
            Assert.assertTrue("Universal set must contain language tag " + tag, set.contains(tag));
        }

        Assert.assertTrue(set.containsAll(Collections.singletonList(Locale.forLanguageTag("es-ES"))));
        Assert.assertTrue(set.contains(Locale.US));
        Assert.assertTrue(set.contains(Locale.forLanguageTag("en-IN")));
        Assert.assertTrue(set.contains("en-US"));
        Assert.assertTrue(set.contains("en-IN"));
        Assert.assertFalse(set.isEmpty());
        Assert.assertTrue(set.size() >= 3);
    }

    @Test
    public void includeExactZhTwSupportedLocaleReturnsUniversalSetWhenEnabled() {
        GboardAdvancedVoiceRuntimeSettings.clearEnabledOverrideForTest();
        try {
            GboardAdvancedVoiceRuntimeSettings.setEnabledOverrideForTest(true);
            Set<Object> stock = new HashSet<Object>();
            stock.add(Locale.US);

            Object result = GboardAdvancedVoiceRuntime.includeExactZhTwSupportedLocale(stock);
            Assert.assertTrue(result instanceof GboardAdvancedVoiceRuntime.UniversalSupportedLocaleSet);

            @SuppressWarnings("unchecked")
            Set<Object> resultSet = (Set<Object>) result;
            Assert.assertTrue(resultSet.contains(Locale.forLanguageTag("es-ES")));
            Assert.assertTrue(resultSet.contains(Locale.forLanguageTag("hi-IN")));
            Assert.assertTrue(resultSet.contains(Locale.forLanguageTag("fr-FR")));
            Assert.assertTrue(resultSet.contains(Locale.US));
        } finally {
            GboardAdvancedVoiceRuntimeSettings.clearEnabledOverrideForTest();
        }
    }

    @Test
    public void after1803NativeSplitReadinessReturnsTrueWhenEnabled() {
        GboardAdvancedVoiceRuntimeSettings.clearEnabledOverrideForTest();
        try {
            GboardAdvancedVoiceRuntimeSettings.setEnabledOverrideForTest(true);
            Assert.assertTrue(GboardAdvancedVoiceRuntime.after1803NativeSplitReadiness(false));
            Assert.assertTrue(GboardAdvancedVoiceRuntime.after1803NativeSplitReadiness(true));

            GboardAdvancedVoiceRuntimeSettings.setEnabledOverrideForTest(false);
            Assert.assertFalse(GboardAdvancedVoiceRuntime.after1803NativeSplitReadiness(false));
            Assert.assertTrue(GboardAdvancedVoiceRuntime.after1803NativeSplitReadiness(true));
        } finally {
            GboardAdvancedVoiceRuntimeSettings.clearEnabledOverrideForTest();
        }
    }
}
