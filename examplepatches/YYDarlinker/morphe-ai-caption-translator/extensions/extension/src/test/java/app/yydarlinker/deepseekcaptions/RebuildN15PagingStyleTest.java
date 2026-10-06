package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import java.util.List;
import java.util.function.Predicate;
import org.junit.Test;

/** Hard paging gates and semantic cut candidates, independent of source events. */
public class RebuildN15PagingStyleTest {
  private static Predicate<String> capacity(int count) {
    return s -> s.codePointCount(0,s.length())<=count;
  }

  @Test public void nonPunctuationCutsOnlyRescueAnOtherwiseUnpageableEvent() {
    String unbroken=String.join("",java.util.Collections.nCopies(44,"字"));
    List<RebuildPageLayout.Page> rescued=RebuildPageLayout.plan(unbroken,1000,13000,
        capacity(30),capacity(15));
    assertTrue(rescued.size()>1);
    assertEquals(unbroken,rescued.stream().map(p->p.text).reduce("",String::concat));
    for(RebuildPageLayout.Page page:rescued)
      assertTrue(RebuildPageLayout.displayHalfCells(page.text)>=16);
    String finished=unbroken+"。";
    assertFalse(RebuildPageLayout.plan(finished,1000,13000,
        capacity(30),capacity(15)).isEmpty());
  }

  @Test public void diagnosticOrphanPagesUseCjkDisplayCells() {
    String longEvent="的印象，远不如对中国白手起家建立航母编队、除美国外率先列装五代机、并在过去二十年间全面现代化其军事能力";
    String dated="到了2017年，部署在中国大陆的防空导弹就能覆盖台湾本岛";
    assertEquals(12,RebuildPageLayout.displayHalfCells("到了2017年，"));
    for (String value:new String[]{longEvent,dated}) {
      long end=value==longEvent?99736:131280;
      long start=value==longEvent?84110:125559;
      List<RebuildPageLayout.Page> pages=RebuildPageLayout.plan(value,start,end,
          capacity(48),capacity(25));
      assertFalse(pages.isEmpty());
      assertEquals(value,pages.stream().map(p->p.text).reduce("",String::concat));
      for (RebuildPageLayout.Page page:pages) {
        assertTrue("no short page",RebuildPageLayout.displayHalfCells(page.text)>=16);
        assertTrue("two-line capacity",capacity(48).test(page.text));
        assertTrue("time",page.end-page.start>=1200);
        assertTrue("cps",page.text.codePointCount(0,page.text.length())*1000L
            <=8*(page.end-page.start));
      }
    }
  }

  @Test public void softCpsCannotBlankAnEntireFittingOwnedPage() {
    assertEquals(1,RebuildPageLayout.plan("预算会继续不断增加。",1000,2000,
        capacity(100),capacity(100)).size());
    assertEquals(1,RebuildPageLayout.plan("每段都需要真实时间，不能借用下一段。",0,2000,
        capacity(100),capacity(100)).size());
  }

  @Test public void onlyAnEntireShortWindowMayKeepItsOriginalSub1200Duration() {
    List<RebuildPageLayout.Page> shortWindow=RebuildPageLayout.plan("短句。",500,1386,
        capacity(20),capacity(10));
    assertEquals(1,shortWindow.size());
    assertEquals(500,shortWindow.get(0).start);
    assertEquals(1386,shortWindow.get(0).end);
    assertEquals(1,RebuildPageLayout.plan("字字字字字字字字",500,1386,
        capacity(20),capacity(20)).size());
  }

  @Test public void derivedWindowCapAllowsMoreThanThreeButNotBeyondAvailableSlots() {
    String text="第一段文字完整，第二段文字完整，第三段文字完整，第四段文字完整，第五段文字完整。";
    List<RebuildPageLayout.Page> pages=RebuildPageLayout.plan(text,1000,9000,
        capacity(12),capacity(11));
    assertTrue(pages.size()>3);
    assertTrue(pages.size()<=8000/1200);
    long at=1000;
    StringBuilder rebuilt=new StringBuilder();
    for(RebuildPageLayout.Page page:pages) {
      assertEquals(at,page.start);
      assertTrue(page.end-page.start>=1200);
      assertTrue(page.text.codePointCount(0,page.text.length())*1000L
          <=8*(page.end-page.start));
      rebuilt.append(page.text);at=page.end;
    }
    assertEquals(9000,at);
    assertEquals(text,rebuilt.toString());
  }

  @Test public void shortDiscourseLeadsDoNotBecomeIsolatedWhenTwoLinesWork() {
    String text="最后，因为中国将预算中更大比例用于新装备和现代化，而非用于维护现有系统。";
    List<RebuildPageLayout.Page> pages=RebuildPageLayout.plan(text,0,11000,
        capacity(30),capacity(23));
    assertTrue(pages.size()>1);
    assertNotEquals("do not make a three-character introductory page",
        "最后，",pages.get(0).text);
    assertEquals(text,pages.stream().map(p->p.text).reduce("",String::concat));
  }
  @Test public void decimalCommasAndLeadingPunctuationNeverCrashOrBecomeCuts() {
    String text="预算为1,000亿元，其他开支也计入，整体额度有所增加。";
    List<RebuildPageLayout.Page> pages=RebuildPageLayout.plan(text,0,10000,
        capacity(24),capacity(17));
    assertFalse(pages.isEmpty());
    for(int i=0;i<pages.size()-1;i++)
      assertFalse("numeric comma is not a clause seam",pages.get(i).text.endsWith("1,"));
    assertEquals(1,RebuildPageLayout.plan(",短句。",0,1600,
        capacity(20),capacity(20)).size());
  }

  @Test public void closingQuoteAndSpacesStayWithThePreviousClause() {
    String text="他说：“故事已经结束。” 然后我们回家，今天就到这里。";
    List<RebuildPageLayout.Page> pages=RebuildPageLayout.plan(text,0,8500,
        capacity(26),capacity(19));
    assertTrue(pages.size()>1);
    assertEquals(text,pages.stream().map(p->p.text).reduce("",String::concat));
    for(int i=0;i<pages.size()-1;i++)
      assertFalse("do not put a closing quote on the next page",pages.get(i+1).text.startsWith("”"));
  }
}
