package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.graphics.Rect;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={RebuildLayoutTest.Geometry.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@LooperMode(LooperMode.Mode.PAUSED)
public class N28CR1PagerTest {
 N28CGeometryTest h;
 @Before public void setup(){h=new N28CGeometryTest();h.setup();}
 @After public void cleanup(){h.cleanup();}
 CaptionRenderSpec spec(){return h.spec("en");}
 List<RebuildPageLayout.Page> plan(String text,long duration,int width){return RebuildPageLayout.plan(text,100,100+duration,new CaptionOverlay.LayoutBudget(width,32,32,spec()),spec());}
 @Test public void completeShortWindowsAndTwoLineEventPreferOnePage() {
  String text="Model J-20 (12) remains visible with every complete word.";
  for(long duration:new long[]{600,700,1000,2400}) {
   List<RebuildPageLayout.Page> pages=plan(text,duration,540);assertEquals(1,pages.size());
   assertEquals(text,pages.get(0).text);assertEquals(100,pages.get(0).start);assertEquals(100+duration,pages.get(0).end);
  }
 }
 @Test public void previouslyAccepted421And579AreOneComplete1000MillisecondPage() throws Exception {
  String text="Model J-20 (12) remains visible with every complete word.";
  DeepSeekConfig.saveCaptionSizeTier(h.h.a,0);h.show(text,"en",1000);assertEquals(1,h.pages().size());h.validate(text,"en",100,1100,h.pages());
 }
 @Test public void previouslyAccepted283MillisecondWindowIsCompleteOrSafelyBlankNeverSplit() {
  String text="This complete caption is readable and keeps all of its original words.";
  List<RebuildPageLayout.Page> pages=plan(text,283,540);assertEquals(1,pages.size());assertEquals(text,pages.get(0).text);assertEquals(283,pages.get(0).end-pages.get(0).start);
 }
 @Test public void actualKorean283Plus2117SampleNowUsesFull2400Window() throws Exception {
  String text="완전한 자막 표시를 확인합니다.";
  h.show(text,"ko",2400);assertEquals(1,h.pages().size());
  assertEquals(text,h.pages().get(0).text);assertEquals(2400,h.pages().get(0).end-h.pages().get(0).start);
  h.validate(text,"ko",100,2500,h.pages());
 }
 @Test public void allMultipageDurationsHaveInteger1200BaseAndExactTail() {
  String text=String.join(" ",Collections.nCopies(8,"Complete caption"));
  for(long duration:new long[]{2400,3601,7207,10003}) {
   List<RebuildPageLayout.Page> pages=plan(text,duration,180);
   if(pages.isEmpty())continue;
   assertTrue(pages.size()>1);StringBuilder joined=new StringBuilder();long at=100;
   for(RebuildPageLayout.Page page:pages){assertEquals(at,page.start);assertTrue(page.end-page.start>=1200);assertTrue(spec().fits(page.text,32,180,2));at=page.end;joined.append(page.text);}
   assertEquals(100+duration,at);assertEquals(text,joined.toString());
  }
  assertTrue(plan(text,10003,180).size()>1);
 }
 @Test public void insufficientHardCapacityIsBlankNotFlashingOrBorrowingTime() throws Exception {
  RebuildLayoutTest.bounds=new Rect(0,0,300,400);
  String text="Donaudampfschifffahrtsgesellschaftskapitän";
  for(long duration:new long[]{600,700,1000}) {h.show(text,"de",duration);assertTrue(h.pages().isEmpty());assertEquals("",h.view().getText().toString());}
  assertTrue(CaptionDiagnostics.fullText(h.h.a).contains("page_time_capacity_unresolved"));
 }
 @Test public void noLegalCutOverSevenSecondsRetainsFeasibleFullPageAndWatch() throws Exception {
  String text="one\u00a0two\u00a0three\u00a0four";
  List<RebuildPageLayout.Page> pages=plan(text,9000,1000);assertEquals(1,pages.size());assertEquals(text,pages.get(0).text);assertTrue(spec().watches(text,9000,32,1000).contains("page_duration"));
 }
 @Test public void highCpsShortFullTextStaysVisibleAndNeverRequestsRepair() throws Exception {
  String text="Model J-20 (12) remains visible with every complete word.";
  DeepSeekConfig.saveCaptionSizeTier(h.h.a,0);h.show(text,"en",600);assertEquals(1,h.pages().size());assertEquals(text,h.view().getText().toString());
  String log=CaptionDiagnostics.fullText(h.h.a);assertTrue(log.contains("watch=reading_speed"));assertTrue(log.contains("repair_candidate=false"));
 }
 @Test public void longWordAndNbspCrLfUseOnlyLegalCompleteGraphemeSeams() {
  String text="Donaudampfschifffahrtsgesellschaftskapitän one\u00a0two\r\nthree four";
  List<RebuildPageLayout.Page> pages=plan(text,20000,180);assertTrue(pages.size()>1);StringBuilder joined=new StringBuilder();
  int[] cuts=CaptionUnicode.characterBoundaries(text,spec().locale);int at=0;
  for(RebuildPageLayout.Page page:pages){assertTrue(page.end-page.start>=1200);assertTrue(Arrays.binarySearch(cuts,at)>=0);at+=page.text.length();assertTrue(Arrays.binarySearch(cuts,at)>=0);assertFalse(page.text.startsWith("\n"));assertFalse(page.text.endsWith("\r"));assertFalse(page.text.startsWith("\u00a0"));assertFalse(page.text.endsWith("\u00a0"));joined.append(page.text);}
  assertEquals(text,joined.toString());
 }
 @Test public void hardGlyphGeometryRemainsSeparateFromTimeCapacity() {
  CaptionOverlay.LayoutBudget b=new CaptionOverlay.LayoutBudget(1,32,32,spec());
  assertEquals("hard_geometry_unresolved",CaptionLanguagePager.failureReason("caption",b,spec()));
  assertTrue(RebuildPageLayout.plan("caption",0,1000,b,spec()).isEmpty());
 }
}

