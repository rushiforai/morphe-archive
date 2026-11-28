package app.yydarlinker.aicaptions;

import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class TranslationPaginationContractTest {
    @Test public void EnglishPaginationKeepsTheCanonicalWordsAndPunctuation() {
        assertPages("en", "A first sentence with all the evidence. A second clause follows, and another sentence ends here. ");
    }

    @Test public void FrenchPaginationKeepsAccentsAndNonbreakingSpace() {
        assertPages("fr", "Le café est fermé\u00a0! Ensuite, nous vérifions les horaires de la bibliothèque. ");
    }

    @Test public void JapanesePaginationKeepsCompactScriptAndLatinNumbers() {
        assertPages("ja", "この列車は午後3時に出発します。次の駅で乗り換えてください。API 3.5の変更も確認しました。");
    }

    @Test public void KoreanPaginationMaintainsWordSpacing() {
        assertPages("ko", "다음 정류장에서 버스를 내리고 역까지 걸어가세요. 도착하면 바로 전화해 주세요. ");
    }

    @Test public void ArabicPaginationKeepsLogicalTextOrderWithLatinNumbers() {
        assertPages("ar", "في 2026 العدد 42 و API 3.5! تستمر الترجمة إلى نهاية الجملة التالية. ");
    }

    @Test public void HebrewPaginationKeepsMixedScriptAndNumbers() {
        assertPages("he", "הגרסה API 3.5 זמינה כעת. נסיים את הבדיקה בשעה 14:30. ");
    }

    @Test public void IndicPaginationKeepsConjunctsAndCombiningMarks() {
        assertPages("hi", "कृपया क्षत्रिय शब्द और ये सभी अक्षर पढ़ें। अगला वाक्य इसी समय शुरू होगा। ");
    }

    @Test public void ChinesePaginationKeepsCompositeEmojiAndCombiningMarks() {
        assertPages("zh-Hans", "请检查字幕👩🏽‍💻、e\u0301 和标点。后面的文字在另一页继续，完整显示。");
    }

    @Test public void emptyOrReversedEventCannotCreateAnOverlayPage() {
        CaptionRenderSpec spec = CaptionLanguageContext.explicit("en", "fr").renderSpec;
        var budget = new CaptionPresentationBudget(240, 22, 30, spec);
        assertTrue(TranslationPresentation.pages("", 100, 500, budget, spec).isEmpty());
        assertTrue(TranslationPresentation.pages("Bonjour", 500, 100, budget, spec).isEmpty());
    }

    static void assertPages(String language, String sample) {
        CaptionRenderSpec spec = CaptionLanguageContext.explicit("en", language).renderSpec;
        String text = sample.repeat(3).trim();
        var budget = new CaptionPresentationBudget(360, 23, 30, spec);
        List<CaptionDisplayPage> pages = TranslationPresentation.pages(text, 1000, 61_000, budget, spec);
        assertTrue(language + " must paginate " + pages.size(), pages.size() > 1);
        int[] graphemes = CaptionUnicode.characterBoundaries(text, java.util.Locale.forLanguageTag(language));
        long time = 1000;
        int offset = 0;
        for (CaptionDisplayPage page : pages) {
            assertEquals(time, page.start);
            assertTrue(page.end > page.start);
            assertEquals(offset, page.fromUtf16);
            assertTrue(Arrays.binarySearch(graphemes, page.toUtf16) >= 0);
            String canonical = text.substring(offset, page.toUtf16);
            assertEquals(canonical, page.text.replace("\n", ""));
            assertTrue(page.text.chars().filter(ch -> ch == 10).count() <= 1);
            time = page.end;
            offset = page.toUtf16;
        }
        assertEquals(text.length(), offset);
        assertEquals(61_000, time);
    }
}

