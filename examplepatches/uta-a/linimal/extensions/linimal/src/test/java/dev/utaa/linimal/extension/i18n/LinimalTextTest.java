package dev.utaa.linimal.extension.i18n;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Test;

import java.util.Locale;

public final class LinimalTextTest {
    @After
    public void resetLocale() {
        LinimalText.setLocaleForTesting(null);
    }

    @Test
    public void choosesTheLanguageFromTheLocale() {
        assertEquals(LinimalText.Language.JAPANESE, LinimalText.Language.of(Locale.JAPAN));
        assertEquals(LinimalText.Language.ENGLISH, LinimalText.Language.of(Locale.US));
        assertEquals(LinimalText.Language.ENGLISH, LinimalText.Language.of(Locale.FRANCE));
        assertEquals(LinimalText.Language.ENGLISH, LinimalText.Language.of(null));
        assertEquals(LinimalText.Language.THAI, LinimalText.Language.of(new Locale("th", "TH")));
        assertEquals(LinimalText.Language.INDONESIAN, LinimalText.Language.of(new Locale("in", "ID")));
        assertEquals(LinimalText.Language.INDONESIAN, LinimalText.Language.of(Locale.forLanguageTag("id-ID")));
        assertEquals(LinimalText.Language.TRADITIONAL_CHINESE, LinimalText.Language.of(Locale.TAIWAN));
        assertEquals(LinimalText.Language.TRADITIONAL_CHINESE, LinimalText.Language.of(new Locale("zh", "HK")));
        assertEquals(LinimalText.Language.TRADITIONAL_CHINESE,
                LinimalText.Language.of(Locale.forLanguageTag("zh-Hant")));
        // 簡体字中国語は表を持たないため英語にします。
        assertEquals(LinimalText.Language.ENGLISH, LinimalText.Language.of(Locale.CHINA));
        assertEquals(LinimalText.Language.ENGLISH, LinimalText.Language.of(Locale.forLanguageTag("zh-Hans-TW")));
    }

    @Test
    public void translatesForTheCurrentLocale() {
        LinimalText.setLocaleForTesting(Locale.JAPAN);
        assertEquals("外観", LinimalText.t("外観"));
        LinimalText.setLocaleForTesting(Locale.US);
        assertEquals("Appearance", LinimalText.t("外観"));
        LinimalText.setLocaleForTesting(Locale.TAIWAN);
        assertEquals("外觀", LinimalText.t("外観"));
        LinimalText.setLocaleForTesting(new Locale("th", "TH"));
        assertEquals("ลักษณะที่ปรากฏ", LinimalText.t("外観"));
        LinimalText.setLocaleForTesting(new Locale("in", "ID"));
        assertEquals("Tampilan", LinimalText.t("外観"));
    }

    @Test
    public void fallsBackToEnglishThenToTheOriginal() {
        assertEquals("Appearance", LinimalText.translate("外観", LinimalText.Language.ENGLISH));
        assertEquals("表にない文言", LinimalText.translate("表にない文言", LinimalText.Language.THAI));
        assertEquals("NetworkError", LinimalText.translate("NetworkError", LinimalText.Language.ENGLISH));
        assertEquals(null, LinimalText.t(null));
    }

    @Test
    public void formatsAfterTranslating() {
        LinimalText.setLocaleForTesting(Locale.US);
        assertEquals("MicroG-RE returned the error \"unknown value\".",
                LinimalText.format("MicroG-RE がエラー「%s」を返しました。", LinimalText.t("不明な値")));
        LinimalText.setLocaleForTesting(Locale.JAPAN);
        assertEquals("MicroG-RE がエラー「NetworkError」を返しました。",
                LinimalText.format("MicroG-RE がエラー「%s」を返しました。", LinimalText.t("NetworkError")));
    }

    @Test
    public void joinsSentencesWithTheLanguagePunctuation() {
        LinimalText.setLocaleForTesting(Locale.JAPAN);
        assertEquals("広告。広告の表示を止めます。", LinimalText.joinSentences("広告", "広告の表示を止めます。"));
        LinimalText.setLocaleForTesting(Locale.US);
        assertEquals("Ads. Stop showing ads.", LinimalText.joinSentences("Ads", "Stop showing ads."));
        LinimalText.setLocaleForTesting(Locale.TAIWAN);
        assertEquals("廣告。停止顯示廣告。", LinimalText.joinSentences("廣告", "停止顯示廣告。"));
        LinimalText.setLocaleForTesting(new Locale("th", "TH"));
        assertEquals("โฆษณา หยุดแสดงโฆษณา", LinimalText.joinSentences("โฆษณา", "หยุดแสดงโฆษณา"));
    }
}
