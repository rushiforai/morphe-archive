package dev.jason.gboardpatches.extension.extendeddictionary;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;

import android.app.Application;
import android.content.Context;
import android.content.res.Configuration;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

import java.util.Locale;

@RunWith(RobolectricTestRunner.class)
public final class GboardExtendedDictionaryRuntimeTest {
    private static final CharSequence JAPANESE = "日本語(日本)";
    private static final CharSequence ENGLISH = "English (United States)";

    @Test
    public void extendedTagsGetGboardsLabelWithTheLocalizedSuffix() {
        Context english = localized(Locale.ENGLISH);
        assertEquals("日本語(日本) (Extended)",
                GboardExtendedDictionaryRuntime.sectionTitle(english,
                        tag(ExtendedDictionaryImporter.EXTENDED_JA_TAG), JAPANESE).toString());
        assertEquals("English (United States) (Extended)",
                GboardExtendedDictionaryRuntime.sectionTitle(english,
                        tag("en-US-X-EXTDICT"), ENGLISH).toString());
        assertEquals("English (United States)（擴充）",
                GboardExtendedDictionaryRuntime.sectionTitle(
                        localized(Locale.forLanguageTag("zh-Hant")),
                        tag("en-US-x-extdict"), ENGLISH).toString());
    }

    @Test
    public void everyOtherInputKeepsGboardsLabel() {
        Context english = localized(Locale.ENGLISH);
        assertSame(JAPANESE,
                GboardExtendedDictionaryRuntime.sectionTitle(english, tag("ja-JP"), JAPANESE));
        assertSame(JAPANESE,
                GboardExtendedDictionaryRuntime.sectionTitle(english, null, JAPANESE));
        assertSame(JAPANESE, GboardExtendedDictionaryRuntime.sectionTitle(
                null, tag(ExtendedDictionaryImporter.EXTENDED_JA_TAG), JAPANESE));
        Object throwing = new Object() {
            @Override
            public String toString() {
                throw new IllegalStateException("broken tag");
            }
        };
        assertSame(JAPANESE,
                GboardExtendedDictionaryRuntime.sectionTitle(english, throwing, JAPANESE));
    }

    /** Stands in for Gboard's sfc, whose toString() is the language tag. */
    private static Object tag(String value) {
        return new Object() {
            @Override
            public String toString() {
                return value;
            }
        };
    }

    private static Context localized(Locale locale) {
        Application application = RuntimeEnvironment.getApplication();
        Configuration configuration =
                new Configuration(application.getResources().getConfiguration());
        configuration.setLocale(locale);
        return application.createConfigurationContext(configuration);
    }
}
