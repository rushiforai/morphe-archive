package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import java.util.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

/** ASR lacks punctuation; an event boundary still needs positive evidence before being erased. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,manifest=Config.NONE)
public class AutomaticPageBoundaryTest {
    @Test
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aFittingFirstPointDoesNotLeaveItsLeadWithAnOverflowingHeading() {
        String text = "接下来我们依次说明三个方面：首先，设备的实际使用成本往往高于最初公布的采购价格，原因并不是任何项目隐瞒，而是不同地区统计的服务范围和维护周期存在差别。";
        CaptionRenderSpec spec = CaptionLanguageContext.explicit("en", "zh-Hans").renderSpec;
        CaptionPresentationBudget geometry = new CaptionPresentationBudget(2025, 48, 60.717945f, spec);
        int pointEnd = text.indexOf("，", text.indexOf("首先，") + 3) + 1;
        String point = text.substring(text.indexOf("首先，"), pointEnd);
        assertFalse("exercise overflowing packing, not the fitting-text balance path",
                spec.fits(text, geometry.preferredPx, geometry.width, 2));
        assertTrue(spec.fits(point, geometry.preferredPx, geometry.width, 1));
        assertTrue(spec.fits(text.substring(0, pointEnd), geometry.preferredPx, geometry.width, 2));
        List<CaptionDisplayPage> pages = TranslationPresentation.pages(text, 1000, 13000, geometry, spec);
        assertFalse(pages.isEmpty());
        for (CaptionDisplayPage page : pages)
            assertFalse("keep the available first point with its lead", page.text.endsWith("首先，"));
        assertEquals(1000, pages.get(0).start);
        assertEquals(13000, pages.get(pages.size() - 1).end);
    }

    @Test public void independentLongEventsDoNotMergeJustBecauseTheyOmitFullStops() {
        RebuildSource source=RebuildContractTest.source(
                "The annual report is finished now essentially we will inspect the accounts and explain the new budget",500);
        RebuildProtocol.Event first=new RebuildProtocol.Event(0,5,0,3000,"这份年度报告已经完成");
        RebuildProtocol.Event next=new RebuildProtocol.Event(6,17,3000,9000,"接下来，我们会逐项核对账户并说明新的预算安排");
        List<RebuildDisplayGroups.Unit> units=RebuildDisplayGroups.partition(0,Arrays.asList(first,next),source,
                CaptionLanguageContext.explicit("en","zh-Hans"),v->true,null);
        assertEquals("these are readable events, not sub-second fragments",2,units.size());
        assertEquals(first.text,units.get(0).text);assertEquals(next.text,units.get(1).text);
        assertEquals(3000,units.get(1).start);
    }

    @Test public void aLaterCommaDoesNotEraseEarlierEventJoins() {
        String a="这份年度报告详细记录了全部采购项目";
        String b="完整的数据与原始记录已经整理归档";
        String c="接下来，我们逐项说明新的预算安排";
        List<RebuildPageLayout.Page> pages=RebuildPageLayout.unitPages(a+"\u200b"+b+"\u200b"+c,0,15000,
                v->v.length()<=18,v->v.length()<=36,CaptionRenderSpec.LEGACY);
        assertEquals(3,pages.size());
        assertEquals(a+"\u200b",pages.get(0).text);
        assertEquals(b+"\u200b",pages.get(1).text);
        assertEquals(c,pages.get(2).text);
    }

    @Test public void aBalancedPageMustNotBorrowTheNextClausesIntroduction() {
        String text="以下内容主要分为四个部分：首先，年度预算实际上比原先公布的规模更大，并非因为项目隐瞒，而是因为统计的范围和规则不同";
        List<RebuildPageLayout.Page> pages=RebuildPageLayout.unitPages(text,0,10800,
                v->v.length()<=33,v->v.length()<=66,CaptionRenderSpec.LEGACY);
        assertNotNull(pages);
        for(RebuildPageLayout.Page p:pages)
            assertFalse("a lead-in belongs with the content it introduces: "+p.text,p.text.endsWith("首先，"));
    }

    @Test public void anEventJoinInsideAQuotationDoesNotBecomeACut() {
        String text="这一段先介绍报告，随后引用“年度预算\u200b已经公布，所有明细均可查询”，最后说明下一步工作安排。";
        List<RebuildPageLayout.Page> pages=RebuildPageLayout.unitPages(text,0,14000,
                v->v.length()<=18,v->v.length()<=36,CaptionRenderSpec.LEGACY);
        CaptionClauses clauses=CaptionClauses.of(text);int offset=0;
        for(RebuildPageLayout.Page p:pages) {
            offset+=p.text.length();assertFalse("a quote must stay intact when it fits",clauses.insideQuoted(offset));
        }
        assertEquals(text.length(),offset);
    }

    @Test public void readableTwoSecondClausesCanTurnBeforeALongFittingPageEnds() {
        String first="这份年度报告已经公布，";
        String text=first+"所有明细与原始记录现在均可在线查询并且会在后续工作中持续更新。";
        for(long duration:new long[]{7600,8000,8400}) {
            List<RebuildPageLayout.Page> pages=RebuildPageLayout.unitPages(text,0,duration,
                    v->v.length()<=22,v->v.length()<=44,CaptionRenderSpec.LEGACY);
            assertEquals("both complete clauses are readable; fitting two lines is not a reason to hold for eight seconds",2,pages.size());
            assertEquals(first,pages.get(0).text);
            assertEquals(text,pages.get(0).text+pages.get(1).text);
            assertEquals(0,pages.get(0).start);assertEquals(duration,pages.get(1).end);
            assertEquals(pages.get(0).end,pages.get(1).start);
            for(RebuildPageLayout.Page page:pages)
                assertTrue("the existing minimum still prevents flashing pages",page.end-page.start>=1200);
        }
    }

    @Test public void optionalTimePagingKeepsAnExistingListAndDoesNotIsolateABareLead() {
        String first="各地团队已经完成全部设备的采购、";
        String second="研发部门也已经提交完整的年度测试记录、";
        String last="后续工作将继续按照原定计划推进。";
        List<RebuildPageLayout.Page> list=RebuildPageLayout.unitPages(first+second+last,0,16000,
                v->v.length()<=33,v->v.length()<=66,CaptionRenderSpec.LEGACY);
        assertEquals(3,list.size());
        assertEquals(first,list.get(0).text);assertEquals(second,list.get(1).text);
        assertEquals(last,list.get(2).text);
        String lead="而不是像美国等国家那样，我要问的问题是，";
        List<RebuildPageLayout.Page> pages=RebuildPageLayout.unitPages(lead,0,3932,
                v->v.length()<=33,v->v.length()<=66,CaptionRenderSpec.LEGACY);
        assertEquals("a bare introduction is not useful as a separate timed page",1,pages.size());
        assertEquals(lead,pages.get(0).text);
    }
}
