package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

/** Overflow must retain word boundaries when each word fits the measured box. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class SpacedScriptOverflowTest {
    @Test
    public void longClausesKeepWordsWholeWithoutFlashingTails() {
        String[][] cases = {
            {"en", "If maintenance costs continue to rise, we must first reduce the scale of procurement rather than lower the maintenance standards for existing equipment."},
            {"de", "Wenn die Wartungskosten weiter steigen, müssen wir zuerst den Umfang der Beschaffung reduzieren statt die Wartungsstandards für vorhandene Geräte zu senken."},
            {"ar", "إذا استمرت تكاليف الصيانة في الارتفاع، فيجب علينا تقليل حجم المشتريات بدلاً من خفض معايير صيانة المعدات الموجودة."},
            {"ko", "유지 비용이 계속 증가한다면, 기존 장비의 유지 기준을 낮추는 대신 먼저 새로운 장비를 구매하는 규모를 줄여야 합니다."}
        };
        for (String[] example : cases) {
            CaptionRenderSpec spec = CaptionLanguageContext.explicit("en", example[0]).renderSpec;
            for (int width : new int[] {770, 1121, 1322}) {
                for (String word : example[1].split("\\s+"))
                    assertTrue("Each fixture word must fit", spec.fits(word, 60.717945f, width, 2));
                CaptionPresentationBudget geometry =
                        new CaptionPresentationBudget(width, 48, 60.717945f, spec);
                List<CaptionDisplayPage> pages =
                        TranslationPresentation.pages(example[1], 1000, 25000, geometry, spec);
                int offset = 0;
                long time = 1000;
                int[] boundaries = CaptionUnicode.wordBoundaries(example[1], spec.locale);
                for (CaptionDisplayPage page : pages) {
                    assertEquals(offset, page.fromUtf16);
                    assertEquals(time, page.start);
                    assertTrue("Flash tail in " + example[0], page.end - page.start >= 1200);
                    assertTrue(
                            "Word split in " + example[0] + " at " + page.toUtf16,
                            Arrays.binarySearch(boundaries, page.toUtf16) >= 0);
                    offset = page.toUtf16;
                    time = page.end;
                }
                assertEquals(example[1].length(), offset);
                assertEquals(25000, time);
            }
        }
    }

    @Test
    public void oversizedUnbrokenIdentifierStillRendersCompletely() {
        String text = "buildidentifier".repeat(30);
        CaptionRenderSpec spec = CaptionLanguageContext.explicit("en", "en").renderSpec;
        CaptionPresentationBudget geometry = new CaptionPresentationBudget(770, 48, 60.717945f, spec);
        List<CaptionDisplayPage> pages = TranslationPresentation.pages(text, 1000, 25000, geometry, spec);
        assertFalse(pages.isEmpty());
        int offset = 0;
        for (CaptionDisplayPage page : pages) {
            assertEquals(offset, page.fromUtf16);
            assertTrue(page.end > page.start);
            offset = page.toUtf16;
        }
        assertEquals(text.length(), offset);
    }
}
