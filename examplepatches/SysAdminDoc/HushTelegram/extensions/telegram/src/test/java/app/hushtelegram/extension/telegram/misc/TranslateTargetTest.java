/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import java.util.Locale;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** The language the outside translate writes in (#35). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TranslateTargetTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.TRANSLATE_TARGET);
        Settings.TRANSLATE_TARGET.resetToDefault();
    }

    @Test public void theListHoldsGooglesLanguagesTelegramsListLeavesOut() {
        assertTrue("only " + TranslateTarget.LANGUAGES.size(), TranslateTarget.LANGUAGES.size() >= 240);
        for (String code : new String[]{"fa", "fa-AF", "en", "de", "zh-CN", "zh-TW", "yue", "kri", "ckb", "mni-Mtei",
                "haw", "yo", "iw", "jw", "pa-Arab"}) {
            assertTrue(code, TranslateTarget.LANGUAGES.containsKey(code));
        }
        assertEquals("Persian", TranslateTarget.englishName("fa"));
        assertEquals("Krio", TranslateTarget.englishName("kri"));
        assertNull(TranslateTarget.englishName("xx"));
        for (String code : TranslateTarget.LANGUAGES.keySet()) {
            assertFalse("a blank code", code.trim().isEmpty());
            assertFalse(code + " has no English name", TranslateTarget.englishName(code).trim().isEmpty());
            assertFalse(code + " has no name of its own", TranslateTarget.nativeName(code).trim().isEmpty());
        }
    }

    @Test public void aLanguageIsNamedTheWayItNamesItself() {
        assertEquals("Deutsch", TranslateTarget.nativeName("de"));
        assertEquals("Español", TranslateTarget.nativeName("es"));
        assertEquals("فارسی", TranslateTarget.nativeName("fa"));
        assertNotEquals("the two Chineses read apart", TranslateTarget.nativeName("zh-CN"), TranslateTarget.nativeName("zh-TW"));
        assertEquals("עברית", TranslateTarget.nativeName("iw"));
        assertEquals("Hebrew", TranslateTarget.nameIn("iw", Locale.ENGLISH));
        // A language's other script or region is a choice of its own, so no two rows read the same.
        java.util.Set<String> names = new java.util.HashSet<>();
        for (String code : TranslateTarget.LANGUAGES.keySet()) {
            assertTrue(code + " reads like another: " + TranslateTarget.nativeName(code), names.add(TranslateTarget.nativeName(code)));
        }
        assertEquals("German", TranslateTarget.nameIn("de", Locale.ENGLISH));
        assertEquals("Persisch", TranslateTarget.nameIn("fa", Locale.GERMAN));
        assertNull("no name the phone doesn't have", TranslateTarget.nameIn("xyz", Locale.ENGLISH));
    }

    @Test public void threeLanguagesThePhoneNamesOtherwiseKeepGooglesNameToo() {
        assertEquals("Twi", TranslateTarget.googleNameIfOther("ak"));
        assertEquals("Chichewa", TranslateTarget.googleNameIfOther("ny"));
        assertEquals("Filipino", TranslateTarget.googleNameIfOther("tl"));
        for (String same : new String[]{"de", "fa", "iw", "zh-TW", "kri"}) {
            assertNull(same, TranslateTarget.googleNameIfOther(same));
        }
    }

    @Test public void onlyTelegramsLanguageAndTheCodesAreAllowed() {
        assertTrue(TranslateTarget.allowed(TranslateTarget.TELEGRAM));
        assertTrue(TranslateTarget.allowed("fa"));
        for (String bad : new String[]{null, "xx", "FA", " fa", "fa-IR", "../de", "zh", "he"}) {
            assertFalse(String.valueOf(bad), TranslateTarget.allowed(bad));
        }
    }

    @Test public void thePickIsWhatTheTranslateWritesIn() {
        assertEquals("", Settings.TRANSLATE_TARGET.defaultValue);
        assertNull("nothing picked follows Telegram", TranslateTarget.chosen());
        String telegrams = OutsideTranslate.target();
        Settings.TRANSLATE_TARGET.save("fa");
        assertEquals("fa", TranslateTarget.chosen());
        assertEquals("fa", OutsideTranslate.target());
        Settings.TRANSLATE_TARGET.save("xx");
        assertNull("a value saved by hand isn't a pick", TranslateTarget.chosen());
        assertEquals(telegrams, OutsideTranslate.target());
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSettingFollowTelegram() {
        String telegrams = OutsideTranslate.target();
        Settings.TRANSLATE_TARGET.save("fa");
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertNull(reason.name(), TranslateTarget.chosen());
            // What the person picked is kept for after the pause.
            assertEquals("fa", Settings.TRANSLATE_TARGET.savedValue());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertNull("before the settings are ready", TranslateTarget.chosen()));
        SettingReadsForTests.breakReads(Settings.TRANSLATE_TARGET);
        assertNull("unreadable", TranslateTarget.chosen());
        assertEquals(telegrams, OutsideTranslate.target());
        SettingReadsForTests.mend(Settings.TRANSLATE_TARGET);
        assertEquals("fa", OutsideTranslate.target());
    }

    @Test public void aPickedScriptOrRegionIsTranslatedIntoWhileTelegramsLanguageKeepsTheOldCheck() {
        GoogleTranslate.Result simplified = new GoogleTranslate.Result("a", "zh-CN");
        assertTrue("Telegram's language reads both Chineses as one", simplified.sameLanguageAs("zh-TW"));
        assertFalse("a picked Traditional is written out", simplified.sameLanguageAs("zh-TW", true));
        assertTrue(simplified.sameLanguageAs("zh-CN", true));
        assertFalse(new GoogleTranslate.Result("a", "pa").sameLanguageAs("pa-Arab", true));
        // Google answers Hebrew and Javanese with their old codes, the phone with the new ones.
        assertTrue(new GoogleTranslate.Result("a", "iw").sameLanguageAs("he"));
        assertTrue(new GoogleTranslate.Result("a", "he").sameLanguageAs("iw", true));
        assertTrue(new GoogleTranslate.Result("a", "jw").sameLanguageAs("jv"));
        assertTrue(new GoogleTranslate.Result("a", "in").sameLanguageAs("id", true));
        assertFalse(new GoogleTranslate.Result("", "").sameLanguageAs("", true));
    }

    @Test public void telegramsTranslateBarCodesReadAsGooglesAndItsFallbackAsNoPick() {
        Locale english = Locale.ENGLISH;
        assertEquals("de", OutsideTranslate.telegramPick("de", english));
        assertEquals("zh-CN", OutsideTranslate.telegramPick("zh-cn", english));
        assertEquals("zh-TW", OutsideTranslate.telegramPick("zh-tw", english));
        assertEquals("zh-CN", OutsideTranslate.telegramPick("zh", english));
        assertEquals("pt-PT", OutsideTranslate.telegramPick("pt_PT", english));
        assertEquals("pt", OutsideTranslate.telegramPick("pt-br", english));
        assertEquals("iw", OutsideTranslate.telegramPick("he", english));
        assertEquals("id", OutsideTranslate.telegramPick("in", english));
        assertEquals("no", OutsideTranslate.telegramPick("nb", english));
        assertEquals("tl", OutsideTranslate.telegramPick("fil", english));
        assertEquals("fa", OutsideTranslate.telegramPick(" FA ", english));
        // Nothing picked, Telegram answers its own language bare, and Java and Telegram spell Hebrew apart.
        assertNull(OutsideTranslate.telegramPick("en", english));
        assertNull(OutsideTranslate.telegramPick("he", new Locale("iw", "IL")));
        assertNull("the app's script stays with target()", OutsideTranslate.telegramPick("zh", Locale.TRADITIONAL_CHINESE));
        assertEquals("a picked script isn't the fallback", "zh-CN", OutsideTranslate.telegramPick("zh-cn", Locale.TRADITIONAL_CHINESE));
        for (String none : new String[]{null, "", "  ", "xx", "en-zz"}) {
            assertNull(String.valueOf(none), OutsideTranslate.telegramPick(none, Locale.GERMAN));
        }
    }

    @Test public void anAiServiceIsToldTheLanguageByNameEvenWhereThePhoneHasNone() {
        assertEquals("Persian (fa)", AiTranslate.languageName("fa"));
        assertTrue(AiTranslate.instructions("kri").contains("Krio (kri)"));
        assertEquals("xyz", AiTranslate.languageName("xyz"));
    }
}
