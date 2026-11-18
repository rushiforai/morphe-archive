/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Modified by lavinhoque33, 2026-11-17.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.extension.shared.translation;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import java.lang.reflect.Method;

public class TranslationLanguageAliasTest {
    private static String deepL(String language) throws Exception {
        Method method = DeepLClient.class.getDeclaredMethod("toDeepLLanguage", String.class);
        method.setAccessible(true);
        return (String) method.invoke(null, language);
    }

    @Test
    public void deepLAcceptsModernAndLegacyHebrewAndYiddish() throws Exception {
        assertEquals("HE", deepL("iw"));
        assertEquals("HE", deepL("he"));
        assertEquals("HE", deepL(" IW "));
        assertEquals("YI", deepL("ji"));
        assertEquals("YI", deepL("yi"));
        assertEquals("YI", deepL(" JI "));
    }

    @Test
    public void deepLKeepsExistingLanguageVariants() throws Exception {
        assertEquals("ID", deepL("in"));
        assertEquals("NB", deepL("no"));
        assertEquals("EN-US", deepL("en-GB"));
        assertEquals("PT-PT", deepL("pt-PT"));
        assertEquals("ZH-HANT", deepL("zh-TW"));
        assertEquals("DE", deepL("de-DE"));
    }

    @Test
    public void googleMapsKurdishAndPreservesExistingAliases() {
        assertEquals("ku", TextTranslator.resolveLanguage("kmr"));
        assertEquals("ku", TextTranslator.resolveLanguage("KMR"));
        assertEquals("ku", TextTranslator.resolveLanguage("ku"));
        assertEquals("he", TextTranslator.resolveLanguage("iw"));
        assertEquals("yi", TextTranslator.resolveLanguage("ji"));
        assertEquals("id", TextTranslator.resolveLanguage("in"));
        assertEquals("zh-TW", TextTranslator.resolveLanguage("zh-TW"));
    }
}
