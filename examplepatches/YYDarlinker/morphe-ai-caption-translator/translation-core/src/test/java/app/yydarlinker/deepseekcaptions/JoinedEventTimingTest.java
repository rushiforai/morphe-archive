package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import java.util.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk=28,manifest=Config.NONE)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class JoinedEventTimingTest {
    @Test public void finalWidthPaginationKeepsTheOriginalEventSeam() {
        String first="第一项工程已经按照约定完成，", second="后续团队也已提交详细的年度测试记录。";
        String text=first+second;
        CaptionRenderSpec spec=CaptionRenderSpec.LEGACY;
        CaptionPresentationBudget geometry=new CaptionPresentationBudget(1322,48,60,spec);
        CaptionEventTimeline timeline=new CaptionEventTimeline(new int[]{0,first.length(),text.length()},
                new long[]{0,9000},new long[]{9000,10000},null);
        List<CaptionDisplayPage> pages=TranslationPresentation.pages(text,0,10000,geometry,spec,timeline);
        assertEquals(2,pages.size()); assertEquals(first,pages.get(0).linePlan.displayText);
        assertEquals(9000,pages.get(0).end); assertEquals(9000,pages.get(1).start);
        assertEquals(10000,pages.get(1).end);
        assertEquals("ESTIMATED_EVENT_TIMING",pages.get(1).timingBasis);
        assertNotEquals(9000,TranslationPresentation.pages(text,0,10000,geometry,spec).get(1).start);
    }
    @Test public void mappingIsImmutableAndUsesOnlyItsOwnEventWindow() {
        int[] offsets={0,4,10};long[] starts={100,9200},ends={9000,10200},pauses={4000};
        CaptionEventTimeline t=new CaptionEventTimeline(offsets,starts,ends,pauses);
        offsets[1]=1;starts[1]=200;ends[0]=500;pauses[0]=900;
        assertEquals(9200,t.at("甲乙丙丁戊己庚辛壬癸",4,CaptionRenderSpec.LEGACY));
        long inside=t.at("甲乙丙丁戊己庚辛壬癸",6,CaptionRenderSpec.LEGACY);
        assertTrue(inside>9200&&inside<10200);
        assertArrayEquals(new long[]{4000},t.pauses());t.pauses()[0]=0;
        assertArrayEquals(new long[]{4000},t.pauses());
    }
}
